Return-Path: <linux-arm-msm+bounces-117177-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id G4X9FhazTGpzoQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117177-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 10:04:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 06CBA718DB6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 10:04:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=oxFGMinG;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117177-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117177-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F10F53035800
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 08:04:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C720285CBC;
	Tue,  7 Jul 2026 08:04:15 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C10729D294
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 08:04:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783411455; cv=none; b=L2yQSwE0tvFH3sUeDxKjoHuVh7W6ohewbTJQsr5Za58RuU1Mg/LHqywHviovzPyZbwKG3p4Uabxn3Igz+y7zTZ7iaW85VRRs89zY1aaLyZoCTEW9m/J8HwytICrqSerK2wOMieNJmacAS8+m7uwcUV35t/DGg6kXvASvXIyjH5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783411455; c=relaxed/simple;
	bh=MAHxzSLNEpH3GohTe+5PjqrWLVCg5XD5BZK5f6SltNw=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dBiBdSzt+71GD5dw9o6DJb6zSQU4GuvfM6z6Yqoo1AyBxTvGPnoiM7XsojQ5cwBtzH3VF3qfJbsj8gZx7X10EHKBEhXO/2rl2b90aOUUyITrAUPZWpcWJpMfppKX/fnfEApW/7t7GWjvxHzYNLJWu1YRfgag+7kdMkFs89xRzPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oxFGMinG; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 117631F00ACA
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 08:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783411454;
	bh=f6V744Z4i++XAuNDRzrlN+4+fgWgi6OqXMfUe3Tkg5o=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=oxFGMinGFEPlPqbzLzg+VrJo68t0gv5pg8hqTzd13C0V6YZi+9Esf9VP9GPeu/lFh
	 b+gZ01ZSIFlI7F0NWZz8bDhpT6w0fDq4QIuD5P0TOKPZu6vjRhsWQJ8w4OO5L5EG3Y
	 Q0qNCf9rlYYXIv44HpPaaftlf1d/duJx1WJPpyqTLYRKqDffImWcPef6HqicTM3JQY
	 DuDHdlZoldDC6/FHIdlArA7qRVcs1+XuoC9y6qRHm82g6/ATCT7o4K4OHg3AZAuK2e
	 rhQRmu7LcZHNDSJsMcEHW/Ut4hjpPpIiiQzR3p1YyhA4pOLi5YI/BnTg9z+jvIiV9e
	 e46753b1aqXcw==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-39b2d38b200so4547151fa.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 01:04:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Ro/z2ePKpB96QwoPwP6/ociowUUxlFs0wT4foWPFhirElALr3x1fz7cNrrkuCSiHFNoScmDxG92Gs/PjfbG@vger.kernel.org
X-Gm-Message-State: AOJu0YzGk6ZLwFKqgIHjUlE6t8+lNHkX0IkZpcjDMBAFs9Fz+KSFEuS9
	U61XhdAIoamPIIqog3WtMfUHu4NK2GejmGdx3m5HXOrzexQXceMu/49LlLgAqCJg+OcM7gW+BY9
	c61Vr0d7C0DBcJyejsmCSJsUDo1A5YUbqgIs2n7VkHQ==
X-Received: by 2002:a05:651c:a09:b0:396:8cb0:d264 with SMTP id
 38308e7fff4ca-39c69b071c2mr3664141fa.8.1783411452750; Tue, 07 Jul 2026
 01:04:12 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 7 Jul 2026 01:04:11 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 7 Jul 2026 01:04:11 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <CABBYNZLLDMU1agbQJfL4T4GOTinkRyM76NDqiVHk_4+9KFohQA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260706-ipq5018-bluetooth-v4-0-350262a30959@outlook.com>
 <20260706-ipq5018-bluetooth-v4-6-350262a30959@outlook.com>
 <CABBYNZ+6BYa-CrC08piL++ysOomiWK2gbYAv3ecWwpE+RpsNOw@mail.gmail.com>
 <SN7PR19MB67365F06A4CC7405BD68AE139DF12@SN7PR19MB6736.namprd19.prod.outlook.com>
 <CABBYNZLLDMU1agbQJfL4T4GOTinkRyM76NDqiVHk_4+9KFohQA@mail.gmail.com>
