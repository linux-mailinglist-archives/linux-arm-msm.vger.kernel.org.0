Return-Path: <linux-arm-msm+bounces-57834-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 266CCAB6A79
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 13:47:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 00BDA7AB145
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 11:46:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E793270EC3;
	Wed, 14 May 2025 11:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="U+YIFnsR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACACD1C3039;
	Wed, 14 May 2025 11:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747223227; cv=none; b=ZL+b+2WJg8PgqMi6bEzrCo/pBohp+UmPxdxIbVQ2hVZ6Yn6ffKEJHltZr9UK66Yna4cFOS0UX4APm5zBLRy9h0/iHeedc+0ea+gO3sRR8fCOD0rcr+1uWMtC393t+T+BT1RpKnQSa3mhLxWG6FHLj2x13PRgtgc4+FksCtOHnwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747223227; c=relaxed/simple;
	bh=T+VyAH6hZHB1SVSCajr1scoJXuo11ZnqUWf8K72GrU0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ljMRofipZAGhJEFyQ8ydXlh4Kqr6YstBtfVNjJ4trVrCNE07zbmysRaUnyn3q+4Dp9J8QWKrLWx+xJrPlqT6IRqeO/Zy5O35dYWx9HdXPlg8nWG7p/725f8rzziF0ViG3ylGjuerj2xlMozVXg7YnpkctV/GqwiDn8u60+gK8DM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=U+YIFnsR; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54E0frgK020269;
	Wed, 14 May 2025 11:47:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=gLUlNc1pS78mRE8k5Ttqo0Sj79prh
	MDmB5dvrp9WOW0=; b=U+YIFnsRkokEl3vRxmrtZL8VLLN21D9JysVF2tWhP7YXP
	a1vFdlgy3GdcSNl8+n3Ybb7KrqyygK0YjA3v8Ge5veL9+SbVbVf+1TVSYI3qnD5e
	CUGwE+aWfWkh+NXOloXO5T1uBDb+iscfbabJmSI21aPrLQ5pEj78/B1mYvhBFkC9
	dU6wAZYMyALUKda0LsfyKIaRcMxKguLfDIUDCaV2Gbsow0WbzI1CmaHfzXEYDOFc
	KvHZAed+31a0R0Vum+fn0uZAD0GtMoq7/j+m4kmpb8VTO/iGNsk8YejsKSqhH+9h
	+V64jDZkFSZ8qXKDSRKgoAiD0i9Y3G04kgANqK2uQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46mbcdsdtw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 14 May 2025 11:47:02 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54EAXwfL004630;
	Wed, 14 May 2025 11:47:01 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46mshj2apt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 14 May 2025 11:47:00 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 54EBl0cA030034;
	Wed, 14 May 2025 11:47:00 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com [10.129.136.47])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 46mshj2ap4-1;
	Wed, 14 May 2025 11:47:00 +0000
From: Alok Tiwari <alok.a.tiwari@oracle.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: alok.a.tiwari@oracle.com, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        stable@vger.kernel.org, darren.kenny@oracle.com
Subject: [PATCH] arm64: dts: qcom: sm8350: Fix typo in pil_camera_mem node
Date: Wed, 14 May 2025 04:46:51 -0700
Message-ID: <20250514114656.2307828-1-alok.a.tiwari@oracle.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 adultscore=0 bulkscore=0
 malwarescore=0 mlxlogscore=809 mlxscore=0 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505070000
 definitions=main-2505140103
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDEwNCBTYWx0ZWRfX0saZAcRG4Bq1 Ul3/SeFWU73MViBa5PjTDyt5oCpHX++R1PCRb0sEjC5gRfJwnMJYYdC0xIGQ4k9k8BPodhfku38 C9amnyySge+D2u1zoqh1JPsdTvhNLsmP3rFbP1a6NfIlApYhid1B2TLd0uHnE3bQQtPaW2JzfIv
 SG3CjisjBWBOwQABqD7hoisK7a4GoD0JvSZ2YpGOVhbM0n7I2SM7gJE5lNkTZ+CBhBcBQWFv2B1 ADSJ/VX2dRJqGZy/vSkUQilsIGyx4effsa0TtZb+n1+LmzXREfWM9Wm4AddqIRkCZyZredr6DVj UA9C3/+TE25juDX2hM9Xb1jWs1VkWNs2bWa8TRxSJ3jeeploboaVwkH+JvBjP4NAgIx3fOsQXjf
 kqsY+bBECqYxNCTCxASxx6AzA4hQt+1ZvtwO3e4tOrDriooKRbCfhF+Sw2CXrlhFbMmyMP3D
X-Authority-Analysis: v=2.4 cv=Y8T4sgeN c=1 sm=1 tr=0 ts=682482b6 b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=yPCof4ZbAAAA:8 a=yw2VYVI5MrybtI__788A:9
X-Proofpoint-GUID: IXraA16JSyXB3nMnUKJY2LpM307rkDTF
X-Proofpoint-ORIG-GUID: IXraA16JSyXB3nMnUKJY2LpM307rkDTF

There is a typo in sm8350.dts where the node label
mmeory@85200000 should be memory@85200000.
This patch corrects the typo for clarity and consistency.

Fixes: b7e8f433a673 ("arm64: dts: qcom: Add basic devicetree support for SM8350 SoC")
Cc: stable@vger.kernel.org
Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index f2e12da13e68..971c828a7555 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -457,7 +457,7 @@ cdsp_secure_heap: memory@80c00000 {
 			no-map;
 		};
 
-		pil_camera_mem: mmeory@85200000 {
+		pil_camera_mem: memory@85200000 {
 			reg = <0x0 0x85200000 0x0 0x500000>;
 			no-map;
 		};
-- 
2.47.1


