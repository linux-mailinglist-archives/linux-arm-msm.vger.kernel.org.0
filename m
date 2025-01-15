Return-Path: <linux-arm-msm+bounces-45153-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 07882A12B2C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2025 19:52:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5DCE318885FD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2025 18:52:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC0C71D61A1;
	Wed, 15 Jan 2025 18:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GNrB2jg+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A91124A7D5;
	Wed, 15 Jan 2025 18:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736967116; cv=none; b=mAqDsdwQQ5Yr1Js5Fw18SZBkHumxJQZJVhAeGbExWrP1e3vN6bLfNUBkbB/Zy1hNcZscqNtYSm4AeUFnXFn8Dznjp7OTIuq2dAOydxHRtb46pZLlbzOfRL/vFLoeaMpGuKnhHigvBlFluLG2HvwNWGLVazyFr9SouOJP85ekB18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736967116; c=relaxed/simple;
	bh=2CBjv23MYxOlJNmtgtBGaGKQyrEERUP2PeLxadtXFsw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hAODzcJRElH9hW7ytf9tx7IS1L6yZk6snFnQADhioa573LU+cjxBMiPjqIM2vMtM3p/ghSaqOoUdYH3UGnQVRobrSsAm5TSFfpDYT3bgF7ZYWinGdvkAtbBjPloGyCgOfZ9WHWnLuN/uC0C5arj/MA/+6DNllCeA+MU512xWfsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GNrB2jg+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74555C4CEE2;
	Wed, 15 Jan 2025 18:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736967116;
	bh=2CBjv23MYxOlJNmtgtBGaGKQyrEERUP2PeLxadtXFsw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=GNrB2jg+Jh94dwKtpoyel4s9NjK0amgn1Ha1/pr6KqOnWPWDpAUmPHcBuguFdxuQe
	 rZ37ZZUdVhI6G4Htd++5oDbPjlTWud3gSyqbi3qUSkVXWmr+bCxMw2wLJYppEmzupQ
	 flCtGO6ZESgvFn7CHshi7623flzRbUqi52GuGUyEdM+pqAZFgxVloZoZfMNf2MJLMv
	 v64jsZZZT18z4pZG3zScP5oac8TcRjFdKmBerCNqJMyJhJQxmQMciIyo7SpNQWlPN7
	 bSRYbuNkxp93zggeaN8u7oTrE/BmlTJlp2emJfp5x3F8lKnz3VzdTyRSNiB7RtA1+c
	 shFS/M9rpWg9A==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5401c52000dso121843e87.3;
        Wed, 15 Jan 2025 10:51:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUTZKJETxTsg3/v2AefiIDeNtUAgEBOW/ed26p1ceg24EvlrjqIiYxpJke+p8+5wsFUrkS0J+2FKB0qWGfxtw==@vger.kernel.org, AJvYcCV/mQzer1DNCsVvc4/MHyffPMYltxcyWyrtSEI3sYc8ZWI9XYdV7r5jE9wgdHSCn4okb3+H7EFPGOw5@vger.kernel.org, AJvYcCVHnPLRJenqqOFv74WtA9Wp4Gd+CVhSwc9IaRiQgvkW1LtrAllVyH0O9T4vOWY5edExGxXInJvdIsuanfmC@vger.kernel.org, AJvYcCWfIZSNyG/2aIHf8KB2I9rsQ4A7rqXwRYkdvA7IEGqev41R+jbdr/jjq79gd2jXjoPttkK2uwCjDT7H@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3dOzsOSEfjjEMmlCc7mP2l1DC83cVE919KvAiiF/GwMMfP2Sj
	597cll4OpVirknR7kLw68kFmbFzJ36eGvlAFd/FppH0ozJMNrDtKyhjDEdEScWdtFuOq92bpr3/
	4G3Z3Tq7NTHCXRfTkIG4zlQQ4AQ==
