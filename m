Return-Path: <linux-arm-msm+bounces-57876-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D87AB7178
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 18:33:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 148E81B672C8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 16:34:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4217927A470;
	Wed, 14 May 2025 16:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iNj+4G4e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB5E1C1F21;
	Wed, 14 May 2025 16:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747240425; cv=none; b=YEbaP2Ir5WvJrW/QA61Z4IFXwQ+KkTrMcLrhvEK2LyGGk1HfmggXVLMq6Ajc9GtSQXc5PruKI3vwKVfo0DtEmGI5VnQJlG/HHR/OWEcyOObycd8Qfk4FyvJ3o1YQgs5tw2iHsL8/GK5KLVlZYCqCNzu0B4BCNXgfaeuvqHO/lAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747240425; c=relaxed/simple;
	bh=1nwxBKuI5G90u6V3HZVNVHDKHS5z3vUwKMEcOGgc9lc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EBqewVzVd0Jy1U34El8VXqUXMdrtF2a1l/G3gT0aSmgS/JkC6sBoQeoMeF1WPFMp61i6O3k/4mnXdBXoYbdPsbZoWf43zh61Bfr9GeF7nHlzDFKE31UsY4S+kvnOQ5ejRGeeu0r0OnKLiseB18lIa2BM5sLS7kIQPp/l00g2TIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iNj+4G4e; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-879d2e419b9so6544768a12.2;
        Wed, 14 May 2025 09:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747240421; x=1747845221; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xVkxVRdg2M/AIh3AWsgwH9hFnfAOA4U3vxBTP/C0R3M=;
        b=iNj+4G4eyMRZdIDDB6eVdv4zDr0xOTd2S0Ghpla8pK2oIOUl8/BXfMXl0sGXBGVLno
         ia6vLYbpwlsZdFZmIF70iXC/VupmFFkpOtx6m/YMUdtsiqgtYecB94CQdE04n/LwL9wj
         SWIlCAd2GDiSve6t862vDXFkO7s2eNMV+d8LhOCgUqVzQ3JFkPmjRe6LMeCgA2ck6Uxy
         XBAXQmITbz1T/6Vgp2rcP+vcJDcWEyxChe78zHiyaIXsUfq5SmZbJFj7+qfs5NCEEO3P
         xA396ZIHcB0P81IIZ4QBY9wDpirbCpAcvjTfV9deWqG3eYUd1ijXaIrwlljeDfU0hpvn
         3mgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747240421; x=1747845221;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xVkxVRdg2M/AIh3AWsgwH9hFnfAOA4U3vxBTP/C0R3M=;
        b=O0FG0oUkPOozMr/1ykvgK12ifFKdktusrCNGKiQkwMG3DEWRhgoHRKnEgBpDJMEk+/
         6mh56JJlZ/m4Pz5tPQqVF+2tbkGEznmWlS5fNcE3skmhnEg8dhNxztVWSBPad9bT/Bgl
         UckBvUkNNd2c23TMTmQbBiU6LGz56tZoDAbtgHEOLxe+YmLety5m7lUAmd9PQ10VGAYJ
         ANcz6oCMVpTnKN6TgJXgtlYKXHI8FIswuW6g8rKvvz2i8f8cessx0olve9ysvIJbbUus
         FJgfVPOfp3TMbUIE7/K5P3DIW6rJQ5jLScy7C3VTR/kstsCQae6SU+Y3TZeY0JvGQ/+V
         tSkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwFMKE3MQs1MV6O8MA8csD0SRj+rwdYD1dRmjKXs6CPzSD7fw6L78F+XEtptaRJdcGgbxr95BbbSKDUPs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxH5nrcqMv1uT429MbGK4krEKxezMDlLUOVBvfNshrKxnCH042k
	Aur5QdFrVEi2wBwzj3DxWZF/PjhBPerP1ZMT4oBB7XnbkJrTZ/d6T956bQ==
X-Gm-Gg: ASbGncvy6UgybpF0oMMRSlTE1zW6FZwX0qFmx2NKN070eCbzHtv0HEGW8Ia36o2E5ZQ
	VRa73QPrEDhOuzCxcUbx3Q6NQRvJRwqzmyjuPYfka7vgG29Wzz8P+iKUjPV9LQ08rpUJyLT948O
	cK6q12xwvLq5P86UB8cWqFGPi4xyg5w26qi/DtCq7ZpCzhN7NZWY+G0dcTPjLKTpZG0/MeuevHP
	PFJH1DBgNqo25uZWGgroIjTR4syIYlbn+bDR0B7S8E7Oj3tAKQB+JjvlQ/zz6cK6KmrTvM0YpGd
	RX9Z+pzAu49W47n45yvBt6HdEEc7Ie5ix4EBmQfpS1a6opJJ1ySZnSMvtafQFiQOFHvkeO92Gfx
	P4EuMWASZSMABxPtFDgPze46Ewg==
X-Google-Smtp-Source: AGHT+IHatQ6/wd/syK5i39NkoDdy1R1SzksD0uoYCBe2eTGgXV9Acjls0e/9P3cZzXmWvFE8Ptffeg==
X-Received: by 2002:a17:90b:4acb:b0:2ee:b4bf:2d06 with SMTP id 98e67ed59e1d1-30e2e6133d8mr5740820a91.19.1747240419803;
        Wed, 14 May 2025 09:33:39 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e33424d3bsm1759592a91.11.2025.05.14.09.33.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 09:33:39 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	Rob Clark <robdclark@chromium.org>,
	linux-kernel@vger.kernel.org (open list),
	Marijn Suijten <marijn.suijten@somainline.org>,
	Sean Paul <sean@poorly.run>
Subject: [PATCH 0/2] drm/msm: Fix a couple submit leaks
Date: Wed, 14 May 2025 09:33:31 -0700
Message-ID: <20250514163334.23544-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rob Clark <robdclark@chromium.org>

A couple things I found in the process of debugging VM_BIND, with all
the kernel debug knobs turned on.

Rob Clark (2):
  drm/msm: Fix a fence leak in submit error path
  drm/msm: Fix another leak in the submit error path

 drivers/gpu/drm/msm/msm_gem_submit.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

-- 
2.49.0


