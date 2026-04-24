Return-Path: <linux-arm-msm+bounces-104401-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wLGGEY4z62lfJwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104401-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 11:10:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CCAFB45BEB9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 11:10:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 42845302F73B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 09:08:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FEE2386C0F;
	Fri, 24 Apr 2026 09:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pt9/H1Cu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D61F374160
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 09:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777021685; cv=none; b=Klr2L6GoJSLaGKYzVo1x5z0EhItJF3wVonKYTdnSIY9EmBK9UGbEolLUIOQMRZgjQkQ8Nq1WzcciKS2XOYIUJfWYL9QCNcSnO6nBWa7A1LDTxOvMIbA95+IEuVVDFTRSfarzGQcF2XYRsuU2KF7S8MOdQRg0e+0/dn8Qj/Eh71s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777021685; c=relaxed/simple;
	bh=6Cl757H0vhrzSURS0kg9slz0sUZ4ni9TBTlScSjFSts=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T7irT36fYSuxPF3IbRmtpxbfNY30uionEJs5d7w0fABoT2UUx7Zr4wbkw/MGshopPztOiVGpl/gNfmz6fDgyiIV4eZeMtZKWXejMJCWKQZGWkSGmE9ct2UYIg3rEqMTfY3Xp+S82B/UyFNsMyiWn8YADKW1q6qcwIss8knWM250=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pt9/H1Cu; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48374014a77so98931245e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 02:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777021682; x=1777626482; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hyZmboFNKscOfTrdvdGgVCw1jYQJLbWjYm1kbAmJb4Q=;
        b=pt9/H1Cui/H0Spa5tXFW16grrKHiwDKwQ75ixzB4g51gro34YMZZ1X4A0+tgIysTDd
         hgBsqpiaWxeMZ2bWpev2ekucOoMVnwSzE8y0l0ui2lITgDMpq/GqvmCU1MWhWUBBQ4+Z
         RjaZRPE0G6Rbp3iq9wOBVw7H2UkIKft5quZmTgqRYwGNR7CdIt0xRFX9h5wsCHJKqpRh
         ytBuJECotE5811fU3fWR/OVYJ+JoD13a8o3PsFLZsIaUdtC1X5NAsrQdFvkSiadrMimV
         Aw2WrLyEayh5Cmw8Pm3SBWTY2UkiPzAgf3dNJbDbal1KsYTMZfBRu3tfHO5N91bB8bL5
         mWbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777021682; x=1777626482;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hyZmboFNKscOfTrdvdGgVCw1jYQJLbWjYm1kbAmJb4Q=;
        b=rDsCasR16lwgt2o6HPdoe7gvAsJiKH+9OE0ESjJUueyotNxq97LPKPPRA6R+6uAfOl
         L6fwzUaxLl019Bv5I2Du57vZsinqdJJYKV9idovFNPUTXv2rAOyAEem/1jzxlErfeIfD
         0VT1Gq2xg37gXSjykmXCPEPre8FRfuSAfVc3EeKuB/mGLSBf73QS9i0zoIvPzQIHhB90
         7l6mNeZcvKigrJAVK7x4O5HFVWVnXskcIbPDnrvxZB1KGXYYxqmjN6BsXj8boZ+AW+pM
         WuPXyQo5vhRzTNzQztXxk09d+oQzAl6gEQRbRF825Tj8x613DU8/yvZHPxbPyNZOoDH9
         NT/w==
X-Gm-Message-State: AOJu0YwBO2+MroQmCjqu9ysAMd09ABj2M40t17j9mdihcAvmQauaVs6k
	FA80LrpOYjPRjDrj0DaO4069OSuYwOMBb0ffEi4Oefpb8Uw9RcHzLYCxWxMe/hne1cQ=
