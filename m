Return-Path: <linux-arm-msm+bounces-114091-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gxnZM/ckOmpX2gcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114091-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 08:17:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F83A6B46A6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 08:17:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114091-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114091-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6BD2B301D4DF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 06:17:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27E5D3B47DE;
	Tue, 23 Jun 2026 06:17:13 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293FD3B3BF0;
	Tue, 23 Jun 2026 06:17:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782195432; cv=none; b=tSit/8wzFFffoCrh6IiqXVtkNQ3CWY2O1qWvWEAH9IbpeCMMiJWtBu7Ksl2t5h066hvwEosTneRntPhWSln93X0vvg0M1UL2mZSpbdgENphz3l330DHZGrgksvwPtSWbStdWPketzcWbofQ1JOz4B6RguQCuTz+vZu3DGb+tgu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782195432; c=relaxed/simple;
	bh=JdQ/ajGhfiigWd9Wx6X/EjAcsJEZhy7xX2sbsGJYqNA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bsu/aTzJDM58FmvAxq+PeDVRTGmfH1kE2DRgN1SXkCbUHvgiNFEKXaVyIan+fohCJXTGBILRMKiAKRN3ig2pK729MQQAlcPKEZKvcleXPS/ltSBP2gWdjZYE64zW9O3xh/luTif5kkcXlDE788HZ8ljTT5WXRTLPkt6nFE77xDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-05 (Coremail) with SMTP id zQCowAD3fADdJDpqTz3KFA--.53334S2;
	Tue, 23 Jun 2026 14:17:01 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Srinivas Kandagatla <srini@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: [RFC PATCH] soundwire: qcom: fail runtime resume on enumeration timeout
Date: Tue, 23 Jun 2026 14:16:59 +0800
Message-ID: <20260623061659.57903-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowAD3fADdJDpqTz3KFA--.53334S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kw15Kry5XrWUCw17Jw4ktFb_yoW8AFyrpa
	1DWrWvkrZ7XF9F9rs0yw4vvryF93y8tay7Gan293s7ur15tr1Dta4rKryUtFs5JrWkCr17
	XFWqqF48GF1YyFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkE14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_
	JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67
	AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIY
	rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14
	v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_
	Cr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUTnQ
	UUUUUU=
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114091-lists,linux-arm-msm=lfdr.de];
	DMARC_NA(0.00)[iscas.ac.cn];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[pengpeng@iscas.ac.cn,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:vkoul@kernel.org,m:yung-chuan.liao@linux.intel.com,m:pierre-louis.bossart@linux.dev,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:pengpeng@iscas.ac.cn,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,iscas.ac.cn:email,iscas.ac.cn:mid,iscas.ac.cn:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3F83A6B46A6

swrm_runtime_resume() reinitializes the controller and waits for
hardware enumeration when clock stop is not supported, but ignores
wait_for_completion_timeout(). It then reads and reports slave status
even if enumeration never completed.

Return -ETIMEDOUT when the enumeration wait expires and undo the hclk
and wake IRQ state changed earlier in the resume path before returning
the error.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/soundwire/qcom.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 3d8f5a81eff1..acac77a1093d 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -1704,6 +1704,7 @@ static void qcom_swrm_remove(struct platform_device *pdev)
 static int __maybe_unused swrm_runtime_resume(struct device *dev)
 {
 	struct qcom_swrm_ctrl *ctrl = dev_get_drvdata(dev);
+	unsigned long time_left;
 	int ret;
 
 	if (ctrl->wake_irq > 0) {
@@ -1725,8 +1726,15 @@ static int __maybe_unused swrm_runtime_resume(struct device *dev)
 			dev_err(ctrl->dev, "link failed to connect\n");
 
 		/* wait for hw enumeration to complete */
-		wait_for_completion_timeout(&ctrl->enumeration,
-					    msecs_to_jiffies(TIMEOUT_MS));
+		time_left = wait_for_completion_timeout(&ctrl->enumeration,
+							msecs_to_jiffies(TIMEOUT_MS));
+		if (!time_left) {
+			clk_disable_unprepare(ctrl->hclk);
+			if (ctrl->wake_irq > 0 &&
+			    irqd_irq_disabled(irq_get_irq_data(ctrl->wake_irq)))
+				enable_irq(ctrl->wake_irq);
+			return -ETIMEDOUT;
+		}
 		qcom_swrm_get_device_status(ctrl);
 		sdw_handle_slave_status(&ctrl->bus, ctrl->status);
 	} else {
-- 
2.50.1 (Apple Git-155)


