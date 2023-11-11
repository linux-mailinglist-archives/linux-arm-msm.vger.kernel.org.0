Return-Path: <linux-arm-msm+bounces-511-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C28717E8CA7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Nov 2023 21:49:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E31AD1C20355
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Nov 2023 20:49:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1C9A13AF9;
	Sat, 11 Nov 2023 20:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mp4kal5X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E0BB1B283
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Nov 2023 20:49:27 +0000 (UTC)
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E56F730D0
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Nov 2023 12:49:25 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-40790b0a224so23885975e9.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Nov 2023 12:49:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699735764; x=1700340564; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DLBtiPYj3Yy2cVg+bWJ7eQ8pYjPfevkkuxOoGNznoSw=;
        b=mp4kal5X1fTFGgn4v3Vhn+fITh9jiKL1Iv1CNkVz2dr1iNwPUYuPc0yWZFdJL4Lq5Q
         ldy7MQEmGZ/zM9sN29GN8jaGRjbDKvJwkWCHN17n7VD9Nl0m1mEvE4NebdNGQgKwLsvn
         0HxB/APgVS0L05zzwus3GuOV94nBGXLSzrLTKPmmmkbErSfMkGOTqQOfNpSlIqw8wpD1
         EEORiLY8q04F5oAH6xEMAx7Fz3K+QAwt9KJV3UkpwzUrmdptB1xge2jP7at1Gmp1heS+
         JKJZwzcnP6Swnv7R3KkYeKyP/yQzTDXJ15GzlgUL3I2HFmV0XzHvgDvCuhsPyLflat4d
         yUww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699735764; x=1700340564;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DLBtiPYj3Yy2cVg+bWJ7eQ8pYjPfevkkuxOoGNznoSw=;
        b=v82tmaeqD/IwtWswsJv1QoEoPeet/7+c2iqUY0d9mV7Ta3QibWQR+047LLpq/1Xol9
         qVcUJEF7pKAoXFBVQisMORVghV2CciZiAY5rzia36W+c4+cs54rvKWABwpsXSkNBGrUF
         12oXBYLPpZaUjGQwOnF37tmciMMGN36I2hRNWN5hzk/6kSbJKgPDivGIyCe8CfsfmFQx
         dFGnu/U/i31GPFaCBFcwXSecfVYwjoLJni4NZRLCtjGGv1ilzZ8G4kpSTkMJO8yOJbdh
         JzFDgs6ihs0sWO71VIpVsX794m9deEt+iSmmaliK60/FGe+gmOfobMpW1p/jfp9G2+gN
         Kw2Q==
X-Gm-Message-State: AOJu0YybwV689t7j6k6fvqfncQUcoPZemMKlGi1HHihJ32LNIefi/N2t
	DJalrnN2/KDjHXqwMOhTpgRO2A==
X-Google-Smtp-Source: AGHT+IEyrfjG7/N1sG414WEFffDiTSiFc5t4EfjI4yT0UQcFt1DJflVEFPUR7WGPZlo7p260m0z0TA==
X-Received: by 2002:a05:600c:4ecc:b0:406:8496:bd8b with SMTP id g12-20020a05600c4ecc00b004068496bd8bmr1983168wmq.9.1699735764163;
        Sat, 11 Nov 2023 12:49:24 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id t9-20020a05600c198900b00407752bd834sm3121226wmq.1.2023.11.11.12.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Nov 2023 12:49:23 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 1/3] dt-bindings: mailbox: qcom,apcs-kpss-global: drop duplicated qcom,ipq8074-apcs-apps-global
Date: Sat, 11 Nov 2023 21:49:14 +0100
Message-Id: <20231111204916.35835-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231111204916.35835-1-krzysztof.kozlowski@linaro.org>
References: <20231111204916.35835-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

qcom,ipq8074-apcs-apps-global compatible is listed in two places: with
and without fallback.  Drop the second case to match DTS.

Fixes: 34d8775a0edc ("dt-bindings: mailbox: qcom,apcs-kpss-global: use fallbacks for few variants")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml       | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
index a38413f8d132..a22c8640dc0e 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
@@ -41,7 +41,6 @@ properties:
           - const: syscon
       - enum:
           - qcom,ipq6018-apcs-apps-global
-          - qcom,ipq8074-apcs-apps-global
           - qcom,msm8996-apcs-hmss-global
           - qcom,msm8998-apcs-hmss-global
           - qcom,qcm2290-apcs-hmss-global
-- 
2.34.1


