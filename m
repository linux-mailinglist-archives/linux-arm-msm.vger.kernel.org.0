Return-Path: <linux-arm-msm+bounces-114080-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ahU/OcDnOWqrywcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114080-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 03:56:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE0A6B3710
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 03:56:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114080-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114080-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D4AE33069CBE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 01:55:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F21D366553;
	Tue, 23 Jun 2026 01:55:14 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8EE3859F0;
	Tue, 23 Jun 2026 01:55:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782179714; cv=none; b=qFtw7EOxEBv7tjkzhRAo08E25O/g5/FdMMMlk54vH+NVYN/ljrg0+7/9u00vE+P/TOrCOXADFsaes72wsbqJDeg2p9hk2NdCZYav7PglbzmQQB/QlpP9O33jvRD2jtfjPkt5AXE4p4dq5rjX5XMVW3xmmLX9wTG2YzNxY2Sukik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782179714; c=relaxed/simple;
	bh=So6VpnocWKa01shhB2coBKdlfZONjnFYpl3kH7bWht0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=d19k/zSaEzHrC/YH4lVOmksl/m16dj4dNNOqLh1RgjMOy33Qy+OfgCEM86x9URS1hn6K0icIKnwx8VKSKmZVuCOn/fXUVvoNKDOVJY64KBizFYqRYc7mIpgO28T5B9yNer3K5q+322UMREd25LCDVrDJ0BXK+VzKtBH0MEIm6G8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-05 (Coremail) with SMTP id zQCowABXrdB25zlqrsHCFA--.10245S2;
	Tue, 23 Jun 2026 09:55:03 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Lina Iyer <ilina@codeaurora.org>,
	Maulik Shah <quic_mkshah@quicinc.com>,
	Ulf Hansson <ulfh@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	pengpeng@iscas.ac.cn
Subject: [PATCH v2] soc: qcom: rpmh-rsc: manage PM notifiers with devres
Date: Tue, 23 Jun 2026 09:55:01 +0800
Message-ID: <20260623015501.31129-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowABXrdB25zlqrsHCFA--.10245S2
X-Coremail-Antispam: 1UD129KBjvJXoWxWFW8Gw1kuF4UKw4xXFykGrg_yoW5CryDpa
	y8Gan3Kr4jqr4Igw4Iyr45Za45K3yIy3yIqrZ7A34xZFn5tr1qka4rJa40qFn5JFykWFWr
	Jw4jq3yxua1UZF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkE14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26F
	4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
	7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
	1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AK
	xVWUAVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F4
	0E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFyl
	IxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxV
	AFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j
	6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUmjg
	xUUUUU=
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114080-lists,linux-arm-msm=lfdr.de];
	DMARC_NA(0.00)[iscas.ac.cn];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[pengpeng@iscas.ac.cn,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:ilina@codeaurora.org,m:quic_mkshah@quicinc.com,m:ulfh@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:pengpeng@iscas.ac.cn,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pengpeng@iscas.ac.cn,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iscas.ac.cn:email,iscas.ac.cn:mid,iscas.ac.cn:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6AE0A6B3710

rpmh_rsc_probe() registers CPU PM or genpd notifiers before populating
child devices. If child population fails, the CPU PM notifier path is not
unwound and the genpd path needs open-coded cleanup.

Use devm_pm_runtime_enable() for the genpd path and
devm_add_action_or_reset() for both notifier registrations. This makes
probe failure and driver detach use the same cleanup model while keeping
devm_of_platform_populate() responsible for child devices.

Fixes: 25092e6100ac ("soc: qcom: rpmh-rsc: Attach RSC to cluster PM domain")
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
Changes since v1: https://lore.kernel.org/all/20260616005618.9328-1-pengpeng@iscas.ac.cn/
- keep devm_of_platform_populate() and let devres handle child cleanup
- use devm_pm_runtime_enable() for the genpd path
- add devm_add_action_or_reset() cleanup for both genpd and CPU PM
  notifiers
- add a Fixes tag for the notifier registration change

 drivers/soc/qcom/rpmh-rsc.c | 37 ++++++++++++++++++++++++++-----------
 1 file changed, 26 insertions(+), 11 deletions(-)

diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
index c6f7d5c9c493..66928ca40b9a 100644
--- a/drivers/soc/qcom/rpmh-rsc.c
+++ b/drivers/soc/qcom/rpmh-rsc.c
@@ -944,17 +944,30 @@ static int rpmh_rsc_pd_callback(struct notifier_block *nfb,
 	return NOTIFY_OK;
 }
 
+static void rpmh_rsc_pd_detach(void *data)
+{
+	dev_pm_genpd_remove_notifier(data);
+}
+
 static int rpmh_rsc_pd_attach(struct rsc_drv *drv, struct device *dev)
 {
 	int ret;
 
-	pm_runtime_enable(dev);
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return ret;
+
 	drv->genpd_nb.notifier_call = rpmh_rsc_pd_callback;
 	ret = dev_pm_genpd_add_notifier(dev, &drv->genpd_nb);
 	if (ret)
-		pm_runtime_disable(dev);
+		return ret;
 
-	return ret;
+	return devm_add_action_or_reset(dev, rpmh_rsc_pd_detach, dev);
+}
+
+static void rpmh_rsc_cpu_pm_unregister(void *data)
+{
+	cpu_pm_unregister_notifier(data);
 }
 
 static int rpmh_probe_tcs_config(struct platform_device *pdev, struct rsc_drv *drv)
@@ -1107,7 +1120,15 @@ static int rpmh_rsc_probe(struct platform_device *pdev)
 				return ret;
 		} else {
 			drv->rsc_pm.notifier_call = rpmh_rsc_cpu_pm_callback;
-			cpu_pm_register_notifier(&drv->rsc_pm);
+			ret = cpu_pm_register_notifier(&drv->rsc_pm);
+			if (ret)
+				return ret;
+
+			ret = devm_add_action_or_reset(&pdev->dev,
+						       rpmh_rsc_cpu_pm_unregister,
+						       &drv->rsc_pm);
+			if (ret)
+				return ret;
 		}
 	}
 
@@ -1122,13 +1143,7 @@ static int rpmh_rsc_probe(struct platform_device *pdev)
 	dev_set_drvdata(&pdev->dev, drv);
 	drv->dev = &pdev->dev;
 
-	ret = devm_of_platform_populate(&pdev->dev);
-	if (ret && pdev->dev.pm_domain) {
-		dev_pm_genpd_remove_notifier(&pdev->dev);
-		pm_runtime_disable(&pdev->dev);
-	}
-
-	return ret;
+	return devm_of_platform_populate(&pdev->dev);
 }
 
 static const struct of_device_id rpmh_drv_match[] = {
-- 
2.50.1 (Apple Git-155)


