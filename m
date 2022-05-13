Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B91B2526AF0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 May 2022 22:07:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1384050AbiEMUGn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 May 2022 16:06:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1384031AbiEMUGm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 May 2022 16:06:42 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 375322F386
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 May 2022 13:06:40 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id x52so8557916pfu.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 May 2022 13:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jWNQ+udHtvb6wOcT6dMXsk0oWrtzq/bCwEASacHmYiI=;
        b=PKRSB0OoZr2r4AVps3UEL1sMJ9tjxHub9QfMyVOMWaIPg7HZVUnpxVeUB6GxUGmqM+
         wOQSXBcFQT/isxFLGop0YTfgpKIPezzGc7lUNAu2QQz4oBD3KNiFmpEToo8utfYfODF2
         pwiBpAnjxjzO9R3vrj6DM++IIVA0u5YVE38Yk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jWNQ+udHtvb6wOcT6dMXsk0oWrtzq/bCwEASacHmYiI=;
        b=3ffOSgpmdffUEVOrhiIqZdFyMIZYmL4IUuh8ST5+vmtjGBAiShPX9movMOBs3eiBId
         iQEnjkzoxc8Qp9P1ZQCygHoWl64EyFoXBTz0oWSgU7D3p2HV1L7e7xlVTytGm9Rs5oYd
         2KS+Q2v5nmivzpHro0c5Qvw+vyk6eVTp85xiBchrlMvH8GD63I+9tjhwcZstG5EbNge+
         XoltTHx6QBPoEQuLqFXkP+jREnJmLmZ1IrhjlseoqutVO95Oxg9huc2oS/PAkEhGDnRK
         5qp6xYNhwQn5G8k3lyahqtj9PCkajcmlo7x8O6BidpERs3Nsk+8/Cp6BhHnb77huk/Mw
         xqCQ==
X-Gm-Message-State: AOAM532d/MKYfS9z1mkJHhm8YYk4H91+xIN0NqReJaYdx8UGe7AjA+tT
        Sj31NFDHIYoYZWf+ty7/Ec9h7g==
X-Google-Smtp-Source: ABdhPJwb8k2JkOVQn+IGowuv6jSNYiE2rgOXffz+wtArhneP1ZpPro3wUSnkEZyb4e33pt3B49ZExw==
X-Received: by 2002:a05:6a00:21c6:b0:4fa:914c:2c2b with SMTP id t6-20020a056a0021c600b004fa914c2c2bmr5973799pfj.56.1652472399660;
        Fri, 13 May 2022 13:06:39 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:f334:6f80:82ed:5653])
        by smtp.gmail.com with ESMTPSA id t1-20020a17090aae0100b001d97fc5a544sm2011231pjq.2.2022.05.13.13.06.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 May 2022 13:06:39 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     dri-devel@lists.freedesktop.org
Cc:     quic_aravindh@quicinc.com, tzimmermann@suse.de,
        quic_khsieh@quicinc.com, jani.nikula@linux.intel.com,
        robdclark@gmail.com, quic_sbillaka@quicinc.com,
        ville.syrjala@linux.intel.com, quic_abhinavk@quicinc.com,
        dmitry.baryshkov@linaro.org, swboyd@chromium.org,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3] drm/probe-helper: Make 640x480 first if no EDID
Date:   Fri, 13 May 2022 13:06:13 -0700
Message-Id: <20220513130533.v3.1.I31ec454f8d4ffce51a7708a8092f8a6f9c929092@changeid>
X-Mailer: git-send-email 2.36.0.550.gb090851708-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

If we're unable to read the EDID for a display because it's corrupt /
bogus / invalid then we'll add a set of standard modes for the
display. Since we have no true information about the connected
display, these modes are essentially guesses but better than nothing.
None of the modes returned is marked as preferred, but the modes are
currently sorted such that the higher resolution modes are listed
first.

When userspace sees these modes presented by the kernel it needs to
figure out which one to pick. At least one userspace, ChromeOS [1]
seems to use the rules:
1. Try to pick the first mode marked as preferred.
2. If no modes were marked as preferred then pick the first mode.

The rules above seem pretty reasonable, but they have unfortunate side
effect that when we have no EDID present we'll default to the highest
resolution (least likely to work) mode.

