Return-Path: <linux-arm-msm+bounces-107428-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2ArgCp3GBGrdNwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107428-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 20:44:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 074B95392FE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 20:44:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C92C7304ED54
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 18:40:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 789623AB480;
	Wed, 13 May 2026 18:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pwsWYV/Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BxtC1vRP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C9C3ABDA4
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 18:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778697631; cv=none; b=JDYYTteB9NRU9EJ2vbs7xZviYtByFdT7Ysa077JLwx6yjuo3I25gfS0Yy9K7Iq7zG/LWcWXGaInwiN+u7Dk1YAHLiDfwqS8RDE/QaFuveuqjvjKSlnuV9cUFw0+wEL0T5+jV8gFK0cFxpKQhI46yhyN3LjSYMHNK0ySdrhxFnuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778697631; c=relaxed/simple;
	bh=z4FbzAvY5pZ8H9vX/hG/UlmCYedeJ/87e4jZmsMaSQ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CLu7wOEVxLYejaNXd0MAfw2cj+mesaCHoiVocgDcE9+/zwpwj8+5NYlYUuUysyHg5z39Tvg39LTYBj2mCbto5sMClpEXkPHHtU5s3Fexr+K0mhcixqYrHhhsfUe3WGXEjatag1VaBltiH+1HecGRc9dGPiyd1a7hVzpvtGlV2yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pwsWYV/Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BxtC1vRP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DG4tHF3007654
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 18:40:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0155eQw0dZoNoYFIRd4SUlBiyD780i2JRkpc7pEGBWk=; b=pwsWYV/Q630UJTGl
	viB2bEpkDaLz8eeQDVZwmwwbH1eCG2vGGMu9Jq36NSB1bmwFeH9NhWE/K6EpFQnt
	IRjOHLo568lfwTdE9mZZT9KUpwKRGyQh17TcCLvR0VAFvDUcfuzGcGBD+5+xp3ai
	K3dZt5WQN+hnvWkzRf9nk4fvjKvKoQ5Z/d35zktLlIMb8CdnwizBVrRbBW0k3ipH
	MqAKg1Uwyn/9GJ7HJhOplLYDP2gWSbkIFnd+/bR9Ykeuam4YNgt7G0HcSi+tL2IJ
	HXjFKfN0+JO7kI4LcWlYpG1KWBMjYaKUetdNR55+R/xur1hESaAfjPYCWPuUpxix
	AZVIrA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4py0j4d3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 18:40:26 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-367f715cbd0so4114291a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 11:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778697626; x=1779302426; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0155eQw0dZoNoYFIRd4SUlBiyD780i2JRkpc7pEGBWk=;
        b=BxtC1vRPwIcEH9vvyP0QQgTG3OByI79Epzt4oKGI1/bw7k7H1J2PadWQ7Ey5n5cxTS
         AOn2ffdPOgknnzOxy2I+0gFw52Yff2M7AhYU6t47ft3535gyfqUJq/OnAYRG42mokKKN
         0YfPWVrGEm06YUUyJ7quQCggbbYCIn10aF2/rF2FgzMnpq3ayo9IggJV1U3m4eeJ3ckA
         18Vkiti5Bn7wHmrW7+h3ClUP1ImsJS1ze3jj/3voWjqi6utdCrAxt7HXfLAywPGezOwK
         NoOY7g/yDZeChRmbS02LWwW6gplJTB5G3YFkZzIDI+wY342siTuDCpk4K7JQob16UMNJ
         +a7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778697626; x=1779302426;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0155eQw0dZoNoYFIRd4SUlBiyD780i2JRkpc7pEGBWk=;
        b=k5mzx/5VZFVUSXK+7eDS+EpGXnAaM2JWO0bKjPc/HW/yzVjZkw8x3LDH3sC9GXtzzW
         Nnfmf/dhGg350acmLzG1iYDMW7gqSgCaXinYKZOsJoZ6nKny5/+INIwY24hygJa554X5
         zXdQTTFjiQ7y3lnAdcan6c4fT1mUQOff1BG083DcCDTboY7zaT8NMUul4mjQIE/Hf4dx
         v1f72G5K7j3YgOSBMhICJDkErUKfla0sPVTkm17LMwGK9WNLyeWO0jyoYY+J6EGh+RFK
         nFayPsp4BW1cvw1wGnD3vrVKv4v0nrCJebywB5JPL4XPEoQuXBXbruTkl1ByHMxQrUO5
         3GjA==
X-Forwarded-Encrypted: i=1; AFNElJ+pzN/GyZrpNJ336LNAE3q/ix8zsjtokY0NUmp2uM/kWnQrs+xw9XzxGJFkiJD6jWlwFaiwg7aWlX4spdAO@vger.kernel.org
X-Gm-Message-State: AOJu0YwTHwCfAjcqCHGCTc3JvhwYVay6hBw6FpzXhJZfpObf3dYKy8ih
	yVT+81T44T+VVgD+el/lHNjwUkzJvva3YPUH/x1GOvTFh/EplGJzY625sKIhQIiQMHrlR92Rzya
	3/BDvrTw0q7gz+ppCfBgNAJBi6vJQI4EUUsBgCFa2kVr/r+U36W25agTgQVy7y9dg6Heb
