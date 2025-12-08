Return-Path: <linux-arm-msm+bounces-84661-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8161ACAD1E4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Dec 2025 13:26:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C5115301FF35
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Dec 2025 12:26:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29C553101A6;
	Mon,  8 Dec 2025 12:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="piWE9jpr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E83A02DF3C6;
	Mon,  8 Dec 2025 12:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765196776; cv=none; b=RN7md75+TQZlCd9roio/mrZT46zUDNP1bqSWaWRZc6uFA0Sm1oEAos0g605YOrx5ZcZ2moWGyE1kmMvhve2gpRLU59mTMkh2TV6+pJ2MygJOmy9nGvmSg65FnUg/7miLMgZKKXUuKLMlNS2rC6NfEpy2tGHLzNlvdmcok0blfRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765196776; c=relaxed/simple;
	bh=VnwpWxR/8+nShFX5zfIEPvBeQMXdJgHrpvPMXyO7f/o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ev8XCEVCJ40HpNtpFtQgpx3yZiQWTJVFG/2Hnn6hVnY5MBAQaG/Gha8WUx2MWJ3a+ua/1LHaQIFc9lOit5zsPFMWIK2srwxGirE1Jwmj+ko54sr7OsfTx0Jx6gfF2IZdgUo/U7mpdPsGJXJPcWt8UUVLyy3hEAjnbSgR8EKS9f4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=piWE9jpr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 91317C2BCB0;
	Mon,  8 Dec 2025 12:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765196775;
	bh=VnwpWxR/8+nShFX5zfIEPvBeQMXdJgHrpvPMXyO7f/o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=piWE9jprgi+fIPy8Vo24aEXmkVcFWZg1vEB8eDRy3qHGbyaP9/Qq5FlMOtyKPeS1/
	 D8E+eYyHANiv7lt6n9FJZoLd/BreVqx5xEI+EHEiTEKOcq7tyVyRTOX3gmszrXjgG/
	 n0U++LTtshiEeFuUZX+zZPfFYdnwFLTOLlaknz67GHQsFmeMcBv2OZqP+F16q1XOqc
	 6DlDwLGhTaaOHfvBBcF1DAFdaReQas7ohbiPFwMtp63139950hlK3pqWd+QMoXyLic
	 2NCbalncTmpZTMgHy6oiDRSoqezSNgHFo38byOtD6Ghn4bm7drFUoAyFu6z3Vu/qgM
	 1g8PjhOc2gq9w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 862DED3B7EE;
	Mon,  8 Dec 2025 12:26:15 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Mon, 08 Dec 2025 16:25:36 +0400
Subject: [PATCH v6 4/8] mailbox: qcom: fix IPC register offset for IPQ5424
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251208-ipq5018-wifi-v6-4-d0ce2facaa5f@outlook.com>
References: <20251208-ipq5018-wifi-v6-0-d0ce2facaa5f@outlook.com>
In-Reply-To: <20251208-ipq5018-wifi-v6-0-d0ce2facaa5f@outlook.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Manikanta Mylavarapu <quic_mmanikan@quicinc.com>, 
 Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 George Moussalem <george.moussalem@outlook.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765196772; l=1407;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=bQie0gh5+yB2rgVd9SAgk+hMuExkZX7LZ4wgufEEF9I=;
 b=JkUtwJghOWCoEUys3YdKv5xOJ7xnlN7fbmP7xkN6DpeOtJfyWr1ZqQN6pGZPBVJWyG39y1WFE
 AMGDx7pa+usCKZ45E/6S27LGUrAZK+aAoy6sqX2/85ie7VxJCIocHit
X-Developer-Key: i=george.moussalem@outlook.com; a=ed25519;
 pk=/PuRTSI9iYiHwcc6Nrde8qF4ZDhJBlUgpHdhsIjnqIk=
X-Endpoint-Received: by B4 Relay for george.moussalem@outlook.com/20250321
 with auth_id=364
X-Original-From: George Moussalem <george.moussalem@outlook.com>
Reply-To: george.moussalem@outlook.com

From: George Moussalem <george.moussalem@outlook.com>

The IPC register in IPQ5424 is at offset 0xc instead of 0x8 as defined
in driver data for msm8994. As such, switch to the existing
apps_shared_apcs_data driver data which has offset set to 0xc.

Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
 drivers/mailbox/qcom-apcs-ipc-mailbox.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
index d3a8f6b4a03b368821ef9a5b24fee78037104610..258b03307869b244e053e7a355531268114906df 100644
--- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
+++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
@@ -164,7 +164,7 @@ static const struct of_device_id qcom_apcs_ipc_of_match[] = {
 	{ .compatible = "qcom,sm6125-apcs-hmss-global", .data = &msm8994_apcs_data },
 	{ .compatible = "qcom,sm6115-apcs-hmss-global", .data = &msm8994_apcs_data },
 	{ .compatible = "qcom,ipq5332-apcs-apps-global", .data = &ipq6018_apcs_data },
-	{ .compatible = "qcom,ipq5424-apcs-apps-global", .data = &msm8994_apcs_data },
+	{ .compatible = "qcom,ipq5424-apcs-apps-global", .data = &apps_shared_apcs_data },
 	{ .compatible = "qcom,ipq8074-apcs-apps-global", .data = &ipq6018_apcs_data },
 	{ .compatible = "qcom,sc7180-apss-shared", .data = &apps_shared_apcs_data },
 	{ .compatible = "qcom,sc8180x-apss-shared", .data = &apps_shared_apcs_data },

-- 
2.52.0



