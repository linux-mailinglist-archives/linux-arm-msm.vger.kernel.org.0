Return-Path: <linux-arm-msm+bounces-62569-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A61AE92FB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 01:51:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 43B8B7A9032
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 23:49:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 482952D3EDB;
	Wed, 25 Jun 2025 23:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yhv7BtNq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D0C287267
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 23:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750895444; cv=none; b=RvLyDS6NDsKKxidptzRWTVu05T1QL7i0Uj5oQmp6CeqAZhpAJwmiD9SRLwXHufWG+5j+FM0xI6gA93Pvkxg1bq6CtQYNT+aweo4aCDdmmgByr/p2IclbG0V1W+G+kvzlT7DcHcwuvGl9BWW7V6HA0RBCXMo/drKLL3xCmcbPGhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750895444; c=relaxed/simple;
	bh=yys+Y7kH+kxLmahkOFj8+wmPki8hhBTm+J6+LUsRF8U=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Lj5ynu17XoFKwH1rfzcNXLWlnoXk6NMD8ZT52ZfjL6UFQ/AfxeUV/0d4/1VZrQlJorMpGWflERFO/eqUGRfNhX/88ay+rSzCr701G9vNy1lxvK/cLzsE0j5h7j9z3Y5RrNtNhbE0oae6VQQZ/Y+VGu4FzrbnlROMpw4QvRv86CM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yhv7BtNq; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a54700a463so283269f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 16:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750895439; x=1751500239; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sVbzmXkQ+ioipLbjuwvN0ILc+ibg7MYD7cUDUXAebNM=;
        b=yhv7BtNqbpyavOIBpqsRlzQa6f64l3Dn1m6lbrAycpE3Ub1fbUExC5KnmvzjENAR70
         uoiyE5F9fBmFkzJkUfN3t+SRpsJ9PDU/1JM3wdTjtcVLLyhp2/Hu/10JxN6iM5kF370m
         lMf44EkTewORRBo9eUF+4iJQfWD1Z8CDfLAjDqRT8/BxvoBR4L4+NuhSQLg0bkgECck4
         Hb0B/wjqGqdImfIJJk+qZ1ayLKuojIGWcjYYVtk9IxKV3RndExzAVsuoBepvQGafQGvT
         N8oGWV84BMxO5ZFrlYmyRECJEHbtO5mJ83ksJT8oWpomHqBbR0ipWLBnpEJ1OJaiUHCe
         xOfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750895439; x=1751500239;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sVbzmXkQ+ioipLbjuwvN0ILc+ibg7MYD7cUDUXAebNM=;
        b=XKcR9+OX+9yxlOFM1N4HpRAPh67MoO1YxMwmNOFTnKCqUInGL/Tw/JOf/cN91YkM4t
         o4pBM5YHRHZB+vHbXzDcXaXy1CThs2joAIXTh1pAD+aPynlY/b4PTf0Ti9OYs9jH2KyD
         C8zHJvUdi5RU49YjJ4+7VWMbJ/Tj3fRX8WFOyuEmY4YRJS6YcZtb9c74Xbux/YnwtnDf
         KHbGhcwLMBfzM5muReZs12sO5fA9aLG02avuTR8hXjDuQ0iJE0Adm2cwNJlsDEezxnMa
         6NPtr5CvE3Z4J5LzXI1Kzav8LoStmCSxoktjiJBikm0sanSGHIQdHyKXr0cbKuA+91cW
         AMvg==
X-Forwarded-Encrypted: i=1; AJvYcCV+5ZdRXvBOxpHKOI5Nuca/VcGuUoQFxMYgk9x55tbmf9c/l/AYeZteZLJVoPI8f4SsZ6MW1c16u/bl0XmL@vger.kernel.org
X-Gm-Message-State: AOJu0Yyqo+SZ/7+XBK2rXhgYbJ7VIJy51XbH69MmY5sfmVGsuIPOa4HR
	78lgIyI7s/BmK23wjCE4a2m70GdN9iBnv748wExstMIAhXpjaeoAD0coernJXcQnewA=
