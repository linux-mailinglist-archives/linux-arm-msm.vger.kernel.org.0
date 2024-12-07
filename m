Return-Path: <linux-arm-msm+bounces-40854-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D415A9E8036
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Dec 2024 15:04:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7D3C728201A
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Dec 2024 14:04:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 900281DFFB;
	Sat,  7 Dec 2024 14:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FvhtIjkf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A5428F5;
	Sat,  7 Dec 2024 14:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733580274; cv=none; b=QBrGBFWDk9pfKPF5xvqEKXsFRRoBc9uxLNBFgkhtE+xog49oFHj9azkmtEvXdwtSGGx7i1bz9TgyyMCVvHLCPKsfi0qQZLrZOlA1gpEQ0z3pPKGJ9ejxDI2GnwuW/11OqK7+hOooq+8nNYOt8sNQ6RtmXgytOq+1aY+OA1eUXzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733580274; c=relaxed/simple;
	bh=983SQaU9rtEGbsfPFkWj2Mfmr4vVZCxgYGPpaXZg2Qc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=eD584CLhnobmCT7zpxrDYDQ82IRP2rpFxoiJZFzfVT9xi+iBae4Oz8C8Rj0KApRhnW6MEMnC2Y4eooaPHeuf55pA8jsVa7PuvbXqfH8ScP/8fhvRNXUk2kzq9lJlwpz4Fb512NsC7S/zqMem6UY89FPlVkjyAEeJQTrYAkQffXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FvhtIjkf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E526FC4CECD;
	Sat,  7 Dec 2024 14:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733580273;
	bh=983SQaU9rtEGbsfPFkWj2Mfmr4vVZCxgYGPpaXZg2Qc=;
	h=From:Date:Subject:To:Cc:From;
	b=FvhtIjkf4uRHmX5/JQ88pBlmJjzq7SFGNIQlRorP7Ra10BReVqJp7nzkXeREBSATk
	 LfoImvQF2LmE6uZtEd4NqzdzlhcCcxo1k9081tfKoSb52MlASoxTlPegYcQ6bRoLqO
	 2e96Jj7EaFtnBQnQKF8lopR+qkyIWGv5pCwoxA6BShUWlidKU02VbVXXgbamxKUVYi
	 oD1orjZQasqTbm3pwMXVmsYd9p87X2sQWpewV+6ZGZLVvhjQsBnUC8nKHY3p2EkgV+
	 S9+ZksICyoPYPhltNdS00zKm5THIsuryOPu6uSlm34S69P7QGnPBt62GistKgXPk+Y
	 m2FR5TlT84uAQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Sat, 07 Dec 2024 15:04:26 +0100
Subject: [PATCH] soc: qcom: llcc: Enable LLCC_WRCACHE at boot on X1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241207-topic-llcc_x1e_wrcache-v1-1-232e6aff49e4@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAOlVVGcC/x3MQQqAIBBA0avIrBNGi4SuEiExTTUgFhoVRHdPW
 r7F/w9kTsIZOvVA4lOybLHAVApoHePCWqZisGgbY9HpY9uFdAhE/jbsr0QjrazbxqFDtpOpEUq
 8J57l/sf98L4fuoNEv2gAAAA=
X-Change-ID: 20241207-topic-llcc_x1e_wrcache-647070e2d130
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Sibi Sankar <quic_sibis@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733580270; l=948;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=AJDCtKjCaC1zSG6+EVFpuNHfeia13SCSkoBrVHutuog=;
 b=9eltFICYAwn27f+NKH6pDXsDDp/OU3U4q+hMKAJvBLLT5chdv07b/sA/En1c6VcS0PpQmgc8P
 grCiVliSG5SDa+Oe1Z7GuHAqElOPop8MDakScWQ4f3VIWHo4Kv8h4UN
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Do so in accordance with the internal recommendations.

Fixes: b3cf69a43502 ("soc: qcom: llcc: Add configuration data for X1E80100")
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/soc/qcom/llcc-qcom.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
index 32c3bc887cefb87c296e3ba67a730c87fa2fa346..1560db00a01248197e5c2936e785a5ea77f74ad8 100644
--- a/drivers/soc/qcom/llcc-qcom.c
+++ b/drivers/soc/qcom/llcc-qcom.c
@@ -3004,6 +3004,7 @@ static const struct llcc_slice_config x1e80100_data[] = {
 		.fixed_size = true,
 		.bonus_ways = 0xfff,
 		.cache_mode = 0,
+		.activate_on_init = true,
 	}, {
 		.usecase_id = LLCC_CAMEXP0,
 		.slice_id = 4,

---
base-commit: ebe1b11614e079c5e366ce9bd3c8f44ca0fbcc1b
change-id: 20241207-topic-llcc_x1e_wrcache-647070e2d130

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


