Return-Path: <linux-arm-msm+bounces-108305-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4C+jC8HNC2oaOQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108305-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 04:41:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 092D25767E2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 04:41:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2DA67301F1A6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 02:41:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A5B7320A04;
	Tue, 19 May 2026 02:41:01 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E8BC1ABEDE;
	Tue, 19 May 2026 02:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779158461; cv=none; b=B6SuZOoFG1OjmxGPbj/72a+Ryx0ByCK7TZQ9ANOlizqCt6y6WCp9JroP03/SBNE8TrHzcHOoofHPaNseDg+pkm5pH4u9sZR2YcHggNluAS++jATuxPqE/6sWFhJepzTb/wxpoYkLLKZ/qTNZKNK7MVqAcwe9modJrYuIgD9potA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779158461; c=relaxed/simple;
	bh=7JxvAl9CIXS8ZTik+QhYqNRRPBJeSplKp1j3iS3/bNw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WhU8nsdmZJkI85V/9WSQt1v5wcOSYGv3if76zLLPYkjx+mZ25DiWh2Kh3pGrmw2hEUOgLVDhy5DzkunlN3g2YXWJAhRtkH6sqNHrG7Gnxq4zIn7u/a5Ai9i4fJREodoA6Cseza+Obpa1Wvn4kHZNJX2AWO+9ciwyUftN/6hRYpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost (unknown [36.110.52.2])
	by APP-01 (Coremail) with SMTP id qwCowAAn0m22zQtqBD22EA--.6871S2;
	Tue, 19 May 2026 10:40:54 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: andersson@kernel.org,
	konradybcio@kernel.org
Cc: francisco.ruiz@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] soc: qcom: llcc-qcom: Fix error check for devm_memremap()
Date: Tue, 19 May 2026 10:38:41 +0800
Message-Id: <20260519023841.1995542-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowAAn0m22zQtqBD22EA--.6871S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZFyrtry8CrW7tF4xuFy8Krg_yoWDWFX_Kr
	sYyryxWry3Cr4Du3WkKr4akrWv9F40vwn2v3yaqw1fAry7Jw1xJFWDZrn0grW7ZF43GFyr
	AwsIvFWIv3WUAjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb48FF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26F4UJV
	W0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	AVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14
	v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkG
	c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4U
	MIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7VUjO6pDUUUU
	U==
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[iscas.ac.cn];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-108305-lists,linux-arm-msm=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[nichen@iscas.ac.cn,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	R_DKIM_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 092D25767E2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The devm_memremap() function returns an error pointer on failure, not
NULL. Fix the check to use IS_ERR() and return PTR_ERR() to correctly
handle allocation failures.

Fixes: ac23106a9b9a ("soc: qcom: llcc-qcom: get SCT descriptors from fw-populated memory")
Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 drivers/soc/qcom/llcc-qcom.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
index dcc08f63e020..2006bfe198ea 100644
--- a/drivers/soc/qcom/llcc-qcom.c
+++ b/drivers/soc/qcom/llcc-qcom.c
@@ -5231,9 +5231,9 @@ static int qcom_llcc_get_fw_config(struct platform_device *pdev)
 	}
 
 	slc_mem = devm_memremap(dev, res.start, resource_size(&res), MEMREMAP_WB);
-	if (!slc_mem) {
+	if (IS_ERR(slc_mem)) {
 		dev_err(dev, "Failed to memremap SLC shared memory\n");
-		return -ENOMEM;
+		return PTR_ERR(slc_mem);
 	}
 
 	ret = qcom_llcc_verify_fw_config(dev, slc_mem);
-- 
2.25.1


