Return-Path: <linux-arm-msm+bounces-87083-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 955B8CEB982
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 09:47:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BD72B30487CD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 08:46:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 864E33112C4;
	Wed, 31 Dec 2025 08:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M+FYPg+h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pqg0b6Ni"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06018312827
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 08:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767170802; cv=none; b=Dlxb6FMdxj/QmUxpdxWYCF2XOu5V7/M7g9pkkEW6l+W1hkIShYRvL8hnKOrx+sau/2tywWGcxD3m8Lc7SKEz5tAb/G5PSZiM7N+i2k3lAbPwmwE+4dmuYxY0VIvGzymXfYut1jluAG0BSXrn2wFX78SJgLgWE8N8mjEaw/SW/v0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767170802; c=relaxed/simple;
	bh=7g9TAerjfKwdpfZPTYPbKsR61B304Bdbp5f6xLA+7uo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OXepYnen5m3RNWKj6xOblyBs7OSdr/WbdKQU2ZoSiLsffKLw3vo5Iy4R9LvzZ3UVYhfrJtUX/I+1nhtegt2ZPk9/k6x6z6qdAVTV8C8E5rMSZoOyfwsnh8FX9NuQZ2jgVpPDAHNxvMgEBGWMvsNR4+/FOR93qrlVChkhh7j+X0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M+FYPg+h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pqg0b6Ni; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BV3dRJi1830517
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 08:46:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hSJVO4tK87kiMBy9KdDNkzWDHU8geTacMo07r2QMtRA=; b=M+FYPg+h+wwGyt4K
	J4uNakAEcu7oXIxs1dMPENFXZuor+sO7IM9qoWGbpH4xca/tqPZS7HmZYH/YOJbF
	5lf1QgnlYHGvqBEi4jEeTcXUzVvodN9SecSqF1FqfoZanZ6fNPz2qfOuqXsXQyJi
	0HcobTvHj/iHlEeAWbGw3A7IbJLwtFXE8muYNx5WqEDB/892IBuFnBuqgRg4cvaR
	SYT5ycuikmKO0zjIrSpTY6QzpcpRDkCzYcNeWuMhKJDmcJOqPin54Cmv+xbnSAMF
	M5YH1ytZ/meYgC0NEFjEKXGG2I0va8li2jIrFXWZlA+zrolGEJcoDVtIYWFseMYP
	2Nmbyg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bcv4agh0j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 08:46:40 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-34c5d203988so22501374a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 00:46:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767170800; x=1767775600; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hSJVO4tK87kiMBy9KdDNkzWDHU8geTacMo07r2QMtRA=;
        b=Pqg0b6Nik2h6mR8Nu+uljhFsUHOhktt7/Ayi2dZ/lGcboWV1rbB5ECJSEtt70Xy2SZ
         WzNiZSHhKhaDmYDLGeZqFRyC6kwdF7JEC3BTcaL2LoBEDWGueoIeF/q8v33or50y6iYj
         07grSLkqK4uP1xueUWZwHo8L7e9r+tZ3eIX1ZJQT+nGEtFJcE6Mh5FSDgrZkL/gVxBMQ
         z6YYMOyK5pxn96UMn207QkjddNlAbCUFguZ7X+QmYzoLgyt1uio/eJVEHRw4488rdKwP
         picJbA6zc2D3GII6HqIOlZVdLcbrkzRgYa5/I0dYt7szRAYX1it8TooBAXthrUG2aLkP
         b+6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767170800; x=1767775600;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hSJVO4tK87kiMBy9KdDNkzWDHU8geTacMo07r2QMtRA=;
        b=HMRbozDMJ4hbQ9Fxg/aVXYrd2EFe+yR2LCy7fgRxlESl6g/uhMNUN1bh7vJ2LPBvnJ
         S5VMiEsB/vNC2NdjlH7Q95Izb2bNZVLRmSlSsXpmrTmrpt2XhAuDrDqG3GxPv7n03cTW
         q7BE7Ku/fxce6keakX/RBBnzM9FxLGr6RPpIBjxLYHqmcNevUVVcpQ9Frd9tRdUTpMop
         L9qIBacistsFh8TOl8h0xTMjMQlxNDVo1Nu8JWlR7enFhifeJqFjOQjX+o1Mm9lRtUs0
         W6WHWtHegPT4wmIv66EPDNrjYmcncPuWDS5nut3ahHfG1TEqrw/UIgNPVXBSm2bLCRfz
         /F4w==
X-Forwarded-Encrypted: i=1; AJvYcCUDwHL8lZCOy5ryLlYDhJ3n026KgGeLJYb1v62HG0ExQm3XdXkmCdriDNN//OdCH5YWy2PdlbTtoEGwb4vQ@vger.kernel.org
X-Gm-Message-State: AOJu0YxWdqEy+bhFvEVeUEBDOYxCQ4X6vdMcT4Fyj2x7EbCb25tSkdzK
	6SEZG+CYLl1hdeVb3i9EVBpC7lIKv8uXtAtpUj9k5KTS8doFMScsqaut/0ZnpQlDIm3bfNm+Y+Q
	W6GVlSi8kD9rqhbqnCJKDfsjDq1hVCSagauiuJKU+8PFIaTHzDy/PA5ghk8pTfXawYdRR
