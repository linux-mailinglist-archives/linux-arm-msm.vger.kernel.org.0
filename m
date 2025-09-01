Return-Path: <linux-arm-msm+bounces-71386-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A512AB3DF3E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 11:58:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 08EDE189F44B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 09:59:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39E4D30F522;
	Mon,  1 Sep 2025 09:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gjdbIv+n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97BF330E839
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Sep 2025 09:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756720695; cv=none; b=ZhMlcqs+WhhuhtqRHGrw4PBtH92rDyvdvhILiAOXteJo5SfXrivmSenVxc9UnuahCLMCCDR8dQYf65Jtr7VxMq+I50YpEA9grbErL78bL0W0ZZ/RLfeV/8zXYZVBGeqU+99jJMeR3Cdt9ymh5K0l+iGfAgPFB47Agg8E0BRgwTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756720695; c=relaxed/simple;
	bh=3rkFDkEG8LVsFjeJ4SQMC5Gt/HRXtaQnkmz4irxbEPk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QNHj4+ON2l5oZZnCHrVMzP6/yRYShAgtjqutCdMI+Oe5NtMeSfM+aAcS2iDbEI2wcTVewM0IxdzJ54hG0sMQci5Qz//QMEGDVx9Kkx2VqCCeQBvMRBwsxegGKxIyOIN2yGd06EY3DaT/7SRVezs59f/Ex10RLXId4RQcMkX51JI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gjdbIv+n; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5819eQ2s004505
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Sep 2025 09:58:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PC0P0KeW8pKD9FQHWaVlmS86Em46YGeoi5IHSPfP7vk=; b=gjdbIv+nHm6u86Jh
	RNuWwgpHEJgkJSts8g/ySpsmyfzr5gFYe4uVsF8TrcVVxKiMgKV9WKPa4bVGBDdo
	CIsdF/bD7WsUB/XThT69KAnhHQPTqpH+f10B27KLs+pn+Xhat4JhIdmbOjOndKeb
	NRmse2w7ibWg28qiamem08e91QBi6p0tSA8EChyPcSNHan90xIagDHWmfeuS6Cvu
	hVFYZFnu5+midXHStNMsKYPlqsQfZJcxjRNE50O3jVHvngSN4dT36U4ZlJOpCzeX
	WJB6XauNkERmQ5fht4RhOm5eG7ueXP1KSy9y1qKHmkSwWRfrJY2i8MUAVvXbr4do
	C9oo8Q==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ut2fc7nb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Sep 2025 09:58:12 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7724bca103dso1138952b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Sep 2025 02:58:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756720692; x=1757325492;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PC0P0KeW8pKD9FQHWaVlmS86Em46YGeoi5IHSPfP7vk=;
        b=We2L/fQhwHPTaEBqbm2votIQ4Sa3ikt76C4ZqiMM168OFAgxjpPFXn6I7BWQzLefFf
         TFosJcMvM7TugBMRDqGsXZ++EJ4Hg5FWEvVhuXsgwWRir3Eey8w9N5L61WWuQkG6ID7E
         mfjPOqUgXsorI6tDfi8QVX0nClynmjyd0tmLF1/NJhri/hSIR+cA551Eu6+4hX5sgLT/
         rykoBG0nwiucX1jjQlRtyU0tvZvKuqHQgXRtr7aKXTX7FaIFsir/Sdl5DWShBp19B9t+
         tkXP7K+hL97LvZvSAl4Q07iHBns/8a3ZqAWJavX4Bm/DSXfWCczm8HcsawvS0Qox00gN
         CMtQ==
X-Gm-Message-State: AOJu0YxK0uCakF2kc1Dm+c1cbppvstKvX3VSIcQZAqkjsTF4z6M0FokK
	CAG2iFC/thpV4ILYDmWzFJs+CRhal76qYJofW4s1+mBSNDxIDvkfoc936eEOI1CK7883iY6za5F
	w1xybELyW1fEa3kCLJiwTL8mUIi4GEHxVFetD0RUYr11fMeMQ8ZRxctvnBkWHNMooIVZ8
X-Gm-Gg: ASbGncuEEAFllySveXIFYbty7mqMaUmsIf3ZpdpQflNKWt4l4Val1fkW82a/3tvOADh
	e25FWfEQDpJeWZTlfI5RaR+ryKgPEl6oINmD/i0j+BYw3h/NJawo3mARa0oIUzWURJsUwyQQRpt
	O1AnUDYMn3QRjCJFHncRhriuNLM5+IxlVZM9f6b3XZdSczsMcDNLtsNv7ytCi+9/i0CrwEaSgIh
	ScUxcKxXCVcc0BB/FjPe5i/URLVCYgL5wcgEBmphTmJOjrTJyh4brxYl2dvHhbbxo9BK91BCNr9
	RCcpTpOHVasBHMd7jTbM56qjU/8Yl9aDL9jHqYLCzLAU3cz6nxCiGO1e5gVK8i9wfCcrTg8=
