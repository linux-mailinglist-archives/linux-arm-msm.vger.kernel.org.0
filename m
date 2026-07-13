Return-Path: <linux-arm-msm+bounces-118712-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RktAKI+2VGqRpwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118712-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 11:57:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DED4F74984B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 11:57:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=chromium.org header.s=google header.b=PqxXwVQK;
	dmarc=pass (policy=none) header.from=chromium.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118712-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118712-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DA4B13016B92
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 09:57:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FFB63E3D93;
	Mon, 13 Jul 2026 09:57:32 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E44D30215A
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 09:57:30 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783936652; cv=pass; b=CeMaO+P09U7opNVw0K8FQ0AQz0VrvGPNJI2MC8mlxhVDExAFUVi4yMn6jwImOqFTP1mTzcc2vFscsRptWwvpkCoDxWKS4h8IXOT0vAc9cvrM2cwWf+IBhNjKbo6XuZtKGSen7RU822fHmmZxOy/CYt0yZmIzyw1vCA3ZNl6NwEI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783936652; c=relaxed/simple;
	bh=+iOLSTgUanaRtm9A0v0TMBC0fmd4CqVE5DXXexLAS18=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u8YfFp8cepq8esN1219Ueo8XEh4HnyXg4UQ+pwt9RAhuzCYF3x9vAasozYVJNrWVUmJowhK7wQAh+V+PAuBIzgsfXKnDzGCq7za46DbjUGQcjeGD8bUWGBa0DYlf6/nGbQYabVoyMHJqyhtoKPzMwXYShlUvKpqUqcb8SkSEwNY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PqxXwVQK; arc=pass smtp.client-ip=74.125.224.45
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-667627ae83aso4122583d50.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 02:57:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783936649; cv=none;
        d=google.com; s=arc-20260327;
        b=VV7+peZYe4hM/Bpz5l4c2kBXd5ZUe6kdrrTqOFLrTp9w7E426GU45Cui+bz1t579pp
         G6TeQcce+8a16VAHJ7LeIzzCxikIEwwrIYYt9J15xgJZhtVbECxHZnjdGp3c2HGDT5UB
         1KyhOlm8WRC0JQBVuK9bdK44lmOvVsEn9vdVGmN4cXn6pRVARhJodF8HKUX5E3qirARi
         I9TNS2yEB33z6e6rMN+ZAYm8Pndnni7PWL+vr4wEUnD31TQEp4j6+T2l0qj67VlKbgrg
         zX7GO4DS3zDy9VKLSaxpLx4vGbLUfPvWZ9KcxnGKJYp7xVFGq8PDej0U8+hOLCkIE4nf
         jzjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4QXt7p8Vwl3VHBbUurRh8OkWPo7b1yKApjJfQ8E1MKc=;
        fh=cnR1+yGM2yH9amDA60wZXIi8MFENyMr8nP1I1vG0qu0=;
        b=HPZreJKVLqIDQGZtqNxK9V2LOuZo66gcUI+R9yiCqymhbJbBfFcXriViYjWKHUIRqr
         4bTqGACDHgrxUwuTzce6ezELyEKUhlP5epnJUoXMoi2lLNRczjcPQLfnGx5RiP6NS06G
         IbOdClk27BCm5tiB2Ly2K1+379bD8Mipx8fbpYBgrdOC0rl2UuRu4jyatw1iPViw5PHZ
         0Cq9n22QNTbqqSYo7l64bvME8jvFe9EbsxV3p51vB530AWiSHsZQML2wikukPelVKU+i
         msuZ7Hd3eo2m35ghUqjAOPxVLrPu/eujXNg1Wmee6H3fPx30LiyvTryZMLtGFs3S4pJf
         pGsg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783936649; x=1784541449; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4QXt7p8Vwl3VHBbUurRh8OkWPo7b1yKApjJfQ8E1MKc=;
        b=PqxXwVQKgtRheNYg0aWlQYypQcATVDKQUMy+sTy96noJ+RogxJ/HwH/MbdaVXX65iH
         G0G4PDW1MxUNZwqpxnupk7GABlpx3hpN+ns/ae1BPh0zwZMNp7nh8mTENWF741BSela/
         Ny7Fzi0Rn/Gia+0LKRt5dxJC4QFcpVPRnSZTM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783936649; x=1784541449;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4QXt7p8Vwl3VHBbUurRh8OkWPo7b1yKApjJfQ8E1MKc=;
        b=rqpqla9Y75BjiWS7YE+LTsugiyRp1JA7GcP8ai2Le1ErLn1htn3z5tg9lBGWkOGfQ+
         ONohY+K7W41ggKg8FsIEm0l8eU7MEw67FqipDjfePxH3wCLgXitfnz/rxGLMPSRHbudL
         7A66mUmRLy8f7N6YxyUMzBoUWeY2DI2dm7L9PCV4HPGt/SDVLVtVGEDi+i7Ou/kwv8ND
         HHO+oIB1UDxZkLYMb0PAF4FT8c8zjm+4gw3F3sFQOergeBia2GkCfp+/3V0NWXXKYEiK
         w+eAj5QVz0exNnuZCi4AoCT83u9e07jrl+Cd+mlItQxbiyrvsmiaNxizJI3SZ0kU8daj
         kVlA==
