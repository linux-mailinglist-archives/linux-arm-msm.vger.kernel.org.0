Return-Path: <linux-arm-msm+bounces-85903-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F37CD0423
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 15:29:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7E9B230A8089
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 14:27:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFD9532AAAD;
	Fri, 19 Dec 2025 14:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mqlIa2hR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D4DC329E66;
	Fri, 19 Dec 2025 14:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766154477; cv=none; b=gtehTMcA2lj0504GMzhi0q+B0VxCk10cllSgSUpc+pueDJDcFhqpvp/G1g7fzPLPPzvWJzSI9N+Scba7V/16g/3MWfqwBKFdDHK7xxrWYenWh7SLBVnnWh+SlYl252KFoTqnwRiX7hJISytctuwlUgd1a3VYGOupGqVvIIQBDDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766154477; c=relaxed/simple;
	bh=FN2zfuLAXWM1lYAhAsms4o1qNUWJ9mz1PleMCxFH1zk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dDoP5OIgFGOmFORtX8Cg1Epc+7N+0IGzX141S552H5pPlt+jrYEnyzHaz3DGbMG8sJ8OSjVsjaXUIeqesTbPHWYoitYA1v5a6pa42D/CeI1KbS2qJW/1ktrFQHQPsWVE+ouo96mTual3v4mF0IePHLqwoP6Y+WWBDMto/Z/jPn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mqlIa2hR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4105BC4CEF1;
	Fri, 19 Dec 2025 14:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766154477;
	bh=FN2zfuLAXWM1lYAhAsms4o1qNUWJ9mz1PleMCxFH1zk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mqlIa2hRLIPKtPXOMlvu+LPCJ6DghClGnwxfQO0gYKl3Kbb7kS6ATvKE+LgHH1ddQ
	 U2lq3q43Sci0fqDslQ2CXezDw6ksU4G+PYYjpUt+gOMh3IkTZVHQu6VWRo+foSBZrm
	 iGuPTcTthHJ+rA0NsR9uChWEwVlnZ/c3Rzev1wmVpgbrI1sHkm/Rzuxy0lZU+1LzgG
	 GJdKdIVpk6U9hQvWAOeAQLGZRVdQjZHSdwJs3Bhya+Pg1ftBHzr4Pkcou3ZX3WJsns
	 lBwTHNgu53CXFxV4+ruzjCUr5QqYPCM+MfdbSDJAa8xhAKVd6BV+g8ccBjg2EBJiP7
	 byXQ1NnpyDmfQ==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vWbSW-0000000051c-2E0u;
	Fri, 19 Dec 2025 15:27:56 +0100
From: Johan Hovold <johan@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>,
	Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: [PATCH 3/3] ASoC: soc_sdw_utils: drop bogus container_of() error handling
Date: Fri, 19 Dec 2025 15:27:15 +0100
Message-ID: <20251219142715.19254-4-johan@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251219142715.19254-1-johan@kernel.org>
References: <20251219142715.19254-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The dev_to_sdw_dev() helper uses container_of() to return the containing
soundwire device structure of its pointer argument and will never return
NULL.

Fixes: 4f8ef33dd44a ("ASoC: soc_sdw_utils: skip the endpoint that doesn't present")
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 sound/soc/sdw_utils/soc_sdw_utils.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/sound/soc/sdw_utils/soc_sdw_utils.c b/sound/soc/sdw_utils/soc_sdw_utils.c
index 6c656b2f7f3a..f62e291c089f 100644
--- a/sound/soc/sdw_utils/soc_sdw_utils.c
+++ b/sound/soc/sdw_utils/soc_sdw_utils.c
@@ -1414,10 +1414,6 @@ static int is_sdca_endpoint_present(struct device *dev,
 	}
 
 	slave = dev_to_sdw_dev(sdw_dev);
-	if (!slave) {
-		ret = -EINVAL;
-		goto put_device;
-	}
 
 	/* Make sure BIOS provides SDCA properties */
 	if (!slave->sdca_data.interface_revision) {
-- 
2.51.2


