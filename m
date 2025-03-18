Return-Path: <linux-arm-msm+bounces-51729-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D14BA674F0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 14:24:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C5123189E75F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 13:23:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 530CB20E339;
	Tue, 18 Mar 2025 13:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EIt/uQwp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45AC620E31B
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 13:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742304136; cv=none; b=mPFGOB1y/01bSIhYd4J/odGAuPsZHzZNIBpkmRnSsmko0FI3AyjJ2wXOWN0bQ8Cg1AoiJ5z62tWCyFEKmZ2LfUaBMBQxqQmE1uNdkeZ/qLiY2WMBcH7sukVer2ECCFX+TEfeDhvDCso8hD6GpMv5V+eSGOyIAHfWM27kt64hbGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742304136; c=relaxed/simple;
	bh=A5b+7PiOzdnEsoIXhJtEDtIF4/+zzwMq2jbAcRXdx6A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WixoHlQJuoJgq69VJjXnWNRjHPywDFHzghC0w5/0RSpVN2G4tWLAE/yKTAU4PLhg0NDbuGI8c59cBxFIMRWzOLExWEw/ETLiMfTTBsi3Ew+0ON4UV4Nzs7yvUh/YeGn27W4THjmN+6hQJYxoa1iF9O5VxEjmpMcgkJnc06o+7Mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EIt/uQwp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52IAX19M020505
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 13:22:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	90Qa8a9JOpfX6xK3iRiQYBwU2Lz8sFA7p1khs43FFPw=; b=EIt/uQwplWImJTR8
	9zCTrhS/qn82m3ayFhZvwjwBOyGJllUs94349vVEZZ4WpiezGeTrlxwrgEhlUPI3
	uoHOiCUwLh7qOAJhRgLzJefe15yvBE7JAMfLUR5M6oQov8V7Do0lLgc1gD5WW8GJ
	44Srqgdv8zgxmKOq3LEaSnEybTtBZfDGLe41LTglVDxahqnO3ZFH5q+Jl2wsxQOo
	9lkx5FjbsD5TvIkr0HSmD637LXhLN6CEblgV8J87pskJT4OQXxZkyBRD3VKlrD6p
	JkJFF+XC6IgaDHJgUM9it2UXjKjR03ov2/b6UF/DakvjqKXqLyH46AGlltGkPoyj
	CWA5Ig==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45exxbhxg7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 13:22:13 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4767e6b4596so107737181cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 06:22:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742304132; x=1742908932;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=90Qa8a9JOpfX6xK3iRiQYBwU2Lz8sFA7p1khs43FFPw=;
        b=iIzZW31XnQcI2dUsYk9yC0PHYUnalnAyyz28VRCaDjBDQRy+plDdleOSlls4E96s88
         H0wRNgPkDmGWhhEh+yvaq+DigG3hsVI7p3Fy6r4iYXxYF6VC0ee1iE/3khahMtNWGzBa
         VREwVRR+PXk0ZZRjDmTmbcYFz2t02i9joJ4A1rESp+5f0Z3wRXMnBjvEheoarZYpe0/B
         2/r+Okid/2DlA5HtRuJ9hiejHHvEAyUSAL0tIcg2Wbcmy5EQ4D19v4u99jeDS07oWQwM
         1fH5QeEo8EVgTSoYOml8eNt8MyWpAPyGYaRpx5nvlxxCgvFe3dA05HMkkEZrA/VDSKmB
         Ibmw==
X-Gm-Message-State: AOJu0Yx5DKf9lJt5tgUqbr4NQ5zPufPxPKo/moScF9dHGQm5CEDNXMn6
	dZIppdI2L5j3AVmWEKW4j8hR1xNWIHjcRhOq1FemlxkWcDnZqSLjJ2BRxOyi8hvfHQCjLL7jmFT
	CkCKapUwrjKVrlL4fPFa372QlnpKC9E8x06RcklD2YrrXlrUq/OsaFh+KmNOumq4d
