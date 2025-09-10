Return-Path: <linux-arm-msm+bounces-72968-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1B4B515A4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 13:28:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A8F12B60A09
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 11:26:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3C4E2C08D1;
	Wed, 10 Sep 2025 11:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WF5z1w/i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4140931B110
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 11:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757503599; cv=none; b=QtGwIeHBkcvk7Fqi7dSOZuEEJCGmpZNGTuQlM1cickf3P22NI11gyYkbKInEOHDDLyMGCTW0evS/TUb+JcE0daAylkzo1L/kRodLOTkTwJGN9BF5nRFc8U3iJjxT9KOnjLlI5yiSicg8KSZEelaUnCf50IgRDNmMTXfcIGxj8X4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757503599; c=relaxed/simple;
	bh=lvtizlHL6MS7eo9olZSEO8tIpxGFiSCKBoj2b3IlTA0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KXxpfUZ3skjygl/6Oa8bbOT7HfRjWiunJwB2zgzFfSr+zlqpyLRSXtBbztRI/EKriD9psaya6N0WBVbaFGniryh3YbGKeDiMq3HI4MZx5tHgRgKCHEgg+JbIeu3YCEMfi5zSVN58oSnnLweTgxBL/bB2IqE4oCDxrHlwTuYZbBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WF5z1w/i; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58AAFEWM012468
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 11:26:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uTuT+xoD9CIqTmF+XCt73ZauYNq2xf3D0o4LX/E4JG4=; b=WF5z1w/imCQRNDQV
	2zRa8DS5c2KZfi1kyN94/IxTDYN+cV4qP0SE8/EqgupTZv89TB35c7CCNwVPy/La
	2DU4vfWz8ijebHnw2wExRXvpsDDKhfUWJh8Hb9BTpweQf4h2BxBS44HVxDqJDWkx
	rxBOyFmPh8C/YoKIv8iR1qX0A8ZhMhtmXGeNFApHYPg+nVzESXwETtDCtOTWiOJx
	rUhFc0mfMOqHRc6U3DO2qxA0ccGRI3C2STLYSuh5Nn+yvxPypKrDUed6eEaDqFN7
	tUqrPLwB/MJdVIRcG6z2a3KI26sIcx0uPT+TWFw+NAPNdPX4FSuQGSyZxgjjWe94
	cFeJGQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490bwsbsn7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 11:26:37 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-76e2e60221fso13266224b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 04:26:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757503597; x=1758108397;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uTuT+xoD9CIqTmF+XCt73ZauYNq2xf3D0o4LX/E4JG4=;
        b=wC6RYSG/J68xGHJ5JWfUGhraunJX+siovXabsG5P058bLPXN22YYGPpuvZ++lBPFt6
         gjXURDea6o2BAYvg3tPgrPDjOn1+8o2kiAVm1g0APLSyK0lbGoChOUISaZHWZMe5o0BK
         PJiaPnSaCc8f52GkVouDorFh9E6S1L+PYyt3c0kqB168BODkCX46AF2m9DfIEQNTPg2a
         kqlaOHPnjJRP3LYJqPikDn9xUNtjz699HLRfdz0GW/zzgnF63TWiiWmxzorBwsGjPxZy
         c0jQgX9vK0W1vpSFkDTHqIR7obE1TRDZqvsMXPcnRc3BZDv/1Kro9P9BUIEA5CSRFcjw
         FbXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmG5yJPbMcDtVVs7dWpRG5C90ZKVl2vnNPpoTtUinaQ3lnveB15C9g9g5bhkMZopvkaCjIjLmmuAAWEKy5@vger.kernel.org
X-Gm-Message-State: AOJu0YzJyksbVe+aBsELLPEQg3tZxZZWjv3xjL8OSvEYszMTTYfZMkNN
	tVANcqQMNQJjKnMo4tDTR7Bn2UctEDXNmnzcVAUYA+hFxTMAgrVQ4DxJO3abJtt7HKuqYiWyjmU
	Guugq8Zc0qv+km8yDGqdfDgMdRTpu/Mvrvn/sY1HZoK869HiqVG9tuuX5NBFs9Uy7nfEo
