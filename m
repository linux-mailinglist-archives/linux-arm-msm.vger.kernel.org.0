Return-Path: <linux-arm-msm+bounces-79386-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A914DC19513
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 10:12:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9C185582906
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 08:52:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E113F32142D;
	Wed, 29 Oct 2025 08:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C3Tw5nHp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EuT9Z1XC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F615321F54
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 08:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761727919; cv=none; b=P5UDdYEIPJoJ/YKXQhu8IC043AnuDSUEs+5Ai78QLnUBdZ+ldSEm5grbKBxBX18HJo4JjaPBk9QREKC/Ks0VjjupiTfXzL/2MV7XzV9z8xYk2kD2yplg223UNYjV/HHk4fjcvWHbHemcnWpwGxLDcd8mqOGyfUOdrdJ8JBDypvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761727919; c=relaxed/simple;
	bh=fxALVBYM7qYW96U/dSw79twk6v0y6XKjhtJ/F/CsPC8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KPgJDNtJ03XVKvAvhqEhR4vGZolxk9/A+MSEknafk87FQNNzyzghE1JU3KgWnexksSQyuJiOG1G2g9XpCex7bnTnSbB67dRHk187Zy4ewbhX4bBcUieG1nPINr5FI11OTfkR6tEPPGzSOKuVp3uckgyBx3xDacikFXwRqdTus3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C3Tw5nHp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EuT9Z1XC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59T4usO23720370
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 08:51:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IzFssouc9mamtc9gsC/kHechOIc88AvDywUnbNXgus0=; b=C3Tw5nHpALgj+0qW
	tXRn0MptmjOfd3RmVrEqCgzgzBoe4shjTzPAABkERvD/tBs2I7IIEBbyyO3WqWzf
	sST6p5zwrzb5H/KRn6nhZzkSLRWgyWkahBJJGzWJPBZ+z0gntxqqF8lgRZMMU1kK
	8FVa+V/nnTgyFr3H+pGrs0jJPKPWggpqOlHp/b3ITCwKbx4Tm5Ixqy2m9fXFBQWv
	hm/U8bMH/6nBNh+ytPSBVHHI0OKJNKHW4IEwctOfXIymZ0XSMW6iNsy3TLYUz1v5
	VzxiLCUSnpAvXm0rYg+tcBJArV6EBbnSeNcsfUIP0/aJ8+dU9r9DaZd4POJBH2yC
	T5sXnQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a21w7j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 08:51:57 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8908a248048so1672793485a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 01:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761727916; x=1762332716; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IzFssouc9mamtc9gsC/kHechOIc88AvDywUnbNXgus0=;
        b=EuT9Z1XC2pz4QfHyVGcCbBW2z0h0P85MNr1Y84+ax/tY7fvp/X3y3HFiZt2JJjoJuD
         K+vt6pfqwA4jQ+kjIV+dO+i3LfMS1tt0aNtiPL85FIzpN9ZD/I6goFw4YEwy8SmVsXf3
         V7n2jG4ReKpIpRi7qFzgWZyRfW16R4LR2+7RTiM7+OM9xws5igMoYlXcrnZZPBPWdjkh
         qdxHOQXhPh/0KDaJQFZUnNOzVq4HPot532ALeaao1D42bGWi/m88WHQhAmLq3LTbzQfV
         bWSuLadWi0eJ6CGHnxZOPPAgHo0m6n3T5CxvwH+2+sDiALgD7CTOeh+lwxo3O3Wt74lV
         iIQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761727916; x=1762332716;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IzFssouc9mamtc9gsC/kHechOIc88AvDywUnbNXgus0=;
        b=fwag3mLgE3ILrXd1oqb2rwBc5lhDMZ/We9u5XjCRrNsmq7J+KzPpYL72hgN1N05rJu
         vhhRTF4Ii4B19SSJfciGbF1wNuQ5y6Fer8ZmMFFo1kM8o2LESmZuCF6k+ovGMU8z1ltm
         nYSbSKxEnubym3aNj5WyFmGvA344uFXCRS5D+o6Jr0ibnWSUbiuj9uxW9G0s4JHE3cVH
         ZvyRm+yE8q9KkFyAPVEOo4hzFiLHIpUBcntDspYOW+LGyNUUFtMli7T67v8vmfq7CzhX
         GKAirVZcFMUxjOrXww/T/STP05D9qxS++3wOlL4HZ5HTUWFLu6Hk5bmhspZSjR+vQ4KF
         2P+w==
X-Gm-Message-State: AOJu0Yzlv1vW41v9n4QZvwjD6XqM2+EaLUx7FnOEQpi/NNjJHDwFNdP6
	hFmqUf3yOvoZ0QRCO4+wUOYx8l07gGqA9aF/dORlAC3dSV5ZmH1qBl/Av2Uwxpk3HJdWHMUc+Tj
	RDCnBT1ko5WWbkC/ip9f9qZvhkfceLMSVtScjildAK++rRaFN9C0rwzCycfYJghmPprXw
