Return-Path: <linux-arm-msm+bounces-116454-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gk9pGLmCSGp6rAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116454-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Jul 2026 05:49:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 771567068C5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Jul 2026 05:49:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116454-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116454-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 983F0300C0EB
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Jul 2026 03:49:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDA7B2475CF;
	Sat,  4 Jul 2026 03:49:09 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A1CE2C9D;
	Sat,  4 Jul 2026 03:49:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783136949; cv=none; b=NV+81Vbcv9gvSO8V6//EdYZuA/fPKj/9nx1g0MZOZaLKePQ6yI/hIhTEBNRDyDqY6JjS94wsJO46RFDlsYA22GdWSFQ8elQx7k4YHWyjTpDTLVEyL3p+6O4CYHdgRWRPxbIPcqWLsoOznlInxcBctDgmweHpN0J0gJgHCRMqJec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783136949; c=relaxed/simple;
	bh=0dGew7Jtl6WbGL4w60nkw8JO8H6seMfw8YBXMRpiNhY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HK/GEBkKMVLWGZdn8FDh6nL+nidzFNDb2Uwme6vULvHAQXhNwdWcTYNsZsMKub8FXx334ggusiMXA8MtORRXEndxja34ggzsymWspBd0F7HJNFCvxEo6q+Ua1dnPtLOYmXxE/uXA3qL1vxSF5YOxqMm+X+QvtKPMzUcOUpfV9no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-05 (Coremail) with SMTP id zQCowACX7hGfgkhqiOPIFg--.13187S2;
	Sat, 04 Jul 2026 11:48:47 +0800 (CST)
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
Subject: [PATCH 00/19] ASoC: codecs: propagate regcache_sync() failures
Date: Sat,  4 Jul 2026 11:48:45 +0800
Message-ID: <20260704034845.14291-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowACX7hGfgkhqiOPIFg--.13187S2
X-Coremail-Antispam: 1UD129KBjvJXoWxWryDKF4DZw13Xw1fKF13XFb_yoW5ZFy3pr
	Z3J395Xr18J3yfZrs3JryUJ3Z5JFy09a15Aw1xta4Skr45GF18Kw1UAw1UuF43Xr10gasr
	ursFgayDCr15tF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9214x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
	1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
	7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r
	1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02
	628vn2kIc2xKxwCY1x0262kKe7AKxVW8ZVWrXwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4
	IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1r
	MI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJV
	WUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j
	6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYx
	BIdaVFxhVjvjDU0xZFpf9x0pRx-BiUUUUU=
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
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
	TAGGED_FROM(0.00)[bounces-116454-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 771567068C5

Several ASoC codec resume and reattach paths replay cached register
state with regcache_sync() after power loss, reset, runtime resume, or
SoundWire reattach. These paths currently drop regcache_sync() failures
and can report success even when cached register state was not written
back to hardware.

Propagate regcache_sync() failures from the reviewed paths and restore
cache-only/dirty state or unwind resources before returning errors. Most
patches are local resume-path error propagation. Four patches also close
failure-path issues that were held during earlier review: rt1320-sdw
restores both regmaps, rt5682-sdw restores first-init cache state,
max98396 unwinds supplies acquired during resume, and max98090 is limited
to the runtime-resume path with the stronger paired suspend/resume proof.

This series is source-audited only. I did not test on the affected
hardware.

Pengpeng Hou (19):
  ASoC: codecs: lpass-rx-macro: Propagate regcache_sync() errors
  ASoC: codecs: lpass-tx-macro: Propagate regcache_sync() errors
  ASoC: codecs: lpass-wsa-macro: Propagate regcache_sync() errors
  ASoC: codecs: max98373: Propagate regcache_sync() errors
  ASoC: codecs: max98388: Propagate regcache_sync() errors
  ASoC: codecs: rt1318-sdw: Propagate regcache_sync() errors
  ASoC: codecs: rt9120: Propagate regcache_sync() errors
  ASoC: codecs: tas2552: Propagate regcache_sync() errors
  ASoC: codecs: tas2783-sdw: Propagate regcache_sync() errors
  ASoC: codecs: wcd938x-sdw: Propagate regcache_sync() errors
  ASoC: codecs: cs35l32: Propagate regcache_sync() errors
  ASoC: codecs: wm2200: Propagate regcache_sync() errors
  ASoC: codecs: wm5100: Propagate regcache_sync() errors
  ASoC: codecs: wm8962: Propagate regcache_sync() errors
  ASoC: codecs: cs4349: Propagate regcache_sync() errors
  ASoC: codecs: rt1320-sdw: Propagate regcache_sync() errors
  ASoC: codecs: rt5682-sdw: Propagate regcache_sync() errors
  ASoC: codecs: max98396: Unwind supplies on resume failure
  ASoC: codecs: max98090: Propagate runtime regcache_sync() errors

 sound/soc/codecs/cs35l32.c         | 10 +++++++++-
 sound/soc/codecs/cs4349.c          |  8 +++++++-
 sound/soc/codecs/lpass-rx-macro.c  | 31 +++++++++++++++++++++---------
 sound/soc/codecs/lpass-tx-macro.c  | 25 +++++++++++++++++-------
 sound/soc/codecs/lpass-wsa-macro.c | 28 ++++++++++++++++++++-------
 sound/soc/codecs/max98090.c        |  8 +++++++-
 sound/soc/codecs/max98373-i2c.c    |  9 ++++++++-
 sound/soc/codecs/max98388.c        |  8 +++++++-
 sound/soc/codecs/max98396.c        | 24 ++++++++++++++++++++---
 sound/soc/codecs/rt1318-sdw.c      |  7 ++++++-
 sound/soc/codecs/rt1320-sdw.c      | 17 ++++++++++++++--
 sound/soc/codecs/rt5682-sdw.c      | 20 +++++++++++++++++--
 sound/soc/codecs/rt9120.c          |  9 ++++++++-
 sound/soc/codecs/tas2552.c         | 10 +++++++++-
 sound/soc/codecs/tas2783-sdw.c     | 16 +++++++++++++--
 sound/soc/codecs/wcd938x-sdw.c     |  8 +++++++-
 sound/soc/codecs/wm2200.c          | 10 +++++++++-
 sound/soc/codecs/wm5100.c          | 10 +++++++++-
 sound/soc/codecs/wm8962.c          |  9 ++++++++-
 19 files changed, 223 insertions(+), 44 deletions(-)

-- 
2.43.0


