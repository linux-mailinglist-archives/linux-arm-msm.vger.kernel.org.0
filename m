Return-Path: <linux-arm-msm+bounces-80756-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A931C3F99B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 07 Nov 2025 11:58:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EAA25188F8A9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Nov 2025 10:58:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C5592BDC13;
	Fri,  7 Nov 2025 10:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gtYwOPwg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21CA331B82B
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Nov 2025 10:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762513068; cv=none; b=Bs2EYaFAgVlFwWK0fB3o/6STJmCGltLQ1q0AoPJsjk9zvTngKReSA6X0sWDqaW6Sy6fexaNwGlptMLzJnGeGqAhCU1XT6VmJNPqH4Yo0EDPccBIcej8iJ2wzgzKBOWJbSVyKOP+Vine06v6hDJGDSMTk8JYhukN5SjM8rLVIGSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762513068; c=relaxed/simple;
	bh=zfksRdzqKJhRlSNkDPTjQcTPNmX+bLOPlYzuDXVDI+A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=u1V71MdcfXMZe1EbQ/CKkibe/+IvkCcOsOEOuGC2oGGL2agA8ivLdXbcWuu+uoVV0nZjvWzFtErsxapwA2B/eizb1OqJmCH57sVOvU4cR1frkM9wKH5Ek9XoiigTQK0gfQYeyKlPnjk65OEVqYZIiskysKl+o1Z5eNJRPSsjHvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gtYwOPwg; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-340e525487eso437198a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Nov 2025 02:57:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762513066; x=1763117866; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mKekkA7djcC5xOnYLDnvST4x7vzTTfMx0HGr2gLWVgw=;
        b=gtYwOPwgpcTJpXmlwgZvT59+fWqIUcGGSvCcW6p6j/QYgqeV0gzNv4JHnxmm7/qitq
         EpHd0GyC0dF+K9v+w0gqIzjAbeLN5j/kKBnWTb/F6NkVUYqvfewbG5DdefjoJtoHYg7u
         /Y4uxcJMkjsE9wXw8vdFgaFRAxehS+egjipcNExUCf0eJm9QD38bopyfNjvQ/Pl9+wpV
         fdUZdwQxmH2q8SP5aUGb2VWZcIK8x9nummbWkjfMo/6YEaAPnUNNp35d30bzOSZQgbmr
         dVdQ2rNUQ4+mI3947GyOvZ+DEfcTPfBz9tFRmn7eB2RUk9/ebtZ+my4P78Ga4ba9bt+u
         v5Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762513066; x=1763117866;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mKekkA7djcC5xOnYLDnvST4x7vzTTfMx0HGr2gLWVgw=;
        b=ROy4qEW8wmP1NVCOMjQpgHp1EooISE21tMCjUFpoOlCyEjBqiX+QtPv243x9RlIZQ4
         lJc+cYvaAPBO0WO1oT16d+NbIYsGQiDQV2etDwNhQGnb3F3HtyCCIdTsEC8fmhv3vmTp
         lYEgmV/EDr04b9AXVx2cX6ZbX6zpY7F33k525Z2NDmn3f6WoASh6Szu1Qa1tripvxlEl
         DaKYkR+nKiSMACzSjhtcAY1HJ7bMS3Ix2i/Cjst4GHlVfx/+ATJrfSr+taBw7aepG/2u
         7IBtu6qOxDB8b68BF+Zm6+6GhW78c+G5mqMefuTtk6HfHfnccpVvsJEsol7JHh+lLUPD
         LLxg==
X-Forwarded-Encrypted: i=1; AJvYcCVCPr46hWCN1puS1c0fE28CvOx4almEZwrUiejIwdcWskHe30VN5JlVpoXBo4L1sI/L2cc59og46XBrsech@vger.kernel.org
X-Gm-Message-State: AOJu0YxY1fPQk5YIiWx+3kQIKXNQN+t6ZSubKmp42x/LFWtXGGAVuMw6
	VS5xV6ngnhd8nphbf+kKfMZZoDwXwyvWI+gndapUGqGM7O/wxCfN2+0f
X-Gm-Gg: ASbGncvvERwl8dhJirz3egh6JRQ7d9KFTlIw2yMyCoB55sp/H0rmD89hAs46mnHEWZK
	hIVxncj2zYay/lDoicTwyHW4sN1LBt+OttP7y8wVEUz1c0TaMomO5zzS+bOkCCSIYqBilr8DIHs
	CDwsRoiu7ei+d/M6PXuK4cBPmMjOag/2A0yXjSzWm6UzS6O8kwvHr/gEFkgGfvtihOgLmrRdMvc
	xozaj0WfXzxdADhNWoOglRGP1vqcoq/ixmZdccQa1mfFhh627bFkrH6uRs8mnErowQ+rnwN77PA
	aRhF9dpNHLY0yaPfv119VqaHVoUsJmb4EVvDpTgUwNTh2GO758BV3iQs29geSEO2mkyS0WSq+gH
	lgvD2C9m3FPFptMbPXVUaYBaLsnl7arPD/UjWqmQChEg7XirUAZOgif26okuqMmpUO0uJbqQgKw
	wht5yRH4dYg1SMF9GRQvFSYWNptvQ102cJAqAK
X-Google-Smtp-Source: AGHT+IHOk78PY2GqDtWJJ84cSkZC37nrcnYrnsWzuRanAE5JOwBSLoL0Qc/AvnORMx4bE6VO7s7UlA==
X-Received: by 2002:a17:90b:3d91:b0:341:88ba:bdda with SMTP id 98e67ed59e1d1-3434c58521amr3275232a91.31.1762513066448;
        Fri, 07 Nov 2025 02:57:46 -0800 (PST)
Received: from test-HP-Desktop-Pro-G3.. ([103.218.174.23])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3434c30b96dsm2276332a91.5.2025.11.07.02.57.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 02:57:46 -0800 (PST)
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
Subject: [PATCH v6 1/2] dt-bindings: arm: qcom: talos-evk: Add QCS615 Talos EVK SMARC platform
Date: Fri,  7 Nov 2025 16:27:34 +0530
Message-Id: <20251107105735.1491273-2-tessolveupstream@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251107105735.1491273-1-tessolveupstream@gmail.com>
References: <20251107105735.1491273-1-tessolveupstream@gmail.com>
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


