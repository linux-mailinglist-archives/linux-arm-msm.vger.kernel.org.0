Return-Path: <linux-arm-msm+bounces-87080-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BBEF5CEB959
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 09:46:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9A3F6301F00E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 08:46:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65F1031329D;
	Wed, 31 Dec 2025 08:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pF+YKv56";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gHEJgACM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66353312827
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 08:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767170784; cv=none; b=IHh7fjECe6/Ul9gCzVuI6D3QsGhDPn85t2hm0Yv7n5Wg/G3hGwdrmotwnCkRsOdNhitWuy8myznXGBz4EpYypwIdqyVAmbGvB+LgT5dqIRmh6eOBwaerb61mwW8c9mrt6bzPTXtUWEamH+QSGRseh96yvwnWdDVPnWhZsVCmSoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767170784; c=relaxed/simple;
	bh=wmxQLQzqTrIEKVmuP+8lLmL1OzedZ/M1FswO71PAtyo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=skNCTHS98FTOC32tNHT92/d0BtGPhEAIm7oZsBsgPE/UO6UCSlOOWF2EnnfhnoOg4Mt+cN7pS9ZrGQGZmVzBP0z2GGn4XmkdyiGRcUDWPeph3l6VMXr9XpQ7TWJ1nrcA/sMBwjZwGlNIHZTrbVYhCE/HxMQ/Y9kGZYFPW6S2Ssg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pF+YKv56; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gHEJgACM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BV78fqO2733573
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 08:46:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z9uVV8hUF4H/djwv9vyhMlIx9KwoZJhi1N9BMP7GhX8=; b=pF+YKv56ovktUjvj
	PlUNGOK64hhPbgzgKXiF5urL0QklA8wFFLw9Y5pRN75aa+nRIafbKlYoObaDjWaI
	57tpbOZCuLL7nrYY5PYj0m/wANvLrxFX21s9kEGEsYAqz2WvlCVw5PgRR3RRksGx
	TIs9biLwcCKlwln5PM1mHatDuNq27QHSrBG2H6IdGKfUiODyegqcPHvUlypeHEln
	whYfvZlFKU7yzn5hpRDSv8DhmUqcdcRLmiTAdC8X2flHeXFOgJSzzBnCwMDW6jsI
	QmbWrvchACityEqTAAyG/9+uVDbJ4C/0YVpAIrYmJxDsX4116waHUd3LekiNn20W
	AHqc6w==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bcy6ag5wa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 08:46:20 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7b80de683efso19714762b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 00:46:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767170780; x=1767775580; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z9uVV8hUF4H/djwv9vyhMlIx9KwoZJhi1N9BMP7GhX8=;
        b=gHEJgACMaXUwMbFFn8MJNurMBRj4+BPzbcMrFs0I8/P9uAf9g9kY2sYQj4veG9xdJU
         vedgz2e/oJnAuUEndr+aLRy0T0oc2VAsd3/MY+9CBLHSBfagUyVp9rXqNOwSw8XxN2Jj
         Q0yGGU2aMOjgruZYxW7iPbw4c7QWRSnP85vPyIDgfguKLDBhj0ACgs8CJK+kRsqnigoa
         pjqJG7DbG+qbnkvHaAHCgfSS+wf8wgeQ3aYiO+FLPLHfU2i95ok4HGQ9vmTF1jGCTyNH
         C70yNVJ9VOl8hV3Q9Xv4RtqNEtoCiemzU4Z0ruMqJFgXyQUBzfUjGOYcSKt5/W+04JR+
         NsaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767170780; x=1767775580;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z9uVV8hUF4H/djwv9vyhMlIx9KwoZJhi1N9BMP7GhX8=;
        b=LvHNJqryk7tRtKSIrFpS6TIUOVtGZgNuZ1S0eJNbhOXTv1QtN36WSrOJzOpZZDYYgK
         eily5V3klnepV7Y6/dG7Xgqccy/ew5T3YmfhNpxXesh3zWf1FcMxg4qmWQmx9/b5gV+I
         s2vEIWQd2l6Wl8bpyAFTOPs7DnBIpK7E2SQmxOZfxKTh0o6i9P6OpES72Gpq/LCS8HUP
         gAK+epCKT4kPY+oeejBs2xJq63jpckf4hYjzLxRwRqsPXYTTiUdIv36FmIM+bYN/jVWw
         R7UAWboJkt2C364jHDjsPPsTy83XGJ71wxH0c735MWzcyHI5wzFzuGqAnwdMIq+OqXlS
         VU/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXqwO8bSpAtVYN/07/v+mhSm4f8ZVWrtyKhltXjU3cFQjr2egxGRAaik5+qipVoXfX4EtemjKwQuOCBauOC@vger.kernel.org
