Return-Path: <linux-arm-msm+bounces-57198-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B23FCAAEEE8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 01:01:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C23271BA7E1C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 23:01:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A59E828DF29;
	Wed,  7 May 2025 23:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i9zL3gzm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A86201A9B48;
	Wed,  7 May 2025 23:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746658884; cv=none; b=VYL3VwcO3ClcNHTsIuxuAs9eEPp8VOQWYaMK8xA9RudYBSrkwl3UMIPs5VzbPlVJddpPmEEoMyF8Te/4e6s1DV+5f90VnFc4av5tRvA6Sws1CZfq7R4PTSkTGpiMaRD/3BQd1k5xHfUeBQQLz4ewGMcKt6/UmOMM0/ZRL0bOYdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746658884; c=relaxed/simple;
	bh=ib/XOBn3U9EAiLs88irypgD8RzqXSYN6I3bcvsXhHOM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GJ0v6A+f4TRS9pAMhj4qa8pD7sPDb5pVAIA+rqTEyBpOkkqlkkUy4Wuq32oysiuYP9N0MeoenInRMFdNYyg4xW5gYmIV6YNyye3dGMs9gwW+/IWbcuNuKJFjUCU/ncUa5at+bbEADhu9s0OuNHOV8ecyn699gYb+95fW3495f38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i9zL3gzm; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5fbfa0a7d2cso556193a12.1;
        Wed, 07 May 2025 16:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746658879; x=1747263679; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SFuv2QKP0uD2PYvKigfp0hEV+zPl3GzM8TneWY4q/xg=;
        b=i9zL3gzmRu+uZRJPS/uOYS8QnMY0nMTzrjnz1iI5LHSfaT1qUak2y1CFQxnLaYfJsH
         Um3tpN0Ep7UjvEWrtPcTti6bjQ7pxXYG952SAKDV4I2+Tv+ChQv7I8mMU0ydEzl9+H/K
         DCUO8ZVlkvMIXp0ipzRAkmkSmEBpwQ0jdi7gRxCLglFfrdp1dNgFIl49s6Zc4vZ3RaaZ
         MjTg25GlJm5jCa298xeFlnxKB13PFIw3EpMXQZXft+MHnnBrvvNtnewUi5BfyR+D6vAF
         ooklNTogGP3PCAvf/x3Rux544NInqKF9A25WVx5kzJwJjoXEVZmFLSyTjU6iglZf+4Tm
         TMMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746658879; x=1747263679;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SFuv2QKP0uD2PYvKigfp0hEV+zPl3GzM8TneWY4q/xg=;
        b=tXqGtJ2JDpH9LB0/YBeTjTwh3eEtfeR3imGLZDJvHVp3kSpCPWNN3UXN+gwBVJPbcA
         gKE57niZRRJw+LFZRxhK+rjbOXm16z+rweRRHovfxFCcywO5EkEMbboysV1yG10pfaXO
         u+SKYfd1iZMbWp74fddkqb6+ealRAwfLEL6MErL7PZ+Y+reGhuvrRAgPnA3V7zsySlFo
         yzGbMy+W3hpShTWgGpLJ+g5Q4ENbuJ8bSFadhLuaaJpSRJkiPxzCUc4+nLw8EDWi59Js
         czxy3D7DJE637l+hQXOzoRqEMllfYzfPyhpR4XtY2AyoNXrPb6qK9F0LWhq4K2Ee1f54
         SHmA==
X-Forwarded-Encrypted: i=1; AJvYcCU48DxiRjvV8hoUbNh5aWe5gikyjFgDwXMdjn8jYqlqMqPX6v7Jxplx+ZqA06ImAVfPbP70zNFElDGzvrAQ@vger.kernel.org, AJvYcCXnaE1IkOMTL9MQ0rv43Tp11A/K/D60+f6cTSI6mZi2pGkgkxxXX39sQeYPXR+A1HiHL64e5u4Cb5iI6G6J@vger.kernel.org
X-Gm-Message-State: AOJu0Yy39eQe+xgHtaOCvcsr3WXTSkfvanu+Mdxu6/Pu0552lu6ySPCL
	avqxRqGQcwq0VAZTX1TIatb0lLPO9GJO73BEJMJ+9zsFyShJu8M=
X-Gm-Gg: ASbGncu/K2Vb1cF8Ba/VWHuYs4Uz6dS0+9C8A/0dlW7IwfTDm8vEe6H9H2czrkO3TYy
	8Rhm1TgX9BpTkZEw9cb84Tatb6sXdGxglkb83rY0S8X0j4i1hP+vAXMvXN/vDifA1UBrrbvLPzT
	K2eNKoWayfo/G2fTYoQeQIWukwzhHBZrzMDgnjK6weiRAhN6PZtiFTGZF2KuauGbp1nRi3rx8iH
	sEgHEfy3h9C/r0a+RAzP4cbNVUBCi1LiVD4v/TbjZIvqhIXuoB95w8b2Uy2feRORgWZ/Lg5yktb
	R1ikGqm5g4bBGyxjO9QSY5aK0ALzMY6O6iW1zYqmqLaQ/eGo+ev+21vS
X-Google-Smtp-Source: AGHT+IFw9U+jQHVqcYcmg+RJ4EcdLl0ouOzm/w+TOZZbRNJGdtfaDch+IFqB/IpI39jZDotAJ7jqpQ==
X-Received: by 2002:a17:907:18c6:b0:acb:34b1:4442 with SMTP id a640c23a62f3a-ad1fe99e400mr80001466b.48.1746658877926;
        Wed, 07 May 2025 16:01:17 -0700 (PDT)
Received: from alex-x1.lan ([84.226.118.249])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fa777c8b12sm10507906a12.24.2025.05.07.16.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 16:01:17 -0700 (PDT)
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	laurentiu.tudor1@dell.com,
	abel.vesa@linaro.org,
	johan@kernel.org,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Subject: [PATCH v5 0/4] drm/msm/dp: Introduce link training per-segment for LTTPRs
Date: Thu,  8 May 2025 00:58:58 +0200
Message-ID: <20250507230113.14270-1-alex.vinarskis@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Changes in v5:
- Altered 4/4 commit message to include LTTPR's max training level
  context.
- Picked Abhinav's R-b tags
- Picked Jessica's T-b tags
- Link to v4: https://lore.kernel.org/all/20250430001330.265970-1-alex.vinarskis@gmail.com/

Changes in v4:
- Add 'Fixes' tag for entire series
- Rebase on 6.15-rc4 (was previously on top of msm-next)
- Picked Johan's, Rob's T-b tags
- Picked Dmitry's R-b tags
- Re-tested on X1E/X1P with DP->monitor, DP->dock->monitor
- Link to v3: https://lore.kernel.org/all/20250417021349.148911-1-alex.vinarskis@gmail.com/

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


