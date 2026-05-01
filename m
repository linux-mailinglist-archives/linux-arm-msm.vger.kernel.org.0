Return-Path: <linux-arm-msm+bounces-105486-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YFilLoO79GkwEAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105486-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 16:41:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B582B4AD549
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 16:41:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B6611300602C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 May 2026 14:41:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D34D3CBE7A;
	Fri,  1 May 2026 14:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RQrgPpYN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 771383C8735
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 May 2026 14:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777646461; cv=none; b=Cb6WQFGVZLbei2Ai+bpYLwbJ+jrKyUncV5EAZbDheWriuNC7/6tibq9UntkbFlrs9G+X3yQNA+8LFFRdbB4seEbr/sMSk8YGbyEMHAom0pXMzpKbeiYcYqd5LZQKu8cLG0oJBSkQ84/0z/A72o6q2XvawOT0t4jGAs+8GeTusuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777646461; c=relaxed/simple;
	bh=axhZE7iq4V4NfKtkFtOnf9unIcr5Q6pw8mBt6qvrky4=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hiQiucXSX49vN6UaMtRfXwxuRT4hrskh5IPC2si9apA/pWK93xTgv5MJAgnfm3o9B1oIVL8qN3kLy9NyxtlMcLAp4CLYAv7cnu+U+X1oDIoUTWoMDmgKO+vIx1f9S3MCtfyrfBFM9Jjtc0DWX2wwllkowW157Nzx96rPV21cdL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RQrgPpYN; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-8b5de17382cso2661546d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 May 2026 07:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777646457; x=1778251257; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=axhZE7iq4V4NfKtkFtOnf9unIcr5Q6pw8mBt6qvrky4=;
        b=RQrgPpYNGtyAbT/hwsUN3smG0TtRk0ER4qeekKs0D+bIj7LZeSm0DlKbbwBr8eRLX3
         +UO1uCxCSRwlW3+dylrKI9R85XtCJuQb8I5y6/nu8AJyQuAQ40txrLggKxFARwqYwhVS
         GJRgalO40GCtI1NYOm2xRoLH6/bU3D5d5fPPWpohoAFloWGHQZRehhw8m2dQGK6pju+e
         3WI5N+2CB/CnXhXDo8xwtkcvELyNCoJgv8bR2SM/fg7A7wxMHjs4Z5LtoQYaBSwA64Kg
         UiwCpcpUQP3T5haqHUQjRkNNB4GoO0yIRfPyJUGSI5ZnlB7vx38Agy7rz8Tx46WVlwTD
         rd9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777646457; x=1778251257;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=axhZE7iq4V4NfKtkFtOnf9unIcr5Q6pw8mBt6qvrky4=;
        b=RviCJi2uOocnTVIuZepEdQsFMlvZSWzmFSEW0pjmDMTkLEIaGus+/klU4awm3UXKlF
         +Wt6B5H2+iQHY2UsV2TMfKddT/DfaLuFxfs62pxPHOf72KIBZEdL7E0envyRNZcTpisc
         eCCwcSXt/lM7/Tn7PNA//QUCxukhCsAbf1rJDIw7uoMMXeKU5SiuC7lskU/vUWI6bV3Y
         /dUAEC3bkjWk8GChyasxB+unpaBst42Jg4KZEukzoImCk7xpM4daFXGuUygD/v46M6k4
         h58i2D2gktMsIMva7pul4lNk+ViXK5f46Qt696zMKoURelpN3dXkbc0u6Af+wHTMpvbz
         2WpA==
X-Forwarded-Encrypted: i=1; AFNElJ+tX83x7HMIbuqlrz7u9jV/TaQoFJkqFZmP13yyWzKdc6tqu9RNEpZnzzxvqS6tQxCgB9dYOJj9RCGALXtr@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7gW3izBaWS1F9ONaDtsMue98sp4pVmJi9fXBUyx13nZblXlRW
	Albeo+oP2aSIlw02bmdVuklcbhg8PhZleZp+v1bv9n6r/44eosbLuVZl
X-Gm-Gg: AeBDieuN7dTRaYstGCkTcWb4x1isV3JfEiVmtbjrtqaMprOmQDLZEbAKCp60/acXTs9
	pIr+edhmCZi6IyKSPIG4F4T4uDf/x9qehhQDYWvqhoTjql2G8bkSR7vxjfrv1mr9hlJfSOq7EnP
	5xgiQRRgDac9lale0CNtDL9bE5Kc2D+VCACZeoiKDIyC1oH/kH3c9QIN4egbvnu6Lyb94XZjKwi
	1qc9zItPL4aiF1YG8v8UL5Rn2Urq+b6bsKAsvyvwfKKuDDw+61oMUd2PNIQ9eY6GL1olsF4eEyA
	IVGnY2D8ahgFE4UQ5MbOusiEVqiOGNcQhbJhYadXBpbupQoiMMJPefxIZJ/uKNV/1kDPuhfrecK
	4gssRIq7blGh+UDU04zwyvf4SA8qTcyL2lSt5GLr23FKy2ADZPt03DIGV0K9ODaz49fMq9YCwkD
	foDJSEx+swcW0UHFaCCooCsWaXBTTWG+t53wbvm4hUXWF0FmyJkey/QmPJP1b8iLh/7AttVnIcT
	KbyUrhSCs4FlgQXSq1ciSbb7vsAMuls+FxG
X-Received: by 2002:a05:6214:3012:b0:8a1:3ba4:9832 with SMTP id 6a1803df08f44-8b3fe766b5cmr104223706d6.16.1777646457024;
        Fri, 01 May 2026 07:40:57 -0700 (PDT)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b5395c5b4csm26439146d6.16.2026.05.01.07.40.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 07:40:56 -0700 (PDT)
Date: Fri, 1 May 2026 10:41:49 -0400
From: Richard Acayan <mailingradian@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Richard Acayan <mailingradian@gmail.com>,
	Kees Cook <kees@kernel.org>, Joris Verhaegen <verhaegen@google.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: ASoC q6asm race condition when stopping and preparing the stream
Message-ID: <afS7rTHdc9TyIeLx@rdacayan>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rspamd-Queue-Id: B582B4AD549
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com,linuxfoundation.org,google.com,renesas.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-105486-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

Hi,

There seems to be a race condition in q6asm when stopping the stream
(with uncompressed PCM). When receiving SNDRV_PCM_TRIGGER_STOP, the
driver sets the state to Q6ASM_STREAM_STOPPED and sends CMD_EOS to the
ADSP. If userspace decides to prepare the stream again in
q6asm_dai_prepare before receiving ASM_CLIENT_EVENT_CMD_EOS_DONE, the
memory-mapped region appears to still be in use and fails to map again.

I believe this race was observed since commit 81c53b52de21 ("ASoC: qcom:
qdsp6: q6asm-dai: set 10 ms period and buffer alignment."), but would
need to verify. On sdm670, we are coping downstream by keeping the state
as Q6ASM_STREAM_RUNNING until receiving CMD_EOS_DONE.

Can the ADSP emit DATA_WRITE_DONE or DATA_READ_DONE before CMD_EOS_DONE?
We might need an extra stopping state between CMD_EOS and CMD_EOS_DONE
so the driver doesn't request more data transfers.

