Return-Path: <linux-arm-msm+bounces-49527-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C07A461E8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 15:11:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5AE6B175571
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 14:11:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42F4722173C;
	Wed, 26 Feb 2025 14:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="MxaouGYJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5165D221579
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Feb 2025 14:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740579040; cv=none; b=Zhre/KLYQtvOWOm/pkfSyVa01Ph8COD4pbe/0F6wVEFM3VuQ1WhzBOp4TaJFUEePu9ft0bsbK41yta1b9qbGn+A2Eo+Bi52HsMT+udUWw0yHbkNZ3+n4Q0NkOVKzxRuVVDH+a2Nne8SJDznKxlPt752OCtWfuheKLhCR4mTiO8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740579040; c=relaxed/simple;
	bh=P7w9OXQiQrKC5xuGSyYgTs9k0mD2TUTs1hwUynrSPC8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f6txUMkwRKiGsrCaE+iLCsuK289wr6KJPKwznqVIXm6oxtl8yAecYE0j39A426Aqx19cdGm1OkgBLbz9UcexmIWfqZ+wtmbhlZUk+BzGV1i7G+7JrwLC/MESWjgcTj8T4cCEqX0lTsW+9aSOYve11uthSNiVSuif6tTd7N1aD9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=MxaouGYJ; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-388cae9eb9fso3789095f8f.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Feb 2025 06:10:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1740579036; x=1741183836; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mJ9yHxHTj9hXoq8ESuMoLUnH+h1yWDXZJ3MZuCpqRWI=;
        b=MxaouGYJEdfbeIs4mLifJnIf/UiqCok4NBWKZi7lbtX5Z6EZvh8XMKlO19NEAahmcp
         MW5S9VCd1Ocnr+Elp02Y/S9rWJGLFKVeJu9LxouTTTgq7AhlxC/W79/KBk5OC85gmKZU
         M0xMdgzIJQ+4sXXzzw9TB0NvWPPnNc//cPlp6PFR+FxxdAutXdcNU7XbvcUve4XC4od1
         IbAZi5THxDKhT/N3uKVy4afDtFAt1pRcqWLF2QlrQtDudZzJdo9oqfxftmvqurQ2lB4A
         AGtIYQ31kccN34l5Un30vJfsSATwZ0Byvc8/AEJbSQciFIYxqc7Do9jPWpbNQu7dBaf1
         OSZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740579036; x=1741183836;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mJ9yHxHTj9hXoq8ESuMoLUnH+h1yWDXZJ3MZuCpqRWI=;
        b=wID63CCu/fBE8j1z7Q76JgSn+I1A8rq28uToICTo6GFZfKwcbdylmI2J8W0SexTycJ
         k2GR0UJE3R0JKMO8ODt4TmlfuY5hBZXoXCUES5a30rdp6bL64/0i1Qb77bYJTByQc4aI
         EJ7Jw9U6U5wMGTnUeEO5tqcPVLYc+xg8wfMaOTn/tod/1GV0k+JlHQz9brsgcwqVVjjg
         eDJy1ZAsk7LYNwFBrqVDX5wlGsRYUuSyiF3gRzeoTV77gE4RO5ofN2Suz/XkY5zOGyC5
         ipoZWvfalilpoMwininxs8sSQfax90MfyVUMPOZK8kghZ5f+V9+ws2pvRmwPxb4rj5tY
         f+1g==
X-Forwarded-Encrypted: i=1; AJvYcCUasUzP8950CtUzI1FCTkkhL5j521cPWwZbFa+sA5QHlmP/WXgHDDS7ZixMIfvLCyEk2b2GdJp1R0+jU1Vz@vger.kernel.org
X-Gm-Message-State: AOJu0YwVF6cbKRu2HFsb2FN3Iecb42p07/7cvFZ5aFMihVWOQSCgNNI1
	GZJKnBFDJZZD4D4D85T5xFe9RpxhGKCANA0PGqV0K8RfhhWLdL/KoPL73OCIoto=
X-Gm-Gg: ASbGncvZrmAek8MQya54fIuuUcVqdThb3kXf4VpD+Axa2sZFXJVZ1EWUwsnGGr9Dj8v
	NmvaX0GCht/1qZM9JWqYWq7J2jXDjhDWZ79vleOiixARVNWHINkpNRjuJwUAcE812KiC6H2Q75S
	j/e9ecUixwMv75Czx0VbPGlfHzbQM7/OmOiZZHVtY0NoQ/2TfZ8wAGZgzq9Tr45I6djraebobjW
	OvLSnIyWFKdSJljz/1Tq1kcC4Q0P7fhFCIDJtjCqiZ3aFwbmB2tTJWzSxSt3eFrmXn/trusDy2e
	bw1e0E7Tao8CZcNgqhAAeruwiV2miCT/Eb4WLu3MZIGIcKF6eiH9N0w+NO46isSVGv8PeFnepGI
	=
X-Google-Smtp-Source: AGHT+IHFry1L5wTMtQdP0z3fvjIAfQ/KnpnPkdZsEzieuHFdzyw77DYAj9YLwJb0jc6fKY5zmaQvyw==
X-Received: by 2002:a5d:47c6:0:b0:38f:3a89:fdb5 with SMTP id ffacd0b85a97d-390cc5f6d66mr5664563f8f.11.1740579036576;
        Wed, 26 Feb 2025 06:10:36 -0800 (PST)
Received: from [100.64.0.4] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390cd70be4csm5755889f8f.0.2025.02.26.06.10.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 06:10:36 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 26 Feb 2025 15:10:19 +0100
Subject: [PATCH 2/3] arm64: dts: qcom: qcm6490-fairphone-fp5: Add OCP96011
 audio switch
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250226-fp5-pmic-glink-dp-v1-2-e6661d38652c@fairphone.com>
References: <20250226-fp5-pmic-glink-dp-v1-0-e6661d38652c@fairphone.com>
In-Reply-To: <20250226-fp5-pmic-glink-dp-v1-0-e6661d38652c@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

Add a node for the OCP96011 on the board which is used to handle USB-C
analog audio switch and handles the SBU mux for DisplayPort-over-USB-C.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index 3c134d28e0c1965de55356af9c19c1331b029669..b3fc37dba51523ce5678ae6d73f7d835f8b26d9e 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -750,7 +750,16 @@ vreg_l7p: ldo7 {
 	};
 
 	/* Pixelworks @ 26 */
-	/* FSA4480 USB audio switch @ 42 */
+
+	typec-mux@42 {
+		compatible = "ocs,ocp96011", "fcs,fsa4480";
+		reg = <0x42>;
+
+		interrupts-extended = <&tlmm 7 IRQ_TYPE_LEVEL_LOW>;
+
+		vcc-supply = <&vreg_bob>;
+	};
+
 	/* AW86927FCR haptics @ 5a */
 };
 

-- 
2.48.1


