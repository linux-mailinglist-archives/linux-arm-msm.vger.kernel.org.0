Return-Path: <linux-arm-msm+bounces-114718-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AJE5MEtIP2qiRAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114718-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jun 2026 05:49:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6166D106D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jun 2026 05:49:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114718-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114718-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B382A301BB83
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jun 2026 03:49:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C69C286417;
	Sat, 27 Jun 2026 03:49:27 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2B723AB87;
	Sat, 27 Jun 2026 03:49:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782532167; cv=none; b=S5AFSKDI9rSyfDgHNZ5LATnayn1Fv3jbiFC6wDg32WxU2vRzyJgmvE7zOv2np017iBViS9YdOxRkWLm+o8YeCU/BsgXhOuc5JGHhJsuUAXYCRxApT4zyZY92vljDJ6D7Zr9L6UNDRI80ucBqr5gOsmDIQRR86U3l7sZKNvGnQsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782532167; c=relaxed/simple;
	bh=WAXo3Bw2g5YvPIej6BhH2rh+CYBSLOWkzcv1lhCgeSE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OMuuFSIQBekvehQn8jDQJkXRO8TL2cGEV8+kEXAysapYsikBMh7/2lLNU3ZfwoOXsROh2KYACFvbaRWFLqCqn0cQbOcgGJ6PeqgCIASC9R3TU7o5vaW1WWfRmryU50BziYmvy5eJ136ALoE0U/fHCH54DHXyFGDQRxhaJcX9qc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Received: from localhost.localdomain (unknown [117.182.75.66])
	by APP-01 (Coremail) with SMTP id qwCowADnjNU8SD9qBZSBAw--.23128S2;
	Sat, 27 Jun 2026 11:49:18 +0800 (CST)
From: WenTao Liang <vulab@iscas.ac.cn>
To: srini@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	WenTao Liang <vulab@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH] fix: sound/soc/qcom: qcom_snd_parse_of: leaked device_node reference from of_parse_phandle on error path
Date: Sat, 27 Jun 2026 11:49:15 +0800
Message-Id: <20260627034915.59929-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowADnjNU8SD9qBZSBAw--.23128S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Gr1kWF1rWw43CFW3ury7Awb_yoWkXFb_tF
	ykuasYqrykGFs3twsxtr4a9wn3Ar9rua4jywsFqrsrt345XFW5tFn8XF4fZas8ZrW8t3Zx
	Wrn0vFWYkrWaqjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb3AFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
	Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVWxJr
	0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x
	0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2
	zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF
	4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWU
	CwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCT
	nIWIevJa73UjIFyTuYvjfU5dgADUUUU
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiDAQLA2o-EqFvJgAAsv
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[iscas.ac.cn];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-114718-lists,linux-arm-msm=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[vulab@iscas.ac.cn,linux-arm-msm@vger.kernel.org];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:vulab@iscas.ac.cn,m:stable@vger.kernel.org,s:lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vulab@iscas.ac.cn,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	R_DKIM_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iscas.ac.cn:email,iscas.ac.cn:mid,iscas.ac.cn:from_mime,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4D6166D106D

In qcom_snd_parse_of(), of_parse_phandle() at line 124 acquires a
reference on the platform's sound-dai node, stored in
link->platforms->of_node. When codec initialization fails (goto err), the
err label releases cpu, codec, and platform from of_get_child_by_name(),
but does not release link->platforms->of_node from of_parse_phandle(),
causing a device_node reference leak.

Add of_node_put(link->platforms->of_node) in the err label.

Cc: stable@vger.kernel.org
Fixes: c25e295cd77b ("ASoC: qcom: Add support to parse common audio device nodes")
Signed-off-by: WenTao Liang <vulab@iscas.ac.cn>
---
 sound/soc/qcom/common.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
index cf1f3a767cee..8f7498290f81 100644
--- a/sound/soc/qcom/common.c
+++ b/sound/soc/qcom/common.c
@@ -180,6 +180,7 @@ int qcom_snd_parse_of(struct snd_soc_card *card)
 
 	return 0;
 err:
+	of_node_put(link->platforms->of_node);
 	of_node_put(cpu);
 	of_node_put(codec);
 	of_node_put(platform);
-- 
2.39.5 (Apple Git-154)