X-Gm-Gg: AeBDieuSKAljGE0NHofhq68ueLtkh0qDAdX6jIkPOd7yw/9TULRKWrWFlIwowiuQLiW
	8t/XnFbHADl0JoQUjcvaREX00iYpSkhzbGueB+JgFQ7qXggxYbdqSdegx/EUYE2Pg+fSMxiWd3x
	olSBfJqpHe/S3rH1iVpwpxBne/QqPJPPEghYDWS8ovrefELsHSueJ6+ZdPwq8S+PcRI9lYj2JME
	XZmKEwrZRXDksGPKML7Cp8n2xV0lQFVAXWdzw0NIeJZNvsNKSDoGkZtu1tWxhbvrtMXMwW4ZHb4
	hjwUbcHi12wffK428jxnbyy2C7RAbPzqhjo/3qpPfxJDuNM8OeBDhmperRc5JPPke3Wkk7eWZ4R
	OcTkCJcSv3cCGNNC35ysfRVj7R8fjh2G5YGcrQ3WxPH/9rlM/RJYONDU8HSE4SaOHV471vzsyL5
	z+4wtpfu0G03DNqrs5geKeKxbwE/4nNQj8B4WJIC7EssdEsyjTmFQ2aQU=
X-Received: by 2002:a05:600c:348b:b0:489:5022:39a4 with SMTP id 5b1f17b1804b1-4895040c025mr294337145e9.9.1777021681867;
        Fri, 24 Apr 2026 02:08:01 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc1c0354sm537222545e9.11.2026.04.24.02.08.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 02:08:01 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 24 Apr 2026 11:07:55 +0200
Subject: [PATCH 1/6] dt-bindings: clock: qcom: gcc-sm8450: Add missing
 power-domains property
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-topic-sm8x50-tie-gcc-to-cx-v1-1-4b6e09d532ce@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1086;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=6Cl757H0vhrzSURS0kg9slz0sUZ4ni9TBTlScSjFSts=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBp6zLtgvt7hKrcFK4V+qUJDyZ//OxsTtiH8RGhS/bZ
 o0Me8ymJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaesy7QAKCRB33NvayMhJ0VmtEA
 CGyvT+AOJkOesWKklnAmSYY77C14sg3Opb7D8XHQhreNvH0SkYYsH8XaqiUhDkpmDyokwHGl3n2wCs
 clKKtG9MPM3ufaL6WG3yp2WP8o26zKhzBWZIFWPqacGjIhNRenoyP3XP/zBSuvIP3fed2Bs4Apk+Dw
 jTXbQWYyDL2Jw1ga4srNJsrRgEf+ANL/156GlheYNQfUQRWy0X+FpUhNebatNBOrW9P/j6OFaTCUS4
 3CMbOqNk4xhcMMIZiK+QCIwJ/71M+DV0UCHNpG9Z3vWWUL5aDnFJ+cwzP+7ChuJ3pZBXH+Nvy/opOz
 C/VGF9Ke9XT43B3IJusMa3IskqR+VS6hQAZUal2PlqylfU5haay9sbYW8t0IrHL4742vtN4MXih4f/
 9ruC40stxFK5Lq3GO7V9c6LuorwE5ebyYNM/TupcQ6e4/CDkXR8424gTcLWV/+rznaN9q3gXnzKgCP
 0GoSMw7miB4jfQQK9iK49ClOoJRHFElxhDlVbQCaolM72YIj5636IeeZRN1tkShwAv5cg6CvOZmhhZ
 BHMBx6m9adSFTjaYdQzZ3Ld7GAv2Ucb8TD+qUODlkKxRFo8IvIFQjPT+8PL6GtiGxi1+HemclH2lZ2
 6jn/a0wgIpZmIyV0nFpsbXtPtPqw1nOYbxFksgpiou5/wcuCl/u29lhWkGTw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Rspamd-Queue-Id: CCAFB45BEB9
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
	TAGGED_FROM(0.00)[bounces-104401-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,linaro.org:dkim,linaro.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

In order for the GCC votes on the GDSCs it provides to be propagated
to CX, CX needs to be declared as power domain of the GCC.

Document the missing power-domains property to that purpose.

Fixes: 72a0ca203ca7 ("dt-bindings: clock: Add SM8450 GCC clock bindings")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/clock/qcom,gcc-sm8450.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sm8450.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8450.yaml
index 3169ac05e1d8..16fd5a42f3a0 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-sm8450.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8450.yaml
@@ -47,10 +47,15 @@ properties:
       - const: usb3_phy_wrapper_gcc_usb30_pipe_clk # Optional clock
     minItems: 2
 
+  power-domains:
+    items:
+      - description: CX domain
+
 required:
   - compatible
   - clocks
   - clock-names
+  - power-domains
   - '#power-domain-cells'
 
 allOf:

-- 
2.34.1


