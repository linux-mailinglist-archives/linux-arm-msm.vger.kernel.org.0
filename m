Return-Path: <linux-arm-msm+bounces-36075-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC0C9B1DBF
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Oct 2024 14:02:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 59091B2104D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Oct 2024 13:02:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB9031547CC;
	Sun, 27 Oct 2024 13:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iFGsyqsG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FBC22BB1B;
	Sun, 27 Oct 2024 13:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730034141; cv=none; b=upEMLIyoidJGuqy/B9XM3qLARtG+lCwFSJc9gefkmHQ8Do2VJvzziufA16K81VZRgxkRDnh3ijj6hxFgB28nV1YRiUOYxyMVUZArYoikvwFV33BSGheJD1pnHM6K2LcRXcDe7/Bg+hONG6aV+1+eP97616dX/f9lGraLXy8RLVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730034141; c=relaxed/simple;
	bh=kCfyUhNHR9D7tvw5ITY07k1JaopSNx68HTUtT4Le+jU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KKtvrzLth6FJUjP0t3WZ4ns+KdR7lywvvZkDSPo3g7L0oyjMdHFw4a0nZR3kR/LDYmS6/Shj/FdTKx5BCP+xrfyzPujjaxxMFzJ4wzBeIJj3gubFZQRATAhzRlUjAYmQuB8hRwQAo+UkQXV1L8XRQvEZcwxII1eMq/PuZZOF5yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iFGsyqsG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3013BC4CEE5;
	Sun, 27 Oct 2024 13:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730034141;
	bh=kCfyUhNHR9D7tvw5ITY07k1JaopSNx68HTUtT4Le+jU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=iFGsyqsGy3uslulhzWir67y45QVLQqLbOggeT4PezDN2FKIo5ChQBN0PoS+zo8hMp
	 7qYKjY7894Ehos/1IYa7GfPjW9CxWlHWd7oBNHLbzcSac5Vwv1XhKk5lGQNlaD2NaP
	 iu/xi5tExNK7I/5gQbzVR0WL2qiGAWvSVcFE1y8EKVXtDP4rrbKmnjXGCMOd39cGgP
	 Re5uv4q50+OEtDPDhcAzklLxyq6PTj2JgbeM9FNSZJmt9VgWt0jPejQscakbtIbC5f
	 Fx+cZhLhpRd2Vz1GN3zlxsplRYgUMpWqjqQMa1RKpwBRd59KqZJUy7WblkTm1ifxYn
	 KNJVDr6CO4eiQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 215A8D149E9;
	Sun, 27 Oct 2024 13:02:21 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Sun, 27 Oct 2024 14:02:17 +0100
Subject: [PATCH v4 2/3] firmware: qcom: scm: Allow QSEECOM for Windows Dev
 Kit 2023
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241027-jg-blackrock-for-upstream-v4-2-703b254fc95f@oldschoolsolutions.biz>
References: <20241027-jg-blackrock-for-upstream-v4-0-703b254fc95f@oldschoolsolutions.biz>
In-Reply-To: <20241027-jg-blackrock-for-upstream-v4-0-703b254fc95f@oldschoolsolutions.biz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>, 
 Merck Hung <merckhung@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730034139; l=916;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=8pA9VSgmqgAkjVtPY7nnFqV8q/fkJiqZKAYlfJlGts0=;
 b=/6YlBZQHjqT0uOuADsYZEVTWYKdMppjzajo6u7xYATKC+kpX4QZJ268hzge1C8wDE1gB1mNmW
 FrYVC/s8DxsAQpKFvs3XUetvKg+sCjyu1cJohI7OiS83vH9kV7APDzp
X-Developer-Key: i=jens.glathe@oldschoolsolutions.biz; a=ed25519;
 pk=JcRJqJc/y8LsxOlPakALD3juGfOKmFBWtO+GfELMJVg=
X-Endpoint-Received: by B4 Relay for
 jens.glathe@oldschoolsolutions.biz/20240919 with auth_id=216
X-Original-From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Reply-To: jens.glathe@oldschoolsolutions.biz

From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

add "microsoft,blackrock" as compatible device for QSEECOM

This is required to get access to efivars and uefi boot loader support.

Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 4785386042252..f1b10c89b9638 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -1748,6 +1748,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "lenovo,thinkpad-x13s", },
 	{ .compatible = "lenovo,yoga-slim7x" },
 	{ .compatible = "microsoft,arcata", },
+	{ .compatible = "microsoft,blackrock" },
 	{ .compatible = "microsoft,romulus13", },
 	{ .compatible = "microsoft,romulus15", },
 	{ .compatible = "qcom,sc8180x-primus" },

-- 
2.43.0



