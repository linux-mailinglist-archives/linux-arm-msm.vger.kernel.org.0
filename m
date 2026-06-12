Return-Path: <linux-arm-msm+bounces-112951-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id z7R9LbQeLGoJLwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112951-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 16:59:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 51CF267A606
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 16:59:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=imd-tec.com header.s=google header.b=HEO3pFkf;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112951-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112951-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=imd-tec.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9201631A102D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 14:56:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6019A38D3EA;
	Fri, 12 Jun 2026 14:56:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5FF138B12C
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 14:56:42 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781276204; cv=pass; b=UY64y0omwNnT2le0dW5hBt6b8A7ci/nDoL4+hk2SsOiTC7WiTPmZ6cwyTMgJsJTP73JWayPN/3TPutCgQODcnbD/z+b0B3WN+tMkvLBDHymTzq9ILks7trvE9zDfQ/JKAABjrm6eHJug/pA3WNwx2Ka9QAoYSLuU+F1K4PnW/Eg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781276204; c=relaxed/simple;
	bh=QIW62ikKZcv1KNzbDJe5YxTSN/5XVxBnzFHD2epcV7Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=neP1GFT83+i68PrboS4hyaQ5KFevkz9a/e8wc+k1rujsZj3qTGgvWNNQj3p2TCSCVLZ5UhErVYI+fCcU7FEZqRT7xKjCz13LtLc13PyRsUyup5f1XoAb5TWGPe/BnlyZyIdfkfmpdq960Qz1ri4/Lkwc/EEYbFu55JNkpwEp2UI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com; spf=pass smtp.mailfrom=imd-tec.com; dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b=HEO3pFkf; arc=pass smtp.client-ip=209.85.217.51
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-6cfd9f4d6f5so400988137.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 07:56:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781276202; cv=none;
        d=google.com; s=arc-20240605;
        b=iRl+B412uJCek6zhMERoXY1IN2shR+YDXpt8XO7SSMnLYSczry0tiCMOqxx+suPf5a
         yFFonkYXjStM35TKTeWMuX3z7GSOU/vgROfU7dO276R/m6jkMnCbq/8ctWOXTg8wFxpS
         6034j9FE0wuQ1T0rZY4BwvCKF77gLnOg5wVrP742yrY7SXrNr41jM9MazVWYiNkEkmnm
         JE+yWNoz0Jo9POdbhpL0FIxxsKmH0KaQWczCzs67c09V/0KO6J8FSt/2woDxV0fXcDTx
         JVIlyHIB+lN01BLczSMZYUbFUM6PVl1nKf8tJFdD0xdR60FasB6FdezjhmFcqrMGQVEX
         Uu9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lG0qX+ayOcM7ycNEY66FF0f5sN+HRaPLdeR2N8mYiP0=;
        fh=xIKqLMXBAt+f3F3HyFBJErXseBxWrQKDnPPd0Mu92Qc=;
        b=DN6cbxsAb6/iVi6sNFzAezTRRaMuIj06ZUTsq8rvm/Ua7aF5N3iJopBDw2MprV8ahh
         Ogy7Hn929NfJXlG7L81pDsUgI7a0VLxe+E5h7DkM/MUU4BfO0R7fIma+pWXLoAXEXhHm
         Tcr4cSpb3FGO5zwWFrsHZaGC+FLbXNkTWulPjHAXaQYuhlV9ZIjLHolYK4qBwi0BxjoE
         +n3MFE2yHUrCfTdmO2O3n92QA9ICrPmNsmeWG0P35wbc4HGcQ8W0/ZYXfIUAvSCrSZjY
         fU6TagJ6JoJjcXaNt75fZxP96n8ldTD5C2p1UzrksDe5K9pFzj1Yd2oyIYaR7XXREYZ/
         AWbA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=imd-tec.com; s=google; t=1781276202; x=1781881002; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lG0qX+ayOcM7ycNEY66FF0f5sN+HRaPLdeR2N8mYiP0=;
        b=HEO3pFkfpF5FYECoxFiZO0nIVVFG5eXvYB5h/5xdgh7ilA/gtRk845A0nVTIyj2/fH
         qEaN7dKhS1Ip1JK0DyJgtwWoQSbQKK+/0Bu0LWamdybbjryATSCYdhYiOWHTgTZD0VdI
         TewM/e2BS3OKJR7HnNOLszlCuCfRDZsNJkMjmFYiYwvtYTPJhISt08ctwBZogFXBOwzx
         92QhtS4O3wdhV2aPM0IQE5fGBTbyzls9/H+zOXTXwX2XK9axiGxWW84XaHDgZZpC4L4f
         T/uSE9u1f2CbC40X3zNBSKYURmEj6AjmDHQD5aTP+R2oy1ty2cKnrth3qRM6037B2adX
         w0GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781276202; x=1781881002;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lG0qX+ayOcM7ycNEY66FF0f5sN+HRaPLdeR2N8mYiP0=;
        b=UFI/F6q9/u5b6PtifgpEWTUxwaqtPPbJ4WNCVyerkyIfL5XexuHsZv2VKizjoOtWk5
         rLaTgek6UjYJGjtiGU65ohtthbvIrUbblhDR6qHjM276fzcVe+qWS6wPhInlFNQnwJWn
         ZYSzuhledF4WqNkSiC9j49LmLjIxDNwP7l9D0DsqKBJ54gWXVTyQ/my833hBvrmP9NDU
         d5S9/KL4FE7svm3o+EAMKLYa29Wih1DyFmKYLSw8xgf2mXeND//pgdZYC2ZAkF/AhHHe
         atRxpxiWOnlJiYNgto31TVyWyfDqAaXZKxYInUGfQzRjhXkkmEg5PYVKcEFGmx55tt4p
         1U5w==
