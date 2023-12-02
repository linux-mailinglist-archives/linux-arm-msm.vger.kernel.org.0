Return-Path: <linux-arm-msm+bounces-3050-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D95801EEE
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Dec 2023 23:14:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 211531F20F1F
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Dec 2023 22:14:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6479E21100;
	Sat,  2 Dec 2023 22:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="st49utnD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2AD5CD
	for <linux-arm-msm@vger.kernel.org>; Sat,  2 Dec 2023 14:13:55 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-50be9e6427dso651870e87.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 02 Dec 2023 14:13:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701555234; x=1702160034; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RDt6ed5YyAr8bCQzidGW3T1b8/QeSwezcMTpTt5+nc8=;
        b=st49utnDCh59Tl9gV921nsLUobJNlUz1wAZBLb4eBDJ97mKf1L6hJ+Fwlgyu+g5t25
         z4PVIjtMUX8rgUeKOVngVoxRahyD1wAppTau3MqanTGtrjrHxM3bQ83YuqoFaG24eiG4
         t+r7lrQAfyRNDQXAXvZjpcjnPBs+oxrpps65tz5vb9nr8MsIkcjRatqbVRqX1hSjkX0s
         VfO0ClF04sxMyaRrufUNlDwpM9ANsZV18IgY1Q7VS8HzGLKZI4YVbnTPRB/o8nnWloRu
         JN8PJoqTrpBUHvCKp3sGQJILUUK0rragS3lKYjap31sjj9H6kYkwD+fQ75pXT4Gpwir3
         Pe+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701555234; x=1702160034;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RDt6ed5YyAr8bCQzidGW3T1b8/QeSwezcMTpTt5+nc8=;
        b=LZnkqyyrbUVWcJa1ZPOmOpH1kcA6WgNgHIg7Z/YpsJeLvSKX9QBaf0uc1qshBd09hP
         twRcffr0/qtZvh9dcChG62AMjyprh/X4ZzzlUB6qU2i1qs1GJDJaP9h/SwLmgJ9Y2HB6
         xY9jkgwxNPNJirogE/mL03tIq9diMNbLLYNRDH0vT+bwUq/+ewI7Tx2WJm+KG6XSuuW+
         hZyae6SeJbzpfYGN7uwS/T+a9AkdbhaQ4UtqUJD+Mo+xtYpiV9BWa5jhYLVS1kgZgY1i
         a0pMg6gpX6+m3UG0BoyuOyAkAAVcBmiz29sizPKENBsuOwisK3BjptkDigDMWZitvjLx
         jX8g==
X-Gm-Message-State: AOJu0YwQqZvMZZWtbvu7vnB/p8XvLjC1AE1HyfbqTyecVotx73zwepkL
	q5JFsBphX1VLJkKrYvryr6fUYA==
X-Google-Smtp-Source: AGHT+IFI+s5guUgN5bqh2M/BmFJ3WXmv/Fl2wQJqaxtFBp/JzGB2aR2IVu60ySBE0+N39NgVDxraRQ==
X-Received: by 2002:a05:6512:218b:b0:50b:d764:803c with SMTP id b11-20020a056512218b00b0050bd764803cmr1540619lft.111.1701555234051;
        Sat, 02 Dec 2023 14:13:54 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id c27-20020ac2531b000000b0050bf2e33c81sm8154lfh.225.2023.12.02.14.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Dec 2023 14:13:53 -0800 (PST)
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
	linux-arm-msm@vger.kernel.org,
	Helen Koike <helen.koike@collabora.com>,
	David Heidelberg <david.heidelberg@collabora.com>
Subject: [PATCH] drm/ci: remove rebase-merge directory
Date: Sun,  3 Dec 2023 01:13:53 +0300
Message-Id: <20231202221353.1276288-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Gitlab runner can cache git repository, including the unfinished rebase
merge status. New CI job will come as a fresh checkout, however this
will not destroy the unfinished rebase, failing our build script.
Destroy the unfinished rebase state.

Suggested-by: David Heidelberg <david.heidelberg@collabora.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/ci/build.sh | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/ci/build.sh b/drivers/gpu/drm/ci/build.sh
index e5c5dcedd108..ca2923ed2290 100644
--- a/drivers/gpu/drm/ci/build.sh
+++ b/drivers/gpu/drm/ci/build.sh
@@ -58,6 +58,9 @@ git config --global user.email "fdo@example.com"
 git config --global user.name "freedesktop.org CI"
 git config --global pull.rebase true
 
+# cleanup git state on the worker
+rm -rf .git/rebase-merge
+
 # Try to merge fixes from target repo
 if [ "$(git ls-remote --exit-code --heads ${UPSTREAM_REPO} ${TARGET_BRANCH}-external-fixes)" ]; then
     git pull ${UPSTREAM_REPO} ${TARGET_BRANCH}-external-fixes
-- 
2.39.2


