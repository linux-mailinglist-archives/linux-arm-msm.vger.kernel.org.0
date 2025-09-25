Return-Path: <linux-arm-msm+bounces-74846-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D8AB9CF38
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 02:54:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4AE9A421BF5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 00:54:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C92A22DF6EA;
	Thu, 25 Sep 2025 00:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dO3JsxhK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE382DF141
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 00:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758761569; cv=none; b=V/Wxk1AxqO3UWVzeeoZ4tOUvsOy7B2qNLH086IeRHtHhZYekv3fFrvvoSzEAED3sG/w5IhQo8RZxe04fOvdIhFusFgrFhVVPRFZAwyhhYG7CkzwMGDjaHmpEoX8Ae4+QuO1I+z0WhvYxPd1JY5ahX0tqllnd77YPUmT+FMjQwWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758761569; c=relaxed/simple;
	bh=OkC1mLtz16qVJoq2dcpPz2WMUUNz5fHtzWVOhSAQHi8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YBywnvXfYGcGZO50/LqGFglABHBlI+/TqQgEP6U3byPDN74ThZh7UYuhi8V9JdZHJhBpRJ319l1OSlyKTnI9RYYuvglVGS6eRsSb7KD74+5xhs7B2tITbUJWRhnmnvT/X6rLbYo22LkEoG6uIpQpciqjl2V7hRTrgy1M1H/hzIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dO3JsxhK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ONbrko023762
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 00:52:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=GwDc2ByWl5B
	YnzIa/5w++Oacjx00R55NFfYXUv0r7SI=; b=dO3JsxhKNWN+4cYw7704EKXh4yT
	kFUPFg/G4A7DWjNhpCIH0KksUXQIVmGFBDWH6b9yqhHum+qwgjEWUhk/0XlHTSRH
	A2tlwwft1psIeIOHoyPqEYutUNKX+Sm1YiQXedjMXXhTych870gi0fpmySb6YvmX
	KisY3hqqE2REgRzuU/9swTJeGSAsjsBIJIwxGqeio2b+3GtcK3P8jxLLJdruXffu
	CKp03Rci17cjRNn8blbuJTywYzjVLSbXquuiDJ0aafzZtwk1tMHxARaqRcdaYuRT
	ig3gpLJPKv6rrT4KuIwuVMgSPtpmCXMi3OexB3dMPqXZEtrZA1/Uv286Ccg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bwp0d82d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 00:52:46 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b54ad69f143so502098a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 17:52:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758761566; x=1759366366;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GwDc2ByWl5BYnzIa/5w++Oacjx00R55NFfYXUv0r7SI=;
        b=YVYW5EDNR4PUW/yroMU6KY/7n9pDL1vELnoJzOVg+J+wCGrYVWQC0y7GC3EF4tzg1E
         ROXxQpKlOGXc1lfSXry2zWDGEz0k2fC0Lwx2opOXBNLf6Plm7i4qAs/yW2I4CIjN5oOJ
         rRVlU4TM2d5ft0MOl83qdSlQJfECnCEVC/oJ+YLkZLBfT4TfRku0hGKth8FkcmT1MJqA
         QUzM+xTclyY0aSZQ4MDXaWwhjdCRdDU2ZaWN3lDsK5HadX0TMYsG/AQjATUfXrubW7vU
         IuYvTCbKIS8OMAOWSy9uYoXBZw98pCs0psdWmk9kvsdzgqylQlJNAFCiNprMcffXIwIP
         0acQ==
X-Gm-Message-State: AOJu0Yy9Hg7m85K7N6FXBTUiu1F1A5OyU5vdOWp4G/jClpgKSYDF0Vfx
	e3vu8qPy0AO+EtaBF1ZrWAlsy7uZOI0tI4b05jutvfqjMDOJPjlpj/eUJxUZ2JfXL23z1IcouLW
	XsYjgtdGAubsceS1Fj/U4RbTBt5yiFzuy3ntmILFqE+rp3M4d59tkbP7rkaVeLJS1Zs8R
