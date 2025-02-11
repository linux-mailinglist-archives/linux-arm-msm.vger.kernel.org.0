Return-Path: <linux-arm-msm+bounces-47533-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 719E5A3070F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 10:29:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2E8263A6958
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 09:29:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4607D1F1506;
	Tue, 11 Feb 2025 09:29:01 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 525C01F152D;
	Tue, 11 Feb 2025 09:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739266141; cv=none; b=UxJm6uX9VWr40BVRdZYX/brQABnYjS2IfhLcLm3qRNQc4cRBm6ZCMdV8YujNBSzXfUUSLN0Nn7Y13KXU4PqXhpW9Tp5cRejX+lR/4ArFofN+iusu7kSCoubFoeScImpOGODcEZiTIP40qZHPXSNZElXTQH6tCYYn6z4e3t1RIdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739266141; c=relaxed/simple;
	bh=xo45PM8TrHahZlxbt5sqgf+4HRRVOvr/8qDmixd+8qk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=exyknZQBz0DVhdTDXxpBmqJknAe9wDBiIbkdbY9pAhHI2j/31BFhhKqMA0mt02pJTon7Xu/QN4EWjBQoeEBQjShpbaA3btBa73JUoFG2yLSq/7vuJf9flVH/CgRXGdhTXx3rfbJ4MReiujW8yv06P+Zdzc1MWEyS/3PbcvASHAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [124.16.141.245])
	by APP-05 (Coremail) with SMTP id zQCowADHzCh7FqtnRPQrDA--.4577S2;
	Tue, 11 Feb 2025 17:21:04 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: andersson@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wentao Liang <vulab@iscas.ac.cn>
Subject: [PATCH] clk: qcom: Fix missing error check for dev_pm_domain_attach()
Date: Tue, 11 Feb 2025 17:20:17 +0800
Message-ID: <20250211092017.562-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.42.0.windows.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowADHzCh7FqtnRPQrDA--.4577S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Ary5WFyDAr4rtr4xuryUKFg_yoW8JFy8pa
	93GFykCrZ5GFyxJF4xWF48uFyFka4jkFyUGryvq34qvwn5XFZ8tr4rAa429F4rGryFyw13
	ArnIqFy8ua1DCF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvq14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	AVWUtwCY02Avz4vE14v_GFWl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
	1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
	14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
	IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
	87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0x
	ZFpf9x0JU3b1nUUUUU=
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBwsKA2eq7ySM2AAAsX

In the current implementation, the return value of dev_pm_domain_attach()
is not checked. This can lead to silent failures if the function fails,
as the code would continue execution and return 0, ignoring the error.

This patch adds a check for the return value of dev_pm_domain_attach().
If the function fails, an error message is logged using dev_err_probe(),
and the error is propagated to the existing error handling path `err`,
which ensures proper cleanup by calling clk_notifier_unregister().

Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/clk/qcom/apcs-sdx55.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/apcs-sdx55.c b/drivers/clk/qcom/apcs-sdx55.c
index 76ece6c4a969..3ba01622d8f0 100644
--- a/drivers/clk/qcom/apcs-sdx55.c
+++ b/drivers/clk/qcom/apcs-sdx55.c
@@ -111,7 +111,11 @@ static int qcom_apcs_sdx55_clk_probe(struct platform_device *pdev)
 	 * driver, there seems to be no better place to do this. So do it here!
 	 */
 	cpu_dev = get_cpu_device(0);
-	dev_pm_domain_attach(cpu_dev, true);
+	ret = dev_pm_domain_attach(cpu_dev, true);
+	if (ret) {
+		dev_err_probe(dev, ret, "can't get PM domain: %d\n", ret);
+		goto err;
+	}
 
 	return 0;
 
-- 
2.42.0.windows.2


