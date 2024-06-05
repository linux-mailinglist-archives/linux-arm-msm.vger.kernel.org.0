Return-Path: <linux-arm-msm+bounces-21826-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0698FD9BA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 00:16:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BC5412855D8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 22:16:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D49A216A39C;
	Wed,  5 Jun 2024 22:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jscS64Wx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5607516B720;
	Wed,  5 Jun 2024 22:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717625709; cv=none; b=sbpahveuMQCOBne9gn9i5DcrjtBgnXfoZvVnMdaZviS/fOiL8uYadxcznorg4MUYMkdFgNSgjRWFXSD4yxwVRc8uDx1gRaJxzVIzf52TKt7DWe6FcVQWWD+nYRa4NdlIEM/aw+qnRCqA2/NAGNcN834qRFyNHzLt2giHTKrNyvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717625709; c=relaxed/simple;
	bh=sA6qI//FTL7pgyGldUMsd1jU+l556RY52OWXWgjHnto=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KzEYOODEkAhYqgRzJXVeob4aGgjpJIb7vNlxxLU/UeSyMVSHqBRyYKEf8Er5DjZXPKK4J7/XlLrw6rM/t5yTJGgvYjKHR2AhlYqaLG0XkSD549t5S6EldYfuVdtTeLL70N8fc2VynSCg8qtvJRiLtRC1MIdwVTjRHWvEwq4bCkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jscS64Wx; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717625708; x=1749161708;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sA6qI//FTL7pgyGldUMsd1jU+l556RY52OWXWgjHnto=;
  b=jscS64Wx/ocOynlgC/GE4sJBWqT14QNny/XV+8+2l8B3p7M1yTRWejXm
   JnWbIOsnDp+BKAuf0fs3bIaux3CUsjbkUDlAdN2d0f92MyrPEVakl8Sx1
   zDEHf6EIYrN3ZwzuP94Ne75LNvfMKfQYwAl+VSJgSox2rk+oqTap7RQGk
   U83Fq4LDX9rooYNr9faqEopO9zIVY98wDL5XUk+9oOpBcn53tpOBTQYN6
   gJHK3nk7D876OA1DRLXnv4HVe8D3SjZKZNqmgXd0ejhR7EqajT8AA1lZS
   s+jeu9tjuMy4t+uecTVRIw1K/xKdqtVYC399HGdzg1hIxu92iU2GJD97E
   g==;
X-CSE-ConnectionGUID: PeCTqWiWSmqd4scLHXRM1Q==
X-CSE-MsgGUID: scqshtsCSbOC2SQOj49NZA==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="24895533"
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; 
   d="scan'208";a="24895533"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2024 15:15:06 -0700
X-CSE-ConnectionGUID: CjAg4+gWRbypiKqJjeHDUQ==
X-CSE-MsgGUID: piyqwJk4TFeL6djtFhzbCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; 
   d="scan'208";a="38168626"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa006.jf.intel.com with ESMTP; 05 Jun 2024 15:14:57 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 00374801; Thu, 06 Jun 2024 01:14:47 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>,
	Rob Herring <robh@kernel.org>,
	Weidong Wang <wangweidong.a@awinic.com>,
	Mark Brown <broonie@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Alper Nebi Yasak <alpernebiyasak@gmail.com>,
	Chancel Liu <chancel.liu@nxp.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com,
	linux-arm-msm@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Heiko Stuebner <heiko@sntech.de>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v2 6/6] ASoC: samsung: Replace of_gpio.h by proper one
Date: Thu,  6 Jun 2024 00:27:29 +0300
Message-ID: <20240605221446.2624964-7-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20240605221446.2624964-1-andriy.shevchenko@linux.intel.com>
References: <20240605221446.2624964-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

of_gpio.h is deprecated and subject to remove.
The driver doesn't use it directly, replace it
with what is really being used.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 sound/soc/samsung/aries_wm8994.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/samsung/aries_wm8994.c b/sound/soc/samsung/aries_wm8994.c
index a548ac33dd94..01716df0c842 100644
--- a/sound/soc/samsung/aries_wm8994.c
+++ b/sound/soc/samsung/aries_wm8994.c
@@ -1,11 +1,11 @@
 // SPDX-License-Identifier: GPL-2.0+
 #include <linux/extcon.h>
+#include <linux/gpio/consumer.h>
 #include <linux/iio/consumer.h>
 #include <linux/input-event-codes.h>
 #include <linux/mfd/wm8994/registers.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_gpio.h>
 #include <linux/regulator/consumer.h>
 #include <sound/jack.h>
 #include <sound/pcm_params.h>
-- 
2.43.0.rc1.1336.g36b5255a03ac


