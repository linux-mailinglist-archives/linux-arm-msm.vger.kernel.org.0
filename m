Return-Path: <linux-arm-msm+bounces-91852-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sHSKCrveg2mavAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91852-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 01:05:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C7ED3ED62E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 01:05:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9DDFF3010BA9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Feb 2026 00:05:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAE934C97;
	Thu,  5 Feb 2026 00:05:10 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18ED469D
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Feb 2026 00:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770249910; cv=none; b=jFD9vBTBi/VI5qG7CIVaLRWZmmjJ9qnhlEcoTMUs5S+Y41eDNjVtWLx6cj09IrwOYZ7jrXtNPSEFKQiNL1BDl+KliRUWGq0NGeaoGP42boTX0tGimSLKVDaSJqt1O53NTeyT5TgHis2rocG2gjIOio/DsNdBiqEwjoKC5egycXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770249910; c=relaxed/simple;
	bh=38GiAMYdVr+nGbtG6jDAXZ8xhyIPj3PSQc+qTZmWAms=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IriOymgaogYp4yMeshPRFVFvOVjJ39xWQQGK4Ql0wv4gUMsX+S4aJuGHaNib6QfbjizblSWqxF0QmXU2dCXJzo04qVz9WQ4Q4CLkFIjYaWHtiZoiw3V//cOJedVAacNFix85OJFRhr6JDkFGs4YzFgTqO6cXX4xeGzpmnwd8/3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-793fdbb8d3aso3346577b3.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Feb 2026 16:05:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770249910; x=1770854710;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cUOi1AuMPbd2QKGr71XPO3ga4rTQ/23knU8iQQkMDSs=;
        b=GeCiCwD5U8UlaUzA+5gj2MQC6xnLrsQAPxddKN7sQIKlpIoYNDD6IIdMvDTl24t5bZ
         KEojcymJIgfRktJKVAGdnhjqg0FTXHulIBk2PoUsXYIrTq4FO82n9ZyX6+rCBXlDChoq
         ykH5hxRDK7WXncp+Ftm8PL6bnJ6X5M9Rl7t/TtFILV5VQxcSKWJJNV9YEKVWcd6DbUIY
         am0jP03otd3nnC7vMWFwmWGM+MCGJvRYIAX4huJynvWs12nEyIn61dfQ00r+yzFR+XrI
         gbvP6OcLnJnjY8NU10+sukwdEtWyfookM4ideNS2aAooZI63JF5zIHqjNb5QotSiW1zL
         q7iQ==
X-Forwarded-Encrypted: i=1; AJvYcCXyV46YrPP/BdorFs+UaEdH2srUA8ZPMrPX9+QwfKLrSAE7L769Au70hiC7XfZdnL7KGqf3z06NLreoKvmC@vger.kernel.org
X-Gm-Message-State: AOJu0YyRIxH8Kf6ZhGRc/45CUo9/BI1h1OjxvT7nu4YzIepqkXCgWQ4y
	kmlWb0lobRulkgQuWEYggzfsRBa2ym6CpSVjFsltVb/ZUfPNoqO7ZFaX0x8ITw==
X-Gm-Gg: AZuq6aISq0uPk+163pgMZKqDUcQIRu6X/Zep7B+/t8PTn6tL8iI2VlqSbC0ijW7nlto
	gIMsKHxNloaaoLY7ooZP/5jVuLQcQfhxG6Ja0z/GuEQ8iFpmOjdq3rnJ7g/QK4muV1j7qv8UO45
	q8L8FyobuNNDPveDapkxzmurcyUn8kEu8oDRcbmyphPWDv11IiEJXi+Wjy17DVKw75RsJreMEYq
	ArrnFP/ohmEKSWqUHRioJ4ar7281vEXlIfK9hRxtDcfI9fLb+ewpDiSgbOeAnYxNuZfOdckjrH2
	H1EBwwoG3Oxoh7xvC4QW4LRJktl/+3fusMRBaG523NZJ2uXLHsN864IQBeMNIW1v48KdCk1fwI1
	f0V9ZM8E1gb0s4Q4U7nbanjHPyll/lahdvXootPVAH9aMRvsiMmIe6Z3/OrZIh4QTVHnQXslOeX
	j9uRCfb+J6AalmeA9ZGp2P5I+/0VIvCXXKGWoh/jNx0A==
