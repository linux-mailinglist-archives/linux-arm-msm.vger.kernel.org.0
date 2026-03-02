Return-Path: <linux-arm-msm+bounces-94822-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8JZPM2VbpWlc+QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94822-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 10:41:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A581D5B00
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 10:41:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5876B3038AD2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 09:41:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FE652D248D;
	Mon,  2 Mar 2026 09:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KTw8UYEC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4DF42DB787
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 09:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772444477; cv=pass; b=FECgdl9/FQphSae57nWtPNQF6HtPjAZXaK8zkposLzdhetmPof+xJ7j1DAbcZTz1EXUtZWj407Oy22PpUqwF3S+X6L1+JG4HmKcTl2Zgn9uOmi5BiCNgeSt6sQQw2l73CpjvnAVagu0zz72XMI+TUXbliCJxKcvfQBksKEnzROU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772444477; c=relaxed/simple;
	bh=TBJ1yrzYQ1NnCqjl7xWYSvAiw/tj2uso2ls5/23iYEQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WoxCdZYrmiVPtj6Q1G3nrAzVMorXhWPZKfVjOiTiRgz8sMzWzUSuFN/vmHf+VUEdsd+W7nTJGEp56zfbKI9xNB6+oGRn/HY7KMvQKZzbf9K3AKzIDpqJejWIYkHWw1HZ9VSJaVC53hWvJYAR0X0l2IO/yTnCgVoXhkIcRWX1qQI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KTw8UYEC; arc=pass smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7d598f4b6fdso967325a34.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 01:41:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772444473; cv=none;
        d=google.com; s=arc-20240605;
        b=hicBBaw/BnfG8eDzWf799g5uYf7piDTDlUVhdexIasbRAj+2bgJLmujKNSSzqjRzUt
         k0EqjaFM04spGoAcL5IDNTRsb4zVAcE3IpkoSTe+AxB7URiqK/piRrS7h6WWbJy33X3t
         sy8uc0VUTOXOe7QnAaXIT0jmoU02twv2VPS3UaZOKcYrTfK0cbFIiGTo13GwUufvLrSY
         YdV1YrCvHmDa2TGvuDWRzLtGLrh3Th1PBqRzDXnGejQk7+FczxuyC2+Jx53vQxEi82kc
         eV225kK50OVBe4QxI1pc0ui2tJ0XIKzKaHVrw5YkP4UmynxWzTuG/h2CBqYP1OByqyuD
         GUXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WMS7e/VtXgxxHiT5+aAGAuDmBujfavKZuiOoKfzvjp4=;
        fh=+OmxxGFO5vdCy2R4g+H4VuAAk/b7lXIjYeV9ulx57B8=;
        b=Uv96IBjUILqfO6MTR1xMZ60S1izKd0HUUMnuae/DJXN+lHXCkkNNf1TzxD93Gv1tmm
         KX6IiwqngGB8hW5YuesOvygem+Ir2Ltxw+6m+THJJ26ZBJ0O/KXp6DmpnSVHs+Ik6pY1
         0NS/q6O6qXf6JukvPzpX5sL4Q8/u/RaWYVy8ecwZlUaGOzEq8S18qYfHJGm2cEW/LgYU
         Qoc2NKSqIV05rmno6Z+EeZsb2RV2f3pE0ACJcueAoLtwJSa+gQZm+GGCIHV8gvOCv0g9
         hDPGayAus89yuFIZN39R98mitYiTAL/zeyz6J+iT/4XjfCAFIB7Dxs6y+mpgbLBLvr6T
         8IdQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772444473; x=1773049273; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WMS7e/VtXgxxHiT5+aAGAuDmBujfavKZuiOoKfzvjp4=;
        b=KTw8UYECl8rTlbQ/egk9PMarg7ENZ5K7KbRpMAy3WgiMlkYYc9nAU4b6k+ireh7Mue
         SxU6TJaYsZcbzBdG1QayZIGULW5fcX2IA5N7OJ6vhgkC+BAQtULkuKh7w9Svy8sKv6Nz
         HHD1f9oNAj2HkdYFiUrrfdQFIQt3dGvvcBloBUuzEKQfmKj+s0W7SH/JmbhPTc1aK9rP
         OLOK961XHVbPj6kfBMHI45XN4fCdJOAxBZb3/yhzjd9h0miRaiXIl9wRUUHTSS/91SXC
         deO0ClCYeVWWMT8/8BgBENdGPmD1nhtrktVrGql6RItE9Bqj3qURXyV0VVKRM8Ft2XOI
         qffQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772444473; x=1773049273;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WMS7e/VtXgxxHiT5+aAGAuDmBujfavKZuiOoKfzvjp4=;
        b=eu3aNptz4HWNl9yJI7nmN4Oly7g7xN3UvqtQrS3Ux+wdVPg9iLErm9aUZnkp/6wFJm
         Ppw5LekNsxaXfvReFDPwYf5Ak8zcWhqZR+k3MgsQPaZ8fx/x5XmiOOB3hM6Bjr9rwmSg
         LPbTAqFtBeM75Zf/zEnDiZkdNHhKltmh0SdjKourRvO3SPrZvhpzuDtHrEQ35S3j71+c
         X8Qut3jE51FX2wBA/Yb2Db2AgTEWf5xs084RGg9Xz05loQ4BWjYWI13wf8ToA2RJc4md
         3HfrtIXUlSE8drhsBWS4LCTc6aN4ndiJPs+0ueePbW7YnqAq+xd4DxWqkSDEbqsrAkDN
         feNw==
