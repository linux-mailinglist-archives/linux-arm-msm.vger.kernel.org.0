Return-Path: <linux-arm-msm+bounces-105487-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 5x83H4jG9GlyEgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105487-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 17:28:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5F44AD894
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 17:28:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CB639300533D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 May 2026 15:28:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F75A3CF051;
	Fri,  1 May 2026 15:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OVthTsFX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF042E5B2A
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 May 2026 15:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777649282; cv=none; b=qQk3KjenG51Cfazs71tVdEiA9baZN91xqRUXk032xIZDunER1Ww4/9UQfMCBj/NA39/Tv1iMVFr8unSkAhDprCu/sObyGrHuDPZr7Bd130CWtILgOlab0LvWRmqgfRTgXMS9Ux0cDMm2yiFNldet/LeRF/zadgKugn4WxJSL8cU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777649282; c=relaxed/simple;
	bh=ztIheWCEenfSMV+AtYcqS3UltJIMz6ZxwFIk+z5VCbA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:
	 References:In-Reply-To; b=ZtQLT3OcyCkpIxRkJkFYQKYRh+Vp2ZTo7h7bEPH8LPON+l56oyqEooqIYZbTmougCOALGJOSYEAM18UFfGluHnHLccHG+NNnFCXdqMZgsv8UPBvNjh5/VoWgzLmckRqrgbIMTJwQWCyqO857QZvUl8Nhn3zK38TcGax0TFbRWiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OVthTsFX; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-488b8bc6bc9so12848595e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 May 2026 08:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777649279; x=1778254079; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ztIheWCEenfSMV+AtYcqS3UltJIMz6ZxwFIk+z5VCbA=;
        b=OVthTsFXq0VlH+qTMhiaQMjpb0CcQSOAgd1O1nPXMt7MnKDPiRgBzRVCrDRR7UJf6I
         KohjaodJW+EHPpl7Y/oHkVtERxtGMMlFhdSBEf8pVAl8ERg6pIkTQzYnL9RoKa97ZtTF
         VhFOwcDHqXsIYxU/BhfqUMtvrqwyJRJYfV2tebnhQEB9xH/DSNDXYdewmfM5eILXTS05
         4NvUWXu+0WvwFJb9wtd2YuIUgUdq7oAyJkZJemq+TzIDhhatLcpaVyNiPHz/Io/635lv
         0RY2wHdpzDvYgK2Rg6OFaOyC+koO88/FrVLL0OsQSuAxgHcrXdNMM0Hk/v0NXhrB1Yqj
         zmkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777649279; x=1778254079;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ztIheWCEenfSMV+AtYcqS3UltJIMz6ZxwFIk+z5VCbA=;
        b=IZnL9vJuibs9fu6zWsd/479aNOovpNV7TPf7xaIxkrCm/gC906ZZnne3sYGeRrlqYf
         AeFjYsjfFUbhtfsRM6qCCyhpQY4VQ4of5w2f3bwk2TEF/0VcUcn1MXxuuufwIe4y0hlY
         fEsBcyRFprZgdXJRNwSmVl/m2EN7Z3zSdmBweBIGwXOxJ+auP7Q/HXUq2qnXeQeWjLzr
         jHkSXt78hiRueLAKcEJR7nv9S/u9DUjKGC9RYoiLdkqhNh5OmvZAcgS+BnHEF7mz5D3c
         53YI7atwKcPpiMzKoakNL59XlzbsRqSF4cogeSmr+I824PnoO4IiGLadFAlKT6vtBkxI
         uVYA==
X-Forwarded-Encrypted: i=1; AFNElJ+/QdCeyty8z0c4OBpE+4SRTInHq9n8Nqoz5Uu8KXFK2t7mJxjMdWP2qZa2HyjAs7tR5Glo7pazcH+kxSFI@vger.kernel.org
X-Gm-Message-State: AOJu0YyyGgzlBY/LcqCexdE7gxPJ0vZGYTPsBH9aGhrvd3h34cKmwgCI
	kJJw/ShHeutJxPrX6T6Lb6Pdvg5qithjgFQjsSAUW5Qg/nzu+xw8waoucj4mdrMzVzs=
