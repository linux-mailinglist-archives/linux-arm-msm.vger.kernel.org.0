Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA69E21AE94
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2020 07:28:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726828AbgGJF0M (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Jul 2020 01:26:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727033AbgGJFZe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Jul 2020 01:25:34 -0400
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com [IPv6:2607:f8b0:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D39BDC08C5DD;
        Thu,  9 Jul 2020 22:25:33 -0700 (PDT)
Received: by mail-il1-x141.google.com with SMTP id a11so4075514ilk.0;
        Thu, 09 Jul 2020 22:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1cVDfB4v6J4ClnDi/ClpZbQ7jFtPWUjhu9zER11wqP8=;
        b=HKd+Cf8scR4pDATBdPv9J6bE79bp4QubfdMiZ3HWIifUJzxv80tzeOxDgAmi8ijh9e
         ba2qJSxjWfstzcK45BHkPk7sfCs9LLn2RCk5MfrIgvx/Kc6gAXyZAwomlnnti59FkegO
         dS0fyvUAXp5Bmw2w7tfN7uvWfKAsDNTqw4BFji62qVv+80eGdGB7KeY53GgSwsbvcIu5
         sYQDkjXaGNcgqkHw2Lsf993+nAZZVFJodIWkZVHQZ3TBFoOXAD6ZMGrGxDqSyYofdS3o
         OB3t6+/eV71jgo8m3oH7oAJ4gM5mYbIGPUbzmOoWqWuWRzZPM/1AUdIOF4XaCheguvh6
         LYPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1cVDfB4v6J4ClnDi/ClpZbQ7jFtPWUjhu9zER11wqP8=;
        b=EjeoVctYr/EJkMojp2xNl25Jelpq+ElU2pZ7HGSra4/vBwnlP3axfizC59PxAfZn90
         xcIjDNOoUkIwJfxfQkMwnq/kVZh/ONCjkKXAK38gYdXGG6aMo8VR89mWObMPEFyAPL6f
         KDWNFdBWV9fTBfq34HLwM/BKsPj57+f28EO+2sGy5eFL2Roq3N0L5YideeR2tYJyA7Q6
         P3u1cMEoWDrlTDzUo7xsGwK822GGjqMiqGDLRsqxz0o7QrGBVbET105aP5a0DAk5V5Xq
         dH0JO2lxeiPdXiDwv2JkZsXxY8wiCx3jhr5zaSUwsSMkvpnr4ksrciqniRZsJPGzw8hl
         b8tg==
X-Gm-Message-State: AOAM533OYzGkrvARRFdyW9oTyd52W5KzICgld4FeWSmRbmmR+JCyqvyP
        lHEC+yWI7LJ8zDRRvSRw6HdOLltCH5SlBwO10t0=
X-Google-Smtp-Source: ABdhPJw2WPKWI/PMXVjCNufYc0XZl4hZWcBY1ymfaGsvwrEOqU+aXVi0iLdPhxgpzq4Gj739y5aJg/JXvjAEf1A89Rk=
X-Received: by 2002:a92:c78d:: with SMTP id c13mr50475751ilk.85.1594358733111;
 Thu, 09 Jul 2020 22:25:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200709050145.3520931-1-bjorn.andersson@linaro.org>
In-Reply-To: <20200709050145.3520931-1-bjorn.andersson@linaro.org>
From:   John Stultz <john.stultz@linaro.org>
Date:   Thu, 9 Jul 2020 22:25:19 -0700
Message-ID: <CANcMJZDsfK35GxiRA0QBcX0wThY8w5tw2st_dZ=BJ9GJqnxePQ@mail.gmail.com>
Subject: Re: [PATCH 0/5] iommu/arm-smmu: Support maintaining bootloader mappings
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Laurentiu Tudor <laurentiu.tudor@nxp.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        iommu@lists.linux-foundation.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jonathan Marek <jonathan@marek.ca>,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jul 8, 2020 at 10:02 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> Based on previous attempts and discussions this is the latest attempt at
> inheriting stream mappings set up by the bootloader, for e.g. boot splash or
> efifb.
>
> The first patch is an implementation of Robin's suggestion that we should just
> mark the relevant stream mappings as BYPASS. Relying on something else to set
> up the stream mappings wanted - e.g. by reading it back in platform specific
> implementation code.
>
> The series then tackles the problem seen in most versions of Qualcomm firmware,
> that the hypervisor intercepts BYPASS writes and turn them into FAULTs. It does
> this by allocating context banks for identity domains as well, with translation
> disabled.
>
> Lastly it amends the stream mapping initialization code to allocate a specific
> identity domain that is used for any mappings inherited from the bootloader, if
> above Qualcomm quirk is required.
>
>
> The series has been tested and shown to allow booting SDM845, SDM850, SM8150,
> SM8250 with boot splash screen setup by the bootloader. Specifically it also
> allows the Lenovo Yoga C630 to boot with SMMU and efifb enabled.

This series allows the db845c to boot successfully! (Without it we crash!)
It would be really great to have this upstream!

For the series:
  Tested-by: John Stultz <john.stultz@linaro.org>

Thanks so much!
-john
