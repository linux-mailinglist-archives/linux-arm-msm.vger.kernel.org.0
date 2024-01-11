Return-Path: <linux-arm-msm+bounces-7050-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F12C982B375
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jan 2024 17:59:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 94E86B21B4B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jan 2024 16:59:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89F562AEFE;
	Thu, 11 Jan 2024 16:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="plu9v4/7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0995B50274
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jan 2024 16:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3376f71fcbbso3544638f8f.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jan 2024 08:58:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704992334; x=1705597134; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QpB6LSOwWInw7WKvFt3WMNIK3ZW3rfcyuckfXz6cQRQ=;
        b=plu9v4/7Anr9URaVJXrJg3TULVmuVIpPf6D630eHNhk6A7M/RbHKPdg4auwG6JQtFd
         dqyLVwKZv+XZTQAd1geyeTQBE6RVckn87mJKyZx4CdjT7xC5nk00RaK7rhn0WGpz7w94
         9xIhuhCffbt4iWDFJHDZ+9Jo56s7s/1EwyKUTZT+XsqIIkAnc1Aqw+FAidWj4QDR9HsJ
         eGB5Oa54NqVYgkwr17mfEmvHmV/zueimoSvt7hb4vJAyue6EVV7+LmsC/Jl8ssq/avSf
         viyJ213ZyeKN50L5bQgc3Ut8EpTWMySCwUXO3rAdKgRrz7Pk4h2aB36+0XINohcDHC2i
         hB3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704992334; x=1705597134;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QpB6LSOwWInw7WKvFt3WMNIK3ZW3rfcyuckfXz6cQRQ=;
        b=b4TB4AqJKRhnnN0St0Lo59iC483mJdmabVd5DZm8rHJGUzZCgg3yGdlX85uJIP5vil
         89hO9/jvFkZEj+9imp9XTTtej9HOlMrpoDWusthnWgw3ykoBRE2FMHr1aXyaNysRoMdc
         350LaIPQYWcjs2VkM1cElEggnhLCCsz+GODExchKbqFxasIPCAbhyE1+OvvOXmy5qH9Y
         Bc2I0ebY3udVUTDcwgjhII+6EOMOrYP+6aTR9j0XV/T1YFubVnZhibpyuy0QSZAkHTm8
         3f30fpsvLOffWw2hhz40VcpjRkXJbnROWyZgdMlAFHeQ5A+uD1rwiO+40Epw1SuS95jf
         zlFg==
X-Gm-Message-State: AOJu0YwDLBQelrq/n2elVcbHCfwjRxVda2UTnhjDlE5DXR7u/sAL0Nyn
	rbm6Yh7NpKmKuX7WCLo25fEfAb+4EQ53OA==
X-Google-Smtp-Source: AGHT+IHr10MovwwZxYwOSZSTo+kUwVxusD/eU0uFA5hQc/nprJ568eBoFh1BNIXBvqXhH2i+kOH1uw==
X-Received: by 2002:a05:600c:4e15:b0:40e:52d2:ef23 with SMTP id b21-20020a05600c4e1500b0040e52d2ef23mr56768wmq.17.1704992334363;
        Thu, 11 Jan 2024 08:58:54 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id iv17-20020a05600c549100b0040e5034d8e0sm6501354wmb.43.2024.01.11.08.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jan 2024 08:58:53 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 11 Jan 2024 17:58:49 +0100
Subject: [PATCH 1/2] arm64: dts: qcom: sm8650-qrd: add gpio74 as reserved
 gpio
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240111-topic-sm8650-upstream-qrd-fix-gpio-reserved-v1-1-fad39b4c5def@linaro.org>
References: <20240111-topic-sm8650-upstream-qrd-fix-gpio-reserved-v1-0-fad39b4c5def@linaro.org>
In-Reply-To: <20240111-topic-sm8650-upstream-qrd-fix-gpio-reserved-v1-0-fad39b4c5def@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Georgi Djakov <djakov@kernel.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1107;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=Ld7ubk2A1iIOznHh2Zvoty4uvkikoaHqPcyq6CJCAKI=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBloB5L0Z35o6Eulbs8a34zu6lP0svEinf4Gl7P6wyO
 N6uFHe+JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZaAeSwAKCRB33NvayMhJ0RE5D/
 48yvbQvibhYdFKg/IC1LJ5SEjjVa7BVM8+sceE8DCK2b+DINrY45sCb/QHcN1ii29UCu8R69ycjD2g
 /vCw3RFqZXnpRbZfWHMtt+051vu+L6QlsaaEZfb5HCuK2YpsYsAVN/yOmlg9bXFmzJNVX6IqSbiEDp
 GHR5JSFg4kWIgtsWZLS+kHf1WG4VynAsyaJQt64eAV+JC5by3VVyayiCWdQsoljrADZqgpGE2p8ATb
 Nm32/6ocDjkGPpC/XUj21X2Mh3ZyKmfrwQIUFPdHhgW19P59lZHj8fRrThPM7nauRXFrgUlyjelIgo
 tv+g5DgvZQx1V9rQxy6V+otIu9EHYC072+2NKD79JUcAiTlBE77JDxx73pOjUqOjlaiSOeZgfjwf7t
 X2LEpp1mdefz1eDsUqXswF2hECOUk3Z/GlFJ2x0UYMP2n5T7PzP+i1a/mpUWab1MhcOBLuQhLBBMxn
 6m2CSlH16gDSwmqJRqJ6JwQoebjduLyZ1kcjpTQG2nBaouJsL3QgAcUnHQn4N9OOOg2pKHFjiPYoHo
 r0+FUxgWAlWVYg9iR0HZ56mLlRKnOfVUE6WfqVE7tWExtwi0aEmtW0kyGs/FnKGw2QL6nBJ9LcaUpb
 3GRbns3PGry9CHpWRmUNzxDP9XhphNWeCLJmpNxiEO4FZCa/qvD16ETrLjeA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The TLMM gpio74 is also used to communicate with the secure NFC
on-board module, some variants of the SM8650-QRD board requires
this GPIO to be dedicated to the secure firmware and set reserved
in order to successfully initialize the TLMM GPIOs from HLOS (Linux).
On the other boards this GPIO is unused so it's still safe to mark
the GPIO as reserved.

Fixes: a834911d50c1 ("arm64: dts: qcom: sm8650: add initial SM8650 QRD dts")
Reported-by: Georgi Djakov <djakov@kernel.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
index 592a67a47c78..b9151c2ddf2e 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
@@ -659,7 +659,7 @@ touchscreen@0 {
 
 &tlmm {
 	/* Reserved I/Os for NFC */
-	gpio-reserved-ranges = <32 8>;
+	gpio-reserved-ranges = <32 8>, <74 1>;
 
 	bt_default: bt-default-state {
 		bt-en-pins {

-- 
2.34.1


