Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 105DC2F45B6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Jan 2021 09:07:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725998AbhAMIGV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Jan 2021 03:06:21 -0500
Received: from mail.kernel.org ([198.145.29.99]:59056 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725949AbhAMIGV (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Jan 2021 03:06:21 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0BA7A2333B;
        Wed, 13 Jan 2021 08:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610525140;
        bh=Alzz0M7HPrwFAwKGdcZMCSI7QCWigUYNKGF1r+SA0eg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=KbrONTYyabwBIbrDB8RpM1AnhUNLG2KisiBIlsWBzPJtLJd2iS87M6cAtBYtWcwoz
         b2SkNSan3UZ9QtwTBy1MQLNzKav3DcGFh2ruiyk55o/4J5Sn4B6ain6X4FIXwW1lEi
         VMqQVcxKQVnCYVazE4hND8XWV7cxM+yTUp2LGB3RpUs1yFsK9CYV1FZy4jFFvmiudV
         5LrYC840qq5juTxft8hJIKyxV8U1H/KEg609DwWymFQhVCprqsKfaNsRA1J+KKA8IA
         u+ZIo99fh6V4F7RiY50HUH2PCpx696Ej50RgyGKKnoAeo39WhrN4USDalKw0glhdpS
         4ec7GX4L8nLvQ==
Received: by mail-oi1-f169.google.com with SMTP id w124so1225778oia.6;
        Wed, 13 Jan 2021 00:05:40 -0800 (PST)
X-Gm-Message-State: AOAM530R30Zitkpl3tZWeVJ6mQQ4FKkjy4cCJssgk4J2XxeKpqlJ/U6k
        Ac5A7RxZ9ox4rhWBAE3aZrjfAbmf2Ik1PlCyYAw=
X-Google-Smtp-Source: ABdhPJyNVCdIK7R8b9QgE46aj8NKwV72zrszTQgMRnTLfVfcjVNY9F65+xTqtCuNdx1Y/ECwmNhUsqB45daUMiJy1K0=
X-Received: by 2002:aca:e103:: with SMTP id y3mr491018oig.11.1610525139188;
 Wed, 13 Jan 2021 00:05:39 -0800 (PST)
MIME-Version: 1.0
References: <20201016090833.1892-1-thunder.leizhen@huawei.com>
 <20201016090833.1892-2-thunder.leizhen@huawei.com> <20201128045328.2411772-1-f.fainelli@gmail.com>
 <CAK8P3a1_5RgcPz+bgo1bbUBk8NTJd=1-Y5-=CsQYkFgLfTE3_A@mail.gmail.com>
 <9c6c6b7e-8c39-8c49-5c87-9b560c027841@broadcom.com> <CAK8P3a2XYk8D80XARrpUSBHk1yye3KHXOdaQge4HNSZZOC=xKw@mail.gmail.com>
 <CACvutz9v+TBUbrCo3X-u5ebbs04nR0y0yQN3qWfSAyZVy9RM2g@mail.gmail.com>
 <c38cf11a-ed1d-d150-52fb-e3b4a0a30712@gmail.com> <CAK8P3a1TViQopQNFE4+Dtac0v2CneGiy22WYu5BuYv8HX2r8Lg@mail.gmail.com>
 <18112862-a42e-95b1-39a3-2e414667f39b@broadcom.com> <CAK8P3a2+EfOKAo3HLb+_qd-gnqWD55dyW0juSw1TM8jHKiZYoQ@mail.gmail.com>
 <8aaa7bb9-a81e-cd0e-8e67-360515313748@broadcom.com> <3fc2b0174965ec6b911ab4bd73da1525@mail.gmail.com>
In-Reply-To: <3fc2b0174965ec6b911ab4bd73da1525@mail.gmail.com>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Wed, 13 Jan 2021 09:05:22 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3SdvOk=chp39-ypvHsqCJkuqFG1qn+tyJ3h71OrzgDWw@mail.gmail.com>
Message-ID: <CAK8P3a3SdvOk=chp39-ypvHsqCJkuqFG1qn+tyJ3h71OrzgDWw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: broadcom: clear the warnings caused by
 empty dma-ranges
To:     Bharat Gooty <bharat.gooty@broadcom.com>
Cc:     Ray Jui <ray.jui@broadcom.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        devicetree <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Scott Branden <sbranden@broadcom.com>,
        Ray Jui <rjui@broadcom.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Zhen Lei <thunder.leizhen@huawei.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jan 13, 2021 at 4:42 AM Bharat Gooty <bharat.gooty@broadcom.com> wrote:
>
> Hello Ray,
>
> I had cross checked with Design and integration team.
> Yes we can set the "dma-rages" to 40 bit DMA ranges. Tested, it is working.
>
> -----Original Message-----
> From: Ray Jui <ray.jui@broadcom.com>
>
> Bharat can correct me if I'm wrong, but I don't think we have a bug in
> the USB DMA engine that causes it can only address 32-bit. I believe we
> can set dma-ranges size to 40-bit here.
>
> The dma-range property is though required to be specified, instead of
> leaving it as empty, with the use of IOMMU. That seems to be a v5.10
> specific behavior as I described below.

Ok, thanks for double-checking. I had misremembered the version
that actually went into the as the one that used 64-bit dma-ranges
and thought that was what broke, rather than the version without
dma-ranges.

If any of you want to send me that bugfix directly, or have Florian
pick it up through his fixes branch, I'll make sure we get it into v5.11.

       Arnd
