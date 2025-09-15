Return-Path: <linux-arm-msm+bounces-73609-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EBEBB58202
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 18:28:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E3DFA3ACF0A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 16:28:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1066D286D49;
	Mon, 15 Sep 2025 16:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q3xE58ip"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C2C1283683
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 16:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757953681; cv=none; b=op6o/GfvNTrkl16qAShEihFNyKX4Yuq+TJESzPzrRRzuy7qCFdMBegNJZOteUVoop+RKvEs+lVVb92ytUb0j2mY6elPuza9Rpf7oZr0qSRVCMdF73jcdreuO9nGZX/FCkP0ea6nUkh08WJVgXrniM96SRoyquOVPu7CyYFQRm4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757953681; c=relaxed/simple;
	bh=byM1gA6NVIvRuKX+ikW9/WDAziLBwNxEBiTHEmh/nMY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bq5nv5qLNzGhfBbv/bmTwiZFD+ANDguU0XmNZb3Ai8uoe5UVG0X5togmEGrbEUjh7qGL7+wViru84thedixe/mtpmgU4WYKSaxjwjvUWqgb9z5wWrGf9d3HiWzYX7JJDp4RB1n24yWFeMKVOwvYFiQkdKBAyq9xXCYVi4veEz4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Q3xE58ip; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3d44d734cabso2782597f8f.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 09:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757953677; x=1758558477; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=seV1ou3zNHbYzr8foh2H3pTmGgfBvTOop43lTeUOhsE=;
        b=Q3xE58ipTos/IEQRJV7dxxcfzkEXK7y8F5twR/h6sizkSdroW1OvfObKrVXR9MfEm5
         BkeoTNY/3lzh+frdlwpXQxNklRa8TvKQGT4CYzICoNoKwQ0zDCOu7xTRj2/eCtGYrZZN
         91xOK0Bi+WwG86u+XMt+wYHPn/HlERpP1ehTcmPTtbQShPOpxJA67IqdvUyHxwQ4UYeK
         VQc/2ZR9bgiWo1CBahcqzGICp+jwngYdbxtZBdHTRfRiylJrmYDFHDpB4VtbEfeTeaXi
         NOSjLO/t8qxts56KMRPWVhtyo1LMlZTQF6UcL5V/zRXVnPoPpfZNunQ5yLcwqHEDPjZ5
         cydQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757953677; x=1758558477;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=seV1ou3zNHbYzr8foh2H3pTmGgfBvTOop43lTeUOhsE=;
        b=KJHxBkzgJerA4cJpalt+fHIkaRA6FjOJ4gGtfG4Xn5HE88QeZAkIFqJ33p5N5T+kd8
         kzoxV0OXC+P2svKR06oRAL/AWiEZrfMa9CU9T7ZvAJAgsAr250diLKoT3kHUSjYxERTU
         VZzkiDm5AsTBsdULISlp+Y9zLNPpS/lzV0gVejwt+h+cKGU/xFSDkmN56YU10xJiiAIF
         B302sd1Yvs7c6CjJBxX7AVekCF/EUbZzqPrHiIXvSqPPFonLT/1J0rTKJyCO/GFBe6YN
         OCrd1ge8hLa1OTCXm0MiVMiCoOUC0jBsN2t2Sqa9mXCmj1nGNFdTjy0lIqEnVtz2Uz/g
         EpcA==
X-Forwarded-Encrypted: i=1; AJvYcCX370jU8XlH1EvwRtfBzhl9XXJqV05kflajp/BQ/ghTioSUgV5cpUYovaNOd/zbf8WxKIyooVifFPZj5jpV@vger.kernel.org
X-Gm-Message-State: AOJu0YxQETPUcV81TqAE2jmahtljeO30e5uTJE7/5Pficdv8K2pZVYQF
	NvyZ1WV4nm8d5mLb8ujeY8vVPzUbb7r79H2wJgki+mDik8o+rWtEj0Mn/HGehEv6ILw=
X-Gm-Gg: ASbGncuLW8XRY95+e5/fqa3KJQEI5akrQKsejWMyK02Pf/7JUET0ake4Z21HOZ8NYxn
	6BjtMX25Fx57S0y8gPU4S1M8HBzjFSd3qY9ARVIrN9wuaqGP1AkusK5jE87y/I9h+5g+XlPtccn
	UOAmcZb107mfRVj3BRuK236Hiwz7wZZZKCCUQUV16NtFxU/NLmNdEcpVcvxaVgwsQbXddaxZsah
	lsYw4mN2srZqp/dQBHHTBW1Rv6+CagqMju8yQ910REKWeOB6i+FIQhi4rpECGYW/1XDnqsPxdtk
	fpmffD+duqP9j9jBUtDOpUgV/m3UUqmlYo+P/W14/mikfM58t/5l46osjfIlPQk6o8Nxkqucszd
	nKWPTphhnlEoc/FMMVLR0AOjZj+NL0Qe7K2JgS1s=
X-Google-Smtp-Source: AGHT+IHfqSjdbY1hyVmBlldv6pS0JxrU4vVEyDVh7UVEJQC2k7uVsawo4o6Z0mdIDJELMnXHIe67JQ==
X-Received: by 2002:a05:6000:2509:b0:3e3:6b81:b482 with SMTP id ffacd0b85a97d-3e7657995f7mr12205876f8f.28.1757953676692;
        Mon, 15 Sep 2025 09:27:56 -0700 (PDT)
Received: from orion.home ([2a02:c7c:7259:a00:e60f:4b6c:1734:808b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e9a066366fsm7857989f8f.44.2025.09.15.09.27.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 09:27:56 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Mon, 15 Sep 2025 17:27:51 +0100
Subject: [PATCH v4 4/4] MAINTAINERS: add Qualcomm PM4125 audio codec to
 drivers list
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250915-pm4125_audio_codec_v1-v4-4-b247b64eec52@linaro.org>
References: <20250915-pm4125_audio_codec_v1-v4-0-b247b64eec52@linaro.org>
In-Reply-To: <20250915-pm4125_audio_codec_v1-v4-0-b247b64eec52@linaro.org>
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
 christophe.jaillet@wanadoo.fr, Alexey Klimov <alexey.klimov@linaro.org>
X-Mailer: b4 0.14.2

Since new audio codec driver is added the get_maintainers script
should catch the new files.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index fa7f80bd7b2f8bd2099acb9f38070498e7b1cc7e..b799748af2cbb47d048c70c7b30c9ad191199954 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20720,6 +20720,8 @@ F:	include/dt-bindings/sound/qcom,wcd93*
 F:	sound/soc/codecs/lpass-*.*
 F:	sound/soc/codecs/msm8916-wcd-analog.c
 F:	sound/soc/codecs/msm8916-wcd-digital.c
+F:	sound/soc/codecs/pm4125-sdw.c
+F:	sound/soc/codecs/pm4125.*
 F:	sound/soc/codecs/wcd-clsh-v2.*
 F:	sound/soc/codecs/wcd-mbhc-v2.*
 F:	sound/soc/codecs/wcd93*.*

-- 
2.47.3