X-Gm-Message-State: AOJu0YxpExETu68tKctEFLbKRMD20QwXyKjj059p2g1jWWkDgMC7r917
	99Ip4+BV0TU9C5lMPPAUl4wmbVFAacpe78A1xBGvc58R6O15BXuf0XFkzjHYheiBkdM495nzh7g
	TOSs4qDwICIDXB5bSorNQ1VrL6x1gqmggISdkQs/BgNMzcDgFiS73UwCSpJWHMXmkcHLt
X-Gm-Gg: AY/fxX5Ym/fDCqsIWdvPDtG/p99NgHn2fjUl5dEGQllVSauiVc4tQQLb4sD4PFuTU67
	dapt7v+05PqlcAKr+dkIJsZP6hgMrIZJ7g/Od7zsNmzvdE9HBFrv1UcPc40yTjMD41k2L49sPzp
	n272ydJB5rvmZsJWiwMPQQF1/2IKMzFGDadtde2EuF9qDa+YS4qjJ+YSYP6e3m9mNqRDKLYmOl2
	kC3sRKX8fn6ws3PVJ/nOW1Ki0HIw2a6E+4jv47utcIn0oV+7yV0iTbduA4mmXj9/CO3ACR0omYK
	o425nRGoh1I8wQklF5Ww3GZXQxxkjUCehwDAZNkqx23xEJi9INOjBR2yXZ0DIUt99Qec40xywvz
	vVLdXcyCwHqsYCyEInn10NIlmqYKdrxn3ug==
X-Received: by 2002:a05:6a20:6a06:b0:366:19c9:b6b6 with SMTP id adf61e73a8af0-376a7eed348mr34371656637.11.1767170779920;
        Wed, 31 Dec 2025 00:46:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG4+U2IkeBbX1/HcdXdKHMw6H4Izq1KXCINrxp8/XdIyrK9NSakGnoGoG6MHo680vuefgtD9A==
X-Received: by 2002:a05:6a20:6a06:b0:366:19c9:b6b6 with SMTP id adf61e73a8af0-376a7eed348mr34371636637.11.1767170779449;
        Wed, 31 Dec 2025 00:46:19 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7a018eb5sm31356070a12.16.2025.12.31.00.46.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 00:46:19 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 31 Dec 2025 14:15:26 +0530
Subject: [PATCH v6 5/8] arm64: dts: qcom: talos: add the GPU SMMU node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251231-qcs615-spin-2-v6-5-da87debf6883@oss.qualcomm.com>
References: <20251231-qcs615-spin-2-v6-0-da87debf6883@oss.qualcomm.com>
In-Reply-To: <20251231-qcs615-spin-2-v6-0-da87debf6883@oss.qualcomm.com>
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
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767170740; l=1827;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=yR8XbebGeiFEFUR19ke6y8GDTrPRoDL3ArbsouLBA+c=;
 b=gVetoMqRIqng8C/NpS/bZq3/41+ll+ihCsglRNgtftrruiHgsQEU8Ud2tMG8XCMpraLa4gaQp
 j/6cnOmAKzLCZ0aEKk/XzX6/CpW0DEzrPav/DrV8M3Lif69rf1ryTy/
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: Yk0vsoQrdDbWY5AKn0SGzAhNsMhYyBCc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDA3NCBTYWx0ZWRfX8wXyv2d1FDRh
 wYUx87ookeuGPZ9VScuv89pkzGvwsMXBlKbhNk9BkwJzZI0N9ao+pTEa9r0VhU/y7yLWbqTdohp
 CyZR/7lQnsIHdxUfArdg91eqM9mdTXQ7Dxh3n0jZF2dYrZso+qGSvEnpxatxcVxoSwrocnJflju
 HKcB+aBWtGdYUBpLn1gWz35fbL5L6ccF265KK3HrrptWY3rRIozPTBAUk8bb1/Q32nmBhOjE0PK
 9xfYGnJsZuCyOXCfEBE5odwWgM1u5yQNsPIAaG1bKORRwCQPvL3NAOmxV8PTRuKv+OEBdaWKiRO
 Azq7I4fcu0/No+iAlzuygu76KfvoWRbcc4/U0EcsWkZYq0HR11KC1PmFkdRrYyTW9eN1iKaglIM
 D+5gbP2W6r4jYoTjtl7dwVJphR5/qj9EMXDyNpan1z2dfzy76K5ZEVwIkZMczVWzWIpYowkf3P5
 Ef2yQrIjGD4aO0hMYHw==
X-Proofpoint-GUID: Yk0vsoQrdDbWY5AKn0SGzAhNsMhYyBCc
X-Authority-Analysis: v=2.4 cv=J9GnLQnS c=1 sm=1 tr=0 ts=6954e2dc cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=Qd8OTwLUrmNk7h6opE0A:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_02,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 impostorscore=0 spamscore=0
 suspectscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512310074

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


