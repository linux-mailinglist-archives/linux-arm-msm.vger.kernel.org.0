Return-Path: <linux-arm-msm+bounces-85186-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA91CBCA08
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 07:35:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B6D44300F9E4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 06:35:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4ABE2ED860;
	Mon, 15 Dec 2025 06:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OKI66DoG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76CD1448E0;
	Mon, 15 Dec 2025 06:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765780528; cv=none; b=HRiT4MyEVLyngrs3p7sUVVCu56TDaWZmQtwesKqEPLss4zCxMqL86KSbc6v7xTw/WY156eC4O5V7uiSv1dxtTQC3NDzQ/fKeptTzC+MQ5aI7BUIXj1YznkxRRgD3O9PH3H+CdnLYkssumGo7yGBOkePikF3LBlmZAFKvpztmN8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765780528; c=relaxed/simple;
	bh=VnwpWxR/8+nShFX5zfIEPvBeQMXdJgHrpvPMXyO7f/o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rXk1ugwcS83NKm/l8rJFcMmUchJKuYL+4SJMu1WcuxN9WXiHYiggsJwZGaqiaYqSWdlvCcApj4X0Zqzlj7AFo7DpXVbH4E1hix55u1r3fT+WbJgl6jFmNbv3WGHMOurJzbRvN64HRhcpgyq8kRPOQayHbDYd2EtldErEWi/QoIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OKI66DoG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7697BC2BC87;
	Mon, 15 Dec 2025 06:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765780528;
	bh=VnwpWxR/8+nShFX5zfIEPvBeQMXdJgHrpvPMXyO7f/o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=OKI66DoGBTmFAoRAImFSwNjDYMtMm2teSmOIuISJCkZLXhooCZh//pYtzMcOojhF6
	 HJ7tVkq2669oofn2shaiXdHcIFI3J3e2dmmh8nM2HR3nOH0BzBb50lJmHPvLkENS3q
	 +GJQ3KPkXLBXS/q1IJGERskhkAP+FKpJlz/8R7+K4TqBawJhnnz+NxYJueSzQCcqvg
	 PKxImsKwvJXcBCV+/cyCEMbsSs4nsrX587SoAcm99+ktcvMB3ZwfDbuKj9J+BYmY4r
	 zElOCa5gLzKkpNMPTprbRdQ9Jcg4+hRIqr++0TOnXD0s9bcjpKl8Yshh5xiqgSiUVf
	 QPuiL7Ok8DGWg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 711DCD5B16F;
	Mon, 15 Dec 2025 06:35:28 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Mon, 15 Dec 2025 10:35:09 +0400
Subject: [PATCH v7 4/8] mailbox: qcom: fix IPC register offset for IPQ5424
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251215-ipq5018-wifi-v7-4-ec4adba941b5@outlook.com>
References: <20251215-ipq5018-wifi-v7-0-ec4adba941b5@outlook.com>
In-Reply-To: <20251215-ipq5018-wifi-v7-0-ec4adba941b5@outlook.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765780526; l=1407;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=bQie0gh5+yB2rgVd9SAgk+hMuExkZX7LZ4wgufEEF9I=;
 b=ejBjz1LnFrBL/mN4ZXwRdohWziR6hrBgFOzVNjlMYOPl3t3qhEz31c6JPnxymw5zM8PgRY6+P
 dvXEaL+YUfHDWVkNsPgJFw+gE37Bea24ptnDnd7MjIVPqKR6KcHwSwU
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