X-Gm-Gg: ASbGncu5f+oqRpUN92KpD36GSmlr/u/VDNF5ixnKydZIp8A9z5tYUjmHNxJDtW+FiCW
	B8UZj+QsnYdCNy4b7idJ3gZnqHcy/WKkSOEmt0pRxtUgqUJ7wI0zAEYiKB48p/trWS20ur679pe
	Y+hKAfJ4kcLFpT99jWVSdrZ+Al6/9/Nw5CzdIonptr/0/LUKXlF8FZ8uw6bDvkxyoeZJbAyslZO
	+NR/xltj8zTOMFDoPrYSFF8dfzrW7QK1Rw9gWSjeSeUNC3U6P2mErJQHoDOWx1kze4URQZNV2OS
	5dioy3nhyuLJ6T5WXZjIm7mZQrOETOQDCyQEPspnb2WG0nNhJAH93gu1qt/Pb0+8BGGhzrE9FrU
	AGN5C5FlNnxSv6uoD
X-Received: by 2002:a17:903:2783:b0:270:ced4:9116 with SMTP id d9443c01a7336-27ed4a30d4fmr11198125ad.33.1758761565577;
        Wed, 24 Sep 2025 17:52:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1NU8ZODHNZkc+l42a5mkWmjFbo8+OfeRkITd+fOUaYxP3TJQUCBdNmqivTPnUx/dYUusvcA==
X-Received: by 2002:a17:903:2783:b0:270:ced4:9116 with SMTP id d9443c01a7336-27ed4a30d4fmr11197875ad.33.1758761565129;
        Wed, 24 Sep 2025 17:52:45 -0700 (PDT)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6ac27d4sm5238105ad.135.2025.09.24.17.52.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 17:52:44 -0700 (PDT)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
To: krzk+dt@kernel.org, conor+dt@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        kishon@kernel.org, vkoul@kernel.org, gregkh@linuxfoundation.org,
        robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Subject: [PATCH v2 09/10] phy: qualcomm: m31-eusb2: Make clkref an optional resource
Date: Wed, 24 Sep 2025 17:52:27 -0700
Message-Id: <20250925005228.4035927-10-wesley.cheng@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250925005228.4035927-1-wesley.cheng@oss.qualcomm.com>
References: <20250925005228.4035927-1-wesley.cheng@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KNxaDEFo c=1 sm=1 tr=0 ts=68d4925e cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=8inbgvmG2iPteTk8MkMA:9
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: IcN_8FXLvzpXZsMM_ICIaiO3PmCUdaV_
X-Proofpoint-ORIG-GUID: IcN_8FXLvzpXZsMM_ICIaiO3PmCUdaV_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDEzOCBTYWx0ZWRfXwsFEJe98iDCl
 f7ciJTrWv+2eZFwaW07gJ+zvSRO0OY59P+8q5Mh05OiylbvsVgVD0ZzsFmRmksCUaR34+RnubSB
 JZPRq8SyGzfcXfgBrWYokC9MLG3NvvQJwSJifCwQEoP2on5vJe0mnQ7n9tmE+Za7HBqIK/kxL4B
 HqnEtG4RoHzUGVFTpMjFIPnwroLKVE73Zba/+jDfyBnKMiY3mdCuI/tw2Xy6VHgRRiR4Q5zfmaa
 exoYRHfN1bqXJTwnQSnjpqaXZl+0VsW42jSDwgXqR4d2DAPEi0uCIqp7jBmRlBrm4XNksiWZJXI
 /pbC8vEv0jW2/OoWN0uUntDebJkaMSN6+1QVZg0gT9hMgo8woRHxRXjuaIRBMbRf83kfAry/sC0
 b4hZda33
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 clxscore=1015 phishscore=0 suspectscore=0
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509230138

Some USB subsystems that utlize the M31 eUSB2 PHY doesn't require a clkref.
One example is the Glymur platform, which contains 4 USB controllers that
all utilize the M31 eUSB2 PHY.  However, PHYs associated to the primary
and secondary controllers do not require a clkref resource.  Due to this,
mark this as an optional clock.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-m31-eusb2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
index 95cd3175926d..f8a00962f937 100644
--- a/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
+++ b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
@@ -267,7 +267,7 @@ static int m31eusb2_phy_probe(struct platform_device *pdev)
 	if (IS_ERR(phy->reset))
 		return PTR_ERR(phy->reset);
 
-	phy->clk = devm_clk_get(dev, NULL);
+	phy->clk = devm_clk_get_optional(dev, NULL);
 	if (IS_ERR(phy->clk))
 		return dev_err_probe(dev, PTR_ERR(phy->clk),
 				     "failed to get clk\n");

