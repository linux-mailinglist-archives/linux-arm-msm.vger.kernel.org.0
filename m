Return-Path: <linux-arm-msm+bounces-13957-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A646887A00A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Mar 2024 01:14:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 12C2CB2248C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Mar 2024 00:14:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 539A82F35;
	Wed, 13 Mar 2024 00:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="N/gaq8L0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C89D42F2B
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Mar 2024 00:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710288839; cv=none; b=L25SIZiBSqC8mzEjZPNuqHqjj2V++fH0Z8PxoHTrfcjau0dtxwXeKeA8Nb7nbJpb/rko4/NtIfF3SFYN7ZHoXTNoeuiCO8O/0hKE2HH8sbB0kFdXsN3MDrEHmyYGAmaV9U3H/b18Di9XJ2pXEQH5pOKeAD6t4piFbzwRexLK16Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710288839; c=relaxed/simple;
	bh=rwYPXCtiTeR6fKvXaEuMTY9ji0JXdvlkZcS1H9kz3t8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XcYm/wUUZJ9LknJMi5+b6w0vR+45rY7USX8iJ2Nn4TP1sSe2njQRCmzqY5iwbxF4JxCvXg2BEAHEh/MAYcj6J0iV6Wbg7yuHiQH8ekvhdE9Auv+wW9flg5SxRDCTbNSwAuoP567dgfg5FvTx1z+91bsOWWXEFCgwdu2qcS8hNgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=N/gaq8L0; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1ddcec424a6so187365ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Mar 2024 17:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1710288837; x=1710893637; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=roioUGnaxY6AvjIUwtL2u9LanxRAGecYCXou90dLIu4=;
        b=N/gaq8L0nEqVztaZuE8HD11lCC8W0BIiRjGFerOI77j/VsotfBRKTJEFc4EqsCcKnD
         T/xSs32IyZNipsKewQQAydMKtf8K/z3cqA0O2wj5MvOraI3DDwsYKwSAc3HDDbtMw/4y
         +zm/tDipykRSMzqOfuI2PikAuVSz3W/MckL7o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710288837; x=1710893637;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=roioUGnaxY6AvjIUwtL2u9LanxRAGecYCXou90dLIu4=;
        b=rEHZUKwarZWmhP5uxwXxZQ+BcKITxEzKn8gGaqPBgL+QfXa/FuiXxUGACFq3gmTNFt
         ylTcj5Vbf04dOxpMeBAdSINVDw8Oy3M+vkbgRCKtGsh23PKVaAdkVIHq8M7chlj6XqC/
         jZS3wd2Nz819ibilqs/nyIvy3TeM0C90TMrhoowtBmudeHoNC0ZgEDa+s169akVGX7wO
         aELmQPN8pNEY0jawqIQLuQqpad5TjzdzU4LaKgE3y8YXyqkqnig3Nw+GAikDJHzJkTN7
         olzGiPYexLics8Gy7bp7IOHJro3BLq6FkZgYTkbtuh7Ba6/cF+AxKpSLei/sxnAEuZ9A
         Ewzg==
X-Forwarded-Encrypted: i=1; AJvYcCWCib2sgq52ZZLWcrNGsItutIrgCNIIdsY8dbChXqzEDnv2buTqSgyFxKRXxkp1lzkm7yBOP2y34T/rqS3FRfHOHD58FaIN7Mp5IDNb/w==
X-Gm-Message-State: AOJu0YzMR+d9MBVTxnbow8Rwq+u3NFrhKdKMoH/iXVQW3UP2XRMI1f2A
	sW9+1ajGLEu2VVX+mktUaMHVd/Dvi6q1IsDIDFixAY+hJDhg/XtcrjXwa1hMGQ==
X-Google-Smtp-Source: AGHT+IG58PN3ouLt4+V6o22EJ3ezJVOTQSf28+tSjOkyWRU31OXa8iIFliZtabjLxDQCMZq9cqjRsA==
X-Received: by 2002:a17:902:c947:b0:1dd:8daf:99b2 with SMTP id i7-20020a170902c94700b001dd8daf99b2mr9535150pla.13.1710288837058;
        Tue, 12 Mar 2024 17:13:57 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2620:15c:9d:2:f8dd:895c:e876:6edb])
        by smtp.gmail.com with ESMTPSA id x8-20020a170902a38800b001dd761faec3sm7432924pla.251.2024.03.12.17.13.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 17:13:56 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Douglas Anderson <dianders@chromium.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Daniel Vetter <daniel@ffwll.ch>,
	David Airlie <airlied@gmail.com>,
	Guenter Roeck <groeck@chromium.org>,
	Kuogee Hsieh <quic_khsieh@quicinc.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Tanmay Shah <tanmay@codeaurora.org>,
	Vinod Polimera <quic_vpolimer@quicinc.com>,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] drm/msm/dp: Improve DP AUX transfer vs. HPD interactions
Date: Tue, 12 Mar 2024 17:13:15 -0700
Message-ID: <20240313001345.2623074-1-dianders@chromium.org>
X-Mailer: git-send-email 2.44.0.278.ge034bb2e1d-goog
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
longer need the long hardcoded timeout / special cse for eDP in the
AUX transfer function.

NOTE: I no longer have any hardware setup that uses this driver for
eDP so I've only tested the DP case. The eDP changes are
straightforward so hopefully there are no problems there.


Douglas Anderson (3):
  drm/msm/dp: Avoid a long timeout for AUX transfer if nothing connected
  drm/msm/dp: Account for the timeout in wait_hpd_asserted() callback
  drm/msm/dp: Delete the old 500 ms wait for eDP HPD in aux transfer

 drivers/gpu/drm/msm/dp/dp_aux.c     | 21 ++++++++-------------
 drivers/gpu/drm/msm/dp/dp_catalog.c | 17 ++++++++++++++---
 drivers/gpu/drm/msm/dp/dp_catalog.h |  4 +++-
 3 files changed, 25 insertions(+), 17 deletions(-)

-- 
2.44.0.278.ge034bb2e1d-goog


