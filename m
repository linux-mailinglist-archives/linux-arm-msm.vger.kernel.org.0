Return-Path: <linux-arm-msm+bounces-112703-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wU7fIvSKKmpasAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112703-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 12:16:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 00667670C5B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 12:16:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=fairphone.com header.s=fair header.b=G69zae+J;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112703-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112703-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=fairphone.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 09060302255F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 10:16:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E442331EA0;
	Thu, 11 Jun 2026 10:16:17 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CCEE40D570
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 10:16:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781172977; cv=none; b=O8TnV4iT+EqEtznhgO6NgFyaxJv0fagipCWTVFqHCwVbWye9T2NndJYp0qakQnFY+CcpqceckXgxRxFeM5n1X3zRG24NlRI3ZtxpnZki94tUv5ctkBz6x6pRyY305vv8okdSa0SD9pxZ92x1qdWfbn4iZJcxJ0Oln/g+FuxHiIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781172977; c=relaxed/simple;
	bh=rnRpWmG4J48ZICobw97cnDsqPP732sbLJJ65tkBqeIA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=D0tSNJKvgsHJU94YDNg8iNeQseYaJvqcBtexw5zR1nPYRUVTQdPgSsDjh2oJkBlMHradLOg7JINJ1JtZLP3fCFh9LbyZK8EFRtCwE8+A6e+0fuiDumf8fjKFmS2OnuvADsl7ObK+/rJ+Y5fyl3ryAy1LIrukzzSx7R4l/ui+Uf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=G69zae+J; arc=none smtp.client-ip=209.85.208.51
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-68c1630159bso8840317a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 03:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1781172974; x=1781777774; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PhJd7zCUXuRcUedlV9DBkM4yrOANKOlgS/yqDuehskQ=;
        b=G69zae+Ju4pHWOEwD23d1mRyH38is151jX/CezTDqRVv3gOUkTnhdclFRM6XeRHpix
         w6g+APpYd1G+cXckv2l0Z0+KFgmvnZ8cZNkzCswJ3ksYOGTMKHA6ylxgnvLLVznzmEAz
         +7q7hqpINdptlgQnv4LU+HTPHnS9anEQjpN5f0D3iz8u5ZclpgdgNtLsnqKH1+j3vVrP
         23JqOqtGeNW5Ef7isjufuKrq6P/qS5p9qTix63+uEDiM5y0icnOr0QeLI4OZDMRUAov4
         8yq7Hb7HniZTFKh1piEsTwpAr+xsVjjGcdJYopiXeTp/QcD9TH0+f7Iym9wAxiHGUkMG
         bqGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781172974; x=1781777774;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PhJd7zCUXuRcUedlV9DBkM4yrOANKOlgS/yqDuehskQ=;
        b=iABm6+tdb4qgnkLe4+hubWaeP7c9yJbkANKCHjB955ypjyL52bB9dR/9HynPo5WNSS
         8m1sLIbgpEkYI9UMlIFjNI2F5Vwn5yrbbgtxT0lZhtkgxT5rNibzJX4nfBXycrz1Obtz
         dkbO7qScx1ZlFqJDyJQ4kfikc/Vak0sI9p42do1R2DnGjNx1D1prKtwvf9p/G4TZs60f
         TlT5hYlUvTT4aOhDQvE9eH3f1IwdWPu4r6P3z9RdqCHHt8WxRZyjZcZqKksJYWm4yLFk
         vvFrTSMBEsfzb0q7JUehzNe9TkMPlNsoXLhvKF6HBZsMyU8CBm64NiNvHQk91m8jXbAA
         Jo2w==
X-Forwarded-Encrypted: i=1; AFNElJ+RIZvKINanCmIvLCHsGO6H5r4t1XCPr53H+dZEakmn9iJyNzZTPUmjfPq95hJtz75ULjoFbP8v7ikeIxXe@vger.kernel.org
X-Gm-Message-State: AOJu0YynHiFp5JTMRQVKpYANNpOpuujySeqWrkSl5V2Vty/4FUWq/jAW
	QoPkbryuITq17Ux9UtKRjtlbG+LBWxri+voQklEK6iwFzQXmZsBFMTYVZq/RpPcE8pk=
