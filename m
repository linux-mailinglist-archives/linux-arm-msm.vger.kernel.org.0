Return-Path: <linux-arm-msm+bounces-88470-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E86AD11223
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 09:15:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 92FEC30813AE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 08:06:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 944983446B5;
	Mon, 12 Jan 2026 08:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SGvfBaVT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EB7NV/Jc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95993344036
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 08:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768205135; cv=none; b=F6rWYZQXNfpJRvkOnKzl6nXOX50fGVH2NWkJLw0l8aul7qNt3yVuksbEeZSS6BklsP/W+iP7wyrNrxjcRyIGV5rgKYiACdf/hnk6LfWV2MHpYb7nbjw/f9nRwXoOCGuy6VyRz/0dkReWvxTJkAezEVV114SPn1+0/3kzidyHp6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768205135; c=relaxed/simple;
	bh=96WrBixWbEA0flUiWTIzei1KNWmIZmL0YLK2srZxHJ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S3EZ6ZF1zm3OaanARpOvqQyxzCIHNkpKdqWVWcjYT2GrYPQ8ZCHlwI+Ck4yLg9I326qEv1VLU7oOgMEYbqQxg5nzeiXhbghpJk1WkQZRW9TyJlQ4NpYc3fE5NSkwwE9n4spzbRPQXPUfL2PhEgjkNpBxaNi88MoRPG+c4PIx5Ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SGvfBaVT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EB7NV/Jc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60BNmeho3306524
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 08:05:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W1zijEtPXBzyA/aWJ/rt1gqjP8uk5LhoHmbSSqj8Wug=; b=SGvfBaVT/juR37gy
	ZbxH9UElbMYVDF4oqAJAB0IQp6bxSR2nYzkbT8EhOETKaBXZixbiH3yn+RXn6BlX
	ZDUmIWNUnw/LXJiovkYGvFqiEk9wrJWiYmC0PxND1gd+4YkRb5jKjnU1iQ5u5VlC
	QaMUxHiDDrq6yAp0lWubVZHLMKUxE/hzNcRKkxj7ktws9+FiGFLqhsc8lvFBr9s8
	ytJvUxj9Sing7SVWdAgTlCSLZByBV+st8Rxytm+9YV+mfcDXSd71tM8C+sT+lIGu
	Wab0XfAptaTlzwvoy0Q4d/Av0qPc4CSXL7CinPuojbqkwdz/MOEgXW2PwHq7NtEj
	LfX42w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkntukhca-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 08:05:32 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f1f42515ffso174885271cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 00:05:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768205131; x=1768809931; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W1zijEtPXBzyA/aWJ/rt1gqjP8uk5LhoHmbSSqj8Wug=;
        b=EB7NV/Jc1SY1ZiWJaOpn+u2MIUj1lLHA6eziDekS0rBDoYBKORCDMS4zC+NIbB6hnv
         3rDxaKelHN1NkRKB9T5738f3l2sLguURx1TPSJAe6UDfSGVaR7BPrVXMFd6eVluL99bO
         Zjvcx6Ql4bOW3o2u+eSfj+Oz2dy/YsWJqT0D4pCm4GOdmkdFMuA6ZsLosJqHBkjew07H
         kRlKCV5AL4cgc7hkIXId5VpDwnJ60eq4dUh5DfT1oNtzThpaoY/TdHqW9L85FcL+qgaG
         7fET114c63Xr9I1fBu+aLmGbM0lWuAelvBJFjcspU3uH/AlOtMW0isYzQlkmDb9Fy2Dx
         ez4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768205131; x=1768809931;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=W1zijEtPXBzyA/aWJ/rt1gqjP8uk5LhoHmbSSqj8Wug=;
        b=nEsrorbdSHSxirtKHKszDxMf+4Zw+6XwiLgdHxZfK6zXbO28OJd1heENDsCcU1aeyb
         lkyZ7bB0hRgVMKR26CL3j5Og5AcXO7patrl9guxVvJUpxCFvXHwMmVrPw/utrXxJPQ3L
         aZDOI2d80I61uUdOklqRB9Up8Rc/bNRilFKlxWs95myZB2O5y04NgUK3QLFeBp37YbrE
         TkGfIcn9lmMIKtWvE/XjdABhToDO1GUdnj7yCoVh5b5k5srzseg2RxfaT/Ih9Il9F/U4
         TBF6PcT9/JwFiZLsb0TuMqv9x/LnDubsBOrmScqSQ5jTryp8kvobKUGOmh2Jy94wyihp
         bzrA==
