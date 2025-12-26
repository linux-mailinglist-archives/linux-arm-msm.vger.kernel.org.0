Return-Path: <linux-arm-msm+bounces-86664-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9C5CDEE8D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Dec 2025 19:31:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 28932301A1B4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Dec 2025 18:30:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1D0F1EF09B;
	Fri, 26 Dec 2025 18:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eDhoFWLr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HWAa2cXk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3485225A38
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Dec 2025 18:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766773841; cv=none; b=on4dJYQj1iZdxqqLTS+FVQIWO/WKqkFl3L3VXVFtzYPTAgVgsfaE4s2r6j8IzLf3O5tfo5YOfWiEUshOMYM6/MGpuA0+Yol71qPIC7dh+81vcQEdacEaFgBzlAShQoICUCrMUpWhLq3yHf9NOmkrLKt3l/4iJVZyQfhsx+aM674=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766773841; c=relaxed/simple;
	bh=n16xkwNjyf8oGa66RmxgjqfY4hOERxE5gHukvovYbH8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mRKmilZpci71Jw4Kmg0KOGKy3Ms5kqL4p0uAWi++KL5PZPf2d78sit6m3wGfEhFmdV6pXj7OTq5rGpwcELbYHaPtuuKVM6Rhj0H/aOrAjU6HUfA3A13spQBgBATVZ/pchn0u4JktCBvL/LhssLTVovas1ZUbRzY2Sgf2kBtoWbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eDhoFWLr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HWAa2cXk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BQ8baO31280905
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Dec 2025 18:30:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iLMqK35C+dR60AHIbug7CKPTuNzYpTZ2FzC8crW1180=; b=eDhoFWLrvnuMW3w9
	sPfZEdSHS1rcznKAK6XZs4XlJr7l3y84E4TKul05KiZGZfLZ+gRVdYWdibV5iRzU
	/qHsJ209Wcmvb8RFsg6+95CwvputmH9QHjvuDlSGk19aHAkXYHq6udx1ouR2XkA1
	c3sVbZ9XibdyeR8NH0afoLLoUjjGWW3va/QtkR8Wr4LIBOAz+Q6kuKX61BArDva+
	3ez0YtH/EEMpdqK/1c6KKwJ46oizO59jtmTjM7NpH4EA5k+s6i8pxeKUoCaW7lUV
	AfkSYDXcW7Vrm6Qe/b6uz0VbmgtdA6uK7HFt4ZAghuO8HPKWquYejHp2IvQAVzpA
	hAKA/Q==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b8p4946uu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Dec 2025 18:30:38 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-34cc8bf226cso16753119a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Dec 2025 10:30:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766773838; x=1767378638; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iLMqK35C+dR60AHIbug7CKPTuNzYpTZ2FzC8crW1180=;
        b=HWAa2cXkBCustIPhi3lqoshhPtztp5Yzxzc7l823IIp+X4z1weU7Qw2RylXp0F4cyo
         44Zh66471jg60un7qRFfFSxAYTJ73w/Ya8izm0Hhayq3hyBX5SnfYs8ECY5vEWgGIODP
         WjYwz0GDC6CpYqkBXSDAgXfpEP7SqKCFFqZVaHylEo/NiCZzmWzSK/Rct5o29GW2AII/
         q8418kdgwDiLJj7jxY0AkZsFs+8Y6mb24eRW5dWx0bhiOuyl50BW0sOvl3wd4YMHIbcj
         cQ1SmKiK5qUYxnJzuOvETcQmvZnb/nIlplkFOM09fobHceYjL5/AF47r8XH4xrF4woPg
         wg0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766773838; x=1767378638;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iLMqK35C+dR60AHIbug7CKPTuNzYpTZ2FzC8crW1180=;
        b=s04foK2B9H1ehegU+pExJeQGxtvXlUvA8guZ4+rxodizbfskAkztuHzAlql/0C0s+b
         iz6Wvx3pIs+XsG2F8SMr/C62Ps5SM/+bRXi+FSk358uIrn11kYJPmLv272vr+qUMqawM
         Oydy3ez9H/4/y/KrH4YKZpvyDsq9r/BAROkLcQz6ACTrheMPiLkUjiGN5YKZFsf5Pilx
         /cigwvHVIjuCfjOqpmvc5u6eZ0wcOaXyZS90Kjo1tgkKvs4Q2shegr8K6e7plyEJe+sV
         ppxKAJeSzJJ8S8uvLMiK90M//E9pwNJ2SClgvXTQxIXGBUDwKhaqUyslHOfY+j9Z4fMg
         ibSg==
X-Forwarded-Encrypted: i=1; AJvYcCXdq1jMkeRCJdUOjZuaBT+jYiR3nwO3Pxqe6GDQjB/dY0W8gmt/uo9UiwRtAIDdFDdQ2hmn9uhvtFHbwi5J@vger.kernel.org
X-Gm-Message-State: AOJu0YxaqoY6i2trGMHwbAXNF/c5GpgVZqCNuwQWNoQ8yESvcZdEmJ2E
	vE9dD019SKthzFJK07qRAeqBlCqoco3QAybmmF971GfafhyBRGyXHSBWaJSs5KgJUwnX3s29bdM
	y5dH/QKH33934P32hpRKhqd+lMMUfa4rj/sGFVsxmf8TyPNCx2oYLfjGhFwIOIKFF/iOA