X-Forwarded-Encrypted: i=1; AJvYcCXN0JBgbrea3pkNdKGhf7XeEaFDePLyZHpN0rG7WoCmDW8nWEWyrSjEnHLd80OdIf9Uj4nhIp8iuzI1l6Qr@vger.kernel.org
X-Gm-Message-State: AOJu0YzerGOi7Y6szm+GUzwuksWSJSlnR1EzBUcqnZE0M8qOGibz7yJQ
	PzXfrANjAdRDhzz05NwnRj8yN3Yb/gSduBIZuBCqALUozR97hoWpf9Aa5bj5KoFVzAQ46IUwG05
	OwR4sTbnV9qvbCe3iNTia3KCdLCaf+Ow=
X-Gm-Gg: ATEYQzxtOlpq6CUrU8hIyVxEX8oTlc0nBZb62lv2+asSI+2uoS7UvbXmqBlYB3Cz2Ja
	RfWL1wTUxFaVA3drsMj+nzKIP8LrptX6uOLD6ANxnJAUlRCJUAijVIZgRw8qkBROyDGIhusn95r
	vzuBT7sQjrFyN1Gmo502zfKCiz5qM2dUbyYljXzUKBs/OxuTLly2NLPemv2hyQNE1u036d0Vfc9
	gCvq9MsKiT/t48sC23n0bkwI8R1bUXCciO6LAcunYmIfkwXFajtSAQZ8j1XPU45v4h7TjNHtT0v
	75FHtGAVSCNmBHBPT2xQuG9loT9gL9+/ocDWMvMifQLNbBnWW4hNACxaICAFhagETPzyz3Z5xE0
	=
X-Received: by 2002:a05:6870:5ba3:b0:40e:e5c4:a4b2 with SMTP id
 586e51a60fabf-41626e7efd7mr6527665fac.14.1772444473484; Mon, 02 Mar 2026
 01:41:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260302002729.19438-1-dakr@kernel.org>
In-Reply-To: <20260302002729.19438-1-dakr@kernel.org>
From: Gui-Dong Han <hanguidong02@gmail.com>
Date: Mon, 2 Mar 2026 17:41:03 +0800
X-Gm-Features: AaiRm52ksdTFNUhtDCiLRoaU2IvMaCTzMMj20OxNJCH2RxR4-dFP_MGc6WdRh8I
Message-ID: <CALbr=LYYUH_yQL1PO7mXzK6Oubt0LvKb0714iZCx_eEXScVdyQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] driver core: generalize driver_override infrastructure
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ysato@users.sourceforge.jp, 
	dalias@libc.org, glaubitz@physik.fu-berlin.de, abelvesa@kernel.org, 
	srini@kernel.org, s.nawrocki@samsung.com, nuno.sa@analog.com, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-hwmon@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-sh@vger.kernel.org, Wang Jiayue <akaieurus@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94822-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,users.sourceforge.jp,libc.org,physik.fu-berlin.de,samsung.com,analog.com,lists.linux.dev,vger.kernel.org,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hanguidong02@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 77A581D5B00
