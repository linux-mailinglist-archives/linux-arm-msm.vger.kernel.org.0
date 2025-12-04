Return-Path: <linux-arm-msm+bounces-84297-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D26F7CA2592
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Dec 2025 05:48:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 19EEF3083121
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Dec 2025 04:47:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 522312FBE14;
	Thu,  4 Dec 2025 04:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VtaY8Nzq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MwvqcqB7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A94AA2C181
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Dec 2025 04:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764823639; cv=none; b=u7k6K4IPLNuT1wbhVOoa3NKU8UvZswqWNcRCsDOOngBpsOy1sn0Bvet77UlxK3NZfHGvz+Kjhvf7k2VcEz1YcoFry0L8GK5rBnU2DzI8b27dBkF7nReD2JZDwYy6h5Axx7tzsa1i0qQ3Fr3aWac2LpduVeYL9RpqPfUTeEqnHTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764823639; c=relaxed/simple;
	bh=aPsejmtIUw3vCzEFX1f3SMBf8e4TQ4PLWL1r6BY0DYw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QcAA01zMGlGaP6Z5Ij2QWHwUfMlgyIDEJHI2QuKNDQzdhOJ2K5AapZZy1DJapEeaP9X2rFkll//WNaQP0BnPC52yCUWfhEV2KX+oE4RCsgnz2Ij/lPomRYW8hpixDKLk0e/wvxmdqo3Thxn0f5bbSn57yBFnXdv58p/r9erxkmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VtaY8Nzq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MwvqcqB7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B42Ltcs122728
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Dec 2025 04:47:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=s1I+JK7Ehts
	Vkqv2mCcWDT08UiFfG3Sjd0AWILjPJqc=; b=VtaY8Nzq9OYRj4kgRigFIjR8SOy
	D61yCXJGPQ62xxJbq6ij5iU3UrIvvO4khJN1f8id4ILOnK5SEHTY7CutnRwRpiRb
	hnHzOsGpnW99cx32qReu8t2fbubdVGRXDj3zi/w793BG+oQ6A1jdCLj+dj4DJn5b
	0Lf3g6RVSrqnAk9Afxu8Un3jsIfW2rayPHk5eaONdUav8okuKyi297KmUL97UkWR
	Pz9tZ2yx51wZ9YY28SorFEryOno9x46fnx+opD8YAZytWZ8b2ZDznfbSc455NL0K
	mZ+U5txuwyw694Otc2a8TNfdVll9m43vVeo0rxHswqotvh/E1gJ9EBPbZ8g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4au1f00af7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Dec 2025 04:47:16 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-297e66542afso13741715ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 20:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764823635; x=1765428435; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s1I+JK7EhtsVkqv2mCcWDT08UiFfG3Sjd0AWILjPJqc=;
        b=MwvqcqB7Ha+zglDEMh/VmYx/E9RhemGsPjJ5obrifux3heFRe45WZT9ey+t+xCxohF
         p9FnghTIDPjU1m3s9FqR2FQXJfWRoXesqYOkZJI0/00fSbN88vImzQI8XhrdCbPSZ8Vt
         +ti0uYUACOo+mrdQuJ9r2qNqqpNDO2+fCKNu7rv0ZFXAyKTr414b4ha7xKSo30y18Ezr
         h+MuMutrM1Psy4ocjm9ugp7ug6NkiAtkL7cjBpVuFqyP0gqB0ghToncILTEpz8Aw0XaT
         Dv2NRLRkjIFyWThpmpSdfsP2FKg1NImhWJdkKdkLaNgQeLqkPnDi+83jFG1tD4fAconP
         9O8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764823635; x=1765428435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s1I+JK7EhtsVkqv2mCcWDT08UiFfG3Sjd0AWILjPJqc=;
        b=YWzGG48fDZ35cNNdXtUehy+0QodeOjHw6mcd9mGjeomWSUCv1IdJCtZmcRRyFV8RlG
         iZ/0cHix7uP7VUVvq9tA5jD+HJ89WQOMKczJCjI64Uqr/KlEB8ZU3+ZQKTdxvbhtTa9j
         /2jovZ/fhsWY9DF/N72zeTk41DAlZ3mRthZwjtyAH8FNA6GGlP1BAs9TD7Cnn/nX9sxJ
         7BlrY1DTzziEiwIkPvBoSkagiLdqDXrZZiXq/nUFcFNwH8iSpsjW+IkBtzOjMt1e0xiO
         bmlPETAO51d/cDsw8ODKMt5oAywbOMVax6/VqMl9P/QtmGFB43TKdVzlD5SQxzCwdl2E
         NvZg==
