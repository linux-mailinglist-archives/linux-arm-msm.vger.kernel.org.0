Return-Path: <linux-arm-msm+bounces-56179-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FDF2AA3EE4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 02:31:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A775B927106
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 00:25:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 909141EA7F1;
	Wed, 30 Apr 2025 00:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L5W1PoaP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F4451E9B30;
	Wed, 30 Apr 2025 00:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745972028; cv=none; b=tZKvAp/gR7KH101wJ631XlbM9tYUjgboSCf8ouAYVfjGHboX1zI+TkHB4zAb9cy11Rtnp9KxlDTER4tQwW1iKQUSkmalppgTMSol0344WeubYgFHPURHIVbxbZ49CdnOEDsOecMI1TERlImxdvhl2WoLBgB8zCeC/iYQsHHpC50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745972028; c=relaxed/simple;
	bh=8CZtv/0ipWPZxVKXGyfmQs+kc9ipGG+tT7sHon181CY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cgWWcHW1ZFf7yEWaWR7DbeD20tRP1KYwQ+U4IRnlCG5fg/cNV81o7WMDtAoKmdHvzwlX/MuFA6rrX8CzfzoF8Krf85Gj7Z1mc/KmS3nEcV0zzN3dY8TzSaNHY6UTNl3Mnal7lyTcCz+nYKZLvV2u45oVN/4HeFydWXDwa4AD6D0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L5W1PoaP; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-39c13fa05ebso4380438f8f.0;
        Tue, 29 Apr 2025 17:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745972024; x=1746576824; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bpJM+Tc7337EtyXZDZeo8nNOgjeSADz12v5AP+hJLQE=;
        b=L5W1PoaP+6RUWt8QVACHraG/Sngu9BVemTJAbeSSnGNR02Q/DmnfGhsULI3Mv/6cxx
         364CVxO/uqnD6gk40cf/bEh00D91zBUURefHgGpC4DLGcRYUNXcGWhcNPVPyV/IZLAtr
         Mv4csjhQTRYX5HABbpi1bSCvtDXzBCO0XzVkQr7JZFmCToi7GrapmJZfMjl1eWB5+jTE
         iQn6q96W0Mvz6zsPh4ImHTfMRtRvX7zTgKAYnOim8QjsT91aQ+GDWbaaV5jOVhXPuVf9
         FtsK/pLFwIOBNqddPKwu1SNOM6d/UqiqFLaI7oHpj/l5zjFEIsnbkmLUuVZCtgcIccHE
         Ir+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745972024; x=1746576824;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bpJM+Tc7337EtyXZDZeo8nNOgjeSADz12v5AP+hJLQE=;
        b=gYaP/w2bi82rnusoAN0ncVlUeXOYohLPlqXNiWAy9vdcUROSH2qLxU2f/xDcwGTBlO
         pKUdiPqkmuSR10GFQSzPfwwnLnR3V3x020XH64wlkC0sKCl3J9qtG9WljIzviU3OWLzQ
         r8p4y7gSMIPY4Knz+LEYE7e9EtZuxwdOfT9HmLgb+1S5N19j4J6mXNv1D8+FhHbJBe9q
         ICKuXdsjIZKYlIiCViT70cIsJmkYODzzVlW43frmX1YkyviM5hkIZS9Accj1vAVwKQ1J
         zkgaCQhTt1vqTLW4W8HtSYzq/+y52tmPQOnDG7zQVjubwMtoWf2EVK/E5z6LDNLRl40f
         tDsw==
X-Forwarded-Encrypted: i=1; AJvYcCVEiEkCR1m49hKYB1JOVcJr6S60ln8o8T1SCOULODOV1POhTuQUfu19x+mTPK10Wf4WcM+JRLX/l8m+I1fc@vger.kernel.org, AJvYcCVLaqPEj0bJ5xq/J8LUHmtqearHAP537t/Fj5b07VmQJVjh93mNdSzD0T6Ra4qiVuX8uupyVs4Ocg/2OYAT@vger.kernel.org
X-Gm-Message-State: AOJu0YwAybeg4PzAogfrBHl0q6aqLbXETykBzjqmXl3DiHybxoAzGG26
	8xaGwS3lYR6OahPo3QHZea1YGRjiMyqlCnzdx4JiE4F/z8r66/Y=
X-Gm-Gg: ASbGncuzRVDhIVTAyPEaFXi6+7gEFpwCXh4sonnsXS1/Z0XprRETn1CfaYZ49sPcJVz
	rXJ+pWdPGNBEGVr7SG/9iyEZS+fCJNHOroULNo8USPEmBsMYqm5tgRHQ3MrZbTL17BYnfbRZYtW
	onJh8M+lFRlfkpPdjuVg39UdFjx6o7A6sPV21zfDKDmStTOmDAaUqERkFCmxfrEwUDcK+cKS4oN
	inedX74tlvUTF0R898FrRCCG6r8y2ck3hG4TtP28VQCZawpX90PN5TEbdgksCY8eazHlh8m6G1z
	bT+4739rf4itcMFvGMjv3e8EnHAQnAkY7jR6c8a+PEO2Ug==
X-Google-Smtp-Source: AGHT+IEgjn3DTA5JysLlqSXTB7fnQ5ubBnp8NA5AXgesFOTwGYFHlJatyixXBumMeoqv8pdjMBgQ/A==
X-Received: by 2002:a05:6000:2ab:b0:38d:de45:bf98 with SMTP id ffacd0b85a97d-3a08ff34caamr300957f8f.8.1745972023945;
        Tue, 29 Apr 2025 17:13:43 -0700 (PDT)
Received: from alex-x1.lan ([84.226.118.249])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e5da4dsm15574565f8f.99.2025.04.29.17.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 17:13:43 -0700 (PDT)
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
To: Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	dmitry.baryshkov@oss.qualcomm.com
Cc: Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	laurentiu.tudor1@dell.com,
	abel.vesa@linaro.org,
	johan@kernel.org,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Subject: [PATCH v4 0/4] drm/msm/dp: Introduce link training per-segment for LTTPRs
Date: Wed, 30 Apr 2025 02:09:43 +0200
Message-ID: <20250430001330.265970-1-alex.vinarskis@gmail.com>
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


