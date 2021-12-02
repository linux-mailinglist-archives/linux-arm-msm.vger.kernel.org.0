Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F70B466CA5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Dec 2021 23:29:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377326AbhLBWcd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Dec 2021 17:32:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377488AbhLBWbz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Dec 2021 17:31:55 -0500
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77412C0613B8
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Dec 2021 14:28:01 -0800 (PST)
Received: by mail-pf1-x42e.google.com with SMTP id n85so932827pfd.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Dec 2021 14:28:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8jRHJbzxJCo8C1IXTJW3KiTq5EwC3cp5SncHLYDZJzc=;
        b=ZvsFOChi2a09b6GoTBICzT/9fIuSbCNP0iSOhGqrl/i12m292JHnXAGLUMcqmyMD0O
         17OogpMQSH/ESLZpl1kLxvzz85n1vDsoy8ZaukjzCIbY16lEVRuJy40YowieCjPmPmHt
         K9O03qRVmeNmeOKGakhaWaK4fn3UZtYbAnwvA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8jRHJbzxJCo8C1IXTJW3KiTq5EwC3cp5SncHLYDZJzc=;
        b=XAdP8WTrgXNMa+t65sc6NYDNEUbPB0Ss3uHhyO+vAlSWet0VLkr0RWmBDvwk0u8JKA
         lxjiykclEv3liWRhSYZwraov9TTSv1xlZ6CzODp7lUgnqxoYUfSomUik1gCSxzxAHHzX
         hd8rA63QFuLg3PuVZ0uShXfgGWdfMm1DhNi5YzPS4Z+P2f7R+OEhlgcEKUMc3+cS/lmo
         E1U2ZWUOrJrDdUoUr/4Bwt2pHgg9cOFdeZYB8yafitxmSCJ/o6ZGuEb2NN+0Cz2p5zbw
         FdvHS4NAnSL8ICskLIA6dbQhzDMZ3K8WCgsaoF6dOAee3L4UWOLu9DvoQwZfu4AwwCX1
         mlsw==
X-Gm-Message-State: AOAM530xOf5If/CScyWAdtfAWs/CLuEbgDJGUzz9nC0rKJyunWqh0mwm
        SD39cwW1tJsRh0QE2pO8mncJqQ==
X-Google-Smtp-Source: ABdhPJyCZby3E+i5/8aEnm2EyoCRENRlXyXj72Cf4bL/EDdq4jQNoJTZVSt+IBu0bzhpZlm1le2Bng==
X-Received: by 2002:aa7:88d3:0:b0:49f:baac:9b51 with SMTP id k19-20020aa788d3000000b0049fbaac9b51mr15296856pff.44.1638484081032;
        Thu, 02 Dec 2021 14:28:01 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:f4f2:1b7e:5aea:bf3c])
        by smtp.gmail.com with ESMTPSA id q9sm836934pfj.9.2021.12.02.14.28.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Dec 2021 14:28:00 -0800 (PST)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Russell King <rmk+kernel@arm.linux.org.uk>,
        Saravana Kannan <saravanak@google.com>
Subject: [PATCH v4 30/34] sound: hdac: Migrate to aggregate driver
Date:   Thu,  2 Dec 2021 14:27:28 -0800
Message-Id: <20211202222732.2453851-31-swboyd@chromium.org>
X-Mailer: git-send-email 2.34.0.384.gca35af8252-goog
In-Reply-To: <20211202222732.2453851-1-swboyd@chromium.org>
References: <20211202222732.2453851-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use an aggregate driver instead of component ops so that we can get
proper driver probe ordering of the aggregate device with respect to all
the component devices that make up the aggregate device.

Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Saravana Kannan <saravanak@google.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 sound/hda/hdac_component.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/sound/hda/hdac_component.c b/sound/hda/hdac_component.c
index bb37e7e0bd79..9e4dab97f485 100644
--- a/sound/hda/hdac_component.c
+++ b/sound/hda/hdac_component.c
@@ -181,8 +181,9 @@ int snd_hdac_acomp_get_eld(struct hdac_device *codec, hda_nid_t nid, int dev_id,
 }
 EXPORT_SYMBOL_GPL(snd_hdac_acomp_get_eld);
 
-static int hdac_component_master_bind(struct device *dev)
+static int hdac_component_master_bind(struct aggregate_device *adev)
 {
+	struct device *dev = adev->parent;
 	struct drm_audio_component *acomp = hdac_get_acomp(dev);
 	int ret;
 
@@ -222,8 +223,9 @@ static int hdac_component_master_bind(struct device *dev)
 	return ret;
 }
 
-static void hdac_component_master_unbind(struct device *dev)
+static void hdac_component_master_unbind(struct aggregate_device *adev)
 {
+	struct device *dev = adev->parent;
 	struct drm_audio_component *acomp = hdac_get_acomp(dev);
 
 	if (acomp->audio_ops && acomp->audio_ops->master_unbind)
@@ -233,9 +235,13 @@ static void hdac_component_master_unbind(struct device *dev)
 	WARN_ON(acomp->ops || acomp->dev);
 }
 
-static const struct component_master_ops hdac_component_master_ops = {
-	.bind = hdac_component_master_bind,
-	.unbind = hdac_component_master_unbind,
+static struct aggregate_driver hdac_aggregate_driver = {
+	.probe = hdac_component_master_bind,
+	.remove = hdac_component_master_unbind,
+	.driver = {
+		.name = "hdac_agg",
+		.owner = THIS_MODULE,
+	},
 };
 
 /**
@@ -303,8 +309,7 @@ int snd_hdac_acomp_init(struct hdac_bus *bus,
 	devres_add(dev, acomp);
 
 	component_match_add_typed(dev, &match, match_master, bus);
-	ret = component_master_add_with_match(dev, &hdac_component_master_ops,
-					      match);
+	ret = component_aggregate_register(dev, &hdac_aggregate_driver, match);
 	if (ret < 0)
 		goto out_err;
 
@@ -344,7 +349,7 @@ int snd_hdac_acomp_exit(struct hdac_bus *bus)
 	bus->display_power_active = 0;
 	bus->display_power_status = 0;
 
-	component_master_del(dev, &hdac_component_master_ops);
+	component_aggregate_unregister(dev, &hdac_aggregate_driver);
 
 	bus->audio_component = NULL;
 	devres_destroy(dev, hdac_acomp_release, NULL, NULL);
-- 
https://chromeos.dev

