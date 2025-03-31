Return-Path: <linux-arm-msm+bounces-52901-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 253CDA7707C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Mar 2025 23:58:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C769E7A553F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Mar 2025 21:57:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BB8D21E091;
	Mon, 31 Mar 2025 21:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bCH7LwXE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D673921CFEF;
	Mon, 31 Mar 2025 21:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743458252; cv=none; b=qRsfThtgFQU4Y4d6BjET5acrnX2dkuyGVGYOfkxJZIVGCyYWLRF7y4EvxHxbzYFv8yDLaUFlwKwImms4JM/n+ZRDCIRULrCdSBSk9MErDOUK675j7VlU2UQ67aofL7ofQjMOe55/VVlW7N3l8U6+2mG+wL/YdGzyYpkfCvvdTO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743458252; c=relaxed/simple;
	bh=5SCeLymFY7l/5nYeYz0B81hNsW4Grisbdmm4+QFDZpU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JviJWN1YV/wlY4DuEvzXsJY51G5SIVrHmjs1mBRce7ktc/4/iMg6kmHQyBHEJzkySdyHoewJ4KPovBEOxkp/mOi18oVgajZCqrvl24y7BTzBntEVZWvdp51ZfPA5msmsc4d4jaDoBwv3ivUt4vZIcJ/jeBhdX44HHqZlOWcQ0io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bCH7LwXE; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so49876565e9.2;
        Mon, 31 Mar 2025 14:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743458249; x=1744063049; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dr5uDUT6QjLnvPsKUK0DkmJH7SNNjpwTv+79LwUiSqw=;
        b=bCH7LwXEUcOqOkzCJk0UjjXPz7sx2uVYJhOpvAxzP3YY6Uu0+dH1+hdwc90y6k3xS6
         hft4AKYezH0CMNlxjk70tVSxJZmfwE9qew1K0x5tnaSszIuVqamCh8U47GW+Pw4BnXyo
         BxsJcjztWb+EUxHM1PqQS/rQbd4uW3x/qCJBzBRs1QKhPMgXho2zGxGfTePUKYT4nZwI
         P400/LyFwaUFw/dEOlEBor4fplR/QdbRXvtmIzhrAtMQhAEZd4sUxkfEGlVOO50xt6m1
         KssD41gOnmqBSZM6ftskxH1g2wto8B3K6kM5SUQEA+3eaAQP1QPdLZUObLG+1C28LBbq
         fqdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743458249; x=1744063049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dr5uDUT6QjLnvPsKUK0DkmJH7SNNjpwTv+79LwUiSqw=;
        b=KNOsVRWZ9qHYvXNYwaq/enPHBZf2+2DRvbCFZ3wekOo1IEDaIXdgTgvIbhuupe9uTG
         kNbIaDZ8VnW/Di5CaTDTvKedcBXO17314d+veOYlq2743xbx2r51DuoB0+LSw2c4uSFB
         sutMdWS4cXjT10vr2BYhAIakIb9tpJUn24+Yigt5kiXQyZNtYY0fHGaMAh9qQ1I5FuE1
         PtkLEpWyhsXY5UoUlIxHQyt8Qlw31g/Uw4j1njm6swQ2pxI5yVL6WI4OMpsnwYr6DD0f
         RydSsRNbOCMUy351F1Qu7ZKs7SYOKINf1sRe1nshMJfKzsXgjEqRB/huTtjLmdigZ+6I
         jo+A==
X-Forwarded-Encrypted: i=1; AJvYcCUUdPtVw7FEaZagBv3YJIXOyQLLthHyRe7E6GOq/rhk/2p/fvfPyI9hy8+5wxE+uy5ZrkvaJ7bgz4Wx@vger.kernel.org, AJvYcCUcxCKakLjHlb6jsK7+XCkqgvqKhoNNfcJGbrn07xLrbRLWBXYtbYX3iWKMBUS0ijWavziP6ovE3ShSZC7w9g==@vger.kernel.org, AJvYcCVwKaEKli5WFm07HjQimo7zJL9F5Wrj8oPzxG8pUJGHDuYIhqgERsnkOVjh4OVDPmzy4RvixS0acffT@vger.kernel.org, AJvYcCX7O3AnXMPT5AD1idC/KzdqyaoWGp0S8C02dvae7Z4aSGZnLpYPi06OwJQDfyty3a3SA/nMb1+ZbQC9uA0X@vger.kernel.org
X-Gm-Message-State: AOJu0Ywmbz92MtWz7fcxGcW3mkqplIYrwybZpdKP8KCVJkwuvyZbWXYz
	RKj/OJY9K/w2Q+FZaQXcxEdfPONNZ4rgJ6Hq9/232qVqQn9pPD4=
X-Gm-Gg: ASbGnctTPQXB9nnRksLDDohN7JOdKJ74A5oEF3B+hzWqKPjMrrTy5KkHnAGInqWb1Zg
	vJqAAtlJE+fIC8CW3afQN18aKqPlW1fRkdK1pOYRucHKwSnfM5qYFvsrTocxLG/5K0Zr/l9DSto
	Vfm4SrPfIHnrvycnCvAhu/SOIkLZeNy/QHIDBjkkmjy5rMcpJ9Qo0JeGgLfvj/ZmIPdWk0ovMfe
	WcJxhpjvJrTqab+yO3TW8DKxNWGHmw6v+bIjbuHa07n5qjMKHF4wQtP85igeHY/0wVoJCVJyFzC
	GhXHl15GfFNZdV9J/qQCF3HmvgQL5PNQ7EgLrnWJipDRJWf3baRVIxrXwQ==
X-Google-Smtp-Source: AGHT+IHUUeco6B9IUKsVa5lv6z8fw9Vw/2bUhLkYpp9usIXh9/z+D9h4O/43wqE/vRFhtnckonN14w==
X-Received: by 2002:a05:600c:198f:b0:43c:fdbe:4398 with SMTP id 5b1f17b1804b1-43db61dc6f4mr81339985e9.6.1743458248829;
        Mon, 31 Mar 2025 14:57:28 -0700 (PDT)
Received: from alex-x1.. ([84.226.118.249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d82a041d4sm182244665e9.0.2025.03.31.14.57.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 14:57:28 -0700 (PDT)
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: [PATCH v1 4/6] dt-bindings: arm: qcom: Add Asus Zenbook A14
Date: Mon, 31 Mar 2025 23:53:38 +0200
Message-ID: <20250331215720.19692-5-alex.vinarskis@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250331215720.19692-1-alex.vinarskis@gmail.com>
References: <20250331215720.19692-1-alex.vinarskis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the X1E-78-100 and X1P-42-100/X1-26-100 variants.

Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 08c329b1e919..1b7e2ed56baa 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1133,6 +1133,7 @@ properties:
       - items:
           - enum:
               - asus,vivobook-s15
+              - asus,x1e80100-zenbook-a14
               - dell,xps13-9345
               - hp,omnibook-x14
               - lenovo,yoga-slim7x
@@ -1144,6 +1145,7 @@ properties:
 
       - items:
           - enum:
+              - asus,x1p42100-zenbook-a14
               - qcom,x1p42100-crd
           - const: qcom,x1p42100
 
-- 
2.45.2


