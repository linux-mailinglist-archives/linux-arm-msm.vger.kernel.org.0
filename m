Return-Path: <linux-arm-msm+bounces-104403-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8DVpINAz62lfJwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104403-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 11:11:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 506C145BF20
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 11:11:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B09413054F3C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 09:08:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81390387569;
	Fri, 24 Apr 2026 09:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qBJ1tjTA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D43E38655C
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 09:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777021688; cv=none; b=FJz8+yybgYzsPrQNooCtE8wtcGKxOcK0CUYCrJ9U081fwA1y4FNB5sMzwPJSq5K0o5SD9OyDsRxBRyklbI1VrRlIAdBaDUr5fu6HKUJcI4LPmCUnN80cNV3y0AFdSlJmz+1iE8R+6jyt3fx3fefCO7D21etOHF9vybWzf9QCIfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777021688; c=relaxed/simple;
	bh=+12tfzqfW/Tk83MgWfc0iGAjrf/JciQj1xvyj8kbjjk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Odu6NUPaa19iden7fHGFwuwwuo6ui+gHEkgEeRXvO4IwwHuJldcGQd41ye9bBAapJUKo3kBCtSv2Fj6VHQ63lXJFKRG7HtZK/hwF90Aq1+7CRWYsEKh30auRrtpGUp4z2trqXIIDf3hwBtf1OafX82KzJqK9qEZSjvG8zJGtT5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qBJ1tjTA; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48a3e9862f0so37743155e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 02:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777021685; x=1777626485; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gnpe7VWv66BG7EMfRroY3FJSHMxHpQ7t0W9fMqyK3xI=;
        b=qBJ1tjTAG9rwsyYrYPFV8+537HMSAI7g2G81cNXlFPS0QpBFciZ53yIpkwMjbC+XOY
         G3SkqYQ4hYpfrgZmqf5B/KGaViZE+Tlo5++0kJP1yk2tjt0v3kKctqDCJYOF3KA8UEgW
         qqjoGd9E6aaH+2WcGt+k+BsY1mVhEQ9JBZZWJx6vP6XOIxBl/8ZqvOfpTiWIhfHapl+h
         z/I6rPV85yEWjuwpCiM/4Peu4L1aqucH2vZuwDAjiRxMCmmx3XFxaAK3GiAvVlk8Zacj
         X0K9w2I5XSuBj7+BKoeuVgH3qqemtEO/BT5nbQh/vomwvYR85F6+OouqSTDLZUJA0kMA
         Mf1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777021685; x=1777626485;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Gnpe7VWv66BG7EMfRroY3FJSHMxHpQ7t0W9fMqyK3xI=;
        b=OtOgoX8PlCVYsQ7CnvMN/K5JhKk+TPmot7BZYMh7zDGAy33aRm+c7LqePwJpUSpecp
         eGvO/HFiUbUbNx+jIMRVuVu0HPwqg9vpy8OXg1XMwcv0T43v6TrlrtpC5f/Gbsyt/zgi
         402s5FDCA/+Jn05lP4H9bVcvLCo8aNP/G5SOBeC38sWJkZklDF0BzZn5ePiXCdY5a+0c
         Fms2TwohWNXvoh+QtZiSr2+GQXnjHCo1e/hZ7utO4ZselaZlqhvMnV2TRizaljbWThHF
         Q6clhXWobDi7XuQzdXMppIyM4JiU9cnpdWI7XLAO/jbBQjuWLtHytQv7Ro6nlESG7P2A
         APJA==
X-Gm-Message-State: AOJu0YweT3HS5+OAwojcWohYLl4B6i3DsLlYnn0u/MP1BOZGf2ivLpJZ
	+drowaGYVExGCYjGiXiQuDS71Aq0wT+jPx2JxHLg/cCm+csUWNeXMgLUIhK9ZPJsl/I=