X-Gm-Gg: Acq92OFlvYwt/+Hd2t2tTDoWxE9rYLUOXszfCXKGjHdpHcDsj9WOR2lsFjimpCVdrpi
	OPB5HHCZE0TEh1MvWvm8t4iKCTs3suDKXabONTH0zB4yX5ka8g1135X2/lWM+H1kgZvk77eruw4
	Jd+B4xJIySksRn3jylBXRY3dzzKmysPhrB7Qcmd7NbYVeIqVKTkHgfpQCuhr1658nbmbswxpr1G
	GPH4SC5gOavPYGixzehaCJli8cVddJ/BQ0o3kqZwdJN1yytQ9GFw0YEMEXKicJb14+109UFLoJx
	V8Ia7mnoEOxtGtQgIrB4nYDHqfLd6/J5s9AMV05S8zGN5GxCmGBjuYdoCeu8DKtmemeBWkBhyTI
	uyYZMmlXVq6aURGZlGZ7gJ35CjU0ZJ9IPgD1U7Fk5BmIalToAJbCfAU4=
X-Received: by 2002:a05:6a20:748f:b0:3a3:21db:8ee8 with SMTP id adf61e73a8af0-3af7fb6dd28mr5381443637.1.1778697625602;
        Wed, 13 May 2026 11:40:25 -0700 (PDT)
X-Received: by 2002:a05:6a20:748f:b0:3a3:21db:8ee8 with SMTP id adf61e73a8af0-3af7fb6dd28mr5381389637.1.1778697625081;
        Wed, 13 May 2026 11:40:25 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c826771a8a1sm15271009a12.24.2026.05.13.11.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 11:40:24 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Thu, 14 May 2026 00:10:03 +0530
Subject: [PATCH 1/3] dt-bindings: dma: qcom,bam-dma: Document BAM v2.0.0
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260514-knp_qce-v1-1-0ebdac98e50c@oss.qualcomm.com>
References: <20260514-knp_qce-v1-0-0ebdac98e50c@oss.qualcomm.com>
In-Reply-To: <20260514-knp_qce-v1-0-0ebdac98e50c@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Arun Neelakantam <aneelaka@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE4NSBTYWx0ZWRfX1LGgsZfWnzLG
 iElLQsSkyWdFAcN947LUoYYbQpbO85I3s5H5mi+Uwm03Je3YuFVLEFRH+cihDAGbuCjfqUnf49r
 DU4q7jZzI/CSEQJgeNw2J+5z3OX7HMvrhKbz/CNR+gdrhF9xDoy1sx4PwHj2McP39VXIcWxVI0u
 ke/AXQ/1U4s4LYx5LuCY3/Gwruu1O913UCV5Erpot0X3Ir731JsGXCkKSNI9VsZ0iIsuYaIur7N
 B1t0b3Z0Gy7I4/kZlTUsS4BPR1n7HeEjPbw1+a5s8WsdaK9oi23lXtsx51otDrI5fX1RylvnTUy
 /MKweFxllP8jFro1dx/0kKlDjFHtfsQSACiI59hV4qTMfiOA7d46NVYxow918FxqzCLmkIrEBza
 MhmYHK06w3OWTkrOQfoK6K1/lkPWs1o8U6re3uZVzLiWJFaBwndVsfXuRs9/FaO0ha4H5xCgwzW
 e2tKLLEelj9pSzM/cIg==
X-Authority-Analysis: v=2.4 cv=XqXK/1F9 c=1 sm=1 tr=0 ts=6a04c59a cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=QMZoEd0Ms9iLIoMSFykA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: 5Inpxz-iLqFKf_Hg9QynvSXicoNxhdQ5
X-Proofpoint-GUID: 5Inpxz-iLqFKf_Hg9QynvSXicoNxhdQ5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130185
X-Rspamd-Queue-Id: 074B95392FE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107428-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[1dc4000:email,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Document compatible string for bam v2.0.0 version found on kaanapali.
BAM v2.0.0 differs from the earlier v1.7.X revision in terms of register
layout and offsets, requiring a distinct compatible for correct hardware
description.

Also add a new example for BAM v2.0.0 to illustrate a more complete
configuration than the existing v1.4 example. The new example covers
64-bit address and size cells, IOMMU bindings and execution
environment–related properties required on newer platforms.

Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
 .../devicetree/bindings/dma/qcom,bam-dma.yaml       | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml b/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml
index 6493a6968bb4..0923fb189ada 100644
--- a/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml
+++ b/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml
@@ -23,6 +23,8 @@ properties:
           - qcom,bam-v1.4.0
           # MSM8916, SDM630
           - qcom,bam-v1.7.0
+          # Kaanapali
+          - qcom,bam-v2.0.0
       - items:
           - enum:
               # SDM845, SM6115, SM8150, SM8250 and QCM2290
@@ -118,4 +120,23 @@ examples:
         #dma-cells = <1>;
         qcom,ee = <0>;
     };
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        dma-controller@1dc4000 {
+            compatible = "qcom,bam-v2.0.0";
+            reg = <0x0 0x01dc4000 0x0 0x22000>;
+            interrupts = <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
+            #dma-cells = <1>;
+            iommus = <&apps_smmu 0xc0 0>, <&apps_smmu 0xc1 0>;
+            qcom,ee = <0>;
+            qcom,num-ees = <4>;
+            num-channels = <20>;
+            qcom,controlled-remotely;
+        };
+    };
 ...

-- 
2.34.1