X-Received: by 2002:a05:6a20:1584:b0:243:b35f:58ea with SMTP id adf61e73a8af0-243d6e01092mr9275688637.22.1756720691886;
        Mon, 01 Sep 2025 02:58:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGE4FEkbxc8zJAVFcBNKH3By/scmpc66RdOPEWIriSFDM5liAVdwxSS2dSJZSUUOeU2APdJKw==
X-Received: by 2002:a05:6a20:1584:b0:243:b35f:58ea with SMTP id adf61e73a8af0-243d6e01092mr9275648637.22.1756720691417;
        Mon, 01 Sep 2025 02:58:11 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a26bfe2sm10305656b3a.14.2025.09.01.02.58.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 02:58:11 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 01 Sep 2025 17:57:30 +0800
Subject: [PATCH v10 2/6] dt-bindings: display/msm: dp-controller: document
 QCS8300 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250901-qcs8300_mdss-v10-2-87cab7e48479@oss.qualcomm.com>
References: <20250901-qcs8300_mdss-v10-0-87cab7e48479@oss.qualcomm.com>
In-Reply-To: <20250901-qcs8300_mdss-v10-0-87cab7e48479@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
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
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756720667; l=1711;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=3rkFDkEG8LVsFjeJ4SQMC5Gt/HRXtaQnkmz4irxbEPk=;
 b=x43dftNhgBfQgNOncIm3bxVBcJJxIETiS2CaQI7RYpFOenwd9rA2BLYjRxTAV3W+Ex42mMN2C
 yk/G2r32mMhB/S1lJzSLq2PRcaVDRtilS7PPRLPBisLMj9OqdzU6Y3Y
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzOCBTYWx0ZWRfX8pWe2fAsZFzv
 WTxSEyAsIuiFci+hLoLa2Owbr1yZ9Frdas2s19ZUUXgwjxtKcgaIjvIwNKlJbYd6PO/hIRb2LLR
 rP45SO3MAN88yCGbN5fvQe/aw7A6UCGK1nBEV76UojuLbl2VKG0CHIeVmysFaBIYjzL9wDqapZm
 fLE5AmPHHEJLxr8IOwkqxtqjORDxZFakLMiQKIw48p0c2vkwm8LgmTYOCPum7q1R6jwRsGM0z5L
 PDcvqcfVaFzts8M0KZjZc362AG+wa3eu6szRn19QUF9hDiVsungWIXBYnpfQNUW4KBkgNd1hEQO
 TYQofUzTsGLS59ze36EShxvxJ0qkXuOOYn8jyH2H5A2Ty2C0d6gNIZ71kENzGpl5meIG4FgRR7I
 1UlgGwFn
X-Proofpoint-ORIG-GUID: l6ceO_wG7ycvJ4AKRSFNuuQHuC08YvtN
X-Proofpoint-GUID: l6ceO_wG7ycvJ4AKRSFNuuQHuC08YvtN
X-Authority-Analysis: v=2.4 cv=U7iSDfru c=1 sm=1 tr=0 ts=68b56e34 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=cUk4fDKarN54sxZTNDcA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-01_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300038

Add compatible string for the DisplayPort controller found on the
Qualcomm QCS8300 SoC.

The Qualcomm QCS8300 platform comes with one DisplayPort controller
that supports 4 MST streams.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 .../bindings/display/msm/dp-controller.yaml           | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 8282f3ca45c8b18f159670a7d8c4d9515cdb62ca..4f0dd80aebd1958327a06d31664dd68e02e5ba94 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -18,6 +18,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - qcom,qcs8300-dp
           - qcom,sa8775p-dp
           - qcom,sc7180-dp
           - qcom,sc7280-dp
@@ -195,6 +196,7 @@ allOf:
           compatible:
             contains:
               enum:
+                - qcom,qcs8300-dp
                 - qcom,sa8775p-dp
                 - qcom,x1e80100-dp
       then:
@@ -283,6 +285,23 @@ allOf:
           minItems: 6
           maxItems: 8
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              # QCS8300 only has one DP controller that supports 4
+              # streams MST.
+              - qcom,qcs8300-dp
+    then:
+      properties:
+        reg:
+          minItems: 9
+          maxItems: 9
+        clocks:
+          minItems: 8
+          maxItems: 8
+
 additionalProperties: false
 
 examples:

-- 
2.34.1


