Return-Path: <linux-arm-msm+bounces-98094-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wF8KIYoSuWmFowEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98094-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 09:36:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8462A5BF8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 09:36:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8FA433008D3B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 08:36:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A08EE38F620;
	Tue, 17 Mar 2026 08:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b="gtFT0+6b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-m1973196.qiye.163.com (mail-m1973196.qiye.163.com [220.197.31.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF88630ACF0;
	Tue, 17 Mar 2026 08:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.96
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773736583; cv=none; b=t3wJMoyw8ny55dSHUR2dSrQveHQdxnOo5PAcH+CX53U0E0suRsy1yEm+SelPKgAq/riG48vPK+KP5BRhwY6pEHKn0cLYhpV3Ry7gG9+1DCxJf7j9NZzDyo8QT9LL2656zdSSBO7E3cYuqYNEbf9nYwHgi56v5iM42mNvqEl9EZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773736583; c=relaxed/simple;
	bh=3WhNxKXKIK+jL31bp/APuAywSvRCK9e4YyOkDA/hN2A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Kt1plu+bImnkj4w0RJZN0T06BJ7Lho6JZYOsnRaya0x4bpBcBk0himydYfZi/e8l70GPEmviTL+lk5R7am19po4TA6bTOkThfX4AtLm/mghA7mpkejHn6bnyImOnYO42rvEYvIoSX9w1rP6TLVLJVmxp8pPhsoYgUYX/trGbsc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com; spf=pass smtp.mailfrom=thundersoft.com; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=gtFT0+6b; arc=none smtp.client-ip=220.197.31.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thundersoft.com
Received: from [127.0.1.1] (unknown [36.129.139.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 373e3b48a;
	Tue, 17 Mar 2026 16:36:14 +0800 (GMT+08:00)
From: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Date: Tue, 17 Mar 2026 16:35:41 +0800
Subject: [PATCH v2 2/6] ASoC: es8316: Get sysclk rate from MCLK clock when
 not explicitly set
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-rubikpi-next-20260304-v2-2-5634fabe0c43@thundersoft.com>
References: <20260317-rubikpi-next-20260304-v2-0-5634fabe0c43@thundersoft.com>
In-Reply-To: <20260317-rubikpi-next-20260304-v2-0-5634fabe0c43@thundersoft.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Daniel Drake <drake@endlessm.com>, 
 Katsuhiro Suzuki <katsuhiro@katsuster.net>, 
 Matteo Martelli <matteomartelli3@gmail.com>, 
 Binbin Zhou <zhoubinbin@loongson.cn>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Srinivas Kandagatla <srini@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Roger Shimizu <rosh@debian.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Hongyang Zhao <hongyang.zhao@thundersoft.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773736570; l=905;
 i=hongyang.zhao@thundersoft.com; s=20260127; h=from:subject:message-id;
 bh=3WhNxKXKIK+jL31bp/APuAywSvRCK9e4YyOkDA/hN2A=;
 b=BoPy63R+aaxm+07RZl6U+d+Ys5JoaDn9lwHVFtlRBNwQhnuXQaZW8JbYPTcjM6QQeoXVEGfKy
 J7THW20AbPoAMbAvCMugsnPJkxHyrfdY6ISxFJqv2cvDu2PyPn0iUYv
X-Developer-Key: i=hongyang.zhao@thundersoft.com; a=ed25519;
 pk=D9yL5W9Zj0lPBDAq9gzY++1849VlXuTWAkROzZ88J/4=
X-HM-Tid: 0a9cfaf03f4b09d5kunm8391965e39c995
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZHRoaVhgdHhpPHU1IHx5JTVYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlITVVKSUJVSkhCVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09IVUpLS1
	VKQktLWQY+
DKIM-Signature: a=rsa-sha256;
	b=gtFT0+6bfFhsiGMetfuzK5fQXOkEcyMdynm4eS5izWH3bJ1sJsywScfFVAdLfI54gv90Yn1hlysQuMigMCHI/zYbOmcY8pYWOPbG3JpoxQiLE87gSzF8pudaCTFqVBPKPfmuK0CCl8vw0a6QTKKKbKhav8F6u3V4h836pzczmQ8=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=7o3HthpByf2f1sOcDO5CRZwMDKyB5mdUkD56e5BdYmo=;
	h=date:mime-version:subject:message-id:from;
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[thundersoft.com,none];
	R_DKIM_ALLOW(-0.20)[thundersoft.com:s=default];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98094-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,endlessm.com,katsuster.net,loongson.cn,perex.cz,suse.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hongyang.zhao@thundersoft.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[thundersoft.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DA8462A5BF8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When the sysclk has not been set via set_sysclk(), try to get the clock
rate from the MCLK clock provider. This is useful when the codec's MCLK
is managed by an external clock controller and the machine driver does
not explicitly call set_sysclk().

Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
---
 sound/soc/codecs/es8316.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/codecs/es8316.c b/sound/soc/codecs/es8316.c
index 9245c33700de..3889cb36a654 100644
--- a/sound/soc/codecs/es8316.c
+++ b/sound/soc/codecs/es8316.c
@@ -774,6 +774,9 @@ static int es8316_probe(struct snd_soc_component *component)
 		return ret;
 	}
 
+	if (es8316->mclk)
+		es8316->sysclk = clk_get_rate(es8316->mclk);
+
 	/* Reset codec and enable current state machine */
 	snd_soc_component_write(component, ES8316_RESET, 0x3f);
 	usleep_range(5000, 5500);

-- 
2.43.0


