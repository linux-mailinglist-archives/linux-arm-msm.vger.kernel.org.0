Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E57BE184132
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2020 08:09:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726371AbgCMHJM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Mar 2020 03:09:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:58278 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726216AbgCMHJL (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Mar 2020 03:09:11 -0400
Received: from localhost.localdomain (unknown [171.76.107.175])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8F1952074A;
        Fri, 13 Mar 2020 07:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584083351;
        bh=eAOYl2icplz8mBmGFU2V/HyyvjUJIezolE5jQJwy6rA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=1mOJ6rEUFCtPR3yyk/rTu4nByZyMJlnModafsjzicVfXVj4RlD7A+WVyA5IMQUR1r
         iU0E1j1JQYC0p6mFfBLf9i8cdzbXBMslI0DXUROxAJATFEgdimYk7deDNSaL6FVgAs
         /vHcVsv9J/L0Ac8JqcxU1sdJTTVvNqzF1R+pUOSI=
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
Subject: [PATCH 1/9] ALSA: compress: add wma codec profiles
Date:   Fri, 13 Mar 2020 12:38:39 +0530
Message-Id: <20200313070847.1464977-2-vkoul@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200313070847.1464977-1-vkoul@kernel.org>
References: <20200313070847.1464977-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Some codec profiles were missing for WMA, like WMA9/10 lossless and
wma10 pro, so add these profiles

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 include/uapi/sound/compress_params.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/uapi/sound/compress_params.h b/include/uapi/sound/compress_params.h
index 9c96fb0e4d90..634daa354b58 100644
--- a/include/uapi/sound/compress_params.h
+++ b/include/uapi/sound/compress_params.h
@@ -142,6 +142,9 @@
 #define SND_AUDIOPROFILE_WMA8                ((__u32) 0x00000002)
 #define SND_AUDIOPROFILE_WMA9                ((__u32) 0x00000004)
 #define SND_AUDIOPROFILE_WMA10               ((__u32) 0x00000008)
+#define SND_AUDIOPROFILE_WMA9_PRO            ((__u32) 0x00000010)
+#define SND_AUDIOPROFILE_WMA9_LOSSLESS       ((__u32) 0x00000011)
+#define SND_AUDIOPROFILE_WMA10_LOSSLESS      ((__u32) 0x00000012)
 
 #define SND_AUDIOMODE_WMA_LEVEL1             ((__u32) 0x00000001)
 #define SND_AUDIOMODE_WMA_LEVEL2             ((__u32) 0x00000002)
-- 
2.24.1

