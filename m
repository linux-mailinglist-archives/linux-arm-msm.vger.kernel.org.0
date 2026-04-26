Return-Path: <linux-arm-msm+bounces-104565-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4wPSCzaL7mn7vAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104565-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 00:01:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6955D46B563
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 00:01:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B9DEB300FEFA
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Apr 2026 22:01:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4212E304BB2;
	Sun, 26 Apr 2026 22:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J9WnTzis"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A352F616B
	for <linux-arm-msm@vger.kernel.org>; Sun, 26 Apr 2026 22:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777240882; cv=pass; b=I45LyprfasrIqm9SDCHiNszFtfKpwmLX4T5kZd99rZIT6x/gmOP7PGdDcj1cUgmo7pAq+hlRNx00Zmj4NrUNdz/Mlydrkt9Ti0V7bqppiNkmz9690YOWa1lN4ZRyoYnKr+Xs4VSmFyEp6nTn89NoezH3wv7eTr1FTM6DL85LfQo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777240882; c=relaxed/simple;
	bh=RoT0FlC8gkkNooY3mtKiEh/Tcw4FrSpEj3ULsGOQBCk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ibeUkaSvpKp1v51YbD/xYomFc6mPjmsD/0vkSARBZ94z5xCxrcwHvScsVHT+rF6O6vvH/kwzuGVazezIdTCzCwutP0ekTQkVpF8V+kBKBBBS9Plg/I5VLl5haaI7mLXDYwzJokXDqDU976ak/6/I2lcrR/ca8mV1YQ41DWDH8U8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J9WnTzis; arc=pass smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-386b553c70eso77093451fa.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Apr 2026 15:01:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777240879; cv=none;
        d=google.com; s=arc-20240605;
        b=cGK+lITYzFotBHIKSMBSxHvFL80/CDEKE0wPYYtW+yAh8RQ3qRn7IObZxrOCh8/Kli
         0Eu6ILzYtN+9FX2AxaBofPlJlX6N50v8QyvUZY3SDMV8xLXG2VLtFy492CBtwohwNfQH
         2fLqUu+/nsy4dl1sDOxpXfFc/oVZCt/P/jp1iswIsskTDIFdSMgLuB2sc0jazPDIAu5U
         aQ76qq5ZlK0vEyFMXMc0nkF4Qnb91CW3GiJ8ZRkVh63+pca7ZzDVoEBp943JAXfdNQ4Z
         9ag00jqjzv6eDOI7YJ2Z3jUcT2HGuf448fvzDK+17UKSnY9Rc3ts4Z5tOrTl+UOsiu88
         whgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=unC3pOUTEhfVaDjzyQfHFJSBQuvGVy5qfgGYkg7iaoM=;
        fh=48ztBAtENyEPu7dikAyf0wW7VrwMlt1pm0iOQL3DY1g=;
        b=Ac4xKNEfwFM7G+jfkkOcMJrP1JxAdn4LE7Gmnq7uzg4tSoL5RUnDoE+bPQ1wk4tcZT
         Sf1e95/c8JBaeK4KF+6dj4iHpKwxBJrAguq+KTd2RavRFIjlt30a/YOClfqxiWXYnWjy
         dIPe8dMXYU4vQXhACzBP3Lo+nEussnvsbszoG8lO0pIiMNugvTfE7VOAJJeUItfho8k7
         JHGbUNC41D2CPpWFcivAIO6IOn+GHYpNXEQA72tTLyRYDImmUEMWDKweokVvwN/lrkPj
         auwZ4VCWcW1PT+WP3tgl3olwxmSwVQqrdQAsveSQriPl+DDgn/WI2U4fbB5uMQrheM8Z
         sWZQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777240879; x=1777845679; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=unC3pOUTEhfVaDjzyQfHFJSBQuvGVy5qfgGYkg7iaoM=;
        b=J9WnTziszKpiM60uYow68ma0QflpBiltDac3uNDKA6uQS0GAr46GX3ktNSCoLm3Uxi
         5qHU275NMbYJnB/1PrPreGzMEvBRyhs20XBRrD6dO2YPpQna4rzGexkkxH5k9+LNQNT0
         5780EuESkIh6SvsSe4Wx82h97GfI2/0nB4aEEtz/CNg2Vk1NTOV1VGGVdMtZDS1VOYB7
         D3aQj7lveKN9HmdTsurLiaCycKhUMXsFTCFeKhV/wvmb7+TTmFFg/ng/r1Mkd6lZ1/pX
         LqtR9R/omqtlqPJS0bRzpZ4CT4sb/Jh7mKtmvpwjkG2Vzlr87ZKIK6GOyjAL57c4BPov
         Cp8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777240879; x=1777845679;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=unC3pOUTEhfVaDjzyQfHFJSBQuvGVy5qfgGYkg7iaoM=;
        b=fmF65s7YQXILxBVkiHyq8FqgL6QQZdWG+iMPSt+0/0jllwQikQ3RIHxlnmHwQrLw/3
         7VBXPnW7vVmXMAnjpeT51/4pimwEiQpAGWhtG1gnJSoD77/XXCLZXPdxiqB+DsjPZx+N
         g/zPneW85do75uZDIdF3zE3R5IdH9Ul0s89vLRuBtakhEj7VLzfv8dZ3SBzCK3fI1jcn
         6YPCv6FwcX806i6fpmaRgYBRABp5uTvuUbhh1E6UEia1ynlwtP44N+uIjaqlGgrvm9qd
         Q9uRF4DUssjSyBg0VvEMu48cL2/bVVSZNWPxKLsSZ9g3hlBf8id/uBCR9GOwUXLR/Z7X
         e4fA==
