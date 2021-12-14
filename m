Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3039C473AB8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Dec 2021 03:25:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240167AbhLNCZU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Dec 2021 21:25:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229616AbhLNCZU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Dec 2021 21:25:20 -0500
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 694B7C061574
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Dec 2021 18:25:20 -0800 (PST)
Received: by mail-pf1-x42a.google.com with SMTP id k26so16585427pfp.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Dec 2021 18:25:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Yxd2Yo2UBVtuTCHBx1Rt0MUSlSVwUw6mQJuM6lvxUxw=;
        b=QlyofaDyFgpcphrLj7nebTesCpf6bugmFwRgfnBeuolqusfu7gXHLED/JnvcjCdqOo
         9sG7uRZpE5MJXB96XK+jeA+w8lXUw+sUM+O7SMy67iFyjSBw0D5gZfXOkdfc+qa7dOL8
         MrSsu1gWqfub//VAYo4P4JbBHDVcwTvvxylmk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Yxd2Yo2UBVtuTCHBx1Rt0MUSlSVwUw6mQJuM6lvxUxw=;
        b=6PI52MOxkOhb4PXQcmC0MneMzUHr+58eIvhuQgF9kAcLhpLPFsqXiLlzvavG9WH5hZ
         8AnI/DRUgWrKEFfwqViI2YJBiE2GnqVVZycv2WlyTxpPXg/ejrpz1Fg7mh4K9TVm/LkV
         QHAlUmR3bIU9+Sw0DtWrT3goNjKjPDuKnVoTwobAtp1cxWOxTYKEY/o36UvQ+63Zrz07
         fqyu6myOkZieEZ5W+p40Fpjo/wLaBo7ebSPbpN4UMA68jJ4fM5MHWfVVT25THTQrhIyJ
         kKHMECxDXeFlvYe+7zXlJ7kArlZxLqImY9kOTHbu9GUn1RS6sB/i4aiNa5IJY/v0ZYEg
         R8Iw==
X-Gm-Message-State: AOAM530R0ksin4EyJAIPFXdbTmIAZNiu1F5pnmVaiM36NjtATnvbhezP
        110J2JGN1dfYEMhBB3JK/YntRA==
X-Google-Smtp-Source: ABdhPJyLk77FSuMQVWlkHLrSsV67VNLoFgUuMKvxH7817b2npUaFoj1ht5lP38dydeC0wNqAuPiabw==
X-Received: by 2002:a63:748:: with SMTP id 69mr1700282pgh.517.1639448719811;
        Mon, 13 Dec 2021 18:25:19 -0800 (PST)
Received: from judyhsiao-p920.tpe.corp.google.com ([2401:fa00:1:10:6d67:3339:cd09:e30a])
        by smtp.gmail.com with ESMTPSA id k8sm14243419pfc.197.2021.12.13.18.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 18:25:19 -0800 (PST)
From:   Judy Hsiao <judyhsiao@chromium.org>
To:     broonie@kernel.org
Cc:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, dianders@chromium.org,
        cychiang@google.com, yuhsuan@chromium.org, judyhsiao@google.com,
        swboyd@chromium.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, Judy Hsiao <judyhsiao@chromium.org>
Subject: [v3] SoC: qcom: Distinguish headset codec by codec_dai->name
Date:   Tue, 14 Dec 2021 10:25:09 +0800
Message-Id: <20211214022509.1288245-1-judyhsiao@chromium.org>
X-Mailer: git-send-email 2.34.1.173.g76aa8bc2d0-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Distinguish which headset codec is on the board by codec_dai->name
instead of card->name.

It fixes the crash of being unable to handle kernel paging requests
at virtual address ADDR by initializing the correct audio codec on
the board.

Call stack of the crash:
```
 Unable to handle kernel paging request at virtual address ...
 ...
 Call trace:
  rt5682_set_component_pll+0xcc/0xb78 [snd_soc_rt5682]
  snd_soc_component_set_pll+0x90/0x154
  snd_soc_dai_set_pll+0xf4/0x1ac
  sc7180_snd_startup+0x268/0x3c0 [snd_soc_sc7180]
  snd_soc_link_startup+0xa4/0x180
  soc_pcm_open+0x35c/0x15c8
  snd_pcm_open_substream+0xa90/0x13b0
  snd_pcm_open+0x1a4/0x55c
  snd_pcm_capture_open+0x7c/0xe8
  snd_open+0x2b8/0x2e4
  chrdev_open+0x364/0x3d4
  do_dentry_open+0x66c/0xc58
  vfs_open+0x7c/0x8c
  path_openat+0x108c/0x2bbc
  do_filp_open+0x15c/0x258
  do_sys_open+0x278/0x62c
  __arm64_compat_sys_openat+0x9c/0xb0
  ...
```

Fixes: 425c5fce8a03 ("ASoC: qcom: Add support for ALC5682I-VS codec")
Signed-off-by: Judy Hsiao <judyhsiao@chromium.org>
---
 sound/soc/qcom/sc7180.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/sc7180.c b/sound/soc/qcom/sc7180.c
index 2fff764a00a7..37225ef2563a 100644
--- a/sound/soc/qcom/sc7180.c
+++ b/sound/soc/qcom/sc7180.c
@@ -131,13 +131,13 @@ static int sc7180_snd_startup(struct snd_pcm_substream *substream)
 	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 	int pll_id, pll_source, pll_in, pll_out, clk_id, ret;
 
-	if (!(strcmp(card->name, "sc7180-rt5682-max98357a-1mic"))) {
+	if (!strcmp(codec_dai->name, "rt5682-aif1")) {
 		pll_source = RT5682_PLL1_S_MCLK;
 		pll_id = 0;
 		clk_id = RT5682_SCLK_S_PLL1;
 		pll_out = RT5682_PLL1_FREQ;
 		pll_in = DEFAULT_MCLK_RATE;
-	} else if (!(strcmp(card->name, "sc7180-rt5682s-max98357a-1mic"))) {
+	} else if (!strcmp(codec_dai->name, "rt5682s-aif1")) {
 		pll_source = RT5682S_PLL_S_MCLK;
 		pll_id = RT5682S_PLL2;
 		clk_id = RT5682S_SCLK_S_PLL2;
-- 
2.31.0

