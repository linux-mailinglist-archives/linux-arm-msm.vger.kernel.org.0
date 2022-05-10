Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 18642521CF5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 May 2022 16:49:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243745AbiEJOxr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 May 2022 10:53:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345111AbiEJOxg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 May 2022 10:53:36 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4903273F61;
        Tue, 10 May 2022 07:13:42 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id p4so20215791edx.0;
        Tue, 10 May 2022 07:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KcqoIPk0ygEnf3kwvjB1/+RCVDH+kifyONLKWU/UKZs=;
        b=DXSivDM2yXQBgS8L49mzuRhmA/P3oK846thzY2HOYl0By9RRUnIpvP2iiGp1NRvbuU
         OdxA2EUiQH+9nxg+B3Zs59DgY5E5PZ6jedbwJruxkqMbkalNp5NQus/f3Rakqd/NhsT3
         c0pP7p7B2q8k0/Piu+ExGz06eEJlekwYhnFJhaxQfMlxybVN1w63C7qjbTWvi4PNeMQK
         Z1Wri8/Iz0i/THFfNQbY5jtmGBgmjIh+OzT5as77WRaV84JMGaY326aPWHS49b+MQXYZ
         C6Hc24XCOD2NL0v6Au2JGgTEM2u65z6nY5P2wxO89xQL3p/7m2CNvlPvvF3C7PEijeVY
         Qfmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=KcqoIPk0ygEnf3kwvjB1/+RCVDH+kifyONLKWU/UKZs=;
        b=pr469GmQ58p4HLzc7YGUy3o0bNQv0qyx/i4yZuMVVe9l76AfIkBZ9saGiVau61O7WI
         VT5rkyHHj140LXHIsWZHRXaLGgLZocDrOyhzoLp4PkMTlyaNYoW2Yz3quUcmbT2moJQC
         JzbQJBB0fPwqA56cLlwjKPEDELdIbtn+2yaqzSrtHcU4Ajt8JTp6hVNd5+l8ptjEkUIN
         25oTB9RZ5OSdNCzMl+k0OpBPINk4psgfXAAPuI3cLyJonR5bPdK2/9IrrOQZBxMbUQqb
         sfXNoxDBDM+EpgL6g4pjEzIQQpWFO0pyhb1k5QywauUGcmi9s9bN9AHRPdcb0lRykWba
         QkCg==
X-Gm-Message-State: AOAM532TNQPdKhSdzcK8Wh9w1ls5HTFkX9awnt22MM+Fi6D1dfCoYL9S
        /Kv3L3qSjOVLNN7hmI2epq0=
X-Google-Smtp-Source: ABdhPJwvga78W+rrq9YeL+lOKx95TyawluNV/9On4TzYU01HHQYbirllgGLlYyeDDyPQYG5IlODp8g==
X-Received: by 2002:a05:6402:1cc1:b0:428:a06e:a30f with SMTP id ds1-20020a0564021cc100b00428a06ea30fmr10368823edb.377.1652192020374;
        Tue, 10 May 2022 07:13:40 -0700 (PDT)
Received: from cizrna.home (cst-prg-46-129.cust.vodafone.cz. [46.135.46.129])
        by smtp.gmail.com with ESMTPSA id qp24-20020a170907a21800b006f3ef214e4bsm6224903ejc.177.2022.05.10.07.13.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 May 2022 07:13:39 -0700 (PDT)
Sender: Tomeu Vizoso <tomeu.vizoso@gmail.com>
From:   Tomeu Vizoso <tomeu.vizoso@collabora.com>
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Corbet <corbet@lwn.net>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Tomeu Vizoso <tomeu.vizoso@collabora.com>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
Subject: [RFC v2] drm/msm: Add initial ci/ subdirectory
Date:   Tue, 10 May 2022 16:13:28 +0200
Message-Id: <20220510141329.54414-1-tomeu.vizoso@collabora.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220510070140.45407-1-tomeu.vizoso@collabora.com>
References: <20220510070140.45407-1-tomeu.vizoso@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

And use it to store expectations about what the drm/msm driver is
supposed to pass in the IGT test suite.

Also include a configuration file that points to the out-of-tree CI
scripts.

By storing the test expectations along the code we can make sure both
stay in sync with each other, and so we can know when a code change
breaks those expectations.

This will allow all contributors to drm/msm to reuse the infrastructure
already in gitlab.freedesktop.org to test the driver on several
generations of the hardware.

v2:
  - Fix names of result expectation files to match SoC
  - Don't execute tests that are going to skip on all boards

Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
---
 Documentation/gpu/msm_automated_testing.rst   |  70 +++++++++
 drivers/gpu/drm/msm/ci/gitlab-ci.yml          |  11 ++
 drivers/gpu/drm/msm/ci/msm.testlist           | 148 ++++++++++++++++++
 .../gpu/drm/msm/ci/msm_apq8016_results.txt    | 140 +++++++++++++++++
 .../gpu/drm/msm/ci/msm_apq8096_results.txt    | 140 +++++++++++++++++
 drivers/gpu/drm/msm/ci/msm_sc7180_results.txt | 141 +++++++++++++++++
 drivers/gpu/drm/msm/ci/msm_sdm845_results.txt | 141 +++++++++++++++++
 7 files changed, 791 insertions(+)
 create mode 100644 Documentation/gpu/msm_automated_testing.rst
 create mode 100644 drivers/gpu/drm/msm/ci/gitlab-ci.yml
 create mode 100644 drivers/gpu/drm/msm/ci/msm.testlist
 create mode 100644 drivers/gpu/drm/msm/ci/msm_apq8016_results.txt
 create mode 100644 drivers/gpu/drm/msm/ci/msm_apq8096_results.txt
 create mode 100644 drivers/gpu/drm/msm/ci/msm_sc7180_results.txt
 create mode 100644 drivers/gpu/drm/msm/ci/msm_sdm845_results.txt

