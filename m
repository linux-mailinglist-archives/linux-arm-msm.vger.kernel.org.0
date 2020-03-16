Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F0CB51864CE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2020 06:56:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729403AbgCPF4K (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Mar 2020 01:56:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:33748 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728856AbgCPF4K (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Mar 2020 01:56:10 -0400
Received: from vkoul-mobl.Dlink (unknown [49.207.58.45])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 09DCF20719;
        Mon, 16 Mar 2020 05:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584338169;
        bh=Xcm3VCGWPDSjzjBWP/2DDPJCVTGZoHkn7ClLV4hpJZY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=fyos1cYOuhdztfoMFbzdSR9WQC6oCxuOBTVt+78HZ5AuVDMLutix298LzTQh+nip0
         8vRx1wegs2WnFkDGegYjLGGwl9S0Xs9z1ViG65Jc3NaE5z4gacsrAHXpgm6XCyA+u3
         +mTM/VbynVPfgbUYSQAzBjlZv809naex/wXmq3i4=
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
Subject: [PATCH v3 6/9] ALSA: compress: add alac & ape decoder params
Date:   Mon, 16 Mar 2020 11:22:18 +0530
Message-Id: <20200316055221.1944464-7-vkoul@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200316055221.1944464-1-vkoul@kernel.org>
References: <20200316055221.1944464-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add ALAC (Apple Lossless Audio Codec) and APE (Monkey's Lossless Audio
Codec) defines and parameters required to configure these.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 include/uapi/sound/compress_params.h | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/include/uapi/sound/compress_params.h b/include/uapi/sound/compress_params.h
index bf6f7155e775..79b14389ae41 100644
--- a/include/uapi/sound/compress_params.h
+++ b/include/uapi/sound/compress_params.h
@@ -75,7 +75,9 @@
 #define SND_AUDIOCODEC_G723_1                ((__u32) 0x0000000C)
 #define SND_AUDIOCODEC_G729                  ((__u32) 0x0000000D)
 #define SND_AUDIOCODEC_BESPOKE               ((__u32) 0x0000000E)
-#define SND_AUDIOCODEC_MAX                   SND_AUDIOCODEC_BESPOKE
+#define SND_AUDIOCODEC_ALAC                  ((__u32) 0x0000000F)
+#define SND_AUDIOCODEC_APE                   ((__u32) 0x00000010)
+#define SND_AUDIOCODEC_MAX                   SND_AUDIOCODEC_APE
 
 /*
  * Profile and modes are listed with bit masks. This allows for a
@@ -336,6 +338,26 @@ struct snd_dec_wma {
 	__u32 reserved;
 } __attribute__((packed, aligned(4)));
 
+struct snd_dec_alac {
+	__u32 frame_length;
+	__u8 compatible_version;
+	__u8 pb;
+	__u8 mb;
+	__u8 kb;
+	__u32 max_run;
+	__u32 max_frame_bytes;
+} __attribute__((packed, aligned(4)));
+
+struct snd_dec_ape {
+	__u16 compatible_version;
+	__u16 compression_level;
+	__u32 format_flags;
+	__u32 blocks_per_frame;
+	__u32 final_frame_blocks;
+	__u32 total_frames;
+	__u32 seek_table_present;
+} __attribute__((packed, aligned(4)));
+
 union snd_codec_options {
 	struct snd_enc_wma wma;
 	struct snd_enc_vorbis vorbis;
@@ -344,6 +366,8 @@ union snd_codec_options {
 	struct snd_enc_generic generic;
 	struct snd_dec_flac flac_d;
 	struct snd_dec_wma wma_d;
+	struct snd_dec_alac alac_d;
+	struct snd_dec_ape ape_d;
 } __attribute__((packed, aligned(4)));
 
 /** struct snd_codec_desc - description of codec capabilities
-- 
2.24.1

