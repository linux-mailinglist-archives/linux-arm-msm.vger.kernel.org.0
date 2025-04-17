Return-Path: <linux-arm-msm+bounces-54580-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 76CE5A91184
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Apr 2025 04:14:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D6936189146A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Apr 2025 02:14:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D14941C3F30;
	Thu, 17 Apr 2025 02:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ee1dAV2d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E30B62F24;
	Thu, 17 Apr 2025 02:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744856035; cv=none; b=bwmudyNOxBwPC4miIjavyKnMucXlEaMVPMLt6g748WIVde1h4uBHxo52XJKcI5JdBg9Z7yokv4vyeS90dVGERK2CpoQFy+juFpxwgCq30r7oNOUvfrJJsRVqPmlESNlSD4www71NC9c2OTQOyM6vPIAz6j7t+b+leWcFT6bc0m8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744856035; c=relaxed/simple;
	bh=1Q1P44umereBP6tcw6zfsMWt2C24FKVLfm0MbrgtGSo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dTVOjTXU8z0l52GCpCLdnFnXG5NJKjBZNtKD2jSoZh90ccexvsZqR4/26VhfkzRK5X//gGrMaM/sa/SzD+UaT53DNcI8W5AWHoChSh8IQEudVTGLfvreq9nZF/Qj8mn9r7khiQR4arZF99kLUJzP+PhjS36vUguSreDV5w9xE1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ee1dAV2d; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-39c1efc4577so140718f8f.0;
        Wed, 16 Apr 2025 19:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744856032; x=1745460832; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Glni7Ctegs0Uy0pmEHCLGfEY/faO7Dp8uDE4yyi7B7E=;
        b=ee1dAV2dmQ2icScQ9MbQhML0D/WQD7j9cfSrB14Ym2r/bQMvae++X2h5KGIzcy6tpJ
         xRLqiv+itKf1a2j+Q2aEg7tzdS4fTLcBIvDyFXMzR/2zIbMC0Zh2d7fLMxon9kvID/yD
         lRieBV9mRxl8pFOQXyfbZ9kB35urwn+o0+uGX8pmKk6KISn5DY01wmCVi1wllJoey9yF
         FEcGYICLZCCts8A5NMyQ2PvALyx/tBu8ELVfBPQ3IYabtnrWAlz8Tb4DNX7CE97WhcQM
         zrJ0WvOpw2Z7tTq7jhS1PovQO2bjcBi/SEAK6AvZCk6beAi1SHMM/k8zdqKIsGaeB/WE
         TY7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744856032; x=1745460832;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Glni7Ctegs0Uy0pmEHCLGfEY/faO7Dp8uDE4yyi7B7E=;
        b=d6oMR3mdm7La82TehJzoF0a4+gaZ9kJO2WQiP0KhU8dtuKvAgf+xGMlHEFAwgKvXkv
         8zFQDBodWm1eHmaWVBQMk0yQwdY6KRruMxJWzk015ttxZaBAqp7OYmxaxsq75lOQhZj2
         8l25xPvz0mr3S/a817mian73kmq031WEfzxnOKo2QTvJaX9EOSAy6lWjkmQNtjs5bqq5
         XUouSLCGgYsfoSD0Ld0O1tzsKS4KG1gEgKhbR2l3xjFbkXHRpCBAbpSr4NvBuzOxA2fZ
         6vQ1M3tNE132uwhMFpM0yO7+E49ledj5ngbG2qL7ZoIo/LimejzngzmLub89IhQ5VZlO
         2RIA==
X-Forwarded-Encrypted: i=1; AJvYcCV3RSZT9/8+flRGb5ka8D1dm+wesKOtmP5dyfM/ctXHb20DAGuZJK+tn7Ls/68H0x8UlKlQnq9opdQKrAPL@vger.kernel.org, AJvYcCW6jjto0LXresQbh/A8+GKVGrVvBh/HilrhbCtKihZhlI/USNanmq/utX1L9+KqyNEIh7gFDjvaaMIXxaV1@vger.kernel.org
X-Gm-Message-State: AOJu0YwN2nl0JjEYnQrOprP1/zS6YZor7TNenGOeNxIC6RRgEERKa162
	W4h2d01O8CGhBgWnmi4vpJ+Wf+vMpCtZkxRfFQThHcA0XHmsZXY=
X-Gm-Gg: ASbGnctyPj4iC8lzsz20cNtXpY33d4QuTgHwm4dw+BpeLBRIEihZ2aLSZDLq8UaWKQl
	ozR/gvjmg6xOHXktkw34GY56mvYD8OzsfwmKybN1kjAR0o/3h7zQFbKeGgZK1w+bXMNSve5qZ7c
	5w9/7VRIqjfQN4g1nGTaZFadV/0Fp1WPXkZ1pA7HF53+TvPvfT8cqmIc5/ckUb1CKeIL+8GuTOR
	aiA22vndhqo0l/h3wWrTfZSWGOXOEsbA7+1SeYj2eDUo7bNtey1KoyqCnSVsIpTe+z03hGOEJ50
	XhU5VVssZWnWpEtw0pQ96ZcAzJ7Yeh4w8aPVMn0a9fze4A==
X-Google-Smtp-Source: AGHT+IF6yRq9L3wSEJqVWwemj1Z9rNAIRILp+bcwijkxSF4HMMr/lypABvlcr6xh1EKHH98BRkJuqg==
X-Received: by 2002:a5d:64ae:0:b0:39c:11c0:eb98 with SMTP id ffacd0b85a97d-39ee5b9f651mr3707652f8f.39.1744856031791;
        Wed, 16 Apr 2025 19:13:51 -0700 (PDT)
