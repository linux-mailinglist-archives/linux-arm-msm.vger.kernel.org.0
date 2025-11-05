Return-Path: <linux-arm-msm+bounces-80476-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 55AD2C370B1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 05 Nov 2025 18:22:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 68147500198
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Nov 2025 17:12:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 871A53321CF;
	Wed,  5 Nov 2025 17:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W4AnqI+8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xt3Aumls"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0B89322520
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Nov 2025 17:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762362716; cv=none; b=obvccLxtThsARQWsOrBTo07TphZsRCmqgZYAPDzr+zJalStg3eFAozvNfap8WEEy0kCpgaDVdevtCmpBMRBzGHlw85VbcrVvbTrOqlyvh0bFXuW0F3gHRo3Mk8r4qWGT9mapmagRlSTqwIiAVpdjHSus10X6mZrFOWREqIp+xrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762362716; c=relaxed/simple;
	bh=lMX4kCPNqOTeLDOBVzvhpufTCfXT63k6HW4Tn9TNexM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k3sFbkRp7WociMUP6xybKnx5ngEsmwWfgrQKk9dM0RCxGgXOOFKQ0VzIM/uFZyyTRPl2lxDHu9mRqJajIaBgLwT3+XFgyN1BpDrRacOxLDTGGu/Bb3j1yWs9c9NDN6YyZOcD8Am7jIsYXmw3Ys4dkE99ejFIM+7vaCraO/bBb+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W4AnqI+8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xt3Aumls; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A5DRmEL3915109
	for <linux-arm-msm@vger.kernel.org>; Wed, 5 Nov 2025 17:11:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kfzOcZZirtT8HZ7OD4E7+z3+wIvlIJKhbk0Cjfs6V6g=; b=W4AnqI+8Pt/PhvvU
	r7ioCxxpegd0b9tcPcRGGFnbQ7nrui3kzG9+d+8EYiAIjh5u6+5CNb4f+ILd6SO2
	v+i0BOYXvYpvtE95m1C8tFh83JIkrjBm4ld0Tc+GvX+UOpWurfPV2kBTTzuOpEIM
	UiKn68JaKPUh/iMddIm68jnURAWlymBHQ05lgAqrR/ewmZvCsoN7916sHRYieXNW
	rMiCjj9Xs3CkwDXvm7RgJyeTm/3SvGTejBskYb0Wo+//YpeAE4AVYAhZEpAQoN9+
	ARgNEwYrha8SD/qEoeARseVxaOwYI90v+3rel3ezpUbdXnJgXicDYzAkRYdNvxK7
	vSrDgg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a7y37a3fn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 05 Nov 2025 17:11:53 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-341cd35b0f3so12032a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Nov 2025 09:11:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762362713; x=1762967513; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kfzOcZZirtT8HZ7OD4E7+z3+wIvlIJKhbk0Cjfs6V6g=;
        b=Xt3AumlsRBBQYCB6qwSGqYZzX+CioRFXVPeqo7PxXS7BoYMyvUfIjCohS68esAyShB
         V3C8ezuYJPvfLYSpSO6M0LOc24jw8tusF157z2zGFMdrTDIYdciF80N3BPzgXQpqO0eN
         Aio4raQrdCcW8XGS2+KLzaVsTbChIT9lSMCYmbBGjo49G9Oy6JCjL+l4INdSEc+vms74
         jeoU8++d3aiXIhn6PfO49SJMAGZEPj/YJvUWd46moFrzIhHWeuLIQ2nLvkRn7n4baZxw
         X8EWgwCnZPkWAA87ImRla/nH6JtgGXrxqGpn8yxsD0pAJ4ivZj4uovlt3aY9KHiDZVGH
         xB0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762362713; x=1762967513;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kfzOcZZirtT8HZ7OD4E7+z3+wIvlIJKhbk0Cjfs6V6g=;
        b=PCLCloQKJnuRxzKJZvnjpGUd/vSglVEebbg+hdu50SWHQD3FELBWm6nm0wMv7CaU8J
         S/xPZDpyieZDZk6dceIgILPBxArmL3ZaLxWatEKppuYZlR2uELWdEofrAmsQDnm5lMNE
         SoIxJxvZDUGeXur++1cz6PoSQeN2Eq4SSHJUnCGavFW4VjNGs4H2IOgIibOjUulYsIdw
         +e7jjReCJKAMCD7aH4jjwqcDZOxaKmSs7QBEfvR1bf2ogDw+yWhlnSFex4gaufjE96tJ
         hRBIGJzNNB1Y41rOOvkhLO5SVst0ksDvmhIfNaC7fK+TyWXjiKW+mDkzpiQjF84MNlKd
         Z8GA==
