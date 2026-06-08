Return-Path: <linux-arm-msm+bounces-111896-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Sb6fLk7GJmp8kQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111896-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 15:40:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2F2656BBA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 15:40:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=pcEeqrQ1;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111896-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111896-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9B758300B28D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 13:39:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 804ED3806B6;
	Mon,  8 Jun 2026 13:39:56 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D60F37FF62
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 13:39:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780925996; cv=none; b=jdiesos8hYTBJIHhBisJTfJcrmQSC3R7n0LFova0u8BgJz9MP0PGR2aLbs08GsOvITais++OIZy3PEqTUwpBSSOE9KWLvLx5zxkb/wTGl7qKrN+KvP2xfApAzUtU2pWIS3t3ja975g4CgWl1ChDz2ELFdgW+WvoC70YmeaqiJ+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780925996; c=relaxed/simple;
	bh=MCx2N3prAUvO8MqB4noVmeheqznOyy7WsBMuY4aEAtk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PNKyc4cY6hHxwWiY2RGk7xj1eJt1hMvf/FxCpzPWAlb4gUyfAJoRqLefvp7l1BJwZtEIZm3ZKT2+aRPB6RDe7vaMetBUxprznXKEUKV6olmITd9KP1eZA56FEv+ZvlSNEhBbAimuEkji90f8ycIWs86EZpqBdZXfuqlPsy5mSYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pcEeqrQ1; arc=none smtp.client-ip=74.125.82.175
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-304cf518c9dso5175676eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 06:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780925994; x=1781530794; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v5KkougDEniPNaB4zp+jheULTstkgfTv6Bq66fUj4K0=;
        b=pcEeqrQ1rXSkw4a9YhYtbBwLi0wiTtajYkk7MOctLEfub3YlVN9RSKkvry0I8vHxKF
         OCy+sxy60liWa0bsvCvr+jTQqrNM4CJnpEhT0BwIvG4pP4mEuWRlTjWjHKx4Vby2maxg
         8ieN+NabylhRwt6BpubHfsG8XFrpLTJGQrVY5KXZcMh3l6xX0EW8al2vwIJK/qvCQNtZ
         S6Y2GWu7yUhpco4pTMpHzHBNaRrLQrNh410EgVp/9UeXEZOEYKFadULTt7zsHL0S81lB
         NcuvskIJ2OeGrHWaEaYpqq+jF6vM2XxXk8zhAxUkzpEx9U4CAuoQlOX8vRXTWPkvsdtk
         9IoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780925994; x=1781530794;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=v5KkougDEniPNaB4zp+jheULTstkgfTv6Bq66fUj4K0=;
        b=prUxJGuWWI47QAgeKr/g4h687MVP092T5PZuUBtXgOs5nOAsqoKPfBjPQS8ZboYkwF
         z3cGBpZnsn5XhljTpDQ4N7pkAUpUkt3Eizm4NScqS7NJFpPVmUnEKEjQW3yWtWfuLAcr
         Hu7LFIYKbCQ7GqcFjInUdpcO0SndFoadEqQhF1+1HXdqOH+jDl/ZCr1O3RIJ8iS3hRhE
         SRYl64Q+IF+WNmL1x74JpiW4sQtoA6m0cc2LmFj/PE0al0/wlrz999jBgQ19l0NArNGq
         2jQj9BFvzB0BIiGA8TD02cmZs6L0+mMkhSzzwRHxsSGydzMxJxV6PeN9h/td+DCepSXx
         p8Mg==
X-Forwarded-Encrypted: i=1; AFNElJ/QxJDXIAChk8496+Urwm/tQ3LOA1mIjg2Oa9nD+Tp5kbneHuLpec4DdyUlUSFUzoVTkTspVfg+dpm3jSwH@vger.kernel.org
X-Gm-Message-State: AOJu0YwXzHyAmDAu/q0B9fSf9JyZH5FzlaZva5E7bZYhCpOoFwCdFfcV
	AHMsw+kFjRkkBD8Zz8QCBEnS9/B8LWrpt1gpMtPu7Cfb9HI+KmWcSNXm
