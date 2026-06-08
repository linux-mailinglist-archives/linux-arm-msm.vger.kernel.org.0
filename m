Return-Path: <linux-arm-msm+bounces-111897-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZwXHAULGJmp0kQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111897-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 15:40:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 86379656BAF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 15:40:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=cTbq3s+E;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111897-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111897-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 72F813017AE7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 13:40:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76FEB380FD7;
	Mon,  8 Jun 2026 13:40:03 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB2337F01A
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 13:40:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780926003; cv=none; b=uKapypTT2L/kBH8PZDeLnpl9iuUChBd6ZlGf2Muy6ZR4uyXJ/V8pVMYpVUgG344ZtKSgTWqLcpMoV8rWsJvDV6m6cCyM76zixZsdC8Dyk/N7Cel/kPc6+Y8pYqvk4VCYBuXiKPKzBM6vGdEj2AX295HHEoPkh6pef67mGygeZfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780926003; c=relaxed/simple;
	bh=vyC7w6pskJBgaLu4nRRhMfqupYy0eXGTyLVkdxR3pJI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VB9qoltQqruJLvTHipkL6kc5KO+Qv1jSDQ0XkEXUgN6zj7QzNWu3rFJHm3ou+kSOI9YquJXRmOWycOvtSNXRnNkRmS2p+uwWGRFvmttT7FBSfzOXs2A95sgbLBU/7jwgtzVj8lBe+gyciXW6N5B1kk2s0cdEWy1lJmxzqXaLtms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cTbq3s+E; arc=none smtp.client-ip=74.125.82.179
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-304ec41197bso3954367eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 06:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780926000; x=1781530800; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r+CdAGYIEklPCYPkGTaICLk240mHu6t2xegNP8dRyKY=;
        b=cTbq3s+E0EgjDUhBeyGay8XIgIKawmRsPEGPUMy17wZxMclXJi5iE7y68hUxDzebaY
         g1Q6VHnBnjG81OS30/HWK5FFcbEnDmtvfzLtUQzEuj03j9T4BfrkNPYdvrpJGSGQ/AIq
         sbXOfEbmxsRpSYq1Ihuq2RYivGD6VRyHTYNnyJsv7b/yQrGKZrfEuLmYy2Tt0M0ccW00
         fAR4lGrc7xz52nvRQmDV22Ng8RvUA4Zk99L1TTD4fpxkjW1Qjykd+FTPmjYym6yQBLig
         7BH35hkyYG2OQMFU8RYBbZJz7PlJCAcCRCyOamFEfxl9ls+S3mxzDaFNMdujSE9dj1fM
         /nGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780926000; x=1781530800;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=r+CdAGYIEklPCYPkGTaICLk240mHu6t2xegNP8dRyKY=;
        b=DMo8HqkgxfkWB3ciKH2N78QOAO6UC/b71l3gb2QY/db02IYe2sqSPC1t1ezmd/XlVT
         ckdbfmd/dRFphKA+klBFGI1yne+dtzEu1RxEymopxp6V89duIyrKSCu8nRNlMDczxPXv
         Cp7js/UhVcc5xGcrXtH3fMPNl/0e/PSPUJT0wvutFAtxmxBwPrE2QX3ML110kXkfOsc8
         6exYH0y5xwMGDBOyhfXwRo76zFXFZ2KA2yEwLvNJL+zR+HmUeKkGnb3sb81CXRZT6mVE
         cxkpthkEc/ZB9z9SxaAjxIT8cOKNOxQWk7T//lJPT10EXl6ckPOH1d88ppdAjUq5KFcb
         6M/w==
X-Forwarded-Encrypted: i=1; AFNElJ/PsospiEHtgcs/qkWExSHuiwn7pLa+7qAa8lu2olKXW4k/EhNwKXk9BjvBFBnCiSZVgnTdSolNWd+xh7wf@vger.kernel.org
X-Gm-Message-State: AOJu0YyAxAqNHkaNIuO3WSLP4Q3raTd0ebWUakm+cV5Q/jIlQUk2Sx6p
	Ku5KR2e6Vqgm3TYtxfcki0IgCjVUJB5Wf/t1DLacA8abA164vDV0NHmL
