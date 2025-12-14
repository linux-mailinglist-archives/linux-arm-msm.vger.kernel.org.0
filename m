Return-Path: <linux-arm-msm+bounces-85181-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 69363CBC021
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Dec 2025 21:50:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6D4D9301C3E9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Dec 2025 20:50:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D6A028727C;
	Sun, 14 Dec 2025 20:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lERWT+Pz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H9QWhaqw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC6B2798EA
	for <linux-arm-msm@vger.kernel.org>; Sun, 14 Dec 2025 20:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765745416; cv=none; b=GUse4cOXqQeqVYmbGVzQi5XSFRtspjjaON6UH4MbJIyZXlc/KNjIbZIg+uZD1yqXPjvPU7wnMXbiQ1Xa95VfGRninaYZGCdyQejW03tgKXMKbsbBAmht8A3E3+d4cQKImSJ3zuupiIbqDYilS3r6FY4h4qC1vHKPl0/tP+tbhUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765745416; c=relaxed/simple;
	bh=oOMh4OyXYGjUE696EX9XPgRxSeZI/QYVedwe5b1mA68=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IhrrA9YPJ+kzIY4QxadEYUUpp8HHlPdOczL3ktS0NXMwP/zwptkXGLuGGniAS3zmCOf7X9aAx7spRp/5tyNyE4Ra06J+EeNyvH4Pql+9CLsUFZdKcJD9SXZBFfxB0iSPcJvQY51PHnMxLVQwZMujccosq5SWbGnnRGQCUkJGseU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lERWT+Pz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H9QWhaqw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BEJxpSC2495310
	for <linux-arm-msm@vger.kernel.org>; Sun, 14 Dec 2025 20:50:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UiZ4ZlTzc8e31vn9ZlGNAKJ5PRsPrggM7QZMINIoi9s=; b=lERWT+PzbHUO3q9+
	2eQgWQzp5oXhSnFCQI4HG57kMJxfJcma07U3VrRgfkDQdORb77VQKFqZoiOc4zmk
	q67UvA6mN7Y9usQbWBmKtLCMxPgrDn9sVeTS5tBZjt1QJXcbpMW/KaxSr/2nJgXl
	cX3faWJgpiBYC6OVq+rkuyiztgpry79mXNRflWndnWEnSckGGuE9vSCNPWd1dRUe
	gtM6jsD9VBjMS3h545AB8l0K9ukNh5o+FK7L0uS8vwnSI9F7XfOs3bxBoaLhEIvR
	yms3bbld9+smu4uErFToST6iyBCGJuANaaxelDkF1Wvs0eTZ22tEEZ+CwgEifv14
	dB9TXw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b11c6jgn5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 14 Dec 2025 20:50:13 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b51db8ebd9so1025972285a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 Dec 2025 12:50:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765745413; x=1766350213; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UiZ4ZlTzc8e31vn9ZlGNAKJ5PRsPrggM7QZMINIoi9s=;
        b=H9QWhaqwNlKL4xfG+xfko3xG64alPyA/gEKj7n6T0kTpTmPryRxeuMpnwqqM6DYiwc
         HN/5AUHg03UDGagCq2UhenS3a+WJRz2xkYHYtULYTVP7VtuHdVze5E9SK4X1ZkyupHi9
         Lh+8tX253tapNHsT+mFIIPo59R76xADCVWe+xLFfpbrr2PHIYYTDFLT0rfAM8HcbF2Fr
         UsLCN8VMD2j2l+vSXTuFU6C4j4yk6BQdnG5iGWGFnaYC9bKYBEY+ZBxs+vkuPuIta5s+
         RrTDV6dnaUvoEhjBySIzl7jY+j/QCSHstx/laO03uczlTLXPcUybNh57C+MGDLQEm2YA
         xhQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765745413; x=1766350213;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UiZ4ZlTzc8e31vn9ZlGNAKJ5PRsPrggM7QZMINIoi9s=;
        b=DkyMV6f3QIJq0MjqSw8zELKpJFYDD3icGinOrl25PFz42ro9CPsukG0VYbLjJCvctO
         bmJ22D8tuPSYe9ASgnXzqopbS9InQ0f6tXZcFk8Y91PjYCH/XHNprndqbUGQXKwR9lkb
         s3YPFjRMFfjZaYvwyMcmnNRc0M/GmxYE+WibTZtW1FRlW4OWGvn9JuDlrP2sgOuIzJet
         0/3QxMnpcVIyLxLiu91rPq/Nz8OIi0d2kUFutJ8drU7x40mOn+BWnjllotmmdPirCwWT
         kzI7QiXHp5X4pcaXeN5jXKABGLc92XKSnIW64dqz3XP9H9ODwasvHuDXzBWzfksGX72M
         YknQ==