Let's change things slightly. In the case of a failed EDID read we
still won't mark anything preferred but we _won't_ sort the modes at
the end of drm_helper_probe_single_connector_modes(). The
drm_add_modes_noedid() adds 640x480 first and so by skipping the call
to drm_mode_sort() it will stay first. That will be a hint to
userspace to default to 640x480.

This change makes userspace that behaves like ChromeOS does compliant
with section 4.2.2.6 (EDID Corruption Detection) of the DP 1.4a Link
CTS. That section indicates that, at least on DP, if we have a corrupt
EDID userspace may allow other modes to be tried but should default to
640x480 in the absence of more information. Note that if
drm_add_modes_noedid() ever changes to _not_ list 640x480 first we
might need to do more here, but that seems unlikely and, in any case,
it would be caught by a future run of DP compliance testing.

Note: this change could pave the way to further improvement to
drm_helper_probe_single_connector_modes(). Specifically, in the case
of no EDID we could add additional "standard" modes that are riskier
than 1024x768 (the current max we add). Now that we're giving
userspace the hint that it should default to 640x480 perhaps it would
be OK to offer the options of the higher resolution modes just in case
they work. This further improvement is left as an exercise to the
reader.

[1] https://source.chromium.org/chromium/chromium/src/+/a051f741d0a15caff2251301efe081c30e0f4a96:ui/ozone/platform/drm/common/drm_util.cc;l=488

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
Note that this is the second of two related and similar-sounding but
different patches. See also ("drm/probe-helper: For DP, add 640x480 if
all other modes are bad") [2]. I'm hoping to land _both_ of the
patches since they address different issues. This patch addresses the
case of a corrupt EDID and having 640x480 be the default in the
"guessed" modes. The other patch handles the case where the EDID
_isn't_ corrupt but all the modes listed can't be made with the
existing situations. The two patches can land in either order.

Also note that I didn't carry any Tested-by / Reviewed-by tags since
the patch is now quite different (yet again for v2 to v3).

[2] https://lore.kernel.org/r/20220510131309.v2.2.I4ac7f55aa446699f8c200a23c10463256f6f439f@changeid

Changes in v3:
- Don't set preferred, just disable the sort.

Changes in v2:
- Don't modify drm_add_modes_noedid() 'cause that'll break others
- Set 640x480 as preferred in drm_helper_probe_single_connector_modes()

 drivers/gpu/drm/drm_probe_helper.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
index 682359512996..21dd60f30cc7 100644
--- a/drivers/gpu/drm/drm_probe_helper.c
+++ b/drivers/gpu/drm/drm_probe_helper.c
@@ -425,6 +425,7 @@ int drm_helper_probe_single_connector_modes(struct drm_connector *connector,
 	bool verbose_prune = true;
 	enum drm_connector_status old_status;
 	struct drm_modeset_acquire_ctx ctx;
+	bool sort_list = true;
 
 	WARN_ON(!mutex_is_locked(&dev->mode_config.mutex));
 
@@ -516,8 +517,16 @@ int drm_helper_probe_single_connector_modes(struct drm_connector *connector,
 		count = drm_add_override_edid_modes(connector);
 
 	if (count == 0 && (connector->status == connector_status_connected ||
-			   connector->status == connector_status_unknown))
+			   connector->status == connector_status_unknown)) {
 		count = drm_add_modes_noedid(connector, 1024, 768);
+		/*
+		 * Want lower res modes, like 640x480, first. That indicates
+		 * to userspace that these are "better" modes. Since we have
+		 * no EDID the modes are a guess anyway, so guess the safer
+		 * mode first.
+		 */
+		sort_list = false;
+	}
 	count += drm_helper_probe_add_cmdline_mode(connector);
 	if (count == 0)
 		goto prune;
@@ -576,7 +585,8 @@ int drm_helper_probe_single_connector_modes(struct drm_connector *connector,
 	if (list_empty(&connector->modes))
 		return 0;
 
-	drm_mode_sort(&connector->modes);
+	if (sort_list)
+		drm_mode_sort(&connector->modes);
 
 	DRM_DEBUG_KMS("[CONNECTOR:%d:%s] probed modes :\n", connector->base.id,
 			connector->name);
-- 
2.36.0.550.gb090851708-goog

