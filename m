Return-Path: <linux-arm-msm+bounces-77812-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39847BEB090
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 19:15:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6DF827C208D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 17:10:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0F9D303A2E;
	Fri, 17 Oct 2025 17:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d1t8nGVS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 243BD303A3A
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 17:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760720978; cv=none; b=IAYhkYJoOVpkT6dfoJa+e0G18S7akfbrSd6XTxCcxqEi/OADxkSSZqU75fcqcqGZP9DIAP2vZoN+LFlJTnR7q/7zxnBq//HvaXdt+uN1P6FyW6HL8S0InlGXzpusDJExasac27+8rKXCu/eZ9rBRn0HA3J9eJGXScncXV2wQZuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760720978; c=relaxed/simple;
	bh=FsAmFO8jrPuC9HJylbuiPP9BJvgaZSVRLKxlOwDDju8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DcxkgVfj76i9gOHXpTUA67wLR54M0/+pfXU7xan8sjY5u/2DolgFAUmHLi+XexZd5SAs5ytF3RHqzpHWzoj/LwCiOMyPDKPKAekYfBLNPlGmz3CEUT8GyrP+QDgixmANjW4FCLJOiwg52sA7ePyxxppnfs8aRuoGqjbzC54GBsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d1t8nGVS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59HGq7Cw022287
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 17:09:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ugvhCye14d4WMYIug1/zGBbRQsvBfvHQDJkjtw/ffv0=; b=d1t8nGVSWhSBFPCj
	hhBDCnzqB9XG/t0Tt8rd66ySW+9QrkvAkwOWrqxy97X9OVzoBgwZ+EAvHPuVC897
	W34o4aLhzzdJ1hfa7OTndabL+cWSS05hwH8A+QyWPpniKILFcx8bb+iOTPXhAEtq
	sSJpKX8ygIeDtBAXO7IefKZMUJnjEZaYC9q2WA4VpoA2beM1jO8VRhDK3mvLJBQ4
	wXMBUQjoyBQjvt/SwZZ5jVy4qmgM1FbnFLtj0xtgSAFtqNftj3O5e+ay5NQPtCY4
	7/8jAaQtLh8/6vRMo+nfFQuayMIwvUqllnEEJGCoa9w+g655ETtI092E3ziHqZw4
	mBIVAA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49rtrtj2ku-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 17:09:35 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-28973df6a90so22086795ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 10:09:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760720975; x=1761325775;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ugvhCye14d4WMYIug1/zGBbRQsvBfvHQDJkjtw/ffv0=;
        b=jlayIC5gGMcxGPUfofei/Zp3TRZIZRlnfIcqLBgfH61uz7ph52SOQDcMVMOvfK80ws
         Ujv/8azvFkg0Sg+r+7hPkfri6hd8BOWRT97/GYcGiLNq2J2Eq+hlypvfJW9Kmq4yFxMT
         A4d+3On/8ggkXPAbcRl+0MAPKY3i4xQL9YTAohYgSp+Q9Bwwkc3zcqvdHiVcfiIco3XX
         fSu848Gvj36Rgy5sf+egFTowepKV0v3g5bA+EDDMTVMUE6z+9LHbWHh+2cfx28OGidtT
         6s8pEr64FsdZIYfa1e9Mufmm98Y4FE4PN9Gjq64EeuZYA6SoF+fNIW3K/BNoaFYYB+Un
         leIQ==
X-Gm-Message-State: AOJu0Yykn+NeFwq/qtzdN1gVzc5jH3b+XjGX6C2v+3pBBkY/iNj7qbz/
	ml8UPqj8Uwo/QK6MMgcx4PKezbSoFg2uwc3MJeuWLMTtZke71e6wWrOypEx0pHjgIr2myRc9OjI
	CPU+Uyz43d8aUIEsP7bEuzzLjqrHAORNcH7ptcY3VqfJDMhufG6Mphh6T8+pYkLtaU3cb
