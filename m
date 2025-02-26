Return-Path: <linux-arm-msm+bounces-49487-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B3FA45D0B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 12:29:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 38FEC16EA46
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 11:29:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2867215179;
	Wed, 26 Feb 2025 11:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EyQxRAVp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA9E821504E
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Feb 2025 11:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740569361; cv=none; b=s8V9C0HWFfCoceOcMDTq6uuJQXFzvaVbc9eTXmkOPSWJPOxtuL09kCxDo+H96z624T+d7MMUECM737qq0a4iNKfL0Ne5jJcKS71kAtSygWhV3fDYVdSc17rtrQotvCkcnTlnVv6QMXbhUznQXeNz2X3IY3Z4ifrmpAVKKA/Cq9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740569361; c=relaxed/simple;
	bh=LA0Cvsrq+8BiKo6ol0t+mnrkriJeADHplK/m/Yv3P2c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ka+C/cAsOMsyd1thb55hwK2QRrw5JoqZies/8CWcV6TQB2UCR5SvlTWa/dMXtaOkW4yEqj4SUgo636EPH9T0R8t9F0ecJapIsJVDdDJIP8G5ShcCBafJglaGEOaqK6yBcPmtkkJruOSjOKLxM+0+F0r/BrBZwr1orFksX2EO5Tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EyQxRAVp; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5dc5a32c313so1338333a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Feb 2025 03:29:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740569358; x=1741174158; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s/LD16G1ckmo606r8mTAAXLS++qBREtl47/upA6EvrE=;
        b=EyQxRAVpiJvtjEplkmTMnyNi0OwYgp9+GtZo975owiswoF0HcyZnvRlLp+F7riwg6n
         1CiyKJvlIFJomsTktLtqI2sri0+GNrOGbzsf0aYMPKVvo5AtWpazYAIOBOEpAsYCFg9n
         k4kMgDZQqm5GH1CSJ7TXfolA24HgnYvspPm9fj9Jod+nNb21vDjSHXWF3rc/2OCgYIT/
         updspicA2sGDmadm+Ls0Jv7AQBUOR1mitV84/zPBDICn1Q/4S6CYBvtRn+XytM4eJwnX
         POdTCae5J3WqYbiK9rAbfJANUv0jJvMQImg2re299GyQ0TnMCUKR/tp6JWSmdqdxgafa
         1N3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740569358; x=1741174158;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s/LD16G1ckmo606r8mTAAXLS++qBREtl47/upA6EvrE=;
        b=SiYeh8BoyfxVjXgRwPrU7NlIEkqcFL656NQp3zbYIXM7tgWr+PojkTwOjJSodt5Z0P
         GiZsPA/u3ZaxedK54wU8MVW68A97s6O14CiXxIzFtHojst33yBOqRAt36gYtR4kdXLgq
         b1l/kSgQPHSZ+5y5iucV7LopIbiIK3nZf6obEhZPUhpYo2fm/du6n1pw4oV35ObTjP4N
         fi4SA9GKiA7Hy5m4WfKwFLE6wM6p7zrTUN7xmWkiFy0F1ygQm+WRbf6NwZMUblUOFitf
         ffNYuuzH5cX+xflcXqPdSpEgqcWF1CjAhsd+Uyit8s8vcQ9dM3dAiyvZYWVBTfFTQMHo
         7DFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUoi3M1BP+B7Cuh/i+CcZwqyh9tXpCjkBMkRmkyraRx+VCG1Lb06cUubl/ZS9RgClZwcLRgfRZO54Uw8jZD@vger.kernel.org
X-Gm-Message-State: AOJu0YzWslOpYAcVJqORNNlv5YgX91fAYQymIq0kqXCa+aEQXSfZX/fJ
	d2B6ACQHF838/tI5aF5NkrO9wf2TaqwesHVJ2qDvBf6rxrqbJ49CipT/A40Qup0=
X-Gm-Gg: ASbGncufz4Y3OoqEQtQ0EjwtHEjCyJpOEVD3p1b/oFHlDt0Jhww9Fy8Xa5J+cb/S6hL
	EzdTDQ8j4ZN4ZGeJYaQmJcnhKDR2LENmvtiyigB4vQ9sDOu4YFqC/YVR30vsVourDqZg4nPHYbE
	mait2n4WHUduZTmNxnPu4rLw8vz8xJgL08WilkwWdP3kIYuTSDrfAHJzqaaXcmv8/nclqhmp+W4
	vP5pl8K91HW/fbl+JTWCD0NUZRWD6gwYtnpEnS96w7R5+uZcGui3LSo5GPIbUK7GmhDGt2hg2uZ
	90pQoojBgm7avvAELd6XCTt/atiGWrosj4Ma0Mxs662q1WHpE9P/BIapM9nx0cMYe6ZLNG9Q2QA
	=
X-Google-Smtp-Source: AGHT+IEfpVAmUdzqLH8Eb8qd4lEgmjl7ga6R1U3aAJPOZ5WOBG4ayDyk9a/gfYM6yY4U7qdRUnbeng==
X-Received: by 2002:a50:ee19:0:b0:5e4:afaa:8d6a with SMTP id 4fb4d7f45d1cf-5e4afaa8f65mr292393a12.0.1740569358168;
        Wed, 26 Feb 2025 03:29:18 -0800 (PST)
Received: from krzk-bin.. (78-11-220-99.static.ip.netia.com.pl. [78.11.220.99])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e45b7174cesm2610049a12.34.2025.02.26.03.29.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 03:29:17 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mao Jinlong <quic_jinlmao@quicinc.com>,
	Tao Zhang <quic_taozha@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	stable@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: coresight: qcom,coresight-tpda: Fix too many 'reg'
Date: Wed, 26 Feb 2025 12:29:13 +0100
Message-ID: <20250226112914.94361-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Binding listed variable number of IO addresses without defining them,
however example DTS code, all in-tree DTS and Linux kernel driver
mention only one address space, so drop the second to make binding
precise and correctly describe the hardware.

Fixes: a8fbe1442c2b ("dt-bindings: arm: Adds CoreSight TPDA hardware definitions")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/arm/qcom,coresight-tpda.yaml | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-tpda.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-tpda.yaml
index b748cf21a4d7..4539a67d8bf8 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-tpda.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-tpda.yaml
@@ -55,8 +55,7 @@ properties:
       - const: arm,primecell
 
   reg:
-    minItems: 1
-    maxItems: 2
+    maxItems: 1
 
   clocks:
     maxItems: 1
-- 
2.43.0


