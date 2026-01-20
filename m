Return-Path: <linux-arm-msm+bounces-89801-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC04D3C638
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 11:54:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 1BA2758AD93
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 10:34:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B1063D34B2;
	Tue, 20 Jan 2026 10:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UjmoqfOh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aOll+NQA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04CAE3F23A1
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 10:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768905216; cv=none; b=Rnimm++pMhrcauRcK6pAuvjB0VRm7Ya5vqOnRcA2HKA2KWeFB4D4jTta/jhOP0D+TNa4p221BbpkgiC8nCjTzkW77MNI9SHgXuoHvR6+up9xUtm/MZ/eKikYzQpOzILBo86CG/N9PRAPhlvOrYlEMvQN+YFEg1EIHDZakcYyW0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768905216; c=relaxed/simple;
	bh=//Q1FM6ceE8AkEPRh5q8yEDL5X4YynRf9RxCBcRMY+g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qLdnN2PqdkADEY7aMJoKupiWrFAd8RdnEQzu6THIx5zZshFX9E6F2csQJcB+7hCzTaH3SvPG7NEiVuH0dvmO5jX1e3fzEGpfkipKhZDKV2ILiB6UskFg3/2Q6tQ61b0juP8HsP179AYr6CL/FH98EUNQ4wRWF7qnxo5p9sTd7yM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UjmoqfOh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aOll+NQA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60K9A0SC3256591
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 10:33:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=OljtFy1/E76
	aRPmWidaZ430+oTzv1USq1vUpaqauZD4=; b=UjmoqfOhEmql5MiAfZKjbRvgoJE
	X6QxwGHGdArAiDTyscasi/ArUmHtUqAjGYuyGD3Z13ldDj5t7TdaYj3mKthP2egw
	f5n3VZsRZeWDaw0bNPrg6v4cYNsuVQmIv0A7BLUjxzrM/Bnpkha2cYMnjJ9gEF+L
	76ngeSB1YWTu+j62W1Q0zvyn6bFfuMjjzxsp5sImJjChsRjrf5l4k4bQcRmbEEec
	erthqT5+lBTh2P1RtDJFgVhd4ueaBtsdCBCUrJ0/yXWYXTvyXOQzKZf9G7Ysgipy
	7MMorP2ZAD+9pun96SyrXBnT1tZeLuvCh3TcyygElJbX8wOX+Mfk4phfQZw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bt6u7r7yx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 10:33:33 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-34ab8693a2cso9324196a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 02:33:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768905213; x=1769510013; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OljtFy1/E76aRPmWidaZ430+oTzv1USq1vUpaqauZD4=;
        b=aOll+NQA4BQDuFsOs1rfoqxizhju7ZWbGNBnaaBw6TZeAyhqWbnTG5lnW9Omp6j62x
         8kYfJxx6lNF53j/pCQpOLqI/4n37ZuMUmAJ1FfCeY/coqdRLtGQcw8fAOUNiQj0qlC2C
         3gZL0Eao+Q3mWKPkMUSMGBqzUiLoq/e5oyEig+2KDTD8a2GWuoot52tkEXVYjwxK32nX
         FujYpLRAQ+pJ2myJ5uS6MwHkF+oBnvC9ecupd3HDZdvsK2iiciMKsIES/udWTBLewwY5
         Wr8mvUM0nDPs1EaHbvCYmDmOE1SHgEvDS5O59XSFpy3rFdzWMsokDeOv5D3xiYI6oNNN
         eIHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768905213; x=1769510013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OljtFy1/E76aRPmWidaZ430+oTzv1USq1vUpaqauZD4=;
        b=rjZL2Qh2biRDsFeYpsGfAuav+PU/FRw201siIsp8YRWya0XyDztH2BesBBAyDI8FmO
         eVofSvmGVr5W1mt8iK/pun2vFwPjOwzlqfSVEjRHGSutcfP1nC08pkc//EEVmBIPwL3r
         kxbvHHHKSmxOtEIEpCt41DdgPSoGQo9H5XTXvfJxKoKAJKQDPKnlZ95EHHmi10z3sjME
         e3uaSyVvUz4s/4yh14L0nreIzrMFf2stZI8XhWczvmM6417uwM9PHpsNPPfu4ku2I4Bh
         SC2sUiY8Ip4SHx4B0nkwrkbuejCkt4B7MrBRmp4QbIJW9VARcNrW6lH6QE3Kc0Liurxs
         FWlA==
X-Forwarded-Encrypted: i=1; AJvYcCX/nqEaNoyhTEz4u/ETN5/hdCncasHreV/n7pxeHukixa82wLEDFdOOsBK4JZE1zF+2uX1jJcLl5pokoviD@vger.kernel.org
X-Gm-Message-State: AOJu0YweURltHS5g1Vc0/0FuYg11d6dplPD35uBPtoWE1sxtqmBvL5tU
	6qRv977Rw5MZqVpfZhqN+0r+/NjZairKI+Z1m9mGgLt11QvtucGVNKdYV/5B4PKtusH1aUO13Rd
	Ge+f3jg90IE1TAm/uttataHws8JqT5nLIIyyeZEg/xNRENOr6wy2EM7ZBFvM+2dN7XrDy
