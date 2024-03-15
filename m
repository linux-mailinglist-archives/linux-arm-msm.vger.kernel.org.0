Return-Path: <linux-arm-msm+bounces-14280-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E1987D640
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Mar 2024 22:37:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 508E01F2134D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Mar 2024 21:37:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2E014CE1B;
	Fri, 15 Mar 2024 21:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="V+pwHWhs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A0412B82
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Mar 2024 21:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710538659; cv=none; b=l4IsSD0ik2Kz80N92R+gif6tAhev1gbNaaoe9K2hqCMRQ/z7If07p4Cm3M0f6G2adfzdE3uomNOileUE1AGzWVr040G37LR9Uru2vLFXYUcyOLssnHIDGh/49J6uqHN1BFKQgGVk5TEQMarfNb3dEygINKSPHBQkXAOD+nmtP/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710538659; c=relaxed/simple;
	bh=bUvPhLUiYOJgKB6BrL5Hb+aiuEbi6OrUUVqjDAfvd34=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N5pBo491mlarg83pm8TQWJ77jYVESmwk+MlDHwuxxp1Lt7wT9IGXi4qpjzU8rsTHnu618rabtHfuvH/dEvSVnpNdfybukVE54wxEWX2wefhOeYMHDzMs8qVCNHiDEVu12GXPrzUt8rRn4LP2Hq5MkWY+gkNXAAbYoTwZZTx6voE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=V+pwHWhs; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6e6b6e000a4so1911565b3a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Mar 2024 14:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1710538658; x=1711143458; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JcjIzpIf3M0tslD3zrN0DmNXzOjKP0xQjzG1iMsY+AU=;
        b=V+pwHWhsmSk7mv9gKqYS6kFcwWq+NSKyAb62tENB0bnnXtIjojr25ZtCDSH1MinpyD
         /csJeETZaz3n799BwW3KJElgHwhuLCfljKTFZ7Gk4NVQwDTXMgg0AnH9liqNix6qtO6o
         eFjLIleaG/HhdfHEPOOfjU3oXNhJv48ldfQJY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710538658; x=1711143458;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JcjIzpIf3M0tslD3zrN0DmNXzOjKP0xQjzG1iMsY+AU=;
        b=AId7adlYwKnBw4i4bvGKXdgtwQ60WqMg1WD2iXjOInI0btCvkw939qEw1y2yXeONbN
         ebf0LhmyfuPAfZ6OUUTaiLsie0L95BKjIDYbAa0OEGH0Nauk80VnqzqnDCyM1xROb10/
         TbD+NIcujLbKhA69JecOcVf9C/CHdRupGazEOV1u5emclxE1sRRs3bqAmLBhNJZwgm6s
         zJ+FxraThwr9zkJfHfrjj1VF6jOdCGFFaqYrHZ+9dZXJ6z82G2tubWgRiGsbBa2hnGi/
         p0mUYcbns7aKi9NOeNZuAfvxiy+g56Vg5+9swhLD+6eCuw6zsCeeqe6ui0JBc29wCe0Q
         oY2w==
X-Forwarded-Encrypted: i=1; AJvYcCXUN/SxUAYZ4E0UoHseA6i5KSuo5rofkxqfNpNczOJ+kpEEaIZwODciPKgjfoMfKj950H7Ler4sqWjBt67E+6Cz/1Zs7GerVrGCKDIRgQ==
X-Gm-Message-State: AOJu0YwFKUJd1MS7whCp1i+GPm8m2SVq19h/90f5te1fMUsBGv0Drlib
	tO0W93p1Gau3kqiP/SvM8U9wbBREa6egAaXPNLmhu9Q5iCbzSdbT1Pim8HWMiw==
X-Google-Smtp-Source: AGHT+IFjUmHac2Bq6KdiZW/REPm92doVaTzd5QixixIP9P8bacTyl7uoL/ZLpufE9uq3gSzkN3xgmQ==
X-Received: by 2002:a05:6a00:2d1d:b0:6e6:fb9a:fb45 with SMTP id fa29-20020a056a002d1d00b006e6fb9afb45mr3949524pfb.1.1710538657710;
        Fri, 15 Mar 2024 14:37:37 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2620:15c:9d:2:b23e:e8dc:3df4:aa2a])
        by smtp.gmail.com with ESMTPSA id a26-20020aa7865a000000b006e6b5e65579sm3837142pfo.106.2024.03.15.14.37.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Mar 2024 14:37:37 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Douglas Anderson <dianders@chromium.org>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	David Airlie <airlied@gmail.com>,
	Guenter Roeck <groeck@chromium.org>,
	Kuogee Hsieh <quic_khsieh@quicinc.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Sean Paul <sean@poorly.run>,
	Stephen Boyd <swboyd@chromium.org>,
	Vara Reddy <quic_varar@quicinc.com>,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] drm/msm/dp: Improve DP AUX transfer vs. HPD interactions
Date: Fri, 15 Mar 2024 14:36:28 -0700
Message-ID: <20240315213717.1411017-1-dianders@chromium.org>
X-Mailer: git-send-email 2.44.0.291.gc1ea87d7ee-goog
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The main goal of this patch series is to avoid problems running
"fwupd" on Qualcomm devices. Right now several of the plugins used
with fwupd try talking over all DP AUX busses and this results in a
very long timeout on Qualcomm devices.

As part of fixing this, I noticed a case where the MSM DP code wasn't
respecing the timeout properly when asked to wait for HPD. I also
noticed that, now that we've implemented wait_hpd_asserted(), we no
longer need the long hardcoded timeout / special case for eDP in the
AUX transfer function.

NOTE: I managed to dig up some hardware to test the eDP case and my
basic testing shows that everything still works fine there after this
series.

Changes in v2:
- Don't look at the HPD line directly; have dp_display call us.
- ("Fix typo in static function (ststus => status)") new for v2.

Douglas Anderson (4):
  drm/msm/dp: Avoid a long timeout for AUX transfer if nothing connected
  drm/msm/dp: Account for the timeout in wait_hpd_asserted() callback
  drm/msm/dp: Delete the old 500 ms wait for eDP HPD in aux transfer
  drm/msm/dp: Fix typo in static function (ststus => status)

 drivers/gpu/drm/msm/dp/dp_aux.c     | 30 ++++++++++++++++-------------
 drivers/gpu/drm/msm/dp/dp_aux.h     |  1 +
 drivers/gpu/drm/msm/dp/dp_catalog.c |  7 ++++---
 drivers/gpu/drm/msm/dp/dp_catalog.h |  3 ++-
 drivers/gpu/drm/msm/dp/dp_display.c |  8 ++++++--
 5 files changed, 30 insertions(+), 19 deletions(-)

-- 
2.44.0.291.gc1ea87d7ee-goog


