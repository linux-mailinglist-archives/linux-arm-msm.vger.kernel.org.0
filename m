Return-Path: <linux-arm-msm+bounces-12169-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7129385F895
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Feb 2024 13:48:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 943561C20E98
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Feb 2024 12:48:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7911132484;
	Thu, 22 Feb 2024 12:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xqfaOZeV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B9E131722
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Feb 2024 12:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708606059; cv=none; b=ZgDH1ITW/YVS2Wz1djNi2eQ/9rUHmBciXFpucDoVLUIvoFKNEi2ilg1wA5ZT83/Cx7mEsPIW+TqRkvYfkdatkWeaiUPZreOxv43ROMix7e9GnYzfUoG2DZnNC5rskPgl+qpPNi6VssjU91z4nH0FkHGVjzZT0TliUPGpfAm7Ol8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708606059; c=relaxed/simple;
	bh=m3KTK3YPxZ8Ta+evN1W5IuCGgOUWeCLZqbjOnBZFKRQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gX9UJZ0sA11ypyF8OUErps7Tytjl//RgGV+DU2yAJqfMAk6ZyVO2okzi6tpC/VGXwA5guPAKI50qZUcdg+xmGAsbRXiZik725zpwGyhwI3My/CnOoldRiXW0d2kSY1ZKfWbqZSJ8/hhY/EYucsmovD5C0CW6F5gI8dGvtO70wgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xqfaOZeV; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-607f8894550so14544627b3.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Feb 2024 04:47:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708606052; x=1709210852; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cjevDkt1D1JkgAXupb+doke4NkWeti+PVxN8r/3kjqU=;
        b=xqfaOZeV9Xml3qtOVixhy/hDgqXxZUPHRymd5gqASelTagUhsWPIWjA23w3+Jsefj8
         Mw9JkOL9q2r/G5o6Z5o1VyG2DMOKf14lP7MhoVvlHicpCUSOjkbwHA9QO9LimHqAmZeO
         HnSs+dBRGUNTPZ44vokqk8aRfCRDTfU2LkTUZWvDBRLBNkk8YSapi1rAiKUw2darZuJM
         SeZXLuqkSSkwSZOgyzjD5/K1KsdoyysSkH9G7FkwaBK1DQKpz7hNWrGZPq/uDOmXnrwh
         DE1M7UfvQOgPJoxxkFIQfLEuKgxgrIFUdXYJYAcmbM8VUFjyRcf2/93VUr91m+F0jYn+
         ftvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708606052; x=1709210852;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cjevDkt1D1JkgAXupb+doke4NkWeti+PVxN8r/3kjqU=;
        b=bMXID6qu5B+OK7xu5XOQVRQ+O6JpP9cpqm0SB8OrZr1SNVz4TKzpyjNmLqAwHrcYkD
         4Cil9QRWJV0lQoCckLflXHDmfk0UD9/H8DxoE6NB9PXpoCbSyKk+YHzVf+bzVG//6e/D
         bF71K2xLFedUcVVPxGGXt2Go5xnolrGIzlvJIozNbB2FX8HR49zWn5GU+iWMT3s4zAKE
         39wjJUaLFINPQa6wSnKE1goeg5mYyDhjaf5wqTCNNeW553UtGTaBjOh207DYehpRe5H0
         sMSl5KEAVAIZm2vWOSruCIv06VDcTAMzNXvZD+KQnrrElFdFbOeQxBuqdh2sMYWmUSCn
         mL3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVK1pSvNBZWZuibl5mzlPY8L0pDmRvePk3TJCycwrZFVBXx8WYQLz3pxkchr2KmZSAWwpugCbHbrsHMYf+zIBhtFgorsQRkP/vTzT4VDA==
X-Gm-Message-State: AOJu0YzLLhIITHdjM0UhWtd/Ng7jovAZ3gcmdiStmBzJ6KYwMUDXqnca
	8Y7Xjvnz3zFutvWGtPA22T8IFP6fpi3ietkb6wxsSIZc7mtm1eDVoeDLBJ2kV+PE7tpKTmjE7wo
	xaWeWAPQgpcpRwtTcUSQfqgADc7aB5y7M80krMKnnqi5dlKBY
