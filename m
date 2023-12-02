Return-Path: <linux-arm-msm+bounces-3053-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F03C7801F21
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Dec 2023 23:42:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4311D280C79
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Dec 2023 22:42:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7502722304;
	Sat,  2 Dec 2023 22:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yEMLJWj8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7120711A
	for <linux-arm-msm@vger.kernel.org>; Sat,  2 Dec 2023 14:42:50 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-50be3eed85aso1309788e87.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 02 Dec 2023 14:42:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701556969; x=1702161769; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ai6XN915UjgCfNQVVMBLQPU9SRXzrPP8kHsi76SggeY=;
        b=yEMLJWj8KLRzxV7x1gQJ/xvuqSDHLS9vIWl75tuMRa6WYXyriECIX9CvKn9jicZbXC
         jGPNXXDi6lKjqvTVn9rbTzyrV+bVsl9xY/XQMjjT6UktcJR2tDjpNLLDxx2LDOvtNKWs
         h8S0ftbaYXOwUg6hoPHh5io/xfEviv4e8f1p87gBaPdJTomXD0LphGcP0IVQfBziYIcq
         ZWQ0NXYw/YRDFSgyLSm80tbTnU4U5ak8J37/AI17kbgYM49duNxEl2BBmD5yFHAh0jJg
         4Oiw0qNldOqtjLhyIgtu9cu64/VgphaNHGrerERp1WQYhLrHMubsIPyednOXCGS4NlCv
         9EOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701556969; x=1702161769;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ai6XN915UjgCfNQVVMBLQPU9SRXzrPP8kHsi76SggeY=;
        b=PHExMB0h8R9GWXhG/4AfOYac9blYuz/xPRZjJxg6lAnKZCNsAO3PzRmTL99DQpppy3
         R5tbVtwHdwYey1LJvgAGgoR6T73xk2dmP8U4ekY47nQ9MupbIGQq34xyvWvvOQpx5xvb
         QLv761CLOt+O3twMLOsS0YxKX18LDNBmgMjWnCpkOjUs0pgVmVb+UFnZ+ZyYo3pi115G
         961xwr/GzR1AX/juUhMz/0KBdfRZ979SRoMgIG9dovd0zyPgRzP+VZNDCrlJ4aivHtjx
         XqEjQoWG7s1+PnyW3VSftK2roCCoLwQArRmi8xFCkgVmjXEmlJyfOnzqa0OplFfOH6yp
         I/Tw==
X-Gm-Message-State: AOJu0YyVccp4VkMDBKr0Um1ssI3QD/bf/DZaj9o0i3TVEtByDubpHoiq
	whkgl2ivJKL3rWfapxH8PJRIIw==
X-Google-Smtp-Source: AGHT+IFW1F/6RdXegvLCbya3Y/33/32qlBMhz6vRg5a/96ZhlFSn96wZguDHL+1XOk3ckfFnIiQ7VA==
X-Received: by 2002:a05:6512:23a2:b0:50b:e713:574d with SMTP id c34-20020a05651223a200b0050be713574dmr864919lfv.75.1701556968698;
        Sat, 02 Dec 2023 14:42:48 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id o20-20020a056512051400b0050bed700f5esm187015lfb.91.2023.12.02.14.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Dec 2023 14:42:48 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Marijn Suijten <marijn.suijten@somainline.org>
Cc: Stephen Boyd <swboyd@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v4 0/4] MDSS reg bus interconnect
Date: Sun,  3 Dec 2023 01:42:43 +0300
Message-Id: <20231202224247.1282567-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Per agreement with Konrad, picked up this patch series.

Apart from the already handled data bus (MAS_MDP_Pn<->DDR), there's
another path that needs to be handled to ensure MDSS functions properly,
namely the "reg bus", a.k.a the CPU-MDSS interconnect.

Gating that path may have a variety of effects. from none to otherwise
inexplicable DSI timeouts.

This series tries to address the lack of that.

Dependencies: [1].

[1] https://patchwork.freedesktop.org/series/126888/

Changes since v3:
- Rebased on top of msm-next-lumag / [1]

Changes since v2:
- Rebased on top of msm/next aka 6.6-rc2, Dropped merged patches.
- Dropped the *1000 factor from reg-bus BW values (Konrad).

Changes since v1:
- Dropped the DPU part, the MDSS vote seems to be enough
- Reworked MDSS voting patch. Replaced static bw value with the
  per-platform confgurable values.
- Added sm8450 DT patch.

Dmitry Baryshkov (3):
  drm/msm/mdss: switch mdss to use devm_of_icc_get()
  drm/msm/mdss: inline msm_mdss_icc_request_bw()
  drm/msm/mdss: Handle the reg bus ICC path

Konrad Dybcio (1):
  drm/msm/mdss: Rename path references to mdp_path

 drivers/gpu/drm/msm/msm_mdss.c | 96 +++++++++++++++++++++-------------
 drivers/gpu/drm/msm/msm_mdss.h |  1 +
 2 files changed, 62 insertions(+), 35 deletions(-)

-- 
2.39.2