X-Forwarded-Encrypted: i=1; AJvYcCX2H0TzKMpH9EDMFnsjVSRIfbw0uq15F5XB09ZEzs5nzxrjfRYLoId77lvTeupwnmhZTdPiqJq6DpO6PJ+G@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0gC/tjoolY+IQMDsIWMSmDzPrwXa9oeYF8ymxPcAFG9p3Ydv3
	5I4u7foSzJnCF8NXR8ElqiK8CuzIxxA6c++a6nlKkkv8lbLHxaPYRPO9+SOdTpGL1NhM+fNv2hF
	DTANzGrn6mlTC5IxaHe3ChSQptTI+nIj7NPMrqr1Hq0YveUYiFkE5xc+dNfrO/HBeFEGc
X-Gm-Gg: AY/fxX6iNDA6tJ5f8dwnHkCUhHchEgcaz3A9+DrX6AmWO7LlTdZXHTeILREpmkKcoBw
	48T6xkv0oVVeIY5rsBoibuTCRbA6iq/6vzWbOmiWSc/N65dTob0L68H8wiDmLgOGuuz7uwmbA/P
	0PxgHb42ui2lYDJb9zZjrEKLbwuePkVi375Y6EPV9Z5kkVLPVLN0TQM/yS1aSacZe8zrDvTf3O3
	QGxi4PB/8RbB/DmeiBZ7DkJHR6RKA4Ickv4TfGa6/BR//RMqRYVVKI3fmMx/BTKOZA3NxB0j+5K
	s2D3+d5ZfRZnndPt5auatjtJccKji8dS4QpoykN5aSqTaI/ymx1E/LswMwSevHSlMw5E/yr4slL
	hcrv6eA67P5P8VY+uEhlXyA8U4CIrqPG2BVXSfgAkoRmvXAjpBh/26Y8ME/dP9aIXZi840Azzib
	uq
X-Received: by 2002:ac8:5f0a:0:b0:4e8:af8a:f951 with SMTP id d75a77b69052e-4ffb4aed9ffmr240841211cf.83.1768205131293;
        Mon, 12 Jan 2026 00:05:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEBXCamg0DTS8zkIEYRaQ3Kie6jaWAFB/Y8zk1M9ChVqV+WPYgtwHYMj+YC7YInklpvje4D+w==
X-Received: by 2002:ac8:5f0a:0:b0:4e8:af8a:f951 with SMTP id d75a77b69052e-4ffb4aed9ffmr240840941cf.83.1768205130768;
        Mon, 12 Jan 2026 00:05:30 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ffa8d39230sm123116201cf.6.2026.01.12.00.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 00:05:30 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 16:04:54 +0800
Subject: [PATCH v4 3/3] arm64: dts: qcom: talos: Add camss node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260112-sm6150-camss-v4-3-0cd576d627f7@oss.qualcomm.com>
References: <20260112-sm6150-camss-v4-0-0cd576d627f7@oss.qualcomm.com>
In-Reply-To: <20260112-sm6150-camss-v4-0-0cd576d627f7@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768205107; l=6713;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=96WrBixWbEA0flUiWTIzei1KNWmIZmL0YLK2srZxHJ4=;
 b=HdS2+mVdYX+9KEUkWHMOzjS7yyMNiF3XP8sia16VCiha1WlEOGm2aGDemLdOw999Oc08dt0ry
 g9GRKC9QFdJAJTesCyd+1K20nlYIycGsEFN6Ujxb7fcaaJYSWDSRJh7
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA2MSBTYWx0ZWRfX6Ybg+PIQeg5+
 ClokgwK5BxUPR3+r4jBvFkwqDDlpthFDLiiSyM4ASxeHLgbrQMlmEEyhOhAXkJbJund92j8Fa7g
 ALIScobkTrUmY1MKsgoge1GEasWNNnkOu572PFvbcsrRSkvhlmqtyg0BKf0ChcxEf6lNhSfk/Gc
 FSLB/ht8Ht4qyOpxIdpz/1ibrwihsyNrPy8ky8fkRnMz8KkEOE7iM0iCbbR4g910zEm3ZBCjicf
 pINUYGla/qbIK2JtGCH5zVZbJgcy20RpEGSMA6eqfn2J5yBO03+wdNKUjP6PGGUdNptTIOh3Nfr
 dV7yIDstO3IgtqyoQAVflTDb22SVS7i1Iyk/wLAoMr7kkOjxrX4LTUHSv0mNNNT4/8ukW9v9A2B
 5XmqqyHoV+vIvyaged287a2/nBfYbrbX33uT7ak5RX+EVJTmR0SbZMjXgM5A24XXNvSRBp3y4Bd
 ziSseSCEm681FVTJ9qg==
