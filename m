Return-Path: <linux-arm-msm+bounces-67223-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA8CB16D5C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Jul 2025 10:19:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C3C825A1C0E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Jul 2025 08:19:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CD2621421A;
	Thu, 31 Jul 2025 08:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="heyOzePL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C35BF82C60;
	Thu, 31 Jul 2025 08:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753949973; cv=none; b=Sa9FR6Q1FZnXQG8Chafd1a/yVcOTE7hGkAz2uD6o9BtNHmkmmbdHxj5UGhCh01mWmV3zRhD+Jwh4Xppli/d5V4YpfbQrTsbG4bgzDp1LHLpn/kopMtmsap/g9N/ZWETpBHiduzjiUzHZuKFS0Kru7A5eE/OMw6fIDCG+8XzYzII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753949973; c=relaxed/simple;
	bh=0vaKqZvrPhHzumwCUnkmhXEhTuQii5LkNmupw+sVC/w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=chMrb6FjHQS+k0NDi2WayFZIQx+gcL6hJOwE4IyprD7WE8uMWL7KAhnccIAVtglBAbJ+nk70KHK4AoFV1XCDCPkFwgccsicih1qv/69DTKzVf766bQ8bYlr2dBCcJ7IKhai6jvdpMTrI6ej1cMUdZTuap6zIvxy5fUFvdb5XrZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=heyOzePL; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4563cfac2d2so5862115e9.3;
        Thu, 31 Jul 2025 01:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753949970; x=1754554770; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PkEegUpZ9ZzAqOYrg/wkR0sKWBlbmTquOxH2q3dqSXQ=;
        b=heyOzePL7DdjvGg8m+ZWWoOW4A3fblXWp2GJ6RSlYynC3Pd6FJzKCYafG3b5C/LsBP
         x5TM3mLls2V7Ogd7/ZYyB0U2iUqD/fOdtvOCj8iUbnAK/E3GnmQN/TkbbnLmQkckx+HZ
         KPGMWF9ZcvF8bV9vX/KgOACpCdtDDWsJ/t6vmP5IxMxygo2SrkgCZL6NfrzkmTBjk1ne
         hwtEafyaCgpbZ+s2IHPubZnsrXvE/GrKuxfiDWkAQimXS54zptjjwEzSt/dxwLBXvkze
         Q8GAmHY9T9fIw19tG+y2pTGx3OoYldPnd4+7efOGc9PwHNoiDPHpIcd46jIOpnDNu4Tx
         DSIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753949970; x=1754554770;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PkEegUpZ9ZzAqOYrg/wkR0sKWBlbmTquOxH2q3dqSXQ=;
        b=moBi9rr4FJJB35ynLqqfR3n0S4T5GqADm2xbnyTEQd2krk+XuOLcpFMH5LMXk3xX0L
         W5qpagEt5OO1nj6WiovT2261ubzNqjKG+7cCZTov9oB+shASYJjcf4XgBZcowgeFMp/k
         3ZMnZ4st6E7M3oUCGJZcoyXygjWMCtZb8tVAAM9G34fiVv53tkziJwILtJ7USJpyQoQk
         /Kt8r9s7eGbE40Ve9EM7VJSVZ6bH9b5xFH4oC7nwWX2ZhP90Kpm8EbcL12AZ4bPi5pDV
         x6nzjTRVlnoa6ohJ00nIemrWgRwN6wnJ9vU7BVEHYhXPb5zZ9w6ncFdmecvN8l2H+BRE
         0Frw==
X-Forwarded-Encrypted: i=1; AJvYcCW3qDqMsqewvgA35juJy5/nIw9tR5hyt2iKVYcNasq/aarRppICwP8Rd2Y7TFtqtqRZqgQ+qeVj9wX5y414@vger.kernel.org, AJvYcCX/0c+oC2qbRIf71Z6xufXaY4hXSo1RDGMqjKICFMygGZC4BPwSX1Pj86AS10gVhHG3a2beqXKuBy4n4u28@vger.kernel.org
X-Gm-Message-State: AOJu0YypM7hG69E84vw97eLi2t5JXKcdQjkhE/etDAxzciTLhkGtuEFl
	Nh60mktuyrLH6srjpijc9aL7+PaXayoyjj0p/YCDBSzot93//gWwNClx/gMOtwFv7Hrjlw==
X-Gm-Gg: ASbGncu8HmPo3AFKq/hqV1qaB0RgNxf3wlXVKkHjWMmyUpoLTMl3ZyRBtvS4BAhm0tV
	OhV77hrLlMg94VKxtPZMV/T3cdXvX1UnAoiNJh7EgwesEsqODd66TBPn6YhloiXiA4X0AsvOedF
	yZ+r2KNPf42bzACA4rPXi5BsVraY7nG2H7SMS28FvSIjKQ379cSAt8G9wkqTZqLrEdCVc37AZuE
	/ksxHI6h7dPUkZB49yXd+jg0MzXFfL8dn3Kp4RZ6th2v5kwkRbpyEDrg7Xr25jXrqJFqnRA7aEz
	ppkhwb61ixq4Q58pL7SPcVbL5LmRUIaLDcoWfomnp3WKxydpjMqbGlH5aXiEymkLOFcuVPqXf7c
	N5JLilaeKnw65j3TH5Ypr
X-Google-Smtp-Source: AGHT+IEPDaMVhWW2n1WGfzfBPNzx+lnFtPTcM8Lln0dXEBRsQakWJcRvnKqucP1A7XtQmDuBApddnQ==
X-Received: by 2002:a05:600c:1d23:b0:453:483b:626c with SMTP id 5b1f17b1804b1-45892bd06e6mr45659025e9.23.1753949969880;
        Thu, 31 Jul 2025 01:19:29 -0700 (PDT)
Received: from localhost ([87.254.0.133])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4589ee578e4sm16780525e9.26.2025.07.31.01.19.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 01:19:29 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] drm/msm: Fix pointer dereference and use dev->dev
Date: Thu, 31 Jul 2025 09:18:52 +0100
Message-ID: <20250731081854.2120404-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Fix a potential null pointer dereference issue and replace
minor->dev->dev with dev->dev in error messages.

Colin Ian King (2):
  Fix dereference of pointer minor before null check
  drm/msm: replace minor->dev->dev with dev->dev

 drivers/gpu/drm/msm/msm_debugfs.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

-- 
2.50.0