X-Forwarded-Encrypted: i=1; AFNElJ+8VWNHbrTP2AORVZg55SSG+KjovySkv4sjjmX+hnO3N3OvWUi7oBD+a33SQHy4eHcSiJkGL4JXKWs9LfEl@vger.kernel.org
X-Gm-Message-State: AOJu0YwqCEQA39yW6NrTvpGJlvHpn6jJGTY/5DX55reC76w2uwAlMypk
	trN7EfTdYlWEJC66Sa03IJXNMMyimfLXm5Pbb5OT8OfsNQ4QAahs691wqg+OkAlY44h44dBA15k
	0PyyEyubq9xDQGlkL+gFF5kbg/oPGSCY=
X-Gm-Gg: AeBDiesG4jsjCilrvPExmsh5kg+kPGRWo7Aarno4aZ+xsBDe6cunIne2Vdap6P9qOxT
	WJpxce5xTwTYJuTtpmy0i7Xcg9MsppRDPOTYODgE1Mb8RsI8yYcwQr6M3J7bE+NUNWoo63BeSUU
	AzEbcjkOCP3oEC1MhQH7MBbkzFern20cGBtAC3r+THxv6RO7Rbc7nbd/ScLEtQJI2FeRxgR9R19
	SGO56xYdgKwrJotUC5SiI/MICZn+7dFg5fZY4xwe8wplZbQHSaIHb3Nr7qH1L+47teFL3Hrrns4
	60oA3aUrQmAjpYoLX+2M+Cna9CmtZnFJqtnjtoPOX8PLowXFTguHpV0OPJEksIKkqYi+ROgYOUm
	JuopeDrL/HKSKhw==
X-Received: by 2002:a05:651c:41d0:b0:38e:1dcc:6c77 with SMTP id
 38308e7fff4ca-38ec7b2b156mr114555861fa.29.1777240878494; Sun, 26 Apr 2026
 15:01:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260408-ayn-qcs8550-v5-0-c90abeb7a152@gmail.com>
 <20260408-ayn-qcs8550-v5-3-c90abeb7a152@gmail.com> <de40fcbb-f5a9-460a-b9f5-482b0c245c4d@oss.qualcomm.com>