X-Gm-Gg: Acq92OG9yuIhN/MiyxRZsNXkRCwlpS8WJkSgRVuJ88mt7aib8VhecTLFQ4P+SWCldGp
	4KtXs0Fsr4+6dc2aRmDObCa1vLq1d7UCGvll+sG4SHiEsQzbMOkaKVerzebuiTc8m1dH0OWHTv1
	0yb9+393t1Rx6WPS3vK2kUxS5crovoNBZ682hOR3le7poMmQCKGLEplN76tk9h2XEemazMVVRTh
	h6sDlQWz1bHgrhVial+qhVuqp9mJILpao2QRenIVmLUdXfo+/Ax0sNN0HyfcaOwBSVl62oYhCey
	/HLsBjEsIZE7X9gM1+p0sIMyz6Zjli39Z362M9MJFjeaxCQCsc8Dj2ZBQuVGbM/9PR5i2bfjQNW
	PWcmLQIpc5KTkgzS+iZ1empwBWAAPtoXqunrw2dD2xcNldeQrLi0oUhEZ/8HgOHT6JHIOwWj9uK
	6l53ngAvL0akFFLW84ICvElLB/RMTkshYWwlJHKtvL18Vihikay1PBRX6pgKd9FHrCu4Z1E3Jbd
	0N7K/w=
X-Received: by 2002:a05:6402:4405:b0:692:4761:989e with SMTP id 4fb4d7f45d1cf-6930e2e5988mr1051968a12.13.1781172973893;
        Thu, 11 Jun 2026 03:16:13 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e65851786sm10571626a12.17.2026.06.11.03.16.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 03:16:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 11 Jun 2026 12:16:12 +0200
Message-Id: <DJ654FFH3T09.1VKAT493JUWP3@fairphone.com>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-sound@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ASoC: codecs: lpass-va-macro: Fix LPASS Codec Version
 for SC7280
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>, "Luca
 Weiss" <luca.weiss@fairphone.com>, "Srinivas Kandagatla"
 <srini@kernel.org>, "Liam Girdwood" <lgirdwood@gmail.com>, "Mark Brown"
 <broonie@kernel.org>, "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai"
 <tiwai@suse.com>, "Dmitry Baryshkov" <lumag@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260526-sc7280-va-macro-2-0-v1-1-2c1b572fa388@fairphone.com>
 <311ceabf-23ff-471b-9553-797c7d76af74@oss.qualcomm.com>
In-Reply-To: <311ceabf-23ff-471b-9553-797c7d76af74@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:~postmarketos/upstreaming@lists.sr.ht,m:phone-devel@vger.kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:srinivas.kandagatla@oss.qualcomm.com,m:luca.weiss@fairphone.com,m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:lumag@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,fairphone.com,kernel.org,gmail.com,perex.cz,suse.com];
	FORGED_SENDER(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112703-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[fairphone.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 00667670C5B

On Wed Jun 10, 2026 at 12:52 PM CEST, Srinivas Kandagatla wrote:
>
> Thanks Luca for the patch,
>
> On 5/26/26 4:03 PM, Luca Weiss wrote:
>> According to both the static definition in downstream...
>>=20
>>   yupik-audio-overlay.dtsi: qcom,bolero-version =3D <4>;
>>   #define BOLERO_VERSION_2_0 0x0004)
>>=20
>> and the runtime detection:
>>=20
>>   CDC_VA_TOP_CSR_CORE_ID_0=3D0x1
>>   CDC_VA_TOP_CSR_CORE_ID_1=3D0xf
>>=20
>> SC7280 has LPASS Codec Version 2.0 and not, as declared with
>> sm8250_va_data LPASS_CODEC_VERSION_1_0.
>>=20
>> Create new va_macro_data with .version not set to use the runtime
>> detection and correctly get .version =3D LPASS_CODEC_VERSION_2_0.
>>=20
>> Fixes: 77212f300bfd ("ASoC: codecs: lpass-va-macro: set the default code=
c version for sm8250")
>
> Can you help me understand if this change was fixing any issue, if so
> can you pl add CC stable

I'm pretty sure that just came around because I was looking at the
different parts of the audio stack and trying to figure out if there's
something wrong somewhere, and how the different versions floating
around downstream & upstream & documentation match up.

I'm not aware of a situation where this change makes a difference -
apart from the dev_dbg() print.

>
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>> I'm fairly confident this is correct, but please someone double check
>> this if they can.
>
> Yes, you are correct, this is actually Bolero 1.1.0 Version where things
> have changed in codec. if you read major number it will be 1
> This has been artificially tagged as 2.0 in the driver.
> So the change that you are doing is correct.
>
> Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

Thanks a lot for checking! Opens even more questions in my mind, why
1.1.0 =3D=3D 2.0 but somebody somewhere decided that at some point I guess.

Regards
Luca