X-Gm-Gg: AY/fxX5YShSIx5+5UhDD+pRiOtaafk4vjkGW1bK9U0Qil0zxKMMMvwR4tiO2PbBmWgx
	N6LMZkVzteYdPqMhKFPClT/544azImMpOjBBv786EESzM5g8SQyP62Vde9sbSsKMQ6u/8DPwRNX
	3BVCsyNz/qs78pbwGflqsp6CoHlN+j0FaDUkHNO5quiuL5e7k3F1nIhJpsCZ/pw/juhNIt5ig8s
	1z7N6gyvmcHgZ63+HMWQbG1Qwur5zEa+23MGG6u14JPm637I1qqGOOg+VJgGQIiuhyG5qr8Hep7
	DwNFNIksZBUfbE1Zw9aLflDCNaJra5DNoFH+xfYUAEzc9O8OJGlPHF+RLXzwY13b9zxeXWqB+Jp
	wck6xcPysd+gQDt4Pm0fAw0LFM7U1iNOBddDGoLO2ka0=
X-Received: by 2002:a05:6a20:a106:b0:35f:549a:b0b3 with SMTP id adf61e73a8af0-38e45d2eea3mr1295936637.23.1768905212539;
        Tue, 20 Jan 2026 02:33:32 -0800 (PST)
X-Received: by 2002:a05:6a20:a106:b0:35f:549a:b0b3 with SMTP id adf61e73a8af0-38e45d2eea3mr1295913637.23.1768905212032;
        Tue, 20 Jan 2026 02:33:32 -0800 (PST)
Received: from hu-swatagar-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c5edf3791e5sm10050709a12.31.2026.01.20.02.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 02:33:31 -0800 (PST)
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Icenowy Zheng <uwu@icenowy.me>,
        Matthias Kaehlcke <mka@chromium.org>,
        Mike Looijmans <mike.looijmans@topic.nl>,
        Stephen Boyd <swboyd@chromium.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Chaoyi Chen <chaoyi.chen@rock-chips.com>,
        =?UTF-8?q?J=20=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
        Pin-yen Lin <treapking@chromium.org>,
        Catalin Popescu <catalin.popescu@leica-geosystems.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Subject: [PATCH v4 1/4] dt-bindings: usb: Add binding for Genesys Logic GL3590 hub
Date: Tue, 20 Jan 2026 16:03:09 +0530
Message-Id: <20260120103312.2174727-2-swati.agarwal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260120103312.2174727-1-swati.agarwal@oss.qualcomm.com>
References: <20260120103312.2174727-1-swati.agarwal@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=P/w3RyAu c=1 sm=1 tr=0 ts=696f59fd cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=1mrrX1IwxDsCUTwcy_oA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDA4NiBTYWx0ZWRfX5Bf5taCQySHq
 X/VdAqvqqNZ31eAFpHJMxLZzxaO5A7Jqymi2h25bW9mDZzTRTFNAkj0L4cRMnc52brLdqVZMVOD
 zP3F6/0BppJR/eZyDiuN3tUAdlwiPXVs6TQ6hhoslgiKbBws93iFe1AqnbEbYTKcbVI7YUhuIYs
 UQCETEYrUg693DEJP7TGu81PjBxKN7eY4B2jVB0U0JCzudXNTCieT6sgN1tB7FIBZ78ngltGiq/
 J/U6v5kLoPY1929DJuHrTq/8EIW9lCKvOGggWc/iYtmeUGhIDtDdmMpWxZCXfBnIDHVJFSUbNSf
 uxI45744wfcrf1OjmzzAK+uyKSZHS+JoRGnbWjEuyxfc51UemAUDbXm7SrI/ONLQfaLfK4MsOXH
 o5A+/AvCJMKcwMLOPA4xaKNt8+mjh4URMxB6EXRKo9FjE1b2Djmh8c6GoOfXSrAyb3jRtIv2Opg
 aCjG0UoOLCfTklTSoeQ==
X-Proofpoint-ORIG-GUID: jDw-oJR6h-CfNE7DU825Oe0MOzEH1Y0K
X-Proofpoint-GUID: jDw-oJR6h-CfNE7DU825Oe0MOzEH1Y0K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-20_02,2026-01-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601200086

Add the binding for the USB3.2 Genesys Logic GL3590 hub.
GL3590 hub requires 1.2V and 3.3V supplies for operation.

Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
---
 .../devicetree/bindings/usb/genesys,gl850g.yaml | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml b/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
index 9a94b2a74a1e..a4a359000ca1 100644
--- a/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
+++ b/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
@@ -15,6 +15,7 @@ properties:
       - usb5e3,608
       - usb5e3,610
       - usb5e3,620
+      - usb5e3,625
       - usb5e3,626
 
   reg: true
@@ -26,6 +27,10 @@ properties:
     description:
       The regulator that provides 3.3V or 5.0V core power to the hub.
 
+  vdd12-supply:
+    description:
+      The regulator that provides 1.2V power to the hub.
+
   peer-hub: true
 
   ports:
@@ -69,6 +74,18 @@ allOf:
         peer-hub: true
         vdd-supply: true
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - usb5e3,625
+    then:
+      properties:
+        peer-hub: true
+        vdd-supply: true
+        vdd12-supply: true
+
 unevaluatedProperties: false
 
 examples:
-- 
2.34.1


