Return-Path: <linux-arm-msm+bounces-62347-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6A4AE7C21
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 11:19:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 534DE3A8D1D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 09:19:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FBD52DA752;
	Wed, 25 Jun 2025 09:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="2f20f7lh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26FEB29B77E
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 09:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750842819; cv=none; b=hpl5lDHWHqRiBWc7UHS2pBDA81hRZIXbpWFgDSGEylWpdPwI5mdLlEMowf3nt1JZWCoccnKKjTMoJztORXvVE7eUnpR193A4NIc/VsXF1pmweyCe6b5wepcwG32dcqYDSFR+TRoV7Z39USUY2oCDLX+gXmwii1Xs3GVmOZtJOkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750842819; c=relaxed/simple;
	bh=r0M6S+8sborTozQR+msrdhkLnPY94JjF8rfiMkhWlk0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M0IW+zFwnR0jjSbLVZRU8+CNPlIlV3BKdmDiFS75wLwGKtUzS3zoP9fxYNrJsFKypWDgaR0kc2p7XBJEt48V+7gF8I5CM+rgBR9/3rbD8VBbJtchdpmpJJnoHIkkwxfIpMTwUrClrVP9POXE/mtVYqVoWJZz4KHr3iMPIbTiu1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=2f20f7lh; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ae0a420431bso350493966b.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 02:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750842814; x=1751447614; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=17G3N7jRvQMr98ZDvseO6MuQGAn4fzRuTBF5coR9VHU=;
        b=2f20f7lhssQVmnbq+2YohGa3lU5ehMPDrVI3yhArGEllQDcnhB8kV2A6Pi8GHRq+oM
         kRw5Q04Ad0Y6behcVuuzVUcIPSNH6+TaTH75vqN5a1pV7N1utuhahFCi3x6RhZRil1Et
         4cHgdIdh1XFQoXoHkD7Q9GdeqVUjhxwT4yXP0di3KdS9NnISgqjOaDWuMG5dItEeinc1
         mcW5A8w5dUn/zigC/UESt0oox1BuXJs4r+hUoQn4wQG0ukkS8AWD1UV+VFoI6cEmm0M2
         1y9pCQySVONevuEkc/X/Djs0awVrrEyZFQS/o9REFGPSY+IBSZVXTsU3iv5jhFPtNTYT
         ifrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750842814; x=1751447614;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=17G3N7jRvQMr98ZDvseO6MuQGAn4fzRuTBF5coR9VHU=;
        b=CcdDx/lCG8NruG/WmLlP66NxtOhS6STiGt23ODwK8++gq0W4o8bvgY/0r20YgCAT4t
         SJfD6lGbHMazG23Lj/jLtdRnhp5zI9SznFyIbHz6iu+VBxMqRHyFv5HdgIh/E7dWWMlc
         LfKGN03f1N3IbAjqMx8PXam/G79kuJUFdUQe+WKdpmC8zmYwz8r1gHZ8n+a6+ZNnuC+Y
         Y5JXA5YvQy89FQvR1VAjcfIzJL1lW6USVNqbel3SkkykzDCMlylentOQIk3LdDKfOCdg
         df3XTk/sljW9taivl34ixmTCgjUew/bKwhq0fngH+reCcfvgSBmHxVPXTNaDYrC4CnSi
         ZzKQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9izjrgA7VOele4jpyHm4Yc94fjV82K4F4rXURbRZymwSSwRu2bFFTeNHerrnBAOd4/1iO+hrF5p1NLAuv@vger.kernel.org
X-Gm-Message-State: AOJu0YzMgN5dMp+KED6Lb5YwGezM8DvlF1eHbNZn98kdnkQ7GW142vue
	SPLMx4xbgcwdE9+10rdsg9a+4E3JLm1MFqZjC03ztOH0Y2cuaePvT3ANdVVBOviBDwc=
X-Gm-Gg: ASbGncuEPk/mnrXEjBNWJPZV6Sh1ahdG+MiBnfk/tfSgROkX5FFD/iHvGleSPptYPoG
	N72swZtEASfYD1nMyWAPDo/MJF8YKHLNY1LDdErlodUj6UZD6CV/A7MIruQcxworKPiL9pkAJw9
	OLIJ/kslx1TUV4ThC8viTBB76kcsNpimlwFMGTkZ5+rmkS9ZZIID/yOXsD8lkbTXxDjQc9vjqcE
	45+beqpjaz3bljJBdKK02PqT3vB9siNVtRdqSqE9K7W8B0gbOiTR/KDHk06t9ZtzK+XiZgfuad1
	yOOTyg/FzHCna2ol1vhD5v31T1CaHYDpHTibTNOLAQ86bBbfSosbFaSeBZ55i1KlJDtT/5QjsHT
	G4zGG9WBHmbeKNyC1xon1I3bEcgg3gosD
X-Google-Smtp-Source: AGHT+IHtN8rF9jT36FGFeY24lEgEDKLCBuJ72j4a8PMP55mZ2eMQzN36PcTHorCZJo8JzcTmKrJ8fQ==
X-Received: by 2002:a17:906:1343:b0:ade:8720:70a0 with SMTP id a640c23a62f3a-ae0bed1b20fmr173874866b.20.1750842814425;
        Wed, 25 Jun 2025 02:13:34 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0541b719fsm1002786366b.128.2025.06.25.02.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:13:34 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 25 Jun 2025 11:13:23 +0200
Subject: [PATCH 1/2] dt-bindings: power: qcom,rpmpd: document the SM7635
 RPMh Power Domains
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-sm7635-rpmhpd-v1-1-92d3cb32dd7e@fairphone.com>
References: <20250625-sm7635-rpmhpd-v1-0-92d3cb32dd7e@fairphone.com>
In-Reply-To: <20250625-sm7635-rpmhpd-v1-0-92d3cb32dd7e@fairphone.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750842812; l=844;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=r0M6S+8sborTozQR+msrdhkLnPY94JjF8rfiMkhWlk0=;
 b=JV85IXCu5LtlvDSqrWSOtV6SHyeq8t6FfsfSBOEDVLp/36Lns7YV3pcMTaXDgEdRKDDTH/syf
 ao5dIEG2k1ODU0PvHFJhUxGtE4GJnPg8SEVxPypJ6v8SaE2FwXCYhPN
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the RPMh Power Domains on the SM7635 Platform.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/power/qcom,rpmpd.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
index 1bf65f2a583ab70ac313309f917aaabb75dc3f85..5a698392c657330d7d188c33c0bda46be5aae690 100644
--- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
+++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
@@ -56,6 +56,7 @@ properties:
           - qcom,sm6350-rpmhpd
           - qcom,sm6375-rpmpd
           - qcom,sm7150-rpmhpd
+          - qcom,sm7635-rpmhpd
           - qcom,sm8150-rpmhpd
           - qcom,sm8250-rpmhpd
           - qcom,sm8350-rpmhpd

-- 
2.50.0


