Return-Path: <linux-arm-msm+bounces-7989-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 930B8839456
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jan 2024 17:10:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4AF001F265C0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jan 2024 16:10:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3D0766B35;
	Tue, 23 Jan 2024 16:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8devices.com header.i=@8devices.com header.b="askbaJZJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B9CA66B2B
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jan 2024 16:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706026186; cv=none; b=Bt2Sv2SFZ3y6+qmgVr1pFaFpgMIMJStlB/NYA9OqONPT5MPzcNswHSZVXmVakxZ6JC3mOP8fOM7ge47+hzga18NJDtGKM2waC6TXAZflslxvQYc9S+0Vbg/d0p6/kwJVLJappYlQoAlDF0F9HjPEBDA2ZYOFmowx9lgWuxvodqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706026186; c=relaxed/simple;
	bh=3kUIcHMZp9ESusmAFQXmdY4T9ktzKZmqQiYsfpE2vKE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=ppfUZl9H7OqpdjeKRSC9meSoga3lBr9ZLV3DSiqd6IlWutrdl7XRRSrCvwN2mroa30UCkoKQKn1efXltCsUYP4ubxXwfCaAUOX8G+KlfU9PJ3RGlKSAtsHQIO9WSG6KvITycGJ33+J/21xW/7JVKJDBgV5McK2LnZpmuIGmUAmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=8devices.com; spf=pass smtp.mailfrom=8devices.com; dkim=pass (2048-bit key) header.d=8devices.com header.i=@8devices.com header.b=askbaJZJ; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=8devices.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8devices.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-50e6ee8e911so6041771e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jan 2024 08:09:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=8devices.com; s=8devices; t=1706026183; x=1706630983; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9aeZ9T+ieCTjHLP9T+AlBqZqFSYlGNv4TaAS0kSX4XE=;
        b=askbaJZJl8eLH+SG4IGtvx2/Mc1OHptftXBj/5S7ugFVaxO8dtnrtwOSrhS0o/Rn6e
         cCuhvvDSGVcyTTGmu8rLkvVRytjQiYnEu3V8Pm6h7tUUq7TBozdYY108uQtQbie6T/PL
         CZFoKVAxh+1qaRF06NfvznmQixtPQPOF6bneY3WEvDrbOsQPOHJBXHwWWmZmUrodtcaT
         hYr1EYyIIViPVvzIZ595TrbHwabh4GIPYWAunw4xExOMCUyFbnEyc15ZdJK/Uwx4lsp9
         XvjNJkkAs6Vvg3PNNRot5pKNgqNC+eokeZiThA2o8M4ZrpmtTobI+1LT8ol5N9yCOdLU
         1Vsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706026183; x=1706630983;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9aeZ9T+ieCTjHLP9T+AlBqZqFSYlGNv4TaAS0kSX4XE=;
        b=bRECqFOm5QMSUBiAqHCcZ9R/VV44icxC1QiblmYSRNwpX3xCXiuWdj4blho2w/D7+9
         YfEAI7z/C0jUMZWJSO0VeM1v1jDBWUXsIXk6DcJ+g5LhT6Kelq0Za329lnryR/jpSS8h
         kfnrtC4ZLb428ALiDOx3t2f/1WsPWk3Nnn/4eLLIa3s22EJySnMO1fciL0CGw6fFAPcu
         Dq4wpt/QicWQr2cCu4WcmVYEEEHhZZ6gMk1Va0KbNCTdVGDDTuANu7/9W2RWVHs5t7OD
         d3y8oZfSLWW5pr0SLe3Tgq0ivWhxDavKKl8DVG+0BVL27KRXZNCgc5srX5YJ2G4BoqWm
         cmgg==
X-Gm-Message-State: AOJu0YwbVgdw+qo9RXdE+2qutKsa2C/6CMPF12dfaFpIZ8G6Yu/+ZlQh
	hst9ZRxhcHydOXy2ptq7jbs6/4qlbVkJzNIvXc+vW9p5u62ng3vPg5pSZnokD/c=