X-Gm-Gg: ASbGncv4/OtG5iHxzHujZJnl8oixBpEibZvF26PXchUFcEycAce9GlgVYtSS6WorcXm
	nhJhngb4AwEsdSMO8mDzimGXEY2dF4gQPa3fHfmEfuJSole1IcDYDKJUpcTd0NAEObe2xFxp4hj
	YEaqIFTD58MqdcxDzcIUXMlNIwz+vpnPz/q/JznzOD/wUPgcI/O2wCFWX5vN9YkODLXRkycNybT
	c/FHLu29Z1XDbBx6WC3Hrp8Vw3vZM8AN6M6FOo6bFiil0KMpYKIA8n9gfXZvK8orSlbe/xD06zG
	hi/UC/dxb5oWMrQY4L8IQAbkyHfx8jItIFUYebqnvmsw8Haw7hsTzujdwGZzNOMcCzglt7Ndma4
	gSKlAJSUtxG1qJ/8ovmjWlmM=
X-Received: by 2002:a17:902:dacd:b0:269:936c:88da with SMTP id d9443c01a7336-290cc2f852amr62490735ad.41.1760720974561;
        Fri, 17 Oct 2025 10:09:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGiqLdkEXK76xjF+lHG7GlL+/MevbHd6v5Dd9DkIsG+DvsK4LIGFKBDF7/iLNW/xGjrgYInhw==
X-Received: by 2002:a17:902:dacd:b0:269:936c:88da with SMTP id d9443c01a7336-290cc2f852amr62490335ad.41.1760720974024;
        Fri, 17 Oct 2025 10:09:34 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-292471febc6sm173625ad.86.2025.10.17.10.09.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 10:09:33 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 17 Oct 2025 22:38:34 +0530
Subject: [PATCH 6/6] arm64: dts: qcom: qcs615-ride: Enable Adreno 612 GPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251017-qcs615-spin-2-v1-6-0baa44f80905@oss.qualcomm.com>
References: <20251017-qcs615-spin-2-v1-0-0baa44f80905@oss.qualcomm.com>
In-Reply-To: <20251017-qcs615-spin-2-v1-0-0baa44f80905@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Jie Zhang <quic_jiezh@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760720932; l=854;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=73CWnG48TkIMX2pCaTLVUDJXxssv+J43riXS1iBwvYI=;
 b=nYbp04cbP4hftA9E7CUSWYP36Iz5Pp9rqyCdQ7L53BtrrLH/j7EeRFlrwfHDDfCq0XnfsB/mH
 vYFmYZ7iBlUABbf1sXw0lQKLtcr/Fd4l/WlSK6g+9Gu/MBh9PdRNytm
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: yVpytQ-5CPZbSe7qxVNuqcfpDa1GdDTH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDAyMiBTYWx0ZWRfXwDaY4L4ni0xQ
 tjWXmkLC/U4kfgrljy4UVgPbugaiNah1nEYnmUhj9syUH/KDSX0Ob4U7vXYEZBoS2J3uEjegVDp
 I85mUbiDFmBP5GD31lj3UpfhpaB5CtbOqqJpqjBF+IqBppLwthuvbLXCx5TnnDDfUXaB6J09Fal
 L9uicsefjoyiSzQchEq9k5uno1rnBt/Umhxn1yueknCHhxNe4O/IxwDlXDQyfuhaS4HVEVu8/7Z
 EEOWo47JmoOkjy3yzXbjTEd2kqABb033c5IFT5nvMh7Yx+UF/2CjBUsPlc9lN3YHc2o9Wl825SL
 /j8xm0jWO6WpAGIAM0VthGcSvGS5gYJmOIzNSnNyXEBKBkU0QP1Ix/fEXotZQcLGZ3k0RR98bYc
 ZZCJ9aPt8k0K8cBVbdiiRqOmwA23Rw==
X-Authority-Analysis: v=2.4 cv=SfD6t/Ru c=1 sm=1 tr=0 ts=68f2784f cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=Zg9b9eOPwfKYWhW-Nc0A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: yVpytQ-5CPZbSe7qxVNuqcfpDa1GdDTH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_06,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130022

From: Jie Zhang <quic_jiezh@quicinc.com>

Enable GPU for qcs615-ride platform and provide path for zap
shader.

Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index 705ea71b07a10aea82b5789e8ab9f757683f678a..a1c87b925bf0052c6876db96a2d6e3c3ab8037c3 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -288,6 +288,14 @@ vreg_l17a: ldo17 {
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
 &pcie {
 	perst-gpios = <&tlmm 101 GPIO_ACTIVE_LOW>;
 	wake-gpios = <&tlmm 100 GPIO_ACTIVE_HIGH>;

-- 
2.51.0


