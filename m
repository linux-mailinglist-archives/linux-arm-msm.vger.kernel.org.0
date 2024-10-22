Return-Path: <linux-arm-msm+bounces-35342-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C69C9A9A24
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 08:43:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EC3491F239C6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 06:43:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A051913B280;
	Tue, 22 Oct 2024 06:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r72Rw2co"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2AB8811EB
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Oct 2024 06:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729579365; cv=none; b=bf6J5fqoyT9YHvD2GhOJPbiWwlo9gS4wTBqtI5VuSDV+KxFsC337sJ6I0gsrTWa8LXKuDUdxOG9wV38oqOxxTZYSGAYcqx6TRSKcCzY2otmuAjtoi4p7xETm+FmI6PLDF22wYKE6W2ipDT60AV8bmuFPdMNnz8oMAjIjGNvAeok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729579365; c=relaxed/simple;
	bh=sFZw47jjW0Crp5XE2dnpAeSONWmy9BMxx8vlmvab/Lo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RzDJ25okNXt5Sw1NKCycvBvlYpOzdcnkf6BrwEsUGeVCH3NJFcX9ybsENVJr+5ozXIk/NrGZuHjTLsnjCPhMUj+YLW8R4xDbUjvIg7RkYrsuNrOGhcTUvm8qbuYDN/yi/Jquz+vRKqJwQNTMsl4Uo+A3EJTre0ANtwixnBAa6IE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r72Rw2co; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-37d5045987dso442909f8f.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2024 23:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729579362; x=1730184162; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bBF5cNkqgsxi1vrXpB4/gcyNu2LJ4ywbdnrTlXnn/Lg=;
        b=r72Rw2coC0f5oJrCLGYDoHpieGeVArKSTRCt1Xr+OlqnR6QJOGMPlu8JNLHoOmuB9Q
         ksepzCdGsWmIHF0QIndxlf5+lCC5WXTw5YubN72pINj4L6cH45hvFB5oMs9TCcf5mEIK
         yMVT9xlTUmx0mJg/5KR1JWs4nv+qn2VmByz3Wq9G3CKiI7G6tyydNOF1O3BBHg+EKBtB
         eeesRw0tXGBHPWBp9lb09u7NGYg+O6u6VxsrjCZWD10qSAB8g0e2rbhhNAz6bxDdrNpJ
         3PhebGHD26g39FD5rqITfngAXMqRGGZJaj6KwNKd8rSaD4iWkajkU8oWHRqJ4IWgTqcg
         Plxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729579362; x=1730184162;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bBF5cNkqgsxi1vrXpB4/gcyNu2LJ4ywbdnrTlXnn/Lg=;
        b=c0ka9fHjIiFuoEHemwtAuBBEGKS/L4zzN4Ntns1HkP46RijpLomdJRic5pGANGlKXX
         cASIjdYBHCdkrnjMZ9MStfoA/3W5jsN6ncFvxHLZfUECHkFJ7avd2aFdkrT0oE00qCBh
         bB0k6bmg2SMFkxo+uQwCsufLEq4eQr0KYGf7rc36lDIda3TQO7Zv3PQbCQos9Wd25hZw
         dE29hpRwmXTwstMmWgIOGKGkzQVYxHYhYlEaUdesyRkr+lSCf04muKDKO8HoMCtgC4ZU
         MpiOpPpSk/gdf6sjWyKNnTim04dkxJpXFSya7mqTxlE98E4gsuspTcOngrJSa8+XeA0A
         Zo1g==
X-Forwarded-Encrypted: i=1; AJvYcCXbsw4+Juj06PfRDjd3/jRQIiC8cga7bm6+lJhh3sCQz6ErpbYm0WJ6aYvxBQiOpyHJAlOUarp9mM2x/poU@vger.kernel.org
X-Gm-Message-State: AOJu0YxvTXGuXb3ATTMHmoVpZgXe+wmzE26IaONc/lmzlQpTH9FrHCD5
	oJyDd5fgoCL8YI5sL/r9c1RlJdiCJwBy6d9XBqcZEN2obH9YdzbUK7dTQBOdSF0=
X-Google-Smtp-Source: AGHT+IE8Pctc+SMNjOm5uqaCQn81QsnUvzzHg3ERtmeM4tf4V1+tucptfz2X/EcGNcR470ylu7wQDQ==
X-Received: by 2002:a5d:6c63:0:b0:37c:d0d6:ab1a with SMTP id ffacd0b85a97d-37eb488c77amr4471765f8f.12.1729579362217;
        Mon, 21 Oct 2024 23:42:42 -0700 (PDT)
Received: from krzk-bin.. ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0a37bb5sm5914984f8f.7.2024.10.21.23.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 23:42:41 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Melody Olvera <quic_molvera@quicinc.com>,
	Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH] dt-bindings: mailbox: qcom-ipcc: Add SM8750
Date: Tue, 22 Oct 2024 08:42:38 +0200
Message-ID: <20241022064238.22941-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document compatible for Qualcomm SM8750 SoC IPCC, compatible with
existing generic fallback.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Cc: Melody Olvera <quic_molvera@quicinc.com>
Cc: Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
index 2d66770ed361..ae574ec30918 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
@@ -38,6 +38,7 @@ properties:
           - qcom,sm8450-ipcc
           - qcom,sm8550-ipcc
           - qcom,sm8650-ipcc
+          - qcom,sm8750-ipcc
           - qcom,x1e80100-ipcc
       - const: qcom,ipcc
 
-- 
2.43.0


