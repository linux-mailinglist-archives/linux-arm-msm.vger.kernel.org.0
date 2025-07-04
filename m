Return-Path: <linux-arm-msm+bounces-63637-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D88C9AF8B20
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 10:21:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B94D91891BAA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 08:19:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 554FC28BAA5;
	Fri,  4 Jul 2025 07:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DxLkGt4x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A82F228B406;
	Fri,  4 Jul 2025 07:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751615649; cv=none; b=I+iD0n9RYsgzM5OQf0P4lTutKPER0AK1ZqyljdcDlyvA0Sx8+8cWogbRvSLY4gmi8VQf+VCHVDw7oG5BhS/GnaI3wGJwq2MxUvrb5+PaxUX4UqOWX/5b6G0h2DNpfsYiJ6ijKccN8xJXQKCJHLFrRAnY/l/cRgmiaGVUVweM6RE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751615649; c=relaxed/simple;
	bh=6S1jQLVft9CNNkuWvgYSkTmf3bOzKfne8ZMe8Vq6GU4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=E91qZpiSVpi6+PNSrUITiGWtBRANrVoKe08ChKjPrCJAZq/Z0QCUG3hZRAuamLyP9iucJbrcMgmnpRwx8XzSVGB27FgAwuZ1Ekna0WunZQ3DBnobzlzvQ5POcEpDJf4THDACrXHjVH2jo/m6/F68maXrwVcGwd2Nqt1nRZFqqdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DxLkGt4x; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751615647; x=1783151647;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6S1jQLVft9CNNkuWvgYSkTmf3bOzKfne8ZMe8Vq6GU4=;
  b=DxLkGt4xDZ67gIJfH+A6i7bbN8ldsLXcgIk0w9GT4j6LsE7cKRUoVBy4
   MzjmF/QV9OfEfoxtcR4WzAtHriuosJUBviT3arnIlm8uISuc0XnahjQS6
   1GJJa6n5EMDKj2sE06TLPffWqKhxFVWpz/2+BTKZiFRPVky2b0JuI6/dj
   gyu9sho+Q/MzGBG2wVjOV5x2kexnpcIu8I+gwjK9ScHw9ayz/ki0v+f/J
   RSvWqsfmB9jjVJwAsgHCSYA4DVV7xu4dsShEAtZNFDfSFhe063CA7e3Fb
   1FJTwEKjoBkA2X4V6J9+0P4uCzh9c+HHxOXlum7a2+BDQN5VJZ3I2LBCu
   Q==;
X-CSE-ConnectionGUID: pm0SEDXFR1ich7VCuCLXvw==
X-CSE-MsgGUID: UeBowQ7iQz2SZ7D2YmpufQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="76494468"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="76494468"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:54:07 -0700
X-CSE-ConnectionGUID: gL30M09ETGyW95y1mlrcIQ==
X-CSE-MsgGUID: aFS6pvBPQ+qMXhYXbC/72w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="158924176"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO svinhufvud.fi.intel.com) ([10.245.244.244])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:54:04 -0700
Received: from svinhufvud.lan (localhost [IPv6:::1])
	by svinhufvud.fi.intel.com (Postfix) with ESMTP id C608A44394;
	Fri,  4 Jul 2025 10:54:01 +0300 (EEST)
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 07/80] clk: qcom: Remove redundant pm_runtime_mark_last_busy() calls
Date: Fri,  4 Jul 2025 10:54:01 +0300
Message-Id: <20250704075401.3217179-1-sakari.ailus@linux.intel.com>
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

 drivers/clk/qcom/lpassaudiocc-sc7280.c | 2 --
 drivers/clk/qcom/lpasscorecc-sc7180.c  | 2 --
 2 files changed, 4 deletions(-)

diff --git a/drivers/clk/qcom/lpassaudiocc-sc7280.c b/drivers/clk/qcom/lpassaudiocc-sc7280.c
index 22169da08a51..3ff123bffa11 100644
--- a/drivers/clk/qcom/lpassaudiocc-sc7280.c
+++ b/drivers/clk/qcom/lpassaudiocc-sc7280.c
@@ -799,7 +799,6 @@ static int lpass_audio_cc_sc7280_probe(struct platform_device *pdev)
 		goto exit;
 	}
 
-	pm_runtime_mark_last_busy(&pdev->dev);
 exit:
 	pm_runtime_put_autosuspend(&pdev->dev);
 
@@ -868,7 +867,6 @@ static int lpass_aon_cc_sc7280_probe(struct platform_device *pdev)
 		goto exit;
 	}
 
-	pm_runtime_mark_last_busy(&pdev->dev);
 exit:
 	pm_runtime_put_autosuspend(&pdev->dev);
 
diff --git a/drivers/clk/qcom/lpasscorecc-sc7180.c b/drivers/clk/qcom/lpasscorecc-sc7180.c
index 605516d03993..5937b071533b 100644
--- a/drivers/clk/qcom/lpasscorecc-sc7180.c
+++ b/drivers/clk/qcom/lpasscorecc-sc7180.c
@@ -412,7 +412,6 @@ static int lpass_core_cc_sc7180_probe(struct platform_device *pdev)
 
 	ret = qcom_cc_really_probe(&pdev->dev, &lpass_core_cc_sc7180_desc, regmap);
 
-	pm_runtime_mark_last_busy(&pdev->dev);
 exit:
 	pm_runtime_put_autosuspend(&pdev->dev);
 
@@ -433,7 +432,6 @@ static int lpass_hm_core_probe(struct platform_device *pdev)
 
 	ret = qcom_cc_probe_by_index(pdev, 0, desc);
 
-	pm_runtime_mark_last_busy(&pdev->dev);
 	pm_runtime_put_autosuspend(&pdev->dev);
 
 	return ret;
-- 
2.39.5


