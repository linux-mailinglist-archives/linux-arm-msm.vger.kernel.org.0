Return-Path: <linux-arm-msm+bounces-116504-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nNfFBQvSSWru7QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116504-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 05:39:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 647A4708E43
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 05:39:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116504-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116504-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 375DB3034E1D
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Jul 2026 03:38:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39CE42BE026;
	Sun,  5 Jul 2026 03:38:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from MTA-07-3.privateemail.com (mta-07-3.privateemail.com [198.54.118.214])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D47EE27057D;
	Sun,  5 Jul 2026 03:38:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783222729; cv=none; b=Zg6zD7L29xiEiNQ2AfnucQPAqnREhPvDKF89La0Put0IdbIfaHBEmbmQZnF9IfEhgIo4VCmPKq7m+K4amolv2y/zMVGvp16Ht4i83KyZt/9oWVKSAREHQQGXhq3OgXyn96sHVyTiIgx2kcS2jIvhhPPAaos1n6BCKMEZyZOc/R4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783222729; c=relaxed/simple;
	bh=ZVlitDYcoob58EYGdTvXN/+R7BqFakguxSqp8lxM3/A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Ks/BKC6nNts0c2bL4VNJpK9PPGhG34MdnKijIS5O0vSgUXH54nUUAlY28PayK56PqGB/TPHKDgDcnMtcJEE+zHSHKNn/krnPEiUrYfwkOLwQjLlz7F/lKnTOc7fL97ScASFRGsJiblfsdrIsWiJl4orkIXHe3kzZXwZbg7QnLVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=catcrafts.net; spf=pass smtp.mailfrom=catcrafts.net; arc=none smtp.client-ip=198.54.118.214
Received: from mail.privateemail.com (unknown [87.215.145.39])
	by mta-07.privateemail.com (Postfix) with ESMTPA id 4gtCrT1NhNz3hhTG;
	Sat,  4 Jul 2026 23:38:32 -0400 (EDT)
From: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>
To: Srinivas Kandagatla <srini@kernel.org>,
	Mark Brown <broonie@kernel.org>
Cc: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Val Packett <val@packett.cool>,
	Luca Weiss <luca.weiss@fairphone.com>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH] ASoC: qcom: q6apm-lpass-dais: start the graph at prepare
Date: Sun,  5 Jul 2026 05:38:30 +0200
Message-ID: <20260705033830.305907-1-jorijnvdgraaf@catcrafts.net>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.46 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116504-lists,linux-arm-msm=lfdr.de];
	DMARC_NA(0.00)[catcrafts.net];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:broonie@kernel.org,m:jorijnvdgraaf@catcrafts.net,m:lgirdwood@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:val@packett.cool,m:luca.weiss@fairphone.com,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[catcrafts.net,gmail.com,perex.cz,suse.com,packett.cool,fairphone.com,vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[jorijnvdgraaf@catcrafts.net,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jorijnvdgraaf@catcrafts.net,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,catcrafts.net:from_mime,catcrafts.net:email,catcrafts.net:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 647A4708E43

The DAPM power-up sequence runs during snd_pcm prepare, but the BE
port graph is only started at trigger time. A codec that powers up
synchronously from a DAPM widget event and needs a running bit clock
at that point - such as aw88261 since commit caea99ac809d ("ASoC:
codecs: aw88261: remove async start") - can therefore never see a
live clock: its power-up check runs before the trigger and fails on
every stream start.

Start the graph at the end of prepare instead, mirroring what
q6afe_dai_prepare() does on the legacy stack, so the interface
clocks already run when DAPM powers up the codec. The FE side
already starts its own graph at prepare in q6apm_dai_prepare();
only the BE waited for trigger. The trigger-time start is kept as
a fallback, guarded by is_port_started.

Tested on the Fairphone (Gen. 6) - 2x aw88261 on Senary MI2S:
without this the amplifiers fail to power up with SYSST reporting
"no clock" on every stream start; with it they start synchronously,
including for the first short stream of the boot.

Assisted-by: Claude:claude-fable-5
Signed-off-by: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>
---
Sending as RFC because this changes when the port starts clocking for
every AudioReach platform, and I may be missing the reason the start
was placed in trigger rather than prepare in the first place:

- Is there a downside to starting the graph at prepare on AudioReach
  (power, pop/click, or DSP-side constraints)? The legacy q6afe stack
  has started its ports at the end of prepare all along, and the FE
  side of AudioReach already starts its graph in q6apm_dai_prepare().
- With the BE started at prepare, the BE graph now starts before the
  FE graph for playback (prepare runs BE-first) — does
  APM_CMD_GRAPH_START ordering between the two graphs matter?
- Is the capture direction fine with this, or should it stay
  trigger-started?

If this approach is right, the trigger callback becomes unreachable
and I would drop it entirely in a non-RFC respin, like q6afe (which
has no trigger op); it is kept here to keep the diff minimal.

Note: the test setup also carried my pending aw88261 power-up check
fix, which addresses an unrelated SYSST-check failure on this board:
https://lore.kernel.org/linux-sound/20260704192857.88366-1-jorijnvdgraaf@catcrafts.net/

Context (report and analysis of the aw88261 failure):
https://lore.kernel.org/linux-sound/d2318ba8-43f9-478b-8f9e-2c09d44ae0b1@packett.cool/

 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
index 006b283484d9..36e12a770c72 100644
--- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
+++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
@@ -224,6 +224,20 @@ static int q6apm_lpass_dai_prepare(struct snd_pcm_substream *substream, struct s
 		dev_err(dai->dev, "Failed to prepare Graph %d\n", rc);
 		goto err;
 	}
+
+	/*
+	 * Start the graph here already, like q6afe does: this way the
+	 * interface clocks are running before the DAPM power-up sequence,
+	 * for codecs that need a live bit clock to power up (e.g.
+	 * aw88261). The trigger callback keeps its start as a fallback.
+	 */
+	rc = q6apm_graph_start(dai_data->graph[dai->id]);
+	if (rc < 0) {
+		dev_err(dai->dev, "Failed to start APM port %d\n", dai->id);
+		goto err;
+	}
+	dai_data->is_port_started[dai->id] = true;
+
 	return 0;
 err:
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {

base-commit: be44d21728b6646189779923b841ad3a46d694e5
-- 
2.55.0


