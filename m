Return-Path: <linux-arm-msm+bounces-87204-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E8BE4CEE456
	for <lists+linux-arm-msm@lfdr.de>; Fri, 02 Jan 2026 12:08:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 574B03012BE5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Jan 2026 11:08:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2666D2E6116;
	Fri,  2 Jan 2026 11:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QfL7XXbT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FTjZ4Wgm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40FA42E11B8
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Jan 2026 11:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767352082; cv=none; b=R6fPSczf54nnaZtq1OLcmDvRFH9y3NfY0ql7s9rEZcgaPNbCBFZwhlVAeTHF04vTlo25XxcDtKfKqj/kqgYq40lmfyKh0tbgrkr80gWVh7tEbqAtiAXzQBPG5owgnDcyCW5jFAUUtdlB3+sVI5+hSfgxyA3AAoDIi6dYX4d5yBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767352082; c=relaxed/simple;
	bh=riqKGRbefiTVAjrJlS7BPlVWnOJwjzGAnwvmXHlvXG4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QfmBlAIts4xM/WQ2ttMbzZo2y8ujuu4I7sGFQA0CI4qDk/U1rTTqXYkI7Ox4yHI6Qjpf3GSYRYz568CZpnkQVgqdhQ6V5tKFymqnmUQNOApUHlSFFdhV281t1MsO7fhd1fOKpgkBF1C81gMpVJIJzXnF+6NiV0AfdrfgCNHCVb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QfL7XXbT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FTjZ4Wgm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6029WF7Y784647
	for <linux-arm-msm@vger.kernel.org>; Fri, 2 Jan 2026 11:07:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VG3mEiJmLvo7Ao7RM3Ld5aCHT5FgQHOT6bBZg41mTgQ=; b=QfL7XXbTCUFvS21Y
	ZZjbMNubkROVvXNb3Ppx5X0I5crXceZYJBBPb5zAiTk1/7J4YvgDgbebzg5to16I
	M9sjpmupUZ7aCAd9te1Itcuihry3sEtupblmdEXAApfL0ogSdRBWdr1Puuu4R6DM
	+pUJrwQ9qTnaieJGiioDxTxO1hvZOz7lCaqhdg07+mAcbwSE+4nGQJjKb5JL1lBj
	vqsskTWp2FewkoeVuHdirIHSm8Uidm68dnLrSJwvJqSC0GH1vlKreJgDOnoCbyPu
	8JwfuQ6Ia1rIyZbjUpNlYdYBVjni5593zsb5x17ZQK0+ads8w6GIxSM/761dwtlR
	s3fxPA==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bd7vtk8e2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 02 Jan 2026 11:07:59 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-11ddcc9f85eso22337172c88.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Jan 2026 03:07:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767352078; x=1767956878; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VG3mEiJmLvo7Ao7RM3Ld5aCHT5FgQHOT6bBZg41mTgQ=;
        b=FTjZ4WgmpfIzPy5jArk4RtDVDMQ+1XWElJUnNSJ6rbxieRbg5N6u0mwgswSf7vFmoP
         I93s9G8fEmSTPT3SDXeyre3rAJA8ZYp4V2gdb8wS0uc03W4uHXJuxVFn7VRsyeG+Zq/Y
         UFREqGZv+biIiXoOnYxyompV/xPLBFksq7F8YClE583WYQouPXvGJ86gK8j2FGJgX2DE
         siApnd1JVQaPkynJtOdtQGkZzdgqqQuY+CLWTWjF1cgn5KIY5DFQPUrZuk4tyKKDaKUA
         i1gDxGm6raKMo1fijHaXxx2hgvIpoTArTjXwvM6GucEqPvz9pMoDAtHsNBQkW4i8ZwGI
         9l/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767352078; x=1767956878;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VG3mEiJmLvo7Ao7RM3Ld5aCHT5FgQHOT6bBZg41mTgQ=;
        b=sH/7vccI6drKTzwjEIlgETrgCEWV9aH5tSNsTQPmdJrU8l8JWFVCa3ttrEAsnpawIi
         lKVLVW7OTEpfpqv/qsT8a1bCtsAvyhl2t+LBzzeXqOggQiqwdEIARFKE3M04unhLTZqw
         Gpc3WDjXv8wPHozzWmS3i4uftNbV1gTHb++0CHIQfnMqyGT8a0D/SMN8rI1/Lb49hSbw
         pD4gRRhFxMWrJ4uLYhz2ht4QxhT0qPBkIaQ8LXunzBvqJ+LeO9JC/JFYLAXHx8O/4vTt
         p89d8/+fhBqRX05ITMZUuFBvVXfqA6TCJKVds2iQvLnSWKrsTzFfFEYVOIvsHM3MBDvd
         KwBw==
X-Forwarded-Encrypted: i=1; AJvYcCVDL2YmrLg2gbqACvtfG4nZoQcp59tc44nSMsAqXnJSUg9JS724T6lu5cSJULXS7euyqWf5Rhg5URCAc3MY@vger.kernel.org
X-Gm-Message-State: AOJu0YxcTN+WDzJQDoxU0ZGtI55s3ZW2b1moG+4pR6GHrzjTA0CasKRq
	wT70I2hFzstnxiGj+WSnrGjJQlPXQzfeKidz3DTlaB1IO+2a5UWNpeshFxuT0sVEHO2+5g266FU
	PCfC4onq03WgClVr3OeTPQlBqKsvDb1vTnwxTHPMj94+/7bvGOvGma1aUaE9goWcTckzQ
