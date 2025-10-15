Return-Path: <linux-arm-msm+bounces-77411-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6B8BDECDB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 15:44:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C5F32356EE5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 13:44:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AFBA24A06A;
	Wed, 15 Oct 2025 13:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yw/Jhg2Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD322472B9
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 13:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760535811; cv=none; b=FyffCulFabfEMLv9sScUwboffzDKjgwZwRxU8OfWQADPq7+1U53bKH0J++MLAW2xO4d+0Lz7iwLB04kqxETJIm264mYJRfcd+azgdr94sjhMMvIw5l/5lDQluc8267bhPspGo+m7jhZ45vLV0WElCURbd9D00CJo2U27WaE4n9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760535811; c=relaxed/simple;
	bh=hDyc9oMypUvZah5yy7M2nEL/OkN7nQfGT80oOv3HFeM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OQvyigPsum+KaqWtrbheWJsH5J7ezsMsz4qfsRlYHrhDQLI+/fFE+Wkh+WFpysFWxbgU+9IKNbbbdJwU9AaDB1R85Oe1PVUfz0+CHfCv9uofGpyOZ0SZDhYAsknAU3sos4Xqhmio+AYAxkN95T0T1Om/a4IRa7ttTy27ScmywCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yw/Jhg2Q; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-421851bcb25so3114390f8f.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 06:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760535808; x=1761140608; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cPOcqrHoAC0pIWNV4V+SfzH8kNwkAKjv45j4Ggbs9iE=;
        b=yw/Jhg2QVJcPNT3vU1DiENTk/trRGszhBNW5iZtFNh56t1yN9UjZwV2Xq6tjyd4f7y
         1z/Evf8gjbQ3TgeyuEHAhgwCSIdXtUOwdSv7cCbJilYynSbhzt3erk1szaCnh8zcG+y2
         3rJbXV6yz41G01cpx8xzILS/mrTFzn6EX6y9lc20lgqG/IeNKaoYHqUyvYaXkszItlqq
         HeWaaPnK2Q7xqvoO4bfLcrE4v2/0QCAIOTzg1gUrm2PAwhBP734hOpnzyR3e2qR4yDfK
         rTVs5tLpJZFoof0vl5WhLDhCEbmNm7+V3iDKfF7MywYEE3gVEZaIOZMkRdik5snmWswI
         rg4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760535808; x=1761140608;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cPOcqrHoAC0pIWNV4V+SfzH8kNwkAKjv45j4Ggbs9iE=;
        b=dM7+ZzWmN5NJhSG2Yolybu8Mzhyu+BuB0HHGzSOJgvkr7qmrb8sRzsUAh6j7MGUlWw
         h4YMhYMTgQW+BtBBfatgMZRDauCI8n1ccgwaKR9+HD1/B1z2xktC/uxDP1Hepw0sIuV/
         ed8c9VihvlehwroZ9J7V5PIpDsrQN6AJgTNLwC/k8d4jiA0INgh7eWuk47qDhaxzXCCy
         G4VqNNvcHSs/p/egDbmYIXLt9xVxFt7fEVADHPZ5ctcMh1suR5FEOmlsxtepDe5ilxK6
         3vO3+Yo1b4O4vzmZ8jZaCjFh6iSFSCcs3K4FDCY5+ardEOBWhzahnhM1XdHKLc5Y0t6d
         USvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVw07/DX0uWvPyeraC/ip+R9yzOsjO5CZKrcGEcGNYMEFIxx1Hjd5ObNA8TWiLMhSFPNXHNSmDnVfZoJi82@vger.kernel.org
X-Gm-Message-State: AOJu0YzVv3h0aRsf9Xt5SXKMi3ZV2PJq3qWw8f+cOvXMLwjAJO0+4j0i
	ZzxjDhTx0kX9cS/+M0kdEU/MHuElGLypmRYlvGnRWwJEyXpvv1GPkK8cjrGIj4Xl1rxGEAPFCaL
	F2Q7j
X-Gm-Gg: ASbGnctMfUn5a8rKKYHhLdRjF3jGl/gCK6xFO5YiShz/4R2WVE2tCej+5JRcP/tSvSH
	bE017Whsn+5TttWMcKK56/jskB5LlX4l+aBCiDXdR2sJWg7fgZqxGssJYQW6Rpuz8BzZcm1fQJR
	4CNtCKzTXwm71BhHqjswdYYwAfb9xWMCO1imjIbZkl+nNo/0zASgrLIkMSWPcucvEQWMBR2XmK9
	4p/l3S+zCntw74BPEvOIVly9Bgq87M6qHfDdeWwpjUs7UG+kuT+80j7aAxCnPXT+s2+ALQtD77G
	j37ge3C3U89xnce3ScnTunKFF4l/lc4KMd1HI9lpT980a3nsqeEx2QB16gicuzadSLhzsSe9iCO
	rCeeCCvVlAuQZZh6XHcNNKOcAWACtHSg5HH/4qNZyvBY=
X-Google-Smtp-Source: AGHT+IH5nePTE53pHld2Sv5dcJlhv6pAzkVfdu25NMHubXSnvoEtpHJoJrj6fKK8sk5BAorl+dF75Q==
X-Received: by 2002:a05:6000:1863:b0:40e:604:8e29 with SMTP id ffacd0b85a97d-4266e7bf05dmr18232349f8f.15.1760535807748;
        Wed, 15 Oct 2025 06:43:27 -0700 (PDT)
Received: from hackbox.lan ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fab3d2d65sm174180795e9.2.2025.10.15.06.43.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 06:43:26 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Wed, 15 Oct 2025 16:42:55 +0300
Subject: [PATCH 2/2] phy: qcom: qmp-pcie: Add support for Glymur PCIe
 Gen4x2 PHY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251015-phy-qcom-pcie-add-glymur-v1-2-1af8fd14f033@linaro.org>
