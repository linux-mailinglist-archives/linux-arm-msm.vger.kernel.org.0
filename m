Return-Path: <linux-arm-msm+bounces-1895-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A187F856F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Nov 2023 22:28:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 10C03282747
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Nov 2023 21:28:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 407AA3BB28;
	Fri, 24 Nov 2023 21:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A36MXDXj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80B4AD41;
	Fri, 24 Nov 2023 13:28:29 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-a013d22effcso319356566b.2;
        Fri, 24 Nov 2023 13:28:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700861308; x=1701466108; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EgxFuLlgH3HM3q2BEScFWv/UaGPrTtpxNJHVYrNWfFY=;
        b=A36MXDXjdH8vLdc+3JwdHBmBWAqtulHau3qnl8WhgCat54zQUWYcR0edlgrFN9nYsr
         6xMO5YsT1fCtHTaqAnvRRjWpzPoYrWlIQpzABzrLy7USxC+yXzJs93tgSc8u+2JbLmEh
         ymnFvyGQG1OmOq+oJ1IW3XMZz/4dU5iHdYid7BuaecbzSZo4GLMyIjRvoyf0c6UJfFza
         PvwH0Cyx3fGnXotVPx5kTxTc4znMpFU72SIBNxBeGrFfR7DRH8FficC4JX9YxGSwDpk+
         YBRJ062xmwKXit3VD22b6V8aIKlrbOTSDFqmiy16zjTFgBZXrReGM7msitVLcI1wFxyj
         M/Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700861308; x=1701466108;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EgxFuLlgH3HM3q2BEScFWv/UaGPrTtpxNJHVYrNWfFY=;
        b=LL/3fI0ht0NNUE3EnemtzDuoU/R4FsYYWr+JTJrN8DoTmR2ANzGMXxlZqsfo68It2g
         REzU5K1m22ux4+AG3/qCAT28T0Tmq1wW/E5ZfO+/jFLm1ZUHfd4AE4epmEUi6csYWLBl
         lycw/jR7O9dZ0PmvuJUn1MbqJ/ob17t6u4MxE/rEoVQ3CXkac++xBwgtvsK3PTpRL2Gb
         sh1EHSFtXet7rN210L6FcJg7G5TzBOj5iq+/kuwfCAJ+w2aSHuR1JWTE6xScuY/0UsE1
         BRf6FTly6wNBoSXNB7adxkhKeEkXDSh3Tiu3Wv1a9CcCgMG7edq9k0OQSiS6QSvYce2c
         SCag==
X-Gm-Message-State: AOJu0YzGRxA0JjOKS66xkiKyVGcFnrrh7HLRn8WIy92QjP/9av17usD5
	tw+7EwjBzJNfOsaBnPjUYug=
X-Google-Smtp-Source: AGHT+IFeiagFA7FwlKDnDbRYuXKqW6azCJ0MnV15PtiuWdZrap2O9HO/Q2I73Q+h0vB/O9HIpQd3DA==
X-Received: by 2002:a17:906:73c4:b0:a01:f06b:77c8 with SMTP id n4-20020a17090673c400b00a01f06b77c8mr3314784ejl.2.1700861307436;
        Fri, 24 Nov 2023 13:28:27 -0800 (PST)
Received: from StrangerPC.home.arpa ([2a0d:3344:1730:e300::11a1])
        by smtp.gmail.com with ESMTPSA id n20-20020a170906119400b009fbdacf9363sm2520849eja.21.2023.11.24.13.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 13:28:27 -0800 (PST)
From: Luka Panio <lukapanio@gmail.com>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kees Cook <keescook@chromium.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G . Piccoli" <gpiccoli@igalia.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Cc: Luka Panio <lukapanio@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v10 1/2] Add a compatible for Xiaomi Pad 6.
Date: Fri, 24 Nov 2023 22:27:31 +0100
Message-ID: <20231124212732.731419-1-lukapanio@gmail.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Luka Panio <lukapanio@gmail.com>

---
v2:
Update commit message

v3:
Update commit message

v4:
Update commit message

v5:
Update commit message

v6:
Update commit message
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index adbfaea32343..1bfae1b237d2 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -965,6 +965,7 @@ properties:
               - sony,pdx203-generic
               - sony,pdx206-generic
               - xiaomi,elish
+              - xiaomi,pipa
           - const: qcom,sm8250
 
       - items:
-- 
2.42.0


