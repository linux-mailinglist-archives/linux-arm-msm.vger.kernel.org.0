Return-Path: <linux-arm-msm+bounces-16596-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF4989A5B2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Apr 2024 22:37:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A6495282F45
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Apr 2024 20:36:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48F51172BD0;
	Fri,  5 Apr 2024 20:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tNM9bvvX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68269132C2B
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Apr 2024 20:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712349415; cv=none; b=iroqUyrzJMMzRMzHeJoP2/iAtnMTRbGGPWvOAArP2krB3BLH45wylDsyqRyDlqPMFI9lqDLmaqmhHJPJbSm0e/8yShjQNSbhmtWra8LD+gYFNLPaxJTgWihSh1W3GBYeBSO2lK0MA3kCOfxDB/lOKEiQeoELkYMmbJIdxX2g0x8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712349415; c=relaxed/simple;
	bh=LU/xQB6V/25bLcvayMCENtNqmkx93CwiDahm1ICVE0U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WMpR2+NdNaBOIyHnKxiJ52SdeJi03iq8IO6Af6McTStS7fmr8JV7afymGNqW0vio8UM8SwIzNK73McLlDDKvRuunW2F9OvfXct2MHo1OEnsB0CTHZyFNs1FZWeVQqecxVULNl/TK9vJ/66MajNHT9NjIQyrXNYW78eemwBchfYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tNM9bvvX; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-dcbd1d4904dso2708822276.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Apr 2024 13:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712349412; x=1712954212; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/86pn6vkv7rN4o5AcWzNGDdSkHGVI9X5IaswAWqNOJE=;
        b=tNM9bvvXfdTuhYlt4/Fg14FY0fgOIobs2m0IsRCnESfybhR1ysguuBGP7b9IjTppSz
         EUL15xpSU8frl7hS5vYiqUmGh8uNnFCw7GSkoUsvjbmBFfpn4XRnzKdGr1gKDANVu/Op
         gXcHwfCo5I5SiNsPZgWGC3isGf8YoUKRhrmj821aPEXuSk1gv6nl4PxNPZLG0ApK7cjA
         i3hqAGDhEfcYiVwoKfa5xuppBP+A485DkDxREu86lO/t+mV1BFx5MgtkFwMYqklwQXC2
         Nh3h23ZOr4j/MNPVjtJXriUW1/f94cSl75YTnkfdbOyymr4+d0BU65XHl3AJtux4dqI5
         IKqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712349412; x=1712954212;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/86pn6vkv7rN4o5AcWzNGDdSkHGVI9X5IaswAWqNOJE=;
        b=PCEJLkDK4eZ0DVdoRvkPvwsFOPPj5BijGG/S9zWyPU3+qNfXd8nVMtonUU4nn3Jl1d
         MtdxciJKAIZWPs7VopnCYoDG1/OXn/Bexwpu/rvqESVswSftLLmzmKJn4P7xlqU3WGuR
         ke+qQDPKflghJoQjFItvC/hrLTIanSm1wDWg2fsdR/RjrS88CCmv9nr2bSd0oZzhg/Qs
         DyL0OBVtTKUAtwjpS/SLFkeUISSBCN7MvJnKNxPr+3OL9NqP9cjGC/eT2yv+p3UWTrw7
         5YZInOTaALH1usqlESRIUO+9azF13f543O6gOjd3fPZOG/SjFUQ5Qwx48V9FgdC+uPMF
         eayw==
X-Forwarded-Encrypted: i=1; AJvYcCUKGbxKxHHOj/74T4e5iauYMhZiJPaguRtBV0GUncYMDJUcUHQCPEmPoe29wb9des4JY/NJKMzYhoCeFhpbOk8BUZ2YRKDT5yFpAkegMw==
X-Gm-Message-State: AOJu0YyV7wl6grApM0NnBl8R8h5kFS7e7+tPkShpFPko23io8C3GOE4G
	EyhFkyvxXd5KBSAB5bz6AaxaOT3r6G/UhuXiHZHrhr+PZXvesadJwCtbzEAZT7EbUA4bVULKOOI
	rIIBX9sCnIvWr9/M/A0z70Gunf8/PTYTyJV2AZg==
X-Google-Smtp-Source: AGHT+IFRO8tWoCg2SGSzILZMs3Drm7SVEupIjTSLzOvFEDr2eDMtDFbdSU80xT/alKoBfHZaROUifya2GOHP8yCKs4U=
X-Received: by 2002:a25:af10:0:b0:dda:aa3e:73fc with SMTP id
 a16-20020a25af10000000b00ddaaa3e73fcmr2428953ybh.41.1712349412380; Fri, 05
 Apr 2024 13:36:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240404051229.3082902-1-quic_kriskura@quicinc.com>
 <20240404051229.3082902-3-quic_kriskura@quicinc.com> <Zg5VDnbaaBXJyRjV@hovoldconsulting.com>
 <f16e1280-8f7e-40a7-ab45-9acaeb3e90cb@linaro.org> <2024040455-sitting-dictator-170c@gregkh>
 <Zg9THGBRuppfw4y+@hu-bjorande-lv.qualcomm.com> <2024040558-undercut-sandbar-7ffc@gregkh>
 <ZhBQhvieHGtMOSEz@hu-bjorande-lv.qualcomm.com>
