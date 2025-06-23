Return-Path: <linux-arm-msm+bounces-62065-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 887A0AE404E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 14:32:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2D98D1694DE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 12:28:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15A9A243369;
	Mon, 23 Jun 2025 12:28:22 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 148A124293F;
	Mon, 23 Jun 2025 12:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.30.148.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750681701; cv=none; b=T5V7VYAHLdGCnQWoMgB1SW5dAFYy2fUJHf/nsUa2pfZ29utJjv/nmlUJHTY78SBxanX2SsX6on75gGeGJPDSnkqdyg3JX1oM+0ZDIwHHdtgJ/gpbsEhXhB6woudef4xv+yD4XitJxWevbyCVJVUNtJ9dUJOh8sX6NjZGkyV74Ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750681701; c=relaxed/simple;
	bh=p6zkyi7mfGGhWfH9ZVP49rp2AGQ3CMoXQdfVucu5/RU=;
	h=Date:Message-ID:Mime-Version:From:To:Cc:Subject:Content-Type; b=nh8f/kHuhd/ZTykcSqVh9Yq6ImnvqkAgW3buyKxD7Hu/09B3rCyQ6L31cRsKJHDch2rNMWu93H/5fScnLlNyViO45BcTxUl0C27iTeP77R7wLjUJlnPtbxf72puBIBOmelBXpRqVZRO9lmze17n/tUIOCXtIIaRSylerGEnaCYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=160.30.148.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4bQnRg5GWnz5FHRw;
	Mon, 23 Jun 2025 20:28:15 +0800 (CST)
Received: from njy2app03.zte.com.cn ([10.40.13.14])
	by mse-fl1.zte.com.cn with SMTP id 55NCSAs6046267;
	Mon, 23 Jun 2025 20:28:10 +0800 (+08)
	(envelope-from long.yunjian@zte.com.cn)
Received: from mapi (njy2app02[null])
	by mapi (Zmail) with MAPI id mid201;
	Mon, 23 Jun 2025 20:28:14 +0800 (CST)
Date: Mon, 23 Jun 2025 20:28:14 +0800 (CST)
X-Zmail-TransId: 2afa6859485effffffffac9-64105
X-Mailer: Zmail v1.0
Message-ID: <20250623202814633ukJqUDLU7BRlLLhvWkbD7@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <long.yunjian@zte.com.cn>
To: <mani@kernel.org>
Cc: <fang.yumeng@zte.com.cn>, <mhi@lists.linux.dev>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <mou.yi@zte.com.cn>, <xu.lifeng1@zte.com.cn>,
        <ouyang.maochun@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIXSBidXM6IG1oaTogaG9zdDogVXNlIHN0cl90cnVlX2ZhbHNlKCkgaGVscGVy?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 55NCSAs6046267
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6859485F.000/4bQnRg5GWnz5FHRw

From: Yumeng Fang <fang.yumeng@zte.com.cn>

Remove hard-coded strings by using the str_true_false() helper.

Signed-off-by: Yumeng Fang <fang.yumeng@zte.com.cn>
---
 drivers/bus/mhi/host/debugfs.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/host/debugfs.c b/drivers/bus/mhi/host/debugfs.c
index cfec7811dfbb..39e45748a24c 100644
--- a/drivers/bus/mhi/host/debugfs.c
+++ b/drivers/bus/mhi/host/debugfs.c
@@ -10,6 +10,7 @@
 #include <linux/list.h>
 #include <linux/mhi.h>
 #include <linux/module.h>
+#include <linux/string_choices.h>
 #include "internal.h"

 static int mhi_debugfs_states_show(struct seq_file *m, void *d)
@@ -22,7 +23,7 @@ static int mhi_debugfs_states_show(struct seq_file *m, void *d)
 		   mhi_is_active(mhi_cntrl) ? "Active" : "Inactive",
 		   mhi_state_str(mhi_cntrl->dev_state),
 		   TO_MHI_EXEC_STR(mhi_cntrl->ee),
-		   mhi_cntrl->wake_set ? "true" : "false");
+		   str_true_false(mhi_cntrl->wake_set));

 	/* counters */
 	seq_printf(m, "M0: %u M2: %u M3: %u", mhi_cntrl->M0, mhi_cntrl->M2,
-- 
2.25.1

