Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 887E6184134
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2020 08:09:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726387AbgCMHJQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Mar 2020 03:09:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:58336 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726216AbgCMHJQ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Mar 2020 03:09:16 -0400
Received: from localhost.localdomain (unknown [171.76.107.175])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EF10220409;
        Fri, 13 Mar 2020 07:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584083355;
        bh=2HHtMQ/oq3CtVwVJ1RMLryfUOU4xqIkyYyt4FkFInU4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=IUPKa6UHmHqG2wrCYo/fRPrehhLUdlUT1kQUURDnW9MOJAIJ/PDri9+GGmFv8l7lG
         PQFg1vTx4bFgramvlWSPrdB7dG1Ld1t8jrsn4v7ZItpdlr3uM23txFIb1eP4nAIb5+
         gsY1Xz3EnQkzPtgpNZ4pTAaAryWG3h8h9LL4s07c=
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
Subject: [PATCH 2/9] ALSA: compress: Add wma decoder params
Date:   Fri, 13 Mar 2020 12:38:40 +0530
Message-Id: <20200313070847.1464977-3-vkoul@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200313070847.1464977-1-vkoul@kernel.org>
References: <20200313070847.1464977-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Some WMA decoders like WMAv10 etc need some additional encoder option
parameters, so add these as WMA decoder params.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 include/uapi/sound/compress_params.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/uapi/sound/compress_params.h b/include/uapi/sound/compress_params.h
index 634daa354b58..19d69d626573 100644
--- a/include/uapi/sound/compress_params.h
+++ b/include/uapi/sound/compress_params.h
@@ -329,6 +329,13 @@ struct snd_dec_flac {
 	__u16 reserved;
 } __attribute__((packed, aligned(4)));
 
+struct snd_dec_wma {
+	__u32 encoder_option;
+	__u32 adv_encoder_option;
+	__u32 adv_encoder_option2;
+	__u32 reserved;
+} __attribute__((packed, aligned(4)));
+
 union snd_codec_options {
 	struct snd_enc_wma wma;
 	struct snd_enc_vorbis vorbis;
@@ -336,6 +343,7 @@ union snd_codec_options {
 	struct snd_enc_flac flac;
 	struct snd_enc_generic generic;
 	struct snd_dec_flac flac_d;
+	struct snd_dec_wma wma_d;
 } __attribute__((packed, aligned(4)));
 
 /** struct snd_codec_desc - description of codec capabilities
-- 
2.24.1

