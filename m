Return-Path: <linux-arm-msm+bounces-112331-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UwI5M44VKWqrQAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112331-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 09:43:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B10C666B5F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 09:43:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=V7omvVh6;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112331-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112331-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id F0EA330208E3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 07:42:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE611397E81;
	Wed, 10 Jun 2026 07:41:58 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E860B3911CD
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 07:41:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781077318; cv=none; b=c2FOX+VGr9DNcfybANhpN5/wzulYQjqRR2386ZCsLQkbGOob2DtJQgCbwDBBMbepEERsFTSaU38D87Z0b3qDoJo3zjBcZPrA2OqNg2n7/1GSsY7Kej5+RB/NgkStDfIIsrx3/FUvW1EVUeTGsliDvMHa2lb78trK5Ig+18yFZ3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781077318; c=relaxed/simple;
	bh=Qn4TFtKF0zH/YtALFUlzzIs3K59F5uQTYpF2B2pucII=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bB3CR6jUPI70tf8yaWc8QlQ950+EjFYhL7r5iIHlrYcWSywHiZ+XltB5NSjjC8yVEtdr9O+q/vvyKtDXRSsYtId06IY5fvPuOHAEqh/Nm3smANlKmosCj5njfI92y2PeUyAphYFI6s7LBydrao5k0C7kQLz6gmC8I4HAwOj4azY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V7omvVh6; arc=none smtp.client-ip=209.85.128.51
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-490b613a17bso62807495e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 00:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781077313; x=1781682113; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b7eBobhuN0t2F3bxCh2U0niPdbCcCjlL+1oHTHNqL/8=;
        b=V7omvVh6reHfyCPv52PmKWmWzJgpg7npl6GucoBJer8+togLlE2ihtucY1qpGw5l5V
         1t3tXLfNloq52ZMavk0LGg4ywSvkM2043VDy0L5FHWwqBqkevC7ZY48w3Od3XY/towAy
         WVMAISi4iLUMjD+kvJlnna1WdWV7+m7iaCKDjW/sm1nvJOvDWsa2JATADSKqLMew7KKg
         aUTjfykV7qwo8bsnoh6oCifdPDrI+l1QH35epA4ttRiNcqXg5bAPB803svksip22wRbG
         Fw1bv/NbzvCQykPPEaQf5eqkm42m966ccRLujisWHAO0aiyrod2GOxTz7r+rIvHBZNrf
         0Xvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781077313; x=1781682113;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b7eBobhuN0t2F3bxCh2U0niPdbCcCjlL+1oHTHNqL/8=;
        b=fEkqRI9+VvZdx0v4qfQgVXFUl/t7wMvrXMQNLCYW7Q3jOau5sXVxQdEVfbFPxzNNxo
         FChupX8SCxJZqrZfYFc9GNKpRagG4uG0eVEbKCFhfebkHAL7DJ9mNempaQrK8Fy2BOHA
         mY8jZYB3EnMX6SX775JF2+oUh2XUNNMVYl8wFmDE5Tt3N+ILUDU94D5/mJczUgqfmpK5
         PA5gOa22V3Z2tpoVNa08TplU3AS7380EYMjtQ2JCe3wrUelXtqxV9xQM31LOVeyQkzyr
         AkTHpEOtSxJpvmkfUbWMeNDpd8xdiMjdCc/O7wlac6YSF3GAyr0lHRz+6N4UBGoOx6Aw
         qevA==
X-Forwarded-Encrypted: i=1; AFNElJ/bqMrHU7lqCM0V37fEWnzFWTILt7V4oF6Rp6CVKHdiUtORCWuLgoalesNMGfPRoMunbMUdTSakr+8/bhsL@vger.kernel.org
X-Gm-Message-State: AOJu0Yxn0Zu9T1GcPlBJyltmWRlxbN9EkpdmMTQ/OAz3fyVyrOS63Dm9
	0PBiIAsaqTh26PtBttrvDrjOKZIwtbmRB9jLWA4/OdMd8Qd1ZmpafuhhiGDLfXg+y6g=