X-Gm-Gg: Acq92OFQcVDBIHpWGE+ZKp4pJBzq8yUQcMovlCFhp/X9XtdD6tymQywS3hCLh4GLRN4
	0gyJkyvqZLa5N74F9A4J2giDfyQk/pR1FvfSg/HNq/kVNMvZOK1Z0TD15pkHZqaA868WRniXqij
	Nh5Dbl90yMLGqrDqnuU2om9WgXYUIURcMWKwjhej2XXWpGE7PlnZvXyTaUjavWIU1b92uNhp7P8
	5b3B7rn3f3eZVp3aLM1mdZ2iMSrkjIPHiXSl7p2If1Pe1huEEMdZDX/HyRveldgHpXU7hlkSNCE
	TDXkuSZu8Vz639809LGLj2CPIcr66onPfx21iWjIKsaI7Zp1Xri+vas0WKRN4mcMHDAsEDYr6ZV
	CMPGKUzblc4JofhpSUIPPXp9k9v5lsQNJrRN7yJmv8EdMhP4NVy9LoQh7ErZT30BHBovB2V9bYH
	QpSaoc9GoLiNVdutXLP28tUrheU06WDBgulzcAhfENCHkcWrRgD1Cws+Kf0jaJr9kM/9Ere2ico
	pNIixBEtgsx
X-Received: by 2002:a05:693c:3003:b0:304:d835:27f with SMTP id 5a478bee46e88-3077b15d304mr7307289eec.22.1780925994137;
        Mon, 08 Jun 2026 06:39:54 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-23.user3p.v-tal.net.br. [177.4.161.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074db560d7sm23893449eec.5.2026.06.08.06.39.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 06:39:53 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Mon, 08 Jun 2026 10:39:12 -0300
Subject: [PATCH 2/3] ASoC: fsl: fsl_qmc_audio: use scoped child node loop
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260608-asoc-of-node-scoped-cleanup-v1-2-9e3ac518dc2e@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1261;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=MCx2N3prAUvO8MqB4noVmeheqznOyy7WsBMuY4aEAtk=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDFlqxyQ6WbXOHZl573lk8fKZWS9rEjeZ7J/2YxvT62vSk
 utzDuowdZSyMIhxMciKKbKsTlpkuafrwdX6uBUeMHNYmUCGMHBxCsBE3n5k+Mm48r9C6PqddYW7
 uKUX3W660TnB1a/qr6303zidBctYjqoxMuyLmB/7u3zl96m+jSwPQpazaHlsyeq94VPsoy/x/EV
 /FzcA
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-111896-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BD2F2656BBA

qmc_audio_probe() manually puts the current child node before returning
from the DAI parsing loop on error.

Use for_each_available_child_of_node_scoped() so the current child node is
released automatically on early return and normal loop exit.

Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/soc/fsl/fsl_qmc_audio.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/sound/soc/fsl/fsl_qmc_audio.c b/sound/soc/fsl/fsl_qmc_audio.c
index 76e014dfb6d7..d0f644573f49 100644
--- a/sound/soc/fsl/fsl_qmc_audio.c
+++ b/sound/soc/fsl/fsl_qmc_audio.c
@@ -905,7 +905,6 @@ static int qmc_audio_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
 	struct qmc_audio *qmc_audio;
-	struct device_node *child;
 	unsigned int i;
 	int ret;
 
@@ -931,14 +930,12 @@ static int qmc_audio_probe(struct platform_device *pdev)
 	}
 
 	i = 0;
-	for_each_available_child_of_node(np, child) {
+	for_each_available_child_of_node_scoped(np, child) {
 		ret = qmc_audio_dai_parse(qmc_audio, child,
 					  qmc_audio->dais + i,
 					  qmc_audio->dai_drivers + i);
-		if (ret) {
-			of_node_put(child);
+		if (ret)
 			return ret;
-		}
 		i++;
 	}
 

-- 
2.54.0


