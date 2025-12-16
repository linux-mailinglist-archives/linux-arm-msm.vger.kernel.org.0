Return-Path: <linux-arm-msm+bounces-85318-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A5071CC1915
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 09:29:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E418C309D952
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 08:25:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80C2D33D6CE;
	Tue, 16 Dec 2025 08:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gVBboK8a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NVxcguW2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E92E33B6CB
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 08:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765873530; cv=none; b=i/f77zxJtSgdI/8zRmfno5zO4uGkOXCJj08N5hUbi1bF/kZ+rct3aUf/YbxT6RyFYaBi53y6PBGKjCBh2l3Q7DD+3Le/pwpQt2KBsJUG6UYsGTwVh0Qf8cvPduMCaTDV5XXTJiCKu6gZAXd1RFLXtEKcKHd2NbWnqvmOsfqQz0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765873530; c=relaxed/simple;
	bh=mdsLIHLcUrYnP99BXNTNuUnzs3ckICDP2Sf2GMF57o8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nVBt8EpjKzdSC+KW0PfygVK6JHvP8MCZVk/xH4d/pz3giwnAHBTRouladc36SpssbSVAhKQblmnJA2AeB7mTPPrfpjvv2tvbjCJ9fstLYFXhmZxlTUiWAjiW7o77qWp4LCbUUvBCT/abLqiq7fyCM3ApW6Y8juutgStGHlrl+NU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gVBboK8a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NVxcguW2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BG8MKMn1682111
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 08:25:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wANM2/9CikBZrCoWxAakBFZ1Y50kCByK10cZb602R/c=; b=gVBboK8ah0EALRU7
	rSm+LWcvOjemkdj/hoBECb8S/wfYhGkNXAZs+o3jJWLdPArWSlHSrtEXqf2e5fld
	H+o6cfo4EP05Un0A4Z5H3Sb7M5oD3x1N7uAFlJUNaWB7G9IIUPL0W2r9zAmPhoLn
	eMyv1rk0+M8zmRuZDVgW6KSrmHlwN6lfN3QurCT+Le2NCtw/dWHqVV81RymspZ5v
	N0nalNQRcV063+s+BeF2ikH/nrB4zX+g0RKaMFUQSbK1Tn7e0UCwviLwJv0/CIuV
	qE97lYre+Eg4D0P357nQR0IC9wlw6ZxmFWNW9+qJo+MvNZInFKBB1VYgORf08w5N
	SfnTXw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b2q7tjsma-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 08:25:24 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee09211413so117422601cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 00:25:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765873524; x=1766478324; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wANM2/9CikBZrCoWxAakBFZ1Y50kCByK10cZb602R/c=;
        b=NVxcguW2rfyE56slUGo2ZdszHTttN2LfayiUYq69HOkOi/kNw4IbB5rNv2NeWtUIfS
         Wgy+qmz++9Hti1nG7zwHy37jTmG1oNN8m4hJRz3fgjUC+aZ/iMl9rEaC2cIaV+DZoqpa
         HtwrpnDG8oriqs1fKXexn2hytR7LUVv/l6NuALwva193ngxQ1cIIC/afDJA2J/zLxMvI
         t/J8f7g0aOMZxd3lSrnoeB8JqQebyiKHTkWKHHe7ldwRkSVplBQXSC26SpfK5/tidRBi
         XoZZi7s6MkiTYaaCg1OeZFW+ep8IKX2vA1K3UP25rK+mbN6zeM97Wd5rxFM3o7cIw0+w
         AUsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765873524; x=1766478324;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wANM2/9CikBZrCoWxAakBFZ1Y50kCByK10cZb602R/c=;
        b=rwroIMo0KOVqtndvlGC9i9oPWhZrszyV6taVocREBaIi4SPXI7yf4rDyVo5LYUPjM0
         9xmFE+h+tjEvNXT5/1TEsP4Eg7tdBXT4J47/HIimQX5ip1Oi9VBOfzVjwTtu3FfASnfb
         wOxQPNczTz408ytUjddSlE75ejTQxAd7Z3XzQE+V4WZC5bjFTqkVQznbJPQVtW98FgHt
         /b2GIVgeKguUb/58mAEDks5aUlMyJeHC2XK+vKSI3BdxvHyOpvlGHuWKcCswDZicsHkH
         j5HNcgrqufz25GbFldEryzJsZQWxqz6NL+7MuA1yvzC7QTXKlxcCshxYpDQsDegHMPXa
         xtbw==
X-Forwarded-Encrypted: i=1; AJvYcCUBw/IEs4zFbafafr7kExgCoRfvMbkg6pncMKh0dZYN/Rw2ntlkY7qDgOxeaIZRJLgsqiHb9MeQqzDQhiL0@vger.kernel.org
X-Gm-Message-State: AOJu0YynioTYoJWw3hm3EQpnlDoTq+X92Vs8tAbgEAbHYK1LwoYtQfnq
	hXTdW1kXb5P81p3tPe7kw/DcSftvIHNI9Ecj42zszEwEEUiuk8K2Hb8jHRT/paeL0Si9cf+3X62
	6yEEDOjRgFoXdbzICpVw9cAsQ5ct3hO8Psn63NsSnXkCcOigeVV0mGMs+wqtGWsLlt997tS9lIR
	3x
