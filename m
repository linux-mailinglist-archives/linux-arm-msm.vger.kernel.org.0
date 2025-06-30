Return-Path: <linux-arm-msm+bounces-63046-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 006DDAED6EE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jun 2025 10:18:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 143A63A5A30
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jun 2025 08:17:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F2A31E2858;
	Mon, 30 Jun 2025 08:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iVHTRL8Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B973918FDBE
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jun 2025 08:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751271502; cv=none; b=k78yXH+7KlIzQYOl/Z/zAPKPuD8vtvZ0GsuJnkrqggXn/kjuf/KHpGpb4oZ9l/5UPUemidEYfNoAy6foMRW8bke/0jq8zmic1WSKkuCWCa3Bsmu0HTrUIAFF5yjhG/ZLYNeCTCtWj0JRW7OyTIqpsdZm8ssiMq2OTqK4NDzLfZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751271502; c=relaxed/simple;
	bh=Y8jN/q3D+X5TDTIkf0wSzs/H5lU/a3DvR9W6XeQ3BIc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=OYIlqkdgC8dpBjqdRDH4dRlkcB6V1yydiWsWdycyz9gDLrnaEM9+fS+Say2BN1Cm9V2ykgpq74yCfZ+dnGrMk8sE7QN8uxhMDRCdH/r1a6IxsyTLym2ExyDvA2/vpqo0UrP+gjWC1n6apkkWsTREn7DndlW3Iu7nUkiluMqL7ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iVHTRL8Y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55U8DCdk007218
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jun 2025 08:18:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Rc66bHYTPI/p7IZ0Pus6D2
	dADrP9RT9yy52QCOPI1Lk=; b=iVHTRL8Yg/XzdptvTjjKD8BNe78BcmJsX7iWOF
	BSjCA0IuCCX26CEIYf0wgHqjUq1k9ij2iumzb8sOS4Q8joFTkEQ43y7tfQUDsmld
	wWrYDlluETJ6EbU2RL8PpDw4OfO/J8bWMTOgAlIkSTcH1RA8vBNJq8ovypcek9jn
	o6AzaNBsVUgBW4HsaR10Wvs8+afN1h+Hi0J9CSb6yfUELJsiIc6lzkT2mdin99lj
	Gw//K40etSo4sa8vO/g88du4qSMKN0//Ns57DmImoUbFGXEoHpMVbEAvOKGPPVQn
	ef1nHFRVKKs3nANhQvH6jCGefCx7qwY2iWpXDYjvzVR5t6Zg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47kn5j8aen-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jun 2025 08:18:19 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b34ca003f1cso1486301a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jun 2025 01:18:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751271499; x=1751876299;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rc66bHYTPI/p7IZ0Pus6D2dADrP9RT9yy52QCOPI1Lk=;
        b=QDD13ZnQrCnxvCuY9LSQHOw16mexx+HkJgh6xZjFQaX1W2/OcfQlCOysrkWj+juEKV
         koSxQLina094KvvRgUlfsS0US55BBwBYu62iI2e1gA1xIPsS8zR/TMqLZS6GA7M97GO5
         UtTGl+JuRacUyOrj9b4RnorN7ysFy7FWK6I4jgb6sB97QcfLAE/RFBWeRjyQx8GaONuD
         pFNEME1pkx+JLyU/w0zW05EzvGCnix0BWIAxFcLysvxBBssspLznKapi2WfTgq1HX/LB
         Vg5QZrtFOEewLPUzH/gLtQtyOcnUSKrkn2oPBYo86NGs/WGGllmkYadBxyj9A5EJdXV7
         J/7w==
X-Gm-Message-State: AOJu0YwQJwPPJNHUysdLA52B3ZoZ1Rrnd90tHd3Dn7v3AAkfKevzDXZn
	xBj2/xicjYYWSvukc5e2WBKni5jeQsHou0YluRW7QXVHrkJKR81hv44Aj6Jfc3RSVCiHSNvvq+X
	jfzTVxCWaXpNZzlOca3kZ6efREdLjzrw0OWuZ6agbmR6QPK/DXF1sH4I4OjvuNJ8xNr3P
