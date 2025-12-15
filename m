Return-Path: <linux-arm-msm+bounces-85226-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB00CBD74D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 12:12:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1CE8C301FF70
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 11:11:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 948C832FA37;
	Mon, 15 Dec 2025 11:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JA+d9JxZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="elJB4ImK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A99B232FA25
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 11:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765797092; cv=none; b=Q5dD6x9Sg9resUnsSCfkN1Gjdku6qKshCR+MLpEd0G6TFX8B0JZMhGjThD7PZc8HIB4yZw5dieRxWSfhGbrOrUWBe8vShGfhv/gzlirKy7UlrRJz9N/3vYF8+q6GztX6YbFbXos5wzRmBKmJZOSVRYnMJNDq4E2Vxckd1vknjfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765797092; c=relaxed/simple;
	bh=jJzhUAVqnjEE7xQJfD0Z/rpFIMfoyIfHHNdKkonpEGA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Af7fN6GnFjBpVI3AmGWSxdseGHx91aRgoKxFTzaooWcVhWIQmDJ4Cl7gTbv0jihr2TFdPRBhVZ1JCOoQAhYXZVA5aOko9OA0yqrqaxoJhrpwX4WMYcG9/WC4GIUSaNtNlsIRWR5wjpSsvtr/KOF8E/Qj1mivAq88zFmzm2LhFbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JA+d9JxZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=elJB4ImK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BFANnTP038419
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 11:11:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jR9tCjr6Z+ELgPCuFXaDHFuAfQoa+UU0pSvWjSrMSIQ=; b=JA+d9JxZJoG699j3
	OkvofhmcSVO4ak7mVQBvqWQFECB7XHNoYEuDCnJw6ia5pU2wUq1yXRjBE0ObzRlF
	9Gr6K/1JXna8cMItRS5ppjneiXy/nto3TqgWfDcr+tfylh8Kn2IoPF9gSo7tViJS
	qZk8r/Hh6B1/QcrV303iUvSdkAS5a+y/2sosTrAk71OPvEvO1aazqSHPuMlyv4No
	HmueFb9DO2hhsAJwTxZnfaB6+DJ1Gzbp+E55Sf51EO5xHJSDA+BZ0nm85yXVVHN7
	MUx+0OXOzw0kOvShBReShKCIi23Zq290rJo/u1M+WUPIiegpJNiz3DhJoBfi+iQh
	nJJlzQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b11bcvbuh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 11:11:29 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7c7957d978aso3320311b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 03:11:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765797089; x=1766401889; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jR9tCjr6Z+ELgPCuFXaDHFuAfQoa+UU0pSvWjSrMSIQ=;
        b=elJB4ImKRT1AUEmmko7qPaPsAMKGSeSDXTkeTRIad6ZRRGpuTjokhjfKahYBSktxeS
         8mn0FoDe6c++uaTQebbtOdPk2DCNdDkkyH5ei9Y6JCqCRWAh48CnREtEjeFwLdyHsQen
         hxtny9VoT9qV/KJ+MQ//n9iJOz/PTGWf9LTTX6bLsgPfPrj246tHjmaJmRW0HyAyOLVu
         8DG1XxBEbwLWVKcIEyQpv25IrVbXXHBBa9OEJdoiu8pxoUtCv5TCpN6jsgq3yInONJzB
         dIiCfG60IzYTsghfV35ZWYfAeGUcgUhx5NT1QHqr0CS2BxyAM3fOAZdQkelcDI6sm8ty
         hFUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765797089; x=1766401889;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jR9tCjr6Z+ELgPCuFXaDHFuAfQoa+UU0pSvWjSrMSIQ=;
        b=qDJHzBUNR0dsZwYP9eKh87DY/OTJYXbwaDOwbh5xcmDEMCSqexOm+TJlTXKuNq7Q1t
         2wqOQl32dNgqs5GRp5YueKz+/L7Bigi0eAAxPY7dC5UeNMIF1ESbio1dzqQKpbsGA1HB
         FK49DVYXsBWvZWXPNLJD+9cim9XqYIaNq7++s5CkLgtEgItYbfPCq+2yJaGlyWvBwfZO
         /r7R96GF0CBsqn3Xp6+w+mzDhhicmtvgwOHDlEsLnRRBiWXDUcBlgVAG/CcGu8+PSJUc
         0XOavCgM0xySOAfnqJlj/8U3twwEaFpRbAOGQ0dpzO6DCq2BtFUtuHWG2hsz01nOokqy
         j2aA==
X-Forwarded-Encrypted: i=1; AJvYcCWZBHMByMMmZ8LBYxr0h9fmg3tqBFIMIaTSP8iphZQBiCsRBDUGP73yYyqkO1cIhh4XyD+W6uXvYhKjT/gW@vger.kernel.org
X-Gm-Message-State: AOJu0YxzI0d+STzbTYuXKeLyJfVQiW54n9qSOZQ7ez8ed+bPZK5hLv2w
	7Cs1jyiIRAcRCYheUlKP1EshtqrJm7tTz6aqXE/WFi26Hbpbv0xrJ2bS/TNzfeMcSLRDbr1d8Fm
	v7SreelUGj6aDobb/MLMZpzLHo1b7e11JDJ+fmC5d01HqHyIxdSgWEXQShtq1zeredEGd
