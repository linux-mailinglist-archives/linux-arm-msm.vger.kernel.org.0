Return-Path: <linux-arm-msm+bounces-12910-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB3686B753
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Feb 2024 19:41:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2617A1F2152C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Feb 2024 18:41:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0890A71EA8;
	Wed, 28 Feb 2024 18:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DVVv8qU5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4638871EA4
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Feb 2024 18:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709145691; cv=none; b=eNR2poT6ceEIqMWwrfpbd3pqhz73JmyaNZLiP+1LKwWsg4Mrt8AV21jhINgfbM1+rYYg86tijDsU3HSeFbIcDf0BcBcFc0ej6mhjQvLYOVZbPnpmb1Jr4q2rM/CSWwuqCFOPv+UlmglZ408reAp5PreoZvQQM1Y8oe3yVy40sUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709145691; c=relaxed/simple;
	bh=KX71DybNVrsp/eCFHMd97FWJiAfWa/uOppuXpou+ukk=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=VjhvmHsvv/rRcVqbADiUWfjVGrJDLBmfAjaTS9+v1UKVX1R2qaAbvMbEDuTW6aALU0o01/AZ7pwyX/cEty/jcTR6N1zMxGCu9C8od7wug+jjLBHAEhqdobSjSir/u9paK1GrndOXyyfu97rwT+NaD6LVyqlxFsJeZcXzRQGw3dI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DVVv8qU5; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-56533e30887so129079a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Feb 2024 10:41:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709145689; x=1709750489; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=95wFx2aCsFcmw8X3YJUhwgxK0Zm3iU4v5YjwKuQWRT0=;
        b=DVVv8qU5XxusPa47cCElhecq1h42CblIlFHrBXhmU9q4JCkPRziZA6PvnTHM2mvU2Z
         j2A3JjFIT+oU8He0OdGc/03RDTDxQS1A8/BSFmXEbZwKSvJISB7+F6DlnPKuTXpRBKmG
         R3doXojIOOql6lm+E6RAULFFJs+ySaf5X0VbMB1xuTCK9dl0T0xLoOVAPNLifywKXcH2
         7ORvj1IvEahXEgOVRbd24vk0ZZARb2HpVsmT0ymH60SL2SRAZ2mXIYmkqAOeJvACkyOE
         vMg9MhGZR/+8k89Itmm4rzvJFmGRn0Ebf2rAjzlLfkGGTpxDJLTe9TDDBN3vUwAqWJep
         B1aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709145689; x=1709750489;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=95wFx2aCsFcmw8X3YJUhwgxK0Zm3iU4v5YjwKuQWRT0=;
        b=TrlbseR9r0sLSRTeEjkKwo5PG+weSA1z/tnF9cGIb8D7gh+c/YbFzh1F8M8YHGNvbT
         VUbm1u8HfVG8i+atWlGZG0RCWsCBLwFG93Lr2eLTDtaXWqECu0GOBGDxfDrlQdhvUCCf
         jZMFwoaquGZ4jD3cFnH+WrlcCu3VkRH1rXdOAbRhui/USFDHx0U4pIRBppH+X9/ENHkf
         awvSAeTJdFitl4a1z+QF448CzeOQSCrBkeV/zaXT6WCABDt7CSMWm+zT768xq3Hokkyx
         qvqnEGVdqUfBvzorcZ9PW7AYT6JmqeAu73o/G+NjA0UcrfCFer595lYYNxKtvWLZRn9k
         BUbA==
X-Forwarded-Encrypted: i=1; AJvYcCX/mTSwabzCeVm5U8cVFnShNYNafG37me1GNFMQ8+zrkAqzZ1jurjNBY0mCcCTM5baLqDFsfkeAjORCNKf3DTDR3zoI8qRSPz8VB7YCMQ==
X-Gm-Message-State: AOJu0YxDQLbB6NIhbo4OlgsEUM/9lOw4wCm2jIu4wQzlqc3FJAC0Mp22
	6P26lO1SysU+/cBxoiZVqWVuwkHCxFdSCCuCHMwNIo/sje1OoceKtQq1G5F5vkHB4nqQL4nJaxf
	mKxYZRbq6pauOerPLvDmg2Ps4leo=
X-Google-Smtp-Source: AGHT+IEa4/vZnJzDBE36BxmCOOtWA7C9UykVSL4tVjlLlSy8+V/RsmB/GdG30jwh0G2AiZ3gyhpAF9Z1Td38YY6WgNw=
X-Received: by 2002:aa7:cfd1:0:b0:566:44b4:ea58 with SMTP id
 r17-20020aa7cfd1000000b0056644b4ea58mr172224edy.38.1709145688531; Wed, 28 Feb
 2024 10:41:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 28 Feb 2024 10:41:16 -0800
Message-ID: <CAF6AEGvhWvHiPGQ1pRD2XPAQoHEM2M35kjhrsSAEtzh8AMSRvg@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-fixes-2024-02-28 for v6.8-rc7
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, 
	freedreno <freedreno@lists.freedesktop.org>, 
	linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Dave,

A late revert to address a displayport hpd regression.

The following changes since commit 8c7bfd8262319fd3f127a5380f593ea76f1b88a2:

  drm/msm: Wire up tlb ops (2024-02-15 08:51:31 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git tags/drm-msm-fixes-2024-02-28

for you to fetch changes up to 664bad6af3cbe01d6804b7264bee674b3e7dae7e:

  Revert "drm/msm/dp: use drm_bridge_hpd_notify() to report HPD status
changes" (2024-02-28 15:32:29 +0200)

----------------------------------------------------------------
Fixes for v6.8-rc7

DP:
- Revert a change which was causing a HDP regression

----------------------------------------------------------------
Dmitry Baryshkov (1):
      Revert "drm/msm/dp: use drm_bridge_hpd_notify() to report HPD
status changes"

 drivers/gpu/drm/msm/dp/dp_display.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

