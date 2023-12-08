Return-Path: <linux-arm-msm+bounces-3798-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D948809851
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 02:03:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 49BA1281FDF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 01:03:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3666653;
	Fri,  8 Dec 2023 01:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w4dwa8D2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E67AD59
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Dec 2023 17:03:18 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-50bdec453c8so1735323e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Dec 2023 17:03:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701997396; x=1702602196; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+k6qf+bNHQcvQl30mfuUz9ipkvgI67LW5R0klxiQSzU=;
        b=w4dwa8D2aoJk9ogbj/3E52dblpV2gGE4nth80GT0bVMzNps/hYx7zBmnLG/ivWq7oX
         fWWFwt+DMgGlzgcdw2OeGdkjSW7wms1b5mj0WcDE8ZjPJUxjaKHxICS8qOaN5W9vftWx
         c+qjABEjaPDTlg1B4O+asSV8mTVySPLJd5VlN7q7C6+7k+krohSX2wiYJed89TFT0z9c
         n0T02ZdR9vnlgTkB1dnWZKR33uTM/onTFXHAmwonJNOxvm1iwg2zVrRVM4d5vbzsZ5fG
         YluoDlpvxsJGxjnJ0mlhenqWimrx7cVZKFYJ3pRI1nhIiYrCceXIG8gqctOmxxB5e6Lj
         hNVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701997396; x=1702602196;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+k6qf+bNHQcvQl30mfuUz9ipkvgI67LW5R0klxiQSzU=;
        b=pUU477OE+G00eNAQyaRNbFVVupD4iw31aUd8fBLiYdzuoH/zqhRn1I8bm434NPic9V
         vewau/koyFVD+s3sQf3Xp9Sp8+USIw6Zl/0mZzgD0wpGwgbyR0dR3F9nnzT1kgJun9MS
         z4VsY482JpW1KNvPl9t7vPO27NWAm4BoElHLP41px+GzFeQMnCbh+E8n5PUH8fVFlXIQ
         X0gb0S+mf6i2ag92r6U+gp3eQSMcWCPSQC3ADncAFF5FfMXwRJbK0KAZpOLXdKj8OBT8
         C0d+cNY8/1MyIc91F6HAvM/RtVfV3ZpBI4kmTwj1W1+dfgtVozDwzi1oDRtLMiPLQ6Zr
         6dUQ==
X-Gm-Message-State: AOJu0Yy6FVdX5zc9aMJh44W4Y33CxUUl74oUvq6RFh/WItfrBkjwA5jZ
	Y0Q0bqsJxkuPetZVusOrmZoYnA==
X-Google-Smtp-Source: AGHT+IHnR+0WQEYXynumg+Qc9toMubczuekfzq5G2a/0OMdv4pHOEOU3FG1N9mU5AgUYB/y97N6lEQ==
X-Received: by 2002:ac2:48ae:0:b0:50b:e6ad:e7e8 with SMTP id u14-20020ac248ae000000b0050be6ade7e8mr2063009lfg.131.1701997396284;
        Thu, 07 Dec 2023 17:03:16 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id t28-20020ac2549c000000b0050bcb5b443dsm68415lfk.171.2023.12.07.17.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 17:03:15 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
	Melissa Wen <melissa.srw@gmail.com>,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>,
	Haneen Mohammed <hamohammed.sa@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v4 0/2] drm/atomic-helper: rename drm_atomic_helper_check_wb_encoder_state
Date: Fri,  8 Dec 2023 04:03:12 +0300
Message-Id: <20231208010314.3395904-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function drm_atomic_helper_check_wb_encoder_state() doesn't use
drm_encoder for anything sensible. Internally it checks
drm_writeback_connector's state. Thus it makes sense to let this
function accept drm_connector object and the drm_atomic_state
and rename it to drm_atomic_helper_check_wb_connector_state().

Changes since v3:
- Fix the function usage in vkms_wb_encoder_atomic_check() (Maxime)

Changes since v2:
- Make the function accept drm_connector instead of
  drm_writeback_connector (Maxime)

Changes since v1:
- Make the function accept drm_writeback_connector and drm_atomic_state
  (Maxime)
- Added a patch for VKMS to move atomic_check of WB path from encoder to
  connector helpers.

Dmitry Baryshkov (2):
  drm/atomic-helper: rename drm_atomic_helper_check_wb_encoder_state
  drm/vkms: move wb's atomic_check from encoder to connector

 drivers/gpu/drm/drm_atomic_helper.c   | 16 +++++++++-------
 drivers/gpu/drm/vkms/vkms_writeback.c | 25 +++++++++++++++----------
 include/drm/drm_atomic_helper.h       |  5 ++---
 3 files changed, 26 insertions(+), 20 deletions(-)

-- 
2.39.2


