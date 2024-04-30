Return-Path: <linux-arm-msm+bounces-18942-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA7C8B7521
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Apr 2024 14:01:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D22C61F2320E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Apr 2024 12:01:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60AC813D28B;
	Tue, 30 Apr 2024 12:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="S30pyaCb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 875AE13D892
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Apr 2024 12:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714478466; cv=none; b=jXyCjRrnk22pMy4Xcy7AO7m8rkTEsMeaXKVYTkVP32Et5Gy55gjU48VJTYFTOn6TuxhFTmmGH3fHvRPe7MKTD55ht1AR+Y9CAgV6xOSJ8nkZldNm709giye9cgJIOn1BUpzdDNxHjzkIOcqKMfJbLQtxnMWE0RHpA9sxP3ajSIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714478466; c=relaxed/simple;
	bh=2qcLEMK1Fn+N0abKR6SrQ01XTQjI1OvqZUs/FLQLSeI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rvWifxFk5BQ4NjDVmnVWf4VzPQ4ZNfMRph2rv0MCNuz9b9bKw7FcFJvJUrG7KdmFFmKppsA13kmVU4KOoCjXP6FhNCisFTsvJz4sTn/CqCtJsYQ4xeTq75M0A3jhLIv6FUPpGu+n8gnhFFzbJN+ApdaGtaVZr2EZGn0/2yesRgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=S30pyaCb; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=D4ut/b+eS62cUy
	c2wWIOIQ5QpP8PK3TWPgfE/RDJDnI=; b=S30pyaCbmwexde786Jy4Fc3AJ24k2V
	+NigbBApY1TKSe0WuS2Alkh4K9AtgY8/l00gCXqACqtmWBgd75QSy8ZjFox7v1Jh
	xjKccZKMGutjG/KN5YcRlzdd3EUIZz9ndG35GlNowpgF19ocEzGo8tzNX0j4g9RQ
	/25JaC+OfqitGiKG1tv2EaLy4DtrPIpzx7xkCUDBLVz7dxA2ymr3SO5fBnVlgObg
	2ZteiSMn+CtE30JNk6hoehaQUopfYrtYo2LcYrbWPEjKWs1+PgutmHKz4/rPeiAN
	jku8Pc4wvNza9mtMTYyQrcCHHOeWAv0Q3xLmGWn+bEiR3OQ1LQNs6Zmg==
Received: (qmail 2623430 invoked from network); 30 Apr 2024 14:01:02 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 30 Apr 2024 14:01:02 +0200
X-UD-Smtp-Session: l3s3148p1@kdO5H08XjpZehhrb
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: alsa-devel@alsa-project.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 0/3] slimbus: use 'time_left' instead of 'timeout' with wait_for_*() functions
Date: Tue, 30 Apr 2024 14:00:58 +0200
Message-ID: <20240430120102.29459-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is a confusing pattern in the kernel to use a variable named 'timeout' to
store the result of wait_for_*() functions causing patterns like:

        timeout = wait_for_completion_timeout(...)
        if (!timeout) return -ETIMEDOUT;

with all kinds of permutations. Use 'time_left' as a variable to make the code
obvious and self explaining.

This is part of a tree-wide series. The rest of the patches can be found here
(some parts may still be WIP):

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/time_left

Because these patches are generated, I audit them before sending. This is why I
will send series step by step. Build bot is happy with these patches, though.
No functional changes intended.

Wolfram Sang (3):
  slimbus: messaging: use 'time_left' variable with
    wait_for_completion_timeout()
  slimbus: qcom-ctrl: use 'time_left' variable with
    wait_for_completion_timeout()
  slimbus: qcom-ngd-ctrl: use 'time_left' variable with
    wait_for_completion_timeout()

 drivers/slimbus/messaging.c     |  9 +++++----
 drivers/slimbus/qcom-ctrl.c     |  7 ++++---
 drivers/slimbus/qcom-ngd-ctrl.c | 29 ++++++++++++++++-------------
 3 files changed, 25 insertions(+), 20 deletions(-)

-- 
2.43.0


