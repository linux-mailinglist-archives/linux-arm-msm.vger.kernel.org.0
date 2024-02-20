Return-Path: <linux-arm-msm+bounces-11823-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE2385BBB1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Feb 2024 13:17:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 95A0C1F22108
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Feb 2024 12:17:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FE3767C71;
	Tue, 20 Feb 2024 12:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tKdE+lIQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D8867C6A
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Feb 2024 12:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708431466; cv=none; b=iQ7qRR9/UEzvSEQPg7e1XeYWqCrmQ1TVLCGxu3aSfze2IXS4Tf38cJbE8FhHKfsB/m2K+1rtcakmAWzaKfAhpilUiEaeIqB35PJPDJR/ac+C+JAdWOE2DqlS5WDL6OZN4JQpoJWFbdGA8+71HijtTnH8V8fyqakMHDpD+CfkRZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708431466; c=relaxed/simple;
	bh=Err4yde9hbviVCxzR9tVlUIjIb1JIceDcQWFfd5NCk4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kRL0woHITI4qXmKRjOfX2a+9MX8Dl3N7drXeR38HxazQlpMp4SQEgAU4OSSXnx9UJFThcK6vdfBoJvl7vniADvkuR/hjvt/AFi2EeBitT4MXuow5up2g7cio5C1esR/wfibT4Sv6Yn36qVcpw8RBgxsTBRUOfLk9c6kUFFjL28k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tKdE+lIQ; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-512a9ae6c02so3293672e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Feb 2024 04:17:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708431462; x=1709036262; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8r2SYFf+wyFLMEw10XmrxaTrTxAIalvWxcbpOUr7Ibs=;
        b=tKdE+lIQZYyVU1T7jmq4jjJAaZ03bfunlEKJMaAmc9bfoH9ZbkdRN7+DhKsXGnpuVE
         r4m3kAfeZnSef3DlfM4JhLWQxRhtqWT5gVaWzR9iOHTJlLoK3efSOIlwSvAIpcwEdZlA
         YW1sHKVvTYiI+UIs7gtL4ty40lk8GDRqfcXaOI1iRuBUiulvKFTCEEmGevztJknuanPc
         WJwKIL/G3EI0Gwu+ucEG1YEU5O2nZ39Yuj36W4ssRIEGZ9Ap6G9ISaGA+W0lyt9zU5IU
         u3tQxowi6Wt8jPmwIOGpMKkrsyEb4/p39rV4e2qa0hRJVDWxDOFOv9qGcNwQ8j/BELb2
         Wazg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708431462; x=1709036262;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8r2SYFf+wyFLMEw10XmrxaTrTxAIalvWxcbpOUr7Ibs=;
        b=Vdf3JNsO/fkF1c9tbTOk4N0vpla/Wnhqr3yzM+HBj8O8SGciiD0kp+QQ8cISmH7N7W
         XF5L8fk3YB7sXEounRYlBLuztgOTv+/NReCKFjC2mRW7AQ0uMSqdTLNzUsGFobVTv6Ud
         e8gXQ6V6K8c6N9C4d4do/GZFO0TbO8PZUqwJwY3NUTCq/p81ch9LGGHa90LUCclFsnAG
         6NXsEs+VzAo12D8QLH10NfE8Cd0PvxdBxK//FUUnZZAxkd8PwgaeEKZSAYbsy3ExRApX
         kkXN50NewyPSgvihDq/OFo5Y47B+RvcaOuz3/eKze73ZN+KTcVBN+IysmR4DtpwRunAG
         fCWA==
X-Forwarded-Encrypted: i=1; AJvYcCU9+4bXKP1j4DXdSY29V6q1+121tem6qKpkefLcS4BL6CKDiyp3Hp/TCoYHWkYsf4EJaD/xHYoOTIev7Ncwk1NNl38RbBbGj823TUsxgw==
X-Gm-Message-State: AOJu0YxHFuZMxfyuR4QNVMyMxlgzL7xTJ/BhzUlut35exz5DCev6NFPz
	TIs1ZBOvEY6D73LIyoWXpyQ5SyEhV6d29u0m+1h63xBLFEQO1+4HORy5BBLu4XA=
X-Google-Smtp-Source: AGHT+IGf8r51dCXj1+wK5mg75SPQ7glqZWJcKUnocWb0PTPPU8gyalRlsJFibifJcfeUhgcCDExbkQ==
X-Received: by 2002:ac2:4835:0:b0:512:b24d:d472 with SMTP id 21-20020ac24835000000b00512b24dd472mr3390417lft.64.1708431462166;
        Tue, 20 Feb 2024 04:17:42 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id q4-20020a19a404000000b005117c7159a0sm1251744lfc.169.2024.02.20.04.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 04:17:41 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Helen Koike <helen.koike@collabora.com>
Cc: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH] drm: ci: uprev IGT
Date: Tue, 20 Feb 2024 14:17:41 +0200
Message-Id: <20240220121741.2994222-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Bump IGT revision to pick up Rob Clark's fixes for the msm driver:

- msm_submit@invalid-duplicate-bo-submit,Fail

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/ci/gitlab-ci.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab-ci.yml
index 8b82e6656924..47e567b4f7a7 100644
--- a/drivers/gpu/drm/ci/gitlab-ci.yml
+++ b/drivers/gpu/drm/ci/gitlab-ci.yml
@@ -5,7 +5,7 @@ variables:
   UPSTREAM_REPO: git://anongit.freedesktop.org/drm/drm
   TARGET_BRANCH: drm-next
 
-  IGT_VERSION: d2af13d9f5be5ce23d996e4afd3e45990f5ab977
+  IGT_VERSION: 3f2879fef93c0c546a2f1c0aa48a9cc2a594b9d2
 
   DEQP_RUNNER_GIT_URL: https://gitlab.freedesktop.org/anholt/deqp-runner.git
   DEQP_RUNNER_GIT_TAG: v0.15.0
-- 
2.39.2


