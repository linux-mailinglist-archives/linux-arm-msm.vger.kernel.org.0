Return-Path: <linux-arm-msm+bounces-103987-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cEn2IsPn52lbCgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103987-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 23:10:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E51E43FA91
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 23:10:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 055C23045275
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 21:10:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E90BE39D6D9;
	Tue, 21 Apr 2026 21:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ftE/A+Rp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B1535B63F
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 21:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776805818; cv=none; b=Y3aq6gRA2i0XaVYAKly5M05IclF8xseOSzkER+/S7EI6fIdBFNDwfmCmxGD785Dv9alYvwK252EHUdMUcoWt8nvs8F4gHPy4YTAHHZMYwy1D3u+zY09+H975aFBZVxOWbzoFVNGsFxiOP1Yd+BvEucBAr7uOzTTP4+FKkrThHJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776805818; c=relaxed/simple;
	bh=N3/Jue8skuzZI8JC/tskpgiGjT8p9dW2Ux7S9Fdfp7Y=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hYFmi3cFkTEahkq665LCND1VF2Km8TBQSSzAYOIg8506ps6N53+h8yo/UnELRLZeHdYrVWjLTi69Gyq/KnSbV+70VF2xPRNDLSwO8Lz1IX26QPKrAQtNGHpFuX8cE9OXEQdIXiDy3poloUo22Bewwyun4DSVHfjm5vRY413Alcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ftE/A+Rp; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4891c0620bcso22704865e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 14:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776805815; x=1777410615; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=N3/Jue8skuzZI8JC/tskpgiGjT8p9dW2Ux7S9Fdfp7Y=;
        b=ftE/A+Rp6tPnuD6EBnFEQSh7Pdg4jdh3mV5M2P+Km6PL/GBXZvIpCCvtqL91KYqrYI
         B9PpjHMJ5/IxH8U0T2DL8TdLXLG7EP+kIGyKbqebzdfHikntYN6LCKciUFv30/uGDU3E
         zbVWPU8KZkcszJLuvFSlUVDXtr8IHoN4KQTxgvacBkIYapTVlIHZRndnXDEx3B02lrTD
         gyP1zEVd/LGScW9A552wYaA31tDI11QHBQdC1chhclx34HH06QfhwtkY71vr4K8lZDKz
         EWq0IO0VKUG3Wt577Mx07tpUu1LrcZLWeI6oIzPetpL7U/OhSITc7CplGrqaiEEy8wlS
         Q/sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776805815; x=1777410615;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N3/Jue8skuzZI8JC/tskpgiGjT8p9dW2Ux7S9Fdfp7Y=;
        b=YVdjNHB/9QuPtxxcCazH1IIa6gcu5ZEu3q2mOOXUNWlpMK0LElsUp6TyzF+q+/rypP
         1zV+BqhDVM4D6WOjEqkn80KGICdPsVw7ejkctUSOh3G+deBwPr7geHRxJeEm/ytOSyWc
         rqNnDhPp3F5F7WlXyGNosDc2jtCT266U8YkqwPT8R5gEpFBFzLgUDY08gy02uSLIlZ/f
         tqW2rAqwCkq886+IFSnw/Ayscl7F6jWQrylO/qFA0iYea6/EmbBomBCBy42DyOyu89KX
         d1Bt/Ba5a2kJZ2RdA0QxiISZrzgAwwVamOtBCc9rCs+rjEchDjgIcDx/xFEZPiy5ak/g
         m5iQ==
X-Forwarded-Encrypted: i=1; AFNElJ/oIkMFi17IWin7Kl2XHZWzO/PuvqAzc+7qsyWjCUOXe19Owph2NwzqxINOw5tjIfeD0kuYnr9XvCnlUaIE@vger.kernel.org
X-Gm-Message-State: AOJu0YwpFr0e0YS38+LB0sL82HoAh1kU+wLUwll6zJJ4BFu+KFWYuyLl
	38qV4fUskqszzK71G+lxUdZe0vmM7ICAeU/AFZHq6QTA0ROj4Jf4tr3sOabetS2xrdZ6HTlfiYp
	KdU1h
X-Gm-Gg: AeBDievPfrZIJK+rf1cd6EuagURw9dofeCG1l+FUQ7YaLQ+sjOU8Wwcb8n7C4SukpYi
	DanctOL4iDWmEVyzWfFYsAYRXT+a9McR/BFIoc8KHxj8O7LrJ7aupU50dVvPepRXbC+GFSvhJnr
	O0yz7KtQCaf7IpB3p2qHIweZMkJ2uoy7sstvFyOWZL0WnoEF1HQJz4hhGHBzzTOeWy4pJVabZYU
	Zv0nbeEFBMLvxL2mgJQoBdvNWBRwbhFZxMNVLw+cXEPBtc0mVjqZRicv+4gCpmQ1aYLueeqeYH1
	nPnXjtL1ZfXbMHevcN/Z9UUnpiaXw/05I9kw6uezxwiNGhM4gN0ffQJ1wakL2gkpBqZTpZVzXmd
	fUxZ2Bb2RElCshW9dKbWQH7QE6uCvW3Ozg96MEF6KFsxRS1BtMhbg9cpR0krCSafvw9B9UnB25Z
	73lmCKkW5k0fgcMfglsGi+G7CNaNdJT6PTrHpKRvFyRCqToV2pZnXyIUHsk/M/vkB8V37AK58ys
	QKaMnv0eHa3CHbpmlFP7x/e984VC8x3
