Return-Path: <linux-arm-msm+bounces-82918-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E84C7BCF6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 22:54:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5A6AD4EC461
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 21:53:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F1582F7AA9;
	Fri, 21 Nov 2025 21:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hfecvUtB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="epfUeYic"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12BBA2F1FE3
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 21:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763762009; cv=none; b=pYNty9qjsFCtsYYyFNSssjE4OgdAgBULrzNy+Jfspsm2we2nBH39iehUq0CIhSP1zlsnXu4sFaarFqHym9ccSdKPmxGdqPypdPjnbxOveq8YfBRjZYNPMIYXh63EroXNBj2z6EEeEFijrXdvelBCJDcVz0nTsnwXqZLMYuYkkbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763762009; c=relaxed/simple;
	bh=/rEpZW/nyrJvs973apvHUv+6QXlttiM+mWTNP1i5vK8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RR0hPQndr9wFx8gie46iT2Pdog4wbro6TCqX3z7/PDGOgfuMBMXq+I5QKAThzaxZn2tbjR1n38Goz9EIE+Rk/ivDzdU9yLkskperYxHQvtkBox7h7FUBLqevw3srd8bZpaMmpZobEoSomzENlfRR2WFfN4EwjyimgLafL13l+3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hfecvUtB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=epfUeYic; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ALIILaw2746887
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 21:53:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YoEkueyGRAiMfd/Q7doMNmlVs1f6W8VCVBPpZYSbqeg=; b=hfecvUtBDr4xhEUw
	aFCnwq7/tw/e/G28N3fVgJFwHDeRgoY5rsRJragh197nKdDt26NaCEgZzY8IoUBu
	14WyLhNoJcKA9FTTtkolck188g5bdi7n1FqC+jxUer5NoQPNwV27xmosL7P36/Bk
	5WHTzrBH1PnjK0wZHX30e9JV+hHec78of5nBCmavVaIw4VM+nuHODeTjTeEGJ37P
	nKWdvB+b7CKRYtxiPNnNf6Zbzmd3tinplvGKlscEmUTUbUKdga8bdhjbtAVcKqLh
	t92+1lZHdNKH9L/2W3im0XFQ5FeKQGbq/5sOwFgazoHlbpsr4USkHPkU6xpCGur3
	A0WCIQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajgeh38dw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 21:53:26 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-297fbfb4e53so43035215ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 13:53:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763762006; x=1764366806; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YoEkueyGRAiMfd/Q7doMNmlVs1f6W8VCVBPpZYSbqeg=;
        b=epfUeYicSywK5uo+QUC6p+To6C74d4BL2QMrwpBskI0lF6T1pBYa5YWQQwDNq+VbJj
         J+Hf9TJNVZQbgRM7qSKFz5x2P7BkP1mg6oCuja/1K/kbPQwmcib3x82iv3krbcB5+soc
         L8iC55IxmQ16Yc/CiL97jtKhTvMPwPpaIK5bkRTX8FcHObdLLemRCuJsytNWT7e9iIRX
         SLNTx48zp0dlcmm8ruGT4BQde8m0nXQTNOUcjYGdzDINlTS/bLF/4J9VOOgBIBF/gqRl
         GNuR3jHjg1hiW513CY0qxU0/tGeMs9Zk1mYMnrSwF7rmOVS+BhmLtamxVZYCrwJRyM6u
         9teA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763762006; x=1764366806;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YoEkueyGRAiMfd/Q7doMNmlVs1f6W8VCVBPpZYSbqeg=;
        b=qOdxhfKGq+6Lk4wnbfAgOzFeHFUO0yjRMq09PQBYGHX+ddsQcAzj2TuXl2KzD2KkyX
         3ciXDgZcQoaUm/72ewsh0hEYlN8qqtQNOyGUgHtEP/HE65F1x6nE6zbI3Ev19ziHYnjg
         TlPOGSGZS2EaEXNVYd3oRLKNQuSNfy0GSYWySWK3smtiUrbta3tVhP79YG8pzHU77Ltd
         WYQvfnnzUFX3AQO7rdWpM25+QTF0PDEqSMGhT8CtivJ9ursSeUGLzjiZQRzCDcGxsdB4
         YLbAMUOiDJEaDNa6zORzQgLDbc86Qq1ptvTEeueY1txyr0mP2NoUFmnBpmQwmXgi+C9L
         7+vQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcfLX6B+v6aTeQBt7HWHJGVDXa78HpjB5dUg8G4SvTfKHgE0wCUdRjquMNukGSfB9T1uoAazpA8RxF+/9E@vger.kernel.org
