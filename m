Return-Path: <linux-arm-msm+bounces-18020-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C07408AB8C3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Apr 2024 04:33:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7CB01281D14
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Apr 2024 02:33:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46D30D520;
	Sat, 20 Apr 2024 02:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q+Yl5GU9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B46F5382
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Apr 2024 02:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713580389; cv=none; b=tYw2QrLTipqwgZm1Y+C0WX+jFKTh3ynLCe0arJkjExotXoYH3NHJ2cRsbVm2ox7ritIL5YmYuQt4xUJ6m82GHSuXn/TudWZQL3kz0xqrWbaENAW3ULKtJBs0nTr5X31HmdeY+95mqUdhoslGAYdh6dCZxml2F8r+8MSNBGtFRds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713580389; c=relaxed/simple;
	bh=APWeS2G8ldD8gvmeJXu8a7QBkWaV4iIippY2f6pvmoA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=j5Ag8r5BMLjsv7JNypVio8PlPacf/iJZSIAE+/Rlq0rIxWWwxhtW7B0ItryHNMu84HKTsgimPaDrkDr9dyGLG30vTnUf5JeYtl8xx7IGiqjRUGW+3/4n3BQYhEHxYuaD592ya1Hzbl92w6r2/UHEkkzPShg+L9jy1BzJgg8VomQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q+Yl5GU9; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2da01cb187cso45985651fa.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Apr 2024 19:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713580383; x=1714185183; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IHIy43O0Jlbv9g9HsqpFU0YMmnLVDcwucd3KlxrGMn8=;
        b=q+Yl5GU91akzoPBiDEmhiewkfIuQrUDXLqOejhRO7xmmFyW2g6qCNR5sDvkNmK2bk1
         GAewt8OJtB14F0YRfD3gcvvl8hwq7BhH02UrF5kvWd7rsfGwqXTgDeyzT7l7GqP2PY1p
         Ea4iQnsL3dRmYLEczjWPKg4iBVrmg1YybhMIs7SUBeJtJFbpZp9yLKvpUj5QPbajlICG
         lbLL9TWzEFEP4tJjxLU3I6iLOxdSDf5bR08YMaddLoX4AHb8oxpPNkXna/929sC/EMjU
         vIxZ2e5/rwllDwTPqyxm3XhfufEi3scA0Ys8oIT/icyRJMrmD1sVB3xat9wbMtxJyoQo
         uwbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713580383; x=1714185183;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IHIy43O0Jlbv9g9HsqpFU0YMmnLVDcwucd3KlxrGMn8=;
        b=YdsgIpfTRi5bB9cbJqpGq6+Kk0WMhLJhR5osAsBKhsv2tsyvAWKeXByB8amuq5rQnK
         /6Si//dJuFlmafHhosgebzLmn6fkZJF4HgoHXbp0AkVJErA7v7rbx1eWXvz/QvlccPoa
         68Amg6thuCTXXy8RE1ZABIDR85Yjuk9493CgivDJde8o9dBD4zG8Nfd11qHd3RufqKdj
         vSV9q7wOst2W4FkVJwU1Ox5b763N5C+wJ9Y8zimD0TiJ33hmzfadNi2r80j6zvExNAAd
         B++xLilcMkaOdjpDNycHdD1XPPRsF3VQjGrLs6nVlTHjJlqQ7gFsgb9QtaTS/f3P3Hw4
         NYLw==
X-Gm-Message-State: AOJu0YyreG+ho5MTe4Sj1CuRJHTh7XOvhPT5J9NvSOEmbfz45Fud5v0Q
	koauqhrc/KGUyuMQ3csKVxMRakS+kr72InxwB0L2WR8cq7+lzfs0DCuWOwdd1vRdBwOYHs6elv2
	B
X-Google-Smtp-Source: AGHT+IELY29fR7/hEuxXxHgYa93CB9/GPBcRflN3Wa2OvtdCm+G4fMhzYAJFURm7JCFf2aQJby6sXw==
X-Received: by 2002:a2e:97d4:0:b0:2d6:8868:f1a6 with SMTP id m20-20020a2e97d4000000b002d68868f1a6mr2841297ljj.43.1713580383060;
        Fri, 19 Apr 2024 19:33:03 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 20-20020a05651c009400b002d87e936833sm836843ljq.125.2024.04.19.19.33.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 19:33:02 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 0/3] drm/msm/mdp4: fix probe deferral issues
Date: Sat, 20 Apr 2024 05:33:00 +0300
Message-Id: <20240420-mdp4-fixes-v1-0-96a70f64fa85@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFwpI2YC/x2LQQqAIBAAvyJ7TtDVIPpKdNBcaw+ZKEQg/T3pO
 MxMg0qFqcIsGhS6ufKVOuhBwHa4tJPk0BlQoVUWlTxDtjLyQ1VGY/zoUBs1eehDLvSL3i/r+36
 I64o8XAAAAA==
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=858;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=APWeS2G8ldD8gvmeJXu8a7QBkWaV4iIippY2f6pvmoA=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ5qyZqzb89RHFa7pqfUzGPasSWcwuHNo8Tw9D+VLbE2X3
 3rN5ovrZDRmYWDkYpAVU2TxKWiZGrMpOezDjqn1MINYmUCmMHBxCsBE9s9m/x+fcoNTLa7dnLci
 t0yoLaKLIXZOWflUpvkL7jCsLfbc6Derw5xJYWLhFdlm961/D6VxfBecPMuQ1ebfb8vwp+X5Xqu
 v1zw8rHRvxnORfce/OzBEx4oLJien3Ln4otbRrFl9U9w54ZA6Xntx0amnMwwTK67EcDsqPLbLe7
 3GPGAqv90fkfY3BU9nqdeW9jYWt6jq1C5aP0Nm/hHbK3XfC7Mtv/pHNH8u49rG2vJYxydi9rS73
 zdkZluFOC2PyCteeIcvZL73y+V5Hy5Eb7niGz75+uml7T3Lxe2L7Jq0rcUdlivcZ5kj+rHntxRD
 4w9VndsPkjfwPzt85kTIKgkT7hMZx/bIJeZvsOGsOX4fAA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

While testing MDP4 LVDS support I noticed several issues (two are
related to probe deferral case and last one is a c&p error in LCDC
part). Fix those issues.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Dmitry Baryshkov (3):
      drm/msm: don't clean up priv->kms prematurely
      drm/msm/mdp4: don't destroy mdp4_kms in mdp4_kms_init error path
      drm/msm/mdp4: correct LCDC regulator name

 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c          | 28 ++++++++---------------
 drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c |  2 +-
 drivers/gpu/drm/msm/msm_kms.c                     |  1 -
 3 files changed, 10 insertions(+), 21 deletions(-)
---
base-commit: 7b4f2bc91c15fdcf948bb2d9741a9d7d54303f8d
change-id: 20240420-mdp4-fixes-f33b5a21308b

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