X-Gm-Gg: Acq92OHUiu86jvvouLA94nNs9o7LZbjQTJPpe/4bZJoilLbYlPOVxeZ4LuAY1WdnMNO
	PFmu2Df2fPttSnoXuquvArM7uSb81++rtXVjVKnlYId8IsbqD8SBHbeqN8xyNwwWUDjVuri0tUx
	gWFoOm5HBTbshEvIhargS74DBPJgupogurO1gbvhE3Qy42fxuXuhwf3T7F/05M7awcONqWFVFYc
	rk97H5ashIauYwbudlde0Clhnt4m8vgpX1Jo+c7FbCR1fm0lPGVJGGFVpPx7o7pMQDaPu9SxbWh
	w7UngoThJIplwPCGvTnheH87hJLXv7LUEEDm63sFUxgQSRn5MhGo249ly9tVwsClKJDsd1LCCJb
	oLdqgOUUyMioLwNFQTEyIxuIZ1oKL1PmaD04nTNXb+hwZ1xZPOUTg7LkMuOcCZcsIly+qp5tQn6
	2hcnENTPD6M+2IFyF+6VhFk3R2KsjtkJqtFv5jSEJBBRFE06dDRfMW/FvV5xyWMNWo2Q==
X-Received: by 2002:a05:600c:1552:b0:490:b115:e03f with SMTP id 5b1f17b1804b1-490d71fa5a1mr78852405e9.8.1781077312982;
        Wed, 10 Jun 2026 00:41:52 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f3444fesm69161344f8f.20.2026.06.10.00.41.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 00:41:52 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 10 Jun 2026 09:41:47 +0200
Subject: [PATCH 3/4] arm64: dts: qcom: sm8650-ayaneo-pocket-s2: switch
 sound card to ayaneo,pocket-s2-sndcard
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v1-3-18bb19c5ca22@linaro.org>
References: <20260610-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v1-0-18bb19c5ca22@linaro.org>
In-Reply-To: <20260610-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v1-0-18bb19c5ca22@linaro.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: kancy2333@outlook.com, linux-sound@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=917;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=Qn4TFtKF0zH/YtALFUlzzIs3K59F5uQTYpF2B2pucII=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqKRU8AV9+r1C54zy/T9xZXXpG3cmS3d8cGw0RxpKx
 G06MVSyJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaikVPAAKCRB33NvayMhJ0Xp9D/
 4tXneInCiTYra0b4m2ya7YSBNpbBZDJS7u3Ypi6GWwYsTwBI6Dq99j+omnkbT6c03A0gtj1+7V8yrA
 2NjCZFrXZPk1kMFEmIDYb8vRBJnykRw3MwA6NptmsKjxjeexxECgvzCrkmt9Hd479xgLrbcqTGxbfN
 ygPz/7qGkVmzgYHUZ1p9OB4WheLQhdC3I7NhjLPnoU3ohuyrZ5JctUKXq8TCZguajceMqBsJK3z1B3
 fC/QPgU8cFO+Icct7HdclzZ4LIMh9m04yXkmgipOdhIdBIFlTF2rpl1t9DQj93dtLwUIMxDgYkE+rY
 qtnBvp4ly0T+J2OdZ72tk6LTHjuuA09wUSZNX9xpkP+pb7OUNwiCUposU7WvjXStgGCAgVBmY9iXRz
 c4RNTF8sboANex45CQLu7YIbQGK/Gf1giN6tLOhECH6SDJX0/srdV5LloJDna7SIrh5IFIZHocWgOi
 BtxEZobvtJDxGmqNw1y8zKuBxrFGst5nKnTDHM1/DWVfgWp1cCVsB8lUdswhCXHUhtLMOY3RppD7h+
 ssmDn4SAtC3qURx6lDaQ4Ux54qOAy0I5yZMpZuYqZmRao7WMcP7zEA8FB8euJvj+oepPl7G3Pf398X
 qiWMvxMwyuJBT97fC9erY9f84w96nBQ58sRMTYH3hcokdcDGCXv7qHb06nwQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112331-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:kancy2333@outlook.com,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:neil.armstrong@linaro.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com];
	FORGED_SENDER(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[outlook.com,vger.kernel.org,linaro.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:email,linaro.org:mid,linaro.org:from_mime,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1B10C666B5F

Switch to the ayaneo,pocket-s2-sndcard since the hardware layout
is incompatible with the default SM8650 generic sound card.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts b/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
index 0dc994f4e48d..508d1445bf21 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
@@ -221,7 +221,7 @@ upd720201_vdd33_reg: upd720201-vdd33-regulator {
 	};
 
 	sound {
-		compatible = "qcom,sm8650-sndcard", "qcom,sm8450-sndcard";
+		compatible = "ayaneo,pocket-s2-sndcard";
 		model = "SM8650-APS2";
 		audio-routing = "SpkrLeft IN", "WSA_SPK1 OUT",
 				"SpkrRight IN", "WSA_SPK2 OUT",

-- 
2.34.1