Received: from alex-x1.lan ([84.226.118.249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4405b4d1236sm36940485e9.13.2025.04.16.19.13.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 19:13:51 -0700 (PDT)
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
To: Dmitry Baryshkov <lumag@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	dmitry.baryshkov@oss.qualcomm.com
Cc: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	laurentiu.tudor1@dell.com,
	abel.vesa@linaro.org,
	johan@kernel.org,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Subject: drm/msm/dp: Introduce link training per-segment for LTTPRs
Date: Thu, 17 Apr 2025 04:10:31 +0200
Message-ID: <20250417021349.148911-1-alex.vinarskis@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Recently added Initial LTTPR support in msm/dp has configured LTTPR(s)
to non-transparent mode to enable video output on X1E-based devices
that come with LTTPR on the motherboards. However, video would not work
if additional LTTPR(s) are present between sink and source, which is
the case for USB Type-C docks (eg. Dell WD19TB/WD22TB4), and at least
some universal Thunderbolt/USB Type-C monitors (eg. Dell U2725QE).

First, take into account LTTPR capabilities when computing max link
rate, number of lanes. Take into account previous discussion on the
lists - exit early if reading DPCD caps failed. This also fixes
"*ERROR* panel edid read failed" on some monitors which seems to be
caused by msm_dp_panel_read_sink_caps running before LTTPR(s) are
initialized.

Finally, implement link training per-segment. Pass lttpr_count to all
required helpers.
This seems to also partially improve UI (Wayland) hanging when
changing external display's link parameters (resolution, framerate):
* Prior to this series, via direct USB Type-C to display connection,
  attempt to change resolution or framerate hangs the UI, setting does
  not stick. Some back and forth replugging finally sets desired
  parameters.
* With this series, via direct USB Type-C to display connection,
  changing parameters works most of the time, without UI freezing. Via
  docking station/multiple LTTPRs the setting again does not stick.
* On Xorg changing link paramaters works in all combinations.

These appear to be mainlink initialization related, as in all cases LT
passes successfully.

Test matrix:
* Dell XPS 9345, Ubuntu 24.10, Gnome 47, Wayland (myself)
	* Left USB Type-C, Right USB Type-C
	* Direct monitor connection, Dell WD19TB, Dell WD22TB4, USB
          Type-C to HDMI dongle, USB Type-C to DP dongle
	* Dell AW3423DWF, Samsung LS24A600, dual Samsung LS24A600 (one
	  monitor per USB Type-C connector)
* Dell XPS 9345, Ubuntu 24.10, Gnome 47, Wayland (myself)
	* Left USB Type-C, Right USB Type-C
	* Direct monitor connection
	* Samsung S34BG85 (USB Type-C), Dell U2725QE (universal
          Thunderbolt/USB Type-C, probes with an LTTPR when in USB
          Type-C/DP Alt mode)
* Dell XPS 9345, Debian trixie/sid, Gnome 48, Wayland (Stefan Schmidt)
        * Left USB Type-C, Right USB Type-C
        * Dell WD15 Dock with DisplayPort connected
        * Dell HD22Q dock with HDMI connected
        * USB Type-C to HDMI dongle
        * Dell U3417W

In both cases, "Thunderbot Support"/"USB4 PCIE Tunneling" was disabled
in UEFI to force universal Thunderbolt/USB Type-C devices to work in
DP Alt mode.
In both cases laptops had HBR3 patches applied [1], resulting in
maximum successful link at 3440x1440@100hz and 4k@60hz respectively.
When using Dell WD22TB4/U2725QE, USB Type-C pin assigment D got enabled
and USB3.0 devices were working in parallel to video ouput.

Known issues:
* As mentioned above, it appears that on Gnome+Wayland framerate and
  resolution parameter adjustment is not stable.

Due to lack of access to the official DisplayPort specfication, changes
were primarily inspired by/reverse engineered from Intel's i915 driver.

[1] https://lore.kernel.org/all/20250226231436.16138-2-alex.vinarskis@gmail.com/

Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>

---

Changes in v3:
- Split 1st patch into 3
- Simplified handling of max_lttpr_lanes/max_lttpr_rate
- Moved lttpr_common_caps to msm_dp_link (not msm_dp_panel, as LTTPRs
  are link related, not panel related)
- Picked Stefan's T-b tag (last patch only, as 1st one is getting split)
- Droped Abel's R-b tags from 1st patch that got split due to high diff
- Fixed alignment issues, initialization of variables, debug prints
- Moved lttpr_count to avoid ugly pointer
- Link to v2: https://lore.kernel.org/all/20250311234109.136510-1-alex.vinarskis@gmail.com/

Changes in v2:
- Picked up Abel's R-b tags
- Fixed typo as per Abel, fixed readability as per Johan
- Updated cover and commit message on mailink issue which appears to be 
  specific to Gnome+Wayland. No problems on Xorg.
- Link to v1: https://lore.kernel.org/all/20250310211039.29843-1-alex.vinarskis@gmail.com/

Aleksandrs Vinarskis (4):
  drm/msm/dp: Fix support of LTTPR initialization
  drm/msm/dp: Account for LTTPRs capabilities
  drm/msm/dp: Prepare for link training per-segment for LTTPRs
  drm/msm/dp: Introduce link training per-segment for LTTPRs

 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 126 ++++++++++++++++++++--------
 drivers/gpu/drm/msm/dp/dp_display.c |  27 ++++--
 drivers/gpu/drm/msm/dp/dp_link.h    |   4 +
 drivers/gpu/drm/msm/dp/dp_panel.c   |  12 ++-
 4 files changed, 122 insertions(+), 47 deletions(-)

-- 
2.45.2


