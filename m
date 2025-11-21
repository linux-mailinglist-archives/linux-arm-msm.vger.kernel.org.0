Return-Path: <linux-arm-msm+bounces-82916-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F90C7BCF0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 22:54:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C3AFC35ABAC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 21:53:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D50ED25BF13;
	Fri, 21 Nov 2025 21:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UMkboF2t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E3H5sfTU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3570A307AFA
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 21:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763761995; cv=none; b=qR0Yv+/ZbFajI/BVWjOXL6B+U5wszI1ajzh5XbS1VBjqNZl/DmPuYfL2eeclpfw6ZKgZPECIgndcYRFETg8eazNtzNtnwLDvT4iTR1BeQ/ux7H0h2JGujt7lznMiPWv21RK8qlEuDVQ+rnbCGR9YYxB3A7XWqApUqcwZNmlSMTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763761995; c=relaxed/simple;
	bh=xgXKmaZiOcMeUN+C6U4iiO0kZtzvY/12qfTuXM7/1tE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I8kPcy/eJSv/RiEfcFOkRcIB+PfdkK3/vCDhvjFaJbsZi6ncEGiWGc1FutjdC6mNnY0vYx59eHpn7J8IrNIyRlhdswg4M4yk7E1t+eO3t0WOY5ddWqSVdZkVO78h6REAL3EOnl5ib8pWg204iAqa7PN0/6wqsxGlHlPanQ8Oc+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UMkboF2t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E3H5sfTU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ALIGfPM4024992
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 21:53:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C++Ck3QiPhN+92mnBp3XqzRipz5mKGMRJKWvsp0grh4=; b=UMkboF2tU3ETn8lN
	nPMtlUUtQ3CPiD++oyx5WNmHcZ7iziouB3aEygZg1sIoNjhFx0RZ+7lfk8kWWxZb
	HKps+MjbkmUcX9BKM7DhygghHy6mBjDEjAytCB858ziDEFXxQ78zXhaGNJauOLTf
	yK3PXWgDO7JRBN2NJ9CzealL0nx0CBlxnexiqDI/7/22RIn8eslp6xeU851sugpk
	Fx1Cv+VMlW61y8nf6EN91XADBFKiIbIZInhvXJjKOzYcDjSZtHzukOlfMv4jCi/p
	dQaXBvuFRRB0AjcEY2OZpM/ZL0u7p6qgDRQyXCERA8/Ueg75fW/32qAARkoimi3F
	q1D5uQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajw7a0gy5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 21:53:13 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7a4c4eeeef2so5948874b3a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 13:53:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763761993; x=1764366793; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C++Ck3QiPhN+92mnBp3XqzRipz5mKGMRJKWvsp0grh4=;
        b=E3H5sfTUq0FHV++zv5s4wwQN5DZCE//XHleEq/LNtRahBwWgDF0prf/Tm21HfR0Z2u
         xV5oYDKPIWmrLTyUxGQScPTLVcBKzX1ztpAMSvOrNzVmNdySoJhqkAoiRP+CjFWGGgK1
         Yz/dxKCSv5b2aNLT4xD0UOcidFJTulKQmz7Aeuvdw6ncWUDSNzo3UMiVXFyi/x5OgP9/
         aSLmvVxawVlFSTwrkOh1WRB4v9aiAPtQKuyc6o21mG9Fso4V0xzvpee6b+7zn0r8Az7Z
         lGWBTPE8yxFNo1+bw/vCkw6jjrhVwtgHUGegj5C9bhcLvimzFnRdT+NsLWYrke9CwEO3
         3M4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763761993; x=1764366793;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=C++Ck3QiPhN+92mnBp3XqzRipz5mKGMRJKWvsp0grh4=;
        b=jNln4+l3cJrtOnGyDI26RPp5GbxX2Fq6iIfq2uh4NkFOqTxHMKoyqFKeNEyFb/UZ5B
         bOf0ICAJsWMISPiWAwlV0zOUUsydjRFFvYHkmZMKzZrZQVeHCeWB8fLTSRUiOa86iYAI
         SII292/mI0DE551vOlRvc47BTAjkN9cPnA7a6qLxZ5COzhZ38X0CP/GROOUB8hO8sBEE
         9a65g+UUvHiR4NeNdEezLvD6I+BDCckbeVEK0xMVcQ4bwQYJLXJVuMkdiMvniEKa7jLl
         G6u6VxtySkVs/DpkgdvvRZbNVxDvlLoDmYWbe9OO5aO8tMsk0uJ/mGoIPPRphpKSS/o0
         CJEA==
X-Forwarded-Encrypted: i=1; AJvYcCWNORob8Ye5CQux2GJH4YGK2bD/FYgpOm71lzNRJyq58lT2nZJODIi0c1FDz8VZcz1WSCZ/PQreeQmatKhu@vger.kernel.org
X-Gm-Message-State: AOJu0YyARpdg/+dg610c+oxLBC/sOcPymu0wbm7q0tDE+ZIpxuzuF/1p
	cHN/BejJ8yQl11sUTlOJkpvkS2Y9fh5wCuuvB1wiSYDF6nd3TdfINqgHSxB2IUkYCz53YsGyZIK
	frxaWHdL4PDcAzTHhafM9xmyVtIkUGjRDiOfZTw4iTIrqJQRlVrqm42SL1UGvDRFc4Wa8