In-Reply-To: <ZhBQhvieHGtMOSEz@hu-bjorande-lv.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 5 Apr 2024 23:36:41 +0300
Message-ID: <CAA8EJpr94_uCHoJyQd2uQyZ35xXixPPMHPVGXciZn+GftUUjnA@mail.gmail.com>
Subject: Re: [PATCH v19 2/9] usb: dwc3: core: Access XHCI address space
 temporarily to read port info
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Johan Hovold <johan@kernel.org>, 
	Krishna Kurapati <quic_kriskura@quicinc.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Felipe Balbi <balbi@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, quic_ppratap@quicinc.com, 
	quic_jackp@quicinc.com, Johan Hovold <johan+linaro@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 5 Apr 2024 at 22:27, Bjorn Andersson <quic_bjorande@quicinc.com> wrote:
>
> On Fri, Apr 05, 2024 at 06:43:56AM +0200, Greg Kroah-Hartman wrote:
> > On Thu, Apr 04, 2024 at 06:25:48PM -0700, Bjorn Andersson wrote:
> > > On Thu, Apr 04, 2024 at 02:58:29PM +0200, Greg Kroah-Hartman wrote:
> > > > On Thu, Apr 04, 2024 at 10:07:27AM +0200, Krzysztof Kozlowski wrote:
> > > > > On 04/04/2024 09:21, Johan Hovold wrote:
> > > > > > On Thu, Apr 04, 2024 at 10:42:22AM +0530, Krishna Kurapati wrote:
> > > > > >
> > > > > >> +static int dwc3_get_num_ports(struct dwc3 *dwc)
> > > > > >> +{
> > > > > >> +    void __iomem *base;
> > > > > >> +    u8 major_revision;
> > > > > >> +    u32 offset;
> > > > > >> +    u32 val;
> > > > > >> +
> > > > > >> +    /*
> > > > > >> +     * Remap xHCI address space to access XHCI ext cap regs since it is
> > > > > >> +     * needed to get information on number of ports present.
> > > > > >> +     */
> > > > > >> +    base = ioremap(dwc->xhci_resources[0].start,
> > > > > >> +                   resource_size(&dwc->xhci_resources[0]));
> > > > > >> +    if (!base)
> > > > > >> +            return PTR_ERR(base);
> > > > > >
> > > > > > This is obviously still broken. You need to update the return value as
> > > > > > well.
> > > > > >
> > > > > > Fix in v20.
> > > > >
> > > > > If one patchset reaches 20 versions, I think it is time to stop and
> > > > > really think from the beginning, why issues keep appearing and reviewers
> > > > > are still not happy.
> > > > >
> > > > > Maybe you did not perform extensive internal review, which you are
> > > > > encouraged to by your own internal policies, AFAIR. Before posting next
> > > > > version, please really get some internal review first.
> > > >
> > > > Also get those internal reviewers to sign-off on the commits and have
> > > > that show up when you post them next.  That way they are also
> > > > responsible for this patchset, it's not fair that they are making you do
> > > > all the work here :)
> > > >
> > >
> > > I like this idea and I'm open to us changing our way of handling this.
> > >
> > > But unless such internal review brings significant input to the
> > > development I'd say a s-o-b would take the credit from the actual
> > > author.
> >
> > It does not do that at all.  It provides proof that someone else has
> > reviewed it and agrees with it.  Think of it as a "path of blame" for
> > when things go bad (i.e. there is a bug in the submission.)  Putting
> > your name on it makes you take responsibility if that happens.
> >
>
> Right, this is why I like your idea.
>
> But as s-o-b either builds a trail of who handled the patch, or reflects
> that it was co-authored by multiple people, I don't think either one
> properly reflects reality.
>
> > > We've discussed a few times about carrying Reviewed-by et al from the
> > > internal reviews, but as maintainer I dislike this because I'd have no
> > > way to know if a r-b on vN means the patch was reviewed, or if it was
> > > just "accidentally" carried from v(N-1).
> > > But it might be worth this risk, is this something you think would be
> > > appropriate?
> >
> > For some companies we REQUIRE this to happen due to low-quality
> > submissions and waste of reviewer's time.  Based on the track record
> > here for some of these patchsets, hopefully it doesn't become a
> > requirement for this company as well :)
> >
>
> Interesting, I was under the impression that we (maintainers) didn't
> want such internally originating tags.

But why? It just means that the patch has been reviewed. In some rare
cases we explicitly ask a developer to have all the patches reviewed
before sending them upstream. In such a case having an R-B tag
fulfills the expectation of the maintainer: it shows that another
engineer has reviewed the patch.

> If that's not the case, then I'd be happy to adjust our internal
> guidelines.

-- 
With best wishes
Dmitry

