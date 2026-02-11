Return-Path: <linux-arm-msm+bounces-92599-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EDDcJHFojGkdnAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92599-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 12:30:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E2C123DEF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 12:30:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B47FB3026C3A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 11:30:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C649315772;
	Wed, 11 Feb 2026 11:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="1yQOk0s0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB5C2F2905
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 11:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770809416; cv=none; b=VHHmaW711sY++YXKx+2A9mINvVgM5jeGcwpDC3SKdVZozAOwwKrkChIl9RFZ2JMw+Ab0cxtENgvQItAn0Go8cAzPDtfEX5MBvyJBJAjrXut1ld3ZibCZr8nwYL7djRzsVZGBz15CZKe+Li4MN/yXb5qDHj6QM0nkSbDA7Bz+Nmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770809416; c=relaxed/simple;
	bh=JydT74Ik20zhf7j+53D/IEutWhUVbmqSkEHShdtGWkE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=eKal6KQrq8OUN2e45Vow2ZZe5JWMYsC8cDPSSOG1SM24F/g3kgFq/r679WVWospMfgVLU4GwaF08d0mNOW+Dekp/BLcjhCUo8mYmxNW6qkKwjQbV1rsI9pat3ACH9xdmIfdyrUhMQgi2ZHbWQdev00rc83YTEcu+GiHWy3PvSt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=1yQOk0s0; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-65a414a6859so789532a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 03:30:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1770809412; x=1771414212; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l3tM0LL3TR4HqHxF8JKfN9gElsIHEa+EJ7h4mR4mWc8=;
        b=1yQOk0s0I571PCVOY8cn8CfFb51cX70iuSkTYPEypWGdT6EhjtqeGg0uQXhPIXFtGi
         0ARRd0uNQ+3VTcvCPxlbWU8OmzfLa1clpS2DhTEacDeOXjGhu4KaW4PEYPfh8ygCMSkb
         J5TXK4vkIwJivsDhAyrpChSTwCiskgg3pwGnPamcjYwG81iEAmi5n8++/JfSxl6zYDAc
         B5Nl4f9jdlwRXhCV4KsItg13bfFQGAUJ8IDAhG5GH22UFXwmM1GilFaDntFs0IjQxFce
         8Vn8WhonmO1TmryDq/aadbaG4WxksadAmld6dzWz7zgcHrJBaJQaqYc7RJqlhLMne1RQ
         j6Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770809412; x=1771414212;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l3tM0LL3TR4HqHxF8JKfN9gElsIHEa+EJ7h4mR4mWc8=;
        b=buU0DcfH3TIvr78MhMiqd89wXIdEkXsY8M9jxEEe+D5+DEzpEOCzAgL4yw4YrULOqW
         7HmStriQjv3Y1V8CUv4T6aiSSrkBEKSZsqnrS9J2NQeISxEZ8vptwi/F1QEGCm9Ps3Sd
         38GoPKlqm1sRMmtgY0z+Z/oNbq9AokKnZVSJKlSTlzd3YCqmjb/x60fxocMS/k5gX/jQ
         7si1XbF2g6Ks5JR5IAr8ElT2oberYJQHvpIuA2o7DoAo6urLLt2E3YZjjC1PpNZjp2pc
         kbn3IfXhf4px04E5o0W0615GPCw2ObOvzjZkarudWdjkQ4mzPy4wi+AcR+R5O55RB11V
         lPnQ==
X-Forwarded-Encrypted: i=1; AJvYcCX63UMGS/t2C6F8LzMI0wFeRJYrtCikD7lH4Q5QQm6kG/oEg+qFfWyNllG1g7CJGz+r3lxZGvZkDQXGMGIB@vger.kernel.org
X-Gm-Message-State: AOJu0YzcY1kSxf9dFal3ZWPVtLKgGpKD27tRIlggTKsY2ksN1xIl6Xj1
	sPImYd8D00YijsMVabWHKR0G3slfmSRjBG6sT5cjCKApJlWf4Wa8e2Eftyu1eBZOgnvw9m6I/ar
	A1JBo
