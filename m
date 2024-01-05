Return-Path: <linux-arm-msm+bounces-6532-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6CE8257D8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jan 2024 17:16:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 24909284991
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jan 2024 16:16:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C55D431759;
	Fri,  5 Jan 2024 16:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="lcavnpIs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB122E84F
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Jan 2024 16:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-40e384404e7so8847075e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Jan 2024 08:15:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1704471347; x=1705076147; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tvm4bk4zvXvYax8LPthnn9a0G5r7SnfVCgZt22fDHnM=;
        b=lcavnpIsqY8kgi4yqX1J9otwANqC9EOrDITi2LH6ULm9P0H2LGuytzeu/IlKplvwcu
         Y8+MkBnKwDgd6lLhYqWWPSTlBxOdDkgP7V4crljK8c/93EcEETqBx3pYXhTsnHXiy1EJ
         y4AOjnUQF3BhR3AfF9m4W3WJFTUbtc/gPvpxp+4rKl2hc4xNxRyq0HmUtNbIPmIIop7O
         09Lj8FSzMzvgvP9nc5VOc3DKfqKwyfk+dfN5jTp8T6JSgl/EwgP3hQfcWliHACL3ZXNA
         tXJPX1IY35KnnKzQJtmoqfCqBM9urjDu4y/ONqIKtsrh5D3+z4Czm29NQxHgO6an9aK4
         ka3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704471347; x=1705076147;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tvm4bk4zvXvYax8LPthnn9a0G5r7SnfVCgZt22fDHnM=;
        b=GEk10/mbVF94j9nhlkSpgA4s9ubLfd4JySHtZq0R6gv/5YwZxIBwkAzdmUuqDELZut
         TczOhHZIOUnHLWUbC7nvWZlGnf9uXEqJ48xQPAOUOGteph3DkRGKM0S5mQgWibmH05w4
         O39P+siY9LK1x4PASu13fJfCQvyFVQwokHwLbmLV2QT2rKoGwVH5pwpiP3V3dkGIOztn
         Ju8xxpeZJcbPeVN8FAl+EolSiS/xs/kutnx7Cx8KbwKb3uVyWKQHC0h590Pwew9IulKs
         HmEosWaYpqh8rc0vTCHQZ8Gd7RabLLipOeWjQF4cvXZo38346CKlR5bQv0R6rfYSjiQg
         6xdw==
X-Gm-Message-State: AOJu0YxH/fw66GXLLk2Jk7mmhzK/hqtsUt4aLCGF9mletmhw7KUKVZ0t
	ta1L/On1aCfnnPsvuBfiaSLTYHQuM0dt6Q==
X-Google-Smtp-Source: AGHT+IHOgeINfv1O+QR+hZzvKTZ3i98YPhATnJ6JDdEdWrWLx+pcVf9NnfkVjetwBxQY61jolWaYrQ==
X-Received: by 2002:a7b:c407:0:b0:40d:806b:1bdf with SMTP id k7-20020a7bc407000000b0040d806b1bdfmr1504405wmi.154.1704471347438;
        Fri, 05 Jan 2024 08:15:47 -0800 (PST)
Received: from otso.luca.vpn.lucaweiss.eu (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id ft33-20020a170907802100b00a26a5632d8fsm1031726ejc.13.2024.01.05.08.15.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jan 2024 08:15:46 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 05 Jan 2024 17:15:43 +0100
Subject: [PATCH 1/2] dt-bindings: qcom-qce: Add compatible for SM6350
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240105-sm6350-qce-v1-1-416e5c7319ac@fairphone.com>
References: <20240105-sm6350-qce-v1-0-416e5c7319ac@fairphone.com>
In-Reply-To: <20240105-sm6350-qce-v1-0-416e5c7319ac@fairphone.com>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12.4

Add a compatible for the crypto block found on the SM6350 SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/crypto/qcom-qce.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
index 8e665d910e6e..69d1c4929935 100644
--- a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
@@ -44,6 +44,7 @@ properties:
 
       - items:
           - enum:
+              - qcom,sm6350-qce
               - qcom,sm8250-qce
               - qcom,sm8350-qce
               - qcom,sm8450-qce

-- 
2.43.0