References: <20251015-phy-qcom-pcie-add-glymur-v1-0-1af8fd14f033@linaro.org>
In-Reply-To: <20251015-phy-qcom-pcie-add-glymur-v1-0-1af8fd14f033@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Wenbin Yao <wenbin.yao@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2674; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=hDyc9oMypUvZah5yy7M2nEL/OkN7nQfGT80oOv3HFeM=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBo76Tz246TVdgYwl7XyaA1hooKuk1gfiyCLjkrL
 veKksGRQV+JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaO+k8wAKCRAbX0TJAJUV
 VnE+EACgHF6z44JrMDOGOXuJHtM06s2ipBDBhaxlkkuI4rpJK+VE3FluKrAZOwaVdWOM14W+Iq1
 EYT5fytjGVAXUEG9L9xMkkR0PD3PnG3a3U9uy8vQptZmi21m/MoSbGAtLiL+3/eMu0cCNSOMlbF
 01vp7QwZM2m0C3yg7yO8G5qxfEhPjqtUXjlQ+YLRiaYajeGgdO0GcQ5Qa1s5MWLjDyB85c5fxUI
 37Dg3/cwtRxt2/L7+lxQEAojifm1NttjKoLn/BB6WFU8QYxYrba7xtQQiBBBvXfMeZpzqxAMp8/
 Rb85Bey0dYOIp++cvNI8QUXNQArDk1JJP6JNKMCFWAi02Ck7nNhfE94dDYpnw5vrY6wek916V8z
 5whKi/GEYt5eTfZZ67TF4vinSvmSfhusCOT3FIl+3bmJ2OT89Mlmh4pWa0TMKlncTcHvgRuu0f5
 Gd/Bdg4/yVG+r6H96DHp9o9TrerLPsmhnWMLHveahSU2kl7cyxzlwkByslbinC1E5zfySKjmhI0
 os8RO/xs4WqQDCb8i+j5dJLfcosb2UZP2PtmqPx+qWvnu8a3RY5azi0tiM9hiQSBOtCF1yaF5Am
 BsFBMNpSg/SIa0e/kkFBPmZnkZ6YleiZTOUr/r2opLqzErAvv3XfYO+cwzd+EBFH4F+X6ZCPPY/
 gYayPulvuUgPVuQ==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Glymur platform has two Gen4 2-lanes controllers, the fourth and
sixth instances. Add support for their PHYs.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 34 ++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index 86b1b7e2da86a8675e3e48e90b782afb21cafd77..5b53f03771d8fa54ac146e1832f70fdc69c762ff 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -100,6 +100,12 @@ static const unsigned int pciephy_v7_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_PCS_POWER_DOWN_CONTROL]	= QPHY_V7_PCS_POWER_DOWN_CONTROL,
 };
 
+static const unsigned int pciephy_v8_regs_layout[QPHY_LAYOUT_SIZE] = {
+	[QPHY_START_CTRL]		= QPHY_V8_PCS_START_CONTROL,
+	[QPHY_PCS_STATUS]		= QPHY_V8_PCS_PCS_STATUS1,
+	[QPHY_PCS_POWER_DOWN_CONTROL]	= QPHY_V8_PCS_POWER_DOWN_CONTROL,
+};
+
 static const unsigned int pciephy_v8_50_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_START_CTRL]		= QPHY_V8_50_PCS_START_CONTROL,
 	[QPHY_PCS_STATUS]		= QPHY_V8_50_PCS_STATUS1,
@@ -3363,6 +3369,15 @@ static const struct qmp_pcie_offsets qmp_pcie_offsets_v6_30 = {
 	.ln_shrd	= 0x8000,
 };
 
+static const struct qmp_pcie_offsets qmp_pcie_offsets_v8 = {
+	.serdes		= 0x1000,
+	.pcs		= 0x1400,
+	.tx		= 0x0000,
+	.rx		= 0x0200,
+	.tx2		= 0x0800,
+	.rx2		= 0x0a00,
+};
+
 static const struct qmp_pcie_offsets qmp_pcie_offsets_v8_50 = {
 	.serdes     = 0x8000,
 	.pcs        = 0x9000,
@@ -4441,6 +4456,22 @@ static const struct qmp_phy_cfg glymur_qmp_gen5x4_pciephy_cfg = {
 	.phy_status		= PHYSTATUS_4_20,
 };
 
+static const struct qmp_phy_cfg glymur_qmp_gen4x2_pciephy_cfg = {
+	.lanes = 2,
+
+	.offsets		= &qmp_pcie_offsets_v8,
+
+	.reset_list		= sdm845_pciephy_reset_l,
+	.num_resets		= ARRAY_SIZE(sdm845_pciephy_reset_l),
+	.vreg_list		= qmp_phy_vreg_l,
+	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+
+	.regs			= pciephy_v8_regs_layout,
+
+	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
+	.phy_status		= PHYSTATUS_4_20,
+};
+
 static void qmp_pcie_init_port_b(struct qmp_pcie *qmp, const struct qmp_phy_cfg_tbls *tbls)
 {
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
@@ -5192,6 +5223,9 @@ static int qmp_pcie_probe(struct platform_device *pdev)
 
 static const struct of_device_id qmp_pcie_of_match_table[] = {
 	{
+		.compatible = "qcom,glymur-qmp-gen4x2-pcie-phy",
+		.data = &glymur_qmp_gen4x2_pciephy_cfg,
+	}, {
 		.compatible = "qcom,glymur-qmp-gen5x4-pcie-phy",
 		.data = &glymur_qmp_gen5x4_pciephy_cfg,
 	}, {

-- 
2.48.1