X-Received: by 2002:a5d:5344:0:b0:43f:e659:1705 with SMTP id ffacd0b85a97d-43fe6591783mr20072533f8f.20.1776805815348;
        Tue, 21 Apr 2026 14:10:15 -0700 (PDT)
Received: from [192.168.16.142] (host86-170-11-80.range86-170.btcentralplus.com. [86.170.11.80])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4cb135asm44774202f8f.6.2026.04.21.14.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 14:10:15 -0700 (PDT)
Message-ID: <13ae5d6a29548ab7e21b222d6616f87addcdebbe.camel@linaro.org>
Subject: Re: [PATCH] media: venus: declare firmware files via MODULE_FIRMWARE
From: Christopher Obbard <christopher.obbard@linaro.org>
To: Bryan O'Donoghue <bod@kernel.org>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, Dikshita Agarwal	
 <dikshita.agarwal@oss.qualcomm.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, 	linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, 	linux-kernel@vger.kernel.org
Date: Tue, 21 Apr 2026 22:10:14 +0100
In-Reply-To: <148e8b79-25d9-471b-b3ac-35f944aae927@kernel.org>
References: 
	<5RSTHU5_nsLp9gy49GbhT_8mHBjtBeKDsC6F1ABHCU9ZdpW9A8692UruVYnsCexIJGWsWiW2R5WtPULge31Gyw==@protonmail.internalid>
	 <20260419-wip-obbardc-qcom-venus-firmware-v1-1-08a0d3cf056f@linaro.org>
	 <b18d5f20-4013-47a3-bf43-06162682a65a@kernel.org>
	 <5eH-TLTol5AO_JnG_lVOVn4jVL8Y9hFrmS5YgPznDbZXibbSfmVS2QTPl5TJT1IQ7ib7mfdqLz-VZSlRRTy7Cw==@protonmail.internalid>
	 <CACr-zFBV0p_61ZA6QDLXDqtUqnqajyqHhC9H2SFJ2kSZHevwVA@mail.gmail.com>
	 <148e8b79-25d9-471b-b3ac-35f944aae927@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103987-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christopher.obbard@linaro.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0E51E43FA91
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Bryan,

On Tue, 2026-04-21 at 02:23 +0100, Bryan O'Donoghue wrote:
> On 20/04/2026 20:57, Christopher Obbard wrote:
> > Hi Bryan,
> >=20
> > The background for this was to ensure the firmware is available in a
> > system image
> > or copied into the initrd if the driver is built-in. This is done in a
> > CI environment without
> > access to the hardware.
> >=20
> > Debian's initramfs-tools looks at MODULE_FIRWMARE and copies those
> > files into the
> > initrd if the driver is built-in. For now, a workaround for me could
> > be to just manually copy
> > the firmware into the initrd and drop this patch.
> >=20
> > I didn't get to the bottom of modifying the firmware loading code to
> > make the driver
> > defer probe to when the rootfs was ready and instead just threw the
> > firmware into
> > the initrd, but that's another story.
> >=20
> > On Mon, 20 Apr 2026 at 11:20, Bryan O'Donoghue <bod@kernel.org> wrote:
> > >=20
> > > On 19/04/2026 23:39, Christopher Obbard wrote:
> > > > The driver loads firmware blobs at runtime via request_firmware()
> > > > but does not currently advertise the possible filenames. Add
> > > > MODULE_FIRMWARE() entries for all known firmware variants so they a=
re
> > > > visible via modinfo and can be picked up by user space tooling.
> > >=20
> > > What about the board dtsi files ?
> >=20
> > I really am not keen on adding all of the firmware from the board dts f=
iles as
> > MODULE_FIRMWARE entries into the driver, it then becomes two lists to
> > maintain. What do you think?
> >=20
> > BUT talking of two lists to maintain, I am essentially duplicating fwna=
me in
> > MODULE_FIRMWARE, so perhaps my argument is moot.
> >=20
> > For my use-case, it may make sense to "teach" the initrd generator to l=
ook at
> > the firmware-name entries from the dts files I am building for. But tha=
t is also
> > not ideal.
> >=20
> >=20
> > Cheers!
> >=20
> > Chris
>=20
> I think its reasonable to keep a list of firmware that is supplied in=20
> linux-firmware in the MODULE_FIRMWARE() list.
>=20
> AFAIK paths such as "qcom/sdm845/SHIFT/axolotl/venus.mbn"; are not in=20
> linux-firmware so .. we shoudln't expect tooling to populate them into=
=20
> initrd.

In latest linux-firmware we have:

$ find -type f | grep -i venus
./qcom/venus-6.0/venus.mbn
./qcom/venus-5.2/venus.mbn
./qcom/venus-1.8/venus.mbn
./qcom/venus-4.2/venus.mbn
./qcom/venus-5.4/venus.mbn

So I wonder if I should send v2 adding MODULE_FIRMWARE entries for just tho=
se files in linux-firmware?


Cheers!

Chris

