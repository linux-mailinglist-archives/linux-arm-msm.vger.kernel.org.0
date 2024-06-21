Return-Path: <linux-arm-msm+bounces-23601-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2329B912895
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 16:55:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 974291F23B20
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 14:55:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 913E8383A5;
	Fri, 21 Jun 2024 14:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cOQXaqfI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D852C69B
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Jun 2024 14:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718981703; cv=none; b=ie0K9aFsm+qryPIF6/k+t804yHjIGF/J09je3dkblICOAt/AuU44RDFRqd+6H/PLxIfVmGdtA0wQlti8LJCMYXQR1atlh1NRmuzAyCk82r7Xx8xm7y+3ksXxnlPFZvoo/reTDVETTuPWUw7Vmepv4dvb/jWC+8FMvrRm+aRcTLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718981703; c=relaxed/simple;
	bh=sA2EemPlAa1+90qgqq7ZJOodmKmw2IBbHOSXPvS/iWU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aBptKCssCgwPpLR2cO/F1vjka/WQPhPrJBpaopbahYIZeE5cnbY2qTA2+kreMwhDw4soFiLbFvDfdTOYKkkJnd5R4cQiLPjep3GXsoQowp3vnVBs7y9HZ0s8cmLvNe2sM8eyabRNrVP/45zLSPYCBfsc7Ex8pHqPP0f6j9aTt3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cOQXaqfI; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718981700;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CLJWp7apiozZzbnDE4rKsBuGgxng8bCCQ3VO68nlf8k=;
	b=cOQXaqfIGn8vGIMmjRpQdmjiJg7ndbxxCIHmNrr8L7Cmy7FSmclkblWRGrpiXg8FHOPO8z
	l/Q4D2HH9H/dNDYew9EJfjFFqDcRJpKtSZw1tVMg8xlwWNf+tjb9goDdUez1uG97KAMrr2
	AiZt5q0OOXSkThObrIX37sq8luNFvpE=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-120-Y7EAtxb5OYWMK26xbLaWKw-1; Fri, 21 Jun 2024 10:54:59 -0400
X-MC-Unique: Y7EAtxb5OYWMK26xbLaWKw-1
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-44495c6cc92so22498711cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Jun 2024 07:54:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718981699; x=1719586499;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CLJWp7apiozZzbnDE4rKsBuGgxng8bCCQ3VO68nlf8k=;
        b=lEtKm092UnZ3s8beuN4R4oPsLHGGuMLR+5fAv3s56vA8BKYlFJLfUPbwE8SUnQR/L/
         CAXcX9XpRGFm04fBe3UQY2896AHKiiJY6KUdvq6F7gARZBrhMuPQv+rXB7LlZflEH0IG
         i5PF6PQ4ur21lY9qJDRJm89lVfgnvJurxHT/zz5X0VxIAedBxaQ+V3wGkRbupyxbGwrC
         rWZElbihipSR5/d309crMCYLmbkLWnEkoW4RMdoZQ7cUQFYXO7g+QgKRXaLZXmLIvqVB
         QYGglya7tpVWwz4dwGYT4JGbzb9DPEtsJRcc2HKEGQ4N7GzbqJMmsaTa8xpXIz9HFzTn
         ylvA==
X-Forwarded-Encrypted: i=1; AJvYcCWKl4WSaZdJ/pA32TQLysVotRezr6AkaqJ0I16Cf5kQ+AwpftZAHSRauSUdO1jGkAIgnDM6ydxw0uk0Ec61raf/trjWJ67Z19GZTqMfIw==
X-Gm-Message-State: AOJu0Yy1qD/kTieszTUAZrKYlhttaK3alBkyLs8u70LXDa8sXnwpQ1Sc
	HBjgRRxkct8q0U98Dv3YVfuDDLt8mRUZif2Sl41vZuiwCLIomets2mmDcHQqMsi3QgMV4Bn2vH3
	qPU8MunKAJcGn+CznZXb/sr0eSUFGRtdsXMCzeo9kJwpz7IeRv+1Yjay8Sojrt7c=
