Return-Path: <linux-arm-msm+bounces-71845-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7C0B41E10
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 14:00:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 79E7F1A85020
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 12:00:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1C152FF66C;
	Wed,  3 Sep 2025 11:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bzIUovPG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B69C2FF177
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Sep 2025 11:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756900720; cv=none; b=gxM9bsPx20iRLDgtg/047T/WaXyHx0XeAJqVfi/GhBDD5JDp1Re1jCz8jFYfHFQHPeJKeL3jndiDEkO4F2lwcfX1257LS8L5ImWLT6NglyermJUwrHy+PAMfyvvGAlM58s6bNpTWBSCT3ggchyLARUIqxjTcEtb3N88C+De7OTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756900720; c=relaxed/simple;
	bh=yuqF992JkLqD1kIJyjnt6Zn+nJH3RP1HSBd3vUxQH58=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ea1p8d7u2OB29cg/5mrKakHl0skDXHaHVRvCvucp4B1n8Yvez4z3eTJDdQ2qXSfAPsqcNPqFN70mjVxtlq4DjOQVs+1leR5+iu1YGrETpmZXq/hve88PVf1nafM6HJmK7qe07ruBx/CH3Atz/CYia7kJLd84E4e+DQ5XxuHDqWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bzIUovPG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583BFpAE012558
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Sep 2025 11:58:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xQ0VgVzHDcE4uOAStGZ5b6EnRBy9KiNlbxxY6hsWIic=; b=bzIUovPG3BMXIJE3
	naUIFc+2DyPMw2h+LczbgGu1jclHsoN8VCUQ+yFZNrezB3UtBKPEMf04Hv9R5mIp
	O6hYIF4y547t/h1UcoLdQDldYBLANhwlyo1Xp3edIhG39G7ryBbi/YbNX1Dg9fGu
	Gigro37yurymbGug5g5wlU6/aiMSVr80teukh+T2EQO23Iz4dlDNrXfxwoecRO0k
	D+Ob/lLffUstSgWCW2FBgrRZ6CMO0f1DKLu/sj9umM745FVI1hbslap0o3oQTWaU
	WRuqOvkDMnyKrIvFRSVtTKt0r7UdfwP6iZFcvoneIPCiv/kg4g1O0ZbggEMWgUK0
	EQ91AA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urmjkfre-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 11:58:37 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-80aebb1738bso144722185a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 04:58:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756900717; x=1757505517;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xQ0VgVzHDcE4uOAStGZ5b6EnRBy9KiNlbxxY6hsWIic=;
        b=EW8zq7llRn115UIXsMLGE6jm/fND/4ZC1aTtaixWzSIJnsN6JMF5qwA8B/vPPHMMn5
         Obw4lgACXwoEYliR44Yp/THopnSnH6MRaW9s0Hty5GyZsMPd6x4LHjnXOLAE++krwfEr
         pzUe0jC5IgPsBKYv0Il/jwFS5wNOD2uWaCi3XXu/kvGmdlKEikDeo9HM387j6Gi8fXKI
         H9FSXFErK9e0kFXjXeeIDW3Mn3ZigW63Q7c1dHYrs/nou9dI/aXc99cbYyP0fzmbIP2A
         pM3B0wzCAAxjGB/XakTpEIkxumVfz3gxwk6lDx9Vbnfd5GXaAWc0JgFcvBjV2/s7i3+9
         /WSQ==
X-Gm-Message-State: AOJu0YxfhiuNY0M/JGA8jpIDHIEBAoIWln2ntHwJexQHU8EUhAR+WOTa
	/+MWYeGetAYZq2FqPlou5HGUwHtRKHBYUdZcdJx2lPAli3sTExMRHzSu1Lcl9mHKazZbFN0gefe
	kJYqavDr2BZZMI7lTgJQqfcRUewNXqS8VHkI47PMCDGZR5NjPvxPrawjh6SZwgDc2lH0/
X-Gm-Gg: ASbGnct16tFRPMBnAebapZfywSEOLpJSihSQ228ooi0Dy4BMa4nSZHkcxnOQHzJV9x/
	b6b47skHIdAZSNG8zuWcXeNC9m1NF4L4RcgL9HE+WtIy6kKoNn8FB4BbY/H96RhA2lp/XlmDDip
	NgecgaaEcW3dCWs5iRnQJ2vnQCkApJpBHHUSTXU0ox4ZoPveZBxDRMFncPluPouo+z+P5BSLoPI
	7YxrJD0F123UtQgfxD+6v7YOtMq5NUsnA/wWaQlJ2VerJMBzQm9hKTwe89DXOR/U5vIHK+Yr36u
	4KLQgWPTM829LWm1R+nCucN72qBKMnOz40bK8k9raGQI40Syp3F3BsJM3VK5Qem4Jklid5PHLnd
	m7BktOUZsaiBjFTv/nNsxRZVnKIQVlsA7DhDXHI5QfHoMgFMl/4p0
