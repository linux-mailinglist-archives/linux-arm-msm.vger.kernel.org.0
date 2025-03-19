Return-Path: <linux-arm-msm+bounces-51975-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D3CA69231
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 16:04:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0CFA516D344
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 14:58:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA5D815574E;
	Wed, 19 Mar 2025 14:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LaiYqdAG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 495961F09BB;
	Wed, 19 Mar 2025 14:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742396094; cv=none; b=aiEEMSh5fMUFGDMcRndGJxTp2gukOjezgxBAv0T5vetss506RFfseky/S6MQiwKisu5VUOpZKMsob+9GnRo862IJEYESx6q/OTUNvqTV3UUCXCx6Ex+LhHcbpwyHjfE1UaUfqNp47P+9qDW93t/YEuUomXw1U6T7Nkj0op9Ljpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742396094; c=relaxed/simple;
	bh=ye/Ha1gh841KfwNkbqX4DU3M51WIxb+TjhNn0UjruMU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hVP4HToPV8sHpuZ6kJXtz57WJTf5HoDzOpx8pXLnf/dkj8alI0WZm138PnPoZeZgTRJ3Gjs8rzD0bUavFpJQFeQE/0BSF49yrmsKFc4wX8eSw3tCaXUSrNtgpZ3wSLpzAX2gGLgwcjObGY87tpIoomOVkS+PIeeuQpSuffsn4WI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LaiYqdAG; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-226185948ffso71182945ad.0;
        Wed, 19 Mar 2025 07:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742396091; x=1743000891; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aYQYwB4Q+56fcPRL5nHTiaN7xyPn+dVSiWbH+JLh+2I=;
        b=LaiYqdAGjHqwL+GOw7PvabP9zF+bpyygjU7tHsbCetF3W50jiDvi4oP4yh5AEgh0Eo
         3K4A10k+TA6suDMnLo8rgKNW+YXATGc25BcySAUti6GKifqh+a46DqBns91JFClQddr0
         hwtOUqAjodJsv8HdozL7U+XM3ONw/pbsSDDixcSrCCIq9ytwyeZY+4oKcI4Tu/McBpns
         +poPmLWAbQ1gIHDBeX7g6SnVKTuRpyP7Ny5xAM4gI1W7P+SdB0yzInBVrlk4z6AIkPkp
         IAUE+hjT3kVFY08aFvIMIRKqSDZNqLq1PdRa820dm/egaXkQVHFg9r5f3z+ohee4i8n4
         spGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742396091; x=1743000891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aYQYwB4Q+56fcPRL5nHTiaN7xyPn+dVSiWbH+JLh+2I=;
        b=EbFwMh+2SShvacEu/bC4BX0XH1pRmaAuSa51xJAIR1lEntBchrKEpdUeVDEI6AuSc6
         OWHEPmYf1cCpEkHF0HU3oITOageUwloAWi819ysWD1qUw25V7Q2D56uaZiYVzHMXeCLC
         VcjI+OjVsVoipVaO2iXzO1HQ86T6TRU8xnikxBg5Be4tQIN0uxzvjZsORoFYHsCTzCac
         +XZRT+2RI72jrAmTi9eJWgjs4iwVbTFxrqbGzq+hlApjVp9pO3pYdTs3Z8Fn7iiK6DTm
         ymqjAGu5MI0p/N94uFk5N2nslpO0VFsIJ5iiTfRwFaNx8QTnWqL+AO6yXu3YWVbtjRw5
         J2aQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9vr6yhIXdBv8lXKO8eL5FWnY8ixhppULi9zEV7ywBB6xrrWWz5tAFkiQNcLpE3Yxxef7Jx3ZeUDRPzXvz@vger.kernel.org, AJvYcCVc8tkibrg6eIpjAGzrZqBmDSmhy7He2sbzF3o/nW0jabiQawSgd46I5t4FJID2ninO1m8gYWecfu1LOA4l@vger.kernel.org
X-Gm-Message-State: AOJu0YzvQWfWvjRa8rwcP0yYM0WC1mAP78v8k4EYoDXi5j9k5HDsyCYH
	XfpKm07QQtUqfWVSstrZyPngIZrasz8rYlU5hZaEwWgW4An2vzbe
X-Gm-Gg: ASbGncv/MrpQX8eCHr+47WcnGsBzrZi2gegn4jHng4QPLvt0vani8xozBUvqW948PIE
	Nii9Mn2fZuPyszfXqZU17LInBGxNWiADCH+33cq/6CFyjj5UtJUWBVrHwh74iJoP1Fp3jE3UMpV
	92dsGT5W2t75tfdsxswqqwClaPwbEyLHyj6SrCSdBoQ0wBr4fQfEh3KNBR+w6zrrI83nZYbb/8B
	b6AwmYRT/RCYFon+PeVde0cuDr85onRimFmNVhdFCrmXQQFxonrXV1Nwb+xiibSFfpXKGXSvhy9
	538XCRqLNzVrywMlt/6lm2TJ48BAUS/6SOr7JS4j94OGgcLqq7xcJ9roL1q7qGa/4qAnilv+HVl
	wEFjggu/SmkTYmxKNHlg=
X-Google-Smtp-Source: AGHT+IE+lJUACMy/jDtMWHtB7qfzX6V/KZu/qqIx8l4Z/A67DfiqQ7vwjT+eCEkpsRZkdL/7NBCcXQ==
X-Received: by 2002:a17:902:ea07:b0:224:e2a:9ff5 with SMTP id d9443c01a7336-22649800955mr49641495ad.9.1742396091394;
        Wed, 19 Mar 2025 07:54:51 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301bf63589dsm1681568a91.41.2025.03.19.07.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 07:54:50 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	Rob Clark <robdclark@chromium.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 02/34] drm/gpuvm: Remove bogus lock assert
Date: Wed, 19 Mar 2025 07:52:14 -0700
Message-ID: <20250319145425.51935-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250319145425.51935-1-robdclark@gmail.com>
References: <20250319145425.51935-1-robdclark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rob Clark <robdclark@chromium.org>

If the driver is using an external mutex to synchronize vm access, it
doesn't need to hold vm->r_obj->resv.  And if the driver is already
holding obj->resv, then needing to pointlessly grab vm->r_obj->resv will
be seen by lockdep as nested locking.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/drm_gpuvm.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index 1e89a98caad4..c9bf18119a86 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -1505,9 +1505,6 @@ drm_gpuvm_bo_destroy(struct kref *kref)
 	struct drm_gem_object *obj = vm_bo->obj;
 	bool lock = !drm_gpuvm_resv_protected(gpuvm);
 
-	if (!lock)
-		drm_gpuvm_resv_assert_held(gpuvm);
-
 	drm_gpuvm_bo_list_del(vm_bo, extobj, lock);
 	drm_gpuvm_bo_list_del(vm_bo, evict, lock);
 
-- 
2.48.1


