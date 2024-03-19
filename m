Return-Path: <linux-arm-msm+bounces-14585-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E37E788034E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 18:21:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 125B61C229B4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 17:21:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13D2E2110F;
	Tue, 19 Mar 2024 17:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="aNnf1ByZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DEF620319
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Mar 2024 17:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710868851; cv=none; b=EBXC2ZmBpju/Bt1GDs7Ju736HfZqgMY98R97PX4IJRIL8ENSWpjoVkxFsFC6fqJX0hspVOstYNzw0mQEvWcKffz0Ugn8P/U2kEH1yugfkpg+iUt3l3ix3IRKv/csfeLkzwbmVi94kWKzydp3BPeEiYyhauyUnPMzNp8Rzk7Tv6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710868851; c=relaxed/simple;
	bh=jL9kHyMM7c3nVEZ31ALav/nIxEz+OLnT9X61bJOp+Xg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CqJUkSWLG1iCb2wK4jwUQSPDc4mhcdKr5NkzGxfBGHEq+XkMzcNURuqq0e4nEqRJwOTNPNrM3VY6Yii12dMCyxX4wzwszR49ErUlOBnGNY+cnG++qUqevxBis65Mcs7xQDEVViT4at+gjM0J0Xqtwvjd8N9u1pRajGCf1rGrYkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=aNnf1ByZ; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-4d47000f875so659445e0c.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Mar 2024 10:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1710868848; x=1711473648; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xy7T3S3KJOVX4N1q15sidzyEWWPC1Gkc2ooZN7wpRNo=;
        b=aNnf1ByZzUdPgGrdFMfwXzzNEhM+KnIGfwSCLL8j52STRLb2wsUmjP0M9ZP3Oahhxn
         p9QRZWNqRjlw0HUWv/QJ6mlPmNkBnxqP2sDBiL4VY2fxvvCLqYxoCD+DGzmmsZawj8n1
         9XgaNZTA49DhjwW7Zg9c0V2DsBIrq3jb+BMXE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710868848; x=1711473648;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xy7T3S3KJOVX4N1q15sidzyEWWPC1Gkc2ooZN7wpRNo=;
        b=PRc9qNX56Wf4B3PI5KphRtyga6l7szd2ZfQgzU7wkYB0kqZj2ltAyBQilvA/3KCwcJ
         e5wU0N/25P9HI6JK2YwwcArDniQMznhSry2LcB9qWKylngYPyuAXmuooKHNAPPsmstn5
         bV/kRaZkVc0GaF5OSBcMBsW84X639vMQP30WxH6AcJMas+jtiVHe//gfQXfXA8sZcrPi
         LwxrHPmBUagEa9REvVqTetmmRtZsLDp+neI0+J+9wXmSob7aOcapbrxLP7Yq32Q/ysX1
         UCUR+dx+c9dbYdxf7N/36zH4/fWazcW74gh5xF/sgMiC+a1tHGvJpSR4Kp6nRJbZhBBf
         wBQw==
X-Forwarded-Encrypted: i=1; AJvYcCU3p+yCTkIupDfZltZElyOS7R38K9+fZ6cFqhSjF+frLCU3fDDpm0F31oNK3ghh4FHjDT2FYEHBnPCHpgWb2zSbpLrfWGKbKxlS/escHQ==
X-Gm-Message-State: AOJu0Yxh9IUoSZjCmURp7NOLYnzxxUcNsHCKawcU5MtFyqTmb81vQYM3
	ZXQ2iyHNU++YOukTXyhe6LxK02VYhvOPyz4OYQfQuQ0UTQakti/1O1HlX3T01doydcRdf67srWw
	=
X-Google-Smtp-Source: AGHT+IHUXB1lJRWI3hbI/gvk0ez/uksRhWyySRfbeRiFliHx2km5LM4XnNyF/K1t5nyYl3zAIUSOHg==
X-Received: by 2002:a05:6122:6ab:b0:4d4:eb8:bf27 with SMTP id r11-20020a05612206ab00b004d40eb8bf27mr9772856vkq.0.1710868847795;
        Tue, 19 Mar 2024 10:20:47 -0700 (PDT)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com. [209.85.160.178])
        by smtp.gmail.com with ESMTPSA id gs13-20020a056214226d00b00690f4a73726sm6552807qvb.61.2024.03.19.10.20.47
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Mar 2024 10:20:47 -0700 (PDT)
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-42ee0c326e8so22671cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Mar 2024 10:20:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVjtewSKMo3ub8mC9H0ACRevXYWztZruyH4USuLl7HQL6hU9Kv9HQg8dHljbsXUIMHpr8YDwJqWn26TX8YbGIpBMLfhnZfCxDGxkR2f3g==
X-Received: by 2002:ac8:590c:0:b0:430:b7d0:59d4 with SMTP id
 12-20020ac8590c000000b00430b7d059d4mr1682qty.19.1710868359392; Tue, 19 Mar
 2024 10:12:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240319152926.1288-1-johan+linaro@kernel.org>
 <20240319152926.1288-4-johan+linaro@kernel.org> <CAD=FV=WqwY07fMV-TuO8QMRnk555BJYEysv4urcugsELufHr4A@mail.gmail.com>
 <Zfm_oFLNgPHqJKtG@hovoldconsulting.com>
