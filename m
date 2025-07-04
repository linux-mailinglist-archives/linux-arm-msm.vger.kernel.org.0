Return-Path: <linux-arm-msm+bounces-63659-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 257FAAF8CD2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 10:54:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 097ABB46A61
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 08:33:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0F1B2F4A05;
	Fri,  4 Jul 2025 07:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WlvGVtRc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB30E2F3C2F;
	Fri,  4 Jul 2025 07:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751615705; cv=none; b=hRpRc2a4JAHTvfbUnWOcYoILkApHIPuRYTCmYrpUpFm34+cpgZxzLx0XvgnkOpPjaarPBZx5y4b611qGnCFX2ON9guADF06J8bjr2B309wc9hz7qcx38P8ZQ+DV3alzpTCquNux3/f7xKQm/nX6srsiTvjirwd9EWqZALSuoFr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751615705; c=relaxed/simple;
	bh=YNMnECaaC9O1yfFx5WwdlJPEH2MfqWZfCpsrTn51CKI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mjviXU2Z1Mloi6wdp6cfqZvPMdSkQe01XfHZDj6rEqRW461pWUF+o47yym+spxkqN89DlHhObF2P5b6Tv6+CgF04GdypmoQvrPrNV0Uqob0q0Xpat0G+AOdrknxaaoogkZa2DtIO5Vp3qbH4hPP4BJQZdOCBAhXcAF6+IpbHB80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WlvGVtRc; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751615703; x=1783151703;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YNMnECaaC9O1yfFx5WwdlJPEH2MfqWZfCpsrTn51CKI=;
  b=WlvGVtRcuaWWond26QpsmMPqtU3w38XjnEnSyH5Cuv1oKD+u3MpVJnKf
   ywPCLdWo8xLVUXHvlVXrd4xz+I+SV028oppAPxDdyP41Ai3uezRMerKNs
   yD6xdI8q8djiwfKEjjIx9CIPKdMptGpuk29rbiKoepRtqMkH6nuWyGyUk
   nKCnLg/IvyewV6248/mMr/4KW86iG169LZNW1ADqfpE6TD4BFFtl7WKBf
   m9Sbs10OT4TjQY1xvo0AFKbmqo/C9aYnJkLsskPq9ooOyB0pXSKPnIkqr
   HIf7JrqKAyiN8y5W7TdfLBtBd+sm5qeyG6XXmBLfWIW/6ipfiPnU8XPbE
   Q==;
X-CSE-ConnectionGUID: OS/VumoMQ6uL2Jb9QDXN+w==
X-CSE-MsgGUID: WxYShqxnQ/ezFwBqP8EXNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="64194248"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="64194248"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:54:51 -0700
X-CSE-ConnectionGUID: 0vJgiFijSxmgZQhzkoyVzQ==
X-CSE-MsgGUID: 0ZxZ+7MORGGjYSXiYuYNVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="158616636"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO svinhufvud.fi.intel.com) ([10.245.244.244])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:54:48 -0700
Received: from svinhufvud.lan (localhost [IPv6:::1])
	by svinhufvud.fi.intel.com (Postfix) with ESMTP id 14F444445A;
	Fri,  4 Jul 2025 10:54:47 +0300 (EEST)
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Srinivas Kandagatla <srini@kernel.org>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 60/80] soundwire: Remove redundant pm_runtime_mark_last_busy() calls
Date: Fri,  4 Jul 2025 10:54:46 +0300
Message-Id: <20250704075446.3221618-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
pm_runtime_mark_last_busy().

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
The cover letter of the set can be found here
<URL:https://lore.kernel.org/linux-pm/20250704075225.3212486-1-sakari.ailus@linux.intel.com>.

In brief, this patch depends on PM runtime patches adding marking the last
busy timestamp in autosuspend related functions. The patches are here, on
rc2:

        git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git \
                pm-runtime-6.17-rc1

 drivers/soundwire/bus.c            | 1 -
 drivers/soundwire/cadence_master.c | 1 -
 drivers/soundwire/qcom.c           | 3 ---
 3 files changed, 5 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index 4fd5cac799c5..0d31bb2aff24 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -1833,7 +1833,6 @@ static int sdw_handle_slave_alerts(struct sdw_slave *slave)
 		dev_warn(&slave->dev, "Reached MAX_RETRY on alert read\n");
 
 io_err:
-	pm_runtime_mark_last_busy(&slave->dev);
 	pm_runtime_put_autosuspend(&slave->dev);
 
 	return ret;
diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
index 21bb491d026b..bdd538d09ee7 100644
--- a/drivers/soundwire/cadence_master.c
+++ b/drivers/soundwire/cadence_master.c
@@ -486,7 +486,6 @@ static int cdns_parity_error_injection(void *data, u64 value)
 	 * allow Master device to enter pm_runtime suspend. This may
 	 * also result in Slave devices suspending.
 	 */
-	pm_runtime_mark_last_busy(bus->dev);
 	pm_runtime_put_autosuspend(bus->dev);
 
 	return 0;
diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 3265c39e6b51..0ab7e2c7945f 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -657,7 +657,6 @@ static irqreturn_t qcom_swrm_wake_irq_handler(int irq, void *dev_id)
 			disable_irq_nosync(ctrl->wake_irq);
 	}
 
-	pm_runtime_mark_last_busy(ctrl->dev);
 	pm_runtime_put_autosuspend(ctrl->dev);
 
 	return IRQ_HANDLED;
@@ -1319,7 +1318,6 @@ static void qcom_swrm_shutdown(struct snd_pcm_substream *substream,
 	struct qcom_swrm_ctrl *ctrl = dev_get_drvdata(dai->dev);
 
 	swrm_wait_for_wr_fifo_done(ctrl);
-	pm_runtime_mark_last_busy(ctrl->dev);
 	pm_runtime_put_autosuspend(ctrl->dev);
 
 }
@@ -1502,7 +1500,6 @@ static int swrm_reg_show(struct seq_file *s_file, void *data)
 		ctrl->reg_read(ctrl, reg, &reg_val);
 		seq_printf(s_file, "0x%.3x: 0x%.2x\n", reg, reg_val);
 	}
-	pm_runtime_mark_last_busy(ctrl->dev);
 	pm_runtime_put_autosuspend(ctrl->dev);
 
 
-- 
2.39.5