X-Rspamd-Action: no action

On Mon, Mar 2, 2026 at 8:27=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> Currently, there are 12 busses (including platform and PCI) that duplicat=
e the
> driver_override logic for their individual devices.
>
> All of them seem to be prone to the bug described in [1].
>
> While this could be solved for every bus individually using a separate lo=
ck,
> solving this in the driver-core generically results in less (and cleaner)
> changes overall.
>
> Thus, move driver_override to struct device, provide corresponding access=
ors for
> busses and handle locking with a separate lock internally.
>
> In particular, add device_set_driver_override(), device_has_driver_overri=
de(),
> device_match_driver_override() and a helper, DEVICE_ATTR_DRIVER_OVERRIDE(=
), to
> declare the corresponding sysfs store() and show() callbacks.
>
> Until all busses have migrated, keep driver_set_override() in place.
>
> Note that we can't use the device lock for the reasons described in [2].
>
> This patch series includes the migration of the platform bus; patches for=
 all
> other affected busses still need to be extracted as a follow-up of the WI=
P
> treewide patch in [3].
>
> [1] https://bugzilla.kernel.org/show_bug.cgi?id=3D220789
> [2] https://lore.kernel.org/driver-core/DGRGTIRHA62X.3RY09D9SOK77P@kernel=
.org/
> [3] https://git.kernel.org/pub/scm/linux/kernel/git/dakr/linux.git/log/?h=
=3Ddriver_override
>
> Danilo Krummrich (3):
>   driver core: generalize driver_override in struct device
>   hwmon: axi-fan: don't use driver_override as IRQ name
>   driver core: platform: use generic driver_override infrastructure

Hi Danilo,

It looks like some usages of platform_device->driver_override were
missed. I found them here:
- drivers/bus/simple-pm-bus.c
- drivers/clk/imx/clk-scu.c
- drivers/slimbus/qcom-ngd-ctrl.c
- sound/soc/samsung/i2s.c

The good news is these can be easily updated to use the new APIs. This
is required to avoid breaking the build, since the field is removed
from struct platform_device. The previous build likely passed because
these weren't enabled. I will use allyesconfig for testing going
forward.

I scanned for similar cases and most fit the new APIs perfectly. One
exception is drivers/xen/xen-pciback/pci_stub.c. It does
strcmp(dev->driver_override, PCISTUB_DRIVER_NAME) instead of using
drv->name. We might want to change device_match_driver_override() to
take a const char * instead to handle this.

Besides axi-fan, I didn't find any other drivers that need to read
driver_override. This is great, as it means we hopefully won't need to
expose a read API at all.

Thanks.

>
>  arch/sh/drivers/platform_early.c |  6 ++-
>  drivers/base/core.c              |  2 +
>  drivers/base/dd.c                | 60 +++++++++++++++++++++++
>  drivers/base/platform.c          | 35 ++------------
>  drivers/bus/simple-pm-bus.c      |  4 +-
>  drivers/clk/imx/clk-scu.c        |  3 +-
>  drivers/hwmon/axi-fan-control.c  |  2 +-
>  drivers/slimbus/qcom-ngd-ctrl.c  |  6 +--
>  include/linux/device.h           | 81 ++++++++++++++++++++++++++++++++
>  include/linux/platform_device.h  |  5 --
>  sound/soc/samsung/i2s.c          |  6 +--
>  11 files changed, 161 insertions(+), 49 deletions(-)
>
>
> base-commit: 78437ab3b769f80526416570f60173c89858dd84
> --
> 2.53.0
>