X-Google-Smtp-Source: AGHT+IGFvyHOYbubVCuNY4+CxwTD27nCRHbuPg5Mi/FdVx2PZLy5oltclL6DN3yH53ibrsQ5Gwo47g==
X-Received: by 2002:a05:6512:a90:b0:50e:a9da:7b2b with SMTP id m16-20020a0565120a9000b0050ea9da7b2bmr3401307lfu.94.1706026183207;
        Tue, 23 Jan 2024 08:09:43 -0800 (PST)
Received: from mantas-MS-7994.8devices.com ([84.15.37.222])
        by smtp.gmail.com with ESMTPSA id q20-20020a0565123a9400b0050e7be886d9sm2336950lfu.56.2024.01.23.08.09.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Jan 2024 08:09:42 -0800 (PST)
From: Mantas Pucka <mantas@8devices.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Baruch Siach <baruch@tkos.co.il>
Cc: Mantas Pucka <mantas@8devices.com>,
	linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] phy: qcom-qmp-usb: fix serdes init sequence for IPQ6018
Date: Tue, 23 Jan 2024 18:09:20 +0200
Message-Id: <1706026160-17520-3-git-send-email-mantas@8devices.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1706026160-17520-1-git-send-email-mantas@8devices.com>
References: <1706026160-17520-1-git-send-email-mantas@8devices.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

Commit 23fd679249df ("phy: qcom-qmp: add USB3 PHY support for IPQ6018")
noted that IPQ6018 init is identical to IPQ8074. Yet downstream uses
separate serdes init sequence for IPQ6018. Since already existing IPQ9574
serdes init sequence is identical, just reuse it and fix failing USB3 mode
in IPQ6018.

Fixes: 23fd679249df ("phy: qcom-qmp: add USB3 PHY support for IPQ6018")
Signed-off-by: Mantas Pucka <mantas@8devices.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
index 05b4c0e67896..6621246e4ddf 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
@@ -1621,6 +1621,24 @@ static const struct qmp_usb_offsets qmp_usb_offsets_v7 = {
 	.rx		= 0x1000,
 };
 
+static const struct qmp_phy_cfg ipq6018_usb3phy_cfg = {
+	.lanes			= 1,
+
+	.offsets		= &qmp_usb_offsets_ipq8074,
+
+	.serdes_tbl		= ipq9574_usb3_serdes_tbl,
+	.serdes_tbl_num		= ARRAY_SIZE(ipq9574_usb3_serdes_tbl),
+	.tx_tbl			= msm8996_usb3_tx_tbl,
+	.tx_tbl_num		= ARRAY_SIZE(msm8996_usb3_tx_tbl),
+	.rx_tbl			= ipq8074_usb3_rx_tbl,
+	.rx_tbl_num		= ARRAY_SIZE(ipq8074_usb3_rx_tbl),
+	.pcs_tbl		= ipq8074_usb3_pcs_tbl,
+	.pcs_tbl_num		= ARRAY_SIZE(ipq8074_usb3_pcs_tbl),
+	.vreg_list		= qmp_phy_vreg_l,
+	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+	.regs			= qmp_v3_usb3phy_regs_layout,
+};
+
 static const struct qmp_phy_cfg ipq8074_usb3phy_cfg = {
 	.lanes			= 1,
 
@@ -2571,7 +2589,7 @@ static int qmp_usb_probe(struct platform_device *pdev)
 static const struct of_device_id qmp_usb_of_match_table[] = {
 	{
 		.compatible = "qcom,ipq6018-qmp-usb3-phy",
-		.data = &ipq8074_usb3phy_cfg,
+		.data = &ipq6018_usb3phy_cfg,
 	}, {
 		.compatible = "qcom,ipq8074-qmp-usb3-phy",
 		.data = &ipq8074_usb3phy_cfg,
-- 
2.7.4