X-Gm-Gg: AY/fxX5VCgfJpQOQutqMkktds1NW7eT+6zxR/c9R4DdeUIYd8uaTtqCFpja2qeN47fB
	vF7LMNwB8Ah58TJ9B2JztzuRj93yiEzq088nX04wO1Qi/u7pkt6sSIxl1HJMz/oDgT5qfBLQ/EZ
	fNDr1cQBvb6udBRLZcdbrpu6dsuBqiZ+fcC05XxUMv0UsJAl63bceu9L//c1lKhLvDkQyrrfzK/
	DZI+5m7nRSmOOcrPWC8H/u5eOxhfQl3B5R++MTWHXj5aNlh7HrCcnr/+t0JxUV4MtkQaMVK0HfZ
	NFRbzKMxG6gFtyQNp49efm2/rr2gnRMf2vC5/9PfvnZ1ObxeLQiuK7L/1NOQnCN/SzeJ3QE/gIC
	i2LrhlxzFfGyb2kWlIRm0B66/vgaMll2nAGuWoM7CZrRn5ZI1B/w/ghy7ht5PF3wcBM7ASVkIWA
	==
X-Received: by 2002:a05:7022:eacd:b0:11a:4ffb:984f with SMTP id a92af1059eb24-12171a85250mr38947306c88.11.1767352077934;
        Fri, 02 Jan 2026 03:07:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFE0Pdw2VtxZaFIWLmgXYBSA0tkMDVEYv8SQTzqwlDyDLdfznoI1jfJ5TmQSpB9yn12bij86A==
X-Received: by 2002:a05:7022:eacd:b0:11a:4ffb:984f with SMTP id a92af1059eb24-12171a85250mr38947288c88.11.1767352077329;
        Fri, 02 Jan 2026 03:07:57 -0800 (PST)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1217253c058sm157431107c88.11.2026.01.02.03.07.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 03:07:57 -0800 (PST)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Fri, 02 Jan 2026 03:07:54 -0800
Subject: [PATCH 1/2] dt-bindings: pinctrl: Add Mahua TLMM support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260102-pinctrl-qcom-mahua-tlmm-v1-1-0edd71af08b2@oss.qualcomm.com>
References: <20260102-pinctrl-qcom-mahua-tlmm-v1-0-0edd71af08b2@oss.qualcomm.com>
In-Reply-To: <20260102-pinctrl-qcom-mahua-tlmm-v1-0-0edd71af08b2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767352076; l=1189;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=riqKGRbefiTVAjrJlS7BPlVWnOJwjzGAnwvmXHlvXG4=;
 b=/VsEc1NHu+L8sGg5+EC1uxJvPYir91PD4EA0h5PqucUzpTm3aX2Q1fqUoPR4l2oOjmtXFX62y
 yIzV2rjgTIxACL9HHGIQIcwvtK0fFOGLXiMlvkbl4Cy3B8JrZY8GcRG
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Authority-Analysis: v=2.4 cv=NMbYOk6g c=1 sm=1 tr=0 ts=6957a70f cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=LEL-hUu-ZyvN7oc1A8YA:9
 a=QEXdDO2ut3YA:10 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-ORIG-GUID: lgykhkwLZLI5uaEA-KDIcOsXGzszFC3p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDA5NyBTYWx0ZWRfX9O+oOm/DCWIc
 ivEKzZOerdZi7CG2T8gYot6XJ02Sj7aVFNTiTLRlYGP+3HiJ/flETHReE3dUKdiWQs9k0VtWxs7
 IyGTwkdFiZeu9l7ENqgeyv6Tlq9F2WDFm2HmspDvgcdc5PYtiB1zowaZclr89kCfLxTc/vMa2Ec
 9/33A/ZQCsoeywhaDZ9V4pPhH3/iBL+uMiH9vRlQGaJul7Zg2LQSJ3qApCrngg9nv9ngf0k4wCk
 5TKSpvVmxKKDUx7aRG0/kboQUcNsGe1T/luw7Cj2dvG18Wh1hNAzEEoLxK24cAKxrzJDWTyxvdh
 X6iU+/kLd+TKq2LVlDJDlQIsB/88vx8YIvwuCW2+v8Jc6OIb/DOKzAJQd3hvk33RxI59GNugJ3D
 mLIzihoKgEfox1jhmMHfeaf34W6QnXlKRKjP6BGQkbGg0+fcFYhACYRAFIadcVt0LDopuU+gR47
 rTdcbyt5Y2h7FaGsqBQ==
X-Proofpoint-GUID: lgykhkwLZLI5uaEA-KDIcOsXGzszFC3p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-02_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601020097

Update the compatible property to accept both "qcom,glymur-tlmm" and
"qcom,mahua-tlmm" using enum to allow proper device tree validation
for both SoCs.

Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/pinctrl/qcom,glymur-tlmm.yaml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,glymur-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,glymur-tlmm.yaml
index d2b0cfeffb50..2836a1a10579 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,glymur-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,glymur-tlmm.yaml
@@ -10,14 +10,16 @@ maintainers:
   - Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
 
 description:
-  Top Level Mode Multiplexer pin controller in Qualcomm Glymur SoC.
+  Top Level Mode Multiplexer pin controller in Qualcomm Glymur and Mahua SoC.
 
 allOf:
   - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
 
 properties:
   compatible:
-    const: qcom,glymur-tlmm
+    enum:
+      - qcom,glymur-tlmm
+      - qcom,mahua-tlmm
 
   reg:
     maxItems: 1

-- 
2.34.1