X-Google-Smtp-Source: AGHT+IFZyODYrfNMOWolnkP9Q1Ii/VWkZNQIAuDJ5HIrP0A43mZ2a1e8TWOpBNPPiL+jm8qBJECIV4Y0C7wlK4X8GKU=
X-Received: by 2002:a05:690c:3388:b0:608:3fe8:15bf with SMTP id
 fl8-20020a05690c338800b006083fe815bfmr13168793ywb.21.1708606051976; Thu, 22
 Feb 2024 04:47:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240216203215.40870-1-brgl@bgdev.pl> <CAA8EJppt4-L1RyDeG=1SbbzkTDhLkGcmAbZQeY0S6wGnBbFbvw@mail.gmail.com>
 <e4cddd9f-9d76-43b7-9091-413f923d27f2@linaro.org> <CAA8EJpp6+2w65o2Bfcr44tE_ircMoON6hvGgyWfvFuh3HamoSQ@mail.gmail.com>
 <4d2a6f16-bb48-4d4e-b8fd-7e4b14563ffa@linaro.org> <CAA8EJpq=iyOfYzNATRbpqfBaYSdJV1Ao5t2ewLK+wY+vEaFYAQ@mail.gmail.com>
 <CAMRc=Mfnpusf+mb-CB5S8_p7QwVW6owekC5KcQF0qrR=iOQ=oA@mail.gmail.com>
 <CAA8EJppY7VTrDz3-FMZh2qHoU+JSGUjCVEi5x=OZgNVxQLm3eQ@mail.gmail.com>
 <b9a31374-8ea9-407e-9ec3-008a95e2b18b@linaro.org> <CAA8EJppWY8c-pF75WaMadWtEuaAyCc5A1VLEq=JmB2Ngzk-zyw@mail.gmail.com>
 <CAMRc=Md6SoXukoGb4bW-CSYgjpO4RL+0Uu3tYrZzgSgVtFH6Sw@mail.gmail.com>
 <CAA8EJprUM6=ZqTwWLB8rW8WRDqwncafa-szSsTvPQCOOSXUn_w@mail.gmail.com> <CAMRc=Metemd=24t0RJw-O9Z0-cg4mESouOfvMVLs_rJDCwRBPQ@mail.gmail.com>
In-Reply-To: <CAMRc=Metemd=24t0RJw-O9Z0-cg4mESouOfvMVLs_rJDCwRBPQ@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 22 Feb 2024 14:47:20 +0200
Message-ID: <CAA8EJprJTj7o0ATrQbF_38tW+kLspF1nBySg+_y_RWmadVnV9A@mail.gmail.com>
Subject: Re: [PATCH v5 00/18] power: sequencing: implement the subsystem and
 add first users
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: neil.armstrong@linaro.org, Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Kalle Valo <kvalo@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Saravana Kannan <saravanak@google.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Arnd Bergmann <arnd@arndb.de>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Alex Elder <elder@linaro.org>, 
	Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Abel Vesa <abel.vesa@linaro.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Lukas Wunner <lukas@wunner.de>, linux-bluetooth@vger.kernel.org, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-pci@vger.kernel.org, linux-pm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 22 Feb 2024 at 14:27, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> On Thu, Feb 22, 2024 at 12:27=E2=80=AFPM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > On Thu, 22 Feb 2024 at 13:00, Bartosz Golaszewski <brgl@bgdev.pl> wrote=
:
> > >
> > > On Mon, Feb 19, 2024 at 11:21=E2=80=AFPM Dmitry Baryshkov
> > > <dmitry.baryshkov@linaro.org> wrote:
> > > >
> > > > On Mon, 19 Feb 2024 at 19:18, <neil.armstrong@linaro.org> wrote:
> > > > >
> > > > > On 19/02/2024 13:33, Dmitry Baryshkov wrote:
> > > > > > On Mon, 19 Feb 2024 at 14:23, Bartosz Golaszewski <brgl@bgdev.p=
l> wrote:
> > > > > >>
> > > > > >> On Mon, Feb 19, 2024 at 11:26=E2=80=AFAM Dmitry Baryshkov
> > > > > >> <dmitry.baryshkov@linaro.org> wrote:
> > > > > >>>
> > > > > >>
> > > > > >> [snip]
> > > > > >>
> > > > > >>>>>>>>
> > > > > >>>>>>>> For WCN7850 we hide the existence of the PMU as modeling=
 it is simply not