X-Gm-Message-State: AOJu0Yx+bHhjmF4xBjPwGQW+eRgHlKqdVXBFDlGZDbgSQeArZfACgT8C
	6+uqWcGGgN7dQW6pkAerhXd2KDpjXX7xY38pG7zKaBaoMjV34gIkIC/Run/H/6X4z/EdgnIGXRZ
	PL8j+PLxBwuFfnPWQv0mRJCAIwXbXA9FHsTx3eCtzA8h/jhK7A7TY3Ze6usvwetmX4EDE
X-Gm-Gg: ASbGncu1NPN9FK+KEhCoVSrxD165mB03L5js/d6lqWZsPJ5mGSsZHuA+ZISkq7XqfOV
	P7SNaAcJW2m9gRJK5II04fsHm0J8JEs2RnqI54amXWvaOQRju3CxyIpdomPiXyeZKEqp8PsyKtA
	k8VL7/50HFWT4TdvqcZrHOXMZp5I8uzIooJd8YYHEZFQOexGpL/8DOoYUSIqunC6n97wBjMtTub
	o1OhN1uoyLlmLWaMckbXGYD1ek9rYX7C1YlPUf3zaImOiWNJHPfLDjXevKKpzH3nhdIYnFnPUwx
	+KwsVG49m+0lRFX1zoLlQHKa1N6tZqKMi6crAJpb50bqj5HLJIXpybWmpQ4MVCsDMUzeSa8qmeY
	x07n71+1+FPMmsZ3FzkVl+W+kiQVx6EeI6ElGOohW/q5f7oE=
X-Received: by 2002:a17:903:4b30:b0:290:c516:8c53 with SMTP id d9443c01a7336-29da1f00d6dmr19154585ad.40.1764823635400;
        Wed, 03 Dec 2025 20:47:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGw3ZdgtoJH4ANV1bupEfZRpd/4l3HWwRVXuv7CHEVxKkSApbYU3PjEOPJkGr5TTjVipcPVrg==
X-Received: by 2002:a17:903:4b30:b0:290:c516:8c53 with SMTP id d9443c01a7336-29da1f00d6dmr19154315ad.40.1764823634928;
        Wed, 03 Dec 2025 20:47:14 -0800 (PST)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29dae4cf97fsm5217995ad.25.2025.12.03.20.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 20:47:14 -0800 (PST)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Pengyu Luo <mitltlatltl@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v2 3/3] arm64: dts: qcom: sm8750-mtp: Add eusb2 repeater tuning parameters
Date: Thu,  4 Dec 2025 10:16:44 +0530
Message-Id: <20251204044644.3072086-4-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251204044644.3072086-1-krishna.kurapati@oss.qualcomm.com>
References: <20251204044644.3072086-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: c7hcMAJeH9M4MPsuoTaSj8cH_NxrywUq
X-Proofpoint-ORIG-GUID: c7hcMAJeH9M4MPsuoTaSj8cH_NxrywUq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDAzNiBTYWx0ZWRfX13mXKrVryCEn
 tMykmvYtUA/w7nUjK+sQZregUlkzF/POU3DBxyXHJW6UKnGtZJvSqdF9A0qvikHzLdJVSDsi1Fe
 RgLdKfYazhwVW0XqyUzH66ucxw4IAtqQc5g0pEcr6+KJbLUV7Hh9MllnUz7+Lxi3eRK/gGB0D2y
 F+pOgLUlnU5f0r/JjHFkN5meFta/uG6sS9vb7LoS26HgsjmRk+4s26Z8T39TLrlSGKtnjtcT7Vy
 UiBqLYn+E9fFbAiWpda1ruQulSgw/lIoIVSA8Qc2AyHRTtqpjSK0WTW3ujCm8CTVo4Bz41QE3UW
 eNUpFwLcfBhmqFvXjbpWE/CKLXOajxE2CcsQSWaGDEAwiBzrnCbumkuDbsS3zAdY/UfASxNIsNY
 M3YqBBoEepKr2KZoCZsbX40z6E+lsQ==
X-Authority-Analysis: v=2.4 cv=Scz6t/Ru c=1 sm=1 tr=0 ts=69311254 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=-Z-y7UPfJgGHtBsD8n4A:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_01,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040036

Add eusb2 repeater tuning parameters for MTP platform.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
index c8cb521b4c26..b9a4d1c99816 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
@@ -1041,6 +1041,10 @@ wifi@0 {
 &pmih0108_eusb2_repeater {
 	status = "okay";
 
+	qcom,tune-usb2-preem = /bits/ 8 <0x3>;
+	qcom,tune-usb2-amplitude = /bits/ 8 <0xa>;
+	qcom,squelch-detector-bp = <(-2000)>;
+
 	vdd18-supply = <&vreg_l15b_1p8>;
 	vdd3-supply = <&vreg_l5b_3p1>;
 };
-- 
2.34.1


