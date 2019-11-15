Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AEE55FDB51
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2019 11:27:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727142AbfKOK1f (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Nov 2019 05:27:35 -0500
Received: from mail.kernel.org ([198.145.29.99]:49482 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725829AbfKOK1f (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Nov 2019 05:27:35 -0500
Received: from vkoul-mobl.Dlink (unknown [106.51.108.125])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5C866206DB;
        Fri, 15 Nov 2019 10:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573813654;
        bh=bxGJpK7tv7bQQozkMi1XqMUsT6+l0OMXL5gob7QPqgY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=fEDenBFl6KVKiecFUu8HgEUpWy3sCD5ee//Xa4t73KpmsONmOp0KF0/M3T+t+HX5X
         Ndu3gZi7a32+shXpgB9uJ4S8j2jFZQYqv9OLXnSMi6u/007ILHDkd0kOetTnSVcHrO
         3bxc3r08CpP2WLbThfCgBT9BfAItGGE+Sipg2f1Q=
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
        alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [RFC PATCH 1/3] ALSA: compress: add flac decoder params
Date:   Fri, 15 Nov 2019 15:57:03 +0530
Message-Id: <20191115102705.649976-2-vkoul@kernel.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191115102705.649976-1-vkoul@kernel.org>
References: <20191115102705.649976-1-vkoul@kernel.org>
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

Co-developed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 include/uapi/sound/compress_params.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/uapi/sound/compress_params.h b/include/uapi/sound/compress_params.h
index 3d4d6de66a17..9c96fb0e4d90 100644
--- a/include/uapi/sound/compress_params.h
+++ b/include/uapi/sound/compress_params.h
@@ -317,12 +317,22 @@ struct snd_enc_generic {
 	__s32 reserved[15];	/* Can be used for SND_AUDIOCODEC_BESPOKE */
 } __attribute__((packed, aligned(4)));
 
+struct snd_dec_flac {
+	__u16 sample_size;
+	__u16 min_blk_size;
+	__u16 max_blk_size;
+	__u16 min_frame_size;
+	__u16 max_frame_size;
+	__u16 reserved;
+} __attribute__((packed, aligned(4)));
+
 union snd_codec_options {
 	struct snd_enc_wma wma;
 	struct snd_enc_vorbis vorbis;
 	struct snd_enc_real real;
 	struct snd_enc_flac flac;
 	struct snd_enc_generic generic;
+	struct snd_dec_flac flac_d;
 } __attribute__((packed, aligned(4)));
 
 /** struct snd_codec_desc - description of codec capabilities
-- 
2.23.0

