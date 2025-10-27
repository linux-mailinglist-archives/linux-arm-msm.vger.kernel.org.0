Return-Path: <linux-arm-msm+bounces-78847-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C23FC0BF25
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 07:25:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DB3B64ECAB2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 06:25:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0C7E2DBF75;
	Mon, 27 Oct 2025 06:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZuNcoIrw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08CE32DC337
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 06:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761546310; cv=none; b=P6fT4z054rIZ3Qmf090eplpl+hbVeE7VI/FVgTWis1BpKgGJuHD0zvd5XBoVgm4N12kPSbneSKPSk5/cJbH4xtiS6sGKql3yd0qeXbp8j+SfjQhE+Jb8/gkoQ8iL0PpoziqlSDGJp30NYzi8B7pN0Vn3qC74uTzK6kYHCqD/ukw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761546310; c=relaxed/simple;
	bh=lCazBQWnIiQL6MPzUDH/BgTEHt7ubvKTmINYfZvjR50=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Hgk7ClIQcG0Y8tbANf8L0iCN5T/M0ubgeVKNyHulI2+rZnG/4dE+vESE65S5Kncem0MbrS7XwiHZ8a3lfFBGnBQeW3LLRFTZwhVQweNc+KHzUoif6KVg3yU3yC2kbjBJZuBVaCNHy/hEP8pIcCqYIeS0UPU6PzhSYnqdF4SSsik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZuNcoIrw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59QLh60b897286
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 06:25:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=teLtNRm505PX8MdgaxTQ1fxSCIYlKPWmx/D
	tUXEpo74=; b=ZuNcoIrwuEC64OO/+W72lW39Zktlb6lwaLtSurDy+OsFs9jK3aL
	Yt9i8WV6K8/unlpcgUdktKbNSfgX0o9HcaOr50IEg2Ft0Wrf4QXqjZQCn6VSyCt6
	mS5wpuxjMqN3My548/NrnRPRkSIlj0uLLBYNWoulHm+/JBfJhtV4LCbjtjkpVCdh
	0BusGdsxLJHQQhdm2dzPbPgTwXq3EBL7xsETiCQq74PqQuqzHfEEw0s0l3svamSD
	VslLlO4mU+AmiPHgr6cMF+gfczjlqHhQl7gxAY16f7vdBdpGFYf4Vtcny6vEeHQ5
	Epm0dgYGvW1ilURMAVM+tKdN3kRyZ2x9d0Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a1uc58v3p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 06:25:06 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2930e6e2c03so44932785ad.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Oct 2025 23:25:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761546305; x=1762151105;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=teLtNRm505PX8MdgaxTQ1fxSCIYlKPWmx/DtUXEpo74=;
        b=JB/tu5t+cRKGWvHyXqFbCm8Ej0Gx5pBsAsdsnXb7fg2nHRqsgp1HEsp4tGs/f8i32z
         Ps6eNFU+RsDDXs27m9G3+xAcKPk4FPLkTTiuTnq/3qUORxjWSH9QS5L6WQuusV1p2r9c
         mTJjMiGnwvSqCS8kGc42Fp0TiA1MvECi3Vr1uelw63+vjvP1u9zrLB/xjtXM0voNOy2p
         vMpiDNNr0BFgMd4q6AsVJzHCNyMdBOeHRnRq0+iIeSgBICVV5BXSjre3B+/EoVAB2a6J
         fZrxPFGgzO7wIT1Kwxc8dhDH3O2IJFkn7bLM2eVkRVb9uq7JWXMhQNmXpl2fV+26rpuI
         mIZg==
X-Gm-Message-State: AOJu0YwszeYbecLYUmxQFEyQD2/cWeHfPm2xnUhN8JuKR0EtxZDqoTyB
	eknc+5lYRDIEQ/C4dQf5f6n//3P6Bc7xduqL1fMgtVRsy/9E846CV5+IZvpAw2oRYnGYvLvLuZl
	US+rV0pbX7QjcfKTeZngs9H/gI6HAOjPdYnKGv9SOMjuxQoIBc1iznsggASWVIN5we69J
X-Gm-Gg: ASbGncvdPIxvzzSe3pSKWzkmi0GjUa6UbVXd5ah+BUEJnwwfTlkAQYs+H7fgzATVdO7
	gHj3BkY/eVsHMlK0UTR3XjcDw/OB8woXL1ovDlrsn8GZtvkziolMpuq27c7fom7J408Wx0/ytGZ
	B+4VHkSFo3mLJs1CjSNctDF7vWRLpUqk8Z5dxTxwY/BKtq13vmVQt66JP4tQdP/tO4efdVJqRtB
	67ivsCryK43LR1WUhjsNak0S7Ju+DJdambGFaNljPdBhEFtXFHSu2vUcz9RHy9m4EiR8SdUasa8
	oLrKXVVF1zh6jzhQdjSe8q52NAsQarm0QsV25pm1fu4OenpFA/gHjKm9vjuRtWdZKJTUMIYRH3Z
	A+Skao5IozC0VTH9rvzGQqmfCGu0=