X-Gm-Gg: ASbGnctrC3G4c0pwMR8fs3VZw3xLNklnv8Kk50T7HM48OgHOD6nK8Md5iXRGx1QMno2
	llHsi5XybHzJ5sn17FISjsDqitPppN3ymkwn9hSWmEaCs/jbZfjfDedDwxuAsvesw0wEebKm0Y3
	hcjdFE7EM9eYgN2DNt9jDcJFAEQaN079MDpP9dqNZ7uAzCcajI+lBTxhGWJmWw07ASxgToNJAlC
	2noCsCFP+YANvXAcRlAKXHvgcHGJlgUTv8REe7wYZdMIybfcnelzFYI5WVMb7JzaMG8M9WEgkNM
	cKpJpOseNKC6ZKUekT93Tu3I6kgdaK1/1DBiAH22Gzd8WkRkTOyUuFQWnrrbd4KkomxXW0km0ny
	ILwF3L8v43ztciosByfiXJBApMcwvnfMpeCw8dZp5SOoOqMizbLE654JAuQ==
X-Received: by 2002:a17:903:f8c:b0:235:eb71:a386 with SMTP id d9443c01a7336-23ac4891f49mr149143625ad.50.1751271498837;
        Mon, 30 Jun 2025 01:18:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWoZF96mnX4j/8zWXUha/1qCBVW2RX0RA6Q57/VVYwwQgElx+Du5e3Po+uBinZWgG1E49zAQ==
X-Received: by 2002:a17:903:f8c:b0:235:eb71:a386 with SMTP id d9443c01a7336-23ac4891f49mr149143385ad.50.1751271498439;
        Mon, 30 Jun 2025 01:18:18 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acc9efffbsm75082505ad.42.2025.06.30.01.18.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 01:18:17 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Mon, 30 Jun 2025 13:48:13 +0530
Subject: [PATCH v2] phy: qcom: phy-qcom-m31: Update IPQ5332 M31 USB phy
 initialization sequence
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250630-ipq5332_hsphy_complaince-v2-1-63621439ebdb@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAERIYmgC/3WMQQrCMBBFryKzNiVNm1FceQ+RksSpGWibNNGil
 N7d4MqNmw8P/nsrZEpMGU67FRItnDlMBdR+B86b6U6Cb4VBSaUlNlJwnHXTqM7n6N+dC2McDE+
 OBLb1gdAalLqHosdEPb++6cu1cJ/CKB4+kfkJKv0/uNSiFhJta4+EaB2eQ87V/DRDOY1VGdi2D
 1Yxr0HBAAAA
X-Change-ID: 20250630-ipq5332_hsphy_complaince-6417e6ba605f
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, stable@kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751271495; l=2578;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=Y8jN/q3D+X5TDTIkf0wSzs/H5lU/a3DvR9W6XeQ3BIc=;
 b=vjrnJRd29ID2jcmDJJulZjmLWsEZoHbBs4MrG9fqpnscCMbFmXSRNZnzeXNk5D7J+1k4gdsH+
 9OVSthGDbZxAHdU0+Tu3T6KB5cZjK42bB9hivQe+/2xnGnE6TjdJonc
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Authority-Analysis: v=2.4 cv=KtJN2XWN c=1 sm=1 tr=0 ts=6862484b cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=RRPityp-zi3fFNCXAuIA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: Afdz-gPOOVYUp9O8gIII0y6TLJRMfaPv
X-Proofpoint-GUID: Afdz-gPOOVYUp9O8gIII0y6TLJRMfaPv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDA2OCBTYWx0ZWRfXw7X3PGpEpNNB
 llk1Tb3SesREz44Q3I6CCWwrMB3OI2sZ8BBOmDKjdmWyiy01IM1cirB7GiSjB7tOf69J/p7eSZF
 3XKDewrT5iJSMeSi/CHkfBfgYKx9dJO71Ba4Y01Awxo5vlD0PVOvOj6J5+z27OhPgJMFJB3HUsy
 Toapct2RvnljKDiXusRXQlrrhUxxGqY+BcT4rsvqcPTdRxzfpb1rL9GQFpRFap0IibuXoXKBnd6
 SWeU0f5L2rZESIevvz+iXc2+1QgJdb1URwtNjS5fBvmWWCP/z62Lj89lGUAPWeI7T4oLyIT4P8O
 DoDxTHl4m7gNZ8FwFqEdD5Tn9LqpHq8fQCuftGX3v5Kka8tD4vFNMrXi9vT8jBxNjj4ckSlzk0x
 M9TNM1KOxvRvyYMVVUU0b7PSOLmOzv8cnHrx+E3fjsng+EYbjoM1f9LsQPMuwuQZYxVmPTEL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 mlxscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506300068

