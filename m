Return-Path: <linux-arm-msm+bounces-72965-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E7392B51597
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 13:27:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9E2773B6B96
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 11:27:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52FA6319878;
	Wed, 10 Sep 2025 11:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AhMdYRrB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FBD929AAF8
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 11:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757503582; cv=none; b=efdYQzC4uOhrGe2chHEIpkEcqG1rihR7ZrdLS/lPhO2FR5XU4OPAiJQD8Zgbca7GPMuZKMT4zRetH4NEC8NDJvmcngieK4BGS+FJvwh8oNuxYzaQPcVv5W3M6K1YXFr11wK9V0tXpSTo1ijGYt5e5nnGKG+PJKa4RGgLtziJRk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757503582; c=relaxed/simple;
	bh=PL01mJ0RQboPDnIbyuTFQL2+JjE45/PjCXjxeBASbKU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WrvZrbfbTV+SfYp3uN/AAeuzfAxU7UBK1ExU8wGsIZn8R9rW0ziWBYoU2s7l9EqiXU6tK0hiikKgzCreS98Wkr+HES2MlYX/bP4arqZIpwwhLcWwx4zjCvKnR9k8k8LdbKNiU3gUVXMaiudIiK0YqxGul4NDlib/n7H1jvO5BSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AhMdYRrB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58AAFEFA012510
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 11:26:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8xCz4z0Bi/57zqJUn/Mu/aLwfF4knJr/ZgFBZ7thB9k=; b=AhMdYRrBoiwiY/1V
	xEChmpMDD1v90QbkJStq44JDSMtwAiIA8errZSW444pOjGSTp0lDVRqIkqamX+bB
	h2Rfolu5xm5Wk1E/5WAGlQ/VJzODA+7N6oXEb0OazwdyXgkJcmqOrBmr2EQzJw8K
	fMb01O+kLFpyePaRS6JFxPiVZ1rHWia8be550csJqrGqC9S+DUc6+PQz0PoYCOfL
	L+L2cUtWUuso3UfRfYUk1itKgJe8LfReBn3ak0aSvSRrdvIl+CMn64gY2sprwcx2
	aGfNPxwDPr3r7y0sxKWQOUOeeoJNW/hU1xi6LceifgOWbbbu1zFLNziy25vqZ5Xu
	AzgqJw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490bwsbskq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 11:26:18 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-77283b2b5f7so13705375b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 04:26:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757503577; x=1758108377;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8xCz4z0Bi/57zqJUn/Mu/aLwfF4knJr/ZgFBZ7thB9k=;
        b=dMRy1vX2UeA/qvF/SkTWC6FgrLsQCoH/D7GigVLICxvJIgYEqQY3+1o5Z26wTVXipv
         bkwTeGabx0e8m19RdgEC6HFmLqAlS9tqSBF/2nz6g1nZWVboVqOjEiAa5bbn/WepcFxW
         I9G6sl4/vbWPcqjGx3QrJdfyloFkl2FKGyDQ6IHTiviq/RQSjt/t7L+pvwVHHLcPVIRB
         U40F2wRbkhWh99jlAVdyLZdL3qxjiA5EE1GPaqsoYaqlONUz8GIvW5B16JzONPS8FVQ9
         yTm7SCvB87m6rwSR/ksPZZvNakDIZjvAX/0txJLRAskRJIs4uR0cflgHOFQy1EIVYCt9
         5nIA==
X-Forwarded-Encrypted: i=1; AJvYcCWqnO05VucNya203P4G01eAlLOn/KZK+Ca8KPSGDQJjN1b2Sm3f+bVC1PvwEx5Y3qGsxvG0u4TtusFkBkuV@vger.kernel.org
X-Gm-Message-State: AOJu0YwfdrFcB9txFVPqnRbZHllmsqJrQ+wbsTWxfzeF/awDWjpP5fUy
	MwgDVCyQeJ6tz8awxHV8yj4CZFzpIi2rRKr/jgsuXdJZegXMjdnF9HTB3slwul+o7/IzbmT1WP0
	VwO4Wb66gJ1yUe5L0ynSkVc++LOfQ0/tnz97gO8NhtPtfCf29lKagzWTLyOvxvoK38jeY