X-Authority-Analysis: v=2.4 cv=R6AO2NRX c=1 sm=1 tr=0 ts=6964ab4c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=_q6n6E3gDzqWkXQ7FWgA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: BQq8Shr9tS9_Kxjj2iNwL2Zt7mDO1RjW
X-Proofpoint-GUID: BQq8Shr9tS9_Kxjj2iNwL2Zt7mDO1RjW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120061

Add node for the SM6150 camera subsystem.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 200 ++++++++++++++++++++++++++++++++++++
 1 file changed, 200 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 8171ec482be054a6d2bc8afdd1a122fa4fc591a2..5e5b43441e8919d6afc5a457e61f8a49664db66a 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -3780,6 +3780,206 @@ videocc: clock-controller@ab00000 {
 			#power-domain-cells = <1>;
 		};
 
+		camss: isp@acb3000 {
+			compatible = "qcom,sm6150-camss";
+
+			reg = <0x0 0x0acb3000 0x0 0x1000>,
+			      <0x0 0x0acba000 0x0 0x1000>,
+			      <0x0 0x0acc8000 0x0 0x1000>,
+			      <0x0 0x0ac65000 0x0 0x1000>,
+			      <0x0 0x0ac66000 0x0 0x1000>,
+			      <0x0 0x0ac67000 0x0 0x1000>,
+			      <0x0 0x0acaf000 0x0 0x4000>,
+			      <0x0 0x0acb6000 0x0 0x4000>,
+			      <0x0 0x0acc4000 0x0 0x4000>,
+			      <0x0 0x0ac6f000 0x0 0x3000>,
+			      <0x0 0x0ac42000 0x0 0x5000>,
+			      <0x0 0x0ac48000 0x0 0x1000>,
+			      <0x0 0x0ac40000 0x0 0x1000>,
+			      <0x0 0x0ac18000 0x0 0x3000>,
+			      <0x0 0x0ac00000 0x0 0x6000>,
+			      <0x0 0x0ac10000 0x0 0x8000>,
+			      <0x0 0x0ac87000 0x0 0x3000>,
+			      <0x0 0x0ac52000 0x0 0x4000>,
+			      <0x0 0x0ac4e000 0x0 0x4000>,
+			      <0x0 0x0ac6b000 0x0 0x0a00>;
+			reg-names = "csid0",
+				    "csid1",
+				    "csid_lite",
+				    "csiphy0",
+				    "csiphy1",
+				    "csiphy2",
+				    "vfe0",
+				    "vfe1",
+				    "vfe_lite",
+				    "bps",
+				    "camnoc",
+				    "cpas_cdm",
+				    "cpas_top",
+				    "icp_csr",
+				    "icp_qgic",
+				    "icp_sierra",
+				    "ipe0",
+				    "jpeg_dma",
+				    "jpeg_enc",
+				    "lrme";
+
+			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
+				 <&gcc GCC_CAMERA_HF_AXI_CLK>,
+				 <&camcc CAM_CC_CAMNOC_AXI_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CSIPHY0_CLK>,
+				 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSIPHY1_CLK>,
+				 <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSIPHY2_CLK>,
+				 <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
+				 <&camcc CAM_CC_SOC_AHB_CLK>,
+				 <&camcc CAM_CC_IFE_0_CLK>,
+				 <&camcc CAM_CC_IFE_0_AXI_CLK>,
+				 <&camcc CAM_CC_IFE_0_CPHY_RX_CLK>,
+				 <&camcc CAM_CC_IFE_0_CSID_CLK>,
+				 <&camcc CAM_CC_IFE_1_CLK>,
+				 <&camcc CAM_CC_IFE_1_AXI_CLK>,
+				 <&camcc CAM_CC_IFE_1_CPHY_RX_CLK>,
+				 <&camcc CAM_CC_IFE_1_CSID_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CSID_CLK>,
+				 <&camcc CAM_CC_BPS_CLK>,
+				 <&camcc CAM_CC_BPS_AHB_CLK>,
+				 <&camcc CAM_CC_BPS_AXI_CLK>,
+				 <&camcc CAM_CC_BPS_AREG_CLK>,
+				 <&camcc CAM_CC_ICP_CLK>,
+				 <&camcc CAM_CC_IPE_0_CLK>,
+				 <&camcc CAM_CC_IPE_0_AHB_CLK>,
+				 <&camcc CAM_CC_IPE_0_AREG_CLK>,
+				 <&camcc CAM_CC_IPE_0_AXI_CLK>,
+				 <&camcc CAM_CC_JPEG_CLK>,
+				 <&camcc CAM_CC_LRME_CLK>;
+			clock-names = "gcc_ahb",
+				      "gcc_axi_hf",
+				      "camnoc_axi",
+				      "cpas_ahb",
+				      "csiphy0",
+				      "csiphy0_timer",
+				      "csiphy1",
+				      "csiphy1_timer",
+				      "csiphy2",
+				      "csiphy2_timer",
+				      "soc_ahb",
+				      "vfe0",
+				      "vfe0_axi",
+				      "vfe0_cphy_rx",
+				      "vfe0_csid",
+				      "vfe1",
+				      "vfe1_axi",
+				      "vfe1_cphy_rx",
+				      "vfe1_csid",
+				      "vfe_lite",
+				      "vfe_lite_cphy_rx",
+				      "vfe_lite_csid",
+				      "bps",
+				      "bps_ahb",
+				      "bps_axi",
+				      "bps_areg",
+				      "icp",
+				      "ipe0",
+				      "ipe0_ahb",
+				      "ipe0_areg",
+				      "ipe0_axi",
+				      "jpeg",
+				      "lrme";
+
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mmss_noc MASTER_CAMNOC_HF0 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&mmss_noc MASTER_CAMNOC_HF1 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "ahb",
+					     "hf_0",
+					     "hf_1",
+					     "sf_mnoc";
+
+			interrupts = <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 459 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 461 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 463 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 475 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 474 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 476 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "csid0",
+					  "csid1",
+					  "csid_lite",
+					  "csiphy0",
+					  "csiphy1",
+					  "csiphy2",
+					  "vfe0",
+					  "vfe1",
+					  "vfe_lite",
+					  "camnoc",
+					  "cdm",
+					  "icp",
+					  "jpeg_dma",
+					  "jpeg_enc",
+					  "lrme";
+
+			iommus = <&apps_smmu 0x0820 0x40>,
+				 <&apps_smmu 0x0840 0x00>,
+				 <&apps_smmu 0x0860 0x40>,
+				 <&apps_smmu 0x0c00 0x00>,
+				 <&apps_smmu 0x0cc0 0x00>,
+				 <&apps_smmu 0x0c80 0x00>,
+				 <&apps_smmu 0x0ca0 0x00>,
+				 <&apps_smmu 0x0d00 0x00>,
+				 <&apps_smmu 0x0d20 0x00>,
+				 <&apps_smmu 0x0d40 0x00>,
+				 <&apps_smmu 0x0d80 0x20>,
+				 <&apps_smmu 0x0da0 0x20>,
+				 <&apps_smmu 0x0de2 0x00>;
+
+			power-domains = <&camcc IFE_0_GDSC>,
+					<&camcc IFE_1_GDSC>,
+					<&camcc TITAN_TOP_GDSC>,
+					<&camcc BPS_GDSC>,
+					<&camcc IPE_0_GDSC>;
+			power-domain-names = "ife0",
+					     "ife1",
+					     "top",
+					     "bps",
+					     "ipe";
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+				};
+
+				port@2 {
+					reg = <2>;
+				};
+			};
+		};
+
 		camcc: clock-controller@ad00000 {
 			compatible = "qcom,qcs615-camcc";
 			reg = <0 0x0ad00000 0 0x10000>;

-- 
2.34.1


