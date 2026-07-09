Return-Path: <linux-arm-msm+bounces-117868-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4/JuE6FIT2r0dQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117868-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 09:07:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D207D72D74C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 09:07:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=fairphone.com header.s=fair header.b=gLsp7Dd1;
	dmarc=pass (policy=quarantine) header.from=fairphone.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117868-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117868-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0FE7A301104D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 07:07:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5828D396588;
	Thu,  9 Jul 2026 07:07:09 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC50735C188
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 07:07:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783580828; cv=none; b=EeiGSGBt3WRfxJFMnY6M2VpjX7bATE4HOIs9Vzj6fwTk8PD/fnYXx4G9y8Qqb9c4FqpEhQlXwtFPNt90SrC21F2Sd601QJag2hx+mDMNSrrANlwRGNzjAgrtUUAVt99lYUHYT9JjXy28+ejApAKguQgCVWM9NkVEX9kwAUqY/7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783580828; c=relaxed/simple;
	bh=Bnd/Zp3niZIQob/FNfLgwtO3XTUE9bxrb51tY42Yjss=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=dCpcoaDhPpSGkLg3jvgx6cidaFx/FfedanH8v/rWl3KZ4bbd37tKylGEcNw8SxwXqrX8I/10w/OvfZ/g6GjdMQTo9OW55QQK6+e1QggfslRvEN/nz1QZnqz4/ZH7ias9sfKbiW5K0AuUDPr4zs9UUwVXOFKp34qfusUlqm6hAr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=gLsp7Dd1; arc=none smtp.client-ip=209.85.208.48
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-698b558a792so1825813a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 00:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1783580820; x=1784185620; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=39wxSflXcaAuLOW85LSK1MzZPDJ4dD+cTINLmzJuWNw=;
        b=gLsp7Dd1WVvvxNVzg0TEshjZfYeaBtgcq8CTqXXbwUOJd7r8Qtb+oP9eCA/LzinkrT
         /ueUwtkfdbEZT3eRvolfn182weA34O2dMkA/8QNSaiwQ4Oos0CsAqs/uaoDPXGSue2QE
         sE5Iau+Am+lLQ2kJj54eDIkSdJew+WpHDO/bFtybnWU8S5C5Ll0s2trL+ntKRvcgEh8w
         iZ3SzhmzPVaxidRhAA4aPtwzhpMwE9IN2w0nnyx/NvkFN2EJnQnoMpPmNN4iNn4O9vdp
         hiQf0djgmMURAn5qc1tsFRlkv2rSEDq213wtVSbXULMU4+y2n+0u/CWfJ+4MEFiq2Pvd
         Kdow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783580820; x=1784185620;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=39wxSflXcaAuLOW85LSK1MzZPDJ4dD+cTINLmzJuWNw=;
        b=qxe7spm2d0cRiDL6m4upup0nKEr75xUr3bQaRC9mhR/3kq6pmZYy4wRl347HrLZQfb
         GKmGmSwy3XP7iRgsQdMfbyC6zw98vwG4t5aSga984bAmnTQYDDfVlCOBu/WuMY64OqQJ
         d+/qdk++vl5Q6ywPLAxRsNKoS/fwRffNjkpqNxx2UXWxCAfQTCX5/siVLH+w1lxWsml+
         ier4SYvPskC3v2JflrGx/CxzVa2V5lJmGQs7nubb0TQ82D7TNTJq0c73X6VPxJ6BE74T
         2gnKTRu5AwN4DgG2lqJcqASyYzSbbvqLP6c46ZsYaMJwyyKogYHT49Ww8MdKNMnOS6Ot
         WZEQ==
X-Forwarded-Encrypted: i=1; AHgh+RpxM4GesntJ9djmQsEwkQJKQ4QFvbk0DleRFxE8MlFkq+NPjpTZ393QDRcwhcx3D51FSOtNE3DMGSvNmXrC@vger.kernel.org
X-Gm-Message-State: AOJu0Ywvo5zXH1UKaXfOvfe8Q3qCiIN5FvI41IWH5436IPCbwOWtpuLT
	2K1VYZSUNSgBYJEpLcZTkGR6b8JX0THkUvnDJjuJRMlOLpRuwH3YJHhZggrEfUv9xGI=
