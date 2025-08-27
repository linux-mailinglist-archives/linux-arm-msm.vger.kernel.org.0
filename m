Return-Path: <linux-arm-msm+bounces-70975-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D8865B37857
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Aug 2025 04:53:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D024E1B67F91
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Aug 2025 02:53:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6126B304980;
	Wed, 27 Aug 2025 02:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H8SqDjrh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7AD130277F
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 02:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756263175; cv=none; b=iBdcxbHp1nXg3BNU5FruadUZ9w3qmJUVxjB4hBt5eabNwgUqOYpGTtOLIn14YLAZSTBiRx1LTqLyT0FcdC4htINTWiYU9wUfyujA8zWqez3/RyCwvW5afB66tnPtwVOJpWTpNxjexN37UXC74Q6SIq7YBYEbJg088KTNPNl2Xjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756263175; c=relaxed/simple;
	bh=ES0C/eHUJ0vZMSiE7e9k3eopudAsRoEFpDfAJn+GlGw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MFr6djDqR50YDcstzfuCz/xrM2ReIrKmF04l+o1oXFpVudmnkpK5a7wELlDWRgKeyBOthLKjChQakee9w7drhPiG/LFHNFUAokWwVp8/zvkLrEwE6kIQtQKm/bgBIcGbBmlJDr8+2cKcL8/KlRDuspqFzLfmbInVrS9DWLhH7vE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H8SqDjrh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57QNMiMO031504
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 02:52:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jWgEnfKM2T8SN4ZowpfF7xlxhdEVJCQ/+pQl9CKBY4Q=; b=H8SqDjrhL5yxCvaX
	fNMzBUx0AmZNsoPkXo3pSF+fUiealA5nBKOfTN+1kzcpuAaUpsLc4CnkX9vQwRtf
	h8NtSFOE4vtncZcEE/0hq4Qmdr5zXhXz017+hDtqq7fKl0j8c666VQuq3MsdMcCP
	gdF7D6LhE4Y2UfIymZTtMAG12zQtPgchF3geSGyaHclAA6dcvTPcWAArFlxzCQ5J
	zicJ1Z/bhV5oLYFXHn2TzFUPe/LBg8cm1YVuKxDzFr405UfiO/bgz8lu4HHK1gFh
	dzddD648xfXzPfhmHr9gLRfGLBdiSZ1iWYV1C4GF8qemtEySG2RumaZUnc83dDmZ
	BwROoQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48se16t6mu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 02:52:53 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b49d41ffbb4so2613389a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 19:52:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756263172; x=1756867972;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jWgEnfKM2T8SN4ZowpfF7xlxhdEVJCQ/+pQl9CKBY4Q=;
        b=CUSFrusnY4PJ8L6V2hAQcfdGSdqhfMJzvLddkwGqasEgYt/t2ka1DFM8FY/nCkTD/3
         EybYBrss+SYuGIZcRsVq/AmUCxzhRhRcS3EV5762R42nsVOjhFDpB21q+xuv7Yr+WwLH
         eXUebR4oC3h8Pu7Wcwp5hzXXf5ffvzzrk9+GCGQDWH7pIyJUMG4ptheCBpP3D7XXxS1W
         p5/6XYK7ydEmt5jZhQh89GQ5mLGjf0uvRSx23Pu3AunPBrSZZ8qonosAW/DU2B97+qDJ
         JDyyisuWZCLQFrT8q9JZw8t4Epr6FmLWRGka20/x1Hl2jC0u1DKYzqukr4OGb/5OVFDW
         ra8Q==
X-Gm-Message-State: AOJu0YyUqy0AxJfJEPaPyxh1R7dUF+m95tkO4hhdiDfXjgmbuw8hNZ1F
	wYvAJqw+4w4DPTUGxG7wkk8+5I7nwtgo+l3FC+MeqNMig+jUG3e5Fjou2qqvd9JxZw2rEhuIiE9
	vCi801hl/ujtMcEK1qvvfbLnvsnXewUWC30HKkeXz6NsLLoEAdpxUmpyG3wGBfGAFWHIf