The current configuration used for the IPQ5332 M31 USB PHY fails the
Near End High Speed Signal Quality compliance test. To resolve this,
update the initialization sequence as specified in the Hardware Design
Document.

Fixes: 08e49af50701 ("phy: qcom: Introduce M31 USB PHY driver")
Cc: stable@kernel.org
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in V2:
- Used lowercase hex and reoder the definition (Konrad)
- Added a space before the macro HSTX_CURRENT_17_1MA_385MV to
  align with the existing coding style
- Link to v1:
  https://lore.kernel.org/linux-arm-msm/20250625-ipq5332_hsphy_complaince-v1-1-06b4b8e66bc6@oss.qualcomm.com/
---
 drivers/phy/qualcomm/phy-qcom-m31.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-m31.c b/drivers/phy/qualcomm/phy-qcom-m31.c
index 7caeea1b109e922c0cd12e985bc8868d5bce8b4f..168ea980fda03de502dff8bb39134d6f844f28f7 100644
--- a/drivers/phy/qualcomm/phy-qcom-m31.c
+++ b/drivers/phy/qualcomm/phy-qcom-m31.c
@@ -58,14 +58,16 @@
  #define USB2_0_TX_ENABLE		BIT(2)
 
 #define USB2PHY_USB_PHY_M31_XCFGI_4	0xc8
- #define HSTX_SLEW_RATE_565PS		GENMASK(1, 0)
+ #define HSTX_SLEW_RATE_400PS		GENMASK(2, 0)
  #define PLL_CHARGING_PUMP_CURRENT_35UA	GENMASK(4, 3)
  #define ODT_VALUE_38_02_OHM		GENMASK(7, 6)
 
 #define USB2PHY_USB_PHY_M31_XCFGI_5	0xcc
- #define ODT_VALUE_45_02_OHM		BIT(2)
  #define HSTX_PRE_EMPHASIS_LEVEL_0_55MA	BIT(0)
 
+#define USB2PHY_USB_PHY_M31_XCFGI_9	0xdc
+ #define HSTX_CURRENT_17_1MA_385MV	BIT(1)
+
 #define USB2PHY_USB_PHY_M31_XCFGI_11	0xe4
  #define XCFG_COARSE_TUNE_NUM		BIT(1)
  #define XCFG_FINE_TUNE_NUM		BIT(3)
@@ -164,7 +166,7 @@ static struct m31_phy_regs m31_ipq5332_regs[] = {
 	},
 	{
 		USB2PHY_USB_PHY_M31_XCFGI_4,
-		HSTX_SLEW_RATE_565PS | PLL_CHARGING_PUMP_CURRENT_35UA | ODT_VALUE_38_02_OHM,
+		HSTX_SLEW_RATE_400PS | PLL_CHARGING_PUMP_CURRENT_35UA | ODT_VALUE_38_02_OHM,
 		0
 	},
 	{
@@ -174,9 +176,13 @@ static struct m31_phy_regs m31_ipq5332_regs[] = {
 	},
 	{
 		USB2PHY_USB_PHY_M31_XCFGI_5,
-		ODT_VALUE_45_02_OHM | HSTX_PRE_EMPHASIS_LEVEL_0_55MA,
+		HSTX_PRE_EMPHASIS_LEVEL_0_55MA,
 		4
 	},
+	{
+		USB2PHY_USB_PHY_M31_XCFGI_9,
+		HSTX_CURRENT_17_1MA_385MV,
+	},
 	{
 		USB_PHY_UTMI_CTRL5,
 		0x0,

---
base-commit: 1343433ed38923a21425c602e92120a1f1db5f7a
change-id: 20250630-ipq5332_hsphy_complaince-6417e6ba605f

Best regards,
-- 
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>


