Return-Path: <linux-arm-msm+bounces-54484-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1B4A8B5C9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Apr 2025 11:43:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B6B0E3A9D38
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Apr 2025 09:42:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86909236A8E;
	Wed, 16 Apr 2025 09:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="PozfDKmA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7D2235C01
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 09:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744796571; cv=none; b=k7/n9dkimBf9rHWdupjZP9D+70g+zLDsGeIXbk77eMW6sz/04yxOSDlujp0vYzvVBjyuNKSX9X0Yk7amOF2tr0YS4mM86CRFbkyycpiSG0r6+9I1N6x/q685k9S4TxLhzK6D8DGkmmpHH2s3RXVdZQObhd6T9UUmuBioxCFbPqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744796571; c=relaxed/simple;
	bh=mLJ4Tf1nLPctiytSz/i6Dp2hGBk3jLHIc3ugqrFs2rU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E6ybvQmPydN5YjeoLgUzRrPtoeo3mY55nmhmqRa5p8w7bUE483C8oeC+LoiCcgG70m3Dy9oFaiqQOFtmein9LfGRNN5RA/XFx7h/ajiXrAbsnnF/QMjhBdXjk30hjqJfjPF/GH81GO1IpiD8pkvuG2rrlyfRillKZ8ynfcgsRfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=PozfDKmA; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 726273FB72
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 09:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1744796562;
	bh=plG9gaqHpdJn3czPW5GlQNQARcLIZhVLphsTOud7Vpg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=PozfDKmAyc+3f9K6okjv4Il5+Ds+AfVp2OakctP2r+bRPQcQKt+8eKq12yf1dayHQ
	 Sw9JX9gpteCaohbdv3CULtVmBRF1rRl171G6gOpUUqO50uS6YSDshFyPLDEsdQGGEm
	 uNCRtN+wk0Mo1zWSBlycgufRxW9KMyHRHBstGSppZbIMzo05WdqlzhCKwXG6XkYN2p
	 17FxHbPZMG5k//rHd2p/+Ippsz2lEVXBF8xoPb3KWj/PWz/9mXK1i9ofz1RXC9DOhM
	 WDRsn85Xy0ys9gluyrnTzg8eFtTkuK142QKRwkySfZHp3kuv2S0q14S8EiF2A8Rmm9
	 H8UYNt9YX6HOA==
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-ac6b047c0dcso546604566b.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 02:42:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744796561; x=1745401361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=plG9gaqHpdJn3czPW5GlQNQARcLIZhVLphsTOud7Vpg=;
        b=F75H41mUVwKxUYoNa2jL/QI7tuQU4zKAnFA5mLHT5euLvyXMvFoRzt8Y1AsRTP77sZ
         ENi0CtS+NNn9ZgHDvo5SbM0rRV+/lj4jZZclh9hwzJepOMGrmBPWwUIaOPpcQmvIhJk4
         Emde+vCqI9FsA9RNx1mHy0JynWWJyEgvUfTnx7yCLgn4znljhRhpBwd3wAhS2qwQZr9C
         3+qc3cJWNo+TQrqeO+alS9adFi8hK94BAvGhV/1xxcbnMzc/o0w0pfaMkhXxy2qnHFto
         mIqfaAF6nQwWJLvAjGYKDgeD5TJMVShN8dMGyK4yyDhG8daJniw3YERJG3pkv0jSx2J+
         Tnqw==
X-Forwarded-Encrypted: i=1; AJvYcCUH4175Tmn1mxrM7IsO4J8FHAEE8k8f9GNfEvHIf8C5pJBnT0WndkJH18LgqYet8GM5riO3aFuaKmi/sJ8a@vger.kernel.org
X-Gm-Message-State: AOJu0Yyq8BmILU/djPzJN92GL4jN+QJFoXYE/Uoa6u1FSODTs/9V0n/e
	snnNyqi9MQrMjwjwEUh/pRgUxKvTlfYLeoZDQYYPagkOi2W0YQYU/UsvnpB3rY3a8mLGmFrJP9O
	8LjVs+GT8c/Wc5Pw9IFRL9h7RxbCIcoxFciRyMjyV2cNLHNY7sUObFuV+KN8r1VcPVbqB0+nr5Q
	o9i6c=
X-Gm-Gg: ASbGncvxpf9OJ9baLi7xjFs6ZgZtfW6/ECKBLJGT4/LKygIYOQB5rlN4xPqWQhjnae4
	v5lpwKNtPQ596hkQwVWYV6hFrHwilblbAeZ0ixEgD0Sy2wzOCM/+iloJVSUE0AIvAyBQ9BotMxw
	ZS95K7hoqKczJRipE0RO9FAaMhg0liS8mpeKA1bzOdd6qbH2cRbg+QZRJvv22O24WMEY7ei0LDX
	iseA77DFPonBRkJ9FT0l6XkjX9kT8PkckDRxW4F5uLl0oNsXZB9RZCOmFLKMqXrRnLo46ugQmIv
	kV2Hv3xfzdQGDBITtUXbfOIii+N1mNGZdNC6LaHR4uiN7OqmnxA/IRQs
X-Received: by 2002:a17:907:3d0b:b0:ac7:16eb:8499 with SMTP id a640c23a62f3a-acb428748c4mr105923366b.5.1744796561542;
        Wed, 16 Apr 2025 02:42:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG9eIbYj6AhANLL1nV9484szDS+uCNlV5sHee5tSc3JZlwU/uZvqyMAHl3VAItGwPHQOkHUEA==
X-Received: by 2002:a17:907:3d0b:b0:ac7:16eb:8499 with SMTP id a640c23a62f3a-acb428748c4mr105920466b.5.1744796561124;
        Wed, 16 Apr 2025 02:42:41 -0700 (PDT)
Received: from localhost (151-243-191-194.pool.dsl-net.ch. [194.191.243.151])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb3cd62256sm96378666b.11.2025.04.16.02.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 02:42:40 -0700 (PDT)
From: Juerg Haefliger <juerg.haefliger@canonical.com>
To: juerg.haefliger@canonical.com
Cc: andersson@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org
Subject: [PATCH v3 2/3] dt-bindings: arm: qcom: Document HP EliteBook Ultra G1q
Date: Wed, 16 Apr 2025 11:42:35 +0200
Message-ID: <20250416094236.312079-3-juerg.haefliger@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250416094236.312079-1-juerg.haefliger@canonical.com>
References: <20250408145252.581060-1-juerg.haefliger@canonical.com>
 <20250416094236.312079-1-juerg.haefliger@canonical.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a compatible for the HP EliteBook Ultra G1q 14 inch Notebook AI PC.
The laptop is based on the Snapdragon X Elite (x1e80100) SoC.

PDF link: http://www8.hp.com/h20195/v2/GetDocument.aspx?docname=c08996392

Signed-off-by: Juerg Haefliger <juerg.haefliger@canonical.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 618a87693ac1..67900d455ea7 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1131,6 +1131,7 @@ properties:
           - enum:
               - asus,vivobook-s15
               - dell,xps13-9345
+              - hp,elitebook-ultra-g1q
               - hp,omnibook-x14
               - lenovo,yoga-slim7x
               - microsoft,romulus13
-- 
2.43.0