X-Gm-Gg: AeBDiesnFO3qdXC+iLS03FCE4HFAHNVNvMbuEtNbcnmCWXwXmsTASenQnYKvkMCVq78
	i6Mxq83Aj29dJkvEqBVtuFlisDZNRyAAwcC0FkCJ6x5EMcXLFCzZKaTX72TmkovoUtuGCrBZvTP
	agS/hd/yInPAqJ7PiE7j0BPEfA/oEnNIFb/LDChNK9B+xSPXCMGLRh1MpPgA0+RJPHzN91iBRtb
	2CsQMKrLOJDHyGjm7WXqSAGdQfGUybhcGA2Id+52QS5ZcrEWbO8TqBZEKp0FnVjcalPnHjNcW57
	G4dJmq16klXW5Wxi2EsTYC25nJXuXqX+9oz+pBXwyKWia+6qHddUxtd9VP4o54jIMC9jtQ/5GMX
	n5kcbUudfANBIB/7tAj03qr7zJatCqbQZNJMd4qxycT4KV1YAc8UdFbAx0UWy49lpPFoThCQWjb
	AwvG3ksZ6VVs6tCT+QLuKynKfbZInGtru14yaH2Dq4WG58kYpv4SKziEA+tb85qeTKaq6KTMuQx
	uaqrz3lSQLW3YLpp03LAb0hsEZJhy7zoeo=
X-Received: by 2002:a05:600c:4e88:b0:48a:55d8:7882 with SMTP id 5b1f17b1804b1-48a844438f5mr111793475e9.9.1777649279314;
        Fri, 01 May 2026 08:27:59 -0700 (PDT)
Received: from localhost ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a822be902sm151439305e9.6.2026.05.01.08.27.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 May 2026 08:27:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 01 May 2026 16:27:57 +0100
Message-Id: <DI7G2SF71B39.22LPDZWBG87O9@linaro.org>
Subject: Re: ASoC q6asm race condition when stopping and preparing the
 stream
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Richard Acayan" <mailingradian@gmail.com>, "Srinivas Kandagatla"
 <srini@kernel.org>, "Liam Girdwood" <lgirdwood@gmail.com>, "Mark Brown"
 <broonie@kernel.org>, "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai"
 <tiwai@suse.com>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Kees
 Cook" <kees@kernel.org>, "Joris Verhaegen" <verhaegen@google.com>,
 "Kuninori Morimoto" <kuninori.morimoto.gx@renesas.com>,
 <linux-sound@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <afS7rTHdc9TyIeLx@rdacayan>
In-Reply-To: <afS7rTHdc9TyIeLx@rdacayan>
X-Rspamd-Queue-Id: 6E5F44AD894
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105487-lists,linux-arm-msm=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,perex.cz,suse.com,linuxfoundation.org,google.com,renesas.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[linaro.org:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexey.klimov@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

On Fri May 1, 2026 at 3:41 PM BST, Richard Acayan wrote:
> Hi,
>
> There seems to be a race condition in q6asm when stopping the stream
> (with uncompressed PCM). When receiving SNDRV_PCM_TRIGGER_STOP, the
> driver sets the state to Q6ASM_STREAM_STOPPED and sends CMD_EOS to the
> ADSP. If userspace decides to prepare the stream again in
> q6asm_dai_prepare before receiving ASM_CLIENT_EVENT_CMD_EOS_DONE, the
> memory-mapped region appears to still be in use and fails to map again.
>
> I believe this race was observed since commit 81c53b52de21 ("ASoC: qcom:
> qdsp6: q6asm-dai: set 10 ms period and buffer alignment."), but would
> need to verify. On sdm670, we are coping downstream by keeping the state
> as Q6ASM_STREAM_RUNNING until receiving CMD_EOS_DONE.

Do you have a reproducer or specific steps to test/reproduce the issue?


> Can the ADSP emit DATA_WRITE_DONE or DATA_READ_DONE before CMD_EOS_DONE?
> We might need an extra stopping state between CMD_EOS and CMD_EOS_DONE
> so the driver doesn't request more data transfers.

Thanks,
Alexey

