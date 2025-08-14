Return-Path: <linux-arm-msm+bounces-69128-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69847B25D6A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 09:32:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B7054165474
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 07:29:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B35F927056B;
	Thu, 14 Aug 2025 07:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bUgQ4Ivr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 485902701CF
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 07:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755156482; cv=none; b=eoBUJnTUuVJg6JBgsAiQHvTdBCrWFiCrrgEqvk4K8aQA9ZjI9ItWz5g1fYoINX2rMfGq9GaoxqFYM6XmxOw6ObNIQkh+PgiuzAq9ZKqW1rWzfxZ4i+A+4CU/c+672V7fzXPUOEkor1kBFnleerjGLtz3ga7tPl24IETd6fgk1do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755156482; c=relaxed/simple;
	bh=JKE8XeEWQuVBdJspgbbvbXt9TNiZ5M05CMuElgrBmxc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ExI7UM4K2MfU8oXF8WxiG5EL2iZpcP/a9AgLa2Mzor11KQt1ixP3mKZQUomN1Now4USzU3Bv8PucONmOMLYHTRy3Zt8I8fX//t/eKegYM9FnDVskS02WBaE6mKJVZQsIJMRghwldtdb3lWBcIZrc/VZmEaiRTBGp2igpDULRjqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bUgQ4Ivr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DMOc9q013008
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 07:28:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w+aXJU651HYPWpuqmg2nJipq77ZAjPoPawcKtHFM/+w=; b=bUgQ4IvrDXTjlciV
	43sq0fH7Sch5k8/kuq4zSsxxBmnb5TZethLFMDfDE0ahXaa1GkXLsoNGvIUnnEeU
	sAs7NFtbVwIKKA3vNDt4OoEnnzR1mgH0DpXFtxCb7F4Oawv5CqZmrXhXpraMeIvJ
	a/IpWA64bLCV+hknshH6NhxLccN4/691t2CcKDr7wUdjww/M3ZmIx3/wDbEIu0Pc
	HvFc8GX811UcFa1Opg/GJjdRlI13rkY6O9b/Nafa6Hc+XcKKZ2okQnC1i+IBEaFc
	entvm9yN8WpU41JscY+xax5W6nxrGRxMDALTqrlRXbp5cXWC4iTqHfLpgLcdxRto
	AqUr0g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ffq6tmdx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 07:28:00 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-24458027f67so13419045ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 00:28:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755156479; x=1755761279;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w+aXJU651HYPWpuqmg2nJipq77ZAjPoPawcKtHFM/+w=;
        b=f5sGhAsL3+JSd0lFKtdTJQFJhnSrlSqZEIXA7E+sSKJCDLSxCilexCG5fd0qx1wqfF
         luuTzhXrgEMRIQvMj4IJs+W1aWlQsQae0PBTn+nhkfCPrFVD1bfu5lkgjQIjId0dqi4Y
         KWYjiKX3CJF4VLQrLGFi+s8RDNLdKDJMa/ZQDnRrnksHhnrLEE4X6f5J4Xk+quwj7e/E
         2Bukgk6jIMHXWW1WpZZybYrWGGYS2Liqu/NLQVBHsay1QFe/lK7nt33cP8g/LSqYpyuX
         5NOlKbZ/QrC5tYtpgA72u4wDINQEYtqWraD0eRU/N5zVmmjOqJJoVCrKA1qXyHt4Dvip
         P5ig==
X-Forwarded-Encrypted: i=1; AJvYcCUTpkszzPezk3h7t8hoiPx6IuSeXPPwXNqHaIHHbeQ1fmVIW8QbhQ136Ma5yUnMKQmuQLdI2hXVY1j36Z+w@vger.kernel.org
X-Gm-Message-State: AOJu0YwxFCP87DNQp8D2dWgnmTWfQ3Ab531mcjqxAQJx5C7EEWyESNSD
	FavUCS60rbHqMQyafUlZBsXIQXK+MGqfdqjF9td517Mwb1jWu6OmQ4/oh/I5+mWaJGqalBs44ac
	Qr1ULgrD6vgE3BIGRYBHGHha81EWzVEw6CS2N/3RFkn1pAuszMJTUUa8qE1A63vqw6k9B
X-Gm-Gg: ASbGncupPPMLJk3nA3A7jjEZlbAYpi5x7vYAoQS5qS1nNVjRsxB6p9BhRlC1Yw1kurx
	rfDRbFnWjimuTmIR97ZwrhIluGS7pBu9HkUcy0Krbat1hupCep0dfWt13w+lDGYojefSmMtbyWo
	4rPj7P45U2x2xsC4YS/Q/7ua+dDwa8lgNfTDQKMUFFW5cFOh3shcD+yeG+MI124IP//odpNvV89
	8bI+yWkpIsiesSVMK5t/7FoVNK+DORDHdkHIga7Yl+yYF8rLMqnbvgQu3Y44xPXYhTZokbp0eiM
	mJ4YI5LlKB0mGAylwwPhd6beAX8DdJCWej7tLmmmIwLRWwBVHa9t9K/TPqv95SuLIJCY6R/Qv7g
	FLkJItws9zmYM9bQkS6Vpd3sUCG9MyYYjFA==
