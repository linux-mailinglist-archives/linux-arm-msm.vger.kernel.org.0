Return-Path: <linux-arm-msm+bounces-30932-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EFF996DB4A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 16:13:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B9B3CB20F5E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 14:13:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99E8719E7E3;
	Thu,  5 Sep 2024 14:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Zt4sgAw3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA71719DF9C
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Sep 2024 14:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725545616; cv=none; b=Ei+bjTlxS7WmhSk82bIkvjV3bFVoLg63JjfbjAcGNll7R/gZxFK24okMkCk6MFvVdgAqDJ4pZzzp2huTuQlj82ZExtFhoWJIE7a+lAqvtKpuCKdwdLnSpld6faigC5QTEHMf7uSUR1PcDE6LqcfleRwQMHLLpOpSicoSvtkqvH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725545616; c=relaxed/simple;
	bh=zlMOkaW55Wb66ZAqUMFifodcdXXAMdzKlT7oh+mWeJQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mOeXh9P6JwIJtJKPRjH6C8jFZHOdW7NjER7eqr8Ec3YJT+YiXjgUcb2TrNyNsc0tjqpafyfG0/dAEKexk2bJ0H74FulgqJPSVozy8aRnvCJ+klylHwu36Me1S3taDfNiYOZTVPBOdwTMI3aHCt3uZ4zgita0xZDl446x7GsFbdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Zt4sgAw3; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-374c7d14191so1086518f8f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Sep 2024 07:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725545612; x=1726150412; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pQuewzaNngjcDOOQ0Aow82vVC6J65OqAycs2DlUmkZo=;
        b=Zt4sgAw3ZmtstHYPGrRGwNVxcNtrCbQj/marxRit+NlF5L8h239WBS/G2V0S+mze4w
         tSH3iDpV2oZeXiUOoX8Fq8h/RRdGHaaEVAlP41gv4wjHMI1GoA8ok8VkysdVp+QYorrU
         axrfYDS+ALids/VSYnDaP+mxa94a7HuK9iA/dBgKlZ+eHC+9QohlHNqAaY111d0SFLwf
         Q1gYiPWsc5iH3QG+hMV+UvI84QUpMpijRhwMOlLOQrsdQjE4PoxWz0zte2LU0YemPp3E
         AekdXJ+jbsnbVphLQg9eDzQ+xMwa6vbWHSgJGfguZWnqFCMYgmUYn58GizXWaiZ2T3Sr
         f4+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725545612; x=1726150412;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pQuewzaNngjcDOOQ0Aow82vVC6J65OqAycs2DlUmkZo=;
        b=XBc5D0Vf2oVEs4LGktCdBbdIIaIjI/RfqbVOu9p+bvlk4uewjtb04iu65OVSiyODUV
         Em6Ac4+NNR6OKcE7wSEKrWYZD3Z53p8Vqzskqddu/VzE2yI+Zj9URShTiMF+6FTmZxov
         K9HASU9bf+G1Bo0ZKt0IExFYs1HgEPdu5gLFWrN2sMlZ9EEpV+mVlVSb0CVDjpcsFF6F
         SwzLJ2+mc8+OsfkgOiEMFdbJTboNMbZ+TiaxEt+R5TfphdnaoGXB8fjj8l3gYtbfQcQF
         3S0X65IU0WEe+rWG7XXZg9/8IoUSuNPjRvACOkp1UQqQuJAyy+CzbPuSA3DRo3H0GLFc
         5HGg==
X-Forwarded-Encrypted: i=1; AJvYcCWJWw0/AjHfCBPxWiZLPB056ZQSIx34pdQ5q7/bS4z6J3FKuQ4NXCN6UeAwuVf9HYOiNwzbuiMkkGkG513E@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5tjsV3zcoxVvqR0rIGtv6HXRm3nNQS+jKGK52XrwoxUzf/Ro8
	70rI898JU04g76ljquwpP5fmS05w7Nnvh7YiV5I50QBt49TxaJQNhcJ3jjjkVv8=
X-Google-Smtp-Source: AGHT+IEqMw+2kphBD8AL47tz8mEmZuHpdof+C2fJJPrSK7gGZlJt0fkH5qGDaTFGsntWoEZveuTOWw==
X-Received: by 2002:adf:a456:0:b0:374:c613:7c58 with SMTP id ffacd0b85a97d-3779bd185fbmr4162384f8f.29.1725545611138;
        Thu, 05 Sep 2024 07:13:31 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:4763:343b:23f3:f45])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3749ef81146sm19514621f8f.82.2024.09.05.07.13.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 07:13:30 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 00/13] ALSA: update sample rate definitions
