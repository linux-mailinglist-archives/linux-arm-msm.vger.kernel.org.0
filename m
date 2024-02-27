Return-Path: <linux-arm-msm+bounces-12718-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3067869812
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Feb 2024 15:28:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 09BD2B2418E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Feb 2024 14:28:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D612145B32;
	Tue, 27 Feb 2024 14:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pevypelx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2445114534C
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Feb 2024 14:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709044056; cv=none; b=C0/n9HjyB40ykXFQ/pvMbwkYBUCkOzPj3P5oFY/P+imQcGLbPhs+hLSYJjSAdDbTFPOkdY9XwFE/UozTsb2GF1GE6Skk6jpUmr2McpGXl8b/9BU2t9Dqi6PXq7gPWgCdLMxX5NA5fczwg2ioH4ty5ThrH+3hfU4IZ551m3cmzss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709044056; c=relaxed/simple;
	bh=ab6q27R3QlFLFfpy8puelAUfdFCANtrxW82g4p7AAaY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=T+buYwUCsxeqyZz+/RLIFIWSAGHwfJU/ntRBX8auBWBZsx/XQ1FLjlsnxs6QvfIN/4GBt/fPlKb21F+KgHW74DbqfNzVSeUzjHoL6TLlFkH6sVpbwqEEb7mbm+P2Z0G0020zzvxYTuoyncN5n6DuNIjbMxZ01cmgXnUXX/IUerw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pevypelx; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-56454c695e6so7562155a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Feb 2024 06:27:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709044051; x=1709648851; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nsr/AiI0N0LjdjI2GsJqDjqyT+l1PI1B8gFeuYj95io=;
        b=pevypelxVUn9u8BZ9ayxMCkHazDRu/0KV1ltZNr6QC6TF+DKYXYNbiNCdWz0CV7Ytk
         pDNKsZbWYo1T9qlU3kLhHy3OhocuuEYZHWYr5V6wZX1rJnNbAZLK7sZXbBtGCpe17mdI
         n8GAnZeS1dSXTPRiuKfC0Zb1895kjxDIEOT4bWhdHouH4iLjNYSLXVshaeg5El7M8/1f
         qeodq3OJUYRPgfX7ZDx1isbsZzrY+obvujDE2PGPWfq0kv8GHcop32XibVs6YWxpw595
         INzVjT0xNoAI2v1TJ1aejGpNQc1jrJlgb/LaBSWRhrXEzEAs9cZ8EIK5kt2AMH/gUeQ1
         TdqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709044051; x=1709648851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nsr/AiI0N0LjdjI2GsJqDjqyT+l1PI1B8gFeuYj95io=;
        b=mKZwwUTN91YufrMv85gnFOu8Zzligt71igPXnJVs3Z6o/i99hqtXW+P+RtNJ1UAP6e
         v7SpxegqyzNw3Dhv/bxL4EXbred7rsaUyU5OuRYFMeEVRB1imsOlH6xqNgzlO9ll4sA4
         5nJnIYKXbABKR5OfzGDUXBRCLTbkoFHUkF9HSD9YeuiQi8DXLFxfqu/dUj3or+kpJW71
         oijoo5A8jrhik+TCBjaVKrym7aO2huZkTX0tiXNQhvGOsUpMDvIDFZD3ISxjDd9aldGI
         MP+n8ERIWijAu6qR5yj7lhaeEO8LZUuHXpGzcX/KrLZwDUN9yjxWo5FrRz9rNtV+feRK
         HvyA==
X-Forwarded-Encrypted: i=1; AJvYcCW43bF2BXCqBgeG59yO2O21cyyCrRkWyd6WSH3fMmASsYPbnXjy81fnUZfLocifzuvEyad3D60zl3GzGDBRC1VIaE8zHmKwwk02WPa1Qw==
X-Gm-Message-State: AOJu0Yynf8F4JIUULfptZkSmmSsFX80ubsi8UUlPiQKoty06mVDf2ZlW
	Z9k0MxC7QQp5mwCMhyQSW9cQoQqoaf+6TfUFvOR75VnXxOyd3aI6gZ7A86Rqwbk=
X-Google-Smtp-Source: AGHT+IFusTJZzlMLAmX1/SlunCdlq9zrBA5BARec3/3Z2lzwXCSXw2wRXASMrtR7vVo7sQdCMlx+Mg==
X-Received: by 2002:aa7:ccd4:0:b0:565:f077:d872 with SMTP id y20-20020aa7ccd4000000b00565f077d872mr4712627edt.15.1709044051484;
        Tue, 27 Feb 2024 06:27:31 -0800 (PST)
Received: from krzk-bin.. ([178.197.222.116])
        by smtp.gmail.com with ESMTPSA id u16-20020aa7d550000000b00564c7454bf3sm813689edr.8.2024.02.27.06.27.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 06:27:31 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 3/3] arm64: defconfig: enable reset-gpio driver as module
Date: Tue, 27 Feb 2024 15:27:25 +0100
Message-Id: <20240227142725.625561-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240227142725.625561-1-krzysztof.kozlowski@linaro.org>
References: <20240227142725.625561-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Qualcomm X1E80100-CRD board uses shared reset GPIOs for speakers: each
pair out of four speakers share the GPIO.  Enable the reset-gpio driver
which handles such case seamlessly.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 3f44aebafda8..746ea4499e72 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1473,6 +1473,7 @@ CONFIG_PWM_VISCONTI=m
 CONFIG_SL28CPLD_INTC=y
 CONFIG_QCOM_PDC=y
 CONFIG_QCOM_MPM=y
+CONFIG_RESET_GPIO=m
 CONFIG_RESET_IMX7=y
 CONFIG_RESET_QCOM_AOSS=y
 CONFIG_RESET_QCOM_PDC=m
-- 
2.34.1