X-Received: by 2002:a17:902:f78c:b0:234:d679:72e9 with SMTP id d9443c01a7336-244584b44e9mr27812645ad.12.1755156479481;
        Thu, 14 Aug 2025 00:27:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6pRhGLFcPGP8aOyg99NqkjVLCBppmn4RqtM8WYm5//M26hmWOmdLYptNmAgIsnvx89M8FqQ==
X-Received: by 2002:a17:902:f78c:b0:234:d679:72e9 with SMTP id d9443c01a7336-244584b44e9mr27812275ad.12.1755156479023;
        Thu, 14 Aug 2025 00:27:59 -0700 (PDT)
Received: from yijiyang-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3232f8c8e4bsm535458a91.2.2025.08.14.00.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 00:27:58 -0700 (PDT)
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
Date: Thu, 14 Aug 2025 15:27:28 +0800
Subject: [PATCH v5 1/3] dt-bindings: arm: qcom: Document HAMOA-IOT-EVK
 board
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250814-hamoa_initial-v5-1-817a9c6e8d47@oss.qualcomm.com>
References: <20250814-hamoa_initial-v5-0-817a9c6e8d47@oss.qualcomm.com>
In-Reply-To: <20250814-hamoa_initial-v5-0-817a9c6e8d47@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Yijie Yang <yijie.yang@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755156471; l=1233;
 i=yijie.yang@oss.qualcomm.com; s=20240408; h=from:subject:message-id;
 bh=JKE8XeEWQuVBdJspgbbvbXt9TNiZ5M05CMuElgrBmxc=;
 b=5WuxaS3gE8ZTN7Xc4Hi7Xh/J9zRwtSs5MpD6NKLboTRCJdnznNe/G4xBrpU5cD4pq1HTxjVJb
 rXrTK3k/6sKBiFQ2CetL4gZo4DwyEqoaT5IGjpu0YnaaxDYqLt+RhsD
X-Developer-Key: i=yijie.yang@oss.qualcomm.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA3NSBTYWx0ZWRfX3xa8ZyC5Kjqb
 WZk+K1FchgceUh9SRxiXqMxzqaONqDQUxEGe34yI1raPCmnXUiCJFz5whAVgp3FPkTw5nlbOlrE
 yZV0L0iWI4nb89HOoYrx3Fh4yx3dKgsuzqMFHM2/HMEv7mxMpfB2Rm++tJt/bQUGiVIs+u8aUVc
 pA14wv8XaV7EekO+ZkIlZ6VMXDuF2pdcK4xR7KU+nvXXLnMZ5g1DG1rXFqWmqdC7jNgzQ8mJWVo
 DGRyiDD03uaeWKAx5842SCUjL5gHUoTcC1669tb00eH7NzEJv0yFdAeFw2E7RMOuEI+UjpnTvlJ
 dMpdeFy8Rf1hZXuomjVx1uNWeAmadEkPx0W03oGLTZ7RM+Fr9IEF1t9eXY1H4fbViCs0ehXVbsm
 FOdaLpoz
X-Authority-Analysis: v=2.4 cv=TLZFS0la c=1 sm=1 tr=0 ts=689d9000 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=Bh1HEMNN3wmc11-eFpoA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: YrrvCBQ72HDTYrOVMPamBfgE1SG0biPF
X-Proofpoint-ORIG-GUID: YrrvCBQ72HDTYrOVMPamBfgE1SG0biPF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110075

Document the device tree binding for the HAMOA-IOT-EVK board, which uses
the Qualcomm X1E80100 SoC.

The EVK consists of a carrier board and a modular System-on-Module (SoM).
The SoM integrates the SoC, PMICs, and essential GPIOs, while the EVK
carrier board provides additional peripherals such as UART and USB
interfaces.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 55e5eb75af8905c93e6604d54d516585f70a8e29..6b6503181ad6f2e4932a52d86a54c77e7fbbac9e 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1069,6 +1069,12 @@ properties:
               - qcom,x1e80100-qcp
           - const: qcom,x1e80100
 
+      - items:
+          - enum:
+              - qcom,hamoa-iot-evk
+          - const: qcom,hamoa-iot-som
+          - const: qcom,x1e80100
+
       - items:
           - enum:
               - asus,zenbook-a14-ux3407qa

-- 
2.34.1


