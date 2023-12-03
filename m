Return-Path: <linux-arm-msm+bounces-3062-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A36F6801FDD
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 01:05:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D4F281C2082C
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 00:05:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 980102F29;
	Sun,  3 Dec 2023 00:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nIGSw/h1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8440AC8
	for <linux-arm-msm@vger.kernel.org>; Sat,  2 Dec 2023 16:05:35 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-50be9e6427dso713853e87.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 02 Dec 2023 16:05:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701561934; x=1702166734; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IG1n+K/7cjxSwfAxRHwL6Z+l9CuvM2MX4A8d88EFQkI=;
        b=nIGSw/h1Q81rPsNQYZQd8i8U0xOivCwJEMBMjS7KKhFkv6A7ztd5596Xt7kX9TsLK3
         sKtWh+YC03PgsT0SLNyWjpNAXUtEVkUuPsDT3AQjbE1W4QXyUoMIs/RveQlE7PUvaUTC
         2Hsm97Sxnidt186zoslIUSDh3fhL3c5yKgf2usQmx/6b8OIJ3Arfh07HoPYgg72sksel
         ioq851jdwOFiviZHOzwepJXzRTDx68T6Z6m3SOUeUwPedAYd9tRB3OH9Hj+ToPDCiusa
         mWe3T5jH7SxDLQBRpClytZEe9/O5bm4J/8Tvmu7uQK6tWWJt6S8foF5WkrQFdTNn0MHq
         ygng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701561934; x=1702166734;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IG1n+K/7cjxSwfAxRHwL6Z+l9CuvM2MX4A8d88EFQkI=;
        b=Tsg+037fTQ4qxWrU4+uR+ubObeCPWon9ktoPQTFKy3Bc/Z0Lc6ghBg3JhVVsPuxZ1v
         34KHStESvWKtiPzIARlUhOEoJU/Lv4ZK0btHyTptAC1BAx2kK3MBH+hEMZUxCzLhcOGk
         3rZ4fyJ9JW9d7Z0OO6SChHKd9BMfcYQzx9RCkd+C5Lg5yuPs3fkTFxoQD5FPHHDGM2rV
         s0yiMoQCTil57hTr2C7OF+wjKHAFJvI0ZpYuEi1B7Ky8bir2dVUDjm40DWBJXuQitwpU
         h+iXcIiLSQcVc0ycsBt6eTPeXeaVe982LE+yvOe7dmWfEdXQRBIpATDg+wO1Vf+gB46M
         ssGw==
X-Gm-Message-State: AOJu0YxBspCZHLEw6nD/JMOOorLWsqrHJ2tF72jDtj7QSs0Nj0pJMoTP
	WntYjYlAL8NPELvnBLHu7RZAvg==
X-Google-Smtp-Source: AGHT+IG9klWiRHQW6/osKvaIZUNQJ7+MBSXyi/c7D6NFb9byWa/oTa+iWsYrM8UzLVCZVUHkHieAaQ==
X-Received: by 2002:a05:6512:210f:b0:50b:dfdf:7b8a with SMTP id q15-20020a056512210f00b0050bdfdf7b8amr988775lfr.32.1701561933773;
        Sat, 02 Dec 2023 16:05:33 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id t2-20020a19ad02000000b0050bc5edfa45sm826273lfc.85.2023.12.02.16.05.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Dec 2023 16:05:33 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>
Cc: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH RESEND 0/5] drm/msm: cleanup private obj handling
Date: Sun,  3 Dec 2023 03:05:27 +0300
Message-Id: <20231203000532.1290480-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Note: I'm resending this patch series as I haven't got any feedback from
the drm core maintainers to the first patch.

While debugging one of the features in DRM/MSM I noticed that MSM
subdrivers still wrap private object access with manual modeset locking.
Since commit b962a12050a3 ("drm/atomic: integrate modeset lock with
private objects") this is no longer required, as the DRM framework
handles private objects internally. Drop these custom locks, while also
cleaning up the surrounding code.

Dmitry Baryshkov (5):
  drm/atomic: add private obj state to state dump
  drm/msm/dpu: finalise global state object
  drm/msm/dpu: drop global_state_lock
  drm/msm/mdp5: migrate SMP dumping to using atomic_print_state
  drm/msm/mdp5: drop global_state_lock

 drivers/gpu/drm/drm_atomic.c             |  9 ++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  | 14 +++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h  |  1 -
 drivers/gpu/drm/msm/disp/mdp5/mdp5_irq.c |  2 -
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 54 +++++-------------------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h |  1 -
 drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c | 12 +-----
 drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.h |  4 +-
 8 files changed, 31 insertions(+), 66 deletions(-)

-- 
2.39.2