X-Gm-Gg: ASbGncv81FEsYot3IIchJpxj3lomJKdVzVkOVmmqAcGVHFNNgIy82i6VI2+SHgv75fY
	v3zZDNbSWt0lEeP3f0vBhXhLztX6RMT+PFSjkExEDo6lZE9TZUuxVBTG9lhfQNKGeSaomIeugcI
	HcYxCOPKa0+tYBXWe1PDKHu98hojhrOnp+IPHr97o+M+e1hEHWYRLF05vEafua0L7VNpnsRfFXl
	Y1MNa3jzQmXr2uNca3422hswivoCslm81B3Wg0CV2xpTkr42r5LhafFAx2w8cVPJ8wNp9adnV5o
	FldNZj5vU41vUxARe7WXaAz8IQFkOsq7GUcoKKpgPlCnmVTiIcq3YApDyGjttrZl
X-Received: by 2002:a05:6a20:918b:b0:245:ff00:531e with SMTP id adf61e73a8af0-2533e94d135mr23613234637.12.1757503596583;
        Wed, 10 Sep 2025 04:26:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHu8n38cqjdfKt9/1s/M/MeQK58nlWTbkHvgUjuxlUJFIC4snQmD4oj/oPkqGgfcrDAzAET9g==
X-Received: by 2002:a05:6a20:918b:b0:245:ff00:531e with SMTP id adf61e73a8af0-2533e94d135mr23613180637.12.1757503596105;
        Wed, 10 Sep 2025 04:26:36 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-774662c7384sm4862260b3a.76.2025.09.10.04.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 04:26:35 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 10 Sep 2025 16:55:25 +0530
Subject: [PATCH v6 5/6] arm64: dts: qcom: lemans-evk: Enable Adreno 663 GPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250910-a663-gpu-support-v6-5-5da15827b249@oss.qualcomm.com>
References: <20250910-a663-gpu-support-v6-0-5da15827b249@oss.qualcomm.com>
In-Reply-To: <20250910-a663-gpu-support-v6-0-5da15827b249@oss.qualcomm.com>
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
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757503556; l=802;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=lvtizlHL6MS7eo9olZSEO8tIpxGFiSCKBoj2b3IlTA0=;
 b=JAVAIdqmrnue5/ks+VzoXSDwPNFYkasv5RLMnK3+t3s4vjQQ4iplYXmNDUzqGDU8F4giYFc6Z
 NdvaJx8nFTYCc26y9qynH/pfcd6GTfKURUIPJewQ3LieME0ZjgXcWcW
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: a54ezRPvBX8Pq5M5_sRmVesq0avwAT74
X-Proofpoint-GUID: a54ezRPvBX8Pq5M5_sRmVesq0avwAT74
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfX33ncXkgBbs3m
 USUUJny4rKWui6QhOKOOZZjv1jqdIu8Kk6qTPZOfdB5RPOsfEqT+5L/BOZWYyt/u9Pk99bORhh2
 17UymbqyObFACo1zKLk7/N0L5QJdGD4dRCXzhPJjhoJqq3AlXiU9NuMLdPEcjH3oHzGfduyOMFO
 fLkH94lvX3tK5XyLdJkDrh1kaPavC5uIgTNRBmXRl9X47IM8Hyhg+365W3hEvdbsy58DFGl/1/F
 JhxG93+nMlgHdXUkwHi0oGfw16OBFgc1O+ah0Dh5feMRfEzm2AWXJLPCBmiW+Mi9BgBC5E+zLWr
 9TrhzIjcyTOdY+QHT4zdYZZC4NuoIH/85MWV9wyZ/uQ3ZuTdEwIl9l/FqRjGk7IrZ/ByVLnXREM
 3CgU80gn
X-Authority-Analysis: v=2.4 cv=G4kcE8k5 c=1 sm=1 tr=0 ts=68c1606d cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=Xl3f10jGzgz6Ja07nhwA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_01,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018

Enable GPU for lemans-evk platform and provide path for zap
shader.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index 669ac52f4cf6aece72141416068268531fd9f79a..876f43d761870b968e43ea1ecc360b4403f19fef 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -253,6 +253,14 @@ vreg_l8e: ldo8 {
 	};
 };
 
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/sa8775p/a663_zap.mbn";
+};
+
 &qupv3_id_1 {
 	status = "okay";
 };

-- 
2.50.1


