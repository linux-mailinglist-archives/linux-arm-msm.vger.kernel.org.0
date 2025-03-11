Return-Path: <linux-arm-msm+bounces-51075-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2986A5D33B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 00:41:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D4D5317B763
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 23:41:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B94CA23236A;
	Tue, 11 Mar 2025 23:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RLACuUC2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E20877B3E1;
	Tue, 11 Mar 2025 23:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741736478; cv=none; b=RVGCVG1EIqpf3G1F3LeD+2NzJKzsKaUcTOMznG4WEzKVNhZeL4JXRE2+Oc9iNhu8XVV1TgmA91vYtAWgZWmHhYmEmFwbz/W7DJ1pFxl9jrras3Ji+usS/v1VOTxCt+ZYuNvc6fiK3E1GIBr4ELFqF7KvBbURcf8p4Q7GOZQ1Ep8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741736478; c=relaxed/simple;
	bh=9qgSsWcsngio5KpCh6QZYjLLJOXMBsSZCfgPi9Cj5ys=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AKLJyUS/mTPaAEkXArqdoTid/IZHMt/kym+5zjfBcgA9XLxmJ84oh0fFBhU8XAJXMKzdQrbZk1EjTv8tsClop+wKfafIusrpm8ZJtrBIUre9VTg3gmZVDcaJ3sbrD+HYybZU6yvEbetmUYefr4Oz8987uSdq2iGcLFuhHyL7WNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RLACuUC2; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43cf0d787eeso29137185e9.3;
        Tue, 11 Mar 2025 16:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741736475; x=1742341275; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gJ8EyWj+V3lGQ1KYljBA+TqtPpIeQuDsaPbpLuX41JU=;
        b=RLACuUC2v3s1xcUnVt07xKw4XYJLc/KgWcsFPK6F8lgvNMPcQLoSFSj/AL9RgHbGgk
         lFyCadCRcIC4JT39qdNRvHLmYnp803pUwMffmLhdYRDo8dfG4OKZVAU9EtXuyOWmE3YM
         OqiCNlk8CBgtL7Wxd+wtuyD0I9Vvt8M484PXzj3byHUtRRERE7+nu+aI/SEptW1msdU/
         cUNDMHUtEWOc2de2QXKFccm4hj4gWQ2zWqzOTwlf23K6tT78yo+XTGRQlP1GOnY/wj1u
         Y/idekJjuhk7QY28Qh/XQZ6mR60a7/lIjhUjVoPHwwmdNOJ+lov/Y0OX1y18BJ2wXYsC
         3Ecg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741736475; x=1742341275;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gJ8EyWj+V3lGQ1KYljBA+TqtPpIeQuDsaPbpLuX41JU=;
        b=Chpv1Q6QaoG6RGyLGM+fmuAfoFQoyPIs3XriCAgPvMawJTW8bDzy6U4vfsC1esOClN
         iiFs26c9Xpq41gahdPtarIBpWFYZoAzROITF+t9P2/AWNub9Big9jShZgYhLrpzAzVj+
         uQWq6+Uk3SMSWKp7vDDM8Q3e+JXQok7qKYEhopVOlM2H+F61kb4NzLM8bjvUfMxuLoHd
         Iu3cIIU2N8+5W4EJMPGm2IJ+oDY3t5xUJ+0lxjAH7tyAFr+tzUIMvB06P0HUXawLDAxO
         Hak05NuwwqrH5NbrVVQhqMO72FarO/SsLaL4EaLFOwWGH3o7jF4vwmMVzustRZpFEgAe
         6F8w==
X-Forwarded-Encrypted: i=1; AJvYcCVYo50OTPEOL4+KH+pq2vqVkNlMmz66nI3RnVtvgoRA59TnN0rGW59N4ean7sme6qk0ZbGuubWTC7SV2toD@vger.kernel.org, AJvYcCWh7m0EdLdlD/ju+jrdTRQ31/8RLaBPRRCawwjb/WnAnNSrE5EOonL8iCQS5ayY460FzCo6HJXyG5FRb9Kk@vger.kernel.org
X-Gm-Message-State: AOJu0YwWmCyaxAmQNisb29fBmt8Evj0QVckBE2sj07NYAGEeRivZTyAL
	Q2vzDSDa8ChqHznAn7J0vZRsykj/79O/s7UZ1kDll4hwq5pSnOA=