X-Google-Smtp-Source: AGHT+IGn5tiZ7t+XFd36Cw2Pkn734Jaqmj8PMufsWNc0a8FX7/Lj0Hkdb/q3fJptQ+JtEzwCmDUA6XFIH9PQ3L3jDeI=
X-Received: by 2002:a05:6512:ba5:b0:542:a73d:a39c with SMTP id
 2adb3069b0e04-542a73da516mr2896052e87.49.1736967114810; Wed, 15 Jan 2025
 10:51:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250113-dwc3-refactor-v3-0-d1722075df7b@oss.qualcomm.com>
 <20250114174452.GB1414434-robh@kernel.org> <srhxu3r4sxy5ntx53nicf7l43sdjpiwavzd2qsgq2ovquzvt3u@cskcthmqznex>
In-Reply-To: <srhxu3r4sxy5ntx53nicf7l43sdjpiwavzd2qsgq2ovquzvt3u@cskcthmqznex>
From: Rob Herring <robh@kernel.org>
Date: Wed, 15 Jan 2025 12:51:42 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+4qzfy3kY+8LwPvGs4FkFKoregTAYu4-buJQZHkqJwyA@mail.gmail.com>
X-Gm-Features: AbW1kvagAa1MHU2hwYLVdH5Erq1_6vjdjyUW_EytJ4YOICKeBk1eUQZ3mwJk4bo
Message-ID: <CAL_Jsq+4qzfy3kY+8LwPvGs4FkFKoregTAYu4-buJQZHkqJwyA@mail.gmail.com>
Subject: Re: [PATCH v3 00/12] usb: dwc3: qcom: Flatten dwc3 structure
To: Bjorn Andersson <andersson@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, Saravana Kannan <saravanak@google.com>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.li@nxp.com>, linux-arm-msm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 14, 2025 at 5:04=E2=80=AFPM Bjorn Andersson <andersson@kernel.o=
rg> wrote:
>
> On Tue, Jan 14, 2025 at 11:44:52AM -0600, Rob Herring wrote:
> > On Mon, Jan 13, 2025 at 09:11:33PM -0800, Bjorn Andersson wrote:
> > > The USB IP-block found in most Qualcomm platforms is modelled in the
> > > Linux kernel as 3 different independent device drivers, but as shown =
by
> > > the already existing layering violations in the Qualcomm glue driver
> > > they can not be operated independently.
> > >
> > > With the current implementation, the glue driver registers the core a=
nd
> > > has no way to know when this is done. As a result, e.g. the suspend
> > > callbacks needs to guard against NULL pointer dereferences when tryin=
g
> > > to peek into the struct dwc3 found in the drvdata of the child.
> > >
> > > Missing from the upstream Qualcomm USB support is proper handling of
> > > role switching, in which the glue needs to be notified upon DRD mode
> > > changes. Several attempts has been made through the years to register
> > > callbacks etc, but they always fall short when it comes to handling o=
f
> > > the core's probe deferral on resources etc.
> > >
> > > Furhtermore, the DeviceTree binding is a direct representation of the
> > > Linux driver model, and doesn't necessarily describe "the USB IP-bloc=
k".
> > >
> > > This series therefor attempts to flatten the driver split, and operat=
e
> > > the glue and core out of the same platform_device instance. And in or=
der
> > > to do this, the DeviceTree representation of the IP block is flattene=
d.
> > >
> > > To avoid littering the dwc3-qcom driver with the migration code - whi=
ch
> > > we should be able to drop again in a LTS or two - this is now placed =
in
> > > drivers/of/overlays.
> > >
> > > A patch to convert a single platform - sc8280xp - is included in the
> > > series. The broader conversion will be submitted in a follow up serie=
s.
> >
> > Is it not possible to use the same overlays also fixup the .dts files a=
t
> > build time?
> >
>
> I presume so. What would the benefit of that be, over fixing up the
> source asap?

The overlays would live with all the other dts files (I think kbuild
can add built-in dtbs from arch/*/boot/dts/). We can test at build
time they actually apply, and ensure the new dtb matches what the
fixup overlay creates.

Rob

