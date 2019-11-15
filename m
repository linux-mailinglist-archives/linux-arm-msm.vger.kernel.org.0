Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A97CFDB4F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2019 11:27:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727368AbfKOK1a (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Nov 2019 05:27:30 -0500
Received: from mail.kernel.org ([198.145.29.99]:49416 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727180AbfKOK1a (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Nov 2019 05:27:30 -0500
Received: from vkoul-mobl.Dlink (unknown [106.51.108.125])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 89AB5206C0;
        Fri, 15 Nov 2019 10:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573813649;
        bh=3MTIp3EVNTi3pvV+fHXDuaEdbhizPCO8hiADThBPsC4=;
        h=From:To:Cc:Subject:Date:From;
        b=0pNE3cJFCKKJSbBsfE6KujE7e3TK1Rx5HbjMLI09Yc4TJ6W0YwH2R32B08BOYiyVu
         /QptkQZPCeK1MCCpBfuXbz2pjXbUHpythsdbzI80zSnRo4F7EgrSecjyjE4bQxHmJZ
         zbhEseG4zftbLT+1WnQpkRbxbaQK6L8cZxaowZoE=
From:   Vinod Koul <vkoul@kernel.org>
To:     Takashi Iwai <tiwai@suse.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Patrick Lai <plai@codeaurora.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [RFC PATCH 0/3] ALSA: compress: Add support for FLAC
Date:   Fri, 15 Nov 2019 15:57:02 +0530
Message-Id: <20191115102705.649976-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The current design of sending codec parameters assumes that decoders
will have parsers so they can parse the encoded stream for parameters
and configure the decoder.

But this assumption may not be universally true and we know some DSPs
which do not contain the parsers so additional parameters are required
to be passed.

So add these parameters starting with FLAC decoder. The size of
snd_codec_options is still 120 bytes after this change (due to this
being a union)

I think we should also bump the (minor) version if this proposal is
acceptable so the userspace can check and populate flac specific structure.

Along, with the core header change, patches are added to support FLAC
in Qualcomm drivers. This was tested on 96boards db845c

Srinivas Kandagatla (1):
  ASoC: qcom: q6asm: add support to flac config

Vinod Koul (2):
  ALSA: compress: add flac decoder params
  ASoC: qcom: q6asm-dai: add support to flac decoder

 include/uapi/sound/compress_params.h | 10 +++++
 sound/soc/qcom/qdsp6/q6asm-dai.c     | 35 +++++++++++++++++-
 sound/soc/qcom/qdsp6/q6asm.c         | 55 ++++++++++++++++++++++++++++
 sound/soc/qcom/qdsp6/q6asm.h         | 15 ++++++++
 4 files changed, 114 insertions(+), 1 deletion(-)

-- 
2.23.0