Date: Thu, 05 Sep 2024 16:12:51 +0200
Message-Id: <20240905-alsa-12-24-128-v1-0-8371948d3921@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGO82WYC/0XMywrCMBCF4Vcps3ZKMqSSuPI9xEUuUxvpRSZVl
 NJ3N7hxc+BbnH+DwpK5wKnZQPiVS17mCn1oIA5+vjHmVA2kyCinOvRj8agJydS1aDn5YKKyKRm
 op4dwn9+/4OVa3csy4ToI+3/mSFYTGXItKW1V51DjPchz5vUc/GfMQbiNywT7/gUSmCnRoAAAA
 A==
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Cezary Rojewski <cezary.rojewski@intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, 
 Liam Girdwood <liam.r.girdwood@linux.intel.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com, alsa-devel@alsa-project.org, 
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3160; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=zlMOkaW55Wb66ZAqUMFifodcdXXAMdzKlT7oh+mWeJQ=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBm2bx9Rt27YuEl+t/28l1DzL0bq/aw0aPG+xyMs
 P3ISqYgUY+JAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZtm8fQAKCRDm/A8cN/La
 hX38D/9ovEPkT3Cdm6h/ix/ywvp24EQmKKZ3cy1CIVrIDMqy05UHAjwcsPllY7DezngTTiaeejA
 stPW/OsTKkDllAAbw8PX7q0eKTp0udn9BRQaYfKz9vSkDaXDgpM4f82Yj2mGwSzHtby0EY7WmO4
 CUYLtTavSyEtndrRnq056qUDZnwMSFHdRNLrMwkhHZPMOuMYcu9Fg/cdXVzopgFC0cPWcNXv+xt
 mxOsOvlwQNBbziHBZspOcvEpocfhL/1OAXurjQRtdYinwyg3tokeIlDFFZXe1szwSzOq3XrtLcE
 e4jcQi4cO4NHjcngVCHclnJtNMFNQIG5b54I8Fx3VjrqTmk7Ru/dUzqerln/WoUH3DYYFsiOsbg
 V6J1Lvbmq5pcFNKkm1R/w6gPmKAMrX68f4oXMz0Sn8n7YKng4GocbREm5LzIcqXF9vOki8GZUbg
 WJwskALFndic23zjavZZ2honWm+d8rZNqzJQHZbWslukrbpPTUEvorrajC0mS7jrf3BowWTslhS
 kjkNERBX8LTdPCbT09ll4l881blOSlxxz/rT/fUBMW5h2jexZ8YuRKisA77H+x8KeBAfTlXSN9o
 cR06agIcgoG8PusLU8buKcXLfDHfxQB8p6T2MRJOLRLkLFIAvhkteDdcDV1kIh7MK0m/JfGir2I
 O865q1eD0MuKh6Q==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

This patchset adds rate definitions for 12kHz, 24kHz and 128kHz.

It is follow-up on the series/discussion [0] about adding 128kHz for
spdif/eARC support. The outcome was to add 12kHz and 24kHz as well and
clean up the drivers that no longer require custom rules to allow these
rates.

Identifying these drivers is not straight forward, I tried my best but I
may have missed some. Those will continue to work anyway so it is not
critical. Some drivers using these rates have not been changed on
purpose. The reason for this may be:
* The driver used other uncommon rates that still don't have a definition
  so a custom rule is still required.
* The constraint structure is used in some other way by the driver and
  removing it would not help the readability or maintainability. This is
  the case the freescale asrc drivers for example.

There is one change per driver so, if there is a problem later on, it will
easier to properly add Fixes tag.

The series has been tested with
* ARM64 defconfig - spdif 128kHz at runtime.
* x86_64 allmodconfig - compile test only

Last, the change adding IEC958 definitions has been dropped for this
patchset and will be resent separately

[0]: https://lore.kernel.org/all/20240628122429.2018059-1-jbrunet@baylibre.com/

---
Jerome Brunet (13):
      ALSA: pcm: add more sample rate definitions
      ALSA: cmipci: drop SNDRV_PCM_RATE_KNOT
      ALSA: emu10k1: drop SNDRV_PCM_RATE_KNOT
      ALSA: hdsp: drop SNDRV_PCM_RATE_KNOT
      ALSA: hdspm: drop SNDRV_PCM_RATE_KNOT
      ASoC: cs35l36: drop SNDRV_PCM_RATE_KNOT
      ASoC: cs35l41: drop SNDRV_PCM_RATE_KNOT
      ASoC: cs53l30: drop SNDRV_PCM_RATE_KNOT
      ASoC: Intel: avs: drop SNDRV_PCM_RATE_KNOT
      ASoC: qcom: q6asm-dai: drop SNDRV_PCM_RATE_KNOT
      ASoC: sunxi: sun4i-codec: drop SNDRV_PCM_RATE_KNOT
      ASoC: cs35l34: drop useless rate contraint
      ASoC: spdif: extend supported rates to 768kHz

 include/sound/pcm.h                  | 31 +++++++++++++++++--------------
 sound/core/pcm_native.c              |  6 +++---
 sound/pci/cmipci.c                   | 32 +++++++++-----------------------
 sound/pci/emu10k1/emupcm.c           | 31 +++++--------------------------
 sound/pci/rme9652/hdsp.c             | 18 ++++++------------
 sound/pci/rme9652/hdspm.c            | 16 +---------------
 sound/soc/codecs/cs35l34.c           | 21 ---------------------
 sound/soc/codecs/cs35l36.c           | 34 ++++++++++++----------------------
 sound/soc/codecs/cs35l41.c           | 34 +++++++++++-----------------------
 sound/soc/codecs/cs53l30.c           | 24 +++---------------------
 sound/soc/codecs/spdif_receiver.c    |  3 ++-
 sound/soc/codecs/spdif_transmitter.c |  3 ++-
 sound/soc/intel/avs/pcm.c            | 22 ++++++----------------
 sound/soc/qcom/qdsp6/q6asm-dai.c     | 31 ++++++++++---------------------
 sound/soc/sunxi/sun4i-codec.c        | 28 +++++++++-------------------
 15 files changed, 96 insertions(+), 238 deletions(-)
---
base-commit: 785f4052380684dbcc156203c537c799e2f4be09
change-id: 20240905-alsa-12-24-128-8edab4c08dd4

Best regards,
-- 
Jerome


