Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33B70424748
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Oct 2021 21:40:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239743AbhJFTmU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Oct 2021 15:42:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239682AbhJFTlx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Oct 2021 15:41:53 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC9E4C06139F
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Oct 2021 12:38:58 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id 187so3259006pfc.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Oct 2021 12:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8jRHJbzxJCo8C1IXTJW3KiTq5EwC3cp5SncHLYDZJzc=;
        b=DW8Rq7I48xcvXfJwO7zkXFQduC0Ire4Rm/IUtLp2n5907rSjR5g3Ms15Gszi401quM
         XqjUBmfR0/WPu9fvux4hZDn8BRL79KCrhOTEhLR93sv6dm5LaN8m6Ey4spGKOAmhEd1H
         XQcWnWYhbhQPQ898DqOITmZobQar+DzEmVh7Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8jRHJbzxJCo8C1IXTJW3KiTq5EwC3cp5SncHLYDZJzc=;
        b=KCu79Cpghf7q+AAe1bRogjB5/82GLz1a32w9S57JmkiI4gBhVUM6r44ToUcRfhDOsd
         9aOoIGWO3a18CMw3zT7KATwLZTH29Xo8PbBlzXIAvccN/Xvq94wCtNNIauhnD89enkNn
         SO9TSqMPIDLSI9/AfFEuSISiwRlV7dCLQhuAOGU3/4QIwUSMPhDZRV6GcaD4J+9C/xZZ
         /IRJM+4O4uuKy+zzuer5UmI2rymiFMX/82m3SQOuRr9cDyBbB+nnfw3iUdWps6Ka00Ag
         otmgM4Ei4SRiiKDaN3kofF1w1SGvrD6gCvWNUtU9AdpYwWcwxrUgbk5cdLFxWL3m2LHa
         9s1w==
X-Gm-Message-State: AOAM530IWsbFWh53OeW3wW7aqRcyxjitrhpDaWrsC3EanadbrsFboOb9
        BczIthCXH2bGCgfjNOPyM2+WyA==
X-Google-Smtp-Source: ABdhPJx4kOT1B4vF6qURauwNXogEUpz3RWEPcYcshAJYfrjnwniPXAT8o/FsQzLPD4Sey6nHxE2u/Q==
X-Received: by 2002:a63:5717:: with SMTP id l23mr445293pgb.87.1633549138330;
        Wed, 06 Oct 2021 12:38:58 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:d412:c5eb:4aca:4738])
        by smtp.gmail.com with ESMTPSA id o14sm22011296pfh.84.2021.10.06.12.38.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Oct 2021 12:38:58 -0700 (PDT)
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
Subject: [PATCH v2 30/34] sound: hdac: Migrate to aggregate driver
Date:   Wed,  6 Oct 2021 12:38:15 -0700
Message-Id: <20211006193819.2654854-31-swboyd@chromium.org>
X-Mailer: git-send-email 2.33.0.800.g4c38ced690-goog
In-Reply-To: <20211006193819.2654854-1-swboyd@chromium.org>
References: <20211006193819.2654854-1-swboyd@chromium.org>
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

