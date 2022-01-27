Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2950B49EC12
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jan 2022 21:03:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343837AbiA0UDm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Jan 2022 15:03:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343900AbiA0UCm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Jan 2022 15:02:42 -0500
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC789C0613E4
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jan 2022 12:02:39 -0800 (PST)
Received: by mail-pf1-x430.google.com with SMTP id d187so3776193pfa.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jan 2022 12:02:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pg7u1QgES9vvilydf87u7mbX9H+V1JXmTaOjVr3A4N4=;
        b=SNb6+UtCldRo3C3aKKuH53pJUKPR1QoOvhja2fFrdIZAqK2pC8avjHvs2QWwdAqY2L
         iDTt5Ev8TK1FUPlXG0GLJg90OtWzYd58L9jGhUvwTScxXTgeVD59clQ/6ruqJGZsIDtb
         VzKFMzhSCdtxWvtOoLilyZS6Je3BqrKogxJuI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pg7u1QgES9vvilydf87u7mbX9H+V1JXmTaOjVr3A4N4=;
        b=P+eH/xiUWd7NxYfJtKxM+6sIegpyfFkibIfP9/vyPrnzdbH7tiXj2Wvt+Rc811OGSF
         Ayf3HA1a67TeMnSLtBtfGgQWdBr50rj5x4DvVOAEYL6zjvpqe+1IGa82HoFHSAggc3Vr
         cU9xgu8+G5QJPa/KOAyCwAQovCafILdJl6tYBRz5IKHh3OhtXkW9Hw+dnp/QfzS2W1Aa
         0tBJbzNUXanvYdeohhJs8JRFPkg0bNtFr4Pp1QBlSBuJAyKOTQRLLSr2CWCe4H86VVOu
         ogXmS+Eo1D1XwnEaBFi+S718BrbzYfE4HHTcLbo414aEFsUj79aSv7dpNM1wuEhgZ02q
         GZUw==
X-Gm-Message-State: AOAM532iSmPHKoRZsJiKQbWwubdAcWbmApV9nIK8EzIOsAH2PG+hK6jc
        4IDcc0WxIjo6npSlF44eV1qPTg==
X-Google-Smtp-Source: ABdhPJyWS6wiSowTLsVHpFT26f9C2DJENr9ONfoQ93NBCznOznrI8TRNbMCesKj30yy09FTDuZLACA==
X-Received: by 2002:a63:dd0f:: with SMTP id t15mr3912064pgg.12.1643313759139;
        Thu, 27 Jan 2022 12:02:39 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:9246:1838:3243:3071])
        by smtp.gmail.com with ESMTPSA id k21sm6561190pff.33.2022.01.27.12.02.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jan 2022 12:02:38 -0800 (PST)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Douglas Anderson <dianders@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Stefan Binding <sbinding@opensource.cirrus.com>,
        Lucas Tanure <tanureal@opensource.cirrus.com>,
        Takashi Iwai <tiwai@suse.de>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Russell King <rmk+kernel@arm.linux.org.uk>,
        Saravana Kannan <saravanak@google.com>
Subject: [PATCH v6 33/35] ALSA: hda/realtek: Migrate to aggregate driver
Date:   Thu, 27 Jan 2022 12:01:39 -0800
Message-Id: <20220127200141.1295328-34-swboyd@chromium.org>
X-Mailer: git-send-email 2.35.0.rc0.227.g00780c9af4-goog
In-Reply-To: <20220127200141.1295328-1-swboyd@chromium.org>
References: <20220127200141.1295328-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use an aggregate driver instead of component ops so that we can get
proper driver probe ordering of the aggregate device with respect to all
the component devices that make up the aggregate device.

Cc: Stefan Binding <sbinding@opensource.cirrus.com>
Cc: Lucas Tanure <tanureal@opensource.cirrus.com>
Cc: Takashi Iwai <tiwai@suse.de>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Saravana Kannan <saravanak@google.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 sound/pci/hda/patch_realtek.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 668274e52674..80a2164c99b6 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -6547,25 +6547,31 @@ static int find_comp_by_dev_name(struct alc_spec *spec, const char *name)
 	return -ENODEV;
 }
 
-static int comp_bind(struct device *dev)
+static int realtek_aggregate_probe(struct aggregate_device *adev)
 {
+	struct device *dev = aggregate_device_parent(adev);
 	struct hda_codec *cdc = dev_to_hda_codec(dev);
 	struct alc_spec *spec = cdc->spec;
 
 	return component_bind_all(dev, spec->comps);
 }
 
-static void comp_unbind(struct device *dev)
+static void realtek_aggregate_remove(struct aggregate_device *adev)
 {
+	struct device *dev = aggregate_device_parent(adev);
 	struct hda_codec *cdc = dev_to_hda_codec(dev);
 	struct alc_spec *spec = cdc->spec;
 
 	component_unbind_all(dev, spec->comps);
 }
 
-static const struct component_master_ops comp_master_ops = {
-	.bind = comp_bind,
-	.unbind = comp_unbind,
+static struct aggregate_driver realtek_aggregate_driver = {
+	.probe = realtek_aggregate_probe,
+	.remove = realtek_aggregate_remove,
+	.driver = {
+		.name = "realtek_aggregate",
+		.owner = THIS_MODULE,
+	},
 };
 
 static void comp_generic_playback_hook(struct hda_pcm_stream *hinfo, struct hda_codec *cdc,
@@ -6597,7 +6603,7 @@ static void cs35l41_generic_fixup(struct hda_codec *cdc, int action, const char
 				return;
 			component_match_add(dev, &spec->match, comp_match_dev_name, name);
 		}
-		ret = component_master_add_with_match(dev, &comp_master_ops, spec->match);
+		ret = component_aggregate_register(dev, &realtek_aggregate_driver, spec->match);
 		if (ret)
 			codec_err(cdc, "Fail to register component aggregator %d\n", ret);
 		else
@@ -6648,7 +6654,7 @@ static void alc287_fixup_legion_16achg6_speakers(struct hda_codec *cdc, const st
 				    "i2c-CLSA0100:00-cs35l41-hda.0");
 		component_match_add(dev, &spec->match, comp_match_dev_name,
 				    "i2c-CLSA0100:00-cs35l41-hda.1");
-		ret = component_master_add_with_match(dev, &comp_master_ops, spec->match);
+		ret = component_aggregate_register(dev, &realtek_aggregate_driver, spec->match);
 		if (ret)
 			codec_err(cdc, "Fail to register component aggregator %d\n", ret);
 		else
-- 
https://chromeos.dev