In-Reply-To: <de40fcbb-f5a9-460a-b9f5-482b0c245c4d@oss.qualcomm.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Sun, 26 Apr 2026 17:01:07 -0500
X-Gm-Features: AQROBzC4PWgXisDcKBnew0rBTvlfXoAdNMzrSM-lmHbg-nMJCSxzVxmhKjcHWdI
Message-ID: <CALHNRZ-8r9KSpAEsv6F1YfSjWUfJihwKfzdeDTkRsPJfwr_s5Q@mail.gmail.com>
Subject: Re: [PATCH v5 3/6] arm64: dts: qcom: Add AYN QCS8550 Common
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Teguh Sobirin <teguh@sobir.in>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 6955D46B563
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104565-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[webgeek1234@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]

On Fri, Apr 24, 2026 at 7:11=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 4/8/26 9:41 PM, Aaron Kling via B4 Relay wrote:
> > From: Teguh Sobirin <teguh@sobir.in>
> >
> > This contains everything common between the AYN QCS8550 devices. It wil=
l
> > be included by device specific dts'.
> >
> > Signed-off-by: Teguh Sobirin <teguh@sobir.in>
> > Co-developed-by: Aaron Kling <webgeek1234@gmail.com>
> > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > ---
>
> [...]
>
> > +     // The tzlog label is required by ABL to apply a dtbo, but it can=
 be on any node
>
> I don't know if the policy changed, but I think C-style (/* Foo */)
> comments are still preferred

Ack

> [...]
>
>
> > +     // The arch_timer label is unused here, but is required by ABL to=
 apply a dtbo
> > +     arch_timer: timer { };
>
> ditto

Ack

> [...]
>
> > +&pm8550_gpios {
> > +     fan_pwm_active: fan-pwm-active-state {
> > +             pins =3D "gpio8";
> > +             function =3D "func1";
> > +             input-disable;
> > +             output-enable;
> > +             output-low;
>
> Looks like this should be a regulator then, probably?

Mmm, what would it be tied to, then? The fan already has a reg. I
presume just modeling it as an always on reg tied to nothing is
undesirable. I also have no idea what the voltage would be.

> [...]
>
> > +     wcd_default: wcd-reset-n-active-state {
> > +             pins =3D "gpio108";
> > +             function =3D "gpio";
> > +             drive-strength =3D <16>;
> > +             bias-disable;
> > +             output-low;
>
> no need for this property

I'll start with saying that I know basically nothing about qcom
hardware design and what the average pinmuxing layout looks like. But
I do note that a lot of existing devices have this exact same node,
for example the sm8550 hdk [0]. Is there something that makes these
devices different? Or is this unnecessary everywhere?

> > +     };
> > +
> > +     fan_pwr_active: fan-pwr-active-state {
> > +             pins =3D "gpio109";
> > +             function =3D "gpio";
> > +             drive-strength =3D <2>;
> > +             bias-disable;
> > +             output-low;
>
> likewise, especially since it's the opposite of the active state
> defined in the vreg node

Ack, this one makes sense since the fan power sequence will set stuff
as necessary.

> [...]
>
> > +     usb0_sbu_default: usb0-sbu-state {
> > +             oe-n-pins {
> > +                     pins =3D "gpio140";
> > +                     function =3D "gpio";
> > +                     bias-disable;
> > +                     drive-strength =3D <16>;
> > +                     output-high;
>
> This is probably not required too.. unless there's a hw bug?
>
> fwiw 16 mA is a very high drive-strength - does this come from vendor
> sources?

I do not see any pinmux for gpio140 in the downstream dt or anything
matching pi3usb102 at all, I'm not sure how it's handled there. The
original source of this dt was written before there was a public gpl
code release from AYN. I do see other qcom users of the pi3usb102
doing similar however, for example the sc8280xp crd [1]. So I've got
the same question as above: is there something different here, or is
it possible other existing copies of this are also wrong?

Aaron

[0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/arch/arm64/boot/dts/qcom/sm8550-hdk.dts?h=3Dv7.0#n1302
[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts?h=3Dv7.0#n1175