X-Forwarded-Encrypted: i=1; AJvYcCX1QeGJkxRkJWGty6V6xD1vmUiW0lez61PPKfh2yr8j+x0DcB5WePsiSxyqXR+YXLuAE6MVl8ZirdtiGeU5@vger.kernel.org
X-Gm-Message-State: AOJu0YxzQT0AInZYCgilkTxMmPp/9jBz0LwyKxptMjP72E5x+74BCyfW
	4YdLBUXKY+iCOwkVMFlLg0Tfpks9n6kRR1JvNLeFzsYsPtKXhTlypoCM6jVBJL3aXnWVCJIMZH9
	Bh2qc+SeGtN5u7DnEeD1DPUvCZ5gdPFK9cufCSU31ymBSyuweBqlEb8z0YhMzcXr7j9jL
X-Gm-Gg: ASbGncunYGORAs5N5rJzacHYVfSV37PtTeGyHboldycIJVylJFNcF5caSm+Qwl+rco/
	8wwzr7v2ON2cRs2ecDa75ZMLGSOLawBoMSYB1TZAOSFlm2rp0EVTgWgpVzO6PcCJvNDF2LSUtWY
	619jy2ExCV6PxLN9fmu6Pn2cXR+hJytvfclMD4RkjlcaYsLKZoSY6KW7OfSlmxJ7h6oQ17zWRML
	1GIdj47ouxSJ36DGmCNG1e38MQW27ZadurY8R2xTsPWO+9SqviH9jld73aiXBMtVI+8dxzoMqjP
	/ED4XHsK95YBBDK+bbt+ob9A1At0MAWod9to+TSHB2Qu1HQ/iV9ePLDrIYk54r+YDp4KzL7Qa66
	pDjfIkN9xnBYGrvcQDHEtbSs=
X-Received: by 2002:a17:903:41d2:b0:295:4d97:84f9 with SMTP id d9443c01a7336-2965161d7a8mr1503865ad.26.1762362712604;
        Wed, 05 Nov 2025 09:11:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFvIW1HFqhmvIwAwGv2rLknSE++L/0Kik510kANbZIL8U4gqvYBCfAwpJ0+R3u6sMecZDEktw==
X-Received: by 2002:a17:903:41d2:b0:295:4d97:84f9 with SMTP id d9443c01a7336-2965161d7a8mr1503005ad.26.1762362711797;
        Wed, 05 Nov 2025 09:11:51 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29650c5e3c5sm813955ad.43.2025.11.05.09.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 09:11:51 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 05 Nov 2025 22:41:32 +0530
Subject: [PATCH v8 1/4] arm64: dts: qcom: lemans: Add gpu and gmu nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251105-a663-gpu-support-v8-1-62a7aaa551e3@oss.qualcomm.com>
References: <20251105-a663-gpu-support-v8-0-62a7aaa551e3@oss.qualcomm.com>
In-Reply-To: <20251105-a663-gpu-support-v8-0-62a7aaa551e3@oss.qualcomm.com>
To: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Connor Abbott <cwabbott0@gmail.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: Gaurav Kohli <quic_gkohli@quicinc.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762362697; l=4605;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=q5yoK0aGVoBG4sHWRtdr6dM5sWcCy8r4teR6JiKmHRs=;
 b=JOGa9ksmoO1BNpsfF4x1iwSIUYHT2rHUFw1iLeJD7sjFmVw7OumZriUCHeixNa3xDxC6EyzDw
 I0fUBTcNTT7Dg9bqiT5cqYyAd9BzgcCKnhbY7XGhU4u4TvLmA8d5jEd
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: 9w_rSaBNnzCdI3gReceDoQ2gDNEbHW2m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDEzMyBTYWx0ZWRfXz3px44wpMc9q
 Zqg6QumWQleDWNFK4hPx2ZYFMeR1wZENnjT17NddCxVYdJGXm8Kh54om2gq/jfpUX9cnWeDM39t
 /ld+HalG7NWRaZglzzOiV7GWhEJlvKY7YR8QNBM6Hx8YXPQp8WJ4WpNuPE8MOtq5/KU1J4hImqj
 mXV8NASBMvwnm9cqU5kKi3VbWdfB2GaMoo932drbfh6sLiMs1HE+VzNKfgS2QYAbDQialVo8Y5g
 sMmoHeL3y8lQXGT9BcmjKzAZ4U4oETiOcUwYD3je2/J+eukrv7tygACcumPVaLyWdh6tYhBYeXY
 YzazPj6vmRbc7DqbLrSE96qEJzxzhFnpUhFM71v3I0O0PGD+6dIxMQw4M3JrV3X6kbycgux4auu
 ym1cG6hCifsuWtNeicV8YphXd44aeA==
X-Proofpoint-ORIG-GUID: 9w_rSaBNnzCdI3gReceDoQ2gDNEbHW2m
X-Authority-Analysis: v=2.4 cv=Ev3fbCcA c=1 sm=1 tr=0 ts=690b8559 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=D_IGQ_qLm8RrHFHUsBgA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511050133

From: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>

