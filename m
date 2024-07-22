Return-Path: <linux-arm-msm+bounces-26750-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B5895938CA0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 11:57:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2CCDC2837A0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 09:57:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D01AC16C86E;
	Mon, 22 Jul 2024 09:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TbzHNfLF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 237A116C437;
	Mon, 22 Jul 2024 09:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721641936; cv=none; b=eishTYswVoroD/93HbAsoPab37cUt7EgQBnQdBxLlSOPB+uSfiFD0wvjXR3dw4ZbJKMzXEEsb1Cmw8RPuj8RSDqYiXmSgmxJlnHu77TXlhLyE1mnHsSU9Xz/ZIPE/n/WmTWknpXuDI6PGnce8yBqgvqbxAdBSKvKxzHaThiIVdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721641936; c=relaxed/simple;
	bh=0LjKiXktDHZSweMPPr1G1Ui1nNR6eQAesBAToZ8LpPw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Nbr1PLCiYZH4EgSblMrPTdZaRl34wdMCK1Om1CtHqTc9Fwm/1EAiNOlONQAMdi6IYw+KtJ5z3rTyXJle4XGTXMOk9BjZKG1w9iAseDtucEa/u5djL14/OYXcjO+eVVLCs9C2+1j1X9jBAPO/WeCjJt3H1M+GG2qKXfMMnpEbbR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TbzHNfLF; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52f025ab3a7so1361634e87.2;
        Mon, 22 Jul 2024 02:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721641933; x=1722246733; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M9E2WTC0jfBaQQGfChBxNUT7+lSWee29QeSeHVUI7bU=;
        b=TbzHNfLFhpMVKWrJUMr1TkZyd2XluCdoDEj8ZZM+D+Y9MZlSEaIkzhTIXvEXWZCBWj
         wHh/izlQWQa2XoWYrskT/vcB9cdl44wcDmbofuJVfUs9iFjO9TsnYCZjjIUlhNS/n2Y/
         NpCLsVErqHxiUJmzYK58RgwT7ET4+fed9VeHLaArt8PWLOlQpYa/eVwq+mzQuFXV+ZP8
         THcwVPH1Hcg51MOG3R8VCs6VNmPWUTRFN17DXOL0UwGT77P6HYA3Nus8EwQLoqSQ26/5
         1tfoK6kzdBIaLFw4PhzqEM0RST0pTbX6XomIxVp7JgI0W8aJH/Mdg5/8rW/ms0KGbRUH
         DohA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721641933; x=1722246733;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M9E2WTC0jfBaQQGfChBxNUT7+lSWee29QeSeHVUI7bU=;
        b=HbFp2XP7tH2XKf9jLdcCdNb83G+6iTLGom9pJf+GOCzRFVq9ga6Y5mARxF+WsRNZYR
         Av8te949VH9m4dcMqutdy+uHA18CoFvxv0nDpiVzY5EU0/FMcdwpShFatd00RfxiCkbd
         TAhrYqoIHg+SBoPEilvFOhpyUUqJcemT120IM7aAmrvjZfR0EUjWt42xjXmXdyvYqOLK
         c3jPIdiZlfVWvXrdoPvtU0WUJephWQ2QwBuHb4NL78ASMFwXULQ7wNJdFw9Eg4Ab7rkq
         L2ImNYTtcFsPKU8V4c7yGm4uh/rfmKvFMN5KKmexiya4SVuTdfPnatvhgKACcJ7xAdT+
         Nttw==
X-Forwarded-Encrypted: i=1; AJvYcCXELQbYfAYDsMxOqCo5QXnx1pKvi5x5hOgGd3oALjcZyH+zYzH7HxEZswXtjOR+9JE7HKRdhPwFHqj+nBJ7TXyz/Jllm1EpHPPnRXPQuKHFhBhsKFmBBv5cLCNiX8Z8TjUfmInOm7s6ja6wUOiGj9Mv4PEcMN3eXTHIwHsourVlaOFdnWfUmocfu7skAgUTrSFo6Z1lOq/RpkEAFze8YsKaazLhnA==
X-Gm-Message-State: AOJu0YydCQJiwe3XF9BcVG5AmtV3VDiZ/7c2sABy6G19DFKElvo83UWp
	x7a8fvo7HAPlLjhQ2czJ+1EKu0a4zpfnXVrKvSdmwboiws3IkB/l13/RRA==
X-Google-Smtp-Source: AGHT+IHUrVK9nAGRcepdpcmmyoaKs3owYskKR6lrL0H9J1qjEWYRZA/UQF9/9MY/4zXr/4CmzISjbA==
X-Received: by 2002:ac2:4e15:0:b0:52c:a016:5405 with SMTP id 2adb3069b0e04-52ef8d859f8mr4808575e87.8.1721641932543;
        Mon, 22 Jul 2024 02:52:12 -0700 (PDT)
Received: from localhost.localdomain (byy214.neoplus.adsl.tpnet.pl. [83.30.44.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52fc226cdccsm91552e87.164.2024.07.22.02.52.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 02:52:11 -0700 (PDT)
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
	linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] MSM8953/MSM8976 ASoC support
Date: Mon, 22 Jul 2024 11:51:04 +0200
Message-ID: <20240722095147.3372-1-a39.skl@gmail.com>
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

Adam Skladowski (1):
  ASoC: dt-bindings: qcom,sm8250: Add msm8953/msm8976-qdsp6-sndcard

Vladimir Lypak (3):
  ASoC: qcom: apq8016_sbc.c: Add Quinary support
  ASoC: msm8916-wcd-analog: add cajon and cajon v2 support
  ASoC: qcom: apq8016_sbc: Add support for msm8953/msm8976 SoC

 .../bindings/sound/qcom,sm8250.yaml           | 28 ++++++-
 sound/soc/codecs/msm8916-wcd-analog.c         | 63 +++++++++++++-
 sound/soc/qcom/apq8016_sbc.c                  | 82 ++++++++++++++++++-
 3 files changed, 164 insertions(+), 9 deletions(-)

-- 
2.45.2