X-Forwarded-Encrypted: i=1; AHgh+Roa4PSUpL3P0XbenSrLRhNhk9XwZtRqO5Hj4RM5cjMKTxMbYCl1BEXUbHwubnscmOBG+a1I02OSM/HXvL9C@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7Q3XHgxm6aCjl6Xy375UDnS8PGF9VQkIk4vVOaLPN+XuV06ln
	CIq58+oAh9A+rvKEf/lQk7qdw3+kifQPRB0CjT5S2x0EXj2bE58vxEj0i2zf3dCy3pRvaqCYJZQ
	xwMMI7/KAoStePxfdzWUilxTL18rEwFwOP2ArGpFR
X-Gm-Gg: AfdE7cnYahLh/NcYJF0rQpHhZQ1H7C+mBqGhB7xO7UCJh52lo2sy0QbfDycIcl47ph6
	0StZU+NvHiubHhRsl35soB5FYVB9NfTbISnj+8+t9r6IJ2DhdLr+mGixFcAJOc+Z1bF+TlZ1qwc
	aWVNczRn1LjweXiogwYqw5s3TLMlUnG9T0kg+Hrlk+PVIuFpwTAsX/rCqq5GYpabN74qR+oX/ui
	0aniSmSb8+2nu1KCZv6ehuXhcaVA2vJwqzRXC3lGDo/+0EK7ZJiOtTZCwzLlrmrmpSbWMTPXb2o
	hysZrDxkCdkKzey868VYIImOjpE=
X-Received: by 2002:a05:690e:c48:b0:667:f1d5:b364 with SMTP id
 956f58d0204a3-667f1d5b81bmr2295373d50.63.1783936649263; Mon, 13 Jul 2026
 02:57:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260709095726.704448-13-wenst@chromium.org> <20260713094329.4105208-1-wei.deng@oss.qualcomm.com>
In-Reply-To: <20260713094329.4105208-1-wei.deng@oss.qualcomm.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 13 Jul 2026 17:57:17 +0800
X-Gm-Features: AUfX_mwq5Qa8EaAFziCQqQmKzQg2wnKp5lbTV4kofMKUdyLtgA0yJkFs72KLWb8
Message-ID: <CAGXv+5Ew-_y4Ui8LF6sbges-nVi7mgB0HjQtZAUTHzPh6Vwk=w@mail.gmail.com>
Subject: Re: [PATCH v4 12/14] power: sequencing: pcie-m2: Add usb and sdio
 targets for E-key connector
