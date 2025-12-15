Return-Path: <linux-arm-msm+bounces-85197-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id CB477CBCDA6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 08:52:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3A2E9300CE36
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 07:52:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F21230E82B;
	Mon, 15 Dec 2025 07:52:51 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C427B2192FA;
	Mon, 15 Dec 2025 07:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765785171; cv=none; b=Z/R++wGjFAaDc+10RQ/QJTd2BO+KGs+VD4qv3fIgRBHfYHbqyqQwAFYQilB1N1lYW/oNhQFhl+FOeQNJZvsMND8Ea9mvlH5pSenGlNHmRWLjbtXLxfYj2WzPPKGWZMj+qO0fYS/INjZz0kra6nt6vb0YF5wzz6ISv5JyzpyzH04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765785171; c=relaxed/simple;
	bh=lVYiYUKW4bYGRAzGh3/63pvq1N5r8mcxBcuctb+6hMg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fk2kVYiVpCsm9FpxC84AIUCqjNjrGjorexGxWj/eaMsDdcZx/BMeAqSaEC0J4wFEbWa02nyQTkZ2xv7lW5mXobrkfa5l7gZaBmvGsXwbfKhSwlRHYerHRjihMJ+3K51yPp2iJviX+s46KrkZ1C3wCkXIK1rls8mxn6+mMMCUvRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from DESKTOP-L0HPE2S (unknown [124.16.141.245])
	by APP-01 (Coremail) with SMTP id qwCowABnD2tIvj9pWaa4AA--.27858S2;
	Mon, 15 Dec 2025 15:52:41 +0800 (CST)
From: Haotian Zhang <vulab@iscas.ac.cn>
To: andersson@kernel.org,
	konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haotian Zhang <vulab@iscas.ac.cn>
Subject: [PATCH] soc: qcom: cmd-db: Fix memory leak in cmd_db_dev_probe error path
Date: Mon, 15 Dec 2025 15:41:25 +0800
Message-ID: <20251215074125.2089-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1.windows.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowABnD2tIvj9pWaa4AA--.27858S2
X-Coremail-Antispam: 1UD129KBjvdXoW7GryDXFyfKFyDuFW8Kr47XFb_yoWfKrgEva
	1jvr93XrsrCF9rAry2gr43ur4S9a4q9w1Duw1SqF9Iyr15CwnIqFWDuFs5uF45Ww4UAF98
	Gw1qvryIyr17CjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbcAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s
	1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0
	cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8Jw
	ACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_JF0_
	Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxV
	WUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI
	7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r
	1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI
	42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU8miiUUUUU
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiDAcRA2k-u9EJDAAAsg

If cmd_db_magic_matches() fails after memremap() succeeds, the function
returns -EINVAL without unmapping the memory region, causing a
potential resource leak.

Add memunmap() call and set cmd_db_header to NULL before returning error
to properly clean up the mapped memory region.

Fixes: 312416d9171a ("drivers: qcom: add command DB driver")
Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
---
 drivers/soc/qcom/cmd-db.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soc/qcom/cmd-db.c b/drivers/soc/qcom/cmd-db.c
index ae66c2623d25..50adf5249826 100644
--- a/drivers/soc/qcom/cmd-db.c
+++ b/drivers/soc/qcom/cmd-db.c
@@ -358,6 +358,8 @@ static int cmd_db_dev_probe(struct platform_device *pdev)
 
 	if (!cmd_db_magic_matches(cmd_db_header)) {
 		dev_err(&pdev->dev, "Invalid Command DB Magic\n");
+		memunmap(cmd_db_header);
+		cmd_db_header = NULL;
 		return -EINVAL;
 	}
 
-- 
2.50.1.windows.1


