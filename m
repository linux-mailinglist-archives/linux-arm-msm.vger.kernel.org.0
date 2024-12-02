Return-Path: <linux-arm-msm+bounces-39817-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6B59DFE31
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 11:07:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E07AC280987
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 10:07:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30FF61FC10A;
	Mon,  2 Dec 2024 10:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KqHp/csF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 309521FC7DB
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Dec 2024 10:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733134005; cv=none; b=cLNopCWrRWH9C5knQ3p1UPf9hYwT4aG66VCDzQWqBDJyLbRq9zlVh3nflXOHxJZyhxu515NGgvzGUR2pq+Z/FO5gTOr5484YTwNrXZqKuZLFjb+9ZOTddnpsTn+jlomnWs0JhzC+BfrqIDmf592vz1eBbX0r28xTJ128YKNikgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733134005; c=relaxed/simple;
	bh=GgRTctJjjmFR+2EV4ZLRM9XiD3udOEtrsRG/wQwZASg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XcKoQdjah2RlwUuR6SUY8WZ0BdOZKFhRAnD80pS+rPNZS7T/06SRvS6DomT9ypPTEzHbuFow/QNxEXt+cpjMU3oVlytJhd+f0/GEboVDxVUycZuFoCLDm7swiLGNSB49KSsNJQv4ul39Q7SZocZNkpDw+zNDKwm7QbU7Lt/7BXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KqHp/csF; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-53de8ecafeeso4271745e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Dec 2024 02:06:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733134001; x=1733738801; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8t93WpEYk3nDKkUudzjr3g8bA0wys8uB5XNs0VtJ1aI=;
        b=KqHp/csFb+Z7YmaHIW6PjZvRXFVl0jHvsnFQ0zBfLTXjPft6mj9Y/XxSs2P6HvVIb6
         NzVr94dy92Jzi45OWkykcw7jLW1fgXZl47Gu8S/pGtuXCTX04L1dJUVfr/VIRq43vk8F
         qhnPm8dXomhSMLH1wIwGJODi7T96yEqF5t6mmM0Vf6qAvNjOvOQEVQ5GKI4VCwg4XbHe
         VLO3JvlDf+zZXqHsW7OJMID+V2Zg+v79xi+pAFEKz5IawFC5bfklEmo93QZ4WRnyMAwR
         PXt9Xp4+/E4iCzx07lKijpz2XEZNKntyrRoWA0OgwZoxOYKxT0bZ9jABHv8iqegoILNa
         eJ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733134001; x=1733738801;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8t93WpEYk3nDKkUudzjr3g8bA0wys8uB5XNs0VtJ1aI=;
        b=TRWjA9hnwCHOL/fVbwi3KlrwH8CxA/g1K7fhtMbJqq283Bge+PriLGcgndczdf4lTh
         vhyggOYV6BCASriaXFGVh1pApSClWixK63JmzRgv2lVmMcsZ2TSmXyIYHsqrA4d98OBp
         7SpN3q7CR/lv8JQeTKHouIO8R9gXBoAnguRDpWtFjdz8dLpl4bIyAzZ5JOQCvEVI9JTU
         GFaG4QdtrHOmIk7s6dyZ4kawZ14eAZDu68efQA0/N5f2TuL60UpdG6+GXMFJU5DWfmiB
         uZ/5Vp5m4zfTjME0jSox+2e9F308Eh6N6KQTXbRsBBixKT1FiFzqLnSWHPSugCA6P2g+
         T8kA==
X-Forwarded-Encrypted: i=1; AJvYcCWbXEnRw94NEbvmsxhzPdV9qFHCUgxJC0GXGMkFTiMBkmA0LGT6DgDOm1AxJy7e1LdmVaiDhT+OW5g3tRGQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5OsuEvhb4jaMtnRQVH6vvZClkpyPE2fwUpwNfvazZy9dGxKyy
	mEs+HxizcrJSRSXSvWUuFi8H2RsrhD4R7YXt2PcYGD+IVhQUMK7U2JnymOZ4Fyg=
X-Gm-Gg: ASbGncu61OBm3UPCl9E+/L5u4WA/t7V8Tc3zeZtuAkhQ7oMWHc9wuvg53dNuROMjJg9
	/8e85lTUBIJTQWxidNHuucyXmo+vNY/9E5PiRtwD7+JfUSFfMdrUPl6nz866Xom+uWlxKsTYdmS
	hx2UiE2dTlh2fd8DqZX+Krs5u4Jnc2ScLvQwCymmKVoEimNZxGvvOzXfJcpj2U2ec5hyPfgSw0u
	BDrCGXX8WOChjPYjk6pH7w15lG03ytLPxOfOumVFQRW7KpUlhaTkltpJw==
X-Google-Smtp-Source: AGHT+IHbH0cvmJT2yx5NWUiOIEXeDVP9elqk8kJiJCCcfIiHjfj52Z/RMITv0CgC14CJdFE5cVHdfw==
X-Received: by 2002:a05:6512:3181:b0:53d:d5be:4bd9 with SMTP id 2adb3069b0e04-53df00cf711mr11571431e87.22.1733134001292;
        Mon, 02 Dec 2024 02:06:41 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df646f191sm1418314e87.136.2024.12.02.02.06.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 02:06:39 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 00/14] drm/msm/dp: perform misc cleanups
