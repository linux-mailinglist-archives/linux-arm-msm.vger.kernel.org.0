Return-Path: <linux-arm-msm+bounces-104400-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 3JlTHfcy62mkJwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104400-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 11:08:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 91BC745BE37
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 11:08:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8E1523013737
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 09:08:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EF41361DCB;
	Fri, 24 Apr 2026 09:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Jbp35p3A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1044372698
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 09:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777021684; cv=none; b=FoUoWUSxTnt2NiWos8JzcCuLz0Q6zR3eydUaasI4+tSY4RSvEuYOJgQR4mgr0tjtJBhRG7lvST67WP/b1fkY3VmDihs0a6XR/lHNeKOX8wyGcqrphwqJAWoDnCMxfuRbOyPmywS4pVL/X5ngit3Nr4gB/aKdEocEGwRxFT9WeZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777021684; c=relaxed/simple;
	bh=mfL3zMqIzWVzm4FHhB2pqXPEVF4fw5d3cYOMIdlK9nI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=c8arfy4po8RcVi2gN7uSKzGYQEr/28lLArvPlvEIsac11YlGMMysXuSCh+lQZWDX2yYU/9sSfJ1/eefu0v1fciDE34AtAIn4L4PVCljA2/1XivvNnWpAEPwLz5cR4vQbN83AwsUlOy1TvYQRqNkplLggR15YAA/i0arO1N58Jjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Jbp35p3A; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4891e86fabeso73494545e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 02:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777021681; x=1777626481; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sO/i9Gb8rKY9PHJ5AFHwqyiQ8HD7GPgRZTwMGfL3wOE=;
        b=Jbp35p3A7dljX8K8LmzSibIRmc8kW+NKClTGm9B/1nG1BCIdsJRspFWU2qcNPSlfap
         1JFurRfRZGYI9MOFXX7a3OJcN2YTdW21pJXcmZckALSobzCTqAFTSzxXt9kOz9Qkokwj
         bf3QAs241uu36I9ATRcSb2yEAZr9YPOPZEEnTORbqKgdtFmljdefewcOoIhnE3oR2FjP
         FxHrYs/cxkDW8oe9dls85Qb1U0RIYmbKkd4/N/glHHJUxcYfYiNk3cMeYOa83jUvQBzf
         Uugvft8smAE26iJdfq/KnM+X+/28JTlP6ZN/LehD62onUFEhprjsQJ1qrUtA2M+qerSJ
         sO7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777021681; x=1777626481;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sO/i9Gb8rKY9PHJ5AFHwqyiQ8HD7GPgRZTwMGfL3wOE=;
        b=RjJwv97Hse9w9txmxGGeJQT8jY4VMqEzw9h3k6CEjeWtx6JdOyEOCVPSr/L7rMxPKN
         vmXaOsdREktBT9/hpttm791EBpf2XhDaD8fy3PUcINXgqEMR2yt4DAyZENM6b2oPugyd
         f/3+q8WxRJuawcxnGIzz0FMuD5g1GeK/qOe9bXd3L6KxS7gWSUVAax88loaDPtJWG0uT
         yCFGlRy+6sDWy7juvPys6MAYhGoiV61GIihvzKxaMVZ+j0A9jiv/9vyz+BU3YncFzqrQ
         uWbZqyxVBACf0b5HXyzK7xmEesPZwyeeIYI8TwQpvOotIkTvWp7KIqCTVVBnnWfXsRz1
         51HQ==
X-Gm-Message-State: AOJu0YwA+c6pYW2nY3OuKxO3j/7hWpR9GQnfNifWnDpa5jV9rxjDjNQ/
	WipZVOH1dqziSPZFAwQe75l+h1MezKxjvn2cvNm0iASew9IyJHednPi8S15R7C4tJnY=
X-Gm-Gg: AeBDietigDr1lFS2yxHFZQa1qdqLxWKtJAFlLTFvx8SlHD0T5QIei+/fiYpFJItRlhC
	yO3vRYM10lSP7z3Bn5+4q2ktMOX5nOw6RaqK12s/UpkFWXixscJZ0PhrjLtjpKtz4T5Xpg1Um2S
	TpGIfwgB0TfG50/BGtuYdt/2rqEDYHhrOw3Wx4M+qZkfjoh+yKx3KROV+i7mpfv9w/iiujH9lca
	kGb7D5O6SGD62uPpvF5BrI9t+Dzb8fwbODoy876w7qQ2AGecIQ2wyb4nbklcAiuxXdWOu0jWfi7
	EQAGV8JA+Xn+vfqvtuUoi1LQjOCg7Sk7vj2M7eTNPQw8kqN8XVnuU61s0RzJEsSJqugvXMY8mtM
	wA23dODNBvm5OSXBLEpPxwOBa6W9Es0IPge4B2mOg3pq0j7UJ1BgIyvL2zX/+gdys4D+5mJ6LT+
	G4L3EqhzZKFCirenPW5kA6AQ5Mv9k34EI7/jufvRSNZLtAxgRuydWHqqk=
