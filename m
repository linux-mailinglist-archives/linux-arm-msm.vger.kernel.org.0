Return-Path: <linux-arm-msm+bounces-1601-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B51E57F543A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Nov 2023 00:09:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E50AC1C20AC4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 23:09:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2292D1D559;
	Wed, 22 Nov 2023 23:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b/xO5qee"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com [IPv6:2607:f8b0:4864:20::d2f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7426D1AE
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Nov 2023 15:09:15 -0800 (PST)
Received: by mail-io1-xd2f.google.com with SMTP id ca18e2360f4ac-7b017766ac8so8607139f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Nov 2023 15:09:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700694554; x=1701299354; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vGPBNCqlVNas6AbndJSN5DY6WrC0n52CMV5MihrDmb0=;
        b=b/xO5qees7EqkpwXoWTBlJQDwkyPae1Bap/fGD0Fipu5RkIHG2W6oApLYzpXUohWZD
         Lv6TknkduSPuANWvpbsIPmVXnUzu7St2MUn3IdEEeF7yC3WItp3d5BH7cv3N09JzqOFy
         4ChCRD0pIT1ZyvNatukLevgsoLC//KHllmbfIZnqaDhLEXPlpYACTLJUfe+A7YsIaBAB
         wE+6Sw8R8+MKwt9ftzXoqlPF4yyojvnRfZN/6q586uHBX5dgtB/E+qTNzYHt+cL8yP1s
         3VILge6YFxko+3VZQgyH8x5SMAMndeH1DEk8cQba8TAU4Pcf00ulgLTzO91FSRo/adYD
         8A5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700694554; x=1701299354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vGPBNCqlVNas6AbndJSN5DY6WrC0n52CMV5MihrDmb0=;
        b=QXMg3mipU3oLGHdPZrZVmiHrNLebZ/TQMMYN4qCjQxEkAWynerhqtG9Va700Lg6WYK
         pV8aiPAExLGGZDmZr1gvwM+F+ofmM+8X5z5400EHNcHZkrrppOSvePDX8qABbb9NYWce
         Yk0N+4Pw6CHL2nEemEOUC/F8EO3PCqqMcNP/4ABg8nSLHPthJnZUK9tAxVWwJSP5BBNr
         mTVVegniZzYOUAOLSW5r+USHWuUQcyVeA1x4pIHwkNjLUDDrZWtzTsZazvEdkXou2QB0
         932LxrgVORFyiGgfyC676svRMTPQSfYE2pNU+0jPRq0faDukQ8oU+v0xqEj3kZby03MK
         OpsA==
X-Gm-Message-State: AOJu0Yz3d3euxzZrDkHQUH41zzDYuehfGjHI+Z052hVaf1p9Db0XS/km
	xdiHGFOS9yROq5MzTBAdiWJKnQ==
X-Google-Smtp-Source: AGHT+IF7dOhUvqzK3l8JX28iP7y9sInGo8bawEHOVGUWubN6lD0OrylMu/vBfpWrPKRkI2Laj9ticA==
X-Received: by 2002:a05:6602:3713:b0:7b0:63ab:a2c2 with SMTP id bh19-20020a056602371300b007b063aba2c2mr4122698iob.20.1700694554628;
        Wed, 22 Nov 2023 15:09:14 -0800 (PST)
Received: from localhost.localdomain (c-98-61-227-136.hsd1.mn.comcast.net. [98.61.227.136])
        by smtp.gmail.com with ESMTPSA id fm29-20020a0566382b1d00b0043a20ad93c8sm117754jab.41.2023.11.22.15.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 15:09:14 -0800 (PST)
From: Alex Elder <elder@linaro.org>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: andersson@kernel.org,
	konrad.dybcio@linaro.org,
	agross@kernel.org,
	mka@chromium.org,
	quic_cpratapa@quicinc.com,
	quic_avuyyuru@quicinc.com,
	quic_jponduru@quicinc.com,
	quic_subashab@quicinc.com,
	elder@kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 1/5] dt-bindings: net: qcom,ipa: add SM8550 compatible
Date: Wed, 22 Nov 2023 17:09:05 -0600
Message-Id: <20231122230909.895482-2-elder@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231122230909.895482-1-elder@linaro.org>
References: <20231122230909.895482-1-elder@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for SM8550, which uses IPA v5.5.

Signed-off-by: Alex Elder <elder@linaro.org>
---
 Documentation/devicetree/bindings/net/qcom,ipa.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/net/qcom,ipa.yaml b/Documentation/devicetree/bindings/net/qcom,ipa.yaml
index 2d5e4ffb2f9ef..702eadccdf993 100644
--- a/Documentation/devicetree/bindings/net/qcom,ipa.yaml
+++ b/Documentation/devicetree/bindings/net/qcom,ipa.yaml
@@ -52,6 +52,7 @@ properties:
       - qcom,sdx65-ipa
       - qcom,sm6350-ipa
       - qcom,sm8350-ipa
+      - qcom,sm8550-ipa
 
   reg:
     items:
-- 
2.34.1


