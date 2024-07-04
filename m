Return-Path: <linux-arm-msm+bounces-25239-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5698692700C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jul 2024 08:54:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BD6221F23FB2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jul 2024 06:54:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 367981A08DF;
	Thu,  4 Jul 2024 06:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jyRLZnwp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D581A08D7
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jul 2024 06:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720076053; cv=none; b=bW2N4reoTZIWUaMdSpv3nRWttwOIwLtC9hjt7eoNcMvaTUMdH76geGG3J7kBKoj74EP2iNm0kS7ZHtogFJS65epkczb6rPslliWDp9awvkqfPMeLJ5NHD/n4b+g7snlDC1+Cgqyexq2rUVtiBbsa3bVS/ZIGL7zJoFUiGt1KEMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720076053; c=relaxed/simple;
	bh=+acP1k0Nkw7OnsyYvGJb6tDt5gJNkeqeIL3W8k34Rd8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LKvXGuMsJ4Tg3rIoQfLivuVjYB+lGnw2/EkDp9ZjLjv0WW5md/kR0aycBi842lt8LnfZULvu5tRuXdybCNTIb8KVwlVMfuz/NuWVn8T89mKdW7vkFNB2pcr0rkVpNIS2HFn2HsjEYUDx+TY1/6Q+oyu+p9Tt8YpN9ZsYXYamzkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jyRLZnwp; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1fb1c69e936so1481005ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jul 2024 23:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720076051; x=1720680851; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OaHuA4w4nVtdao/fLWo0eQBQ8CqjNDauvvbmii8lIbw=;
        b=jyRLZnwpjkOdnBn4D5akngZ4DnqIj/v8KX8z/18vBF55UFSm6P/gv/mRsr/qseExRG
         kR5kbZqqoU+ps3+95XFjrhMutJvehOg3rSxqyF0dHxfBu8g+cVpbOVCtEthz6KophVLo
         O2UQriFQ0iLASVKrqGZ8+XrZ8mPHHQs2XQlK7Y3KOMkeL+wmwwd0vTAYPucD0I5GCum4
         v93ejIBc2cVAt3GtCuZLuiZVTcYBXuM+gX3qlwxHVrdoB1FyRpI0mT0Ii6JnrlILkNeS
         zciZfHGq6n2jgx1otgOpQQ9bn0W1BImhojqf5UllQYLGEXaWBeN4RjzKjX6urGukrF4+
         BWsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720076051; x=1720680851;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OaHuA4w4nVtdao/fLWo0eQBQ8CqjNDauvvbmii8lIbw=;
        b=fvV6s4ofogkoURxYuiwpuis2MqWcqkCAHR2onkMp+1Lj8/ruuuNCKM+zcgx1uurDSy
         1M6jlsmkpavuR0lFHL9PkD/2NH+emJKKSqhm4o9XDNHuY6vV6QGNvZtoKQLo7SwdpLzB
         7/pb+Cm6DL4SEYFHme3DZXrYHo8A92d0bn2kNgHv29QsRU/7zNu6kbmWwNxE0JaTPLaY
         2uNERsqyV3JHr3ajqx5fz6k5hNpxSyLg+U0v2scejCrtWzvC+Za4uNp2C3H1qARJ2w+K
         M5+qg0vBq3qxlg2k62gEh5aUqRQPXDiTffU1bvQzEovSKgSflLjTZJMkUG0RiuxFydi9
         PbUA==
X-Forwarded-Encrypted: i=1; AJvYcCWxDsC1p3FEpjt18xG8674hJvEaR1wweCa4Dq3buICzMeBVu/gUXEiMBZdRhhTdVq1pAutlCzBXCuM+FF2JkG7kelCLLzG9Uzg1J+tKkg==
X-Gm-Message-State: AOJu0YxTuoeppo5Fypulj6lyvs3VKxZJKr27HWGs1YaMvGGpqslwtMFR
	6u0Uozomqp711Npo4O9oC7uqVLvPZIT/XPQFlaMxPzEuBuy9I5qnTfhO5MKlS5c=