X-Gm-Message-State: AOJu0Yyoh4clxoV2mD5wg09iEDapi+02L+HZQqvFgFXJEdhzjufYXH0O
	ludQNtLGtz57FrSjETo/f3NDCUyUlth+u8Np2YOf3M5lxzEaPWCrOAvd+5PztqJOuN+j1k63rtz
	rKzJw1okCHiKKsDvDKhUGv8VvQDFmEgfdfM75J2tfG37Aq/cn/1JpjYZuIRfdzMeuK88X
X-Gm-Gg: AY/fxX4NTEJSTe5uuQUbPM9TbwZopu4nqCLHPwWJ7aXBDxiCXRgh6VLGVUIazuAbNhZ
	2V6vJVj3ZXS5uBZ8SbSXpeXVvIw93xFgwScJsxk6vO/s/xsd5YHU0B/NFbUymQl3+4pnA39fReM
	P2COy40rWXozGD/rr/3i99JpSMsxPvlc88y9DPAXvQxOWgLvU6stuwHtRDbErO4sL/NJI8+0Nyo
	GWutuOIcsYqrzvBiXPlENgpoGSq8MYSu9lYdfZLkt3UEs7vhAWe+gxc3GigBgDz/A6iM2kgKmSB
	iJoZONFEK6NDK+KPyvU05HZ+n5QrqmCjZ95gwAMQzkBIzR6jALfUQ3khu4AkH0lcVmTDYsfgQkv
	KtdnimGrZgXiR5g4=
X-Received: by 2002:a05:620a:46a7:b0:893:b99:7120 with SMTP id af79cd13be357-8bb3a38f6abmr1277316885a.80.1765745412472;
        Sun, 14 Dec 2025 12:50:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHnGzCsdTgvQPQuSCCUb5HDbghpBjQIKbS56h8BoWAzwSzndAO9vGC32uevwEc+zIM5YKtRpw==
X-Received: by 2002:a05:620a:46a7:b0:893:b99:7120 with SMTP id af79cd13be357-8bb3a38f6abmr1277314585a.80.1765745411892;
        Sun, 14 Dec 2025 12:50:11 -0800 (PST)
