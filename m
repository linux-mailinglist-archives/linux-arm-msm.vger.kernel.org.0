Return-Path: <linux-arm-msm+bounces-10079-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE7E84C7CC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Feb 2024 10:44:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D5171B21288
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Feb 2024 09:44:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9006C21107;
	Wed,  7 Feb 2024 09:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PeO1YyL0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D64FD22EE8
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Feb 2024 09:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707299073; cv=none; b=cET17ery7mlDWaY6u8qF0oEshBVz9AuiHd5q40DmZiRnnt0uG5VlXRF5/JeUOak1jB8YC5aST5vnpKWQlyPTeklwOxYQigsiLoacUjJ6+QbIYRr+OFe2R2cdSXY8xh3H8e/Nk3ITxaxB0GJ3lNUkvnqQM/N9pxYsL+0uTEn0NVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707299073; c=relaxed/simple;
	bh=FBAjgNF5XCNxFSaP7LR1wyzwtafQZnJqZCxxZPnoGWc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=otEo5z9ohmzDhQTtzCD3vgw2mKaQmsFzQ+Y9LM37czBLoRiPeU7cwr8gaJdlviQdLkLkolw5V+DLD4UXTavFUgBUXSu8l9R2QJ0NOqWn9EUow6Oe7ybjTbwSq8CQpnMqA73nHGcsuq+AOQ1IMJX39jWf/4rYZqfYh5z9XIUqZIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PeO1YyL0; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-60484b96cd7so3844487b3.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Feb 2024 01:44:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707299071; x=1707903871; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6Qq9fKE0PbbyCrGJIA20pSw+ym9q88uvFFEEL0mTROA=;
        b=PeO1YyL0eKxskjhs3AShrz99FyPJNyyid0uHYjcO9u+IDJ61NYucQ6Rnz6cctTXUAe
         oZeJNRRsYVQvdQVWbrUqdKszARaFr+ogUZ8KFSpI5Mi1PYleCI3GE40J2hxpPy5QQebV
         DHt3en9vkfM+Q689eQby8WYgCrBYjlqVclESHYTvzzQ0O11sPEWH9LGXfii7tSOJIWzM
         PUNkvvI4SOyzzphlbm7wFoihWuLGWB0VLt6jRYYBeJf7gHsRT22Q4owb8baqE+Emt3GH
         kQC/Dz7Y9f/8YE1Z/JVDY5ZE0c/WGvLqvfxTy32Q4mnL+epqoNBZIVW/+AkJH0VW3ngk
         zitg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707299071; x=1707903871;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6Qq9fKE0PbbyCrGJIA20pSw+ym9q88uvFFEEL0mTROA=;
        b=m1sNil4I8W9IiRhCVwuxFIH1D/W7RznpnObVZjG9ldfzmArEHEjEyKUIAqdOWMnjlH
         vxrgMOnIQ9OMNAZEnv6N2C0leANYpe1y7kERmumPL6AqbEwiubq98WyPkh6Mre5RxFlC
         jsiv9fnh4/F3Pw7JwHgbu362D/EOsyBLzsNVLkt6IgPi+u14sXR4s4WOzP6autGqJwBp
         Y8ktQ4hTEJBkyeH086Zgv8WFJi9c+lUDYkGy1SO2cluZygQHjgKnwVOGwCna205Xp+yR
         k5Jij1tFq3iaVMi8HMc4jTefZ9oTJi1J8Zqnhzd1zheacfP+0U14isT6uOwkmtl/FoKE
         luHQ==
X-Gm-Message-State: AOJu0Yz7UMoqV11N+V9cGAa/wSGH3fgHPtvOkwtLC3N8S9E8J/0g0MhM
	hV0lj+GTu2tGBc2oDFD7REHpLXJdSDWAqudFIvJsYgcMiCV/3bI7mL1/Mrxf5TU1sQY6MjbHhYE
	EOm76MdeMlNKAVXgF8aZ5ToKLWCeE/zorvlEvNQ==