X-Received: by 2002:a05:600c:3515:b0:488:8b99:54a1 with SMTP id 5b1f17b1804b1-488fb78e7c5mr423957895e9.28.1777021680970;
        Fri, 24 Apr 2026 02:08:00 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc1c0354sm537222545e9.11.2026.04.24.02.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 02:08:00 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH 0/6] arm64: dts: qcom: sm8[456]50: Add missing CX power
 domain to GCC
Date: Fri, 24 Apr 2026 11:07:54 +0200
Message-Id: <20260424-topic-sm8x50-tie-gcc-to-cx-v1-0-4b6e09d532ce@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOoy62kC/yXMTQqDMBBA4avIrDsQg3/0KtJFMo52ClXJRAmId
 ze2y+8t3gHKQVjhWRwQeBeVZc4oHwXQ280TowzZYI1tTGUrjMsqhPrtUm0wCuNElCNSQm7rxo2
 utd53kAdr4FHSb96//tbNf5jifYTzvABKMkUpfgAAAA==
X-Change-ID: 20260424-topic-sm8x50-tie-gcc-to-cx-e756afa72bb8
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1406;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=mfL3zMqIzWVzm4FHhB2pqXPEVF4fw5d3cYOMIdlK9nI=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBp6zLt1qg2AIuqspYpg045muyTSFJw3AdOHIyrnQGq
 n+WVwZmJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaesy7QAKCRB33NvayMhJ0Q3vD/
 4iJ8xefum6O9bAeFfJ1s0jhT128NFRnBTdSU1TBSmtjVOjxLrXNaDdg0ye7QHZcTgPiRFkT4UlwrdD
 Tkn89sarjjZNHz5A8dsNc40qwWVSa2O2TVtAZERZeJkRnkCC6u+h6gUyiQRGRq+4GTuYB4OpBeclwf
 1QHVIO9+MH2fQYOyKQW7LhjstQ1YHQYLqhjZoIdVTDmNtAmHkZBwf7BoKm9lWV6N/CD3LBntCMo6iN
 04kqMAL5yA5NiDp4mCKDyOsbgiRkRVAtJCBizFDm3LRCcrsq3ZNgl8avz8QtQ8RYlWzjUdLBZzBzWx
 BJJ0x+dNmF5GzVaZ1mGQEyVEy6/CrwSH8bFl2epj2VRAxYc2SYvtTzCXjfaMNGnu8na8m/w7jjNWzZ
 qMG/q0EQVPPtc4ZVk9csNqsggtkiUbDAIMaHTQWDkTPo2LAh5C2O0Vbc8IDTVVvHexGQtr0l7b8ydF
 cDMOQD7vACssj6vUhOfmWrTvWncYc9CSrjojtHvIsqPFC6rLMyiHEJ3wkEy+Cx8XZ8LSLHJIAZYX2B
 qT9QejsAHcclKZRapzb0U8L6/SbLJbIXX0WFlDFkPBQXeV3EdG2K3rwFr0BDmJ3FvX9sp0sucyfZun
 P1MN5ZYz3hj+3lPEkL9pkq3xUxcXMaRPhv9/0HPVwjXtA9ptqKSGiw1a+NJw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Rspamd-Queue-Id: 91BC745BE37
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104400-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:email,linaro.org:dkim,linaro.org:mid]

Recently, on Eliza & Milos, the CX has been tied up to the GCC,
but this is valid for most platforms including sm8[456]50.
So tie the CX power domain to the GCC as well, for the
same exact reasons as on Eliza & Milos.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Neil Armstrong (6):
      dt-bindings: clock: qcom: gcc-sm8450: Add missing power-domains property
      dt-bindings: clock: qcom: sm8550-gcc: Add missing power-domains property
      dt-bindings: clock: qcom: sm8650-gcc: Add missing power-domains property
      arm64: dts: qcom: sm8450: Add missing CX power domain to GCC
      arm64: dts: qcom: sm8550: Add missing CX power domain to GCC
      arm64: dts: qcom: sm8650: Add missing CX power domain to GCC

 Documentation/devicetree/bindings/clock/qcom,gcc-sm8450.yaml | 5 +++++
 Documentation/devicetree/bindings/clock/qcom,sm8550-gcc.yaml | 5 +++++
 Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.yaml | 5 +++++
 arch/arm64/boot/dts/qcom/sm8450.dtsi                         | 1 +
 arch/arm64/boot/dts/qcom/sm8550.dtsi                         | 1 +
 arch/arm64/boot/dts/qcom/sm8650.dtsi                         | 2 ++
 6 files changed, 19 insertions(+)
---
base-commit: 4c406406070d57dbefeaad149181785330c23f92
change-id: 20260424-topic-sm8x50-tie-gcc-to-cx-e756afa72bb8

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>


