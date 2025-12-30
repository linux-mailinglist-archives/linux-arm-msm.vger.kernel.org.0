Return-Path: <linux-arm-msm+bounces-86900-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BA05BCE88DC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 03:28:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 09EE830142C4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 02:27:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B56B2E0413;
	Tue, 30 Dec 2025 02:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IyT4/7PM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16632DFA3A
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 02:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767061676; cv=none; b=TXZW7isykj3DPUD+RxWDvMfznGRRbYfC5Dk7IgaAP9e+vsHbohS/woFMYcE+U3GVLUTWXeO3/4aqq4bXFFQLa6L+bsXTIfL2fpyRFEZiz+8yi5F2iSTQBw4Y+5VFMzc2jCTDPyYxJW0nRnpzFjJZbqk7CiYYO7wQoMlgJIygpzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767061676; c=relaxed/simple;
	bh=YXBgI2t4nm5UpuqqNmGHihV6HKfXCaa+N896d+z+ohU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mgvIdFZ5CQdd/UZ3pPWTEKXc6GEO59T4zuaH02x/dZAP2pBWOM0mE9nzURbyPSFOvKRj2yT4GKIPe0RReVnuLzj1fkhuhdb3rGsYkE1/R/tl/FL4wlHAK6TC32ODFOoRTlZYsUhe12NntKcHmB/W3BrWg8Co1Sth/aevtk2eIY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IyT4/7PM; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-8b25dd7ab33so654979385a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 18:27:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767061672; x=1767666472; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A4QJCK/skvANbjkRsXgUdZIkupHxpiCQr/nT7P58kB0=;
        b=IyT4/7PM6lMWvpRDDUg5loC/kUbt/Qw74xr1TbI6iC4DfA0cJ5ENEjCxX67vthMUT7
         FGn6auibb9xPtxHq1YqmPqyi21y4K58QZ47C7LryuvjaSXchpCBAqNFeQ0jYmMumjEBF
         ISYNVm8/EwY+x1pfusNPvVjFhMJdqZ3P2sgtYHkQJK3RUzI02IwCyoOwUH4iF7a2+Ti7
         Fpnec8ygF/jpmg4R5mBsdgppw5CvzNqbcaEonMksQ8YKb94NAoEpa34CFNf5gP85BKEL
         26M22+RMNGxvpRUFkPvypOrVUi39lI6sIOS/6t2ndYQSfO4b/jyt7Ndf4D0CN+qrubkd
         TYLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767061672; x=1767666472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=A4QJCK/skvANbjkRsXgUdZIkupHxpiCQr/nT7P58kB0=;
        b=hXvK+liHW04zBg6euUhUB17hk10zwoJiPEemKOyh2yqqADNQw3NqelVnvi+49t6+Ep
         RK1Jw4Id7xXZbapWytzKVU0hEMwzbPPt0kz3n8z5F1ickXHtd9QiG+5AydOp1T0Ugac1
         ihEtAN3A/dfJuu/i3PxNYBQhlgSZf+DCO5Irj7jw/QZxC3lf7mh8WO+K2EjWDqdJmKS+
         JKF+wnmeKoQoQZoxdjMjgem05RrynxG46AuBCKV37bQ7Zwm/6NAvztvLwYZfO3XZcI2r
         HyRQ6CY1vqRi5gYItBPCu6kq8oJ7OiNfFPWkYLWzHVdjrPmswUsqORsNYgPappNz1xGj
         yHkQ==
X-Forwarded-Encrypted: i=1; AJvYcCVU5q92x8JUa5khgwZcjJgoo8n2h0tfrRZoqB+HzIUFBlGeLmvlhH4IRWGMcFa9dla/BoPYACN/hpCY+OtR@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6i6Xhk1qwgV33DYyGogWSolxOj7/VuUThzu+ZonJKK6y5pl0D
	w/LTeVVNe1qUyLfPpmIq2Xre6XpTd8Hd94PqaRh8WYRyBdygEzHaAOW0
X-Gm-Gg: AY/fxX65NanPStUdxiiyxwU0hvq8I8NaUOaooXe8mQTjMzoSKTT2lpJoRaIItlzbEWP
	SrjnbHTPkBfIJzQ3tesRseQKphTXnljX3Ul6IIdQvDvSxheABe6CyhbRMEKw32O/OAwktFhntu1
	aQ5h4+Ly/LjgfJDtaCgpbfTOhEtg1WKyf9sSUhWnUMswIm7lt6TbzLri6djq5mh4FTkaRjXnBEo
	fTLbhgkQtUadPKxTO6bGFmPhLFeX1RbGtacg9yrbdYdjjXbSFHfQxzYz0Hw1q9mpv20iI3B6Tmx
	NWar+80oETpvr9vnpxgA6A7seGdZ3CEruQveZ56cfxDI+JmkmSbKAJn2coIQTLsSnOS/jUpW73x
	JZWnT2XcVP2l47ZVDc6+uuxv32GQqBs+kx8Y0cX/xjtGXVvIhzAp9EoSVGvNSsBmVDlIRdfk8SF
	APxeg4f5gm2l2dqQ==
X-Google-Smtp-Source: AGHT+IEb6nr4IZ3YGQgwtcnUvg8/DdbRWx23EsYtaydxO2BY9fuHxypdM3574iM6M1YYvhnVCYsVrA==
X-Received: by 2002:a05:620a:40d1:b0:850:b7ad:c978 with SMTP id af79cd13be357-8c08fd27767mr4846575785a.49.1767061672372;
        Mon, 29 Dec 2025 18:27:52 -0800 (PST)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d9623fd14sm234903746d6.8.2025.12.29.18.27.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 18:27:51 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [RFC PATCH 1/3] dt-bindings: media: camss: sdm670: Make endpoint properties optional
Date: Mon, 29 Dec 2025 21:27:57 -0500
Message-ID: <20251230022759.9449-2-mailingradian@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251230022759.9449-1-mailingradian@gmail.com>
References: <20251230022759.9449-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Endpoints may be pre-defined with no connection to another endpoint. The
other properties can be omitted in this case, so make them optional to
support this.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 .../devicetree/bindings/media/qcom,sdm670-camss.yaml | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
index 35c40fe22376..e4f09f8681fe 100644
--- a/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
@@ -123,10 +123,6 @@ properties:
                 minItems: 1
                 maxItems: 4
 
-            required:
-              - clock-lanes
-              - data-lanes
-
       port@1:
         $ref: /schemas/graph.yaml#/$defs/port-base
         unevaluatedProperties: false
@@ -146,10 +142,6 @@ properties:
                 minItems: 1
                 maxItems: 4
 
-            required:
-              - clock-lanes
-              - data-lanes
-
       port@2:
         $ref: /schemas/graph.yaml#/$defs/port-base
         unevaluatedProperties: false
@@ -169,10 +161,6 @@ properties:
                 minItems: 1
                 maxItems: 4
 
-            required:
-              - clock-lanes
-              - data-lanes
-
 required:
   - compatible
   - reg
-- 
2.52.0