X-Gm-Gg: AfdE7cmjjacdvDZlmwlyeS03wE/89D5ptOIvdI+vWlvZZQ6bNXxUTsOCmgqpRgkE/Ph
	Qk/TJQhCi/9Qm4GtHQTOEubgBpc6DaRFKGrLnUXjLemiFOfoun6Az+UzwICFMmqaQHWU2iBgziD
	4cbiZFIAMSXKNHf+aoTS0iyhXoqK3z8VyCEAPGGpKK5NniorFuAoEPRlQLygjZivmbYtiHyaovq
	pqd97sFHBKM18XPB6XSWoZPDi8DYyDiUvomBes25bMj6p2bnBeC2TYSnwBqxlWIv/CI1wKaxv1u
	MDzzN2atoPX5uqRKll3MeKwzUtp5fNbfCkRr2YDyvr+F4xNnkQ4GZJAwY0c7UfyNN7cUQTumVMY
	iGW9vjSIF+9KdaCCu+UCJqVCvZgJ0xKx7MII6E9LRP6BTHBXaQotipjmqGjcCMapr3NLgVDvBDK
	n+SpuGitJUlI8wQ4Q/zB5C7l3uft3b/S5quvdXqDCG86obzqvFxfjLzGVkyQ==
X-Received: by 2002:a17:907:3f86:b0:c15:d0b6:495c with SMTP id a640c23a62f3a-c15d0b64ce5mr261020666b.29.1783580818201;
        Thu, 09 Jul 2026 00:06:58 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ca1bd81asm240667266b.30.2026.07.09.00.06.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 00:06:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 09 Jul 2026 09:06:56 +0200
Message-Id: <DJTUMRRV8K1A.3AL1AMOF242DP@fairphone.com>
Cc: "Srinivas Kandagatla" <srini@kernel.org>, "Liam Girdwood"
 <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>, "Jaroslav Kysela"
 <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 <cros-qcom-dts-watchers@chromium.org>,
 <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-sound@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH RFC 1/2] ASoC: codecs: lpass-tx-macro: Use correct
 config for sc7280
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>, "Luca Weiss"
 <luca.weiss@fairphone.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260526-sc7280-tx-macro-v1-0-1aad6900fec0@fairphone.com>
 <20260526-sc7280-tx-macro-v1-1-1aad6900fec0@fairphone.com>
 <4rd4l5ioccdiggvlwl623qsdoy2udy5cr6sigyxrg5pbdll37g@sboebzvzlr6m>
In-Reply-To: <4rd4l5ioccdiggvlwl623qsdoy2udy5cr6sigyxrg5pbdll37g@sboebzvzlr6m>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-117868-lists,linux-arm-msm=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:~postmarketos/upstreaming@lists.sr.ht,m:phone-devel@vger.kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:luca.weiss@fairphone.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,chromium.org,lists.sr.ht,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[fairphone.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D207D72D74C

Hi Dmitry,

On Sat Jul 4, 2026 at 1:55 AM CEST, Dmitry Baryshkov wrote:
> On Tue, May 26, 2026 at 05:29:54PM +0200, Luca Weiss wrote:
>> With the v9 data, the controls will have completely wrong names and
>> using wrong code paths that do not apply to v9.4.
>>=20
>> Note, that this will change control names so it's a breaking change.
>
> Is it something that we want to keep as compatible for the old DTs? Or
> is it completely broken and unusable?

It's definitely not completely broken since a good number of devices
work (seemingly) correctly with it.

I also tried and I could make the microphone on Fairphone 5 (QCM6490,
Elite audio) work even with the "wrong" v9.0 config, by updating the
control names to the v9 names instead of the correct v9.4 names.

In the cover letter I've expanded more on this and the possible options
I see.

Regards
Luca

>
>>=20
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>>  sound/soc/codecs/lpass-tx-macro.c | 9 ++-------
>>  1 file changed, 2 insertions(+), 7 deletions(-)
>>=20