X-Gm-Gg: AY/fxX73C+dDuOnH9X2JUD0q+k56iCCtoGBVuUYIpFrGy6znYqCgDa2TE0LM9ib6qo+
	Ny0plP5SnI986NGq436c+RKntdccRAt2Ua33zsdcm+QSyP9o5Mg94W29ikiKFawonZestmuZ8x8
	3p7Q/J0cUQt3LeNvoilvY01X0+nB+4u9UAqrfQV2uUItiB6cP9U6hragAkA1X4sAZdf1HFJJnl2
	pYLp+TcmjYPMngxPosWFv9Nw9QO6Fe9IeOpLWpV6Un0P2m64lLd+b8krywjpLUXf3G6AfYVJU1m
	3AC1xoEGcOlMAtFxHtWu3OtRox5iVeFt/Kfjhk4DA57iCZqnpo8pn4/jNO7Ii607v3fwdgXC7Aw
	NguQySfoRxXiDtexHdrwxkl0qkyu9Te5JfGvIOJKbo0t0
X-Received: by 2002:a05:6a00:a381:b0:7e8:4471:8cb with SMTP id d2e1a72fcca58-7f6694ab102mr7825460b3a.44.1765797088325;
        Mon, 15 Dec 2025 03:11:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF7r4351sjS8Nxlky7ansYRrwn9nrpxIcYkkyBMYzMH7Km1X2tHrnoZ4A8abdqUdPrIQTG08A==
X-Received: by 2002:a05:6a00:a381:b0:7e8:4471:8cb with SMTP id d2e1a72fcca58-7f6694ab102mr7825436b3a.44.1765797087852;
        Mon, 15 Dec 2025 03:11:27 -0800 (PST)
Received: from hu-jprakash-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7f4c2379e40sm12408918b3a.5.2025.12.15.03.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 03:11:27 -0800 (PST)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Mon, 15 Dec 2025 16:41:04 +0530
Subject: [PATCH v3 1/2] dt-bindings: leds: leds-qcom-lpg: Add support for
 PMH0101 PWM
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251215-knp-pmic-leds-v3-1-5e583f68b0e5@oss.qualcomm.com>
References: <20251215-knp-pmic-leds-v3-0-5e583f68b0e5@oss.qualcomm.com>
In-Reply-To: <20251215-knp-pmic-leds-v3-0-5e583f68b0e5@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Fenglin Wu <quic_fenglinw@quicinc.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        aiqun.yu@oss.qualcomm.com, kamal.wadhwa@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, jingyi.wang@oss.qualcomm.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765797078; l=851;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=jJzhUAVqnjEE7xQJfD0Z/rpFIMfoyIfHHNdKkonpEGA=;
 b=NiTfsOXJEsLkqNqIu3Y0OhdaSRbQXaWppeXzCC9vQ1+4yaWrnL0qsxzEbOaSP/30rJKS7kFWy
 IC2WybB6XMEAs3rczQbBLPIsF89vq96vknLpp/16wPk46UyjrAz/57M
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-GUID: pS1VhcgBGkj3Iyw8ar2HeerGQgXXeVjU
X-Authority-Analysis: v=2.4 cv=ebMwvrEH c=1 sm=1 tr=0 ts=693fece1 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=l_06JH2mHj-VWuRQOQwA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDA5NiBTYWx0ZWRfX7iptnsy0m9hu
 ilRwOFI+LLJoyndwx87MI2h5Pfxv/b7hJxH+A/Iq0FFMtn5p2dhNLcbydM0QaqXpymnUExdXgDf
 DRBnSssE42FYCipzZfSIu7YkwpgJdRenPT4V2GpmqELileIbrw66/nKFtJzsTc+8nku6fn9STUP
 ZS3kTSOWQDGLjUX2dwlUCNalX+bhsgxOKiaTRjvlOwklC6IHhf3vDAXKs/aWY3FWAiyt5hIoZ2X
 IO9ZYoEqAlNmaao8kH9rcP5adc0EeEwj1cv0c11BQeS6SaSDVOTXrRZzDch3gqlmj0wXIpiX2ZL
 Xa1gHA/p2DiO91J8MV7Xhy+aJH3GupN+qwbvbuZahPh0phfKgHDN330zde81zKv1DB2bgrk4Fa1
 rOOW0guadi5Tk8UiZDtOvLpD0RSF/A==
X-Proofpoint-ORIG-GUID: pS1VhcgBGkj3Iyw8ar2HeerGQgXXeVjU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_02,2025-12-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512150096

Add support for PMH0101 PWM modules which are compatible with the PM8350c
PWM modules.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml b/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml
index c4b7e57b2518..3da0fe532e74 100644
--- a/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml
@@ -43,6 +43,7 @@ properties:
       - items:
           - enum:
               - qcom,pm8550-pwm
+              - qcom,pmh0101-pwm
           - const: qcom,pm8350c-pwm
       - items:
           - enum:

-- 
2.25.1


