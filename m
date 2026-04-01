Return-Path: <linux-arm-msm+bounces-101381-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6CDCDJxVzWk5cAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101381-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 19:27:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E6F37EA59
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 19:27:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DC2A63018298
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 17:19:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4565633ADAD;
	Wed,  1 Apr 2026 17:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KDhfO3Yg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D0324E4C6;
	Wed,  1 Apr 2026 17:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775063944; cv=none; b=TpabCB5/xjTDnYK8+xaHt/JiV/O2/KUexIrUfDAMB6lmzlDHm8HMNL2BsH/+QY9rJBCUt2AZ+2nIqhvvRENALNXgKSWgBQSOAF2VWTA57FCl1cgyM3e2tCXiMjNwETgkNlCoOPQFEFHG+tkZfPKvsigAfiJG4FKInpsLlXbBlrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775063944; c=relaxed/simple;
	bh=M+bVbssourcdFCDBjWFXjmwefz7AGX01HmgNDSTKY+0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=EEVFwpLs5Bja/Th9GuXBUtAHOkkB9+2S121rndjyfSWzIpIEsEITpTUUJAa661AqoUHMW3aYAa0nhxO2r7jfwbx0GLQ5VYZWqmP/5uZ+MgcnDoJ8axkFtURUzyPoGD7+/QaQfAFyAYHcUjfYnTTxmwGQQJcAdoCsPhpkcLtYtGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KDhfO3Yg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5989EC4CEF7;
	Wed,  1 Apr 2026 17:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775063944;
	bh=M+bVbssourcdFCDBjWFXjmwefz7AGX01HmgNDSTKY+0=;
	h=From:Date:Subject:To:Cc:From;
	b=KDhfO3YguzoTJS1HkRDB5bXjhxd/j6iIIe3cYLrcuEfagpqey9T13NwqWGNbiIMe2
	 qy6GlGdUdTYkEd+7+rrg61rrjd7gVvzTP8ndxpCMhLJZ2ogfSHErR9j83/vaBsgOs+
	 m5EoCctcHbq/nVWmJnK3pmbXRPWH+k7UxlPm/3xLRdlAKEvl6dD/Pq1rWVwShGMa/M
	 Pbp5sBDNQZ1osex3RLeiCUb/JATF4Xt5xoXaxfDyA8KdlPFQ1pEpZz1zSqr3ffNqje
	 T+X4B70/ftD680BJXOQqhqOcKW+LbVutqzKlnwxAVCyeKYhaxUkUrF2j+OgtBs3k3v
	 IEL25QYAa2Q5g==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 01 Apr 2026 18:18:03 +0100
Subject: [PATCH] ASoC: qcom: qdsp6: Reject pointer operations on
 unconfigured streams
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260401-asoc-qcom-qdsp6-robustness-v1-1-3a72991096bb@kernel.org>
X-B4-Tracking: v=1; b=H4sIAEpTzWkC/yXMwQqDMAwA0F+RnA20CqL7leHBpNnMYK02Ogbiv
 6/bju/yDjDJKgaX6oAsLzVNscDXFfA8xbughmJoXNO5tvU4WWJcOT1xDbZ0mBPttkUxw97T0LM
 LJI6gBEuWm75/+XX823Z6CG/fEc7zA/xm5S1+AAAA
X-Change-ID: 20260331-asoc-qcom-qdsp6-robustness-81b98c0dbe0b
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.16-dev-7777e
X-Developer-Signature: v=1; a=openpgp-sha256; l=1256; i=broonie@kernel.org;
 h=from:subject:message-id; bh=M+bVbssourcdFCDBjWFXjmwefz7AGX01HmgNDSTKY+0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpzVOFAcFXZXhGATV5nMn5yYhd8Fq3BDi7NyLC1
 6vbZUJ9jtaJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCac1ThQAKCRAk1otyXVSH
 0KaPB/9gUogg9o7bqYR3roLLqauKpihkOPxEc2/lkEw6p1YYusrDViOAZuvupnO7I8n+9bCjMwV
 C/VGJujFcoIB2CvQg9udhqpXYRg1x48gBxYMSy+tpQZE98XVlmYu8j6H+ZTjlSZ56FDQzKjge0n
 gZ2UwvlV1UZO9yc17Q5MZ+8MpzlyUgcMLYoQRwJ0ew00QdlVlx9rgcKjJe/Gak2v6UBK7bzGPVP
 eZThQQWNxcjMVx01ScZVKMC1G+S8nuziqldn7ONKVXXlIlagIygYIpqB9jhgyhDF3RONZQEB3Gz
 BwNcdecH4cSLRJ2ZfMtyJ2lwiGBiFD9AEjjzloqLr5cPhwUe
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101381-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 81E6F37EA59
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The QDSP6 driver reports the current byte offset by dividing the current
copied data total by pcm_size, but pcm_size is only configured as part of
set_params() so if we manage to do a pointer operation before that happens
we will divide by 0. There is no sensible reason to do so, add an error
check for robustness.

Reported-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/qcom/qdsp6/q6apm-dai.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index 168c166c960d..833d4782c68f 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -582,6 +582,9 @@ static int q6apm_dai_compr_pointer(struct snd_soc_component *component,
 	guard(spinlock_irqsave)(&prtd->lock);
 	tstamp->copied_total = prtd->copied_total;
 	temp_copied_total = tstamp->copied_total;
+
+	if (!prtd->pcm_size)
+		return -EINVAL;
 	tstamp->byte_offset = do_div(temp_copied_total, prtd->pcm_size);
 
 	return 0;

---
base-commit: 7aaa8047eafd0bd628065b15757d9b48c5f9c07d
change-id: 20260331-asoc-qcom-qdsp6-robustness-81b98c0dbe0b

Best regards,
--  
Mark Brown <broonie@kernel.org>