X-Google-Smtp-Source: AGHT+IFgHGJtYuDCHwF2hfQyaKB/hypmybNqgZV2mdKvHoDVjRkC1GVw1vaa0cTn5Yput+q/r8OwGA==
X-Received: by 2002:a05:6a20:2594:b0:1be:f080:6d27 with SMTP id adf61e73a8af0-1c0cc742219mr739965637.22.1720076050677;
        Wed, 03 Jul 2024 23:54:10 -0700 (PDT)
Received: from localhost ([122.172.82.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c99a989416sm711460a91.29.2024.07.03.23.54.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 23:54:10 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Cristian Marussi <cristian.marussi@arm.com>,
	"Gautham R. Shenoy" <gautham.shenoy@amd.com>,
	Hector Martin <marcan@marcan.st>,
	Huang Rui <ray.huang@amd.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kevin Hilman <khilman@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Markus Mayer <mmayer@broadcom.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Perry Yuan <perry.yuan@amd.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Sven Peter <sven@svenpeter.dev>,
	Thierry Reding <thierry.reding@gmail.com>,
	Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-tegra@vger.kernel.org,
	Lizhe <sensor1010@163.com>
Subject: [PATCH 0/4] cpufreq: Make cpufreq_driver->exit() return void
Date: Thu,  4 Jul 2024 12:23:51 +0530
Message-Id: <cover.1720075640.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make exit() return void, since it isn't used by the core.

Based on initial patches sent by Lizhe [1].

Rafael, I will take this through my tree for 6.11.

--
Viresh

[1] https://lore.kernel.org/all/20240410132132.3526-1-sensor1010@163.com/

Lizhe (1):
  cpufreq: Make cpufreq_driver->exit() return void

Viresh Kumar (3):
  cpufreq: nforce2: Remove empty exit() callback
  cpufreq: loongson2: Remove empty exit() callback
  cpufreq: pcc: Remove empty exit() callback

 drivers/cpufreq/acpi-cpufreq.c         |  4 +---
 drivers/cpufreq/amd-pstate.c           |  7 ++-----
 drivers/cpufreq/apple-soc-cpufreq.c    |  4 +---
 drivers/cpufreq/bmips-cpufreq.c        |  4 +---
 drivers/cpufreq/cppc_cpufreq.c         |  3 +--
 drivers/cpufreq/cpufreq-dt.c           |  3 +--
 drivers/cpufreq/cpufreq-nforce2.c      |  6 ------
 drivers/cpufreq/e_powersaver.c         |  3 +--
 drivers/cpufreq/intel_pstate.c         |  8 +++-----
 drivers/cpufreq/loongson2_cpufreq.c    |  6 ------
 drivers/cpufreq/mediatek-cpufreq-hw.c  |  4 +---
 drivers/cpufreq/mediatek-cpufreq.c     |  4 +---
 drivers/cpufreq/omap-cpufreq.c         |  3 +--
 drivers/cpufreq/pasemi-cpufreq.c       |  6 ++----
 drivers/cpufreq/pcc-cpufreq.c          |  6 ------
 drivers/cpufreq/powernow-k6.c          |  5 ++---
 drivers/cpufreq/powernow-k7.c          |  3 +--
 drivers/cpufreq/powernow-k8.c          |  6 ++----
 drivers/cpufreq/powernv-cpufreq.c      |  4 +---
 drivers/cpufreq/ppc_cbe_cpufreq.c      |  3 +--
 drivers/cpufreq/qcom-cpufreq-hw.c      |  4 +---
 drivers/cpufreq/qoriq-cpufreq.c        |  4 +---
 drivers/cpufreq/scmi-cpufreq.c         |  4 +---
 drivers/cpufreq/scpi-cpufreq.c         |  4 +---
 drivers/cpufreq/sh-cpufreq.c           |  4 +---
 drivers/cpufreq/sparc-us2e-cpufreq.c   |  3 +--
 drivers/cpufreq/sparc-us3-cpufreq.c    |  3 +--
 drivers/cpufreq/speedstep-centrino.c   | 10 +++-------
 drivers/cpufreq/tegra194-cpufreq.c     |  4 +---
 drivers/cpufreq/vexpress-spc-cpufreq.c |  5 ++---
 include/linux/cpufreq.h                |  2 +-
 31 files changed, 37 insertions(+), 102 deletions(-)

-- 
2.31.1.272.g89b43f80a514