Date: Tue, 7 Jul 2026 01:04:11 -0700
X-Gmail-Original-Message-ID: <CAMRc=MeBgKtsEvUC4gAd1qLgt_j3_AUZjU2H2tWj0RXuhARxiw@mail.gmail.com>
X-Gm-Features: AVVi8Cftgq99djL_qMwv3AgR7zH8qOWKZ9ElqgIeYyw1P7_GaGlqhptmDOv3a7Y
Message-ID: <CAMRc=MeBgKtsEvUC4gAd1qLgt_j3_AUZjU2H2tWj0RXuhARxiw@mail.gmail.com>
Subject: Re: [PATCH v4 6/6] MAINTAINERS: Add entry for Qualcomm IPQ5018
 Bluetooth driver
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org, 
	linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	George Moussalem <george.moussalem@outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117177-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:luiz.dentz@gmail.com,m:brgl@kernel.org,m:marcel@holtmann.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:p.zabel@pengutronix.de,m:linux-arm-msm@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:george.moussalem@outlook.com,m:luizdentz@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,mail.gmail.com:mid,outlook.com:email];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,holtmann.org,pengutronix.de,vger.kernel.org,oss.qualcomm.com,outlook.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 06CBA718DB6

On Mon, 6 Jul 2026 22:20:45 +0200, Luiz Augusto von Dentz
<luiz.dentz@gmail.com> said:
> Hi George,
>
> On Mon, Jul 6, 2026 at 4:04=E2=80=AFPM George Moussalem
> <george.moussalem@outlook.com> wrote:
>>
>> Hi Luis,
>>
>> On 7/6/26 22:36, Luiz Augusto von Dentz wrote:
>> > Hi George,
>> >
>> > On Mon, Jul 6, 2026 at 1:27=E2=80=AFPM George Moussalem via B4 Relay
>> > <devnull+george.moussalem.outlook.com@kernel.org> wrote:
>> >>
>> >> From: George Moussalem <george.moussalem@outlook.com>
>> >>
>> >> Add maintainers entry for Qualcomm IPQ5018 Bluetooth driver.
>> >>
>> >> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>> >> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
>> >> ---
>> >>  MAINTAINERS | 7 +++++++
>> >>  1 file changed, 7 insertions(+)
>> >>
>> >> diff --git a/MAINTAINERS b/MAINTAINERS
>> >> index 0b9d7c8276ac..60f7251d1a16 100644
>> >> --- a/MAINTAINERS
>> >> +++ b/MAINTAINERS
>> >> @@ -22289,6 +22289,13 @@ S:     Maintained
>> >>  F:     Documentation/devicetree/bindings/regulator/vqmmc-ipq4019-reg=
ulator.yaml
>> >>  F:     drivers/regulator/vqmmc-ipq4019-regulator.c
>> >>
>> >> +QUALCOMM IPQ5018 BLUETOOTH DRIVER
>> >> +M:     George Moussalem <george.moussalem@outlook.com>
>> >
>> > Do you work for Qualcomm or have access to their specs?
>>
>> No, I don't work for Qualcomm and don't have access to their specs eithe=
r.
>>
>> I'm purely contributing in the capacity of a volunteer.
>
> I appreciate the initiative, but we still need ACKs from Qualcomm for
> code directly related to their hardware design. This is especially
> true nowadays, as people seem confident enough to send code changes
> done by an AI agent for hardware they don't have so they are never
> tested.
>

Georde: feel free to fold this driver under the existing entry for Qualcomm
bluetooth drivers. You can add yourself as a reviewer if you want to be Cc'=
ed
on future patches.

Bartosz