To: Wei Deng <wei.deng@oss.qualcomm.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Alan Stern <stern@rowland.harvard.edu>, 
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mengshi.wu@oss.qualcomm.com, 
	quic_chezhou@quicinc.com, cheng.jiang@oss.qualcomm.com, 
	shuai.zhang@oss.qualcomm.com, jinwang.li@oss.qualcomm.com, 
	xiuzhuo.shang@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:wei.deng@oss.qualcomm.com,m:brgl@kernel.org,m:mani@kernel.org,m:gregkh@linuxfoundation.org,m:andriy.shevchenko@linux.intel.com,m:stern@rowland.harvard.edu,m:linux-pm@vger.kernel.org,m:linux-usb@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mengshi.wu@oss.qualcomm.com,m:quic_chezhou@quicinc.com,m:cheng.jiang@oss.qualcomm.com,m:shuai.zhang@oss.qualcomm.com,m:jinwang.li@oss.qualcomm.com,m:xiuzhuo.shang@oss.qualcomm.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[wenst@chromium.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-118712-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenst@chromium.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[chromium.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,chromium.org:from_mime,chromium.org:email,chromium.org:dkim,mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DED4F74984B

On Mon, Jul 13, 2026 at 5:43=E2=80=AFPM Wei Deng <wei.deng@oss.qualcomm.com=
> wrote:
>
> On Thu, 9 Jul 2026, Chen-Yu Tsai wrote:
> > The M.2 E-key connector allows either PCIe or SDIO for WiFi and USB or
> > UART for BT. Currently the driver only supports PCIe and UART.
> >
> > Add power sequencing targets for SDIO and USB. To avoid adding a
> > complicated dependency tree, rename the existing power sequencing units
> > "pcie" and "uart" to "wifi" and "bt". The existing target names are lef=
t
> > untouched. The new "sdio" and "usb" targets just point to the renamed
> > "wifi" and "bt" units.
> >
> > The "unit" names are internal to the power sequencing framework, and
> > should be confined to a single provider. The names are only
> > informational. Dependencies are tracked with pointers to other units.
> >
> > The "target" names are the strings that the consumer uses to acquire a
> > descriptor with. As these remain the same, existing users will continue
> > to work.
> >
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> > Changes since v2:
> > - Expand commit message
> > ---
> >  drivers/power/sequencing/pwrseq-pcie-m2.c | 41 +++++++++++++++--------
> >  1 file changed, 27 insertions(+), 14 deletions(-)
> >
>
> Hi Chen-Yu,
>
> We tested this series on the Qualcomm Hamoa IoT EVK with both USB BT
> and UART BT M.2 cards and found an issue with UART BT power cycling
> when the USB hub is active.
>
> The "uart" and "usb" targets in this patch share the same bt_unit_data.
> The USB hub acquires the "usb" target in hub_activate() and never release=
s
> it, so the bt_unit enable_count never reaches zero when hci_qca calls
> pwrseq_power_off("uart"). As a result bt_disable() is never called,
> W_DISABLE2# stays deasserted, and the BT chip cannot be properly reset.
>
> Observed on Hamoa with a UART BT card (WCN6855, sub 0xe105):
>
>   With your patches:
>     lsmod: pwrseq_pcie_m2 ... 3   (provider + uart + usb)
>     btmgmt power off -> GPIO116 stays HIGH (bt_unit ref 2->1, no callback=
)
>     btmgmt power on  -> "hci0: command 0xfc00 tx timeout" -> failed
>
>   Without your patches:
>     lsmod: pwrseq_pcie_m2 ... 2   (provider + uart only)
>     btmgmt power off -> GPIO116 goes LOW  =E2=9C=93
>     btmgmt power on  -> hci0 UP RUNNING  =E2=9C=93
>
> USB BT card (WCN6855, sub 0x3374) tested separately works correctly with
> your patches.

Thanks for testing. I haven't gotten around to doing the UART based BT
in our stuff yet. Though today I had been thinking about how to reconcile
this with the MMC pwrseq stuff, if the SDIO stuff isn't moving over to
this. Still no idea whether that would happen.

> The testing was done with the following Hamoa-specific patches on top of
> this series:
>   [PATCH 1/3] arm64: dts: qcom: hamoa-iot-evk: Describe the PCIe M.2 Key =
E connector
>     https://lore.kernel.org/all/20260709-fix-hamoa-m2-w-disable2-v1-1-5e7=
25091266a@oss.qualcomm.com/
>   [PATCH 2/3] power: sequencing: pcie-m2: Match WCN6855 and WCN7851 UART =
BT variants by subdevice ID
>     https://lore.kernel.org/all/20260709-fix-hamoa-m2-w-disable2-v1-2-5e7=
25091266a@oss.qualcomm.com/
>
> The fix we verified is to give "usb" its own independent unit so its
> enable_count is tracked separately from "uart":
>
>   static const struct pwrseq_unit_data pwrseq_pcie_m2_e_usb_bt_unit_data =
=3D {
>         .name =3D "usb-bt-enable",
>         .deps =3D pwrseq_pcie_m2_unit_deps,
>         .enable =3D pwrseq_pci_m2_e_bt_enable,
>         .disable =3D pwrseq_pci_m2_e_bt_disable,
>   };
>
>   /* change usb target to point to the independent unit */
>   static const struct pwrseq_target_data pwrseq_pcie_m2_e_usb_target_data=
 =3D {
>         .name =3D "usb",
>         .unit =3D &pwrseq_pcie_m2_e_usb_bt_unit_data,
>   };
>
> With this change, uart_bt_unit reaches ref=3D0 on UART BT power_off and
> bt_disable() is called correctly. Since a M.2 slot can only carry one
> card variant at a time, the two units do not interfere in practice.
>
> Would this be an acceptable fix, or do you have a better approach in mind=
?

I think it's acceptable in that it works, but it needs to be properly
documented, like "this only works because on the M.2 slot only one of
the two interfaces is used; do not use this pattern in other drivers."

It's also up to Bartosz and Mani, since I believe this is a slight abuse
of what looks like a shared resource. I'm sure the AI review bot is going
to complain a bunch.

If it's acceptable to the maintainers, I assume you want me to fold the
fix into my series.


Thanks
ChenYu