X-Gm-Gg: AY/fxX7KFJecVd3Pulj1x6pc0rNOecfiqaUl7TGEqHUNkMM4yWsIvGEq7fArGwD6mh3
	J9Kaq4oSf3pkm4vzxkc00r5lUFXiuxdzCvyJXHrEsnwQ3Oh6shRCJLrf5W74G1tu4ACN2ETXlqN
	l2v85ME0PRtlk7BvhPxJ/tS+UMBeOZ1VUAOd4yGhJ4BpxOrTnmZqUkoHaeAm/FFZ62K9aqbHR/V
	w/KoInQYkt/iXe9DG94UrEJnCsT92JmgsNZswKQKuN3jIiAUWA0X9SZd1AKOo4fSwitvT0CcqAK
	Da4TnskB2aB7aUCiUQAAm11BTfOc737Prkwb/fdi5XGONQz3rb4dVfajvbuoAjpQLF/6Xvfb8Gg
	6/y2xjAzQ6fgDh/TjJfDan2aFuN5xnEvz4w==
X-Received: by 2002:a05:6a21:3287:b0:342:a261:e2bc with SMTP id adf61e73a8af0-376a75ef289mr36084155637.10.1767170799752;
        Wed, 31 Dec 2025 00:46:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF3LZj3aQ3RmMZbRWDxlR3G3JhJ3X0q7dn5q/A2YUImhvN5Ny7zsayFNxHV8gsdTQfjWlbRwA==
X-Received: by 2002:a05:6a21:3287:b0:342:a261:e2bc with SMTP id adf61e73a8af0-376a75ef289mr36084134637.10.1767170799263;
        Wed, 31 Dec 2025 00:46:39 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7a018eb5sm31356070a12.16.2025.12.31.00.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 00:46:39 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 31 Dec 2025 14:15:29 +0530
Subject: [PATCH v6 8/8] arm64: dts: qcom: qcs615-ride: Enable Adreno 612
 GPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251231-qcs615-spin-2-v6-8-da87debf6883@oss.qualcomm.com>
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
        Jie Zhang <quic_jiezh@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767170740; l=885;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=svB5zAKLQ4ilLlulEeGxv7KOsmVUcgmPTb7ChJwfn9M=;
 b=SKf1bNvomDSWmG3I8m4P7wZQxwQfsnNcfm+afJ+hVBPYV2hrCwZL4JR/ccPbJ5L1auWMMFXym
 jLF8qQlA3EoDRG8q2Cgu1Ohk4yJFgA49MCX9/x51y4BAwFJrJjdAWNM
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: 6E_QKr7-Of-L2CRsRPtRPnQvNrexUiZ-
X-Authority-Analysis: v=2.4 cv=Ps6ergM3 c=1 sm=1 tr=0 ts=6954e2f0 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=DDenb0FKNr3EH7qfFfMA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDA3NSBTYWx0ZWRfX62ZsRHWIOWzS
 bxBohK5p8Lb1uvGCSbuR7U95jCV9YimIBRZJ2BnZowpuextiUDwpDxTvtWZmsgpJgOxMZK01iQ6
 sw6p0TXh04LTIDZfMK1O4Hq+iMYGLPl8Qt/GBNmRv/GOltSp6HOYXJT1Hq/HstExrtJltfxZ8/m
 i2hpixfCjfxRfsnfl0a8uIuThv6vMgIsuSs6Ljsvkdcj8SkXfm8a/rCzFYBf66TLcRJ9E+/b2AF
 htCISgSDoXM3I8S8jRkn09J1DtEhde37txm/cvyAET1JO4gS12VmPI5HJB1xX/+1vFNQvU9lwOV
 Xk/wYQRiD6hIBjeWC1djZFrky8l3XU2x9Qy7bRYi41QDpYZ985X/adb7eXZ/SckApnsDBpKmld8
 9P1BfKnRu9PB5hmNAkpjElugcZmemc6ch+YS6DpLj5JG76kIlCwgx4vCLOROTEDVZD7lglCxTOm
 wMS3xywcOELZFtFogew==
X-Proofpoint-GUID: 6E_QKr7-Of-L2CRsRPtRPnQvNrexUiZ-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_02,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512310075

From: Jie Zhang <quic_jiezh@quicinc.com>

Enable GPU for qcs615-ride platform and provide path for zap
shader.

Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index be67eb173046..33e33aa54691 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -358,6 +358,14 @@ vreg_l17a: ldo17 {
 	};
 };
 
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/qcs615/a612_zap.mbn";
+};
+
 &i2c2 {
 	clock-frequency = <400000>;
 	status = "okay";

-- 
2.51.0


