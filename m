Return-Path: <linux-arm-msm+bounces-114079-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JGfVGVHnOWqWywcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114079-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 03:54:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 001946B36C4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 03:54:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114079-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114079-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4CD2A30254BB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 01:54:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FEC137B01F;
	Tue, 23 Jun 2026 01:54:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32BC822256F;
	Tue, 23 Jun 2026 01:54:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782179663; cv=none; b=UgCyFI011wmHjn8bdYzBk3VZz3qKTRp4fzTcTkfzPaSVPw2EUgyYU7tH9IO1c7c3CE69iTbzH6whU46s3y8R+XE9hGsa305pjjMnYAykY1+xMQCX3wB1xbXGn7xpgpS4L3UDo3+CpAGRE+h11auFtJAo0RvrgnmVgzTA8Rirx+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782179663; c=relaxed/simple;
	bh=m6YPJlRxHuKnHHkUS+VKIl1Z3pvniuHoEEzrAvQfFtU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sPNEgHk9gt7dd2gMD0cnqnwr/o+/Wx+KsYgc4wYcJeH5xq7sLIJPkhAAlKcXUfA8xhH21orMl2rv4Mp+R33xICwT8zlVPp2OzuVIZG4iwPQZrNZiH0sPUNPZTFjJLY7dapFaFBEaIhZCsE1JzS4LspymMkmzL0SoU/zQ2pQZZuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-05 (Coremail) with SMTP id zQCowABHntFJ5zlqe7vCFA--.2614S2;
	Tue, 23 Jun 2026 09:54:17 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	pengpeng@iscas.ac.cn
Subject: [PATCH v2] bus: qcom-ebi2: use managed resources for clocks and children
Date: Tue, 23 Jun 2026 09:54:15 +0800
Message-ID: <20260623015415.26975-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowABHntFJ5zlqe7vCFA--.2614S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJw1DAw4rur1xArWUXF43ZFb_yoW5Ww4Dpr
	s3GFWfC3409ay09397tw17AF15Ja1xtay8KrWfWw1vvas8AryktF1IgFyFqFyF9FykZw15
	XrW5J3WDAFWUWFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkE14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26F
	4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
	7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
	1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AK
	xVWUAVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F4
	0E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1l
	IxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxV
	AFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j
	6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUDpn
	QUUUUU=
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	DMARC_NA(0.00)[iscas.ac.cn];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-114079-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[pengpeng@iscas.ac.cn,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:linusw@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:pengpeng@iscas.ac.cn,s:lists@lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pengpeng@iscas.ac.cn,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,iscas.ac.cn:email,iscas.ac.cn:mid,iscas.ac.cn:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 001946B36C4

qcom_ebi2_probe() enables the EBI2 clocks manually and populates child
devices manually. Several later failure paths can then return without
disabling the clocks or without relying on the driver core to undo child
population.

Use devm_clk_get_enabled() for both clocks and
devm_of_platform_populate() for children. This lets the driver core
unwind the resources automatically and removes the hand-written error
labels.

Fixes: 335a12754808 ("bus: qcom: add EBI2 driver")
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
Changes since v1: https://lore.kernel.org/all/20260616151703.23572-1-pengpeng@iscas.ac.cn/
- use devm_clk_get_enabled() for both clocks
- use devm_of_platform_populate() for child devices
- remove the manual clock unwind labels

 drivers/bus/qcom-ebi2.c | 43 +++++++++--------------------------------
 1 file changed, 9 insertions(+), 34 deletions(-)

diff --git a/drivers/bus/qcom-ebi2.c b/drivers/bus/qcom-ebi2.c
index be8166565e7c..f1f16a661cba 100644
--- a/drivers/bus/qcom-ebi2.c
+++ b/drivers/bus/qcom-ebi2.c
@@ -302,41 +302,23 @@ static int qcom_ebi2_probe(struct platform_device *pdev)
 	u32 val;
 	int ret;
 
-	ebi2xclk = devm_clk_get(dev, "ebi2x");
+	ebi2xclk = devm_clk_get_enabled(dev, "ebi2x");
 	if (IS_ERR(ebi2xclk))
 		return PTR_ERR(ebi2xclk);
 
-	ret = clk_prepare_enable(ebi2xclk);
-	if (ret) {
-		dev_err(dev, "could not enable EBI2X clk (%d)\n", ret);
-		return ret;
-	}
-
-	ebi2clk = devm_clk_get(dev, "ebi2");
-	if (IS_ERR(ebi2clk)) {
-		ret = PTR_ERR(ebi2clk);
-		goto err_disable_2x_clk;
-	}
-
-	ret = clk_prepare_enable(ebi2clk);
-	if (ret) {
-		dev_err(dev, "could not enable EBI2 clk\n");
-		goto err_disable_2x_clk;
-	}
+	ebi2clk = devm_clk_get_enabled(dev, "ebi2");
+	if (IS_ERR(ebi2clk))
+		return PTR_ERR(ebi2clk);
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	ebi2_base = devm_ioremap_resource(dev, res);
-	if (IS_ERR(ebi2_base)) {
-		ret = PTR_ERR(ebi2_base);
-		goto err_disable_clk;
-	}
+	if (IS_ERR(ebi2_base))
+		return PTR_ERR(ebi2_base);
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
 	ebi2_xmem = devm_ioremap_resource(dev, res);
-	if (IS_ERR(ebi2_xmem)) {
-		ret = PTR_ERR(ebi2_xmem);
-		goto err_disable_clk;
-	}
+	if (IS_ERR(ebi2_xmem))
+		return PTR_ERR(ebi2_xmem);
 
 	/* Allegedly this turns the power save mode off */
 	writel(0UL, ebi2_xmem + EBI2_XMEM_CFG);
@@ -373,15 +355,8 @@ static int qcom_ebi2_probe(struct platform_device *pdev)
 	}
 
 	if (have_children)
-		return of_platform_default_populate(np, NULL, dev);
+		return devm_of_platform_populate(dev);
 	return 0;
-
-err_disable_clk:
-	clk_disable_unprepare(ebi2clk);
-err_disable_2x_clk:
-	clk_disable_unprepare(ebi2xclk);
-
-	return ret;
 }
 
 static const struct of_device_id qcom_ebi2_of_match[] = {
-- 
2.50.1 (Apple Git-155)