In-Reply-To: <Zfm_oFLNgPHqJKtG@hovoldconsulting.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 19 Mar 2024 10:12:25 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UgCNmeWJiwWAGj_jm78eeTNoo-_bx7QrqLfyDMJwRNKA@mail.gmail.com>
Message-ID: <CAD=FV=UgCNmeWJiwWAGj_jm78eeTNoo-_bx7QrqLfyDMJwRNKA@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] Bluetooth: qca: fix device-address endianness
To: Johan Hovold <johan@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	cros-qcom-dts-watchers@chromium.org, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Johan Hedberg <johan.hedberg@gmail.com>, 
	Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, Matthias Kaehlcke <mka@chromium.org>, 
	Rocky Liao <quic_rjliao@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Nikita Travkin <nikita@trvn.ru>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Mar 19, 2024 at 9:38=E2=80=AFAM Johan Hovold <johan@kernel.org> wro=
te:
>
> On Tue, Mar 19, 2024 at 09:10:38AM -0700, Doug Anderson wrote:
> > On Tue, Mar 19, 2024 at 8:30=E2=80=AFAM Johan Hovold <johan+linaro@kern=
el.org> wrote:
> > >
> > > The WCN6855 firmware on the Lenovo ThinkPad X13s expects the Bluetoot=
h
> > > device address in big-endian order when setting it using the
> > > EDL_WRITE_BD_ADDR_OPCODE command.
> > >
> > > Presumably, this is the case for all non-ROME devices which all use t=
he
> > > EDL_WRITE_BD_ADDR_OPCODE command for this (unlike the ROME devices wh=
ich
> > > use a different command and expect the address in little-endian order=
).
> > >
> > > Reverse the little-endian address before setting it to make sure that
> > > the address can be configured using tools like btmgmt or using the
> > > 'local-bd-address' devicetree property.
> > >
> > > Note that this can potentially break systems with boot firmware which
> > > has started relying on the broken behaviour and is incorrectly passin=
g
> > > the address via devicetree in big-endian order.
> > >
> > > Fixes: 5c0a1001c8be ("Bluetooth: hci_qca: Add helper to set device ad=
dress")
> > > Cc: stable@vger.kernel.org      # 5.1
> > > Cc: Balakrishna Godavarthi <quic_bgodavar@quicinc.com>
> > > Cc: Matthias Kaehlcke <mka@chromium.org>
> > > Tested-by: Nikita Travkin <nikita@trvn.ru> # sc7180
> > > Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> > > ---
> > >  drivers/bluetooth/btqca.c | 8 ++++++--
> > >  1 file changed, 6 insertions(+), 2 deletions(-)
> >
> > Personally, I'd prefer it if you didn't break bisectability with your
> > series. As it is, if someone applies just the first 3 patches they'll
> > end up with broken Bluetooth.
>
> It doesn't break the build, but yes, the device address would be
> reversed for Trogdor machines for two commits and possible break any
> previous pairings. That's hardly something to worry about.
>
> So I consider this to be acceptable for sake of clarity, and especially
> since these patches will be coming in from separate trees anyway.

I guess I have a different opinion on the matter. I often end up
cherry-picking stuff to older branches and I generally assume that
it's relatively safe to pick the beginning of a series without picking
later patches because I assume everyone has a goal of bisectability.
This breaks that assumption. IMO splitting up the Qualcomm Bluetooth
patch into two patches doesn't help enough with clarity to justify.


> > IMO the order should be:
> > 1. Binding (currently patch #1)
> > 2. Trogdor dt patch, which won't hurt on its own (currently patch #5)
> > 3. Bluetooth subsystem patch handling the quirk (currently patch #2)
> > 4. Qualcomm change to fix the endianness and handle the quirk squashed
> > into 1 patch (currently patch #3 + #4)
> >
> > ..and the patch that changes the Qualcomm driver should make it
> > obvious that it depends on the trogdor DT patch in the change
> > description.
> >
> > With patches #3 and #4 combined, feel free to add my Reviewed-by tag
> > as both patches look fine to me.
>
> I don't think it's worth spending more time and effort on this issue
> (which should have been caught and fixed years ago) for this.

Sure, that's your opinion and if the BT folks agree with you then they
are free to land the patches without my Reviewed-by on them. ;-) Mine
is not a strong Nak but I feel strongly enough that I'd prefer not to
have my Reviewed-by added without the re-organization.

-Doug

