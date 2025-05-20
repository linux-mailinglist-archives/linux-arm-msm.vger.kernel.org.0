Return-Path: <linux-arm-msm+bounces-58749-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A97CEABE0F9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 18:45:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8EB408C0AA8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 16:44:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98AAE27C863;
	Tue, 20 May 2025 16:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gnTgCS3D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2402327AC43;
	Tue, 20 May 2025 16:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747759495; cv=none; b=qWknZsyOe7B6RiCXC4dRRqHSnr5GwKylk/JqsGJP72qEHyFgUG2bv1FbwTjXJ2uLJnXNgaieyRzuMR9YBVnBl/AImBB3NiP2zze1FSdBtKkoDKljvUHrhPR2lj7ihet11gDKgcXa6GATU/Ir8o/bDdSHcUvpIDE3lKEqyBjMTio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747759495; c=relaxed/simple;
	bh=v81X4bbmcwM7DBNzwFZws/MtkZG0bA+9FhK98M2OQoU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jpO+cGhg/xCfgg38cAg+/VdRsBWQF6/JeUiAOIGhaqs5AUtafTv4Ue+86CJpnoCaWVR1YGLw2VvoKbRmE5j7dJ4Z5r8yw5SWGQTchxx0JkSxXIBbQ0Oxn0zHkVavd5LBRldPJ1fP9HfdX5FuEzrngkujzm5p68X59LIMQv+brlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gnTgCS3D; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-23274dbcbc2so12974085ad.1;
        Tue, 20 May 2025 09:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747759493; x=1748364293; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4FeCd1gY/ZSmQNC/SGEMrthULrvfyti13qrWs3WXOQk=;
        b=gnTgCS3DKwy263uGMmJlkrAsKDwT2YmO2T7cXuH4Om9tRz50eWhDL2uRf2xvfeE1aJ
         wtEkFePK+PFPDZ+65zoqR916wdoFkXlK7lynf4a5e//YGcNGB7I3GscXHljtj3HPlKys
         uUdQ26sw3b2SHSLzRivq9Ch4by/+zKqvYpzvz87AtMaXEatHkLfyXCO92B+fPnuZO1P1
         cijpWNEJSwqyFkI4DymyyDnySee1bIfVbZIzhdK2twkO3jx7Qix2uCYa1mg+i+Qreh83
         624dQKVNsjD85eb/AcTdIDdzqPloDF9ehLarazbwDbJDEpdhZwQZj/wtWdPQzf4oQjO8
         BigA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747759493; x=1748364293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4FeCd1gY/ZSmQNC/SGEMrthULrvfyti13qrWs3WXOQk=;
        b=KnywaGrTlkgisLGNzwcil5rSH/ma39otu3T1U4EfSlhgQk747Ck0wDypJ75ahg3C92
         JoFj9tz2/1MuUPRu1JpRMQiGiCM8MZo3ut7b0ho2AJyLr/8FjbjXHtGjG8cY1dW3qDSg
         VLPqDHys51/gyqXshkYODFD8AKYc0TvspidPKcXXgGi0JrWyV5e6oFzie7sMlbcXk5lS
         k+y1OfZ5ZSOPSvfmcuOx8mNQzjDbXUG3SRv8meM07J9meyPWW8lDhSjXd9WLoz/mwv1t
         PLXv3oVkDgFZXjKakhtRGaRHTwqzIDtqSu4ddLkqwapuWy78/0FF3P0xCCEu7sUmK5q9
         xkmg==
X-Forwarded-Encrypted: i=1; AJvYcCUsffShgv0aLYMPasb/f3cVgrhE8xTEg+pEv26M/JKjgNV7XoCw6jVUzJPmQ91bu+7HMWHge8VDp3mG@vger.kernel.org, AJvYcCW9R/dfkD5H9CBbPj6VjHq+caD8X5wvDsoI10LV0edzOVmc7mjcnbtGHGn/ODBDQvSrpRp6cdNnlozfhEgh@vger.kernel.org
X-Gm-Message-State: AOJu0YxBCqrkoODpJUfs5yMN5ulma4MfOeX04uIZVbdvlh1KdHnbDgu/
	lqRktd8nZW+G4IQemkvpUvTOPXe1/2KIu/dZ3IA4g830rTehEOoaKqOrLci+DA==
X-Gm-Gg: ASbGncuf3xoc8kQOB+JsFOBMxsuk3CQc8dzmagKdtIAChhjb/cYcfHrd4+27CHLkrLJ
	IRrsG39cjquC/QOh4mTc4lovXfBKBgE4Dzf8rWTXjctYe10UvzyIy1eyXOXN2tntYrFRJoXcRgs
	ZYWFzPErFJOJt3Bmcz2NVBNvRE4lGd1EmM8Z0+oKAKCPhIqyuugW3UIdcQQV/NamMQ1KRrby1oZ
	MX9usjvy/rxeDeHSqg481jACznzlVTNQf2Rcglj3bTGjXprpaW97+SH3zyLr3JZg9Ay1HAC721V
	FMt6ItHVLZqtIJS5kmdJ7XVKBFXk6pqkwJ19R8I15SQkAa4eVw==
X-Google-Smtp-Source: AGHT+IGEYx8duwBS/GA8viLinXiguhRcKb+y1+TdjzfOXCDmdglYjMfJhvATEnqBpiYUVvoSkPoOqA==
X-Received: by 2002:a17:903:184:b0:231:b7f5:cab5 with SMTP id d9443c01a7336-231de3ada16mr225244855ad.33.1747759493301;
        Tue, 20 May 2025 09:44:53 -0700 (PDT)
Received: from nuvole.. ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-233abb99a06sm3548205ad.254.2025.05.20.09.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 09:44:52 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH 1/2] dt-bindings: arm: qcom: Add Oneplus Pad Pro (caihong)
Date: Wed, 21 May 2025 00:42:07 +0800
Message-ID: <20250520164208.516675-2-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250520164208.516675-1-mitltlatltl@gmail.com>
References: <20250520164208.516675-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The OnePlus Pad Pro is an Android tablet based on the Qualcomm SM8650
platform. Its device codename is "caihong".

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 56f78f0f38..f00eb43065 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1111,6 +1111,7 @@ properties:
 
       - items:
           - enum:
+              - oneplus,caihong
               - qcom,sm8650-hdk
               - qcom,sm8650-mtp
               - qcom,sm8650-qrd
-- 
2.49.0


