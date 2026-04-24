Return-Path: <linux-arm-msm+bounces-104402-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QKWIMgsz62lfJwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104402-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 11:08:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F8E45BE4D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 11:08:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 07E5030074CC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 09:08:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D07BD387369;
	Fri, 24 Apr 2026 09:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QwmBuErC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5CA9386552
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 09:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777021687; cv=none; b=Eip80tX7nTub4x5ftkY+KA9OacjXeE3oa8767HpKdzMc3nq4/f0DRWDWtkdQD+OvkZ2/2VoUCRcqc0BWnN8LLekdvnOWXqLXWqPb/C5hGE5h5JQgB8xRWGegLUpUkS3gpIbX5I+MeNOV2Jr6xM6I1o+7yeox16CU+wv2MQHuGwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777021687; c=relaxed/simple;
	bh=IwkmBkAuWbKdA+FQU3eOvcwJRVeHTGMjU2R5rw8ly3w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QS911nqWPl4tiQ5C+BT2j4u1hPaWKMK1mewf0Ax6cj3jQuh2oe6iqOq/Uo0hWl0VFJfjRcJRSjSmNi0ud+v1+HIStwP2nByOhMHHYIYPM9S6It9SYzmk/pdIs6XlMauZprVwznFi8YTMZBq7KbostOA6AICPTwPFk6elErA+/7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QwmBuErC; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4891cd41959so57170215e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 02:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777021683; x=1777626483; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hTJIDuh1c9B+y7w8n0vHIO8xz2jJldQ3ENPocwBUryE=;
        b=QwmBuErCaC5psT/BN/7tnpgr7zyPKG5stFgNkqTTsy2Gd6QxtE+k2r4OpfcjCpOxR9
         AJNwFqysvhEfqpUD1cBZSiyXSHKJDvbXvGTtNBUeHrTVZ7S6D7ep5pNhlanPY1SLZJ70
         eBPlPtIn89g1SZJlQbDBCE+fY48ERbGZ4GMGqOcvulTmu2ULqlJgsnc8yiYY8FKU/Sb9
         LmpK2wWkySp+xk3cqBpwwl1ma2Si22b4mtgGQcfP++O6mDBsMyr1HfpK3bvhr1WJoQjC
         Ol7Tp516FeGUtfWMBdSItRXLgy3kImduEK9peOjjOGyQQqjCzPWFoIy3LG9mo0Lqh6o9
         SzAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777021683; x=1777626483;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hTJIDuh1c9B+y7w8n0vHIO8xz2jJldQ3ENPocwBUryE=;
        b=XoCqe+BuYN2v+kwoqSwymiGHQPUatGymchd09LU7pzX2MGAkyLlPyf+tAW7riGV4dK
         zooCiJoiLyU7zcUr9pSK+I/aqO7RzU7FLtGUwuyxb0nrxEhPKVyx2okhsXlaK2K3BPBo
         Pit9djLQ9mk7Hj//djyaXo2pJy3Q6rDAhEbqGB6eTr6d+XosYTI/BGpPtYnU5t4R9Y84
         77h46k5TSS3TiGyLif4TuQrzEUavvG5XG26+LDgwMMUvob8qndPzbEfNfKaRWXLAo2pB
         eVLdp3d7KlLlTQYXMZapM5EC/SdNFofyBkEPF5k/RrpoG0z3Rjlu3t2PlpgTvqINuK1L
         xjqA==
X-Gm-Message-State: AOJu0YzN+yAf2BgbHfirT2cWqtIuryNIXlZIAjfAe+br9PsFDSPz4dNq
	A8t/GwkzDNxhfo2FZaudz8HK2fjP5d4aL9u3MfMGuQanEKHHTV8ZPdEIsDYoCJdV6Vs=
