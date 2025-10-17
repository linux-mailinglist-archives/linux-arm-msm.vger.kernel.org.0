Return-Path: <linux-arm-msm+bounces-77828-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 022CABEB6A7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 21:59:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B3B0C4E11F5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 19:59:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7995F295DA6;
	Fri, 17 Oct 2025 19:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aMmXbt/x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D384733F8C2
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 19:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760731195; cv=none; b=sDf2PkVjeed3NQrpBFOdo9AKAi4OKjdsBEfnxQUQ3Parv9N/Wo4wbuSOoAAAAfQ1XlDYTocMCqX/gpgOkzEzBxNSlqjSxsWtOHMqI/7ni3RCoI586lpic1xwIaVoPrzrNwUfeFPkPCShi4/bhEEYk1iTdn7HeLy1SVo4XYHKeLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760731195; c=relaxed/simple;
	bh=ju2XR57H8MJ+cCLm8slhn5H6DI1AWrZT/lbxEVCu4Wk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nG62yQEKDERqFNy3ewHzrU+fR2X9VePKEZ1cL9FLyjmrU0xSRtR7e2YU/q6uwnKsOyH3WuNrYlQAVAvMGnRcNQIG+IDCUjS1W2FNO+rkIswcu2wDIIeqW3tNyKSuO3wrlkk42wUEU3CnRaSrgUOvFcEgQd0Uu+m7oCuLG5aAS10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aMmXbt/x; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-36453927ffaso19025231fa.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 12:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760731192; x=1761335992; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RIqKgNRkxn9BJzDsJeVCalVx/LpbceEHRRNoVPWW+1U=;
        b=aMmXbt/xLW+vN9XdkRk8qUdLVnEZ2JatdqC512npZctJo18dkcSiFEoQCj0vA9wRKX
         7iVcScDxu954+chm4/+iAvJgipVa1zMm/XGBv1JsfsLNOln+p47EF2M4TB/z1Kco6czj
         EQC1/1I8e+MIk6S2C1Ed7G/F/d2Tm/YYiDm771Hud28JynhHvBmIQKfwQNVAC8WYzcDZ
         4jmgW7zNtQYGANRoKbsdgzskyhhr28omFkzYKxytma3l7Lkh1UoradbQGMlPUyYybfBb
         uksmrJI22NMZiDXqbjuZ/XwvAR6St+kgR1cPl59BLVUSY5fY1ZAxXVWJX4sCzrEfAbuk
         yJpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760731192; x=1761335992;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RIqKgNRkxn9BJzDsJeVCalVx/LpbceEHRRNoVPWW+1U=;
        b=qS0qlPKqHe3Mu8GFNbXmifBBKSiUzqOWnG8W/iBt0UuApzMgsJ7reNwUER2wxrpqIJ
         Ixl6ehr++iXZfd54I2cremvXWYxArtrWJzeXeBQjTPtw8EeIHkvS394iLHQqT/4VSJgr
         OxSH2myskgVwWKFkRRNlX1ssIFTS5uS16mOCnx7A5w+XDX0/u3LysXeAsysVmCbx/N8x
         4ZZNyHOtfX41LUEX9AQbiXyKXNz9LR/iBrk71a0JGspWNJCKMqOP44cwBSQs3R1DbdS/
         fJ91Ulll6Ed8GwI65ysuJ00jWm9mEuRaNt8X+r7L1LsMey+Ubb+g+U9cpULaB/ZL7npY
         RqLg==
X-Gm-Message-State: AOJu0Yyy89aPdtdSm2Jl/ViXZs28u3HSvbSC9zhYL6y26EIxe5neucd2
	vs1csQVcnumqro+/CNgpfAwwrJo+FBFhJmPObnHJdwsa62vVHU1lBsYy
X-Gm-Gg: ASbGnctjLBDOHzeMRitpx2f2rmB6t1Bz+3cj2AhXGIw9ccUau+0Z5VEkirJ+jOGlcKq
	RbedtvbL0zT+RHBXl55ybi9v+XuZpnG1+NZxHjsw5i04ID0oj1pVJJsI9ZLZxRVelYjskfzuOiS
	BCtgKzXBK3rxJqCKqZNmVhGXckWVaoboP8PBqcAjYOLMNWD/l7o22TKQJuzyFYZGPrNKtcLoqMJ
	tQjJRUVZEO7Y/qXdtCruY+6u41gSLGv1n+vox3UNVQ+uQsPVC2dbAPsnIREl+uGMyOPAWji07L4
	08fkyYhwiMCZyIwxrE+Hs3YIkqTtqVoNcix644cVZT4aF09J6SCUl1/PBcH47lkGczbezTt5Rwc
	Du5K2xlX8p5h+eIZ6AwJeiRoa56daUYkEnzMRAO2HjE5mo8X0i5OUP3UsedJoG5qDqk1Ujo/k9N
	xI4uRtQRHXbQW25HGBfYz9jYF03Cq8jnXwvXAomXd8S0QgxrR6/s36T96ZVGT0Og==
X-Google-Smtp-Source: AGHT+IHzKo3kQw6iuMExqSQ6fFZYvK2nL63bBWgR7byM2mBCBlbduwkLkF6/MliA8xn5+NautTf/5Q==
X-Received: by 2002:a2e:ab89:0:b0:335:40e6:d054 with SMTP id 38308e7fff4ca-37797a8ec26mr16180021fa.43.1760731191742;
        Fri, 17 Oct 2025 12:59:51 -0700 (PDT)
Received: from [192.168.1.244] (public-nat-13.vpngate.v4.open.ad.jp. [219.100.37.245])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-377a921d99bsm1580861fa.22.2025.10.17.12.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 12:59:51 -0700 (PDT)
From: Vladimir Lypak <vladimir.lypak@gmail.com>
Subject: [PATCH 0/6] drm/msm/dpu: Fixes for virtual planes and 1.x features
Date: Fri, 17 Oct 2025 19:58:34 +0000
Message-Id: <20251017-b4-dpu-fixes-v1-0-40ce5993eeb6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOuf8mgC/x3LQQqAIBBA0avIrBvQ0JKuEi1Kp5qNiVIE4t2Tl
 o/PL5ApMWWYRIFED2e+QoPqBLhzDQch+2boZW+UVANuGn28ceeXMjqrR6ctSTIe2hIT/aEd81L
 rB2Zs+NleAAAA
X-Change-ID: 20251016-b4-dpu-fixes-c847c48e0e5d
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Kalyan Thota <quic_kalyant@quicinc.com>, 
 Vinod Polimera <quic_vpolimer@quicinc.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Vladimir Lypak <vladimir.lypak@gmail.com>
X-Mailer: b4 0.14.2

This patch series fix some issues found during testing on MDSS v1.16.

Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
---
Vladimir Lypak (6):
      drm/msm/dpu: Fix allocation of RGB SSPPs without scaling
      drm/msm/dpu: Propagate error from dpu_assign_plane_resources
      drm/msm/dpu: Disable scaling for unsupported scaler types
      drm/msm/dpu: Fix pixel extension sub-sampling
      drm/msm/dpu: Require linear modifier for writeback framebuffers
      drm/msm/dpu: Disable broken YUV on QSEED2 hardware

 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c      | 14 ++++++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c         |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c  |  3 +++
 4 files changed, 14 insertions(+), 9 deletions(-)
---
base-commit: 6f3b6e91f7201e248d83232538db14d30100e9c7
change-id: 20251016-b4-dpu-fixes-c847c48e0e5d

Best regards,
-- 
Vladimir Lypak <vladimir.lypak@gmail.com>


