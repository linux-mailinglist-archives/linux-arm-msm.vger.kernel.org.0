Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46F061864BE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2020 06:53:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729437AbgCPFx0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Mar 2020 01:53:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:60928 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728856AbgCPFx0 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Mar 2020 01:53:26 -0400
Received: from vkoul-mobl.Dlink (unknown [49.207.58.45])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 73E1620663;
        Mon, 16 Mar 2020 05:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584338005;
        bh=fav0e6BWDeDdivYQ/SkFENddgLAX5a/6g0+IGVmth2Y=;
        h=From:To:Cc:Subject:Date:From;
        b=Q0b+tXpMOVnur56dryjDx2lmcm54YI4ojm12uRH54p/LdI420B/qk4UeAJtKecNlU
         21K1PfTRjcTYNBwUyPEu0KNKay2XotlGiy76D/C5eD7LnJClMh4bpgo2uhvVXazt3H
         pPds8agIb30XVLvLyXhwQU+0SOnCooKMlrzur49I=
From:   Vinod Koul <vkoul@kernel.org>
To:     Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Patrick Lai <plai@codeaurora.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/9] ALSA: compress: Add wma, alac and ape support
Date:   Mon, 16 Mar 2020 11:22:12 +0530
Message-Id: <20200316055221.1944464-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series adds more WMA profiles and WMA decoder parameters to UAPI and
then support for these in qcom driver. It also adds FLAC and APE IDs and
decoder parameters to UAPI and then support in qcom driver

This was tested on Dragon board RB3.

Last, bump up the compressed version so that userspace can check for the
support.

Since the series touches compress uapi and asoc, it would make sense to go
thru asoc tree with acks.

Changes in v3:
 - add r-b from Srini
 - use macros for FLAC channel layout tags

Changes in v2:
 - use bitflags for wma profiles

Vinod Koul (9):
  ALSA: compress: add wma codec profiles
  ALSA: compress: Add wma decoder params
  ASoC: qcom: q6asm: pass codec profile to q6asm_open_write
  ASoC: qcom: q6asm: add support to wma config
  ASoC: qcom: q6asm-dai: add support to wma decoder
  ALSA: compress: add alac & ape decoder params
  ASoC: qcom: q6asm: add support for alac and ape configs
  ASoC: qcom: q6asm-dai: add support for ALAC and APE decoders
  ALSA: compress: bump the version

 include/uapi/sound/compress_offload.h |   2 +-
 include/uapi/sound/compress_params.h  |  37 +++-
 sound/soc/qcom/qdsp6/q6asm-dai.c      | 139 ++++++++++++++-
 sound/soc/qcom/qdsp6/q6asm.c          | 243 +++++++++++++++++++++++++-
 sound/soc/qcom/qdsp6/q6asm.h          |  51 +++++-
 5 files changed, 465 insertions(+), 7 deletions(-)

-- 
2.24.1