Received: from hackbox.lan ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa2ed80dsm1206316366b.16.2025.12.14.12.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 12:50:11 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Sun, 14 Dec 2025 22:49:58 +0200
Subject: [PATCH 1/2] dt-bindings: watchdog: Document X1E80100 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251214-arm64-dts-qcom-x1e80100-el2-add-apss-wdt-v1-1-94ee80b8cbe7@oss.qualcomm.com>
References: <20251214-arm64-dts-qcom-x1e80100-el2-add-apss-wdt-v1-0-94ee80b8cbe7@oss.qualcomm.com>
In-Reply-To: <20251214-arm64-dts-qcom-x1e80100-el2-add-apss-wdt-v1-0-94ee80b8cbe7@oss.qualcomm.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=899;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=oOMh4OyXYGjUE696EX9XPgRxSeZI/QYVedwe5b1mA68=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpPyL+hKRBngv/xGSDGnYKgkRkqCIqy5brQDXOE
 R7z/d4uM8mJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaT8i/gAKCRAbX0TJAJUV
 VkHXD/9nnqBbTWy4LWahARK0bk5c8IfjuH3dd3gm+zOCV9xbCcTAy7q/SPLquCVlldX4+toz5t2
 pg3lJm9gFLXmgbnJwPZ0gr1SagIFvy+1PZY73lHovtZoZqGmsU5dX2KAYlGu07WPsWw75p1ttYZ
 Inr+Um+Ow3JILewNxixTjin/wPZZh7XSBMGrIcjXzcNRin/IIVMxU7dshVeGcVuVsEuBt5M7NtE
 8ol7KYnwkm1/JFfXXPuNI+YxCh/o096lXr1keh1d3RR1sioe5C7d28+B28tjoc+UV3VFNndT2o8
 MRTTXQotXnMcMe5vGtiJjoWMcyjWWHyZG3I/xfOKZuCB4rQcaYGZNPE55Kd/kW/wIu7ahzY43F7
 byZs7ZMqALkbrokPrfxME+4eoyOUIDy8NB1HbbfhtAiJarppkBmu2lL9hD4VhkhHYyu30MRWRvW
 WLECBqk9ryULxT4iJhxHteTSfieibpEdaUbb6Yeg775dD8RZnqSzTrhht+6Qatd0OYYD12cu7ye
 kLADOdoBx0ByR2MH0wW8nzZWQqdYhJDqUF1xg/xJhPXMcNDQd76T11Iaet79i/Ij/W3E0tcXOKB
 kckezDbTOJHsCstKfO/5fedmpeujZU3/n4BrGUZdckfhGIzcRKbAMMjAnBkxbVNr1DLJoK1qDcY
 3jNgSJ/j4oHzmsQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=actsXBot c=1 sm=1 tr=0 ts=693f2305 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=DdBtMnqNxkYIvXj6ev4VzQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=M593omIBZdqBa3o2AgMA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: K14XwZ67Qm1Cl0d3oVqnkRiBASc8QJqr
X-Proofpoint-GUID: K14XwZ67Qm1Cl0d3oVqnkRiBASc8QJqr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE0MDE5MyBTYWx0ZWRfX3zIgPRbY+gUG
 10gH3RoEYXY4etI1289qO9uABK+K3Iqq1j50Hwf6/ATE6LHJWVn5fmbw6DHEBygVJ7uwd9uettg
 AX/IPsSqVGdGGjCfar2IZLfdYE0EmAdfKYB/ECbx9qqitZUfj+PFIdcufDu4YRiPoAMsM68+KzX
 E2ckFs5pskMA8ghw/3l7OODrST3bKBrj4YbaEZTER7GKeIbQ6IHDPudw9am341DVzZyEecu3X7V
 llJKFa8xP2iqJ7R2i8qCXOROWV/Cfee2duXLiAAyMow43OwxjqR8NsYOWRFVGznDD4G4AfeOVIu
 Dp4z4g2lMVktZVp2GHeV1wrqQYKfE7Stotue1OKsBOM2KwsuiJq3HG79FPm99dEArPwU0CYIP81
 ZYdYXuTIDeznwRhFLQXKhW7zXDat2Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-14_06,2025-12-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0
 impostorscore=0 suspectscore=0 bulkscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512140193

Document the compatible for the X1E80100 platform to the Qualcomm watchdog
binding. The HW implementation is compatible with the KPSS WDT.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
index 54f5311ed016..f2c4bc900e5f 100644
--- a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
@@ -43,6 +43,7 @@ properties:
               - qcom,apss-wdt-sm6350
               - qcom,apss-wdt-sm8150
               - qcom,apss-wdt-sm8250
+              - qcom,apss-wdt-x1e80100
           - const: qcom,kpss-wdt
       - const: qcom,kpss-wdt
         deprecated: true

-- 
2.48.1