X-Gm-Gg: ASbGncsnff8PabnP8uzFBbHTJvnHqZLbYLvlMHIo2wG/JVw5Ri1VXUupX4eqEdRlLke
	qZNNRgBQcED7dgHHZavkVPm1k7c4gvg2VdH//BM4zs9qE8frEw3MvKE3vQlgs3DRENHzd6tWxxo
	fprWYaGwkcPAhwNQIu3JUVFdry5oyzgheg4qaYbKv+qMJHkmsi3YFzx2sr3ndKRXDa5AUmvuSRe
	zl9ifJtDKB7yu6sJ86qsCcQrGEnL1m/MdjrrOIpfUhxjRV63lDPmnKHC6pKAol5qfEsleXmSTMo
	ECj6ruhaLVZKe9J4/6W8sBmXYwrHPdCfXcRj1aH1pz7s1hilBPzgol8HXgY9tTAZtMK3RnPEiu5
	vPIhf1PsAYMFar3LDzRpybRWdUtp2
X-Received: by 2002:a05:622a:13ce:b0:476:a74d:f23b with SMTP id d75a77b69052e-476c81edf41mr217060291cf.48.1742304132084;
        Tue, 18 Mar 2025 06:22:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG3cOhI/uaSCyn0dHPO8pflDCmqzgUPHvz/xK7Lgn/iw9/ohToEyaGvfEydfUSRss7Lc4O3yg==
X-Received: by 2002:a05:622a:13ce:b0:476:a74d:f23b with SMTP id d75a77b69052e-476c81edf41mr217059861cf.48.1742304131746;
        Tue, 18 Mar 2025 06:22:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba8a79c4sm1664831e87.226.2025.03.18.06.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 06:22:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 18 Mar 2025 15:21:59 +0200
Subject: [PATCH v2 06/10] ARM: dts: qcom: apq8064: add missing clocks to
 the timer node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250318-fix-nexus-4-v2-6-bcedd1406790@oss.qualcomm.com>
References: <20250318-fix-nexus-4-v2-0-bcedd1406790@oss.qualcomm.com>
In-Reply-To: <20250318-fix-nexus-4-v2-0-bcedd1406790@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Lee Jones <lee@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan <leo.yan@linux.dev>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=945;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=A5b+7PiOzdnEsoIXhJtEDtIF4/+zzwMq2jbAcRXdx6A=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn2XN1GNH7XEZ/cKYsIbOrr56agd3ol4ShkdTzA
 NU7LHgC1bGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ9lzdQAKCRCLPIo+Aiko
 1QSVCACCx/SRir78Lqxpwe2gj/DnNHmZ78WE7r/CnzspxSjw6HD62EeTXRvoWunYl67EbK+lxae
 64Mnsdd3r+qo/eI9qE+skbsKEG32/VGJy+58d/98ZTbBcy923r08CiicvsR+kDNCcdNHobyjaI3
 u+qm3Utr1pOvTz+Lh0RrCNCd3Zb8wmb3Vmomvo9w341VTwIIG2PXGmLs7RBm1Ppm3uhUYhcYza1
 0r6Wd/Qgq8ripF/dL25lQlAAIFSPt/IJzptrL24gjyLddCjdBadIdNqM78ErystrwTtLVpfSffV
 WUWaN337ADz2EGHX3c7Pxfz3ePYNK2SHrpSHBmbjiW4RzhUM
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=QN1oRhLL c=1 sm=1 tr=0 ts=67d97385 cx=c_pps a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=ZANWpg7mVWKCtM2BIo8A:9 a=QEXdDO2ut3YA:10 a=mjqSHpV9Z7kWhFShES6D:22
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: cBdUaUKxIYCl9eRA61SHh1nAq84ZuuHv
X-Proofpoint-GUID: cBdUaUKxIYCl9eRA61SHh1nAq84ZuuHv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_06,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 phishscore=0 spamscore=0 impostorscore=0 suspectscore=0 mlxlogscore=855
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 adultscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503180099

In order to fix DT schema warning and describe hardware properly, add
missing sleep clock to the timer node.

Fixes: f335b8af4fd5 ("ARM: dts: qcom: Add initial APQ8064 SoC and IFC6410 board device trees")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
index 5f1a6b4b764492486df1a2610979f56c0a37b64a..ba99e794dcd2236f65f2f3d8c49213cfdaee5f6e 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
@@ -326,6 +326,8 @@ timer@200a000 {
 				     <GIC_PPI 3 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_EDGE_RISING)>;
 			reg = <0x0200a000 0x100>;
 			clock-frequency = <27000000>;
+			clocks = <&sleep_clk>;
+			clock-names = "sleep";
 			cpu-offset = <0x80000>;
 		};
 

-- 
2.39.5