X-Forwarded-Encrypted: i=1; AFNElJ+SLytR+D/3MVEkMH6Xiu2GP1Yk0gcM0gtA56CKEQ+FvG1A3cLyWZ4eDEGP7jI0NgAyKdkXrpn2Getl/P5H@vger.kernel.org
X-Gm-Message-State: AOJu0YznSpAblNFLkKCU/dvaoIgLzqdpsJ/fh9RsJ3gluoh8ILdQLjWV
	Qpcv7lVOV4mSHErBSM5IbZREtLn0tcP5JK1t/ULStuL0PjDd8CuEf3kaSYsWgGcs5BJJm7H13FU
	Q4eWWrEDmiWqRxkQ8n1Pnm9iISESQbUWuUyfnKvTtKQ==
X-Gm-Gg: Acq92OH57cbOzK5knqCzD454DtI34aJMQpZDueMoiv155KC5Cs8PbK06tVntmsRRfYp
	Ptann29A9qIh1RvjmXGtHiYTD5Oh3qSJlcNaiOtqYyL+aBYUniX7ahX5/IM+DvFHcMNElEUnbab
	VPqL71rCJpaRIqu7L2hJMoPbFt2MCdjrdbTKhq83dz1WDKGUtQkgffTJYLjEA7QPXS3TdEQz9Ya
	g7tsEnnMXjZdQKrM1Fw6VjpSLqx/Yg1No0L7+HT/pJhouRF9lECNMvYmfjLVXV8dMeLFW5xrTza
	UU0x5UhRfQSyGHQw
X-Received: by 2002:a05:6102:644b:b0:631:4cd8:b6aa with SMTP id
 ada2fe7eead31-71e88c54814mr1696500137.13.1781276201695; Fri, 12 Jun 2026
 07:56:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427-sm8550-sdhc4-support-v2-1-a4241f43ecd5@imd-tec.com>
 <e0731edc-81da-429a-a12e-a1d1b75f9544@linaro.org> <aig9licCxhtZbHMq@will-Legion-Slim-5-16APH8>
 <5a5cbf8f-07ef-419a-8d30-c1b0b2786312@linaro.org> <aik1ZYUT-cnpfdQn@will-Legion-Slim-5-16APH8>
 <00643a25-040a-4bec-8324-f52b30d84f9f@linaro.org> <aivHs6p28uN3d6TI@will-Legion-Slim-5-16APH8>
 <aca9bd93-9dff-4493-a1c4-daf9ba27aad6@linaro.org>