X-Gm-Message-State: AOJu0YyqbNAe1NuwgTcU8nf167kA0fggfQJkQLegEAi9rUMYUnm2mWVd
	liXTMWEdrUOZFXAsxhytdNzpBnrjOkY5WxfnaOXhiJNa2/rqrcYwCjrQxN0JKOc9+q3eU/2mE+x
	VEzt2Tot/hCh6yiJ1BJWPYL+NQN33L4TyvL7P+imNURXk8y5a0ySVMIlgq3EQOCfUkcAL
X-Gm-Gg: ASbGnctlXFilq7RVvN44k2RtGpDYxJiANjqq80AllIsGGXwDM+bQ6N1qIEOhVXaQVy2
	dpmt0rCj94vyOv3/An14oTcv5dbtGHn6V2a7KRxgTm26PnNE3pVNxAPtJF36UAIHx5mUQEg5a45
	TXASd+bK/s5QKLLlinNtz0leaTM6NHVcJtA769KqdPV/XHPFW9hLcvoCaRRhVp3sULvmZTOC8mn
	pjh0N3TfetaawaWOIiddsxx3FurhTIzePmy5uWBwk1O55J9NUXw8x8Covajg/7IpPIN+tm1SW9D
	JJFgoSRWTJkEQbMetRJWgpD3pkWqy0YCc4FXMw/VBICMsX6yq+mbke/xmdw9xkg5Hltu+IKqd86
	VA3Hi1U7xw+wOZ35LlvQL0LHNLgDMHBlKrg==
X-Received: by 2002:a17:902:d508:b0:295:7f3f:b943 with SMTP id d9443c01a7336-29b6bf3bce7mr57332925ad.28.1763762005961;
        Fri, 21 Nov 2025 13:53:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH/BZzIAWj9eYtoZjfdFhYq2QQUL0Yy1J7PWU+USKHwk6VLoY8JPIN8Q5g/Xze3sjEhINVm4A==
X-Received: by 2002:a17:902:d508:b0:295:7f3f:b943 with SMTP id d9443c01a7336-29b6bf3bce7mr57332775ad.28.1763762005503;
        Fri, 21 Nov 2025 13:53:25 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bd75def6314sm6399270a12.7.2025.11.21.13.53.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 13:53:25 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sat, 22 Nov 2025 03:22:20 +0530
Subject: [PATCH v3 6/6] arm64: dts: qcom: qcs615-ride: Enable Adreno 612
 GPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251122-qcs615-spin-2-v3-6-9f4d4c87f51d@oss.qualcomm.com>
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
        Jie Zhang <quic_jiezh@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763761959; l=818;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=G0zTCxAvZRtlsdP6kfDAlHz0/SPT4i0igeosXxhSpIs=;
 b=UbZP2+u7xwSxifbmFhS00jQ5//QuBFBJ3iJG36yuYizPabimYaRuDuTVZlieh8B8RWujVwS4X
 02z5wPC8isCBS4Kn2o58wioIRiGaRNFvL5AnTCMusCeanbW/ZlUnlI6
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDE2NyBTYWx0ZWRfX1IUINV64/Gp6
 mrIpgxqVAs52whFZ8ZCe9LhigaZoABtiZPhMaBdIFkRe0KuAiEAx6HD1TYqEbaIQN7lbKXfdjzo
 64Jtov+44giY9lRkI6kupWV24C+uR9ZUdsdBbNUqQlUUG3HUZdiSaqWM2H5YsjKpPGcclx3g6Mu
 /pUYfjETmUPppZsAJTxs5OyOoUF4Bs38oahifg69Bdwj/pr0wLOirXQVdeS+lVfCmu/cQN69kOX
 Ufe6JIqtHg8WY7CtXaC0/ZNhT0h0KRdOmQTZkHgP8NY6aiVvkQaBHZo+xQPCI+AQc7RosEXOZ1I
 e+Xtp+w5XyXyJrxBZtmlFrkFg2KlarpLnOfNLVhFLt/6nQwIOu9veemRp/Bc6cSvlAz1PWYuyb4
 7cVpoWLWbRxOzBIuaye6hmAhU052EQ==
X-Proofpoint-GUID: uW11x5f0TUvJe-DajvCitS3JbkRZywPs
X-Authority-Analysis: v=2.4 cv=AubjHe9P c=1 sm=1 tr=0 ts=6920df56 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=Xl3f10jGzgz6Ja07nhwA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: uW11x5f0TUvJe-DajvCitS3JbkRZywPs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_06,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 spamscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511210167

From: Jie Zhang <quic_jiezh@quicinc.com>

Enable GPU for qcs615-ride platform and provide path for zap
shader.

Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
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