> > > > > >>>>>>>> necessary. The BT and WLAN devices on the device-tree ar=
e represented as
> > > > > >>>>>>>> consuming the inputs (relevant to the functionality of e=
ach) of the PMU
> > > > > >>>>>>>> directly.
> > > > > >>>>>>>
> > > > > >>>>>>> We are describing the hardware. From the hardware point o=
f view, there
> > > > > >>>>>>> is a PMU. I think at some point we would really like to d=
escribe all
> > > > > >>>>>>> Qualcomm/Atheros WiFI+BT units using this PMU approach, i=
ncluding the
> > > > > >>>>>>> older ath10k units present on RB3 (WCN3990) and db820c (Q=
CA6174).
> > > > > >>>>>>
> > > > > >>>>>> While I agree with older WiFi+BT units, I don't think it's=
 needed for
> > > > > >>>>>> WCN7850 since BT+WiFi are now designed to be fully indepen=
dent and PMU is
> > > > > >>>>>> transparent.
> > > > > >>>>>
> > > > > >>>>> I don't see any significant difference between WCN6750/WCN6=
855 and
> > > > > >>>>> WCN7850 from the PMU / power up point of view. Could you pl=
ease point
> > > > > >>>>> me to the difference?
> > > > > >>>>>
> > > > > >>>>
> > > > > >>>> The WCN7850 datasheet clearly states there's not contraint o=
n the WLAN_EN
> > > > > >>>> and BT_EN ordering and the only requirement is to have all i=
nput regulators
> > > > > >>>> up before pulling up WLAN_EN and/or BT_EN.
> > > > > >>>>
> > > > > >>>> This makes the PMU transparent and BT and WLAN can be descri=
bed as independent.
> > > > > >>>
> > > > > >>>  From the hardware perspective, there is a PMU. It has severa=
l LDOs. So
> > > > > >>> the device tree should have the same style as the previous
> > > > > >>> generations.
> > > > > >>>
> > > > > >>
> > > > > >> My thinking was this: yes, there is a PMU but describing it ha=
s no
> > > > > >> benefit (unlike QCA6x90). If we do describe, then we'll end up=
 having
> > > > > >> to use pwrseq here despite it not being needed because now we =
won't be
> > > > > >> able to just get regulators from WLAN/BT drivers directly.
> > > > > >>
> > > > > >> So I also vote for keeping it this way. Let's go into the pack=
age
> > > > > >> detail only if it's required.
> > > > > >
> > > > > > The WiFi / BT parts are not powered up by the board regulators.=
 They
> > > > > > are powered up by the PSU. So we are not describing it in the a=
ccurate
> > > > > > way.
> > > > >
> > > > > I disagree, the WCN7850 can also be used as a discrete PCIe M.2 c=
ard, and in
> > > > > this situation the PCIe part is powered with the M.2 slot and the=
 BT side
> > > > > is powered separately as we currently do it now.
> > > >
> > > > QCA6390 can also be used as a discrete M.2 card.
> > > >
> > > > > So yes there's a PMU, but it's not an always visible hardware par=
t, from the
> > > > > SoC PoV, only the separate PCIe and BT subsystems are visible/con=
trollable/powerable.
> > > >
> > > > From the hardware point:
> > > > - There is a PMU
> > > > - The PMU is connected to the board supplies
> > > > - Both WiFi and BT parts are connected to the PMU
> > > > - The BT_EN / WLAN_EN pins are not connected to the PMU
> > > >
> > > > So, not representing the PMU in the device tree is a simplification=
.
> > > >
> > >
> > > What about the existing WLAN and BT users of similar packages? We
> > > would have to deprecate a lot of existing bindings. I don't think it'=
s
> > > worth it.
> >
> > We have bindings that are not reflecting the hardware. So yes, we
> > should gradually update them once the powerseq is merged.
> >
> > > The WCN7850 is already described in bindings as consuming what is PMU=
s
> > > inputs and not its outputs.
> >
> > So do WCN6855 and QCA6391 BlueTooth parts.
> >
>
> That is not true for the latter, this series is adding regulators for it.

But the bindings exist already, so you still have to extend it,
deprecating regulator-less bindings.

Bartosz, I really don't understand what is the issue there. There is a
PMU. As such it should be represented in the DT and it can be handled
by the same driver as you are adding for QCA6390.

>
> Bart
>
> > >
> > > Bart
> > >
> > > > >
> > > > > Neil
> > > > >
> > > > > >
> > > > > > Moreover, I think we definitely want to move BT driver to use o=
nly the
> > > > > > pwrseq power up method. Doing it in the other way results in th=
e code
> > > > > > duplication and possible issues because of the regulator / pwrs=
eq
> > > > > > taking different code paths.
> > > >
> > > > --
> > > > With best wishes
> > > > Dmitry
> >
> >
> >
> > --
> > With best wishes
> > Dmitry



--=20
With best wishes
Dmitry