diff --git a/Documentation/gpu/msm_automated_testing.rst b/Documentation/gpu/msm_automated_testing.rst
new file mode 100644
index 000000000000..fe59474569c2
--- /dev/null
+++ b/Documentation/gpu/msm_automated_testing.rst
@@ -0,0 +1,70 @@
+.. SPDX-License-Identifier: GPL-2.0+
+
+=========================================
+Automated testing of MSM DRM driver
+=========================================
+
+
+Introduction
+============
+
+Making sure that changes to a driver don't introduce regressions can be very time consuming when lots of different hardware configurations need to be tested. Moreover, it isn't practical for each person interested in this testing to have to acquire and maintain what can be a considerable amount of hardware.
+
+Also, it is desirable for developers to check for regressions in their code by themselves, instead of relying on the maintainer finding them and then reporting back.
+
+There are facilities in gitlab.freedesktop.org to automatically test Mesa that can be used as well for testing DRM drivers such as drm/msm. This document explains how people interested in testing the drm/msm driver can use this shared infrastructure to save quite some time and effort.
+
+
+Relevant files
+==============
+
+drivers/gpu/drm/msm/ci/gitlab-ci.yml
+------------------------------------
+
+Specifies the specific version of the scripts to be used. GitLab CI will use the values defined in this file to fetch the right scripts.
+
+
+drivers/gpu/drm/msm/ci/msm.testlist
+-----------------------------------
+
+Specifies the tests that the current code is expected to be able to reliably run. These tests are expected to not hang the DUT (device under testing) when running on the revision they belong to, and to give consistent results.
+
+
+drivers/gpu/drm/msm/ci/msm_*_results.txt
+----------------------------------------
+
+Specifies the expected results of running this specific kernel revision on a given hardware configuration.
+
+
+How to enable automated testing on your tree
+============================================
+
+1. Create a Linux tree in https://gitlab.freedesktop.org/ if you don't have one yet
+
+2. In your kernel repo's configuration (eg. https://gitlab.freedesktop.org/tomeu/linux/-/settings/ci_cd), change the CI/CD configuration file from .gitlab-ci.yml to drivers/gpu/drm/msm/ci/gitlab-ci.yml.
+
+3. Next time you push to this repository, you will see a CI pipeline being created (eg. https://gitlab.freedesktop.org/tomeu/linux/-/pipelines)
+
+4. The various jobs will be run and when the pipeline is finished, all jobs should be green unless a regression has been found.
+
+
+How to update test expectations
+===============================
+
+If your changes to the code fix any tests, you will have to update one or more of the files in drivers/gpu/drm/msm/ci/msm_*_results.txt, for each of the test platforms affected by the change.
+
+If you have run a pipeline and it failed because of a mismatched test result, you will have been offered a patch at the end of the run that you can apply after reviewing it.
+
+
+How to expand coverage
+======================
+
+If your code changes makes it possible to run more tests (by solving reliability issues, for example), more tests can be added to this list, and then the expected results updated with the patch file that will be printed at the end of each job.
+
+If there is a need for updating the version of IGT being used (maybe you have added more tests to it), follow the instructions at https://gitlab.freedesktop.org/gfx-ci/drm-ci/-/tree/msm#upreving-igt.
+
+
+How to test your changes to the scripts
+==========================================
+
+For testing changes to the scripts in the drm-ci repo, change the DRM_CI_PROJECT_PATH variable in drivers/gpu/drm/msm/ci/gitlab-ci.yml to match your fork of the project (eg. tomeu/drm-ci). This fork needs to be in https://gitlab.freedesktop.org/.
\ No newline at end of file
diff --git a/drivers/gpu/drm/msm/ci/gitlab-ci.yml b/drivers/gpu/drm/msm/ci/gitlab-ci.yml
new file mode 100644
index 000000000000..9b7caa7fcab2
--- /dev/null
+++ b/drivers/gpu/drm/msm/ci/gitlab-ci.yml
@@ -0,0 +1,11 @@
+variables:
+  # Change this to use your fork of drm-ci
+  DRM_CI_PROJECT_PATH: &drm-ci-project-path gfx-ci/drm-ci
+  DRM_CI_COMMIT_SHA: &drm-ci-commit-sha msm
+
+include:
+  - project: *drm-ci-project-path
+    ref: *drm-ci-commit-sha
+    file:
+      - '.msm-gitlab-ci.yml'
+      - '.gitlab-ci.yml'
diff --git a/drivers/gpu/drm/msm/ci/msm.testlist b/drivers/gpu/drm/msm/ci/msm.testlist
new file mode 100644
index 000000000000..8805a3bc7316
--- /dev/null
+++ b/drivers/gpu/drm/msm/ci/msm.testlist
@@ -0,0 +1,148 @@
+# Keep alphabetically sorted by default
+
+igt@core_auth@getclient-simple
+igt@core_auth@getclient-master-drop
+igt@core_auth@basic-auth
+igt@core_auth@many-magics
+igt@core_getclient
+igt@core_getstats
+igt@core_getversion
+igt@core_setmaster_vs_auth
+igt@drm_read@invalid-buffer
+igt@drm_read@fault-buffer
+igt@drm_read@empty-block
+igt@drm_read@empty-nonblock
+igt@drm_read@short-buffer-block
+igt@drm_read@short-buffer-nonblock
+igt@drm_read@short-buffer-wakeup
+igt@kms_addfb_basic@unused-handle
+igt@kms_addfb_basic@unused-pitches
+igt@kms_addfb_basic@unused-offsets
+igt@kms_addfb_basic@unused-modifier
+igt@kms_addfb_basic@legacy-format
+igt@kms_addfb_basic@no-handle
+igt@kms_addfb_basic@basic
+igt@kms_addfb_basic@bad-pitch-0
+igt@kms_addfb_basic@bad-pitch-32
+igt@kms_addfb_basic@bad-pitch-63
+igt@kms_addfb_basic@bad-pitch-128
+igt@kms_addfb_basic@bad-pitch-256
+igt@kms_addfb_basic@bad-pitch-1024
+igt@kms_addfb_basic@bad-pitch-999
+igt@kms_addfb_basic@bad-pitch-65536
+igt@kms_addfb_basic@size-max
+igt@kms_addfb_basic@too-wide
+igt@kms_addfb_basic@too-high
+igt@kms_addfb_basic@bo-too-small
+igt@kms_addfb_basic@small-bo
+igt@kms_addfb_basic@addfb25-modifier-no-flag
+igt@kms_addfb_basic@addfb25-bad-modifier
+igt@kms_addfb_basic@invalid-get-prop-any
+igt@kms_addfb_basic@invalid-get-prop
+igt@kms_addfb_basic@invalid-set-prop-any
+igt@kms_addfb_basic@invalid-set-prop
+igt@kms_addfb_basic@master-rmfb
+igt@kms_atomic@plane-overlay-legacy
+igt@kms_atomic@plane-primary-legacy
+igt@kms_atomic@plane-primary-overlay-mutable-zpos
+igt@kms_atomic@plane-immutable-zpos
+igt@kms_atomic@test-only
+igt@kms_atomic@plane-cursor-legacy
+igt@kms_atomic@plane-invalid-params
+igt@kms_atomic@crtc-invalid-params
+igt@kms_atomic@atomic-invalid-params
+igt@kms_atomic@atomic_plane_damage
+igt@kms_atomic_interruptible@legacy-setmode@pipe-a-edp-1
+igt@kms_atomic_interruptible@atomic-setmode@pipe-a-edp-1
+igt@kms_atomic_interruptible@legacy-dpms@pipe-a-edp-1
+igt@kms_atomic_interruptible@legacy-pageflip@pipe-a-edp-1
+igt@kms_atomic_interruptible@legacy-cursor@pipe-a-edp-1
+igt@kms_atomic_interruptible@universal-setplane-primary@pipe-a-edp-1
+igt@kms_atomic_interruptible@universal-setplane-cursor@pipe-a-edp-1
+igt@kms_content_protection@LIC
+igt@kms_flip_event_leak
+igt@kms_getfb@getfb-handle-zero
+igt@kms_getfb@getfb-handle-valid
+igt@kms_getfb@getfb-handle-closed
+igt@kms_getfb@getfb-handle-not-fb
+igt@kms_getfb@getfb-addfb-different-handles
+igt@kms_getfb@getfb-repeated-different-handles
+igt@kms_getfb@getfb2-handle-zero
+igt@kms_getfb@getfb2-handle-closed
+igt@kms_getfb@getfb2-handle-not-fb
+igt@kms_getfb@getfb2-into-addfb2
+igt@kms_getfb@getfb-handle-protection
+igt@kms_getfb@getfb2-handle-protection
+igt@kms_hdmi_inject@inject-4k
+igt@kms_multipipe_modeset@basic-max-pipe-crc-check
+igt@kms_pipe_crc_basic@bad-source
+igt@kms_pipe_crc_basic@read-crc-pipe-a
+igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence
+igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a
+igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a-frame-sequence
+igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-a
+igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-a
+igt@kms_pipe_crc_basic@read-crc-pipe-b
+igt@kms_pipe_crc_basic@read-crc-pipe-b-frame-sequence
+igt@kms_pipe_crc_basic@nonblocking-crc-pipe-b
+igt@kms_pipe_crc_basic@nonblocking-crc-pipe-b-frame-sequence
+igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-b
+igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-b
+igt@kms_prop_blob@basic
+igt@kms_prop_blob@blob-prop-core
+igt@kms_prop_blob@blob-prop-validate
+igt@kms_prop_blob@blob-prop-lifetime
+igt@kms_prop_blob@blob-multiple
+igt@kms_prop_blob@invalid-get-prop-any
+igt@kms_prop_blob@invalid-get-prop
+igt@kms_prop_blob@invalid-set-prop-any
+igt@kms_prop_blob@invalid-set-prop
+igt@kms_rmfb@rmfb-ioctl
+igt@kms_rmfb@close-fd
+igt@kms_setmode@basic@pipe-a-edp-1
+igt@kms_setmode@basic@pipe-b-edp-1
+
+# Flakes on a530 with:
+# arm-smmu b40000.iommu: Unhandled context fault: fsr=0x408, iova=0x01003000, fsynr=0x13, cbfrsynra=0x0, cb=0
+# igt@msm_mapping@ring
+
+igt@msm_mapping@sqefw
+igt@msm_mapping@shadow
+igt@msm_recovery@hangcheck
+igt@msm_recovery@gpu-fault
+igt@msm_recovery@iova-fault
+igt@msm_submit@empty-submit
+igt@msm_submit@invalid-queue-submit
+igt@msm_submit@invalid-flags-submit
+igt@msm_submit@invalid-in-fence-submit
+igt@msm_submit@invalid-duplicate-bo-submit
+igt@msm_submit@invalid-cmd-idx-submit
+igt@msm_submit@invalid-cmd-type-submit
+igt@msm_submit@valid-submit
+igt@kms_sysfs_edid_timing
+igt@kms_universal_plane@universal-plane-pipe-a-functional
+igt@kms_universal_plane@disable-primary-vs-flip-pipe-a
+igt@kms_universal_plane@disable-primary-vs-flip-pipe-b
+igt@kms_vblank@invalid
+igt@kms_vblank@crtc-id
+igt@kms_vblank@pipe-a-query-idle
+igt@kms_vblank@pipe-a-query-forked
+igt@kms_vblank@pipe-a-query-busy
+igt@kms_vblank@pipe-a-query-forked-busy
+igt@kms_vblank@pipe-a-wait-idle
+igt@kms_vblank@pipe-a-wait-forked
+igt@kms_vblank@pipe-a-wait-busy
+igt@kms_vblank@pipe-a-wait-forked-busy
+igt@kms_vblank@pipe-a-ts-continuation-idle
+igt@kms_vblank@pipe-a-ts-continuation-modeset
+igt@kms_vblank@pipe-b-accuracy-idle
+igt@kms_vblank@pipe-b-query-idle
+igt@kms_vblank@pipe-b-query-forked
+igt@kms_vblank@pipe-b-query-busy
+igt@kms_vblank@pipe-b-query-forked-busy
+igt@kms_vblank@pipe-b-wait-idle
+igt@kms_vblank@pipe-b-wait-forked
+igt@kms_vblank@pipe-b-wait-busy
+igt@kms_vblank@pipe-b-wait-forked-busy
+igt@kms_vblank@pipe-b-ts-continuation-idle
+igt@kms_vblank@pipe-b-ts-continuation-modeset
diff --git a/drivers/gpu/drm/msm/ci/msm_apq8016_results.txt b/drivers/gpu/drm/msm/ci/msm_apq8016_results.txt
new file mode 100644
index 000000000000..2cad61d89faf
--- /dev/null
+++ b/drivers/gpu/drm/msm/ci/msm_apq8016_results.txt
@@ -0,0 +1,140 @@
+igt@core_auth@getclient-simple,pass
+igt@core_auth@getclient-master-drop,pass
+igt@core_auth@basic-auth,pass
+igt@core_auth@many-magics,pass
+igt@core_getclient,pass
+igt@core_getstats,pass
+igt@core_getversion,pass
+igt@core_setmaster_vs_auth,pass
+igt@drm_read@invalid-buffer,skip
+igt@drm_read@fault-buffer,skip
+igt@drm_read@empty-block,skip
+igt@drm_read@empty-nonblock,skip
+igt@drm_read@short-buffer-block,skip
+igt@drm_read@short-buffer-nonblock,skip
+igt@drm_read@short-buffer-wakeup,skip
+igt@kms_addfb_basic@unused-handle,pass
+igt@kms_addfb_basic@unused-pitches,pass
+igt@kms_addfb_basic@unused-offsets,pass
+igt@kms_addfb_basic@unused-modifier,pass
+igt@kms_addfb_basic@legacy-format,dmesg-warn
+igt@kms_addfb_basic@no-handle,pass
+igt@kms_addfb_basic@basic,pass
+igt@kms_addfb_basic@bad-pitch-0,pass
+igt@kms_addfb_basic@bad-pitch-32,pass
+igt@kms_addfb_basic@bad-pitch-63,pass
+igt@kms_addfb_basic@bad-pitch-128,pass
+igt@kms_addfb_basic@bad-pitch-256,pass
+igt@kms_addfb_basic@bad-pitch-1024,pass
+igt@kms_addfb_basic@bad-pitch-999,pass
+igt@kms_addfb_basic@bad-pitch-65536,pass
+igt@kms_addfb_basic@size-max,pass
+igt@kms_addfb_basic@too-wide,pass
+igt@kms_addfb_basic@too-high,dmesg-warn
+igt@kms_addfb_basic@bo-too-small,pass
+igt@kms_addfb_basic@small-bo,pass
+igt@kms_addfb_basic@addfb25-modifier-no-flag,pass
+igt@kms_addfb_basic@addfb25-bad-modifier,fail
+igt@kms_addfb_basic@invalid-get-prop-any,pass
+igt@kms_addfb_basic@invalid-get-prop,pass
+igt@kms_addfb_basic@invalid-set-prop-any,pass
+igt@kms_addfb_basic@invalid-set-prop,pass
+igt@kms_addfb_basic@master-rmfb,pass
+igt@kms_atomic@plane-overlay-legacy,skip
+igt@kms_atomic@plane-primary-legacy,skip
+igt@kms_atomic@plane-primary-overlay-mutable-zpos,skip
+igt@kms_atomic@plane-immutable-zpos,skip
+igt@kms_atomic@test-only,skip
+igt@kms_atomic@plane-cursor-legacy,skip
+igt@kms_atomic@plane-invalid-params,skip
+igt@kms_atomic@crtc-invalid-params,skip
+igt@kms_atomic@atomic-invalid-params,skip
+igt@kms_atomic@atomic_plane_damage,skip
+igt@kms_atomic_interruptible@legacy-setmode,skip
+igt@kms_atomic_interruptible@atomic-setmode,skip
+igt@kms_atomic_interruptible@legacy-dpms,skip
+igt@kms_atomic_interruptible@legacy-pageflip,skip
+igt@kms_atomic_interruptible@legacy-cursor,skip
+igt@kms_atomic_interruptible@universal-setplane-primary,skip
+igt@kms_atomic_interruptible@universal-setplane-cursor,skip
+igt@kms_content_protection@lic,skip
+igt@kms_flip_event_leak,skip
+igt@kms_getfb@getfb-handle-zero,pass
+igt@kms_getfb@getfb-handle-valid,pass
+igt@kms_getfb@getfb-handle-closed,pass
+igt@kms_getfb@getfb-handle-not-fb,pass
+igt@kms_getfb@getfb-addfb-different-handles,pass
+igt@kms_getfb@getfb-repeated-different-handles,pass
+igt@kms_getfb@getfb2-handle-zero,pass
+igt@kms_getfb@getfb2-handle-closed,pass
+igt@kms_getfb@getfb2-handle-not-fb,pass
+igt@kms_getfb@getfb2-into-addfb2,pass
+igt@kms_getfb@getfb-handle-protection,pass
+igt@kms_getfb@getfb2-handle-protection,pass
+igt@kms_hdmi_inject@inject-4k,fail
+igt@kms_multipipe_modeset@basic-max-pipe-crc-check,skip
+igt@kms_pipe_crc_basic@bad-source,skip
+igt@kms_pipe_crc_basic@read-crc-pipe-a,skip
+igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence,skip
+igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a,skip
+igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a-frame-sequence,skip
+igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-a,skip
+igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-a,skip
+igt@kms_pipe_crc_basic@read-crc-pipe-b,skip
+igt@kms_pipe_crc_basic@read-crc-pipe-b-frame-sequence,skip
+igt@kms_pipe_crc_basic@nonblocking-crc-pipe-b,skip
+igt@kms_pipe_crc_basic@nonblocking-crc-pipe-b-frame-sequence,skip
+igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-b,skip
+igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-b,skip
+igt@kms_prop_blob@basic,pass
+igt@kms_prop_blob@blob-prop-core,pass
+igt@kms_prop_blob@blob-prop-validate,pass
+igt@kms_prop_blob@blob-prop-lifetime,pass
+igt@kms_prop_blob@blob-multiple,pass
+igt@kms_prop_blob@invalid-get-prop-any,pass
+igt@kms_prop_blob@invalid-get-prop,pass
+igt@kms_prop_blob@invalid-set-prop-any,pass
+igt@kms_prop_blob@invalid-set-prop,pass
+igt@kms_rmfb@rmfb-ioctl,skip
+igt@kms_rmfb@close-fd,skip
+igt@kms_setmode@basic,skip
+igt@msm_mapping@sqefw,skip
+igt@msm_mapping@shadow,skip
+igt@msm_recovery@hangcheck,skip
+igt@msm_recovery@gpu-fault,skip
+igt@msm_recovery@iova-fault,skip
+igt@msm_submit@empty-submit,pass
+igt@msm_submit@invalid-queue-submit,pass
+igt@msm_submit@invalid-flags-submit,pass
+igt@msm_submit@invalid-in-fence-submit,pass
+igt@msm_submit@invalid-duplicate-bo-submit,dmesg-warn
+igt@msm_submit@invalid-cmd-idx-submit,dmesg-warn
+igt@msm_submit@invalid-cmd-type-submit,dmesg-warn
+igt@msm_submit@valid-submit,pass
+igt@kms_sysfs_edid_timing,pass
+igt@kms_universal_plane@universal-plane-pipe-a-functional,skip
+igt@kms_universal_plane@disable-primary-vs-flip-pipe-a,skip
+igt@kms_universal_plane@disable-primary-vs-flip-pipe-b,skip
+igt@kms_vblank@invalid,skip
+igt@kms_vblank@crtc-id,skip
+igt@kms_vblank@pipe-a-query-idle,skip
+igt@kms_vblank@pipe-a-query-forked,skip
+igt@kms_vblank@pipe-a-query-busy,skip
+igt@kms_vblank@pipe-a-query-forked-busy,skip
+igt@kms_vblank@pipe-a-wait-idle,skip
+igt@kms_vblank@pipe-a-wait-forked,skip
+igt@kms_vblank@pipe-a-wait-busy,skip
+igt@kms_vblank@pipe-a-wait-forked-busy,skip
+igt@kms_vblank@pipe-a-ts-continuation-idle,skip
+igt@kms_vblank@pipe-a-ts-continuation-modeset,skip
+igt@kms_vblank@pipe-b-accuracy-idle,skip
+igt@kms_vblank@pipe-b-query-idle,skip
+igt@kms_vblank@pipe-b-query-forked,skip
+igt@kms_vblank@pipe-b-query-busy,skip
+igt@kms_vblank@pipe-b-query-forked-busy,skip
+igt@kms_vblank@pipe-b-wait-idle,skip
+igt@kms_vblank@pipe-b-wait-forked,skip
+igt@kms_vblank@pipe-b-wait-busy,skip
+igt@kms_vblank@pipe-b-wait-forked-busy,skip
+igt@kms_vblank@pipe-b-ts-continuation-idle,skip
+igt@kms_vblank@pipe-b-ts-continuation-modeset,skip
diff --git a/drivers/gpu/drm/msm/ci/msm_apq8096_results.txt b/drivers/gpu/drm/msm/ci/msm_apq8096_results.txt
new file mode 100644
index 000000000000..6f10941e5626
--- /dev/null
+++ b/drivers/gpu/drm/msm/ci/msm_apq8096_results.txt
@@ -0,0 +1,140 @@
+igt@core_auth@getclient-simple,pass
+igt@core_auth@getclient-master-drop,pass
+igt@core_auth@basic-auth,pass
+igt@core_auth@many-magics,pass
+igt@core_getclient,pass
+igt@core_getstats,pass
+igt@core_getversion,pass
+igt@core_setmaster_vs_auth,pass
+igt@drm_read@invalid-buffer,skip
+igt@drm_read@fault-buffer,skip
+igt@drm_read@empty-block,skip
+igt@drm_read@empty-nonblock,skip
+igt@drm_read@short-buffer-block,skip
+igt@drm_read@short-buffer-nonblock,skip
+igt@drm_read@short-buffer-wakeup,skip
+igt@kms_addfb_basic@unused-handle,pass
+igt@kms_addfb_basic@unused-pitches,pass
+igt@kms_addfb_basic@unused-offsets,pass
+igt@kms_addfb_basic@unused-modifier,pass
+igt@kms_addfb_basic@legacy-format,dmesg-warn
+igt@kms_addfb_basic@no-handle,pass
+igt@kms_addfb_basic@basic,pass
+igt@kms_addfb_basic@bad-pitch-0,pass
+igt@kms_addfb_basic@bad-pitch-32,pass
+igt@kms_addfb_basic@bad-pitch-63,pass
+igt@kms_addfb_basic@bad-pitch-128,pass
+igt@kms_addfb_basic@bad-pitch-256,pass
+igt@kms_addfb_basic@bad-pitch-1024,pass
+igt@kms_addfb_basic@bad-pitch-999,pass
+igt@kms_addfb_basic@bad-pitch-65536,pass
+igt@kms_addfb_basic@size-max,pass
+igt@kms_addfb_basic@too-wide,pass
+igt@kms_addfb_basic@too-high,dmesg-warn
+igt@kms_addfb_basic@bo-too-small,pass
+igt@kms_addfb_basic@small-bo,pass
+igt@kms_addfb_basic@addfb25-modifier-no-flag,pass
+igt@kms_addfb_basic@addfb25-bad-modifier,fail
+igt@kms_addfb_basic@invalid-get-prop-any,pass
+igt@kms_addfb_basic@invalid-get-prop,pass
+igt@kms_addfb_basic@invalid-set-prop-any,pass
+igt@kms_addfb_basic@invalid-set-prop,pass
+igt@kms_addfb_basic@master-rmfb,pass
+igt@kms_atomic@plane-overlay-legacy,skip
+igt@kms_atomic@plane-primary-legacy,skip
+igt@kms_atomic@plane-primary-overlay-mutable-zpos,skip
+igt@kms_atomic@plane-immutable-zpos,skip
+igt@kms_atomic@test-only,skip
+igt@kms_atomic@plane-cursor-legacy,skip
+igt@kms_atomic@plane-invalid-params,skip
+igt@kms_atomic@crtc-invalid-params,skip
+igt@kms_atomic@atomic-invalid-params,skip
+igt@kms_atomic@atomic_plane_damage,skip
+igt@kms_atomic_interruptible@legacy-setmode,skip
+igt@kms_atomic_interruptible@atomic-setmode,skip
+igt@kms_atomic_interruptible@legacy-dpms,skip
+igt@kms_atomic_interruptible@legacy-pageflip,skip
+igt@kms_atomic_interruptible@legacy-cursor,skip
+igt@kms_atomic_interruptible@universal-setplane-primary,skip
+igt@kms_atomic_interruptible@universal-setplane-cursor,skip
+igt@kms_content_protection@lic,skip
+igt@kms_flip_event_leak,skip
+igt@kms_getfb@getfb-handle-zero,pass
+igt@kms_getfb@getfb-handle-valid,pass
+igt@kms_getfb@getfb-handle-closed,pass
+igt@kms_getfb@getfb-handle-not-fb,pass
+igt@kms_getfb@getfb-addfb-different-handles,pass
+igt@kms_getfb@getfb-repeated-different-handles,pass
+igt@kms_getfb@getfb2-handle-zero,pass
+igt@kms_getfb@getfb2-handle-closed,pass
+igt@kms_getfb@getfb2-handle-not-fb,pass
+igt@kms_getfb@getfb2-into-addfb2,pass
+igt@kms_getfb@getfb-handle-protection,pass
+igt@kms_getfb@getfb2-handle-protection,pass
+igt@kms_hdmi_inject@inject-4k,dmesg-warn
+igt@kms_multipipe_modeset@basic-max-pipe-crc-check,skip
+igt@kms_pipe_crc_basic@bad-source,skip
+igt@kms_pipe_crc_basic@read-crc-pipe-a,skip
+igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence,skip
+igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a,skip
+igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a-frame-sequence,skip
+igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-a,skip
+igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-a,skip
+igt@kms_pipe_crc_basic@read-crc-pipe-b,skip
+igt@kms_pipe_crc_basic@read-crc-pipe-b-frame-sequence,skip
+igt@kms_pipe_crc_basic@nonblocking-crc-pipe-b,skip
+igt@kms_pipe_crc_basic@nonblocking-crc-pipe-b-frame-sequence,skip
+igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-b,skip
+igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-b,skip
+igt@kms_prop_blob@basic,pass
+igt@kms_prop_blob@blob-prop-core,pass
+igt@kms_prop_blob@blob-prop-validate,pass
+igt@kms_prop_blob@blob-prop-lifetime,pass
+igt@kms_prop_blob@blob-multiple,pass
+igt@kms_prop_blob@invalid-get-prop-any,pass
+igt@kms_prop_blob@invalid-get-prop,pass
+igt@kms_prop_blob@invalid-set-prop-any,pass
+igt@kms_prop_blob@invalid-set-prop,pass
+igt@kms_rmfb@rmfb-ioctl,skip
+igt@kms_rmfb@close-fd,skip
+igt@kms_setmode@basic,skip
+igt@msm_mapping@sqefw,skip
+igt@msm_mapping@shadow,skip
+igt@msm_recovery@hangcheck,skip
+igt@msm_recovery@gpu-fault,skip
+igt@msm_recovery@iova-fault,skip
+igt@msm_submit@empty-submit,pass
+igt@msm_submit@invalid-queue-submit,pass
+igt@msm_submit@invalid-flags-submit,pass
+igt@msm_submit@invalid-in-fence-submit,pass
+igt@msm_submit@invalid-duplicate-bo-submit,dmesg-warn
+igt@msm_submit@invalid-cmd-idx-submit,dmesg-warn
+igt@msm_submit@invalid-cmd-type-submit,dmesg-warn
+igt@msm_submit@valid-submit,pass
+igt@kms_sysfs_edid_timing,pass
+igt@kms_universal_plane@universal-plane-pipe-a-functional,skip
+igt@kms_universal_plane@disable-primary-vs-flip-pipe-a,skip
+igt@kms_universal_plane@disable-primary-vs-flip-pipe-b,skip
+igt@kms_vblank@invalid,skip
+igt@kms_vblank@crtc-id,skip
+igt@kms_vblank@pipe-a-query-idle,skip
+igt@kms_vblank@pipe-a-query-forked,skip
+igt@kms_vblank@pipe-a-query-busy,skip
+igt@kms_vblank@pipe-a-query-forked-busy,skip
+igt@kms_vblank@pipe-a-wait-idle,skip
+igt@kms_vblank@pipe-a-wait-forked,skip
+igt@kms_vblank@pipe-a-wait-busy,skip
+igt@kms_vblank@pipe-a-wait-forked-busy,skip
+igt@kms_vblank@pipe-a-ts-continuation-idle,skip
+igt@kms_vblank@pipe-a-ts-continuation-modeset,skip
+igt@kms_vblank@pipe-b-accuracy-idle,skip
+igt@kms_vblank@pipe-b-query-idle,skip
+igt@kms_vblank@pipe-b-query-forked,skip
+igt@kms_vblank@pipe-b-query-busy,skip
+igt@kms_vblank@pipe-b-query-forked-busy,skip
+igt@kms_vblank@pipe-b-wait-idle,skip
+igt@kms_vblank@pipe-b-wait-forked,skip
+igt@kms_vblank@pipe-b-wait-busy,skip
+igt@kms_vblank@pipe-b-wait-forked-busy,skip
+igt@kms_vblank@pipe-b-ts-continuation-idle,skip
+igt@kms_vblank@pipe-b-ts-continuation-modeset,skip
diff --git a/drivers/gpu/drm/msm/ci/msm_sc7180_results.txt b/drivers/gpu/drm/msm/ci/msm_sc7180_results.txt
new file mode 100644
index 000000000000..01f7b4b399b5
--- /dev/null
+++ b/drivers/gpu/drm/msm/ci/msm_sc7180_results.txt
@@ -0,0 +1,141 @@
+igt@core_auth@getclient-simple,dmesg-warn
+igt@core_auth@getclient-master-drop,pass
+igt@core_auth@basic-auth,pass
+igt@core_auth@many-magics,pass
+igt@core_getclient,pass
+igt@core_getstats,pass
+igt@core_getversion,pass
+igt@core_setmaster_vs_auth,pass
+igt@drm_read@invalid-buffer,pass
+igt@drm_read@fault-buffer,pass
+igt@drm_read@empty-block,pass
+igt@drm_read@empty-nonblock,pass
+igt@drm_read@short-buffer-block,pass
+igt@drm_read@short-buffer-nonblock,pass
+igt@drm_read@short-buffer-wakeup,pass
+igt@kms_addfb_basic@unused-handle,pass
+igt@kms_addfb_basic@unused-pitches,pass
+igt@kms_addfb_basic@unused-offsets,pass
+igt@kms_addfb_basic@unused-modifier,pass
+igt@kms_addfb_basic@legacy-format,dmesg-warn
+igt@kms_addfb_basic@no-handle,pass
+igt@kms_addfb_basic@basic,pass
+igt@kms_addfb_basic@bad-pitch-0,pass
+igt@kms_addfb_basic@bad-pitch-32,pass
+igt@kms_addfb_basic@bad-pitch-63,pass
+igt@kms_addfb_basic@bad-pitch-128,pass
+igt@kms_addfb_basic@bad-pitch-256,pass
+igt@kms_addfb_basic@bad-pitch-1024,pass
+igt@kms_addfb_basic@bad-pitch-999,pass
+igt@kms_addfb_basic@bad-pitch-65536,pass
+igt@kms_addfb_basic@size-max,pass
+igt@kms_addfb_basic@too-wide,pass
+igt@kms_addfb_basic@too-high,dmesg-warn
+igt@kms_addfb_basic@bo-too-small,pass
+igt@kms_addfb_basic@small-bo,pass
+igt@kms_addfb_basic@addfb25-modifier-no-flag,pass
+igt@kms_addfb_basic@addfb25-bad-modifier,dmesg-warn
+igt@kms_addfb_basic@invalid-get-prop-any,pass
+igt@kms_addfb_basic@invalid-get-prop,pass
+igt@kms_addfb_basic@invalid-set-prop-any,pass
+igt@kms_addfb_basic@invalid-set-prop,pass
+igt@kms_addfb_basic@master-rmfb,pass
+igt@kms_atomic@plane-overlay-legacy,skip
+igt@kms_atomic@plane-primary-legacy,pass
+igt@kms_atomic@plane-primary-overlay-mutable-zpos,skip
+igt@kms_atomic@plane-immutable-zpos,pass
+igt@kms_atomic@test-only,pass
+igt@kms_atomic@plane-cursor-legacy,pass
+igt@kms_atomic@plane-invalid-params,pass
+igt@kms_atomic@crtc-invalid-params,pass
+igt@kms_atomic@atomic-invalid-params,pass
+igt@kms_atomic@atomic_plane_damage,pass
+igt@kms_atomic_interruptible@legacy-setmode,skip
+igt@kms_atomic_interruptible@atomic-setmode,skip
+igt@kms_atomic_interruptible@legacy-dpms,skip
+igt@kms_atomic_interruptible@legacy-pageflip,skip
+igt@kms_atomic_interruptible@legacy-cursor,skip
+igt@kms_atomic_interruptible@universal-setplane-primary,skip
+igt@kms_atomic_interruptible@universal-setplane-cursor,skip
+igt@kms_content_protection@lic,skip
+igt@kms_flip_event_leak,pass
+igt@kms_getfb@getfb-handle-zero,pass
+igt@kms_getfb@getfb-handle-valid,pass
+igt@kms_getfb@getfb-handle-closed,pass
+igt@kms_getfb@getfb-handle-not-fb,pass
+igt@kms_getfb@getfb-addfb-different-handles,pass
+igt@kms_getfb@getfb-repeated-different-handles,pass
+igt@kms_getfb@getfb2-handle-zero,pass
+igt@kms_getfb@getfb2-handle-closed,pass
+igt@kms_getfb@getfb2-handle-not-fb,pass
+igt@kms_getfb@getfb2-into-addfb2,pass
+igt@kms_getfb@getfb-handle-protection,pass
+igt@kms_getfb@getfb2-handle-protection,pass
+igt@kms_hdmi_inject@inject-4k,skip
+igt@kms_multipipe_modeset@basic-max-pipe-crc-check,skip
+igt@kms_pipe_crc_basic@bad-source,pass
+igt@kms_pipe_crc_basic@read-crc-pipe-a,pass
+igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence,pass
+igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a,pass
+igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a-frame-sequence,pass
+igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-a,pass
+igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-a,pass
+igt@kms_pipe_crc_basic@read-crc-pipe-b,pass
+igt@kms_pipe_crc_basic@read-crc-pipe-b-frame-sequence,pass
+igt@kms_pipe_crc_basic@nonblocking-crc-pipe-b,pass
+igt@kms_pipe_crc_basic@nonblocking-crc-pipe-b-frame-sequence,pass
+igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-b,pass
+igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-b,pass
+igt@kms_prop_blob@basic,pass
+igt@kms_prop_blob@blob-prop-core,pass
+igt@kms_prop_blob@blob-prop-validate,pass
+igt@kms_prop_blob@blob-prop-lifetime,pass
+igt@kms_prop_blob@blob-multiple,pass
+igt@kms_prop_blob@invalid-get-prop-any,pass
+igt@kms_prop_blob@invalid-get-prop,pass
+igt@kms_prop_blob@invalid-set-prop-any,pass
+igt@kms_prop_blob@invalid-set-prop,pass
+igt@kms_rmfb@rmfb-ioctl,pass
+igt@kms_rmfb@close-fd,fail
+igt@kms_setmode@basic@pipe-a-edp-1,pass
+igt@kms_setmode@basic@pipe-b-edp-1,pass
+igt@msm_mapping@sqefw,dmesg-fail
+igt@msm_mapping@shadow,dmesg-fail
+igt@msm_recovery@hangcheck,dmesg-warn
+igt@msm_recovery@gpu-fault,dmesg-warn
+igt@msm_recovery@iova-fault,dmesg-warn
+igt@msm_submit@empty-submit,pass
+igt@msm_submit@invalid-queue-submit,pass
+igt@msm_submit@invalid-flags-submit,pass
+igt@msm_submit@invalid-in-fence-submit,pass
+igt@msm_submit@invalid-duplicate-bo-submit,dmesg-warn
+igt@msm_submit@invalid-cmd-idx-submit,dmesg-warn
+igt@msm_submit@invalid-cmd-type-submit,dmesg-warn
+igt@msm_submit@valid-submit,pass
+igt@kms_sysfs_edid_timing,pass
+igt@kms_universal_plane@universal-plane-pipe-a-functional,skip
+igt@kms_universal_plane@disable-primary-vs-flip-pipe-a,pass
+igt@kms_universal_plane@disable-primary-vs-flip-pipe-b,fail
+igt@kms_vblank@invalid,pass
+igt@kms_vblank@crtc-id,pass
+igt@kms_vblank@pipe-a-query-idle,pass
+igt@kms_vblank@pipe-a-query-forked,pass
+igt@kms_vblank@pipe-a-query-busy,pass
+igt@kms_vblank@pipe-a-query-forked-busy,pass
+igt@kms_vblank@pipe-a-wait-idle,pass
+igt@kms_vblank@pipe-a-wait-forked,pass
+igt@kms_vblank@pipe-a-wait-busy,pass
+igt@kms_vblank@pipe-a-wait-forked-busy,pass
+igt@kms_vblank@pipe-a-ts-continuation-idle,pass
+igt@kms_vblank@pipe-a-ts-continuation-modeset,pass
+igt@kms_vblank@pipe-b-accuracy-idle,pass
+igt@kms_vblank@pipe-b-query-idle,pass
+igt@kms_vblank@pipe-b-query-forked,pass
+igt@kms_vblank@pipe-b-query-busy,pass
+igt@kms_vblank@pipe-b-query-forked-busy,pass
+igt@kms_vblank@pipe-b-wait-idle,pass
+igt@kms_vblank@pipe-b-wait-forked,pass
+igt@kms_vblank@pipe-b-wait-busy,pass
+igt@kms_vblank@pipe-b-wait-forked-busy,pass
+igt@kms_vblank@pipe-b-ts-continuation-idle,pass
+igt@kms_vblank@pipe-b-ts-continuation-modeset,pass
diff --git a/drivers/gpu/drm/msm/ci/msm_sdm845_results.txt b/drivers/gpu/drm/msm/ci/msm_sdm845_results.txt
new file mode 100644
index 000000000000..3df1e5ef6d80
--- /dev/null
+++ b/drivers/gpu/drm/msm/ci/msm_sdm845_results.txt
@@ -0,0 +1,141 @@
+igt@core_auth@getclient-simple,dmesg-warn
+igt@core_auth@getclient-master-drop,pass
+igt@core_auth@basic-auth,pass
+igt@core_auth@many-magics,pass
+igt@core_getclient,pass
+igt@core_getstats,pass
+igt@core_getversion,pass
+igt@core_setmaster_vs_auth,pass
+igt@drm_read@invalid-buffer,pass
+igt@drm_read@fault-buffer,pass
+igt@drm_read@empty-block,pass
+igt@drm_read@empty-nonblock,pass
+igt@drm_read@short-buffer-block,pass
+igt@drm_read@short-buffer-nonblock,pass
+igt@drm_read@short-buffer-wakeup,pass
+igt@kms_addfb_basic@unused-handle,pass
+igt@kms_addfb_basic@unused-pitches,pass
+igt@kms_addfb_basic@unused-offsets,pass
+igt@kms_addfb_basic@unused-modifier,pass
+igt@kms_addfb_basic@legacy-format,dmesg-warn
+igt@kms_addfb_basic@no-handle,pass
+igt@kms_addfb_basic@basic,pass
+igt@kms_addfb_basic@bad-pitch-0,pass
+igt@kms_addfb_basic@bad-pitch-32,pass
+igt@kms_addfb_basic@bad-pitch-63,pass
+igt@kms_addfb_basic@bad-pitch-128,pass
+igt@kms_addfb_basic@bad-pitch-256,pass
+igt@kms_addfb_basic@bad-pitch-1024,pass
+igt@kms_addfb_basic@bad-pitch-999,pass
+igt@kms_addfb_basic@bad-pitch-65536,pass
+igt@kms_addfb_basic@size-max,pass
+igt@kms_addfb_basic@too-wide,pass
+igt@kms_addfb_basic@too-high,dmesg-warn
+igt@kms_addfb_basic@bo-too-small,pass
+igt@kms_addfb_basic@small-bo,pass
+igt@kms_addfb_basic@addfb25-modifier-no-flag,pass
+igt@kms_addfb_basic@addfb25-bad-modifier,dmesg-warn
+igt@kms_addfb_basic@invalid-get-prop-any,pass
+igt@kms_addfb_basic@invalid-get-prop,pass
+igt@kms_addfb_basic@invalid-set-prop-any,pass
+igt@kms_addfb_basic@invalid-set-prop,pass
+igt@kms_addfb_basic@master-rmfb,pass
+igt@kms_atomic@plane-overlay-legacy,dmesg-warn
+igt@kms_atomic@plane-primary-legacy,dmesg-warn
+igt@kms_atomic@plane-primary-overlay-mutable-zpos,dmesg-warn
+igt@kms_atomic@plane-immutable-zpos,dmesg-warn
+igt@kms_atomic@test-only,dmesg-warn
+igt@kms_atomic@plane-cursor-legacy,dmesg-warn
+igt@kms_atomic@plane-invalid-params,dmesg-warn
+igt@kms_atomic@crtc-invalid-params,dmesg-warn
+igt@kms_atomic@atomic-invalid-params,dmesg-warn
+igt@kms_atomic@atomic_plane_damage,dmesg-warn
+igt@kms_atomic_interruptible@legacy-setmode,skip
+igt@kms_atomic_interruptible@atomic-setmode,skip
+igt@kms_atomic_interruptible@legacy-dpms,skip
+igt@kms_atomic_interruptible@legacy-pageflip,skip
+igt@kms_atomic_interruptible@legacy-cursor,skip
+igt@kms_atomic_interruptible@universal-setplane-primary,skip
+igt@kms_atomic_interruptible@universal-setplane-cursor,skip
+igt@kms_content_protection@lic,skip
+igt@kms_flip_event_leak,dmesg-warn
+igt@kms_getfb@getfb-handle-zero,pass
+igt@kms_getfb@getfb-handle-valid,pass
+igt@kms_getfb@getfb-handle-closed,pass
+igt@kms_getfb@getfb-handle-not-fb,pass
+igt@kms_getfb@getfb-addfb-different-handles,pass
+igt@kms_getfb@getfb-repeated-different-handles,pass
+igt@kms_getfb@getfb2-handle-zero,pass
+igt@kms_getfb@getfb2-handle-closed,pass
+igt@kms_getfb@getfb2-handle-not-fb,pass
+igt@kms_getfb@getfb2-into-addfb2,pass
+igt@kms_getfb@getfb-handle-protection,pass
+igt@kms_getfb@getfb2-handle-protection,pass
+igt@kms_hdmi_inject@inject-4k,skip
+igt@kms_multipipe_modeset@basic-max-pipe-crc-check,pass
+igt@kms_pipe_crc_basic@bad-source,pass
+igt@kms_pipe_crc_basic@read-crc-pipe-a,pass
+igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence,pass
+igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a,pass
+igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a-frame-sequence,pass
+igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-a,dmesg-warn
+igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-a,dmesg-warn
+igt@kms_pipe_crc_basic@read-crc-pipe-b,skip
+igt@kms_pipe_crc_basic@read-crc-pipe-b-frame-sequence,skip
+igt@kms_pipe_crc_basic@nonblocking-crc-pipe-b,skip
+igt@kms_pipe_crc_basic@nonblocking-crc-pipe-b-frame-sequence,skip
+igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-b,skip
+igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-b,skip
+igt@kms_prop_blob@basic,pass
+igt@kms_prop_blob@blob-prop-core,pass
+igt@kms_prop_blob@blob-prop-validate,pass
+igt@kms_prop_blob@blob-prop-lifetime,pass
+igt@kms_prop_blob@blob-multiple,pass
+igt@kms_prop_blob@invalid-get-prop-any,pass
+igt@kms_prop_blob@invalid-get-prop,pass
+igt@kms_prop_blob@invalid-set-prop-any,pass
+igt@kms_prop_blob@invalid-set-prop,pass
+igt@kms_rmfb@rmfb-ioctl,pass
+igt@kms_rmfb@close-fd,fail
+igt@kms_setmode@basic@pipe-a-edp-1,dmesg-warn
+igt@kms_setmode@basic,skip
+igt@msm_mapping@sqefw,dmesg-fail
+igt@msm_mapping@shadow,dmesg-fail
+igt@msm_recovery@hangcheck,dmesg-warn
+igt@msm_recovery@gpu-fault,dmesg-warn
+igt@msm_recovery@iova-fault,dmesg-warn
+igt@msm_submit@empty-submit,pass
+igt@msm_submit@invalid-queue-submit,pass
+igt@msm_submit@invalid-flags-submit,pass
+igt@msm_submit@invalid-in-fence-submit,pass
+igt@msm_submit@invalid-duplicate-bo-submit,dmesg-warn
+igt@msm_submit@invalid-cmd-idx-submit,dmesg-warn
+igt@msm_submit@invalid-cmd-type-submit,dmesg-warn
+igt@msm_submit@valid-submit,pass
+igt@kms_sysfs_edid_timing,pass
+igt@kms_universal_plane@universal-plane-pipe-a-functional,dmesg-fail
+igt@kms_universal_plane@disable-primary-vs-flip-pipe-a,dmesg-warn
+igt@kms_universal_plane@disable-primary-vs-flip-pipe-b,skip
+igt@kms_vblank@invalid,dmesg-warn
+igt@kms_vblank@crtc-id,dmesg-warn
+igt@kms_vblank@pipe-a-query-idle,dmesg-warn
+igt@kms_vblank@pipe-a-query-forked,dmesg-warn
+igt@kms_vblank@pipe-a-query-busy,dmesg-warn
+igt@kms_vblank@pipe-a-query-forked-busy,dmesg-warn
+igt@kms_vblank@pipe-a-wait-idle,dmesg-warn
+igt@kms_vblank@pipe-a-wait-forked,dmesg-warn
+igt@kms_vblank@pipe-a-wait-busy,dmesg-warn
+igt@kms_vblank@pipe-a-wait-forked-busy,dmesg-warn
+igt@kms_vblank@pipe-a-ts-continuation-idle,dmesg-warn
+igt@kms_vblank@pipe-a-ts-continuation-modeset,dmesg-warn
+igt@kms_vblank@pipe-b-accuracy-idle,skip
+igt@kms_vblank@pipe-b-query-idle,skip
+igt@kms_vblank@pipe-b-query-forked,skip
+igt@kms_vblank@pipe-b-query-busy,skip
+igt@kms_vblank@pipe-b-query-forked-busy,skip
+igt@kms_vblank@pipe-b-wait-idle,skip
+igt@kms_vblank@pipe-b-wait-forked,skip
+igt@kms_vblank@pipe-b-wait-busy,skip
+igt@kms_vblank@pipe-b-wait-forked-busy,skip
+igt@kms_vblank@pipe-b-ts-continuation-idle,skip
+igt@kms_vblank@pipe-b-ts-continuation-modeset,skip
-- 
2.31.1

