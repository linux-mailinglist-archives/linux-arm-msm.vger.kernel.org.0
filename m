Return-Path: <linux-arm-msm+bounces-65689-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 35CD8B0A858
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 18:21:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E12D7A46194
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 16:20:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B0961DE2B4;
	Fri, 18 Jul 2025 16:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lFlfwSoq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 791EE2E2658
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 16:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752855670; cv=none; b=cbZqTMdiONzvPqJnh8l57ITx5QjvmmXDO1SdKxf9+0iBWehUm8311qsK+UD16lrt9wzBU+no25zRTrodUAdQpPWec/L8vIE5sBijZ+KvXVBvnOFe1Xa/PWq30V4/3w4sTtrNq5dO/aBfpOiU3oDyQ1PQfwy8xZZf61BrPPySeDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752855670; c=relaxed/simple;
	bh=PQ8nep6+2CkJ/XSkB12+zBFIYToc6uVoayIbLHk7IAM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u0mrrOvPLYM6jxZsewOtpnkxvlQPAtxlxVAbMdyZ3CcQLRBiNoFLAaUSt5U/TAAqN2BPyyBGI8zGwtNJhxKpMFvkJ58Hbf8jW0MzjHsQ6EySIPSNDIL9gK9zg6QLiwNgSXxaVRs5mpwq+6C01Yhiar79Xvc89tqYRWr4NmYDUt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lFlfwSoq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56IEHH3O022256
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 16:21:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ToUWdrHOvvzd4l32npkLp+sN31SJLS2F6Ly2KepaknI=; b=lFlfwSoqDHT1TY1N
	VPEpLTcEsQtxZCs2qakOqXo/4ZER0prB+NxDrImd7sC0xU/hVDdjShNNnum9zcZF
	aCjaC7xXWvkJjnSfUsOXACWK5cQXFNYND76q5nMK9ieBfDWg5XtNeZxR+P6OD44s
	SRMWUo8dEoVnvsi43HyEEUc8J1Ccq7tPcMBrkLYHlX0igLWdG7bKGGL4Frd5RChC
	/FsjUWLnUUdAZGwtJ+fCIUMolrgs6dvm5GF1Iv486KHKKMdGhKo1OTxVsKLxI2Xu
	DMf+QX1ky0LEAaeFCfPWgobHuGjZxTN3EdCS89zTcL0TsMtyTp0J4RIdmJkajngb
	f178SA==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wqsyc87j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 16:21:08 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-73e633ec148so1631976a34.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 09:21:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752855667; x=1753460467;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ToUWdrHOvvzd4l32npkLp+sN31SJLS2F6Ly2KepaknI=;
        b=t8t0TSCWpG+MM/PFHjm/V3s74+PHfNmip5EMybL4RAyg6cZzABPhckFehwFuHRGgH7
         JlC2k0rcnWO4cgQtlkH3c/U2LNNJKdj3Tk7JI4SvXDIT+BLsSYxjxFN8GCe44ETDtosh
         Dc5sDjSe5RnVR0+ks2/KknL3tzMW/YKR5onWMXoZqhlehtqS9lfzUX9XLyU8MPPGwRh1
         z/aCt/RFkgBz/Zmp3WaAyfhNWo2JYSkW7Vnak/xURUuN9MI+rsK8F13UoOIEXwEb4Fsy
         o6nzwKzdCaBrNmje3D4oJnGk200YRF9mMGAYCy3UU7RLtYla8PJ27mDPahrVm/UwcUP5
         iYwg==
X-Gm-Message-State: AOJu0YzDwY/TtlLvhRaOYxehKMVy1eD6qiVqi1eYZKAUzoSZ2k+VR/Sw
	nwL2dXR9d2JnG+sr1D94agKsVorJfpGct3KoiOQ9TwFvLNCkA3jlkEdfKEUFeidtUnEHe3bwTWA
	hnzRpjvaS2MlCeDmNyqqycmiDN6MmZYwx/jLwUF59C2Sqlge+AJuVutzqGdh7gqL0b8bW/0oA6u
	XA
