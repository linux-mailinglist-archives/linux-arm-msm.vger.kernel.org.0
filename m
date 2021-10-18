Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDDE14313CC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Oct 2021 11:48:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231509AbhJRJus (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Oct 2021 05:50:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231468AbhJRJur (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Oct 2021 05:50:47 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2920C06161C
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Oct 2021 02:48:36 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id r2so15546542pgl.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Oct 2021 02:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=seDD0pVAMhI0tBYCYOSvIqPKU78pUT5wrFkSkauUU5M=;
        b=PCBiJ06UJvfGUL6WUoapZ8C3OlbURHsxTSMADkSaJwle5nEWTViYPMWcYbU11J5pKB
         KUUyMWX1RMUnaY8pqescaeMeaDxenQs1NWPgAP/5kZ1uBgV3Hw3DRBQCW1i3+c7AeigE
         UXtwBnHdx4QvCQnxWZqbYNhsbijUSUfbzWIv2zU3VKMg9dg4JfCi9tdzDiZgcP2ozCNf
         uQGK9HZmnNLTCA+UM9vpNnm7oatXMfBHO8aBa36BiZEVVedfCiTkLc8y+CMMX05LQRwb
         twKuuBHgKkFJMyx8XbBibcGEnyXFLB12y7BC7SZa8ODo6D8iWOi2IBckKR5oVDNLfSj+
         IWTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=seDD0pVAMhI0tBYCYOSvIqPKU78pUT5wrFkSkauUU5M=;
        b=thXu9K0nqfJDet4sSYzUWrWrF15ioRHCH+rSgCdK6HD/aseBJ5WP5Y//tq5NHM2QwR
         /XxU1S7kHRBxBVjBhJw1WeCmy9JuJ0eIy00PGBEZ54lA8RplIylljUY5FtssMqVoMMDV
         P6e3UgQYTk66IuIlhiUHt6oAQg9tAcpiIxGpL2gOF/nqwfTumGexCSBvPre6pJXGsrT+
         kOgsOo6HP/wKchiMM1ltfp/ZCNkKI15LksjKtjHb9uG4BKlxM/50VZbbnzBXZz1Q5Byx
         cpNZtKnbG5WRi4lUFaBRG+fMWylXaKztBOHuEB9D2tg7ivwvw1OFn23rTc+MSBVOhQpu
         Um8Q==
X-Gm-Message-State: AOAM530H8KO7AMT4X86hAodk/GRCmLed6Yoks48nsDaZyZG0pe5QzCBn
        vHan0X3AXVBwksHMKfPZNWdeTYBt9D8aZbGMvXEgBA==
X-Google-Smtp-Source: ABdhPJxsEM61zYzD947zCbIvgn/WYcH1+4vFUNJUDvHPcqfnI3NIVcUPM8eZKjLYecgdIHdMrriTn++SItXcaEHe/eY=
X-Received: by 2002:aa7:9e9e:0:b0:44c:c821:c132 with SMTP id
 p30-20020aa79e9e000000b0044cc821c132mr27420534pfq.61.1634550516162; Mon, 18
 Oct 2021 02:48:36 -0700 (PDT)
MIME-Version: 1.0
References: <CAAP7ucLJYfftfCuKxnW8Q7-duyEuGgHA5gk+h2JyyAzNq75QSA@mail.gmail.com>
 <da0ed6cf2c0a07295a09758259521b03a7bcdc19.camel@bootlin.com>
 <CAAP7ucLu9JJjo+gN6fsSZVGKHX6VGoYkgBmsA0s9qsA-hdH6=A@mail.gmail.com>
 <2c34a05884cd68eb08e061e9d4d1aa572d78f03c.camel@bootlin.com>
 <CAAP7ucLVBn3Vk25jqL18Qxtsd=PmCpTiNY5j_pgai4BBbTOGWA@mail.gmail.com>
 <CAMZdPi8QXrjN6VYU1VrGeOBhvVSnxopioM7POEOcS5ywsSFDHQ@mail.gmail.com>
 <CAAP7ucKL+5oUmidVp1W-oOyfuuYR3F-11GuNdxLX9iYijaL6_A@mail.gmail.com> <CAAP7uc+5=GMGgz3MKfSWaAtes1WwCCx+6iYhb058ZUr0=A52cg@mail.gmail.com>
In-Reply-To: <CAAP7uc+5=GMGgz3MKfSWaAtes1WwCCx+6iYhb058ZUr0=A52cg@mail.gmail.com>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Mon, 18 Oct 2021 11:59:21 +0200
Message-ID: <CAMZdPi9cbDVWVxvimg-uc_TRvskrxbjEQ4AxdLjA57Ewm2tSPA@mail.gmail.com>
Subject: Re: Sierra Wireless EM9191 integration issues in mhi+wwan
To:     Aleksander Morgado <aleksander@aleksander.es>
Cc:     Thomas Perrot <thomas.perrot@bootlin.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Hemant Kumar <hemantk@codeaurora.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Aleksander,

On Mon, 18 Oct 2021 at 11:14, Aleksander Morgado
<aleksander@aleksander.es> wrote:
>
> Hey all,
>
> > [    7.056113] mhi-pci-generic 0000:01:00.0: MHI PCI device found: sierra-em919x
> > [    7.063298] mhi-pci-generic 0000:01:00.0: BAR 0: assigned [mem
> > 0x600000000-0x600000fff 64bit]
> > [    7.071846] mhi-pci-generic 0000:01:00.0: enabling device (0000 -> 0002)
> > [    7.078671] mhi-pci-generic 0000:01:00.0: using shared MSI
>
> In this specific setup we request 4 MSI vectors through
> pci_alloc_irq_vectors(), but only end up allocating a single one (i.e.
> mhi_cntrl->nr_irqs = 1). Could that be related to the problem somehow?

It shouldn't, we have the 'shared IRQ' fallback which is used when we
can not setup multiple MSI, and this works with other SDX55 based
modems.

Regards,
Loic
