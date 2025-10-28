Return-Path: <linux-arm-msm+bounces-79218-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F73C157E7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 16:36:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AFD321B26D3A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 15:35:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 047DF3491EF;
	Tue, 28 Oct 2025 15:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nAOQ6GX0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CC193491EB
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 15:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761665555; cv=none; b=QQP3RXpHUxPkdgqjN1+qR0sufjXm1OexjwhChSpYIV5XkKy4qTPm3Rzdco8zpx9Zb+kH5wyYF6gmEeANCz4DyKm4glMRdlMYFxyoQD9VQSqcmKyi858M2hhSPEz/iKd8ShxmL95uRCxF+cnjc3hVkYm4zjkRIvFxz3aEiHlGPwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761665555; c=relaxed/simple;
	bh=zSukNZlJ7MIqdyaMWhjsK/r7+F8I2VhKVYJCKLETVDw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XA8dZ64Dx+Lp83xHLkd/wj8lsyqm5HFL2LxXtClKDQxoTm8o/x8hC3xJYtm4lZ5fgcY8MZ0pobQJWu8amHGd/paMAICT5340/PexPMTtSq+8w09u65i+j7/MAfUB/cQQsGaH9i9MptaA4iA7mCSY577qCejNWh031sJD3EGI9d0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nAOQ6GX0; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-470ff9b5820so8122285e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 08:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761665551; x=1762270351; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2LZwNoJWwYkaKmAAehgehdzMFy99KMCq/sPgFndgvoQ=;
        b=nAOQ6GX0sobwU81e4+wMBIccAfq9QxROtuHTTa/40R3kqljfXzowxKHZ5y56O3oBU5
         6CP/PnQl3fbeEBaF7YL1f2O87EJWDfYIcCmqNiCrnIsb60jYiqZjhyRCYuYBNqHs5vpH
         9RvZBk7HZOxxRD+x0m0e8Qv8UZpJ4JM72lVkbnErQ2uFRbSMLaUwcXTxJI6ODmuhQNoO
         XoVfSkgiAj8iu42pmP1Ub4ydVfAUZKkr8QIksfP9u18ZzOqNuglJoAMavmGKU20XRx5N
         gg+pdT/M0BfRNM514+2zmoMuR5o62S/6CgTjXR//EunljM8NACZeop0KWJQgxlySXZJH
         1sXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761665551; x=1762270351;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2LZwNoJWwYkaKmAAehgehdzMFy99KMCq/sPgFndgvoQ=;
        b=PEG5888UlRZU3JPBzTk2/mMiz2VJ6/ed7regg/+y26BRehuJI4QkITcARW6CvDMmas
         19o1lq3jKvqeZ3xXMTUn3r16g5yRGCzv10gV6+AQvJk3r0GFlN2OyRDg8CbmWdFndNjs
         Pb/6ssTGuh8WeeycjPE/VctZzd4vGzlBiHnCGqSF0sMBL1tz/LZmc/Abvs6VNhGij87M
         inrKine1YuwR0BOx0FEwvfWH19i6IPnoPML5H27d5kpn8WEYsoZKUNlDGt8dK7Hby5iI
         z8C+hSIJCwH9s1LNwNHtKrAP7F2rnVWWKNxMCkUFhjgWOxGtPqzUE0JcFilQ08avQfHQ
         TaUw==
X-Forwarded-Encrypted: i=1; AJvYcCWaAJuCdogbN5UVtKByigyiHZGh0TCuZwjQFLurrhVD2CK1Jclvk0Rs3VLRR4qJK+rl5POLNoj0qd59G9pF@vger.kernel.org
X-Gm-Message-State: AOJu0YxT8HN8e0WnbwsjVCLxrb5T8Z/rFAzO9BxjYAO84xHxT1tlrwof
	S25jgIOmMizKA1iX3Ys/OHyXwbE3tZqha7XqFxNx9bCsQsvEUj9dtQ0pXmjgePKj9sI=
X-Gm-Gg: ASbGnctitOknbqzqJaYjJ6MOnZNihNj6CtKJPJY1/qjjCGkhbdN6o0mVYY0kV8EJUNq
	Jh4+i5QJXvhlEA70NqlA6CqwNwhSeT66pw0WA73cuSBeIXeQz5zkBPbgtq2DLsSjoSlol+FCMtT
	C3lc/iiQx414B7IvvFgTGSbg9QCySqGJnXtOEV9XjT3ALk8A/UzO5yyjEkow7BDnAbwmlsgB8Cm
	ooYfDh9ZRTjdwbaYAlvBNFSQhhYN4Ndl/e6we23SyGCznpReqFgUhpCVvLhHNW6w00AvxlMhIrk
	se+D98gSosK3Hp1R3zhs1av1szi6wA/DluECIZT1iYTIIYhXIIAIoBRBpB7bYF6BwyYd71uZEGE
	7ZVJpj0PZqy2Xh3whJS8xAY+chGyCD00JWqRly2APe8zlLpoNB/wpvs8N8s4sCCaelRTHLnfYpP
	fWkc9Z1x8pE05teY3sIl9wXrVSVjU=