X-Received: by 2002:a05:690c:6208:b0:795:c78:b648 with SMTP id 00721157ae682-7950c78bda4mr25065027b3.60.1770249909548;
        Wed, 04 Feb 2026 16:05:09 -0800 (PST)
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com. [74.125.224.47])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-794feed1a2dsm33331627b3.25.2026.02.04.16.05.08
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Feb 2026 16:05:09 -0800 (PST)
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-649488dc7bdso272524d50.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Feb 2026 16:05:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUUCq+VJnKjj/1DQMoADjHOBECxKtZTqdGzjSq4kWeZwKgXw0sBUY6oXqRKSwYKuk3YBwd4IeePt6KU6IV5@vger.kernel.org
X-Received: by 2002:a05:690e:1444:b0:649:e871:3eb7 with SMTP id
 956f58d0204a3-649e8715351mr1098048d50.57.1770249908545; Wed, 04 Feb 2026
 16:05:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <6cd569ad19ae8efb5f4244b3aa185754@gmail.com> <eb9c1489-4496-48b3-8709-739cd45c11b0@oss.qualcomm.com>
In-Reply-To: <eb9c1489-4496-48b3-8709-739cd45c11b0@oss.qualcomm.com>
From: Roger Shimizu <rosh@debian.org>
Date: Wed, 4 Feb 2026 16:04:56 -0800
X-Gmail-Original-Message-ID: <CAEQ9gEkH8mJu+kwghbFFwNi9RfbQ6CzykoYVJqa6YAL-74SaKQ@mail.gmail.com>
X-Gm-Features: AZwV_Qi6zlrFFq0wP4iqsXvOg0ApIo-83ugjHs9tKTWoCfhXpK-5a65UO_LLSFQ
Message-ID: <CAEQ9gEkH8mJu+kwghbFFwNi9RfbQ6CzykoYVJqa6YAL-74SaKQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: qcs6490: Add Thundercomm AI Mini PC G1 IoT
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91852-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[debian.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosh@debian.org,linux-arm-msm@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.990];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: C7ED3ED62E
X-Rspamd-Action: no action

Thanks Konrad for the review!

On Wed, Feb 4, 2026 at 1:21=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 1/31/26 11:31 AM, Roger Shimizu wrote:
> > Thundercomm AI MiniPC G1 IoT is single board computer with
> > AI capability based on Qualcomm QCS6490 platform.
> >
> > This device tree is confirmed to work as below:
> > - GPU
> > - HDMI output port
> > - PCIe M.2 port (for external Wi-Fi or 5G connectivity)
> > - UART / serial console port
> > - UFS
> > - USB Type-C port, with Display Port
> >
> > Signed-off-by: Roger Shimizu <rosh@debian.org>
> > ---
>
> [...]
>
> > +/ {
> > +     model =3D "Thundercomm AI Mini PC G1 IoT";
> > +     compatible =3D "qcom,sc7280", "qcom,qcm6490";
>
> You need to add a board-specific compatible here, see:
>
> Documentation/devicetree/bindings/arm/qcom.yaml

Thanks for the hint!
I'll add it in v2 series.

> > +     chassis-type =3D "embedded";
>
> The allowed values are:
>
>     enum:
>       - desktop
>       - laptop
>       - convertible
>       - server
>       - all-in-one
>       - tablet
>       - handset
>       - watch
>       - embedded
>       - television
>       - spectacles
>
> I think it's more of a desktop, but a) that's minor and b) you could
> argue either way

The device name indicates it's Mini PC, so desktop is better.

> [...]
>
> > +             vreg_s1b_1p872: smps1 {
> > +                     regulator-name =3D "vreg_s1b_1p872";
> > +                     regulator-min-microvolt =3D <1840000>;
> > +                     regulator-max-microvolt =3D <2040000>;
>
> Have you cross-checked the regulator settings against the original
> vendor-provided sw?

No. Those are from RB3 Gen2. So far there's no issue.
If there's an issue, we can fix it later.

> [...]
>
> > +&gpu_zap_shader {
> > +     firmware-name =3D "qcom/qcs6490/a660_zap.mbn";
>
> I'm assuming this means the thing can take Qualcomm- (vs OEM-)signed firm=
ware
> Could you please confirm that's the case?

Yes, so far I don't find issue by using gpu firmware from this path.

> [...]
>
> > +&pon_pwrkey {
> > +     status =3D "okay";
> > +};
>
> This one is already enabled

May I know where it's enabled?
From my search, pon_pwrkey is defined in:
arch/arm64/boot/dts/qcom/pmk8350.dtsi, which is disabled.

-Roger