X-Google-Smtp-Source: AGHT+IGnNsEbsmiOhjkKEnxryb14NGX6I9zOgtrEXZxh49eoiYIjEQ/Cu/1+CeZbgwi0SgrY+47qDSRAYACNAXYqpdQ=
X-Received: by 2002:a81:4893:0:b0:5ff:7cca:a434 with SMTP id
 v141-20020a814893000000b005ff7ccaa434mr3711732ywa.51.1707299070789; Wed, 07
 Feb 2024 01:44:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240207-spmi-multi-master-support-v1-0-ce57f301c7fd@linaro.org>
 <20240207-spmi-multi-master-support-v1-1-ce57f301c7fd@linaro.org>
 <CAA8EJpqsJmv36=o1aTjVH6eMHXMg8BHNpiDvs+Q8YB23ezVGtQ@mail.gmail.com>
 <ZcMvFtAwQQjAZhk6@linaro.org> <CAA8EJprqWLX7_yWZzKp3FAKFGkSkk041f9hj1uXuRBrbH5APyQ@mail.gmail.com>
 <ZcNIddeG6VHxBEOQ@linaro.org>
In-Reply-To: <ZcNIddeG6VHxBEOQ@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 7 Feb 2024 11:44:19 +0200
Message-ID: <CAA8EJprgkM9fO967Swrzjf4PYuVoSpmXLU-zadN4eKhjez30Gg@mail.gmail.com>
Subject: Re: [PATCH RFC 1/2] spmi: Add support for multi-master
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 7 Feb 2024 at 11:08, Abel Vesa <abel.vesa@linaro.org> wrote:
>
> On 24-02-07 09:23:09, Dmitry Baryshkov wrote:
> > On Wed, 7 Feb 2024 at 09:19, Abel Vesa <abel.vesa@linaro.org> wrote:
> > >
> > > On 24-02-07 01:55:39, Dmitry Baryshkov wrote:
> > > > On Wed, 7 Feb 2024 at 01:34, Abel Vesa <abel.vesa@linaro.org> wrote:
> > > > >
> > > > > Some newer SPMI controllers support multiple bus masters.
> > > > > Such a master can control multiple slave devices. The generic
> > > > > framework needs to be able to pass on the master id to the
> > > > > controller-specific driver. So do that. The framework will
> > > > > check if the devicetree child nodes are actually bus masters
> > > > > and will register the devices for each master. The legacy
> > > > > approach will still be supported for backwards compatibility.
> > > >
> > > > Please remind me, are those two actual bus musters driving a single
> > > > bus in parallel or two SPMI buses being handled by a single device? In
> > > > the latter case this implementation is incorrect. There should be
> > > > multiple spmi_controller instances, one for each bus. Allocate them in
> > > > a loop and set ctrl->dev.of_node after allocating.
> > >
> > > It's two SPMI buses (two sets of wires) handled by the same controller,
> > > HW-wise.
> > >
> > > If we register two spmi controllers with the kernel framework, it will
> > > be HW inaccurate, because there is just one controller which has
> > > multiple masters.
> >
> > struct spmi_controller is a controller for a single bus. Inside your
> > device you have two SPMI buses, each can be controlled by its own
> > struct spmi_controller. Just like devices that control multiple I2C,
> > SPI or USB busses register a separate instance of the bus controller.
>
> Well, this is what this patchset is trying to do in the generic part.
> The SPMI controller supports multiple buses (HW-wise) and therefore SW
> implementation shouldn't be tied to single bus requirement.

SPMI controller doesn't support multiple buses. You have a device
which has two SPMI controllers inside. Just like all multi-bus
controllers.

>
> >
> > >
> > > I'm not saying it might not work. But, to me, it looks more like a hack.
> > >
> > > Basically, we would be mapping HW bus masters to kernel controllers.
> >
> > Buses, not just masters.
> >
> > >
> > > >
> > > > >
> > > > > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > > > > ---
> > > > >  drivers/spmi/spmi-mtk-pmif.c |  6 ++--
> > > > >  drivers/spmi/spmi-pmic-arb.c | 10 +++---
> > > > >  drivers/spmi/spmi.c          | 76 ++++++++++++++++++++++++++++++--------------
> > > > >  include/linux/spmi.h         | 10 +++---
> > > > >  4 files changed, 67 insertions(+), 35 deletions(-)
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



-- 
With best wishes
Dmitry