X-Gm-Gg: ASbGncufY/JDYI+a+c6AgwzkRuVsUSCdKam4GP6cM4y/Vd5pe0vhyafEelYNfAZR7Xo
	Wrg7Sp8N0UIkEVCt8nocuhWJB2YWxPPAbWLWeHjqoRjCoJ5h3Bbg2RROn2wr4KGvcvGnfJkBmb8
	57+X/DJB5P/62uJbWc9vtQLLrZHYNtlUZokGK515fehGnCGt2gYi2DommbQTNDa6GD7jEa1ctPW
	I4/f/3BVZYfOc3DJYnyDQRKnnz6aYmLBE/vegfOrQpK3J8jDsYdkwtoKpe2t41ZEN831sx54QEJ
	J75LjXp3q/nPtSDrOrq3FzBJhTDfpyWNVdReJ9pwtrhO8Bembw3qEF4IALAfOY80A/mCYeEgKrh
	lyh6PceL81pJKAO42q/zm6OPAZu6SKNt1cRvyBBGEo1u4ZEmOfQTn
X-Received: by 2002:a05:620a:2947:b0:7e3:3d2e:1f08 with SMTP id af79cd13be357-7e34361b247mr1657432785a.45.1752855232940;
        Fri, 18 Jul 2025 09:13:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1YG0jt9yWFaIGUj666c/NtISkNC4WDZgTnNihtZZCDJ9bbquyIoF7UFwFofEUy4lFvuRhlg==
X-Received: by 2002:a05:620a:2947:b0:7e3:3d2e:1f08 with SMTP id af79cd13be357-7e34361b247mr1657424385a.45.1752855232184;
        Fri, 18 Jul 2025 09:13:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-330a91c1ab7sm2388131fa.50.2025.07.18.09.13.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 09:13:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 18 Jul 2025 19:13:42 +0300
Subject: [PATCH 4/8] pmdomain: qcom: rpmpd: switch to RPMPD_* indices
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250718-rework-rpmhpd-rpmpd-v1-4-eedca108e540@oss.qualcomm.com>
References: <20250718-rework-rpmhpd-rpmpd-v1-0-eedca108e540@oss.qualcomm.com>
In-Reply-To: <20250718-rework-rpmhpd-rpmpd-v1-0-eedca108e540@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6484;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=PQ8nep6+2CkJ/XSkB12+zBFIYToc6uVoayIbLHk7IAM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoenK31D+ET4JXXb3RpsdqeFLE9iRYlmTx+o5vX
 ICQ4VXeLs+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaHpytwAKCRCLPIo+Aiko
 1fRAB/9veeHp8Lre9JqC3BHTf4Nu8Ske2qUokDoR2mCLk5a+g2oDWpJ43Kawe0+mF9OZ1wj4fL6
 zd9gj0ES6Z9YD6oEYng7H4tFZTDyaQLMw2D2KfDaqqDJGjM7uIH359YYbW3pHp5zSfH5ShNecAU
 VmSLQIZoS7w8+RGPEhPUKtaW5fKo8PlPX8qWmUl1mEnLIqrPZB/QAY0KivUlQLZdvDXdvAQKboE
 jWKvPZ+sH9c0hfJfnYl4uygNzrNpmrmNPI/XQ+g55mES+E9+4DZOU5BcMBoc+9kX9gZyZ36Ep4V
 IaBVJ9Xb2I5S1oIz4beNVjJNTTI8FNEUxVI27jAkBIPHcEnb
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDEyOCBTYWx0ZWRfXxzKn8it/w098
 AQiT7nHjdkeqRqyA/q5r50md9oqjo6MS/Sor5dBrIX9xFORCqhYGGXXCpE2eIKLkDPMWHy8xFM7
 4Q6Jn5CdkPiHKdubCgvIO3DoLQV2Gv31bfzb8+WfkPwc4vylYvqqN8YpwF1g2HVuL/x7lXaF2J3
 IaJdn3xLNhJbCtA1A7qspAaFN3GpXl2Iy87nvpCIg4CuI8UBG/s39SwDbMdfM4DVlbrl4r/IOJ/
 wt4u4i50jGQUrJkMHVzbaZM/31dx/s8B/olQtMSKsoC91+4+9zs2/Ni3pPuoD/ed8YTQIh/1a6T
 8uAzTqOczIlJT5xu39MSp0zO6HcsMzsrTH6/IJBkhffdZQpClDpzUmUnc0Ipz2oJQ6GQsS6kgCa
 H9x6FWqXxBvmAlcgwyisTE+GLiHsKoqP10zqPaiPGYq59+6PO3Vn/d8ivuCJ6qJeYD/kxj8M
