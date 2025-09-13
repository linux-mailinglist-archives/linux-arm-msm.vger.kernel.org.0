Return-Path: <linux-arm-msm+bounces-73405-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52698B5628E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Sep 2025 20:30:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 06C913AD57B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Sep 2025 18:30:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7192A193077;
	Sat, 13 Sep 2025 18:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="YDu11OzL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF1D5347DD;
	Sat, 13 Sep 2025 18:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757788228; cv=none; b=AzQqrro8jwQ8YFMDyO9ukXLOsZwLvwAsP3mKFAsYxYHETbNE+nNj6gMiHMV+AzVm5MnxZBqk0qIvIOYb6TeV9tMunOFbeqVNEF94ZADvNgN+JpE8I02HEz/4huWb71zaY9ksi1AAhK2GlEalGckr1d2DijGwsi1QQywZqLjSFNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757788228; c=relaxed/simple;
	bh=wuvzFCkqli/0xf0TVmA/w1KTuF9CpGNz+KMcjEPOXnw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Hk/u+n1/SxK9QVEtKIDeeYprC49gn0A6QPavqTUEZxbVmr+r4I4WPLGOBVngu2b4CPlUJS8JiPzjAaSok5CaoM9O7eCl9Ccf8M2X2p+VKEZqMNJPf6R5XgWJM9g+XPMXB4ka4zv+M5sBd2x0qHpTn1WgTK9o6n+gDjsXnBErx+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=YDu11OzL; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58DHC3BM015943;
	Sat, 13 Sep 2025 18:30:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=LKTzAdk2Stdh7zQ6jdVXsotbXpiw0
	+yczyvNwKCQj6Y=; b=YDu11OzLi8tPRZyl0XxtKsdYpeMNl8DPOq8M+58ZGri4f
	YGGc1oAFENakITtdB6RvayeuVkm+a0NFENrLVor3GYrsg9D32Ihywk4JSXLMYlt5
	R8fQSdHK/qx+9zPgKLD1A0XuqRbI4qcEqaXSxxA7wBllIinS0+pF6o0umCoe+Bq5
	+dU3BQcTgU/GY8aIE8AQ7Jo1Xu/jmP6uQZiA/YcTAgdOmNFZd+p6mKAYWi7s5x9g
	5i2tCekZz0FgDY0zS0CSu1BiOnQJOlm4QfZCxVrguC/6L4eWyQesK4ivSRg6GlMm
	79RaYryWovNOt2cdZJYj3GoVfzaGAIaHpkchLs48Q==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 494y1fgfgm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 13 Sep 2025 18:30:22 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58DDEZSh019162;
	Sat, 13 Sep 2025 18:30:21 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 494y29x687-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 13 Sep 2025 18:30:21 +0000
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 58DIULld012055;
	Sat, 13 Sep 2025 18:30:21 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com [10.129.136.47])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 494y29x67y-1;
	Sat, 13 Sep 2025 18:30:21 +0000
From: Alok Tiwari <alok.a.tiwari@oracle.com>
To: konrad.dybcio@oss.qualcomm.com, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, devicetree@vger.kernel.org
Cc: alok.a.tiwari@oracle.com, linux-arm-msm@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: sm8150: Fix frame@17c27000 unit address
Date: Sat, 13 Sep 2025 11:30:11 -0700
Message-ID: <20250913183018.4017208-1-alok.a.tiwari@oracle.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-13_06,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 phishscore=0
 suspectscore=0 spamscore=0 mlxscore=0 adultscore=0 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2508110000 definitions=main-2509130177
X-Proofpoint-ORIG-GUID: 9_uryYb1bhtW642eVHMZcrn8qktzit15
X-Authority-Analysis: v=2.4 cv=KNpaDEFo c=1 sm=1 tr=0 ts=68c5b83e cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=yJojWOMRYYMA:10 a=yPCof4ZbAAAA:8 a=bWo_ig8JLHCbm4XOoeEA:9
X-Proofpoint-GUID: 9_uryYb1bhtW642eVHMZcrn8qktzit15
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAxMiBTYWx0ZWRfX4uEd2+Xt6r7q
 hJyjKxiXEYItnW/f9cw3bLkvlBlA5k7QNyJhlDKK5+cMaqGqEcp49GDNxJ0wDO5TPpc8KvKEpnE
 xtZ3RQiaTNpAgWQ5vTNQk2XuIW2HqjJ/LfUOQH4LiyEdIS+atJeS098/OQHW/ckB8QXZu+IvugF
 hNIGDd6D9rkuxctIkp4UH/vLOzveKcvh/LAy9qmQf6QbFnNfxk+LDDrLl8c+9HkTd7GPsBSoiMY
 Y9NRNhJmFT6wx28febjsD0ofGUgPC8QEmOdKG3gmWyqQA27JhvGPhk/zL/+G3AbakSomPHWZ9nI
 pE5qyzinjbvN7ekpfivAJzmzPA1BXkWUjxCrYr4+SWBEcA+tzxGtXxzktmUDX57b9yQp0X2swa6
 mNY5/bNy

The frame@17c27000 node has a reg property of <0x17c26000 0x1000>.
According to Devicetree binding rules, the unit address in the node
name must match the base address in reg property.

Update the node name to frame@17c26000 to match the reg property and
align with other frame nodes.

Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index abf12e10d33f..166326830cdb 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -4416,7 +4416,7 @@ frame@17c25000 {
 				status = "disabled";
 			};
 
-			frame@17c27000 {
+			frame@17c26000 {
 				frame-number = <3>;
 				interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
 				reg = <0x17c26000 0x1000>;
-- 
2.50.1


