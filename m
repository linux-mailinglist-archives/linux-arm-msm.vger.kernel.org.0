Return-Path: <linux-arm-msm+bounces-63658-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F58AF8BDE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 10:35:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D44231894535
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 08:34:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41EAC2F3635;
	Fri,  4 Jul 2025 07:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g425f3NY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E2BF2F19BB;
	Fri,  4 Jul 2025 07:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751615701; cv=none; b=ENPo1VKlZtKDGnmsw1COBpcUwFYYjzEumFm6ulvdUadHOJvl7HUU0AJT+2DMg4331lWKjJlnUM0fqhL7Cb32gwBRsUyPMQ40n3rhsQdfoMEQhyEURrXjG//QvGexFj2+7ScFBx95PjAS8cOb/7m9MGERrgKTL/FI3SblHInt8Zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751615701; c=relaxed/simple;
	bh=CD/eY4E5aftpOmkmkmfmacRDuiFp5Va8bVZ1es2dJX8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=L8AYlLdD8TvP+0N5qtAZnwPTa09Cy6UtCA4JGng2+d29B9CNTzyRYJ7Pt9oitvyv5DCYa+++F5UrUW9mAd09j1WIAPHqla5mL9PYg8fVfRiMJY3NC+qkymT+tqkuMZYnA+gCfVW/kAylYcgB4B2o0FL7M2H9a6d92lIpgcE04Gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g425f3NY; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751615699; x=1783151699;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CD/eY4E5aftpOmkmkmfmacRDuiFp5Va8bVZ1es2dJX8=;
  b=g425f3NY/I9nlhPezZAYC5Kqr1wSnto+YMyTg4KRmBsSFHzF4eI6hQ8+
   4mZmll21NB6KpJqMo3tTzkUremB4A6NXCyWkcj4I44pzrq+t1N0FE+Yxh
   5ZD28esGkc+muNw2QRpTMRAKRzlIo4xB/+AxUAG7XY87wtvpUr0wyLUY+
   X3JUlEfmxnZGDm7/uqfOKdEeSluQ9YpGxu6CR05lJwgmRZL/0IM90WI1P
   08CqRr2o9n91h8QMctgUPwaY1FfK203dRaqfOrONPiAmX+QmT5l1svocV
   5TXIYuUYEWLPmjnHDGsqHWf+KdIMVsYB1jMFxD0JfDaG3LR1g7lpqSVxR
   Q==;
X-CSE-ConnectionGUID: c24hsJkPTkajhvFpjScvAw==
X-CSE-MsgGUID: Icc5SMMJQMOqTxyyN0NZdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="64194245"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="64194245"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:54:50 -0700
X-CSE-ConnectionGUID: 2OeTsEVeSxeGNOpmXS1ImQ==
X-CSE-MsgGUID: Mz3xh9kTRweGeBXlGPGjBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="158616635"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO svinhufvud.fi.intel.com) ([10.245.244.244])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:54:48 -0700
Received: from svinhufvud.lan (localhost [IPv6:::1])
	by svinhufvud.fi.intel.com (Postfix) with ESMTP id 492AC44394;
	Fri,  4 Jul 2025 10:54:46 +0300 (EEST)
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 59/80] slimbus: Remove redundant pm_runtime_mark_last_busy() calls
Date: Fri,  4 Jul 2025 10:54:46 +0300
Message-Id: <20250704075446.3221540-1-sakari.ailus@linux.intel.com>
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

 drivers/slimbus/core.c      | 1 -
 drivers/slimbus/messaging.c | 2 --
 drivers/slimbus/qcom-ctrl.c | 1 -
 3 files changed, 4 deletions(-)

diff --git a/drivers/slimbus/core.c b/drivers/slimbus/core.c
index 005fa2ef100f..31751ee4e400 100644
--- a/drivers/slimbus/core.c
+++ b/drivers/slimbus/core.c
@@ -504,7 +504,6 @@ int slim_device_report_present(struct slim_controller *ctrl,
 	ret = slim_device_alloc_laddr(sbdev, true);
 
 slimbus_not_active:
-	pm_runtime_mark_last_busy(ctrl->dev);
 	pm_runtime_put_autosuspend(ctrl->dev);
 	return ret;
 }
diff --git a/drivers/slimbus/messaging.c b/drivers/slimbus/messaging.c
index 6f01d944f9c6..44197493010e 100644
--- a/drivers/slimbus/messaging.c
+++ b/drivers/slimbus/messaging.c
@@ -47,7 +47,6 @@ void slim_msg_response(struct slim_controller *ctrl, u8 *reply, u8 tid, u8 len)
 		complete(txn->comp);
 
 	/* Remove runtime-pm vote now that response was received for TID txn */
-	pm_runtime_mark_last_busy(ctrl->dev);
 	pm_runtime_put_autosuspend(ctrl->dev);
 }
 EXPORT_SYMBOL_GPL(slim_msg_response);
@@ -171,7 +170,6 @@ int slim_do_transfer(struct slim_controller *ctrl, struct slim_msg_txn *txn)
 		 * remove runtime-pm vote if this was TX only, or
 		 * if there was error during this transaction
 		 */
-		pm_runtime_mark_last_busy(ctrl->dev);
 		pm_runtime_put_autosuspend(ctrl->dev);
 	}
 	return ret;
diff --git a/drivers/slimbus/qcom-ctrl.c b/drivers/slimbus/qcom-ctrl.c
index ab344f7472f2..880cf3081a20 100644
--- a/drivers/slimbus/qcom-ctrl.c
+++ b/drivers/slimbus/qcom-ctrl.c
@@ -695,7 +695,6 @@ static int qcom_slim_resume(struct device *dev)
 		dev_dbg(dev, "system resume");
 		ret = qcom_slim_runtime_resume(dev);
 		if (!ret) {
-			pm_runtime_mark_last_busy(dev);
 			pm_request_autosuspend(dev);
 		}
 		return ret;
-- 
2.39.5