Add gpu and gmu nodes for Lemans chipset. Also, add the speedbin
qfprom node and wire it up with GPU node.

Signed-off-by: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 119 +++++++++++++++++++++++++++++++++++
 1 file changed, 119 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 0b154d57ba24e69a9d900f06bbb22baa2781cc3f..883f9e0ab45c98b9e128f3fa141d625431d89831 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -1098,6 +1098,18 @@ ipcc: mailbox@408000 {
 			#mbox-cells = <2>;
 		};
 
+		qfprom: efuse@784000 {
+			compatible = "qcom,sa8775p-qfprom", "qcom,qfprom";
+			reg = <0x0 0x00784000 0x0 0x3000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			gpu_speed_bin: gpu_speed_bin@240c {
+				reg = <0x240c 0x1>;
+				bits = <0 8>;
+			};
+		};
+
 		gpi_dma2: dma-controller@800000  {
 			compatible = "qcom,sa8775p-gpi-dma", "qcom,sm6350-gpi-dma";
 			reg = <0x0 0x00800000 0x0 0x60000>;
@@ -4135,6 +4147,113 @@ tcsr: syscon@1fc0000 {
 			reg = <0x0 0x1fc0000 0x0 0x30000>;
 		};
 
+		gpu: gpu@3d00000 {
+			compatible = "qcom,adreno-663.0", "qcom,adreno";
+			reg = <0x0 0x03d00000 0x0 0x40000>,
+			      <0x0 0x03d9e000 0x0 0x1000>,
+			      <0x0 0x03d61000 0x0 0x800>;
+			reg-names = "kgsl_3d0_reg_memory",
+				    "cx_mem",
+				    "cx_dbgc";
+			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
+			iommus = <&adreno_smmu 0 0xc00>,
+				 <&adreno_smmu 1 0xc00>;
+			operating-points-v2 = <&gpu_opp_table>;
+			qcom,gmu = <&gmu>;
+			interconnects = <&gem_noc MASTER_GFX3D QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "gfx-mem";
+			#cooling-cells = <2>;
+
+			nvmem-cells = <&gpu_speed_bin>;
+			nvmem-cell-names = "speed_bin";
+
+			status = "disabled";
+
+			gpu_zap_shader: zap-shader {
+				memory-region = <&pil_gpu_mem>;
+			};
+
+			gpu_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-405000000 {
+					opp-hz = /bits/ 64 <405000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+					opp-peak-kBps = <5285156>;
+					opp-supported-hw = <0x3>;
+				};
+
+				opp-530000000 {
+					opp-hz = /bits/ 64 <530000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+					opp-peak-kBps = <12484375>;
+					opp-supported-hw = <0x2>;
+				};
+
+				opp-676000000 {
+					opp-hz = /bits/ 64 <676000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
+					opp-peak-kBps = <8171875>;
+					opp-supported-hw = <0x1>;
+				};
+
+				opp-778000000 {
+					opp-hz = /bits/ 64 <778000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
+					opp-peak-kBps = <10687500>;
+					opp-supported-hw = <0x1>;
+				};
+
+				opp-800000000 {
+					opp-hz = /bits/ 64 <800000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
+					opp-peak-kBps = <12484375>;
+					opp-supported-hw = <0x1>;
+				};
+			};
+		};
+
+		gmu: gmu@3d6a000 {
+			compatible = "qcom,adreno-gmu-663.0", "qcom,adreno-gmu";
+			reg = <0x0 0x03d6a000 0x0 0x34000>,
+			      <0x0 0x03de0000 0x0 0x10000>,
+			      <0x0 0x0b290000 0x0 0x10000>;
+			reg-names = "gmu", "rscc", "gmu_pdc";
+			interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hfi", "gmu";
+			clocks = <&gpucc GPU_CC_CX_GMU_CLK>,
+				 <&gpucc GPU_CC_CXO_CLK>,
+				 <&gcc GCC_DDRSS_GPU_AXI_CLK>,
+				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
+				 <&gpucc GPU_CC_AHB_CLK>,
+				 <&gpucc GPU_CC_HUB_CX_INT_CLK>,
+				 <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>;
+			clock-names = "gmu",
+				      "cxo",
+				      "axi",
+				      "memnoc",
+				      "ahb",
+				      "hub",
+				      "smmu_vote";
+			power-domains = <&gpucc GPU_CC_CX_GDSC>,
+					<&gpucc GPU_CC_GX_GDSC>;
+			power-domain-names = "cx",
+					     "gx";
+			iommus = <&adreno_smmu 5 0xc00>;
+			operating-points-v2 = <&gmu_opp_table>;
+
+			gmu_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-500000000 {
+					opp-hz = /bits/ 64 <500000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
+				};
+			};
+		};
+
 		gpucc: clock-controller@3d90000 {
 			compatible = "qcom,sa8775p-gpucc";
 			reg = <0x0 0x03d90000 0x0 0xa000>;

-- 
2.51.0