X-Received: by 2002:a05:6214:1247:b0:70d:adb1:bf55 with SMTP id 6a1803df08f44-70fac8c859fmr134683536d6.49.1756900716966;
        Wed, 03 Sep 2025 04:58:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/mtRqJfmERu7M9/61r/Pib5S1ya90D2+A5xz4iBPgz+esnd9B+FBxUWnhDBpOXm8CXSuJVg==
X-Received: by 2002:a05:6214:1247:b0:70d:adb1:bf55 with SMTP id 6a1803df08f44-70fac8c859fmr134683066d6.49.1756900716415;
        Wed, 03 Sep 2025 04:58:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-337f50d30b0sm9891421fa.67.2025.09.03.04.58.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 04:58:35 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 03 Sep 2025 14:58:19 +0300
Subject: [PATCH v8 8/9] arm64: dts: qcom: sm6350: correct DP compatibility
 strings
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-dp_mst_bindings-v8-8-7526f0311eaa@oss.qualcomm.com>
References: <20250903-dp_mst_bindings-v8-0-7526f0311eaa@oss.qualcomm.com>
In-Reply-To: <20250903-dp_mst_bindings-v8-0-7526f0311eaa@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Abel Vesa <abel.vesa@linaro.org>, Mahadevan <quic_mahap@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1329;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=yuqF992JkLqD1kIJyjnt6Zn+nJH3RP1HSBd3vUxQH58=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBouC1Z6lwJuo/b5AI8h777G/1hkQvXZ9IsEFm9k
 bhyfe5y3dWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaLgtWQAKCRCLPIo+Aiko
 1dYVCACUXNIiv7h7eyL5vYKr7mFPQgMkaSn7VDwtt0sBRf+f2in+SUE/FrMpVthcL/nSvFLbb8+
 7mkuNjq/wOhUXy+vGEMhzcyB0nU/L6BIFhJrNIikkKPqPLmAKzRnUkNKGDmSyvI2Wb5iWzzMi9k
 MYlRoNWHEoTCUhNV0pYhl/4smxY7U9xGhKarlcDcKgu4+Z3ufQPhzNp724HMk8YwkYuDDl2T3te
 k4KfUm98eINpKaB0FxMJiyMT1dfIzqQvZAYmYIq+lXIrP7RV0lZcUgPamnFUTXYff7Jm18uakkf
 ZEahvzkhOsHoHL97hCurVxOLYtYgAcdaGuUN4bgEeXOJhKB5
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=OemYDgTY c=1 sm=1 tr=0 ts=68b82d6d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=llJQ5I4GozCAaw4gE5wA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: jgvU0E8dFEEC_N_AWx7qqynoxh1YN5CC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNCBTYWx0ZWRfX2ndFMEmqu9xu
 nyQLgg733ayDY5uIviY+CFUw8cSyjbDd4bJrY18ZU50uSDlMbxadI1JeL12i4XArtmaoTvtBVhz
 rZ84xP8fzwm7NIfUzT/4rnxFd5WkW35pNTcJr5sqw3ZxTYzS6L35sjYfOugCKcBsAMU6y7PtIv7
 +0v9C3delC9rdNY6Byq4M262LB4aDS5+fCFaiTirv7TYolXgLmUTXPUUTAyLNvpYcS9RjDVvL6v
 i6dFrUIVnoi71HvqmKi0QPrr1X9VUzC/CIttm80Ajb8tHEj81zYnjbd4Tfx8WkqrpumdddD2DCa
 mePFyt/vpKerZwSPMsSlV7G2tlrdQDb2wHfbJYLws1CHdGlNLozWyA6lVcLK49EapJ2KodGr7O9
 tkySxwsK
X-Proofpoint-ORIG-GUID: jgvU0E8dFEEC_N_AWx7qqynoxh1YN5CC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300024

SM6350 doesn't have MST support, as such in DT schema it has been
switched to use SC7180 as a fallback compatible. Make DT file implement
this change. DisplayPort on SC7180 has been supported long ago (and long
before we added support for DP on SM8350). The driver will continue to
work with the old DTS (having qcom,sm8350-dp fallback compatible) as
even after adding MST support the driver will have to support old SM8350
DTS which didn't have MST clocks.

Fixes: 62f87a3cac4e ("arm64: dts: qcom: sm6350: Add DisplayPort controller")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 2493b9611dcb675f4c33794ecc0ee9e8823e24d4..8459b27cacc72a4827a2e289e669163ad6250059 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -2249,7 +2249,7 @@ opp-560000000 {
 			};
 
 			mdss_dp: displayport-controller@ae90000 {
-				compatible = "qcom,sm6350-dp", "qcom,sm8350-dp";
+				compatible = "qcom,sm6350-dp", "qcom,sc7180-dp";
 				reg = <0x0 0xae90000 0x0 0x200>,
 				      <0x0 0xae90200 0x0 0x200>,
 				      <0x0 0xae90400 0x0 0x600>,

-- 
2.47.2