X-Gm-Gg: ASbGnctLi+0SPacNMYAA+o0JtCqYx9QUrXN9R5l+FG0722g+iTIGAd9dQcWSVWNF7uM
	goG0hQM6rMRLzdFBuRA+TJ7QbKpVd6gtZelOfuCVE6br8t7zFGmK2H91OsIpH89BHSk5MRMBNwB
	GxBxfBSdPBj9QGZcSLT/DmMFSr5oBV0M40X4jDVs20HRmMF0KpeH103Q7B4jyxsjqMIK2x+Cu7k
	CbcmyIJp4N/1H2Nr6EMTSE8jjES42MPv+aPpHotZWqx4yZGEL2z8PRfPrVYsd/+sxY+FDXISWd8
	FnmyTRg4FhbE8vh1PSXj1bNHB6YWZ5JPfLzrJrDC8eOOz/NuHkl2kGJ+FlYYmj3l2HeLnd8fU48
	38UQPVlPgH201OEVGlAthU0c=
X-Received: by 2002:a05:620a:40d4:b0:891:a480:ee92 with SMTP id af79cd13be357-8a8e8f4b236mr263533385a.5.1761727916291;
        Wed, 29 Oct 2025 01:51:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFI2PPKXtce5YNBSyc9dJxl21ePvANeElFkhe5Zdk44ZWE7owVm6fkHwQ2Bv7PW0DPT8yoJzw==
X-Received: by 2002:a05:620a:40d4:b0:891:a480:ee92 with SMTP id af79cd13be357-8a8e8f4b236mr263531985a.5.1761727915839;
        Wed, 29 Oct 2025 01:51:55 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ed0817602dsm36760171cf.18.2025.10.29.01.51.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 01:51:55 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Wed, 29 Oct 2025 16:51:34 +0800
Subject: [PATCH v13 1/5] dt-bindings: display/msm: Document the DPU for
 QCS8300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-qcs8300_mdss-v13-1-e8c8c4f82da2@oss.qualcomm.com>
References: <20251029-qcs8300_mdss-v13-0-e8c8c4f82da2@oss.qualcomm.com>
In-Reply-To: <20251029-qcs8300_mdss-v13-0-e8c8c4f82da2@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761727898; l=1242;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=fxALVBYM7qYW96U/dSw79twk6v0y6XKjhtJ/F/CsPC8=;
 b=/VZVTs/VCe7bEotB+iOg1SXvQxgcLXB73EUedAC6ofipNZxQMOrmecv2X3OIP4zJJRWiOZ1v/
 sgCB+hAwthmDkZ9K/e9+jc+Sq+3GbOhUuqoe+dIa3hA7sgc7TMZb42I
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDA2NCBTYWx0ZWRfX0C9PkU8VQJTj
 FwRH3xuNAiRXsVBlEnAIQXrmsZx84xFotKE3iyWZ2kUuGtFJCp2KOtTm+Q/Ck3tF42P9fZ18hMg
 wWjL2vcT/AcZF6tEO7ugrRelghA8+Nw8pGl8wHIRxysVzsKxFqiAmb86gMja1Qtd1X6EHIYu5zt
 2g+aUKDdrDEYQs7S2HFYcaZZ/qluVVMO03S3+bt1wAowlbXiPoYk62BoFI4014gFW9vlO/RcYpS
 xIYC+0OUsrB8QTGrFSlm9etYj/I0WA8cASExbRKn9oBVDgDD3rzGiEf+/ZE4NeSE31r+Wf6+8M3
 AePaWN3beWtPPgYkMMaoRKhNkYuAwf6OM/WL10kJfbNFsqjv3zYVBsYL3QOrpBDOVG7ITrlKGJH
 L7B1YZL58pmO0NiQzHa/lZwD/tTqVA==
X-Authority-Analysis: v=2.4 cv=V5ZwEOni c=1 sm=1 tr=0 ts=6901d5ad cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=0ru3Ub4c0dYyKLRCKckA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: _JW3-_yKUw4QtYpPUEVy1sg0Ekd2q4N2
X-Proofpoint-ORIG-GUID: _JW3-_yKUw4QtYpPUEVy1sg0Ekd2q4N2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-29_04,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510290064

Document the DPU for Qualcomm QCS8300 platform. It use the same DPU
hardware with SA8775P and reuse it's driver.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml  | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
index 0a46120dd868..d9b980a89722 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
@@ -13,11 +13,16 @@ $ref: /schemas/display/msm/dpu-common.yaml#
 
 properties:
   compatible:
-    enum:
-      - qcom,sa8775p-dpu
-      - qcom,sm8650-dpu
-      - qcom,sm8750-dpu
-      - qcom,x1e80100-dpu
+    oneOf:
+      - enum:
+          - qcom,sa8775p-dpu
+          - qcom,sm8650-dpu
+          - qcom,sm8750-dpu
+          - qcom,x1e80100-dpu
+      - items:
+          - enum:
+              - qcom,qcs8300-dpu
+          - const: qcom,sa8775p-dpu
 
   reg:
     items:

-- 
2.43.0