X-Received: by 2002:a05:622a:1344:b0:444:a1f7:c76c with SMTP id d75a77b69052e-444a7a4a690mr72023811cf.50.1718981699056;
        Fri, 21 Jun 2024 07:54:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGA/mZMLmC2PMvsA5TPz1W93o/nYaAFsRLxZI7ixuWF5tBXy17kgJF52R2CO4IPg91XdCLzfA==
X-Received: by 2002:a05:622a:1344:b0:444:a1f7:c76c with SMTP id d75a77b69052e-444a7a4a690mr72023681cf.50.1718981698558;
        Fri, 21 Jun 2024 07:54:58 -0700 (PDT)
Received: from x1gen2nano ([2600:1700:1ff0:d0e0::13])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-444c2c88de3sm11735691cf.87.2024.06.21.07.54.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 07:54:58 -0700 (PDT)
Date: Fri, 21 Jun 2024 09:54:56 -0500
From: Andrew Halaney <ahalaney@redhat.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sa8775p-ride-r3: add new board file
Message-ID: <t7ztnomeyebome2xylbp4jygwzod35bqn3rwj4gnivt5rjl7b7@cuuqafqzecyf>
References: <20240619183255.34107-1-brgl@bgdev.pl>
 <20240619183255.34107-3-brgl@bgdev.pl>
 <henuash23dwkj5fcmub6sabygwo4kam7fgots2pp2j3eu4asuk@cn3o7a62lo74>
 <CACMJSes7XcXPZt8NgZm9mQ7h2B6A=+mL13gpZEHY6UnTFqXdOA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACMJSes7XcXPZt8NgZm9mQ7h2B6A=+mL13gpZEHY6UnTFqXdOA@mail.gmail.com>

On Fri, Jun 21, 2024 at 03:14:13PM GMT, Bartosz Golaszewski wrote:
> On Thu, 20 Jun 2024 at 18:04, Andrew Halaney <ahalaney@redhat.com> wrote:
> >
> > > +
> > > +&mdio {
> > > +     compatible = "snps,dwmac-mdio";
> > > +     #address-cells = <1>;
> > > +     #size-cells = <0>;
> > > +
> > > +     sgmii_phy0: phy@8 {
> > > +             compatible = "ethernet-phy-id31c3.1c33";
> > > +             reg = <0x8>;
> > > +             device_type = "ethernet-phy";
> > > +             interrupts-extended = <&tlmm 7 IRQ_TYPE_EDGE_FALLING>;
> > > +             reset-gpios = <&pmm8654au_2_gpios 8 GPIO_ACTIVE_LOW>;
> > > +             reset-assert-us = <11000>;
> > > +             reset-deassert-us = <70000>;
> >
> > I need to read your other series still wrt "ocsgmii", but any chance you
> > have access to docs indicating the reset timing? I've never had docs for
> > the specific Marvell phy on the prior board or the Aquantia one on the
> > new board...
> >
> 
> I have but they're not public. :(
> 
> > Boot time is something automotive is always concerned over, so I just
> > want to make sure that this timing isn't any longer than it needs to be.
> > Right now it looks the same as the Marvell phy's in the "v2" boards etc
> > and that made me raise my eyebrows.
> >
> 
> That's a good point but what else can we do? This should typically
> execute in its own thread anyway.

I guess all I'm asking is are these timings accurate? Ethernet is often
considered one of the things that needs to be up early (think about
getting the vehicle reverse status off the network for example), so in this case
I meant to consider it part of the "boot time".

If this is actually the recommended values then we're good, just wanting to
make sure we're not reusing the Marvell values (which may or may not be accurate
as I don't have the doc) since they could be larger than necessary, etc!

Dealing with the phys is a long pole in the time to get ethernet up in
my benchmarks in the past, that's why I made this change etc:

    https://lore.kernel.org/netdev/20231127-net-phy-reset-once-v2-1-448e8658779e@redhat.com/

If these reset numbers are accurate then we're all good here, just
confirming since they match the "r2" version which uses the marvell phy
instead of the aquantia phy, and that seemed like a suspicious
coincidence!

Thanks,
Andrew