X-Gm-Gg: ASbGncu2YNF9U3iuxkzLlj0Z2upUIqP+5QgTC2fiGw5UBMffDJCmAdtxh0YnzrqhHhG
	LwSr22JVXKfI8+eQ027KN2Yz1gZDO8rPxDgmKjz/pb8AANpxv5nGscJ09+dQePiYnFU5pQS0rNX
	57CtD2sEfACv8yYqkbb13rwFt3s1SAWWeUDD1446tdb4KmAF/Up5hwDFuc7TTOQTTnDesmOI+sm
	sNvmyWNCirQmJhF2GRojHzpjkgKXUhuYP2tFB1xkbXy6pIsPVQa+xni2NeBbOWqK0OQT+U3LE18
	3DnADtPSFKPu2D3Ap8YIJBEuOji8Xd+bOm/MSWiMz8LZhZIqa/s2W0FEmjYJHEwD4KcJ6+gBXsx
	iklS+xDF5W43NM2Xkxs1sE4OPjQbrGDAlZw==
X-Received: by 2002:a17:902:e94d:b0:246:e3eb:83eb with SMTP id d9443c01a7336-246e3eb883dmr89472365ad.9.1756263172177;
        Tue, 26 Aug 2025 19:52:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEqqqn79vouwlZO4KNux7qzyUJSjXJNybPNeCuIpEcgF8TZwWhnREv1xmYBLaQ9KJnXBXsGSQ==
X-Received: by 2002:a17:902:e94d:b0:246:e3eb:83eb with SMTP id d9443c01a7336-246e3eb883dmr89472095ad.9.1756263171724;
        Tue, 26 Aug 2025 19:52:51 -0700 (PDT)
Received: from yijiyang-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-246687a661fsm109337585ad.43.2025.08.26.19.52.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 19:52:51 -0700 (PDT)
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
Date: Wed, 27 Aug 2025 10:52:18 +0800
Subject: [PATCH v7 1/3] dt-bindings: arm: qcom: Document HAMOA-IOT-EVK
 board
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250827-hamoa_initial-v7-1-f9b81d564bb2@oss.qualcomm.com>
References: <20250827-hamoa_initial-v7-0-f9b81d564bb2@oss.qualcomm.com>
In-Reply-To: <20250827-hamoa_initial-v7-0-f9b81d564bb2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Yijie Yang <yijie.yang@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.15-dev-5bbf5
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756263163; l=1177;
 i=yijie.yang@oss.qualcomm.com; s=20240408; h=from:subject:message-id;
 bh=ES0C/eHUJ0vZMSiE7e9k3eopudAsRoEFpDfAJn+GlGw=;
 b=I74cHyOAQ19djbA8fWCU/jxqgxV89TL229KhWU2N+T2CedFkYml4WtmqKIelGJiD+UnMFh+Ma
 HxXDJac9N7ECQlxYG3hIu3a6V3CHN8rKLAskOGLWTxNLADGbzE885i7
X-Developer-Key: i=yijie.yang@oss.qualcomm.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-Proofpoint-GUID: bYBlR2dhSQFjP_WsXoIj2_W4vvUJ1UZC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI2MDEyMCBTYWx0ZWRfXyw7T+IGP8sLh
 230/RCoGzpQRFiHxZFvTWGyVjuEChksFS0NZ/P2QV95tp6f0RlfrSZgK/FQbqTliuhb3X6MHdZY
 u9NG7iz/ck2UPxjJgezlt8Uqum0bQG3oEw1kBgok6jM5xQOJEOqMcXFKUXJJi5SmC4HlB46/iVi
 9TOXaeuXOqxgHFcmTCxp2/lxLn7F8HsAzdNGPCm17T52GDoqwZ8rVxcBCu0ln4o46n+Y8GIw0B8
 Oag4k7BsqSCIE+tdZpH2vEQ/44PdWRdE83R8Vvn7ZkY5lCjhjPcgVgXB51oaziklFJJCWYV+Lyl
 HwA/RY8s1eKpluRDQFZ6togYbo9DXT6fJNa3yMnP5Jd+EWt04aCgw5NDF+c8R7CUqnFVEDIqOEe
 6o55uLZQ
X-Proofpoint-ORIG-GUID: bYBlR2dhSQFjP_WsXoIj2_W4vvUJ1UZC
X-Authority-Analysis: v=2.4 cv=CNYqXQrD c=1 sm=1 tr=0 ts=68ae7305 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=Bh1HEMNN3wmc11-eFpoA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 adultscore=0 spamscore=0
 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508260120

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
index 55e5eb75af89..6b6503181ad6 100644
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


