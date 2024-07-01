Return-Path: <linux-arm-msm+bounces-24773-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6B091D922
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2024 09:39:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 726D4285B3E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2024 07:39:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE7A175804;
	Mon,  1 Jul 2024 07:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PIt63bSg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22195FB9B
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jul 2024 07:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719819589; cv=none; b=KD+QPOMhNoB6L6ezOrHmrlX6GGHTqfvyIsyfPLxtxOzNPg4gdeQU8O4oNEAJ/a5XeNRl0i3SCqfFLN/jRgJ0H790IfJ5TtMoO9PBbq14jReNcWMrTEaMRRMNwVp9v5+QaCpx+kKQjpIxNwQUiDIMqj2m5hzqjKA+dP8BpRdEv2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719819589; c=relaxed/simple;
	bh=l7CmpDx0OVT51yTSUKQ7OivFmec9RD8HJKyY4/LpEDk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=vEmt5NksPwiRtM9O94QAzJPJwr3QgWAC0rkEqP1qjWfvwovttxxMkjxdVU32WFk6N9+Y7rvP1uPWz4j0LXJnki2eLnKPzaPrBFugdbeeBdLbqmuAaLYdaxjKtG6GijYb3mEzNvbrCDttnpZu+eTgsXDai2WtCZ/XWBgB3aBJa10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PIt63bSg; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4255fc43f1cso18342555e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jul 2024 00:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719819586; x=1720424386; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4B9dNm2ieQc2Bk/AjzSpT1hZ88q/WKm0M218pzJl4ks=;
        b=PIt63bSgE90wUF77A3CEnqNrBkQuSJqziu/LkAvjdod7hXWwrxePAfw36UbsK3bMdq
         rJufPfBljcOlvdGduc9fSDfpiLTlhq+s1yeiViohWBYqkMbUU5edSBfZs4G18adKFX7f
         zOZTtsKXyVXgeLFhww+87tWbs2pLtrQpCUlbpa1QHDnEKF0l5TwqbWTeiQmW9TpdX1ja
         hvZirXtR69ZKFRCwjjYYIbdZDuBnkUIRRiS3Le3GKrd0yYLiEjZePkymYjBUfjhYnE3b
         OOjoan4mBcz8A9zIVMBro7i+TzU163JxTlgP+sEnWYNmAHTmLOX8ey6vAs9wYeOk2loC
         tpcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719819586; x=1720424386;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4B9dNm2ieQc2Bk/AjzSpT1hZ88q/WKm0M218pzJl4ks=;
        b=KxPottA2TQxfbzEMEUmFNHSPR1bUqN19hr9QHcgHThfOsuGpGCyJPxbDHSFiEnYDsu
         MbJrLxGlqnfn3bBVYIcFzHs119rcXeHKSrz5dZtZzocYMs9OfNJjORQIW281h1MFtQ82
         HN13lxtiQ4B6nwAWWHwPnFIpJgYAXGwhIY2vs/Z9pDw3vu/iuSi29LMZxOVYbFLiV23v
         DqQDG6pcghuQ9UHF2zaEDnUFxP18yATPJfbW2MZRTX7trG3VfuiM2qPBeT7UWDfV2sUM
         Rp8FZbcGZgQQ/rEPgHIANri0GFb5V3Bp3phM7seldsJ0Chx45ZvpnDLrbyp6Dmi/tPEf
         iF4g==
X-Forwarded-Encrypted: i=1; AJvYcCXXhw/lmF6RPanJ9HF09ZTDcnlyxTNewkel4vCTO8GhjAfFFDjmRy8VbcYzAsVK+OpsNxaTQuU96TagqrwdSiya29XhxyA38VO4QVm+EQ==
X-Gm-Message-State: AOJu0Yx08G6yydsB5KvTnuXm2k1aYp5OP5H+/AreBP9/RrUE/AzGdVGe
	TY1ao27/8kZmGF4gtdXnnnXMcozhvZL5796JmIs6BSyby0KunT10C5ky2omlT40=
X-Google-Smtp-Source: AGHT+IHwi9wQ7iu9omN0RZeIldhqGbPY9Yk8ZFtz7ksFEq8ByEQhX5wBxtlk/3yYRzB/D/lJIvLoQQ==
X-Received: by 2002:a5d:524c:0:b0:360:791c:afed with SMTP id ffacd0b85a97d-367756a3ba6mr3178457f8f.13.1719819586184;
        Mon, 01 Jul 2024 00:39:46 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0fb9absm9279936f8f.80.2024.07.01.00.39.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 00:39:45 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 0/6] ASoC: codecs: lpass-rx-macro: Few code cleanups