X-Gm-Gg: AeBDietlZyeXjAWoT3HXMCvk57rTCI8GaK9ot40JygA8i2oqp2ij209T9KzWvtyUFr9
	saA19DvbmM2RdcfWbnosiUiVOuNWYgPzpEWaWhbQPehoAQ9NUUwcPhrjhUOXR4GPADCtsplkssA
	yQo670TiMaxNxgY5NcV3wQAGXHMx8xfALjMK6B/VQgw5F0DKy7SoWffdi4tBOkext9fGpCMCkyc
	VheDkqU7l5zc+cUuzXuPyqKz9xdb4VkGqOqN22uSiWIeDwfHsvU8KHSONDxA9blK2Ed5UoVNplq
	i8c86WuPjhisd4LjLv+77D2FhLXNf0GM0HzbvCKOCOwSKarACl5NjDxHi1/lZvHFMLn1NpXUFkj
	ZTqVu+r0i07JIu5M7K2yu4pUhyGXIBLQT5kE248ZYZefDV0c6sTjG1YzqeSRqvkG3+JVwZohy6l
	xhnXLT6etddZlxWX/Sq0eUU+jVWf6RFD8vnOuyy/wUo7RNDm6Swerg9Ao=
X-Received: by 2002:a05:600c:c112:b0:486:fe83:861c with SMTP id 5b1f17b1804b1-488fb896910mr353911685e9.7.1777021684083;
        Fri, 24 Apr 2026 02:08:04 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc1c0354sm537222545e9.11.2026.04.24.02.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 02:08:03 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 24 Apr 2026 11:07:57 +0200
Subject: [PATCH 3/6] dt-bindings: clock: qcom: sm8650-gcc: Add missing
 power-domains property
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-topic-sm8x50-tie-gcc-to-cx-v1-3-4b6e09d532ce@linaro.org>
References: <20260424-topic-sm8x50-tie-gcc-to-cx-v1-0-4b6e09d532ce@linaro.org>
In-Reply-To: <20260424-topic-sm8x50-tie-gcc-to-cx-v1-0-4b6e09d532ce@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Abel Vesa <abelvesa@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Sai Prakash Ranjan <quic_saipraka@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1114;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=+12tfzqfW/Tk83MgWfc0iGAjrf/JciQj1xvyj8kbjjk=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBp6zLuLZkMPJDr268l+m921m3jF91DlclPnR+Of8tZ
 4B0me9yJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaesy7gAKCRB33NvayMhJ0W1gEA
 CKwLPQQou8T+FSdimuDZHKVX8qOjgIgOFrWhQ1uuRhlAQMe0DVhTTKHMKJI4WV4b27Vv4a8XhYyopa
 djFOIUSDd79QCEhddBghp3kvWTNNAAv+aflwRWPx1sPpzmkDAcrU0n2t6f57GnJqq00Ytf14FLTDJw
 Tyg/6cX7qTbjVE6f2tV6+8HDhwDjicgwxOhTYfCFUvTM3dLDVeYTWW6qSHeDeweg3UPp/9luIjozd9
 mjJXT6uF1etp2ZBcu8L+eYOwFz5Ux6stvm65Thr4nFjAtwB5MitkH6uKBkLbngvJJ1F8ZvaoiETjOe
 DB0JsFN9+5XqKeacUVSl38Ajh7yiES2IPEeEC6u6gNG9wCNC+jrU7oUPx/jUwzI5uRNyLAuAJcQgm+
 sRpYsQd6lXWSxIFUGxcW+tECxDqhnEAScpRtky2GVB02pcdiOp/c3yBiA9aitBJHOphDTNuB2Lt+Gb
 fEq8kjBOBavIhkkeG9ANvuFHKy5OEtEBZAq5y4dAGd2onCWcwK6D7/SXDOqhQ/OAiU95kc1AwP7Wsl
 FXWggrQ9ufoOvqU/mceGPOqStMYMstuURvlK7Wy8EwlYGG6gBRjPAlNqutkl2/2lKTtnA8CVObDn1a
 XtLo7/B35/hopY76it3j06vvu2JA0BX2p8u5zy57cWwdUeDASfI0oKZK132g==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Rspamd-Queue-Id: 506C145BF20
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104403-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:email,linaro.org:dkim,linaro.org:mid]

In order for the GCC votes on the GDSCs it provides to be propagated
to CX, CX needs to be declared as power domain of the GCC.

Document the missing power-domains property to that purpose.

Fixes: b69d932154dc ("dt-bindings: clock: qcom: document the SM8650 General Clock Controller")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.yaml
index c7143e2abc80..43b06e0abd1d 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.yaml
@@ -32,9 +32,14 @@ properties:
       - description: UFS Phy Tx symbol 0 clock source
       - description: USB3 Phy wrapper pipe clock source
 
+  power-domains:
+    items:
+      - description: CX domain
+
 required:
   - compatible
   - clocks
+  - power-domains
   - '#power-domain-cells'
 
 allOf:

-- 
2.34.1