X-Gm-Gg: ASbGncspGJbs0GzpuixPSijEmi2JlAMrl4QFcLUWTlslviNybpeDINQTmOj9TlSaUSt
	xTVTxFa9K+hCMpP5FTpjv1yaxhvKzkzlXifHvGbc778bdFeQw/GuCIH33ssseIbJ3NGmdFo32Q8
	yXLQMPdt0HuImB9++0crwY/Fuexm9ReMEq7eswDrqbbJjnDB5ZTGATvKHuLIs0X3dBwaMiy1zXT
	s00uN8VjlIIyEsQjBBElgiJBTBGE5MjewoI5k5pE7MjjscBzKeG8RPV8ljyhwRWv03wKrlrNypL
	DdWYT7hePp/oH6+d1dPtpQpAKrPw20B0kWM41K2bkzEHkPNb1ixeLpcLE66UZYsGZPnyvQ==
X-Google-Smtp-Source: AGHT+IHiNkMf63E27GyHyQ9CDnHOV87nvjoonLrt5SqyVkwL3YcXeaYC1SQaCHL9+wqWnnxtVniKgg==
X-Received: by 2002:a05:6000:400d:b0:3a4:dfbe:2b14 with SMTP id ffacd0b85a97d-3a6f311aab6mr1095295f8f.16.1750895439285;
        Wed, 25 Jun 2025 16:50:39 -0700 (PDT)
Received: from orion.home ([2a02:c7c:7213:c700:1417:1313:3884:915e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e805dc32sm5636300f8f.29.2025.06.25.16.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 16:50:37 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Subject: [PATCH 0/3] Add PM4125 audio codec driver
Date: Thu, 26 Jun 2025 00:50:28 +0100
Message-Id: <20250626-pm4125_audio_codec_v1-v1-0-e52933c429a0@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAESLXGgC/x3MQQqEMAxA0atI1lNI46jgVWQoJcmMWWilRRHEu
 1tm+Rb/X1A0mxYYmwuyHlYsrRX+1QDPcf2pM6kGQuqwp95ty9tTF+IulgInUQ6Hd0gch9giijD
 Udsv6tfP/nT73/QBuaNTdZwAAAA==
X-Change-ID: 20250626-pm4125_audio_codec_v1-02ca7a300ddc
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

PMICs like PM4125 have in-built audio codec IC. The series here
adds support for this codec driver: DT bindings and codec driver
itself that consists mainly of two parts: soundwire devices and
codec part itself.

This audio codec can be found on platforms like QCM2290 and
on Qualcomm QRB2210 RB1 board.

We are working on this together with Srini
(srinivas.kandagatla@oss.qualcomm.com or srini@kernel.org)
so this is shared here as minimal working driver and more commits on
top of this are expected that will add and extend functionality.

Currently with this set the playback via line out or headset work.

This driver also has a bit limited support for concurrent playback,
since line out path is connected to left input channel.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
Alexey Klimov (3):
      dt-bindings: sound: add bindings for pm4125 audio codec
      dt-bindings: mfd: qcom,spmi-pmic: add pm4125 audio codec
      ASoC: codecs: add new pm4125 audio codec driver

 .../devicetree/bindings/mfd/qcom,spmi-pmic.yaml    |    4 +-
 .../bindings/sound/qcom,pm4125-codec.yaml          |  147 ++
 .../devicetree/bindings/sound/qcom,pm4125-sdw.yaml |   86 +
 sound/soc/codecs/Kconfig                           |   19 +
 sound/soc/codecs/Makefile                          |    8 +
 sound/soc/codecs/pm4125-sdw.c                      |  485 +++++
 sound/soc/codecs/pm4125.c                          | 1848 ++++++++++++++++++++
 sound/soc/codecs/pm4125.h                          |  375 ++++
 8 files changed, 2971 insertions(+), 1 deletion(-)
---
base-commit: 2ae2aaafb21454f4781c30734959cf223ab486ef
change-id: 20250626-pm4125_audio_codec_v1-02ca7a300ddc

Best regards,
-- 
Alexey Klimov <alexey.klimov@linaro.org>


