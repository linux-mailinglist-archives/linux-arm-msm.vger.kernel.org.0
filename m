Return-Path: <linux-arm-msm+bounces-80297-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D33C3113A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 04 Nov 2025 13:53:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 13F034F7518
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Nov 2025 12:51:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D00262EC576;
	Tue,  4 Nov 2025 12:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AOJhdfqT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F352EC0A2
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Nov 2025 12:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762260701; cv=none; b=NFoCPPiziLjo2QOBIK0huoLYk4GemPoAkKcM8Dao+fbHxvvZTjEXt2UUR8aUAnNEfSnXsTZIqTTT9wUOyryvD1XTYZgMcP+aWJtVFvLUwn5JSpfNtVj3NoeL0JyGiLlWTvRFZgWoW2FhzWiQYKeejtpU+cJMK6dezK11XoKxjOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762260701; c=relaxed/simple;
	bh=zfksRdzqKJhRlSNkDPTjQcTPNmX+bLOPlYzuDXVDI+A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BSIRTkrgk9orZXGvnXEnAKBOsQlMfijDny5upEcj4wY4ElufupXOfL9sbh+j4uTlf5NjjeNIoQtMU6hl1ls3u0z8rc8fyrfqQqh2fhc00NvWLFGuz30ciTHzKsjxXJ5fJ6qk8L2lPBCnY2JdeaKfEPjWuKBspb1crkfCbegjeTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AOJhdfqT; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-33ff5149ae8so4137847a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Nov 2025 04:51:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762260699; x=1762865499; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mKekkA7djcC5xOnYLDnvST4x7vzTTfMx0HGr2gLWVgw=;
        b=AOJhdfqTf/r2no9t8xvJLevf3iiegfOwkmabKTHps1uMLB7sYgz0JnSC1mOAYmsP1U
         X1dZvPBWvRzdVa5B/IG/EsSh4VjKMEo84youijokCoqsv9b0meaZF6fgaXugUY4uJ+Oh
         BK49anjqu6d60zV7mFV0J1FPxTd9b/ZV5mh/qPHfBj0VIY7dxRJQh4y2LEgjlrSsYFGb
         ZTd8H5ZspHz6zJu5eZalTSzrf0JR779OY6nr3m02HgrPm1MIu/BsT4h0qVbLcTbIkh+3
         C16JmeR/XNDw2dvISkGU9K+YZGUSmyPg8VvxrC+BxpYkZTB2XSySMnhyRU6XutPCVHbG
         C5eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762260699; x=1762865499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mKekkA7djcC5xOnYLDnvST4x7vzTTfMx0HGr2gLWVgw=;
        b=Yi/1AgOS8m6QHKaY+0G3I59d60mA/c0DWUPrGfoiR49fOmUu4R1XcZi+C4lnBuTxF3
         Em9KTl/QOVbh06WUgLo0jc/VY9pAuTgYTx139yfpi9UI8csWKbmlV0t32ovg7m9tbv7Y
         +TCLtQ2l38MmIIHHSV4k1ZLLkY6AtTLp7CeVxLzxlj8d3Llnex4TS77qbGgg5bxxmJYy
         gkqV/AJguZOIKSC1iicMFT+1jONbWupEUJazWlk2kJOjAuBA0nBtmGj94VUon3DPXDlP
         hGCuHQPwBFHx2EXyyFJUM3HomCWrPzlK6vfpIDwKqJf908hv02wLaeZsaf32MFk2KzEw
         OgcA==
X-Forwarded-Encrypted: i=1; AJvYcCVdwX6YlNiZvlYkkuTZ/pY+njUihVO9phrGgNPytLpCHcyHpZNHcHEyKpDV16F+O63ygjO16mqGr04Kh0Sm@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg1A44mqxphUGSeCr483bnK2w37DUdGJZIIbrQZM3H1ySjX7QL
	e2BPy1j39AibckRNp53qb/+t858nbca3b1E6Tm7vmC8T/dJxiZX4JIWjp6lZ3g==
X-Gm-Gg: ASbGncsM1uuChgBC/8A8+eNjiV8PMuLj9lHD+f0FcTUDyClowIRFX7er+e1JSEc4ehD
	IUm3bakq456QvKC3uAaxcz3cdXEBslTxQaPQkYN1FXWWia9zqnHno/wgyAga4Q043ZfFbYlOYgI
	J/k/UTI7/+V5Jyiq/BjimBk6r8E39InTGOrGVPRYtD8Dbl1zDonMce5AckoZej14OgF8UOizPox
	OxDYIU/fts4HBYcJSS1W15B3jhtk4pkXg5uHY1KTrl6VDuC1VB45V8byfexY/N3LLFvgEDQhRUn
	/BvnMfYI7ZgYKgqwpuZ9Er2sDfN0rhMZjpxsoB8wwqcbANRni5jE2lsbrG1zaezNtqfNntAY9zu
	ZPVzvL/wiM/1B3ZxZMMwUKvVB8L5HHod4jbVXflwZuuTghEJXkiqUUJAe5emkeoXLYvlc5eBQiG
	Hqi170hMnb3AIFUlw6Rs/N1PlzlQ==
X-Google-Smtp-Source: AGHT+IFNwdc3QqQkD7kIQmQums3onTSmVj2aZGeMwoERyucyIypuw1/hEudYSpSv0RCXqWPgNdn//g==
X-Received: by 2002:a17:90b:1c06:b0:341:2150:4856 with SMTP id 98e67ed59e1d1-341215049b9mr10274099a91.17.1762260699090;
        Tue, 04 Nov 2025 04:51:39 -0800 (PST)
Received: from test-HP-Desktop-Pro-G3.. ([103.218.174.23])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ba1f2a80459sm2338616a12.15.2025.11.04.04.51.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 04:51:38 -0800 (PST)
From: Sudarshan Shetty <tessolveupstream@gmail.com>
To: andersson@kernel.org,
	konradybcio@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sudarshan Shetty <tessolveupstream@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 1/2] dt-bindings: arm: qcom: talos-evk: Add QCS615 Talos EVK SMARC platform
Date: Tue,  4 Nov 2025 18:21:25 +0530
Message-Id: <20251104125126.1006400-2-tessolveupstream@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251104125126.1006400-1-tessolveupstream@gmail.com>
References: <20251104125126.1006400-1-tessolveupstream@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add binding support for the Qualcomm Technologies, Inc. Talos EVK
SMARC platform based on the QCS615 SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 0a3222d6f368..a323be3d2ba2 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -862,6 +862,7 @@ properties:
       - items:
           - enum:
               - qcom,qcs615-ride
+              - qcom,talos-evk
           - const: qcom,qcs615
           - const: qcom,sm6150
 
-- 
2.34.1