X-Gm-Gg: ASbGncs0yX0m8SPPeT/1WENVZ23H4DnSIJ24LZHyz3BOOs4MDV2o/S3ik6YxceO3Y+1
	U83e69QZqlh97zq9JWJijckehTzJbOkg/Yl90MiIh7+S6bq+iJ3OJBhVG90/W8HlGAamCJ6O8NY
	Sj6rueforlmLmA3uBfaH+fJBKmXPr8N/YFC1U2vQgMgkD3JC73ZFu44RTtxwT/R/G/ep1U0k4rO
	KxipFf8pRae9uuaTSMw+ePQIDbs2C6QlkdaDXSm+JY5YJDxZIL4ddSM7Uc/si235wNSHgmPeV2Q
	qRByrm/UDacA1/+m4phB8+fu8K0tcJllVRy5zAGZ7YVIHQnYn4M3Q8I2ByOkvnaKFDgELU80HCf
	Xls2u/VeXqf8cwtbym8f9frzowbBZU2lKsw==
X-Received: by 2002:a05:6a20:1596:b0:35b:e098:42fe with SMTP id adf61e73a8af0-3614eb3a120mr4909371637.6.1763761992742;
        Fri, 21 Nov 2025 13:53:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHel9VjK0hlrCsYwX71G6pPYZS3DsaIQ1B0GJFJuMZYDTwoTJ7IdYj5PwGX5bxa+GpGp3Y9Uw==
X-Received: by 2002:a05:6a20:1596:b0:35b:e098:42fe with SMTP id adf61e73a8af0-3614eb3a120mr4909352637.6.1763761992281;
        Fri, 21 Nov 2025 13:53:12 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bd75def6314sm6399270a12.7.2025.11.21.13.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 13:53:11 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sat, 22 Nov 2025 03:22:18 +0530
Subject: [PATCH v3 4/6] arm64: dts: qcom: sm6150: add the GPU SMMU node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251122-qcs615-spin-2-v3-4-9f4d4c87f51d@oss.qualcomm.com>
References: <20251122-qcs615-spin-2-v3-0-9f4d4c87f51d@oss.qualcomm.com>
In-Reply-To: <20251122-qcs615-spin-2-v3-0-9f4d4c87f51d@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Qingqing Zhou <quic_qqzhou@quicinc.com>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763761959; l=1701;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=UIWXJaF/I2TkjJEvJvGJBMliE84S4GBBvxZcEnNxOE8=;
 b=i3qwYLnnDbCE4CPscGGlllWiMbV0OEHy5QtOFPTMkPdydEJgJ7y54nJjKH6eNGhV6JMR/XULS
 DI2Ovv2xulbAhmTfzj9SvHD2soxY8gUi3yH0Xe1xdLMGQR/yH9c0BK1
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDE2NyBTYWx0ZWRfX19Ez6g/VITSv
 qLg4Bz05eakgw9qRSIKbavEZXa3rQRqsac4XD7yK79oBHJc5GQDVDkNv7asGZ1/fYfUvpGHQb+F
 OBr7IPKZyMbD6tpWePgNiqEpW2+Qd2qX2OPSrGNRg1siDZev/iQ7KwLMw6BMfstTZrPqR4kK0a8
 25u8VbmW1a2kWPx7uRCtpbFUni3OoSiv2aZNmPPanyJ7kFO7Dle3xUqiYCV8lgbNoiYN/qMgdg9
 1VNbusbHmN3uEi/J/IK/CPoIg8kNXGw1+768zmZWRgy+DFr1mfCVpy52m5VnremR5acGa4Ny3B6
 8iJUJjKoCPoAU5+hofqY75UeUqUyptKVoPLSpaj5ulv+cZGzy8M8zFPFGxPB5flO3hKJsWtUYgc
 3sela6bvJA0OggUj4XyHcVfkbc0vYA==
X-Authority-Analysis: v=2.4 cv=QOhlhwLL c=1 sm=1 tr=0 ts=6920df49 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=Qd8OTwLUrmNk7h6opE0A:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: A0DUycsjYryG0FW9IJbiQ5jbJ4mmNfmq
X-Proofpoint-ORIG-GUID: A0DUycsjYryG0FW9IJbiQ5jbJ4mmNfmq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_06,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511210167

From: Qingqing Zhou <quic_qqzhou@quicinc.com>

Add the Adreno GPU SMMU node for QCS615 platform.

Signed-off-by: Qingqing Zhou <quic_qqzhou@quicinc.com>
Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index d1dbfa3bd81c..743c840e496d 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -1839,6 +1839,31 @@ gpucc: clock-controller@5090000 {
 			#power-domain-cells = <1>;
 		};
 
+		adreno_smmu: iommu@50a0000 {
+			compatible = "qcom,qcs615-smmu-500", "qcom,adreno-smmu",
+				     "qcom,smmu-500", "arm,mmu-500";
+			reg = <0x0 0x050a0000 0x0 0x40000>;
+			#iommu-cells = <2>;
+			#global-interrupts = <1>;
+			interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 590 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 591 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 592 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 593 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 594 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 595 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 596 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 597 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
+				 <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>,
+				 <&gcc GCC_GPU_SNOC_DVM_GFX_CLK>;
+			clock-names = "mem",
+				      "hlos",
+				      "iface";
+			power-domains = <&gpucc CX_GDSC>;
+			dma-coherent;
+		};
+
 		stm@6002000 {
 			compatible = "arm,coresight-stm", "arm,primecell";
 			reg = <0x0 0x06002000 0x0 0x1000>,

-- 
2.51.0


