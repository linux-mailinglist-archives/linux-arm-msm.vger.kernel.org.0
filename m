Return-Path: <linux-arm-msm+bounces-116467-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Vw9NFMWFSGoJrQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116467-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Jul 2026 06:02:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE85706961
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Jul 2026 06:02:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116467-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116467-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1682F302D5DC
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Jul 2026 04:02:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAD7C380FDA;
	Sat,  4 Jul 2026 04:02:05 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2703B3815D0;
	Sat,  4 Jul 2026 04:01:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783137722; cv=none; b=FC9asU0excDyMB/srm2JvHvleJvtm3Oa4aR0u3VE9d7VdM/vXvWRG7mmx3Lq6eA8QW2DfkoGUmitfgpdY52ig7Z5WRG+wsnxhNXXYLJqatZHOEmJPcshw7DZEkEjxlIEMFrI1Yri0sSngofeSniVcwZGgt39Rb1VQLTTYzubkp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783137722; c=relaxed/simple;
	bh=i+BuepAJ98KWy93QPcQAijVTc6Jaca62oA2sDtcx1vY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oxPDByLA07k9TGW56vHGLryt98un6btzGErFfUshqcaggqXrL9r1vIcpvUWFCrRDlOMml7lF9aed/SY5XpajQLcDnUy2Qgs5GVlr2oJfRr8+4I7mH2H0/XzYtD2tvI4k0N3vZK9ShdHaexPO9BjiiVsGgTFZL9Is8xdpY2OWceU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-05 (Coremail) with SMTP id zQCowAD3bfGdhUhqtEPJFg--.13107S2;
	Sat, 04 Jul 2026 12:01:34 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Oder Chiou <oder_chiou@realtek.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	patches@opensource.cirrus.com,
	Bartosz Golaszewski <brgl@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Sharique Mohammad <sharq0406@gmail.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: [PATCH 13/19] ASoC: codecs: wm5100: Propagate regcache_sync() errors
Date: Sat,  4 Jul 2026 12:01:32 +0800
Message-ID: <20260704040132.8278-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260704034845.14291-1-pengpeng@iscas.ac.cn>
References: <20260704034845.14291-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowAD3bfGdhUhqtEPJFg--.13107S2
X-Coremail-Antispam: 1UD129KBjvdXoWruFy8AF48uw47uFWkKF4xXrb_yoWkWFg_Wa
	4xur4UWr4YgF47C3y7J3Way3ykX3W8CFyjqr4qgw47A34UtFn0yFWUtFnxuw1rXw1kCFya
	gF1j9F1rCr90kjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb-8FF20E14v26ryj6rWUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
	6F4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F
	4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
	7VC0I7IYx2IY67AKxVWUtVWrXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r
	1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02
	628vn2kIc2xKxwCY1x0262kKe7AKxVW8ZVWrXwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4
	IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1r
	MI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW8JV
	W5JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJwCI42IY6xAIw20EY4v20xvaj40_
	Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr
	1UYxBIdaVFxhVjvjDU0xZFpf9x0pRc6p9UUUUU=
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[iscas.ac.cn];
	FORGED_RECIPIENTS(0.00)[m:lgirdwood@gmail.com,m:broonie@kernel.org,m:srini@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:oder_chiou@realtek.com,m:shenghao-ding@ti.com,m:kevin-lu@ti.com,m:baojun.xu@ti.com,m:david.rhodes@cirrus.com,m:rf@opensource.cirrus.com,m:patches@opensource.cirrus.com,m:brgl@kernel.org,m:kuninori.morimoto.gx@renesas.com,m:ckeepax@opensource.cirrus.com,m:sebastian.krzyszkowiak@puri.sm,m:shengjiu.wang@nxp.com,m:sharq0406@gmail.com,m:pengpeng@iscas.ac.cn,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_SENDER(0.00)[pengpeng@iscas.ac.cn,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-116467-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pengpeng@iscas.ac.cn,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,perex.cz,suse.com,vger.kernel.org,realtek.com,ti.com,cirrus.com,opensource.cirrus.com,renesas.com,puri.sm,nxp.com,gmail.com,iscas.ac.cn];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	R_DKIM_NA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,iscas.ac.cn:from_mime,iscas.ac.cn:email,iscas.ac.cn:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ACE85706961

regcache_sync() can fail while replaying cached register state during
runtime resume. wm5100_runtime_resume() currently ignores that failure.

Propagate the error, restore cache-only/dirty state, and unwind the LDO
and core supplies acquired by runtime resume.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 sound/soc/codecs/wm5100.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm5100.c b/sound/soc/codecs/wm5100.c
index bd94fa53c362..2fe937a93026 100644
--- a/sound/soc/codecs/wm5100.c
+++ b/sound/soc/codecs/wm5100.c
@@ -2659,7 +2659,15 @@ static int wm5100_runtime_resume(struct device *dev)
 	}
 
 	regcache_cache_only(wm5100->regmap, false);
-	regcache_sync(wm5100->regmap);
+	ret = regcache_sync(wm5100->regmap);
+	if (ret) {
+		regcache_cache_only(wm5100->regmap, true);
+		regcache_mark_dirty(wm5100->regmap);
+		gpiod_set_value_cansleep(wm5100->ldo_ena, 0);
+		regulator_bulk_disable(ARRAY_SIZE(wm5100->core_supplies),
+				       wm5100->core_supplies);
+		return ret;
+	}
 
 	return 0;
 }
-- 
2.43.0