X-Proofpoint-GUID: q5R6tGBfdNk-bCikr1Qp9fH-pcDwkPOT
X-Proofpoint-ORIG-GUID: q5R6tGBfdNk-bCikr1Qp9fH-pcDwkPOT
X-Authority-Analysis: v=2.4 cv=McZsu4/f c=1 sm=1 tr=0 ts=687a7474 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=9OzbfAs58j7jRePA22kA:9 a=QEXdDO2ut3YA:10
 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_03,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxlogscore=910 impostorscore=0 mlxscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507180128

Use generic RPMPD_* defines for power domain instead of using
platform-specific defines for the platforms that use shared indices.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/pmdomain/qcom/rpmpd.c | 112 +++++++++++++++++++++---------------------
 1 file changed, 56 insertions(+), 56 deletions(-)

diff --git a/drivers/pmdomain/qcom/rpmpd.c b/drivers/pmdomain/qcom/rpmpd.c
index 833c46944600faa641d44ebe85db17280bb927b1..f8580ec0f73785544aeb6f686438f39b477d134d 100644
--- a/drivers/pmdomain/qcom/rpmpd.c
+++ b/drivers/pmdomain/qcom/rpmpd.c
@@ -631,12 +631,12 @@ static struct rpmpd ssc_mx_rwsm0_vfl = {
 };
 
 static struct rpmpd *mdm9607_rpmpds[] = {
-	[MDM9607_VDDCX] =	&cx_s3a_lvl,
-	[MDM9607_VDDCX_AO] =	&cx_s3a_lvl_ao,
-	[MDM9607_VDDCX_VFL] =	&cx_s3a_vfl,
-	[MDM9607_VDDMX] =	&mx_l12a_lvl,
-	[MDM9607_VDDMX_AO] =	&mx_l12a_lvl_ao,
-	[MDM9607_VDDMX_VFL] =	&mx_l12a_vfl,
+	[RPMPD_VDDCX] =		&cx_s3a_lvl,
+	[RPMPD_VDDCX_AO] =	&cx_s3a_lvl_ao,
+	[RPMPD_VDDCX_VFL] =	&cx_s3a_vfl,
+	[RPMPD_VDDMX] =		&mx_l12a_lvl,
+	[RPMPD_VDDMX_AO] =	&mx_l12a_lvl_ao,
+	[RPMPD_VDDMX_VFL] =	&mx_l12a_vfl,
 };
 
 static const struct rpmpd_desc mdm9607_desc = {
@@ -646,9 +646,9 @@ static const struct rpmpd_desc mdm9607_desc = {
 };
 
 static struct rpmpd *msm8226_rpmpds[] = {
-	[MSM8226_VDDCX] =	&cx_s1a_corner,
-	[MSM8226_VDDCX_AO] =	&cx_s1a_corner_ao,
-	[MSM8226_VDDCX_VFC] =	&cx_s1a_vfc,
+	[RPMPD_VDDCX] =		&cx_s1a_corner,
+	[RPMPD_VDDCX_AO] =	&cx_s1a_corner_ao,
+	[RPMPD_VDDCX_VFC] =	&cx_s1a_vfc,
 };
 
 static const struct rpmpd_desc msm8226_desc = {
@@ -675,11 +675,11 @@ static const struct rpmpd_desc msm8939_desc = {
 };
 
 static struct rpmpd *msm8916_rpmpds[] = {
-	[MSM8916_VDDCX] =	&cx_s1a_corner,
-	[MSM8916_VDDCX_AO] =	&cx_s1a_corner_ao,
-	[MSM8916_VDDCX_VFC] =	&cx_s1a_vfc,
-	[MSM8916_VDDMX] =	&mx_l3a_corner,
-	[MSM8916_VDDMX_AO] =	&mx_l3a_corner_ao,
+	[RPMPD_VDDCX] =		&cx_s1a_corner,
+	[RPMPD_VDDCX_AO] =	&cx_s1a_corner_ao,
+	[RPMPD_VDDCX_VFC] =	&cx_s1a_vfc,
+	[RPMPD_VDDMX] =		&mx_l3a_corner,
+	[RPMPD_VDDMX_AO] =	&mx_l3a_corner_ao,
 };
 
 static const struct rpmpd_desc msm8916_desc = {
@@ -689,11 +689,11 @@ static const struct rpmpd_desc msm8916_desc = {
 };
 
 static struct rpmpd *msm8917_rpmpds[] = {
-	[MSM8917_VDDCX] =	&cx_s2a_lvl,
-	[MSM8917_VDDCX_AO] =	&cx_s2a_lvl_ao,
-	[MSM8917_VDDCX_VFL] =	&cx_s2a_vfl,
-	[MSM8917_VDDMX] =	&mx_l3a_lvl,
-	[MSM8917_VDDMX_AO] =	&mx_l3a_lvl_ao,
+	[RPMPD_VDDCX] =		&cx_s2a_lvl,
+	[RPMPD_VDDCX_AO] =	&cx_s2a_lvl_ao,
+	[RPMPD_VDDCX_VFL] =	&cx_s2a_vfl,
+	[RPMPD_VDDMX] =		&mx_l3a_lvl,
+	[RPMPD_VDDMX_AO] =	&mx_l3a_lvl_ao,
 };
 
 static const struct rpmpd_desc msm8917_desc = {
@@ -747,12 +747,12 @@ static const struct rpmpd_desc msm8974pro_pma8084_desc = {
 };
 
 static struct rpmpd *msm8976_rpmpds[] = {
-	[MSM8976_VDDCX] =	&cx_s2a_lvl,
-	[MSM8976_VDDCX_AO] =	&cx_s2a_lvl_ao,
-	[MSM8976_VDDCX_VFL] =	&cx_rwsc2_vfl,
-	[MSM8976_VDDMX] =	&mx_s6a_lvl,
-	[MSM8976_VDDMX_AO] =	&mx_s6a_lvl_ao,
-	[MSM8976_VDDMX_VFL] =	&mx_rwsm6_vfl,
+	[RPMPD_VDDCX] =		&cx_s2a_lvl,
+	[RPMPD_VDDCX_AO] =	&cx_s2a_lvl_ao,
+	[RPMPD_VDDCX_VFL] =	&cx_rwsc2_vfl,
+	[RPMPD_VDDMX] =		&mx_s6a_lvl,
+	[RPMPD_VDDMX_AO] =	&mx_s6a_lvl_ao,
+	[RPMPD_VDDMX_VFL] =	&mx_rwsm6_vfl,
 };
 
 static const struct rpmpd_desc msm8976_desc = {
@@ -796,16 +796,16 @@ static const struct rpmpd_desc msm8996_desc = {
 };
 
 static struct rpmpd *msm8998_rpmpds[] = {
-	[MSM8998_VDDCX] =	&cx_rwcx0_lvl,
-	[MSM8998_VDDCX_AO] =	&cx_rwcx0_lvl_ao,
-	[MSM8998_VDDCX_VFL] =	&cx_rwcx0_vfl,
-	[MSM8998_VDDMX] =	&mx_rwmx0_lvl,
-	[MSM8998_VDDMX_AO] =	&mx_rwmx0_lvl_ao,
-	[MSM8998_VDDMX_VFL] =	&mx_rwmx0_vfl,
-	[MSM8998_SSCCX] =	&ssc_cx_rwsc0_lvl,
-	[MSM8998_SSCCX_VFL] =	&ssc_cx_rwsc0_vfl,
-	[MSM8998_SSCMX] =	&ssc_mx_rwsm0_lvl,
-	[MSM8998_SSCMX_VFL] =	&ssc_mx_rwsm0_vfl,
+	[RPMPD_VDDCX] =		&cx_rwcx0_lvl,
+	[RPMPD_VDDCX_AO] =	&cx_rwcx0_lvl_ao,
+	[RPMPD_VDDCX_VFL] =	&cx_rwcx0_vfl,
+	[RPMPD_VDDMX] =		&mx_rwmx0_lvl,
+	[RPMPD_VDDMX_AO] =	&mx_rwmx0_lvl_ao,
+	[RPMPD_VDDMX_VFL] =	&mx_rwmx0_vfl,
+	[RPMPD_SSCCX] =		&ssc_cx_rwsc0_lvl,
+	[RPMPD_SSCCX_VFL] =	&ssc_cx_rwsc0_vfl,
+	[RPMPD_SSCMX] =		&ssc_mx_rwsm0_lvl,
+	[RPMPD_SSCMX_VFL] =	&ssc_mx_rwsm0_vfl,
 };
 
 static const struct rpmpd_desc msm8998_desc = {
@@ -831,11 +831,11 @@ static const struct rpmpd_desc qcs404_desc = {
 };
 
 static struct rpmpd *qm215_rpmpds[] = {
-	[QM215_VDDCX] =		&cx_s1a_lvl,
-	[QM215_VDDCX_AO] =	&cx_s1a_lvl_ao,
-	[QM215_VDDCX_VFL] =	&cx_s1a_vfl,
-	[QM215_VDDMX] =		&mx_l2a_lvl,
-	[QM215_VDDMX_AO] =	&mx_l2a_lvl_ao,
+	[RPMPD_VDDCX] =		&cx_s1a_lvl,
+	[RPMPD_VDDCX_AO] =	&cx_s1a_lvl_ao,
+	[RPMPD_VDDCX_VFL] =	&cx_s1a_vfl,
+	[RPMPD_VDDMX] =		&mx_l2a_lvl,
+	[RPMPD_VDDMX_AO] =	&mx_l2a_lvl_ao,
 };
 
 static const struct rpmpd_desc qm215_desc = {
@@ -845,16 +845,16 @@ static const struct rpmpd_desc qm215_desc = {
 };
 
 static struct rpmpd *sdm660_rpmpds[] = {
-	[SDM660_VDDCX] =	&cx_rwcx0_lvl,
-	[SDM660_VDDCX_AO] =	&cx_rwcx0_lvl_ao,
-	[SDM660_VDDCX_VFL] =	&cx_rwcx0_vfl,
-	[SDM660_VDDMX] =	&mx_rwmx0_lvl,
-	[SDM660_VDDMX_AO] =	&mx_rwmx0_lvl_ao,
-	[SDM660_VDDMX_VFL] =	&mx_rwmx0_vfl,
-	[SDM660_SSCCX] =	&ssc_cx_rwlc0_lvl,
-	[SDM660_SSCCX_VFL] =	&ssc_cx_rwlc0_vfl,
-	[SDM660_SSCMX] =	&ssc_mx_rwlm0_lvl,
-	[SDM660_SSCMX_VFL] =	&ssc_mx_rwlm0_vfl,
+	[RPMPD_VDDCX] =		&cx_rwcx0_lvl,
+	[RPMPD_VDDCX_AO] =	&cx_rwcx0_lvl_ao,
+	[RPMPD_VDDCX_VFL] =	&cx_rwcx0_vfl,
+	[RPMPD_VDDMX] =		&mx_rwmx0_lvl,
+	[RPMPD_VDDMX_AO] =	&mx_rwmx0_lvl_ao,
+	[RPMPD_VDDMX_VFL] =	&mx_rwmx0_vfl,
+	[RPMPD_SSCCX] =		&ssc_cx_rwlc0_lvl,
+	[RPMPD_SSCCX_VFL] =	&ssc_cx_rwlc0_vfl,
+	[RPMPD_SSCMX] =		&ssc_mx_rwlm0_lvl,
+	[RPMPD_SSCMX_VFL] =	&ssc_mx_rwlm0_vfl,
 };
 
 static const struct rpmpd_desc sdm660_desc = {
@@ -881,12 +881,12 @@ static const struct rpmpd_desc sm6115_desc = {
 };
 
 static struct rpmpd *sm6125_rpmpds[] = {
-	[SM6125_VDDCX] =	&cx_rwcx0_lvl,
-	[SM6125_VDDCX_AO] =	&cx_rwcx0_lvl_ao,
-	[SM6125_VDDCX_VFL] =	&cx_rwcx0_vfl,
-	[SM6125_VDDMX] =	&mx_rwmx0_lvl,
-	[SM6125_VDDMX_AO] =	&mx_rwmx0_lvl_ao,
-	[SM6125_VDDMX_VFL] =	&mx_rwmx0_vfl,
+	[RPMPD_VDDCX] =		&cx_rwcx0_lvl,
+	[RPMPD_VDDCX_AO] =	&cx_rwcx0_lvl_ao,
+	[RPMPD_VDDCX_VFL] =	&cx_rwcx0_vfl,
+	[RPMPD_VDDMX] =		&mx_rwmx0_lvl,
+	[RPMPD_VDDMX_AO] =	&mx_rwmx0_lvl_ao,
+	[RPMPD_VDDMX_VFL] =	&mx_rwmx0_vfl,
 };
 
 static const struct rpmpd_desc sm6125_desc = {

-- 
2.39.5


