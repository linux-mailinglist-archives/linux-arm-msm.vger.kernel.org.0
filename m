Return-Path: <linux-arm-msm+bounces-100369-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WMxCOa6txmmiNgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100369-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 17:17:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4793C3474FB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 17:17:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4355730A1BCC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 16:12:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3C59349AF9;
	Fri, 27 Mar 2026 16:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="NStrfgZ3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1FDD346FA7
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 16:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774627957; cv=none; b=EWm6BUamv7giuH8LObTJg/GJKFK82yvYWf3Jfn638CGtU1q9xao8fUxH09foP0t+pwzfCiEkkUf1kcaLY4gJgoKjP/w7kXtMjNstTwlZb+GfjEJGY+9xE3An4JubjqXrr01uN1IHJWcDJCxKi44nqSaOvtWpzwOpK+aYOdfVud0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774627957; c=relaxed/simple;
	bh=yE1RpxPh/DRnOKswaQ1ncodoGzX/nyTiO4Mb1VhMZX0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JsVe/xPNc0y5k+rEHcb2Mim6zjbNp4uNHyVd+BEP7WNP4xV51CHX3vR+d0F1pzZcStqjCRWBQUdQhyAflb6i6OxMl88tBZqJwOnQqQnolRXiacJYsZso34Z+1iGyPnFWtgWRp3K0VhGu9jqkHB3ryUvyxwpUgDTihKuQFycsDLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=NStrfgZ3; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b9a0762ed5fso304093066b.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 09:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1774627954; x=1775232754; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yxZRmJAlZG7wXtvJLfbzMriOZdXFHi1O+JuWwAIE8qE=;
        b=NStrfgZ3Xhd/cu108KwxzIg+BrC58+4x0JUmgnKl4tLFDPj04h64v3Hxly5kQnlPDg
         Xlm7WiliBPmInrJtbNoeMXsN9BdVzYVH/rRTlQE24I3A/uD+mRrAEDbOLViCGGN4Ijzq
         A68XtSodSWK6w+SWTej5n5yLfQka5w3hUkOFZAx0/+93yJixronGKAQb0rIIzA5a58ri
         XPrl5pFo3X6GUxVZfrbpylJSD2LSY8JnL6t2RWDa0BZXQ2is3XfOIFVUnoakPL2T0ctH
         b+HWA+IvN3eq6CXHv2ICDZbmeReXO5zAexCQmPclnwaIPRH/emxFVoTTypADw2MtPwQk
         bnpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774627954; x=1775232754;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yxZRmJAlZG7wXtvJLfbzMriOZdXFHi1O+JuWwAIE8qE=;
        b=cqiLznxGLv35HQgC8V9OLO4x9zV4gU5wRj+xlxr3DTXiBnmU4ve3Opg5bCXmkqzMCz
         qehviReNJGz/CeHW9St7ByKl6AAmicZVURBMbvwSZZFztqDtipmAHLrLB2hs11Bp38+O
         DdtrkJiaWaBB3grml5BFlfEAtQkatr4Hl0gR1sYcBI6Gpfi49fqIntbHZ213ZH/jGjSt
         dyr7cF3JyvOluoMZHnWjbwP/rbtZQWcatX7uFE2HlOzqMQNdevMdCUyLI8Emge6+kq/W
         Fgaa54upVZwLtfOPp9N84jC2oyFQUpuU3wt1ESU5UhQuqzRTgW939buRNlCClP+5f//w
         QVxg==
X-Forwarded-Encrypted: i=1; AJvYcCU9SY8C/6BjF/sXU2wprTWVW0/2475IHRC6fsFyAKNze9Bjq7H3hNc2hpATYD1+pkJbiRsreR9njgxi5sJn@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8Fsbn6THOn9uKzlGI0xZuqAYX1hctMLyZEJJKKJ7bSMENVUXr
	vpikGSg4z66+mgnXmpNUA+gdyLAADjn3gVesQCfDZVBsSJFsZkqe1sQgm81MdcSyiFM=
X-Gm-Gg: ATEYQzytoUH+BALGRg6mv40pyJAFgpbFUlJ/hQtCiztCMG4qV3OS+Lm7RmnPyCv5yuq
	6ipK5SWAQm2CipzA1gEOqJbDS6qGVrQtCjapFzC1okl2P2JoHfBO48rFG5nXy11YyBG+MZwQOJy
	yMzYXKuV2wYeZ79nwU9ojS8Cb0s/krpx47ZkMs/zmxHr0RA8Gi47BpvCag7HkKjztHuSLis1zJn
	HOULmeIPX7ui6fCEpZyg3cj7VyCUQjeuUCbum5iIdxBSBXLMsWdV6X+SdH/fNn1LdYV1iGgFio4
	9oSgKytG756WR5vHEWYk+iumnR2FrXEsciWmR+dPsec/gZ6XdbQJ3rtQnEIJWbuv5gZVPn01QrG
	bgcWaeP9nfQza9xPtAa0cJEjpxlIK3jGRl7Ju3bNGeKOof2SDQpUwgJwt/Law4/s8u+U87e66qV
	JOg38gHfIT2IuOGP5EYPplQkQBc8S/tS7XUy1lePLGGIWEKZ7AYlWFQ0sWNNek0u1GsTneg/1mK
	bmlvg==
X-Received: by 2002:a17:907:e104:b0:b9b:686e:6f93 with SMTP id a640c23a62f3a-b9b686e6fc8mr66703966b.26.1774627954248;
        Fri, 27 Mar 2026 09:12:34 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b20265cc0sm273518366b.15.2026.03.27.09.12.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 09:12:33 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 27 Mar 2026 17:12:22 +0100
Subject: [PATCH v2 3/9] dt-bindings: display: msm: document the Milos DPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-milos-mdss-v2-3-bc586683f5ca@fairphone.com>
References: <20260327-milos-mdss-v2-0-bc586683f5ca@fairphone.com>
In-Reply-To: <20260327-milos-mdss-v2-0-bc586683f5ca@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Marek <jonathan@marek.ca>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Alexander Koskovich <akoskovich@pm.me>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774627949; l=828;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=yE1RpxPh/DRnOKswaQ1ncodoGzX/nyTiO4Mb1VhMZX0=;
 b=EYH8l9XFu+gIk60JnlaqajCRZQpuvOuOmZnYT8nK9pzda5muZaL+zADWmYOwKH0sUZP4AMJMP
 Tac1oRxXtEcDOTjLOraL5q/iEyjayk4BVM175OuZ0oHeWn2DBaq6/GG
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,marek.ca,quicinc.com,linaro.org,pm.me];
	TAGGED_FROM(0.00)[bounces-100369-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[fairphone.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 4793C3474FB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document the DPU Display Controller on the Milos Platform.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
index dccac525d202..9da981639ddb 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
@@ -18,6 +18,7 @@ properties:
           - qcom,eliza-dpu
           - qcom,glymur-dpu
           - qcom,kaanapali-dpu
+          - qcom,milos-dpu
           - qcom,sa8775p-dpu
           - qcom,sm8650-dpu
           - qcom,sm8750-dpu

-- 
2.53.0