X-Google-Smtp-Source: AGHT+IGVE3B2QRjpTEh5wr1vPtOo1EljFcIgnH5xAZBrUlCMOJ0sPgHl+FMB8DiEmz2qJn5TRoBcsg==
X-Received: by 2002:a05:600c:314c:b0:476:84e9:b552 with SMTP id 5b1f17b1804b1-47717e42d94mr18438835e9.4.1761665551119;
        Tue, 28 Oct 2025 08:32:31 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952d9e80sm20844417f8f.28.2025.10.28.08.32.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 08:32:30 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 28 Oct 2025 16:32:01 +0100
Subject: [PATCH 12/12] dt-bindings: bluetooth: qcom,wcn7850-bt: Deprecate
 old supplies
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251028-dt-bindings-qcom-bluetooth-v1-12-524a978e3cda@linaro.org>
References: <20251028-dt-bindings-qcom-bluetooth-v1-0-524a978e3cda@linaro.org>
In-Reply-To: <20251028-dt-bindings-qcom-bluetooth-v1-0-524a978e3cda@linaro.org>
To: Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, 
 Rocky Liao <quic_rjliao@quicinc.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1727;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=zSukNZlJ7MIqdyaMWhjsK/r7+F8I2VhKVYJCKLETVDw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpAOH7qJ7gAnazlmEVmSQT2tl9Ov0fW8LBbuH92
 j+nTnI5/1yJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaQDh+wAKCRDBN2bmhouD
 1+RrD/4lCI9nI3gLTpbmLlCCHv8SmzZIwl9uEqBvUPhzDRA8WaZJh/ZEp2TgoALquJUW/C5CS0G
 SaKnKiFSqrO3SCWCiLEus1feRx/7VQdes6ITSWyfgbkZassgogbBFzLCUAlhaFKvrw9FytIgx+P
 Lc9xiiVK8wKORsFckj99TmPGm2M6GWhVMChKwkJ4EkNFBEZIm/g5fxsppVngkr9tDvut1uRezt+
 7DKogdmfYCNSnSnbovMt09FsU2VyxOoAQxFAEt7btdo1L2srZA1aI5XxLKdvTH84j8Yh3L10Gxu
 F1Aj/dKG82PBM1uhew9QrBwjf0zhPZhsuVk4eis/WqRb75e9qa1z4VSWgYmGd2Gt/Ep09aOWDaJ
 3a06SoGgrxePjYcwyvon09LIZv+2Oj42QQiZN5Ub0C74TFp62062edF2GgxpEJbxTPDuRQXleYW
 W9zFdPR6HfBzgC6hriu2hKUS9An1JBNnUS0BWxp+6UNoyc64ko6i9wfos5qqFa/p4XEyuofNGNX
 aVMzg+iFOWgaf6dCnetMW1S2+agDvSSyaMalD0GVuX9Sf0SNgD2iV1/BIPVW75dskYIrVhtV4bU
 w7gg0tg/b/wXTFp4IEXXJH452bxAbovmd5OsZ7WZC4HAGjLRxsxr+vY24j+WsTJ4AlbFlaYpvu4
 hFA+1fgm6I8+uaQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Commit bd3f305886ad ("dt-bindings: bluetooth: qualcomm: describe the
inputs from PMU for wcn7850") changed the binding to new description
with a Power Management Unit (PMU), thus certain power-controller
properties are considered deprecated and are part of that PMUs binding.

Deprecate them to mark clearly that new PMU-based approach is preferred.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/net/bluetooth/qcom,wcn7850-bt.yaml         | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn7850-bt.yaml b/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn7850-bt.yaml
index d2a1477380eb..418a06ff0353 100644
--- a/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn7850-bt.yaml
+++ b/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn7850-bt.yaml
@@ -17,19 +17,25 @@ properties:
 
   enable-gpios:
     maxItems: 1
+    deprecated: true
 
   swctrl-gpios:
     maxItems: 1
     description: gpio specifier is used to find status
                  of clock supply to SoC
+    deprecated: true
+
   vddaon-supply:
     description: VDD_AON supply regulator handle
 
   vddio-supply:
     description: VDD_IO supply regulator handle
+    deprecated: true
 
   vdddig-supply:
     description: VDD_DIG supply regulator handle
+    deprecated: true
+
   vddrfa0p8-supply:
     description: VDD_RFA_0P8 supply regulator handle
 
@@ -41,6 +47,7 @@ properties:
 
   vddrfa1p9-supply:
     description: VDD_RFA_1P9 supply regulator handle
+    deprecated: true
 
   vddrfacmn-supply:
     description: VDD_RFA_CMN supply regulator handle

-- 
2.48.1