X-Gm-Gg: ASbGnctzrTuYRJ6+d64Rw4J4IbDCOxpv18GECG0TbGiKPNEz254L7GaFmXAw5xalW5M
	NaGVDgC9XdFalkxrAeH6m2LfhDG2OR3Bo+g+doCPz2VsAhhGEhY8ok9h41d8hn52VYPAphesmBy
	ZZOchnKDnmvLXoejW6FQkYmoPAxwyNTNxKvNviQe9tNQqinbSZYqfYeNGeDRkT1hsHX386EWQsC
	i/WuSfbJm0wGFxHKxUUPLaVXxlA9/gco1Vq0sIbQMTCM8RDJ+SeJaxBs49CJR24loXHievXFiEF
	/jxdfJIFrhhE5mdENvuOWcmRYUKMOI4Dg/0AmthVh9l+fjdCyrMrFpEqxi4/ngQ4UPPoorxr8Ov
	B+JPIkA==
X-Google-Smtp-Source: AGHT+IGmpUbEyhkAFSxBQp5Q99XB7Lq9csmnsvhQmC59eDhmUh1KPfKQ3rq38gkn1WnBBi9iEZyJhw==
X-Received: by 2002:a05:600c:4f0e:b0:43c:fa0e:471a with SMTP id 5b1f17b1804b1-43cfa0e4b6cmr100755055e9.5.1741736474607;
        Tue, 11 Mar 2025 16:41:14 -0700 (PDT)
Received: from alex-x1e.lan (adsl-178-39-53-103.adslplus.ch. [178.39.53.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d0a72ea88sm3988345e9.7.2025.03.11.16.41.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 16:41:14 -0700 (PDT)
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
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
Subject: [PATCH v2 0/2] drm/msm/dp: Introduce link training per-segment for LTTPRs
Date: Wed, 12 Mar 2025 00:38:02 +0100
Message-ID: <20250311234109.136510-1-alex.vinarskis@gmail.com>
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
* Dell XPS 9345, Ubuntu 24.10, Gnome 47, Wayland
	* Left USB Type-C, Right USB Type-C
	* Direct monitor connection, Dell WD19TB, Dell WD22TB4, USB
          Type-C to HDMI dongle, USB Type-C to DP dongle
	* Dell AW3423DWF, Samsung LS24A600, dual Samsung LS24A600 (one
	  monitor per USB Type-C connector)
* Dell XPS 9345, Ubuntu 24.10, Gnome 47, Wayland
	* Left USB Type-C, Right USB Type-C
	* Direct monitor connection
	* Samsung S34BG85 (USB Type-C), Dell U2725QE (universal
          Thunderbolt/USB Type-C, probes with an LTTPR when in USB
          Type-C/DP Alt mode)

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

Changes in v2:
- Picked up Abel's R-b tags
- Fixed typo as per Abel, fixed readability as per Johan
- Updated cover and commit message on mailink issue which appears to be 
  specific to Gnome+Wayland. No problems on Xorg.
- Link to v1: https://lore.kernel.org/all/20250310211039.29843-1-alex.vinarskis@gmail.com/

---

Aleksandrs Vinarskis (2):
  drm/msm/dp: Fix support of LTTPR handling
  drm/msm/dp: Introduce link training per-segment for LTTPRs

 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 137 +++++++++++++++++++---------
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |   2 +-
 drivers/gpu/drm/msm/dp/dp_display.c |  31 +++++--
 drivers/gpu/drm/msm/dp/dp_panel.c   |  30 ++++--
 drivers/gpu/drm/msm/dp/dp_panel.h   |   2 +
 5 files changed, 141 insertions(+), 61 deletions(-)

-- 
2.45.2