X-Gm-Gg: AeBDieuswmexSP2DmXvhLLqJl2KB3GSn7uZe5tgFN7y+9e4hKL5obTECoSFBCLGPvzN
	eKe0qz/eOifKLrrjmOV8WLYYcyU2x7qCl7zjK2y5XBXkDGkNK//j+YQEozmUbemZU37qWycpoAr
	X2ovk/YghDeGXW0mWqRA2s7AKhsjIafbPNJuAgmNMiTKtoFbHhnJ+7Gcpm46NCwzVQA3RtZeKiP
	0b8PdbRF5sdFB6dKWxXenJjJ7P22ISTDF7m6TBKLPb2MKoFMV3zxpRsmoOUT54Aw+iPk+xY3oIE
	3BbaEKm8+GCBTh0ijp1p/aZ4XLPX1vNpnipEnvAD8NyNzRZqXQ39beqemii/slue3V3fc2hOCWo
	wp/qRHb6vsCDjz8JDHKt4V/YiK5C5bx7BxpWpH2tmL2fG5h0ficI63rziOmyqLcc3kXtr6ChHiw
	TKYz3mLBkH/e+Gr+MYpFJZlnlg5hCE6UZMaXQWLgNj05pGt6iGKFoP7tY=
X-Received: by 2002:a05:600d:b:b0:48a:563c:c8e2 with SMTP id 5b1f17b1804b1-48a563cd137mr173435695e9.3.1777021682880;
        Fri, 24 Apr 2026 02:08:02 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc1c0354sm537222545e9.11.2026.04.24.02.08.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 02:08:02 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 24 Apr 2026 11:07:56 +0200
Subject: [PATCH 2/6] dt-bindings: clock: qcom: sm8550-gcc: Add missing
 power-domains property
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-topic-sm8x50-tie-gcc-to-cx-v1-2-4b6e09d532ce@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1085;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=IwkmBkAuWbKdA+FQU3eOvcwJRVeHTGMjU2R5rw8ly3w=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBp6zLta7gwiJ/on/YhF8Netw60TBjWggYjPha7STkA
 1XZQCE6JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaesy7QAKCRB33NvayMhJ0cqnD/
 9BF1CqOKgUv5pGbD+oyYkx0JMogo5opYqZcmzeK7n3iZjZ+DEUWIKu29hHh4YhDqWc3yRTGsxIndHX
 2k67GLH/xgKm+IouegCD/4gM9KDEMb8Lg7Tu1VWRDfHetmVe8D78EhKieWWAoG/lyiblqNq0PrjpC7
 BWp2OJIB6pic2kuJ0qx7iTYOoQc2tML9IeanM+PoM+6toR0646j8ELgY6LHZ5PcTdrAFFVG6ics30y
 nmnmRcPW+NQ4r7tCYwtREE4nXaDB0+keYW6Y/wpySvUqFVr5aj0EBNPbnNmpfZtgyK66X99YHrxiti
 GTz4DFauw08t5WeU8Qy4YJbyqk1HkEotnsiSD1Rr5PBYQQo+W9A3vDuG009cTmSbTkNahuwTgAo12x
 h0r8tqAXE0BW9woL5rZRPx2dmBeiMeTQDbIzdqq6bFmvSc7USbX7UmdcdJTaW0ge2L6yFB/cXuhot8
 lOnN8/LRKT6F237DH+E2Xk4HfgvJ8Ts/yqdKNJ7IIgoKVTUk9Y4orQlW+pnB1C8BPVWzVtCFuNsDJ4
 TKxMHWDgshDghaAJ3PPemAb9bsCSmaY5vWzpvCiUT40x/djSBjcn6M9n2FQobziakP7IMXPYf61+yC
 SftzlBy905Uo5wydxR57etbGXRh9SDfQtHHDrUaC0HJM2gXmW0zx8CMOAC+A==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Rspamd-Queue-Id: 53F8E45BE4D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104402-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,linaro.org:dkim,linaro.org:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

In order for the GCC votes on the GDSCs it provides to be propagated
to CX, CX needs to be declared as power domain of the GCC.

Document the missing power-domains property to that purpose.

Fixes: 47ba9c50bbeb ("dt-bindings: clock: Add SM8550 GCC clocks")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/clock/qcom,sm8550-gcc.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-gcc.yaml
index c4e9b9bb63f5..8c40e93bf336 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8550-gcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-gcc.yaml
@@ -31,9 +31,14 @@ properties:
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


