Return-Path: <linux-arm-msm+bounces-89524-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E29BD39114
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Jan 2026 22:10:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 699023010A98
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Jan 2026 21:10:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11E3D2D978A;
	Sat, 17 Jan 2026 21:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="qdPOGE2B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D3C2EA743
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Jan 2026 21:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768684226; cv=none; b=kVlKflDJQ8cXhUlYSs3zrkBfX2/2XVdge9//lIyxS7pIxWfigyL/8ZRCPQnR1iYQRICjEUDmANd6nuoQAPuZ9Ip6wFp/fKuJuORHTJTvj5jySiqHmScBvm4wjQOxuJkQcvw/YARixoYwdCmlxkdKOqbxoTxedm/VSqD9StM4Geo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768684226; c=relaxed/simple;
	bh=YpT/BPd8Y61sKHa2Mvbw6/FM1KBH+VQoatUnX2vBHR8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Jn45plnAdV2g+2137XUfdwoVdMjyfoRVtbixZZBs1W7YWySkZ/NlGsu2iwlVXzJrkdy7wLvkRPbdkw8DwyCXe9RUsznjbCR3TPiD8U7fXR92HFJJ8t3pF+rWsC9kMJq474OH066QfvbbcEADELRayGBpoV2q1wGuTZiAU2BIrGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=qdPOGE2B; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1768684211;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=nhdEGm3g/qNY/ixZE/izgcRF9w5r47dc5v3DpaxVaqE=;
	b=qdPOGE2BGBqky1mMypjk5UaclmBdoDju5KUGDZcWGBUU0cUFpdolnvqFAan2HAg1sKsdEz
	4wgbvlP1WIozCria+ZJSwrm5EnDheJOHavADjNixIHDBO6a5S+FcbNuCJQITr0xtzTkz6T
	QdmoOEFv0bG30+Yi3BX6MjI5tNRp1yQvnLkf76+3YpQOR7crHr5z9oB+qm1BQDxeOi7Rdp
	E3TQ/tVxCjyZlxKtrG6YD39pcQAbFQQM6li9ET7QsUUISJXv6n+qW92sZD2J48hDHKQq0h
	kRM9kPvHU3HTnmEsJs+V9KfwxVzE9ZSrZvh+2YmmjQl3WRPcJXYd0R8RAiV0bA==
From: Val Packett <val@packett.cool>
To: Sebastian Reichel <sre@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Val Packett <val@packett.cool>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] power: supply: qcom_battmgr: Recognize "LiP" as lithium-polymer
Date: Sat, 17 Jan 2026 18:09:24 -0300
Message-ID: <20260117210941.6219-1-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

On the Dell Latitude 7455, the firmware uses "LiP" with a lowercase 'i'
for the battery chemistry type, but only all-uppercase "LIP" was being
recognized. Add the CamelCase variant to the check to fix the "Unknown
battery technology" warning.

Fixes: 202ac22b8e2e ("power: supply: qcom_battmgr: Add lithium-polymer entry")
Signed-off-by: Val Packett <val@packett.cool>
---
 drivers/power/supply/qcom_battmgr.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/power/supply/qcom_battmgr.c b/drivers/power/supply/qcom_battmgr.c
index c8028606bba0..80e701c66434 100644
--- a/drivers/power/supply/qcom_battmgr.c
+++ b/drivers/power/supply/qcom_battmgr.c
@@ -1240,7 +1240,8 @@ static unsigned int qcom_battmgr_sc8280xp_parse_technology(const char *chemistry
 	if ((!strncmp(chemistry, "LIO", BATTMGR_CHEMISTRY_LEN)) ||
 	    (!strncmp(chemistry, "OOI", BATTMGR_CHEMISTRY_LEN)))
 		return POWER_SUPPLY_TECHNOLOGY_LION;
-	if (!strncmp(chemistry, "LIP", BATTMGR_CHEMISTRY_LEN))
+	if (!strncmp(chemistry, "LIP", BATTMGR_CHEMISTRY_LEN) ||
+	    (!strncmp(chemistry, "LiP", BATTMGR_CHEMISTRY_LEN)))
 		return POWER_SUPPLY_TECHNOLOGY_LIPO;
 
 	pr_err("Unknown battery technology '%s'\n", chemistry);
-- 
2.51.2