In-Reply-To: <aca9bd93-9dff-4493-a1c4-daf9ba27aad6@linaro.org>
From: Tendai Makumire <tendai.makumire@imd-tec.com>
Date: Fri, 12 Jun 2026 15:56:29 +0100
X-Gm-Features: AVVi8CeifV9qAmQffT_sMCM2pBZ4K5zACZU61maUzZh8KhZaZlMdzWUp7xFuXTU
Message-ID: <CAPF-P6qT4FL9FDSx44JCP+oOiAYC47x3XVuEbqaQtJTPeMXB4A@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: sm8550: add SDHC4 controller node
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: William Bright <william.bright@imd-tec.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ram Boukobza <ram@imd-tec.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[imd-tec.com,none];
	R_DKIM_ALLOW(-0.20)[imd-tec.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112951-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vladimir.zapolskiy@linaro.org,m:william.bright@imd-tec.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:ram@imd-tec.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[tendai.makumire@imd-tec.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[imd-tec.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tendai.makumire@imd-tec.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 51CF267A606

On Fri, Jun 12, 2026 at 10:11 AM, Vladimir Zapolskiy wrote:
> If Qualcomm supports their downstream Android kernel running on your
> board, it should be worth to contact them.

Hi Vladimir,

I had previously opened a case with Qualcomm when I started trying to get
SDHC4 working on our board and we didn't get very far with them. I did almo=
st
all the work here without their support.

What's interesting to me is that we managed to get SDHC2 working at
UHS-I SDR104 speeds quite early on. And the traces for SDHC4 on our
board are actually shorter than what we have for SDHC2.
The only difference between the two controllers on our board
is that we don't have a level shifter on SDHC4 and the pins are
connected directly to the IW416 without any pullups or pulldowns.
The signals looked clean last time I measured them.

Tendai


On Fri, Jun 12, 2026 at 10:11=E2=80=AFAM Vladimir Zapolskiy
<vladimir.zapolskiy@linaro.org> wrote:
>
> On 6/12/26 11:47, William Bright wrote:
> > On Thu, Jun 11, 2026 at 10:48:34AM +0300, Vladimir Zapolskiy wrote:
> >> Looks like the SDHC driver behaves expectedly then. For me it's hard t=
o say
> >> what may be the rootcause, I believe the lower bus frequency should be=
 fine,
> >> so it sounds like a hardware issue, but could it be PCB/board specific=
 one?
> >>
> >> If you find a chance to copy the SDHC driver (and its small dependenci=
es)
> >> from Android and test it on your board, and if it also fails, then it =
might
> >> be well concluded that something is wrong with hardware, still it won'=
t be
> >> quite convincing that the SoC SDHC is to blame here.
> >>
> >> Hope it helps.
> >>
> > My colleague Tendai (<tendai.makumire@imd-tec.com>) had the same issue
> > with dll-tuning failing in SDR50 when working on the downstream 5.15 ms=
m
> > kernel [1].
>
> If Qualcomm supports their downstream Android kernel running on your
> board, it should be worth to contact them.
>
> > It does sound like a potential SI issue so I will try the following:
> >    - Sweeping the drive-strength values for the sdhc_4 lines to see if =
I
> >      can find a set of values that work
> >    - Scoping the lines to check SI when performing dll-tuning, our boar=
d
> >      is very dense so this is challenging.
> > I am guessing this patch is only acceptable to be upstreamed once we ge=
t
> > to the bottom of why dll-tuning is failing?
>
> Apparently if Qualcomm confirms that SM8550 SDHC4 actually has this
> discovered and unveiled defect, then this change will be accepted for
> all SM8550 platform like you propose it to be done.
>
> According to my experince SM8550 SDHC2 operates properly in UHS-I
> SDR50/SDR104 speed modes, this can be verified on the reference boards
> like HDK or QRD, and for me it sounds oddly that there is such a problem
> with SDHC4.
>
> If the proposed change as is does not enter upstream for SM8550 SoC, you
> may keep it as a necessary change in your particular board .dts file.
>
> > [1] https://github.com/imd-tec/meta-imdt-qcom/tree/kirkstone/patches/ms=
m-kernel/files
> >
>
> --
> Best wishes,
> Vladimir