Date: Mon, 01 Jul 2024 09:39:32 +0200
Message-Id: <20240701-b4-qcom-audio-lpass-codec-cleanups-v3-0-6d98d4dd1ef5@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADRdgmYC/5XNvQ6CMBiF4Vsxnf1M/6Dg5H0Yh9p+QBOk2EqjI
 dy7hUk3Hd8zPGcmEYPDSI67mQRMLjo/5BD7HTGdHloEZ3MTTrmkJVdwlXA3/gZ6ss5DP+oYwXi
 LBkyPepjGCFwxVTTM0rJuSIbGgI17bifnS+7OxYcPr+0zsXX9i08MKKBFwaqaWS6qU+8GHfzBh
 5asfuKfZvWTyVezVpIxKVBWxZe5LMsb9CceQSkBAAA=
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1651;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=l7CmpDx0OVT51yTSUKQ7OivFmec9RD8HJKyY4/LpEDk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmgl04miXbCVi2whIvFXDGy/G8Yc1booM4gP/Yd
 EGO7UTr4v+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZoJdOAAKCRDBN2bmhouD
 11raEACIDCPfzgDMUPpRI7qxYBm+QvKhVXtPljGQ1KS/fnSzaFQTSduEey/7UhMliwzArc1bobj
 2RjtD/nYMy8O5uy5LqWKfIpDjlUSLpaKKq8dKecfgLg3QSly0TaFJojGqTgHDFP8dxOMYcjBsPK
 mDKL2Q+E69ofya307xc0aqKFtnppNnrfsLzewqabt+zfZ5LMgPtWDdZbbVsYv7ioTatdhhJXseC
 AlmO3jx7CaNrn8ePK9J6iVkdrJ3fk5CywEawUh/USF7F7Z/WaWAvWqn1e/5d0L6GDmajy5E09Jk
 aH8KCCHoelA7nHA5k8/m+0zs0g/269KPE8b6yZCeiCtnlMO+PVu1Pl4YhfKSOnw9+Lcuezz9mH9
 EeTjtCMzkmUKD0nyyVNk8at9mmjVuS8LHyUivQOdcDFsov1bAq5IhHVV02OEjStclYa8c8DURl5
 E2KysJF9RuuB1d0jjgaoglCq04/qw0NGqcO9vAW7JiRgJF5S7LMo3KsQHo1YkbbXxaYmMP9A+Zd
 fg4Dgpi4EcajNkzW8VU4AfJU5+b41qqZgFbNM/nwQwUsHRkvzCFHRwsFMXfIe2A6mtLtL1COajX
 5vOEA8K+EVkC36y8/lVVpKz9dNNzqF9Rc2cQPJnQALnFpoYXbYfStvEATeOwB28qbdelMSTb/0D
 Dm32U4t8lUDqAzw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Hi,

Changes in v3:
- New patch #1 to fix clang jump warning ("ASoC: codecs: lpass-rx-macro: Simplify PDS cleanup with devm")
- Link to v2: https://lore.kernel.org/r/20240628-b4-qcom-audio-lpass-codec-cleanups-v2-0-e9741143e485@linaro.org

Changes in v2:
- Use cleanup.h instead of devm(), therefore not adding Dmitry's review.
- New patch #5.
- Link to v1: https://lore.kernel.org/r/20240627-b4-qcom-audio-lpass-codec-cleanups-v1-0-ede31891d238@linaro.org

Improve a bit the Qualcomm LPASS RX macro driver and align similar parts
of code with LPASS WSA macro driver for consistency.

No external dependencies.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (6):
      ASoC: codecs: lpass-rx-macro: Simplify PDS cleanup with devm
      ASoC: codecs: lpass-rx-macro: Simplify with cleanup.h
      ASoC: codecs: lpass-rx-macro: Keep static regmap_config as const
      ASoC: dapm: Use unsigned for number of widgets in snd_soc_dapm_new_controls()
      ASoC: codecs: lpass-rx-macro: Use unsigned for number of widgets
      ASoC: codecs: lpass-wsa-macro: Simplify with cleanup.h

 include/sound/soc-dapm.h              |  2 +-
 sound/soc/codecs/lpass-macro-common.h |  5 +++
 sound/soc/codecs/lpass-rx-macro.c     | 63 +++++++++++++++++------------------
 sound/soc/codecs/lpass-wsa-macro.c    | 22 ++++++------
 sound/soc/soc-dapm.c                  |  2 +-
 5 files changed, 47 insertions(+), 47 deletions(-)
---
base-commit: feca1ff0cd5ab7bc3990ec5a387d81d4dff88068
change-id: 20240627-b4-qcom-audio-lpass-codec-cleanups-27175f1d069f

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


