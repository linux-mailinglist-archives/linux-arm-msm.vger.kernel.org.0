Return-Path: <linux-arm-msm+bounces-64485-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 34770B01172
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 05:00:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0489F1C811F1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 03:01:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CA3F19E81F;
	Fri, 11 Jul 2025 03:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BipYl5Zw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB65C19AD89
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 03:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752202821; cv=none; b=pmVUQRmL+XH7tHEPe2+dkGAjF7E9hAqvdgoF2VNFpiT6KEEmA2llQ+65qnNdeB0zYpPU4SjkL0r2GQdlZl4s7OGdolU6DpMl/mfqlv4Xyg6+f9rTdSpue307g0c6GVId0epKpl24onunziTiNp6hNhK6fiIjRUjChP48o2CJzes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752202821; c=relaxed/simple;
	bh=5MIvJ0dgsrFZQooch+SFPSiVUKGE2pGyg4740J8aJX0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D/QFfghFtHH/3Q/gel/p8bUtpZJajPNsVNPboN+jpjGq0ve53AP65KbZGkHy/q/GSARMElJomyjOWJyZWjpUa8Rwbft0vAAbVIxXzBzylj99Iuox6idWXon5IUFaHx47HzEFbGrQxOexFIhUK/SbMi6i0ZcgZMyzmVSlDijL478=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BipYl5Zw; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4537edf2c3cso16814045e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 20:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752202818; x=1752807618; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PItV10s0cZSW+yN+a8jyJUy2gpJRDMCrOerQQhZoaU8=;
        b=BipYl5ZwCMkqSFqVnqRGFrqXP7lFCUjIYj+xiVYE513PcboaZxuwHUNVao5IQsXYKE
         R0cPwOJX8Ustpl88t0Q1Dh56XSS9o6+T7tgLnQYj0UNq9mem468DDHEY1xGg2NVHUUQ+
         ywvKxH3orTrHCMuT6tCnh1dY0MVE190bZrSZMbmsIW12l5Kn8OjbD0jsTlOv9wWaflEP
         L1HyeTG8w6rS3yPBRKbpUh7k/R28iVbIZv8xoSoR2pDfxBAWlnAVKLEWO0VeF6C+q9Tc
         4OqcL2uqrrkXAD8z2XrZ8Gk1pZJ8ZB2ZoCXTH7wtkuHumxG5AtAu4QdEtp4BpwULo1tJ
         Gvww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752202818; x=1752807618;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PItV10s0cZSW+yN+a8jyJUy2gpJRDMCrOerQQhZoaU8=;
        b=tyELHt+ByY65ke5p9Aeg/pIR7uw1npMZW8UXgjuY6gef2x1JiYOoWDlfuGx5zT3hWz
         nSLVkCzwUdplQj8H+gsgWonrvtLUe3RDX7svpZPeWrWyS92zGmHVh3p89IN9es2mSFSJ
         kX2dokoaPBBjYok5B8I/rghYFmB7gG5/y1bdX0FNpcz9KbP3A/JlYkeOhqCWU5Q0tTff
         uT+Q24ONh74B/RyyTZFt9sIQVKNS9Ul6iwQUJKXFVDssQM3fKDqA0euZW4HITliliCvP
         lA93wlxp6x0zTnX7a0hjzjDyVijXHl5H7DrZfscqO3pbErk8YIz7BNDpR/n37VXTrddN
         Wtsg==
X-Forwarded-Encrypted: i=1; AJvYcCV+IpPCL1oT2cxC33V0TKT6mITSY69kqNjKZYY+saK2x/ZukaEY61tAoBrdr2PSLGp130DqZ83idSconEA+@vger.kernel.org
X-Gm-Message-State: AOJu0YwE4ukXH+MBwpVTq3r05Gj3Omrt0BtiQQ4BikFvu01/MRBFXgXO
	1P05f/nESpy0DTBVjNkgjAQ3Bt1eIkhcIYQOr1Qxin47bsw3IOihHixtXxdgu6Yiz+Y=
X-Gm-Gg: ASbGncu1vVfbk6iZyR0Xxl2h3bFkTOZb4icttJwmp3mcMp8ETcAdd8rdyiH2v5JLIii
	43cUtt8I9CfpUDb7JePByxPdwCjnqZxYGIgS11tV7HNKyfQwDsXs/1uPaNUh93BG6jf3rOnHc3l
	BlgWmw4lNgfA0u9zABZrsBdJg8lMfpd5+CAmzLIZttkCbu9L/o9Tsg7kHB+VR8HuP3iM45XznXX
	5rAwS0PR5by76gTT8V832UCQWcR8g/w2ZRWGjAXsrgR/VKK4Q74fd64JqGelTnsaW5PjZKuqfap
	9PWC1bO4ha/QqCWKH7iuencxONS2uI6ff05EDg9Ep7/TZUsyOs1Up6nGy5KPkfS1kaI/JKRVMt6
	gR/GimtRhnhd8CK9g4sL0UoAQwKV5eA==
X-Google-Smtp-Source: AGHT+IGu2ldXw3cTzJ/uXsfrw6SXkpbJlU3IpHW7dkiNBEJvGWLqmXfnAmpjdfy8ipaz837wikLWnQ==
X-Received: by 2002:a05:600c:628e:b0:450:cff7:62f9 with SMTP id 5b1f17b1804b1-454ec2769e7mr8969525e9.22.1752202818181;
        Thu, 10 Jul 2025 20:00:18 -0700 (PDT)
Received: from orion.home ([2a02:c7c:7213:c700:e4ad:f2d9:9dd9:cbf2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454d50fa9b4sm75424355e9.27.2025.07.10.20.00.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 20:00:17 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Fri, 11 Jul 2025 04:00:12 +0100
Subject: [PATCH v2 3/3] MAINTAINERS: add Qualcomm PM4125 audio codec to
 drivers list
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250711-pm4125_audio_codec_v1-v2-3-13e6f835677a@linaro.org>
References: <20250711-pm4125_audio_codec_v1-v2-0-13e6f835677a@linaro.org>
In-Reply-To: <20250711-pm4125_audio_codec_v1-v2-0-13e6f835677a@linaro.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org, 
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, 
 Alexey Klimov <alexey.klimov@linaro.org>
X-Mailer: b4 0.14.2

Since new audio codec driver is added the get_maintainers script
should catch the new files.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 41d95e7c60c629338fbab8e6b001029de3c4695b..3ef80be4f2b6dc07cda7a6418eddb7a07ff28962 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20221,6 +20221,8 @@ F:	sound/soc/codecs/lpass-va-macro.c
 F:	sound/soc/codecs/lpass-wsa-macro.*
 F:	sound/soc/codecs/msm8916-wcd-analog.c
 F:	sound/soc/codecs/msm8916-wcd-digital.c
+F:	sound/soc/codecs/pm4125-sdw.c
+F:	sound/soc/codecs/pm4125.*
 F:	sound/soc/codecs/wcd-clsh-v2.*
 F:	sound/soc/codecs/wcd-mbhc-v2.*
 F:	sound/soc/codecs/wcd9335.*

-- 
2.47.2