X-Received: by 2002:a17:902:f70b:b0:267:af07:6528 with SMTP id d9443c01a7336-290caf83079mr448673445ad.35.1761546305432;
        Sun, 26 Oct 2025 23:25:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYsbnoxIoDwX1NoZs2UO3l7p3LATS1TmaBH5XzP3HuuA+Rw6QnyKU7CjxwqONWCAnQw26BZg==
X-Received: by 2002:a17:902:f70b:b0:267:af07:6528 with SMTP id d9443c01a7336-290caf83079mr448673185ad.35.1761546304946;
        Sun, 26 Oct 2025 23:25:04 -0700 (PDT)
Received: from hu-prashk-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d23218sm68346975ad.51.2025.10.26.23.25.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Oct 2025 23:25:04 -0700 (PDT)
From: Prashanth K <prashanth.k@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Prashanth K <prashanth.k@oss.qualcomm.com>
Subject: [PATCH] phy: qualcomm: m31-eusb2: Add runtime pm ops
Date: Mon, 27 Oct 2025 11:54:58 +0530
Message-Id: <20251027062458.1411096-1-prashanth.k@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: mlUszDI9EILRW1pNxl5OzV3aKDg1ujzR
X-Proofpoint-ORIG-GUID: mlUszDI9EILRW1pNxl5OzV3aKDg1ujzR
X-Authority-Analysis: v=2.4 cv=Z4Dh3XRA c=1 sm=1 tr=0 ts=68ff1042 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=-Y0lm5QSNLYpoQ5O1QAA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDA1NiBTYWx0ZWRfX5KbFijHH8Bht
 jughyYGbPMSLex5Kr1UV2qhRYCjPzo7dxvcYErFjvwpDZfd5aLRXHQPfx/1+0hFxb0oL3jeOC0G
 21ijPWlG1NyBV2oWBqb5Cl+L9wbgZ9wGpJYqq75TMJe6K9K/45UA7G0hB0iQFHHnXwt1O3MDluw
 MNH0hSTFwSc3u3UDQI1cTB2LoblucH35I/Nv4iSJaIy6aBPOQN8i9+6l6D8qj5LoePRHvS7Tdib
 nCErzbbkudomgH7LF2JbSoX0XqcSudcP8BiSBbJVt+gYu3Wb23iT30TCCvfz56m4GIHXI7hnMOM
 huONy3I1qVdN4nGAKeRHBc/SgTrf1z8FWIjJx9j1bhniAur2r1taA1fIIHhr1NZZLT07dzU2k0G
 2i+SjO+WaqPaJ3TBMS4VsVGZqqyAhA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510270056

Add runtime power management operation callbacks for M31 EUSB2 PHY.
Enable/disable the clocks based on the runtime suspend/resume calls.

Signed-off-by: Prashanth K <prashanth.k@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-m31-eusb2.c | 40 +++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
index 0a0d2d9fc846..1aeb5e3de07c 100644
--- a/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
+++ b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
@@ -240,6 +240,34 @@ static const struct phy_ops m31eusb2_phy_gen_ops = {
 	.owner		= THIS_MODULE,
 };
 
+static int m31eusb2_phy_runtime_suspend(struct device *dev)
+{
+	struct m31eusb2_phy *phy = dev_get_drvdata(dev);
+
+	dev_dbg(dev, "Suspending M31 eUSB2 Phy\n");
+	clk_disable_unprepare(phy->clk);
+
+	return 0;
+}
+
+static int m31eusb2_phy_runtime_resume(struct device *dev)
+{
+	struct m31eusb2_phy *phy = dev_get_drvdata(dev);
+	int ret = 0;
+
+	dev_dbg(dev, "Resuming M31 eUSB2 Phy\n");
+	ret = clk_prepare_enable(phy->clk);
+	if (ret)
+		dev_err(dev, "failed to enable ref clock, %d\n", ret);
+
+	return ret;
+}
+
+static const struct dev_pm_ops m31eusb2_phy_pm_ops = {
+	SET_RUNTIME_PM_OPS(m31eusb2_phy_runtime_suspend,
+			   m31eusb2_phy_runtime_resume, NULL)
+};
+
 static int m31eusb2_phy_probe(struct platform_device *pdev)
 {
 	struct phy_provider *phy_provider;
@@ -270,6 +298,17 @@ static int m31eusb2_phy_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(phy->clk),
 				     "failed to get clk\n");
 
+	dev_set_drvdata(dev, phy);
+	pm_runtime_set_active(dev);
+	pm_runtime_enable(dev);
+
+	/*
+	 * Prevent runtime pm from being ON by default. Users can enable
+	 * it using power/control in sysfs.
+	 */
+	pm_runtime_forbid(dev);
+
+
 	phy->phy = devm_phy_create(dev, NULL, &m31eusb2_phy_gen_ops);
 	if (IS_ERR(phy->phy))
 		return dev_err_probe(dev, PTR_ERR(phy->phy),
@@ -313,6 +352,7 @@ static struct platform_driver m31eusb2_phy_driver = {
 	.probe = m31eusb2_phy_probe,
 	.driver = {
 		.name = "qcom-m31eusb2-phy",
+		.pm = &m31eusb2_phy_pm_ops,
 		.of_match_table = m31eusb2_phy_id_table,
 	},
 };
-- 
2.34.1