X-Gm-Gg: AZuq6aJV6zLAtuJD7ILZln0Er28n0LGjY59psbYdWqjR9hU5v1zcoSv63Mzm/KFZGXh
	fSb94TVu8lvqNeOoM5r9GCAUU8C4l9YyszunlaM6rPHMLTDl7jXUskIUxT2H/itlwoAuAu0EXEx
	5BdkZO3hgpgqc9wBYv1DV+XAZf0fVFvgYE1OZ2nfbSI+NSimSTEWEN55T81W1Ls55Z0nucw9jd6
	kYIRDv8VSWg4rb+ne5LdtVOzoKFw6IDjuNvuGK3/FyvWx8BZKAI3SW7MwkML4uL/6xY8VokPC6C
	tD18vJw8sL+30Vj9/iIi/1PXA8CUxCwDX+IcmsW4ddvdirloik/lc7VJT1YczB2D/LLjcABB9qW
	HebyLQUf+HtPRS3AAXojsSP3mNDuvLoAdumsfpCyYGGcW651/DmH1stXwmamqKY4HZNIsFtgiMW
	JzNAUE5+WPemlQixiP88ge2FdqY4UNl05Kt9zmCe2u5NxOgTMmAPt5B5coaFdXRwhQQ2yM5r1GP
	eVjq2mMiP3lESE=
X-Received: by 2002:a17:907:3d16:b0:b88:510a:59b3 with SMTP id a640c23a62f3a-b8edf40a6a6mr1078241766b.48.1770809412028;
        Wed, 11 Feb 2026 03:30:12 -0800 (PST)
Received: from [172.16.240.99] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8f83e1a853sm5827766b.19.2026.02.11.03.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 03:30:11 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 11 Feb 2026 12:30:10 +0100
Subject: [PATCH] ASoC: qcom: sm8250: Add quinary MI2S support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260211-snd-sm8250-quinary-mi2s-v1-1-f62e49d85af8@fairphone.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MTQqEMAxA4atI1hNIA/7gVWQW1UbNwuo0jCji3
 S0uv8V7F5gkFYO2uCDJrqZrzHCfAobZx0lQQzYwcUXsHFoMaEvDJeHvr9GnExdlQ24olFVNPXm
 BXG9JRj3ec/e97weut9DYaQAAAA==
X-Change-ID: 20260211-snd-sm8250-quinary-mi2s-280d5670b0ae
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Bhushan Shah <bhushan.shah@machinesoul.in>, 
 Bharadwaj Raju <bharadwaj.raju@machinesoul.in>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770809411; l=1126;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=JydT74Ik20zhf7j+53D/IEutWhUVbmqSkEHShdtGWkE=;
 b=ix9w6XYmpDNWd5a+88QxR/nsD/I3Xxh8ndtsxAiOEhnOiN/Mvjw/zRGx6lKQVcfpjRz0jJyO8
 y6CPsM2F+j0CqL9L0X9dJvGuBceeihilY7kU6Y0hafUF/S0oEkwWX96
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92599-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com,machinesoul.in];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[fairphone.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,fairphone.com:mid,fairphone.com:dkim,fairphone.com:email]
X-Rspamd-Queue-Id: 36E2C123DEF
X-Rspamd-Action: no action

Add support for the QUINARY_MI2S_RX which is used on some devices to
send audio data to speaker amplifiers.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 sound/soc/qcom/sm8250.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
index 05a8b04e50e0..f193d0ba63d0 100644
--- a/sound/soc/qcom/sm8250.c
+++ b/sound/soc/qcom/sm8250.c
@@ -104,6 +104,14 @@ static int sm8250_snd_startup(struct snd_pcm_substream *substream)
 		snd_soc_dai_set_fmt(cpu_dai, fmt);
 		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
 		break;
+	case QUINARY_MI2S_RX:
+		codec_dai_fmt |= SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
+		snd_soc_dai_set_sysclk(cpu_dai,
+			Q6AFE_LPASS_CLK_ID_QUI_MI2S_IBIT,
+			MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
+		snd_soc_dai_set_fmt(cpu_dai, fmt);
+		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
+		break;
 	default:
 		break;
 	}

---
base-commit: 1a2a7222c84a6954dc411caced820dfd6b991ff4
change-id: 20260211-snd-sm8250-quinary-mi2s-280d5670b0ae

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