X-Gm-Gg: ASbGncvwQk/11NQFKHryElKzHetdlMT7VaJgbl14ewqBHW8ToPrFweGOWKgi/PgoLh1
	7BUAGxC+3ydww5qpX/T0BnLT0yG1gPLlIBi7rXHbQlBYwSdYvYddhaKkt6ayDrWhbi8OedqxsKq
	ikjCIcIA8blEjLxhWK+enNl18M1OV1ovrSNSyXqo0UxPqR/634twmWqdxIZcT0XaQUsUHVAlcBp
	OzfexiV7cDrxY4dnjhbgumm0fftSFPWMw5EH2w8GZrLBmqFYu+0R8IrtlDpgy9QA10KmdvcGPmP
	AVszO801HA9kg2i8dL11Nuw0O4prK/t0mVzjXo5MyC3kcDVYN4dZ5rUP+sB0Sisj
X-Received: by 2002:a05:6a00:4b01:b0:770:4b1c:8155 with SMTP id d2e1a72fcca58-7742df2f3bamr20536945b3a.31.1757503577291;
        Wed, 10 Sep 2025 04:26:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+QDB9UfSTw2dpK6r9PESzhtTxePgwetKm4/3FAkoGJBYT+EgDiwgz5uRPw9lAa0ANlB5rGQ==
X-Received: by 2002:a05:6a00:4b01:b0:770:4b1c:8155 with SMTP id d2e1a72fcca58-7742df2f3bamr20536906b3a.31.1757503576750;
        Wed, 10 Sep 2025 04:26:16 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-774662c7384sm4862260b3a.76.2025.09.10.04.26.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 04:26:16 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 10 Sep 2025 16:55:22 +0530
Subject: [PATCH v6 2/6] dt-bindings: nvmem: qfprom: Add sa8775p compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250910-a663-gpu-support-v6-2-5da15827b249@oss.qualcomm.com>
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
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757503556; l=928;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=PL01mJ0RQboPDnIbyuTFQL2+JjE45/PjCXjxeBASbKU=;
 b=jbHbZpOfOJnlTpNnSBL+ndOzzQcLInmZVQoFwGPwAfCej3VR+/xoFNWKsr/YC7aCrzP97N+4w
 KVWvC5iBnK9AOH+xqLminNazLWF26SM4yGMZR3CsuW/pcOFkMFDYIvJ
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: AirDSgbqEcqi46jwtznnClg9z__F5h4_
X-Proofpoint-GUID: AirDSgbqEcqi46jwtznnClg9z__F5h4_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfX0UiYyn7Jd0QO
 s2Mn4EbONLHmQax9EjDkEPe91ZSTXXJZjmLiCkrJ69gdf2x4/alNWo2731lbmAY5kddl02tJWeS
 guFNmX7cMGb3EJDl/LWBX62hvRDNxWsSa9nQy/wv7NnNIh3uGE03v9oehfBp+KRVPf015Mzss4P
 O7SpVoz0N2SUg6PQEQ7ltFMKquByg9n2YAEpXNolu6esPT4AN8qHPNEdM3NW159dbUmnadf4aVc
 3aby1hxMvyRBWDPZ1QPyfHUi8XRWOmayDNQa9Gx/gjuc0wSYOqOlFKbJU3zixMAVtX5j7v38xgT
 G3zZynaM5jBZ+zh9z2cPzw9fIDLS3/ay4wqar/kzAt9yfs0FTtrNeuJXN4wckTinbYtQN+4fiBo
 Q3YORgul
X-Authority-Analysis: v=2.4 cv=G4kcE8k5 c=1 sm=1 tr=0 ts=68c1605a cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=TNpnUgr77EDisZP18eEA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_01,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018

Document compatible string for the QFPROM on Lemans platform.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
index 3f6dc6a3a9f1adc582a28cf71414b0e9d08629ed..7d1612acca48d24c3b54c4d25fa8a210176d3bb5 100644
--- a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
+++ b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
@@ -39,6 +39,7 @@ properties:
           - qcom,qcs404-qfprom
           - qcom,qcs615-qfprom
           - qcom,qcs8300-qfprom
+          - qcom,sa8775p-qfprom
           - qcom,sar2130p-qfprom
           - qcom,sc7180-qfprom
           - qcom,sc7280-qfprom

-- 
2.50.1