X-Gm-Gg: AY/fxX6OPZ0cRKAmvaujNhzW8+5ZRk3YLb5CpiVbMSL+tjBtlXhXDCrkEO1rZvAmI5E
	PvcnHNixxDTFjCS6tfuVWOPClznwBglweHIgXAVv8egCU0dze0rBISlBXNq0sDNpUd9r+N0DYUW
	GhiEiYX6be5VfZtgTdH4GUC39GiHsr7gVCdFzmdfRSHsTANHoShnOf2e+y5q7Vd+ZK7l8S+f4ZZ
	tIUWVVVJgEn1GTdpko6P2LeGvwDtlKqGMnqP3Kty8MpgnP0L82FUYI9Ki6h4NjsIaCZIJhZkVBw
	16D2l2HPZzmbegXwV5lqBZWDjxgkh97AMFC0WvTyRVKfLFbUkNfV+/iNUz4GHR8s1Z3BBEEuOSp
	UDTt1DLT84lOdptpMToJScrspHR0hpXH+nA==
X-Received: by 2002:a17:90b:1f8c:b0:349:2936:7f4 with SMTP id 98e67ed59e1d1-34e921bc5c1mr16998341a91.32.1766773837502;
        Fri, 26 Dec 2025 10:30:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEFCeBec7usnCBPRH+O6WbKp3l1RV/SJThZBsXXh8hbrcv30ZbUEuCs40uGVVH5XrP2GCRLxw==
X-Received: by 2002:a17:90b:1f8c:b0:349:2936:7f4 with SMTP id 98e67ed59e1d1-34e921bc5c1mr16998309a91.32.1766773837002;
        Fri, 26 Dec 2025 10:30:37 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e70d65653sm23808883a91.5.2025.12.26.10.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Dec 2025 10:30:36 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 26 Dec 2025 23:59:38 +0530
Subject: [PATCH v5 5/8] arm64: dts: qcom: talos: add the GPU SMMU node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251226-qcs615-spin-2-v5-5-354d86460ccb@oss.qualcomm.com>
References: <20251226-qcs615-spin-2-v5-0-354d86460ccb@oss.qualcomm.com>
In-Reply-To: <20251226-qcs615-spin-2-v5-0-354d86460ccb@oss.qualcomm.com>
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
        Jessica Zhang <jesszhan0024@gmail.com>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Qingqing Zhou <quic_qqzhou@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766773796; l=1883;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=2e4aIsMrv8wEM6ceXRSjS3zZllPcce04PIqo558zTus=;
 b=Ok6YZ0IgC3WjZySGRqilNB03bycUfgsjJt6Fp+1a2TMg6htzSYrvw+pfuahwFYPVnAqmgvaIL
 j7KuWIZZ8vLBtFX4eFRYJ8ekUIdi5mbSwUsT5L1Y7tNNYATh0X99Bbb
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: oIGJsJsRqd0jBYuOOVTHeyD5JtU8e3Fl
X-Authority-Analysis: v=2.4 cv=esbSD4pX c=1 sm=1 tr=0 ts=694ed44e cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=Qd8OTwLUrmNk7h6opE0A:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI2MDE3MyBTYWx0ZWRfX3o1QwWnkmdqK
 r3ae8VV+e4rk2CZAbYxSiS11c5pUakSk6RV1dsjoEZRmPvoA4h1fG5Z08xJkfTt3n1J1a6g8x5p
 BoDSNrIvHVyYfp1OUdhjXl/qJXhXh4Bi1jZ9qG+wtXRIFkZftPaZ41MkOwDCwjHTQ/a+XovUJYh
 MbE5mvDtAzln14+gDU6tqYqHdEYltoyr8Pm7iNLcp4YhMUqgIFCopXxQN+BEwZhVt5P0jbJsWwy
 OZduP9R8smcQV6blZvSPYR3bQYVbZRTIiTxjiOrT2pswsdrRCDzeqeg7xkKhBeBBDSkMD4KsMm3
 yp6phwi3YMLdY6mpizctK34Hmtc2r3K45TCh+WUXW1WhTzyZt6na0IoMCwAZUjSAZHYW/vu/SqF
 Km/e8fwr3ogRo33InZ03VUjR48qH6i0SPkbLR7LffVZQQ8AbaXyY2bI1BSAS+c8Iib3ghtw+ipS
 4DzW9W9y2MwFoOYltFQ==
X-Proofpoint-GUID: oIGJsJsRqd0jBYuOOVTHeyD5JtU8e3Fl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-26_05,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512260173

From: Qingqing Zhou <quic_qqzhou@quicinc.com>

Add the Adreno GPU SMMU node for Talos chipset.

Signed-off-by: Qingqing Zhou <quic_qqzhou@quicinc.com>
Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index d1dbfa3bd81c3d999bd79fc92ad85312c2f83087..743c840e496d70133bf82928e9e0c3da9653a5ee 100644
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


