Return-Path: <linux-arm-msm+bounces-84845-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 23368CB193D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 02:07:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B1C68312AFB4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 01:05:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85D9521D3CD;
	Wed, 10 Dec 2025 01:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="PUdY41UT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D8221A92F
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 01:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765328756; cv=none; b=LHH6vsp3PoLAlCHJFqLYvjt8ndlsamPH16Lsf8qn4xGowdDsJXo3a047j5G9DpUVAjAK0cZQ/zrrO0hk0amaz9pYJaZCtowismDOHfFfJZUlvyfGlVsMCOUXMB6PISMPJfhNLhef0rDHraeor8KsjQjdyQTyrPQRvlasfe6++kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765328756; c=relaxed/simple;
	bh=YrhnGu6LmehfwdHWZT1BvVNTtQV3ilK14SnRP9mcbNo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S8EhsP7ewLuWKPzo2jsCs1bqLPgT4xpVwAJJJvyTsHQeuy84gHdMcLLq81PpXvqMKM1BIlTnAcLnTR+xLVioXq71La1PdgcjNUwxBxP5AHVbC4VqbiP8UaE13jdKM7gXS6P93lEKbFBjyGe1l0Ajb7i9jxn9AmZOuwQBKsPxhCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=PUdY41UT; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47795f6f5c0so40718665e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 17:05:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1765328753; x=1765933553; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5naoPmz25ACan9Hsv717jQTcrvrpX+itusQfrwOWSdg=;
        b=PUdY41UT6jA2PgeH4voN9q2b44OS7nxzAr0b8dZiLAIN+GnlqgLRjMPJcpDDGMs7bL
         rgiJXcUuq1QR8GncrT0pjJyMWo5/ttNslfi/GsGTcudpLuA+dM93mmY1pbO6Tj6v0/Wq
         cV6t196SmlJI+/xc8WmHPqm9nxJJiY0xuBTp68HIQN7H5cYrIvMKy8BfVnOiUSHagG1M
         TbRE2AmjaeDG5BkjlqiVeW/WEN/awtJ/ITbtCzcAE67i+cWKIiScxjH4HQrLUUlrvsbg
         22ftHPtmHBBO4j/hByG/Pdz+g8oo3YR4Dn1GRcBUJJzn6AxogqY8FnVXK/qqYdLN0HBg
         C4ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765328753; x=1765933553;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5naoPmz25ACan9Hsv717jQTcrvrpX+itusQfrwOWSdg=;
        b=uTWkKRiqzBjjPsRcYQWdYjbXsVOJ/UqSWvsoZGuH25UJxglfhZSjWsaNkWOAqtdSLu
         f+qYXDKbtNtWlnHj3ZGT/EAlavgP2p2Enxr/QLIoIHfqDTt5+llXe37nxBTFgOhBiLkd
         D85GKbVrUTvS2nuMP4Fb/G4N0NsGExyJ/DvDyDuq3LArrpMbF1NyCjsvE1/1heFwljMQ
         rCPbXLbb29UUCtTwNKIXkNAtVzOtbtScO33lN9Aez+G1SaKQDVU16DrKsfTIUWLxU5OS
         s+ZOopEU4pUe9wdazVtfFb3vg6j7MR7coohApx2ESFxB1bXd9G3+HsIBYAnfh4hbVGoL
         Abpw==
X-Forwarded-Encrypted: i=1; AJvYcCXe7UWA7lYkzhlgYOw/WXy6UviwJ9R1U7aMh2X9KCyGT/l+hd0lOdwQdZxL9+PR7fG1dYw/3Zilmv3PjjFu@vger.kernel.org
X-Gm-Message-State: AOJu0Yxor2x7ZfFZznJ2Iyo0Vi7+6ouEAe4BfTg5V7gN2F/xhbJWs7wE
	KVR7YbMHUVg2wJlHPhq7ZvW6ug0keaWnTkr5TKNY3SRWgj9REt4/e1Vn/eCCfZetwro=
X-Gm-Gg: ASbGncuUM7FhrDmH8xHm084xSUc5Z636Jil3nrGn4SBS0hQHpvaembAj7VtuIkPNcrJ
	Wr1VvBgi0BWb2njBNKQvKBeryGua6wCq6fwl6GUzedPOcDo1WRgf6d5/KKueF7fOkPbnC/thPOs
	WwPVgQBER9iLOhgNATIeg0r86iNbmkVeujlIQeBK7T6BFQp5ZVG7TfFtREyasEDorgWPtCV0Tlj
	1Fi1brywS98jWLB3noyzbsZTVmqw88NCf2XMUyTymB+PwM1+eeR5NXJyW3YI8h7s47NJd4WMIoR
	a5EB89WrmB6G8ckT+bAV6oFLlauIKylXGLK31o1XuGy4/IFhUMrGkL4lSri4rZFeuOUk4pSB31T
	Bjg84XT1YHY3zzc1krMpPaJdrMrcVAP3VN2OhBAfxfz6b9gKJR+elp0i34OQrMroyKC9xKXmdu9
	L+4bRdVUwjvlDAhGiesltwz3UNvC+ZFmXMvYCzyCEgzr1tVR0H3Q==
X-Google-Smtp-Source: AGHT+IEyKqUcK/2aZSA6qWuXW0Riv57nPy+c/1E5UcZc42jICfbOBCDPNJhGuFHogXPXXaH81Jg+KQ==
X-Received: by 2002:a05:600c:621b:b0:477:79f8:daa8 with SMTP id 5b1f17b1804b1-47a83806976mr6180005e9.17.1765328752810;
        Tue, 09 Dec 2025 17:05:52 -0800 (PST)
Received: from [10.200.8.8] (p99249-ipoefx.ipoe.ocn.ne.jp. [153.246.134.248])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29dae4cf9acsm163206575ad.28.2025.12.09.17.05.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 17:05:52 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 10 Dec 2025 10:05:30 +0900
Subject: [PATCH 4/4] arm64: dts: qcom: sm7225-fairphone-fp4: Enable CCI
 pull-up
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251210-fp4-cam-prep-v1-4-0eacbff271ec@fairphone.com>
References: <20251210-fp4-cam-prep-v1-0-0eacbff271ec@fairphone.com>
In-Reply-To: <20251210-fp4-cam-prep-v1-0-0eacbff271ec@fairphone.com>
To: Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765328733; l=849;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=YrhnGu6LmehfwdHWZT1BvVNTtQV3ilK14SnRP9mcbNo=;
 b=AFvm4GlaLB5Ro70RBGcv4FBtSlxqZF8no6mQgOBUDV58EFGYhTnlZsfcbG7WG30/nN8juNWMB
 ExtfsAk+Q9IA6lIFRs9nByaEgZp54yR8DdLL/Blbq53LMTqwveKp2MG
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Enable vreg_l6p, which is the voltage source for the pull-up resistor of
the CCI busses.

This ensures that I2C communication works as expected.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
index 0cfb24e3941d..a3c2b26736f4 100644
--- a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
+++ b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
@@ -693,6 +693,8 @@ vreg_l6p: ldo6 {
 				regulator-name = "vreg_l6p";
 				regulator-min-microvolt = <1500000>;
 				regulator-max-microvolt = <1800000>;
+				/* Pull-up for CCI I2C busses */
+				regulator-always-on;
 			};
 
 			vreg_l7p: ldo7 {

-- 
2.52.0


