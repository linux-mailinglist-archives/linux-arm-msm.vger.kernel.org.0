Return-Path: <linux-arm-msm+bounces-27126-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AD0F793E06C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jul 2024 20:20:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1FFD31F21829
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jul 2024 18:20:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 220B5186E47;
	Sat, 27 Jul 2024 18:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fLBQgegb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C7C7288BD;
	Sat, 27 Jul 2024 18:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722104446; cv=none; b=Yzz/yHTq4zzdGZ7ZL7sqmbWDdR05G3wq49C9WK2vU9GO9LiCC38XT9gpp7RHEgGJl/jC2i2rd1+YK9ggVewjBJGXdWBHMzAJMMcFNpDGrFpocf/HTL4eo6ZVsH47nLURQaDJpZkv6lt7AOEWTopcfC3UYCunKWhQExOWmdi6rII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722104446; c=relaxed/simple;
	bh=3Lh1BwhVeqRnEATXFageAXiylnoLj5EisM5J8nNNO+w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NrJfynAJeCrBzH8R4dK5e0j8d+YS4rzCduBEhIs7e/JOY4eRqCpIpvjcgOvqhrtg/j7CwPLbhLNiBjJKWeLLsSL6ezpLd0irpfxmErPMHbMlBHYtsHaMKllz7lLjWyFn/xwz4SrRIdIfzaUQkQ6V1Ma2QBhNmSUWFyo2Xoif1cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fLBQgegb; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2f0dfdc9e16so21871781fa.2;
        Sat, 27 Jul 2024 11:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722104442; x=1722709242; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WxFUyWe0lcthVY5bBYHT4KxjaYpQ0TGg/fnnCJonf3U=;
        b=fLBQgegbcWnOfKExeNz98EDEn/2MonZFJV8gncht3fQ4v51OhIUPqfmdciDQTzCkcH
         JSeDWATZMUYL5OLeOR9CYcDc6UevFJj/+inK1UHbnaIOUOfyPHH71BxdxyKTOasfsnuS
         MkGv1jZdgB/gpeZLFuEDQ/RlyWcRIqe2azuA+fjTUQt8zV9Lw6w8MWSeqqXYLKiG68jO
         fSFCutTyEG0cNPlwKrY2Xecg2xUIZuzGusVf+a2/qiePw44G98+pzDcK053Oln5hlwqx
         gEoONCGLw4Ve+and6tIZ+4G1knRLTanW7lLyDdk89g3csd6PyXFoC29wbgu5FVjHEiKE
         g0lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722104442; x=1722709242;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WxFUyWe0lcthVY5bBYHT4KxjaYpQ0TGg/fnnCJonf3U=;
        b=RO/h74plrMOo9olyILSkkASdPK9Rtow5ZhFUmpa99rcWVcEw+/VFgwVPZ+iozidhPw
         jKB5c5D3PEx2xGVVV6wi/jcF28OLYubDYKuF+e6OU9koVz4UX7KRP6ubK3Y6o1fy3q86
         MmL0bnxdm7sODxgPOlcIq+kqWABBgxMa9xRTq/8PqWLSyb4QwpjS0V3O9KxKchd/dxdQ
         gfttRvHqscyntDWK/SUsiZCvvxN3G9aOknEa4Xbuyijfe1ZhiXKuqRqCz5pJFKdOGh69
         cdGMyXkzvnNL/Mp5QQku694/mt9oIgYb7zvhR1oFzRN41VKvvi+npsVR/mbdwj75sots
         bYQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXoET85MXpQDr61k1qZcbtF5pvZrbkZYcg+7pzYnWos2c4gjJXE/TWTPxxz+SidoGeGl9OK/rgGfIQOItgzF4RH4KSxkjusT8dmiW2sCglmH60Z97Ah5UyTYtVlMt4j4LdKiMUzK6FTZVwlVusPgK0HLZoSzEGCfxu+IdFG/hoNXN2y7GRRdIzrZOYcCNZvNcFUZewomQFmD/qWf5XK+7ZGnyL04g==
X-Gm-Message-State: AOJu0YwZoFzOCErTDOjLQXM65EuXTXRyLsL/bZIvrwJK9F1VlvYkkkx1
	4s4+/lA3CqtatSXvnp/B2EKVXdjNqVBQ1kG/4srTQ+2/+tREoF8O6tiaFQ==
X-Google-Smtp-Source: AGHT+IEu0dt6qpt6W9qSkNlLYQ68T+/D93Gf2dnEZ2mPYWT0uQCbffw2RtHL1SdmIIuqusSF1cnhUQ==
X-Received: by 2002:a2e:9795:0:b0:2ef:2fcc:c9fb with SMTP id 38308e7fff4ca-2f12ee47152mr21852671fa.36.1722104441734;
        Sat, 27 Jul 2024 11:20:41 -0700 (PDT)
Received: from localhost.localdomain (byw127.neoplus.adsl.tpnet.pl. [83.30.42.127])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f03d077226sm7504891fa.126.2024.07.27.11.20.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jul 2024 11:20:41 -0700 (PDT)
From: Adam Skladowski <a39.skl@gmail.com>
To: 
Cc: phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Adam Skladowski <a39.skl@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Stephan Gerhold <stephan@gerhold.net>,
	alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v2 0/4] MSM8953/MSM8976 ASoC support
Date: Sat, 27 Jul 2024 20:20:23 +0200
Message-ID: <20240727182031.35069-1-a39.skl@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce support for basic sound card setup on MSM8953/MSM8976
platforms, document new compatibles and introduce support for more dais.
Most of code is sourced from msm8953-mainline fork over github
with some changes implemented by me,some basic changes are 
mentioned in each patch.

[1] - https://lore.kernel.org/lkml/20240723083300.35605-1-krzysztof.kozlowski@linaro.org/T/

Changes since v1
================
1. Rebased dt-bindings documentation based on Krzysztof's split patch[1]
2. Resolved clang errors by guarding ret verification inside if
3. Switched quin-iomux to devm_ioremap_resource to not fail on msm8916

Adam Skladowski (1):
  ASoC: dt-bindings: apq8016-sbc: Add msm8953/msm8976-qdsp6-sndcard

Vladimir Lypak (3):
  ASoC: qcom: apq8016_sbc.c: Add Quinary support
  ASoC: msm8916-wcd-analog: add cajon and cajon v2 support
  ASoC: qcom: apq8016_sbc: Add support for msm8953/msm8976 SoC

 .../sound/qcom,apq8016-sbc-sndcard.yaml       | 51 +++++++++--
 sound/soc/codecs/msm8916-wcd-analog.c         | 63 +++++++++++++-
 sound/soc/qcom/apq8016_sbc.c                  | 84 ++++++++++++++++++-
 3 files changed, 186 insertions(+), 12 deletions(-)

-- 
2.45.2


