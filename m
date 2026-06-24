Return-Path: <linux-arm-msm+bounces-114277-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id m0v+HEVxO2qnXwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114277-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 07:55:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C28246BB9C2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 07:55:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114277-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114277-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6F5273015E24
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 05:52:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5CCB3264D4;
	Wed, 24 Jun 2026 05:52:41 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A212332570D;
	Wed, 24 Jun 2026 05:52:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782280361; cv=none; b=uf+16dQhVL9JHftTIpGzB23PlvDMOIXLpjQnrHxkW9TrSWwiYsDFPKQXIof9J7Z6I+tMQyW0HqG2O/X7AQVaiJLTS+fTrZalkfTnDdmbGJqF1HcQXsYHoeNxvgqyt8CGIr+n3JBfUcTqiVd3mHxQB7NDx4P5/zFRmjlAEso5qdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782280361; c=relaxed/simple;
	bh=aqCr87PbvOfUNX1U/miymM0D48YKzHJTuEOVMHkBJ9I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PBITMhYrI/ZxOXbyM75SWVu7gF0n5aVE7IWR4vkf8YhOil/+m4mcGFuDedOqingnu49V5eug71W3THhjnB734Z6HahM5dBQk7LnOys2h2lmjHSniczSYPvPp6nmT3/qwJYv2z6DsGZQFjkmM+2lvGj78w79iWDUxLW/5yk+px8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-03 (Coremail) with SMTP id rQCowAA3E5qlcDtqgBOtFQ--.13630S2;
	Wed, 24 Jun 2026 13:52:37 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: [PATCH] i2c: qup: Propagate clock enable failures
Date: Wed, 24 Jun 2026 13:52:37 +0800
Message-ID: <20260624055237.29977-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowAA3E5qlcDtqgBOtFQ--.13630S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Ar1fKrW3tF4UCFWxJw4ruFg_yoW8KFWrpa
	1UJr4Fkr48Xwn2gw4avr1UZr98K395Ka4xJrZrG3Z293Z8Z342yF48JFyY9a10vryDAa1a
	qFWvyFWfCF4jvFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkG14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	AVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14
	v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkG
	c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4U
	MIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JU6v38UUU
	UU=
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andi.shyti@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:pengpeng@iscas.ac.cn,s:lists@lfdr.de];
	DMARC_NA(0.00)[iscas.ac.cn];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[pengpeng@iscas.ac.cn,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-114277-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pengpeng@iscas.ac.cn,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C28246BB9C2

The QUP I2C driver treats the core and iface clocks as required
resources, but qup_i2c_enable_clocks() ignores clk_prepare_enable()
failures.  Probe can then continue to register the I2C adapter, and
runtime/system resume can return success, even when a required clock
transition failed.

Make the helper return an error, unwind a partially enabled clock, and
propagate failures from probe and resume paths.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/i2c/busses/i2c-qup.c | 31 ++++++++++++++++++++++++-------
 1 file changed, 24 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qup.c b/drivers/i2c/busses/i2c-qup.c
index a0e076fc5f36..ee7915ee2ba2 100644
--- a/drivers/i2c/busses/i2c-qup.c
+++ b/drivers/i2c/busses/i2c-qup.c
@@ -1657,10 +1657,21 @@ static const struct i2c_adapter_quirks qup_i2c_quirks_v2 = {
 	.flags = I2C_AQ_NO_ZERO_LEN,
 };
 
-static void qup_i2c_enable_clocks(struct qup_i2c_dev *qup)
+static int qup_i2c_enable_clocks(struct qup_i2c_dev *qup)
 {
-	clk_prepare_enable(qup->clk);
-	clk_prepare_enable(qup->pclk);
+	int ret;
+
+	ret = clk_prepare_enable(qup->clk);
+	if (ret)
+		return ret;
+
+	ret = clk_prepare_enable(qup->pclk);
+	if (ret) {
+		clk_disable_unprepare(qup->clk);
+		return ret;
+	}
+
+	return 0;
 }
 
 static void qup_i2c_disable_clocks(struct qup_i2c_dev *qup)
@@ -1823,7 +1834,9 @@ static int qup_i2c_probe(struct platform_device *pdev)
 			ret = PTR_ERR(qup->pclk);
 			goto fail_dma;
 		}
-		qup_i2c_enable_clocks(qup);
+		ret = qup_i2c_enable_clocks(qup);
+		if (ret)
+			goto fail_dma;
 		src_clk_freq = clk_get_rate(qup->clk);
 	}
 	qup->src_clk_freq = src_clk_freq;
@@ -1975,8 +1988,7 @@ static int qup_i2c_pm_resume_runtime(struct device *device)
 	struct qup_i2c_dev *qup = dev_get_drvdata(device);
 
 	dev_dbg(device, "pm_runtime: resuming...\n");
-	qup_i2c_enable_clocks(qup);
-	return 0;
+	return qup_i2c_enable_clocks(qup);
 }
 
 static int qup_i2c_suspend(struct device *device)
@@ -1988,7 +2000,12 @@ static int qup_i2c_suspend(struct device *device)
 
 static int qup_i2c_resume(struct device *device)
 {
-	qup_i2c_pm_resume_runtime(device);
+	int ret;
+
+	ret = qup_i2c_pm_resume_runtime(device);
+	if (ret)
+		return ret;
+
 	pm_request_autosuspend(device);
 	return 0;
 }
-- 
2.50.1 (Apple Git-155)