Date: Mon, 02 Dec 2024 12:06:30 +0200
Message-Id: <20241202-fd-dp-audio-fixup-v2-0-d9187ea96dad@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKaGTWcC/22NQQ6CMBBFr0Jm7ZhpLaS48h6GRaUDTGIoaYVoC
 He3du1u3v/5b3ZIHIUTXKsdIm+SJMwZ9KmCfnLzyCg+M2jShhpV4+DRL+hWLwEHea/5brW1F3Y
 tG4K8WyLnojjvXeZJ0ivET3mxqV9abEqR/WPbFBIa6i3zo6F+qG9PmV0M5xBH6I7j+AIizTofs
 wAAAA==
X-Change-ID: 20240615-fd-dp-audio-fixup-a92883ea9e40
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Paloma Arellano <quic_parellan@quicinc.com>
Cc: Douglas Anderson <dianders@chromium.org>, 
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 kernel test robot <lkp@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2287;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=GgRTctJjjmFR+2EV4ZLRM9XiD3udOEtrsRG/wQwZASg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnTYasqHrxgs6JE7M1hdNH3pJDJpsqVsEy30IHc
 OgfiW2uBP+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ02GrAAKCRCLPIo+Aiko
 1a/yB/9yeB+1vh6Ib4i/1wq8ZlRx95FOtXSk+vAwqwI+qAQ/T66c/gjRGwveviKMzjYp5HGqNch
 yW37GhGioJontuzz92aByij7NmUpY7OaJA9Y7n1UE9f6gPltN70WNcLwGqvv2LgpR1qwzmnfQvD
 z6OBbiEkYFUDBkzTcv20abdx3qTku6ZSp0BrZIHCMBu8rlTM6zfSKasJhJ9BfpimlD0dftil7Wh
 Hp0wvrCw1fOURXBvFfdd7I98OZLcLJUGKT1C9TIBXG/VDGezOga7fIP6xRFW16d+LoV2uuhv8Qp
 V5fiCnKIdkA46Kf5wem2VGKJfcgHDqE2PkL6De/CWynSSsvU
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

- Fix register programming in the dp_audio module
- Rework most of the register programming functions to be local to the
  calling module rather than accessing everything through huge
  dp_catalog monster.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v2:
- Set safe_to_exit_level before printing it (LKP)
- Keep TPG-related functions (Abhinav)
- Link to v1: https://lore.kernel.org/r/20241108-fd-dp-audio-fixup-v1-0-40c8eeb60cf5@linaro.org

---
Dmitry Baryshkov (14):
      drm/msm/dp: set safe_to_exit_level before printing it
      drm/msm/dp: fix msm_dp_utils_pack_sdp_header interface
      drm/msm/dp: drop msm_dp_panel_dump_regs() and msm_dp_catalog_dump_regs()
      drm/msm/dp: pull I/O data out of msm_dp_catalog_private()
      drm/msm/dp: move I/O functions to global header
      drm/msm/dp: move/inline AUX register functions
      drm/msm/dp: move/inline ctrl register functions
      drm/msm/dp: move/inline panel related functions
      drm/msm/dp: use msm_dp_utils_pack_sdp_header() for audio packets
      drm/msm/dp: drop obsolete audio headers access through catalog
      drm/msm/dp: move/inline audio related functions
      drm/msm/dp: move more AUX functions to dp_aux.c
      drm/msm/dp: drop struct msm_dp_panel_in
      drm/msm/dp: move interrupt handling to dp_ctrl

 drivers/gpu/drm/msm/dp/dp_audio.c   |  362 ++++------
 drivers/gpu/drm/msm/dp/dp_aux.c     |  195 +++++-
 drivers/gpu/drm/msm/dp/dp_aux.h     |    9 +-
 drivers/gpu/drm/msm/dp/dp_catalog.c | 1267 +----------------------------------
 drivers/gpu/drm/msm/dp/dp_catalog.h |  177 +++--
 drivers/gpu/drm/msm/dp/dp_ctrl.c    |  575 ++++++++++++++--
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |    5 +-
 drivers/gpu/drm/msm/dp/dp_display.c |   36 +-
 drivers/gpu/drm/msm/dp/dp_panel.c   |  234 ++++++-
 drivers/gpu/drm/msm/dp/dp_panel.h   |   14 +-
 drivers/gpu/drm/msm/dp/dp_reg.h     |   17 +
 drivers/gpu/drm/msm/dp/dp_utils.c   |   10 +-
 drivers/gpu/drm/msm/dp/dp_utils.h   |    2 +-
 13 files changed, 1176 insertions(+), 1727 deletions(-)
---
base-commit: f486c8aa16b8172f63bddc70116a0c897a7f3f02
change-id: 20240615-fd-dp-audio-fixup-a92883ea9e40

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


