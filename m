Return-Path: <linux-arm-msm+bounces-90470-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mN2MNEZQdmk4PQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90470-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Jan 2026 18:17:58 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CCF081908
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Jan 2026 18:17:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BC2003003EF7
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Jan 2026 17:17:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 730A021576E;
	Sun, 25 Jan 2026 17:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TcSUwuSl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D95D3EBF03
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jan 2026 17:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769361476; cv=none; b=XvTV+0xikbRwfxcpZUkiTcnApEtcGgKpgEVQ/5jWs/qUbKkbjzw2QNNQGU76ZTlXQva0vp5plKx1taj6f7G9f+etqSx9HYC8Qwt0IqeR2cKUcla6SciT9FDA8pIgxw1ay+hu0UaFXsX9S8VZUWzFYOWL6NHlQHJGQyYEphKghLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769361476; c=relaxed/simple;
	bh=BeEi0RWjbY+H0Ngudm5srUEImIyA5xH0zZkzhqFyapM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B9NDmXma8/pD5xSCbEckhtC7Y509xwYUbYNwiaZGa5SBYySbM1ytWYvqwagoT+oCOmxTdFveTRweYz9pg68gN2dC2gxXD+SzelDHx6cbUxthq6CHbAW/a/lmFLwYJXB/QvkPEbHs6yyAY/nDhke3A3RevwZSIhLY22359wzNr5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TcSUwuSl; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8217f2ad01eso3321856b3a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jan 2026 09:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769361474; x=1769966274; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E+1386rB0n9okZmKhpIHx7JNQZHVrJo7ec2P/m0LSWg=;
        b=TcSUwuSl17+evN3rWY3vnX+s2taVqtgRxy+4qeUp/F7oqgEzEdlafpCKoMonLYqjmd
         ttC+v/kCXFSESz6AhF0MUwBsLjH8+hWCZJNDcQnsMayAWPo30AEQ8izBuH3+88W9Weeh
         FIMWS8KNA/f21bAvOty9/bRyBvVyk1DxSnBOshNXoKxXLBmMDC1weWwZScdp+84p9r3D
         BYi9LLc4KlaCYw/NGEs19OhB75goBm6NwwF6Bn+egWGe5CctQdkbvhl9ezf2PATj3Htq
         AEnF/BWld1zDFETT8axthB3WO2/HvwinXCtojGdwk2p8mJdoSeHCQpI1ksH4OHfRGchl
         XBZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769361474; x=1769966274;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E+1386rB0n9okZmKhpIHx7JNQZHVrJo7ec2P/m0LSWg=;
        b=NKn3Lwk2V3UJoA8s3g9U5HvQi0Y5CXAQ8AqrO1FYG1H3Fr8nT9XXb1M1cRHcgqrMXd
         czu3QXHyePsPswQER4Ov3c44KtuWQ0bdLBT0+3oQWHye8Z9vny6iQhla0RxCuRSDKH0G
         fN7TFDIW0STS5Dqc3lvaHPDddlbpJPjwLJi6NZL1Mf4XlZPT0XG3odBfDwFYqkY2hRss
         k2ByhgE2gL4c89ZDXcEZP10N9/uf6FHve3Pg+KWkXnDGBuNp49KMYpgrCdq1gpNGmwrT
         XcecnHopETTBvMCQ83VLCzB1tN/BegU3SpFGgqaOHtaIBMM3ACPCFCgMAs+QI6kj/RQA
         KUIw==
X-Gm-Message-State: AOJu0YyIm0Qqj773Fcy/YhgjF8rqjNCs0rZs6gzCMY7ptYryxgWBJDa3
	6YGVEs/9nnS84avoR4yKUfb1noHcpIh3rwkwiw7Cf+NPZ65jbnVmXoMA
X-Gm-Gg: AZuq6aIi2eu1g64bpGUMCdTnIzPuVoXMg/A5xw/Pbrg/nk1+XiR8ujHeS+51oLF+Ane
	3U0B/v3/JKn9CsXQ1Jjn1aFweJ7QxLMMZBIsZ/5hJstUBiFrRM0MzZxCANJzHPtnS4P4fofGzIT
	UtlUCC2NBfJ/chaz6+MqTNXz4dAwA22ZBkFrm+bsFyuBOjf/u8bQKeFthAJFQ7TN8A9zn9lWBpF
	+uukrn2q5ffPYkd4zz96f4ply/mQSWDViur59pHN+UF8ittnvLNpbpF3RZBB/0R2fvebq8tFtRv
	5lKnLJEcNax0AFehkITdinGFhoknDb0T2lT6skbRy94fU4D6t6h8qGaEfb+G4bUna+WDn7rJkd3
	T+/JLjqMWTTmIgW9G+vpFPO7yDhMrTUa9HJ8S4HQu0GIlF3SM3CznEnzCiOsgsG/GqymgG39Dth
	+rTQO9vEXuy4MlKKNZduZF+NRvTyTVDJxw7rLE
X-Received: by 2002:a05:6a00:4c81:b0:81e:e09d:2687 with SMTP id d2e1a72fcca58-823411da749mr1575327b3a.1.1769361474406;
        Sun, 25 Jan 2026 09:17:54 -0800 (PST)
Received: from saikiran-Yoga-Slim-7-14Q8X9 ([2402:e280:3d17:646:35ca:7619:a2ef:5e6c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c635a3f2e12sm6924293a12.22.2026.01.25.09.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 09:17:54 -0800 (PST)
From: Saikiran <bjsaikiran@gmail.com>
To: linux-media@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	rfoss@kernel.org,
	todor.too@gmail.com,
	bryan.odonoghue@linaro.org,
	bod@kernel.org,
	vladimir.zapolskiy@linaro.org,
	hansg@kernel.org,
	sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	Saikiran <bjsaikiran@gmail.com>
Subject: [PATCH v2 0/2] Fix OV02C10 camera pipeline lock issues
Date: Sun, 25 Jan 2026 22:47:43 +0530
Message-ID: <20260125171745.484806-1-bjsaikiran@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90470-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,linaro.org,linux.intel.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[bjsaikiran@gmail.com,linux-arm-msm@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2CCF081908
X-Rspamd-Action: no action

This series fixes critical pipeline lock leaks that permanently lock the
camera on Snapdragon X Elite systems when applications close unexpectedly
or subdevices fail to stop cleanly.

Changes in v2:
- Patch 1: Added Fixes tag and Cc: stable as requested by Bryan O'Donoghue
          Fixed code style (moved opening brace)
          Simplified commit message
- Patch 2: Added Fixes tag and Cc: stable
          Removed unnecessary multi-line comment from code
          Removed invalid commit reference from commit message

Note: The brownout prevention patch (originally patch 3/3) is being reworked
based on maintainer feedback to improve power sequencing timings. It will be
submitted separately after testing the suggested approach.

Testing: All patches tested on Lenovo Yoga Slim 7x (Snapdragon X Elite,
ov02c10 camera) with libcamera/qcam, browser WebRTC, and PipeWire.

Saikiran (2):
  media: qcom: camss: Fix pipeline lock leak in stop_streaming
  media: i2c: ov02c10: Check for errors in disable_streams

 drivers/media/i2c/ov02c10.c                     |  6 +++++-
 drivers/media/platform/qcom/camss/camss-video.c | 10 ++++++++--
 2 files changed, 13 insertions(+), 3 deletions(-)

-- 
2.51.0

