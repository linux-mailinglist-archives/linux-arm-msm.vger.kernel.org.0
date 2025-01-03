Return-Path: <linux-arm-msm+bounces-43858-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 06811A0084D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 12:12:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 52F323A464F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 11:12:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED44F1F9F49;
	Fri,  3 Jan 2025 11:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="xhNr38+M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F2021F941B
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jan 2025 11:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735902725; cv=none; b=lIxI3LvRjYN28wZE2Tr2+T6XpfHz0WbwtWAtJG8KOSJsLm9ile0qETRAQ6PvfWGyP/CbEdLGEmMkCXpkF4yyrGMKdSTPasUwIwhiYqA5dM1T+/qHkNn32PHhNtr2Y3OwDjGU4yzfA2ktevJ8zLwAUYs21DvITDOQo8bD9f5cdlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735902725; c=relaxed/simple;
	bh=lGFGwODH5qNtH4RDKkJyeypOnyurQWFJKqc9t5ncCnM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=foWzLQD38xjC6lvSZBwHpp1MogaioaGX5+jwHgxK+CWJLb5/NhbQ4fCOBQCql9/9xcKQvIneuleyUEV8Ot900MGYxKHSVKq9ZDsQemFT1aCoAfp2b/faPNYk/zd7+hLRgucYY/p5TVXVziBoJ4Y4HZMrT5qgv4MuTTwXDu+iMEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=xhNr38+M; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-aaf900cc7fbso306421666b.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jan 2025 03:12:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1735902721; x=1736507521; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+4iMzFEzzJ3QSTPBNtLdL31fQF76tgOrStwKGvcP4Gw=;
        b=xhNr38+M9dgopFlgZNephP5Z7FABcIPk3jgz/4G42h0vqjnxUB5B607s34QEaHVWPF
         fySQzK5fzZAvGYsaclPSBDM9prRPXvjmtISVXnT11wEIKywNPLkKYz7Wxz2BsMYLWEMo
         6h8D2bgwwclDOo2nZLqQGGCfC+nO6cNqKlSEF1NIrHm0/OfET0pq8khc79fmnvqdTcN8
         X2j4w1hH2MveUv9gOF0FCconFYzJrI84b3VsyGZ+4DqKXi9Hqwhg0rZox5XmWKyUYiwk
         TRtaPeva3IvAa0JSUtQ/adUnrBUNJIBpZV5WwBq0BUeMc6VjLREq/VKnHs0XkNO7X0a2
         y6+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735902721; x=1736507521;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+4iMzFEzzJ3QSTPBNtLdL31fQF76tgOrStwKGvcP4Gw=;
        b=bQfKt8/sKzj120EZDtBpUW9drCp1exoB3k/S5ZaVdk52ACg4d4sO+pXLwwZYWFGQln
         YfJV2hVy2qP8V73J2S2xkfSYDdXAmgUbLoBtXChibXtgd117i0mvJgUVju1U4+YY0i9m
         uudMpP3nA1sNLkhSj4ci6adSdJJbfcAlrpDq46nNe/MHD54IRhJOvyoj1oXOmz/0jExG
         2sjENhrF4YvSXEodsY+/uZmQ6uK5d5bimE5LTK/nCu6/Lme/WcPVevAtgvGKVP5zGKaf
         i/yCzQn2SNUsow9mBvlPYl1abf5SKWfJc0bjMpzF0oAnUPJpGvLoDzrc3LgU4gu8jXE7
         5FoA==
X-Forwarded-Encrypted: i=1; AJvYcCWSlK+TUFyuasa7Ys6OHa7bMMvrktpwQ/nOAOnU+6mpT8tuBW7H+4GgK+3yt8AeqT0k+dljmNWZsUOBDL2Q@vger.kernel.org
X-Gm-Message-State: AOJu0YzezA745uVG16TkHGqpbajYRphgX9kwsivzGYWRyOsMLwXcvt54
	l3PyJXMbgH4vR7MovjKv/LsBZZcurzytTWNDyKT6qbdpJOE1AVaxmzbMYeqziTM=
X-Gm-Gg: ASbGncuSTkLfyWRSiIc0oLFKesqWOa15q0HlkkEqGNqs2BBFyvSuQOK2zdDWlzWU4xF
	uEK47XfwVHLED/DYj72YGpmMeSpSDlXwJD4tmSv9C5eK5LQhyWP6vFcy/YRi6wtoy5pAV9MZoET
	mOORb3Sl4/vf25bYyQ0bKwPmGO3zeiUKgB1hjBzL0cKh0GLFi47h64t8axIWIXphq6Vt0UPYwzH
	bcEwOUTY31pZdloIcKlz1UQxsl8/l/8OOIzZXS88F8cBYj910n2w8gW33xwLdvIJSOVF5/r8UUY
	adceHMZ5b15eWnfCaWM7xgNM3A==
X-Google-Smtp-Source: AGHT+IGY3KCqXAMnzfDM8VRtAfveUdsHx9ReCbN6sAoZ3bDPUXRPiNKubpCdm919+ev6Z3E8BVckAw==
X-Received: by 2002:a17:907:6e8c:b0:aa9:1b4b:489e with SMTP id a640c23a62f3a-aac2ad8ea23mr4537239166b.24.1735902721429;
        Fri, 03 Jan 2025 03:12:01 -0800 (PST)
Received: from [192.168.178.188] (31-151-138-250.dynamic.upc.nl. [31.151.138.250])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f066130sm1894101366b.183.2025.01.03.03.12.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 03:12:00 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 03 Jan 2025 12:11:57 +0100
Subject: [PATCH 1/5] dt-bindings: eeprom: at24: Add compatible for Giantec
 GT24P128F
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250103-fp5-cam-eeprom-v1-1-88dee1b36f8e@fairphone.com>
References: <20250103-fp5-cam-eeprom-v1-0-88dee1b36f8e@fairphone.com>
In-Reply-To: <20250103-fp5-cam-eeprom-v1-0-88dee1b36f8e@fairphone.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

Add the compatible for another 128Kb EEPROM from Giantec.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/eeprom/at24.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/eeprom/at24.yaml b/Documentation/devicetree/bindings/eeprom/at24.yaml
index 590ba0ef5fa26180b7dda4789fd49ce9b27564ab..a2970c7c8f27600ad0d495a7e14875a3be611c03 100644
--- a/Documentation/devicetree/bindings/eeprom/at24.yaml
+++ b/Documentation/devicetree/bindings/eeprom/at24.yaml
@@ -134,6 +134,7 @@ properties:
           - const: atmel,24c64
       - items:
           - enum:
+              - giantec,gt24p128f
               - renesas,r1ex24128
               - samsung,s524ad0xd1
           - const: atmel,24c128

-- 
2.47.1


