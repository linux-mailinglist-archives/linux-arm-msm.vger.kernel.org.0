Return-Path: <linux-arm-msm+bounces-116457-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id B4FcIG6DSGqsrAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116457-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Jul 2026 05:52:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE257068FA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Jul 2026 05:52:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116457-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116457-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7C8133028C56
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Jul 2026 03:52:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 006A037F8A0;
	Sat,  4 Jul 2026 03:52:10 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60AA937DAD0;
	Sat,  4 Jul 2026 03:51:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783137126; cv=none; b=GY3lRmR62evdaBY8BX3VBq69DywCEQD2PoeqLbXNicw8HunNPEG1v9eCHewqLxViI8Kc8QhlZkNGVxn2WGj95c3DJe7OFefKu1KUNDWXkVvCXHYBzCtTt/Hgxl9EtILKHLtskEnlJI9iLtnylkrqtUHXQ4rWUX3k4YnP7M+qsFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783137126; c=relaxed/simple;
	bh=iNMPCafBO7qSFsEwCS44qcZ//6iMn6ClCuBl/1Q5jgk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fKzdbYdO68lxUnH2s/xNYbqdSS/Z5mPkDRIB7BeU7mky2N/zgyQ6YE/i8obkvClcuqKwNg8GJ6G1z8Sw1GyIWgO7aMgXCKNm0dkN0FfMhZFe3ho7PrZhYceN2x8jrbPf1V6gkpdVE38rYNhJbNf9/sVjdRNwwEvqTELJEiceSKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-05 (Coremail) with SMTP id zQCowABn8QRDg0hqQPjIFg--.39199S2;
	Sat, 04 Jul 2026 11:51:32 +0800 (CST)
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
Subject: [PATCH 03/19] ASoC: codecs: lpass-wsa-macro: Propagate regcache_sync() errors
Date: Sat,  4 Jul 2026 11:51:30 +0800
Message-ID: <20260704035130.34411-1-pengpeng@iscas.ac.cn>
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
X-CM-TRANSID:zQCowABn8QRDg0hqQPjIFg--.39199S2
X-Coremail-Antispam: 1UD129KBjvJXoWxZry3Jw45CF47ZF4xZry3XFb_yoW5uF13pF
	1fWFW0kFZ7Wa48CrWayr4UtF1ft397ta45Xwn7K3s29w4Dtr1IvFy8JF40vFyvqr1kG3Zr
	Cr4jv3W5C3WUJF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9S14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxV
	WxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
	Yx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbV
	WUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7Cj
	xVA2Y2ka0xkIwI1lc7CjxVAaw2AFwI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4I
	kC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWU
	WwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr
	0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_
	Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr
	1UYxBIdaVFxhVjvjDU0xZFpf9x0pR-189UUUUU=
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
	TAGGED_FROM(0.00)[bounces-116457-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,iscas.ac.cn:from_mime,iscas.ac.cn:email,iscas.ac.cn:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EDE257068FA

regcache_sync() can fail while replaying cached register state. The WSA
macro MCLK helper and runtime resume path currently ignore that failure
and report success.

Propagate the error from the MCLK helper users and from runtime resume.
If runtime resume fails after enabling clocks, restore cache-only/dirty
state and unwind the clocks acquired by the resume path.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 sound/soc/codecs/lpass-wsa-macro.c | 28 +++++++++++++++++++++-------
 1 file changed, 21 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index 5ad0448af649..59786316b49a 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -1408,14 +1408,17 @@ static struct snd_soc_dai_driver wsa_macro_dai[] = {
 	},
 };
 
-static void wsa_macro_mclk_enable(struct wsa_macro *wsa, bool mclk_enable)
+static int wsa_macro_mclk_enable(struct wsa_macro *wsa, bool mclk_enable)
 {
 	struct regmap *regmap = wsa->regmap;
+	int ret;
 
 	if (mclk_enable) {
 		if (wsa->wsa_mclk_users == 0) {
 			regcache_mark_dirty(regmap);
-			regcache_sync(regmap);
+			ret = regcache_sync(regmap);
+			if (ret)
+				return ret;
 			/* 9.6MHz MCLK, set value 0x00 if other frequency */
 			regmap_update_bits(regmap, CDC_WSA_TOP_FREQ_MCLK, 0x01, 0x01);
 			regmap_update_bits(regmap,
@@ -1432,7 +1435,7 @@ static void wsa_macro_mclk_enable(struct wsa_macro *wsa, bool mclk_enable)
 		if (wsa->wsa_mclk_users <= 0) {
 			dev_err(wsa->dev, "clock already disabled\n");
 			wsa->wsa_mclk_users = 0;
-			return;
+			return 0;
 		}
 		wsa->wsa_mclk_users--;
 		if (wsa->wsa_mclk_users == 0) {
@@ -1446,6 +1449,8 @@ static void wsa_macro_mclk_enable(struct wsa_macro *wsa, bool mclk_enable)
 					   CDC_WSA_MCLK_DISABLE);
 		}
 	}
+
+	return 0;
 }
 
 static void wsa_macro_enable_disable_vi_sense(struct snd_soc_component *component, bool enable,
@@ -1515,8 +1520,7 @@ static int wsa_macro_mclk_event(struct snd_soc_dapm_widget *w,
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
 	struct wsa_macro *wsa = snd_soc_component_get_drvdata(component);
 
-	wsa_macro_mclk_enable(wsa, event == SND_SOC_DAPM_PRE_PMU);
-	return 0;
+	return wsa_macro_mclk_enable(wsa, event == SND_SOC_DAPM_PRE_PMU);
 }
 
 static int wsa_macro_enable_vi_feedback(struct snd_soc_dapm_widget *w,
@@ -2538,7 +2542,11 @@ static int wsa_swrm_clock(struct wsa_macro *wsa, bool enable)
 			dev_err(wsa->dev, "failed to enable mclk\n");
 			return ret;
 		}
-		wsa_macro_mclk_enable(wsa, true);
+		ret = wsa_macro_mclk_enable(wsa, true);
+		if (ret) {
+			clk_disable_unprepare(wsa->mclk);
+			return ret;
+		}
 
 		regmap_update_bits(regmap, CDC_WSA_CLK_RST_CTRL_SWR_CONTROL,
 				   CDC_WSA_SWR_CLK_EN_MASK,
@@ -2887,9 +2895,15 @@ static int wsa_macro_runtime_resume(struct device *dev)
 	}
 
 	regcache_cache_only(wsa->regmap, false);
-	regcache_sync(wsa->regmap);
+	ret = regcache_sync(wsa->regmap);
+	if (ret)
+		goto err_sync;
 
 	return 0;
+err_sync:
+	regcache_cache_only(wsa->regmap, true);
+	regcache_mark_dirty(wsa->regmap);
+	clk_disable_unprepare(wsa->fsgen);
 err_fsgen:
 	clk_disable_unprepare(wsa->npl);
 err_npl:
-- 
2.43.0