X-Gm-Gg: AY/fxX5zsmW6uZc7tEIsgMoPR3IUpRmxTZvRWA9XsDueXOKPU9Pjwnl7+alO4UuLPhW
	yo6FH5LRr3L9+i0EZmK1toOy2bsRFDm23Ca7rzdkJv06LdXoruyjORFrMy8hUyyqPE0xqPJIDLs
	/Ah5/1UJ+ZqVcf+C+G4u4eq6vao+RzZpyqtE7E5OCb8DsnipCqyTMEmcgL8bLX0cExNNBawzf6y
	oeR4olGM7y2bRoJxiqkiQQIZ/pdCoD1mMu8wvYEss4HPdT8oZDZztyL//hDZ1OjE7zL2WRWX/Tn
	cXRftbeG/DwVMuzwiodWEYf3V5/nsO9P/BbXrt223o38b+4gLBppGCyrjFFM3l3u+nQVdqic16W
	JzU32HhLHkbFVYzc=
X-Received: by 2002:ac8:7f4d:0:b0:4ee:208a:fbec with SMTP id d75a77b69052e-4f1d0626396mr195164001cf.66.1765873523638;
        Tue, 16 Dec 2025 00:25:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH870VyJOlL68+tvPG1mtNh8Qgx4N2nure00Jw1JKifSdq5/RR9xLvkMYjl8Mg+1/r30nVBRw==
X-Received: by 2002:ac8:7f4d:0:b0:4ee:208a:fbec with SMTP id d75a77b69052e-4f1d0626396mr195163751cf.66.1765873523068;
        Tue, 16 Dec 2025 00:25:23 -0800 (PST)
Received: from hackbox.lan ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6498210fceasm15134381a12.24.2025.12.16.00.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 00:25:22 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 16 Dec 2025 10:25:05 +0200
Subject: [PATCH v2 2/2] phy: qcom: qmp-pcie: Add support for Glymur PCIe
 Gen4x2 PHY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-phy-qcom-pcie-add-glymur-v2-2-566a75672599@oss.qualcomm.com>
References: <20251216-phy-qcom-pcie-add-glymur-v2-0-566a75672599@oss.qualcomm.com>
In-Reply-To: <20251216-phy-qcom-pcie-add-glymur-v2-0-566a75672599@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: Wenbin Yao <wenbin.yao@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abelvesa@kernel.org>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=2618;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=6GZZAJENybuhzclj7N+DkIr9RF5K5pJlUYJXDpPslOY=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpQRdsAzPPX2TRnz96FiPWsxlmDp1f4eokSEFYN
 uTsyKuo0qKJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaUEXbAAKCRAbX0TJAJUV
 VkhqEACcUfu7319PMPHv32W+L/oguHpbWcTo2aIdf+e3cTEVNCp+eUqMpvwQ9oMnF3pZCQHCir3
 wJcD1mWO32z4TqdvzYQZic1me30QJtHYNOhG1OCXXYvPIupvwPlRCGnT+uKuhu3C1g2RL6nYdTK
 Ps0E6bt8UOWFM+qcVPAnznJcqSifAymK5d4AGU3BLItLHG5IiEFaILtvtn8Dp2kH5mZJmiFc1R3
 FhjuFXI1T3llJ25YYsLB23eh5iiXW+gTpSXqNGjWp71FfsV7I5KjtVtEBmDFfjKsFwmqnY317cT
 zi4rJbZd45u4QIeqGc7OUOQsdotOAV5g3CVYtCjx7olRebZVR7oPRw76ESNOgXJ9Gphg24CeEwm
 3N6Xpr5zFIJ+qSWW1hoKvhkXJTjgTEwm4bYIjAQlrGIWk7Xb9UHUAnUtidQsSzMro2uaTnlpcHJ
 ElpF52f+IxepwOEWHWMdv8pOEDV03u7iNa7pkCuOCqXm0Ga5mJa09aR7YZQm+OqYRCyvetLpWtT
 OtB7fR4M0U+yE1ZQGFBjVtiw/e+B/e90kTuz6LY+XmVjGNv0SHBWEBBAeXoUuyTnxSqbvz4G69n
 jvrPw4nispmUwFJ7bZT08NSkmIiRciIN0MvHgGaQs7WZ87dn2yqRzugBSRPx1LDGzredy+WGawP
 0L+BbSkAMBEgXXg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: h_fsLBnAmJ9At5QV4uUrQGYZ6d9L-o4L
X-Proofpoint-ORIG-GUID: h_fsLBnAmJ9At5QV4uUrQGYZ6d9L-o4L
X-Authority-Analysis: v=2.4 cv=Qo1THFyd c=1 sm=1 tr=0 ts=69411774 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=DdBtMnqNxkYIvXj6ev4VzQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=tiC4AEIUfACfndhgxo0A:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDA2OSBTYWx0ZWRfX++mZ+ol1Mn5m
 HG0qUyjXtkeuWaXkUDfR/+e8cb9dcwDSctLe/f1S4SKVLP/+fLDCMbtOBHYNw1k+8EJUj669+9y
 ef1uwC3oEAh9Slmr4tgymLpnLLywEEODl5RAZ7Y7ttgswPCxziL+hpy5IsKBTH0ef/yNIgNgw4o
 4/+Z7TJdMJli2/ms4rDW3XW7HDYGlQ4YXt72tUSCwT7MCE70ZKpErkYjJeJ7SzaKHCvgba9uwwr
 /vG7Raprcn+JrqQvyaOama4dvshUlKLFkzqiEqOPVnwGtmd3uAnI88cZAWN2F5pQgtAE3qj5+HW
 q01SGVs68xLp8+pKImdnTdAhKBEJDofvCV55XL4E5eBLP3ECf517Yx/RJaIAvz4xr0U4RT/blLp
 hZ5bQkfSGdQLjghQq/sodzPZXITdgA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_01,2025-12-15_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512160069

From: Abel Vesa <abel.vesa@linaro.org>

Glymur platform has two Gen4 2-lanes controllers, the fourth and
sixth instances. Add support for their PHYs.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 34 ++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index 86b1b7e2da86..5b53f03771d8 100644
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


