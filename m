Return-Path: <linux-arm-msm+bounces-95343-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cBjAG6VBqGn8rgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95343-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 15:28:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 100B920175E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 15:28:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B954F30C81E3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 14:20:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D44283A6EF1;
	Wed,  4 Mar 2026 14:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=adishatz.org header.i=@adishatz.org header.b="alkNn+ag"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from adishatz.org (ns314768.ip-37-187-26.eu [37.187.26.192])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB033A6EF9;
	Wed,  4 Mar 2026 14:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.187.26.192
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772633891; cv=none; b=p353vECnwTBdjUSRMvfQNHDsHfpSrlPHPikIWh9J2XnrD0Mu6AmdzmDsmoM/Z675inBVIRp7ZUz24I6j48ZUtYLvF1CLnU/bO/x/shtR2xZg4mrK+5qJ2kqEelKdEehH7RrgV6+Ng7AX/8vca8tWAKrBKddjMIWFyIwsQF2UHGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772633891; c=relaxed/simple;
	bh=6HBXokyc+vCWKhHp41UQSagjE6RZ5+wreWuFWTYT2Q4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=XslswK2DfAiZLTy5o5PZs2dAjfAlcuLWJqJx/pMIuEsv2A1HvPWVQ6pAydjJgug3IqSU9XeULYWL3ySuFaM119lhVvosbd0guXHJT8NNBede+Qtwm1UlcEfom8Qle3sgZS0C31qArWhcN3GBK/9nE0johK5HMzujOri/m149ejQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=adishatz.org; spf=pass smtp.mailfrom=adishatz.org; dkim=pass (2048-bit key) header.d=adishatz.org header.i=@adishatz.org header.b=alkNn+ag; arc=none smtp.client-ip=37.187.26.192
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=adishatz.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=adishatz.org
Received: from p-si-bellegarde.univ-nantes.prive (unknown [193.52.84.14])
	by adishatz.org (Postfix) with ESMTPSA id 38EE14C02DC;
	Wed, 04 Mar 2026 15:10:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=adishatz.org;
	s=mail; t=1772633415;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ICg5aJiATtX7CngsxObvwgFdqjF1bhqFv/Y2pXy8BNY=;
	b=alkNn+ag/VIyYv99YoJP1U7xluX9io/ZR5Pr2gidJZe9G3W1VMmqrXXStaQVWYq/7YzqqB
	6D7hO73W/njOuDq96FMS8Pu0u4kHxzLedwEE8blTE+tycXKMK/Ny6ALa0XimxiZlO+x4GC
	HCmXWM0ZVSGoX/9oCyooaqq/K23ceAusiY0+639BMcAh50rZCzYwhv/LpQOVz1J5aGL0av
	CkWk7E4Jpx/BjH+l6cpP9+Z1MsFJ9BOekbSc2ktZBt3xaXP3ttMK0hsCruzyLS8IKpEgDF
	J+Z7v/ALjq0ReCTJtePE76gifcGr6QAbVcMAVOdNz+FPaBtw/5olTpBB7FxpiA==
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=cedric.bellegarde smtp.mailfrom=cedric.bellegarde@adishatz.org
From: =?UTF-8?q?C=C3=A9dric=20Bellegarde?= <cedric.bellegarde@adishatz.org>
To: srini@kernel.org
Cc: lgirdwood@gmail.com,
	broonie@kernel.org,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cedric.bellegarde@adishatz.org
Subject: [PATCH] ASoC: codecs: wcd-clsh: Always update buck/flyback on transitions on transitions
Date: Wed,  4 Mar 2026 15:10:06 +0100
Message-ID: <20260304141006.280894-1-cedric.bellegarde@adishatz.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 100B920175E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[adishatz.org,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[adishatz.org:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,adishatz.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[adishatz.org:+];
	TAGGED_FROM(0.00)[bounces-95343-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cedric.bellegarde@adishatz.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

The WCD934x audio outputs (earpiece, headphone, speaker) share two power
supply converters, a buck and a flyback, managed by reference counters
(buck_users, flyback_users) in the Class-H controller.

The early return in wcd_clsh_ctrl_set_state() when nstate == ctrl->state
prevented _wcd_clsh_ctrl_set_state() from being called when switching
between outputs sharing the same state value. As a result, the buck and
flyback reference counters were never decremented on disable, leaving the
converters active and their counters out of sync with the actual hardware
state.

This caused audible distortion on the earpiece output and spurious MBHC
over-current protection interrupts on HPHL/HPHR during output switching.

Remove the early return so that CLSH_REQ_ENABLE and CLSH_REQ_DISABLE are
always dispatched, keeping the buck and flyback reference counters
consistent on every state transition.

Signed-off-by: Cédric Bellegarde <cedric.bellegarde@adishatz.org>
---
 sound/soc/codecs/wcd-clsh-v2.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/sound/soc/codecs/wcd-clsh-v2.c b/sound/soc/codecs/wcd-clsh-v2.c
index df3512ed167f..31fc91d79a8b 100644
--- a/sound/soc/codecs/wcd-clsh-v2.c
+++ b/sound/soc/codecs/wcd-clsh-v2.c
@@ -849,9 +849,6 @@ int wcd_clsh_ctrl_set_state(struct wcd_clsh_ctrl *ctrl,
 {
 	struct snd_soc_component *comp = ctrl->comp;
 
-	if (nstate == ctrl->state)
-		return 0;
-
 	if (!wcd_clsh_is_state_valid(nstate)) {
 		dev_err(comp->dev, "Class-H not a valid new state:\n");
 		return -EINVAL;
-- 
2.53.0