X-Gm-Gg: Acq92OHqVmKAZD4sJa36GgljZdXVgrml2Of4tN9kLL5/6NAmYBxfEibQLAM1olRvg7P
	Qcf3/PsvAwRda7DFYIiyOotZeRIS90VoOcYMlJBsDl7Ek5kMTUioZiQHgTalY1sS+rjz9lP8kCY
	1kmdd7mzSwLl67OPFlEmVLNCMbIlcjqdcfkRIiIPU8rdsE6lh7EDzMj6GnLnqM8P1iMeg15Nhx1
	H+wbFUXCxSP5Jjo8Nkb6V5M0oaDDEgJNjI9seVViM4EdeQr+ESuFMngBciW/LZeU2+IWt/N5Wpl
	hKpEiYVmsltlPLyHfsSxU0XHB3DzeKyUedZTPG+5j8l2ijg9bbtxWe7UGzAXj+xeRb2ijk+gy2X
	m9hESnTOQcUf/yPzVg3pB2Oq4fqTv+SmVw3raebwTMcuC/HZUjJcMan1q3hap0qFFebyRFHryux
	b8O6bDx9L8vBqAlF0jXe2Skoc70HbrgnBEIfneRKdIQQ2UUMnZShsEINpXqQTXqrvO5f10RTXdT
	VksbzjQPf6W
X-Received: by 2002:a05:693c:65d9:b0:307:91f5:8eee with SMTP id 5a478bee46e88-30791f5af59mr3853798eec.12.1780925999720;
        Mon, 08 Jun 2026 06:39:59 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-23.user3p.v-tal.net.br. [177.4.161.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074db560d7sm23893449eec.5.2026.06.08.06.39.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 06:39:59 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Mon, 08 Jun 2026 10:39:13 -0300
Subject: [PATCH 3/3] ASoC: bcm: cygnus: use scoped child node loop
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260608-asoc-of-node-scoped-cleanup-v1-3-9e3ac518dc2e@gmail.com>
References: <20260608-asoc-of-node-scoped-cleanup-v1-0-9e3ac518dc2e@gmail.com>
In-Reply-To: <20260608-asoc-of-node-scoped-cleanup-v1-0-9e3ac518dc2e@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>, 
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Herve Codina <herve.codina@bootlin.com>, 
 Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-arm-kernel@lists.infradead.org, notify@kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1564;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=vyC7w6pskJBgaLu4nRRhMfqupYy0eXGTyLVkdxR3pJI=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDFlqxyRKLkZwS7AE2Tf2p92fUXVnr8gKwS6tnBXNy1btW
 jiJT2laRykLgxgXg6yYIsvqpEWWe7oeXK2PW+EBM4eVCWQIAxenAEzkchYjw/9Qn6uF35RTdtpk
 X+d4MWXhlgeaC3X+Lbn4/qig9NQvKk4M/+tcorM3x6i7Oc46NWO+9mLXuXL6M27kyvu1n9gTu1u
 MnRUA
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-111897-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:broonie@kernel.org,m:tiwai@suse.com,m:lgirdwood@gmail.com,m:perex@perex.cz,m:herve.codina@bootlin.com,m:shengjiu.wang@gmail.com,m:Xiubo.Lee@gmail.com,m:festevam@gmail.com,m:nicoleotsuka@gmail.com,m:rjui@broadcom.com,m:sbranden@broadcom.com,m:bcm-kernel-feedback-list@broadcom.com,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-arm-kernel@lists.infradead.org,m:notify@kernel.org,m:cassiogabrielcontato@gmail.com,m:shengjiuwang@gmail.com,m:XiuboLee@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[cassiogabrielcontato@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[kernel.org,suse.com,gmail.com,perex.cz,bootlin.com,broadcom.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.ozlabs.org,lists.infradead.org,kernel.org,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cassiogabrielcontato@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 86379656BAF

cygnus_ssp_probe() manually puts the current child node before returning
from the child parsing loop on error.

Use for_each_available_child_of_node_scoped() so the current child node is
released automatically on early return and normal loop exit.

Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/soc/bcm/cygnus-ssp.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/soc/bcm/cygnus-ssp.c b/sound/soc/bcm/cygnus-ssp.c
index e0ce0232eb1e..47706ae0a31f 100644
--- a/sound/soc/bcm/cygnus-ssp.c
+++ b/sound/soc/bcm/cygnus-ssp.c
@@ -1298,7 +1298,6 @@ static int audio_clk_init(struct platform_device *pdev,
 static int cygnus_ssp_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct device_node *child_node;
 	struct cygnus_audio *cygaud;
 	int err;
 	int node_count;
@@ -1331,16 +1330,15 @@ static int cygnus_ssp_probe(struct platform_device *pdev)
 
 	active_port_count = 0;
 
-	for_each_available_child_of_node(pdev->dev.of_node, child_node) {
+	for_each_available_child_of_node_scoped(pdev->dev.of_node, child_node) {
 		err = parse_ssp_child_node(pdev, child_node, cygaud,
 					&cygnus_ssp_dai[active_port_count]);
 
 		/* negative is err, 0 is active and good, 1 is disabled */
-		if (err < 0) {
-			of_node_put(child_node);
+		if (err < 0)
 			return err;
-		}
-		else if (!err) {
+
+		if (!err) {
 			dev_dbg(dev, "Activating DAI: %s\n",
 				cygnus_ssp_dai[active_port_count].name);
 			active_port_count++;

-- 
2.54.0


