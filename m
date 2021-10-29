Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0723C43F645
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Oct 2021 06:48:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231717AbhJ2EvN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Oct 2021 00:51:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:47924 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230362AbhJ2EvM (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Oct 2021 00:51:12 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3582B60FE3;
        Fri, 29 Oct 2021 04:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635482924;
        bh=BoBByOcvSLgCX1RdbukDiJVNfhHO4H2hVj+xawoRJn8=;
        h=References:From:To:Cc:Subject:Date:In-reply-to:From;
        b=QVEbkWinKSCeVNdifRS4nASsLVLX9yxNgHvbnfB90myOFins4DAsv1irrKC9UDU+K
         UuVfQGOfZZ8cn4pT8aoEadYCLFLjcvl35QaNiwLZcQiG1GpLn2jIoi/msJox8d8z7M
         e5CR5ZB6c0JpbqUkedNhRInx0q9RCNqjEO3oVEsdN+h69p3WQbPiKt8Yf+Valtt7y8
         0tCcoZcpc7tJDw/Yrar5h1U0pHjnN941o0GrzP/dh2MY2H8eV0I43DzAEzcXe/Fsp1
         bsWVbsdTVnVK+mTgUouNOqqOi/tKP+FA5zVkBr7nPczxHJPWALZ3tOgBL6Fa40VnBP
         XDIGyKsBYoLlQ==
References: <20211028211753.573480-1-jaschultzMS@gmail.com>
 <20211028211753.573480-3-jaschultzMS@gmail.com>
 <CAHp75Vfq7ZkXytuAFhGOMGuH7_AsXcYf9O=p30e4OUx+a4jMgw@mail.gmail.com>
User-agent: mu4e 1.6.6; emacs 28.0.60
From:   Felipe Balbi <balbi@kernel.org>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Jarrett Schultz <jaschultzms@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Jarrett Schultz <jaschultz@microsoft.com>
Subject: Re: [PATCH 2/3] platform: surface: Add surface xbl
Date:   Fri, 29 Oct 2021 07:45:28 +0300
In-reply-to: <CAHp75Vfq7ZkXytuAFhGOMGuH7_AsXcYf9O=p30e4OUx+a4jMgw@mail.gmail.com>
Message-ID: <87fsskqvvc.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


Hi,

Andy Shevchenko <andy.shevchenko@gmail.com> writes:
>  diff --git a/drivers/platform/surface/surface-xbl.c b/drivers/platform/surface/surface-xbl.c
>  new file mode 100644
>  index 000000000000..910287f0c987
>  --- /dev/null
>  +++ b/drivers/platform/surface/surface-xbl.c
>  @@ -0,0 +1,223 @@
>  +// SPDX-License-Identifier: GPL-2.0-only
>  +/*
>  + * surface-xbl.c - Surface E(x)tensible (B)oot(l)oader
>  + *
>
> First of all, do not include filename in the file.
>
> Capital L will be better to read and understand the
> abbreviation. Actually usually we do something like this:
>
> Extensible Boot Loader (EBL)

nah, this is silly Andy. It's just capitalized as eXtensible Boot
Loader, very much akin to eXtensible Host Controller Interface.

>  +static const struct attribute_group inputs_attr_group = {
>  +       .attrs = inputs_attrs,
>  +};
>  +
>  +static u8 surface_xbl_readb(void __iomem *base, u32 offset)
>  +{
>  +       return readb(base + offset);
>  +}
>  +
>  +static u16 surface_xbl_readw(void __iomem *base, u32 offset)
>  +{
>  +       return readw(base + offset);
>  +}
>
> Either use corresponding io accessors in-line, or make first parameter
> to be sirface_xbl pointer. Otherwise these helpers useless.

I agree with passing surface_xbl point as first parameter, but calling
the accessors pointless is a bit much. At a minimum, they make it easier
to ftrace the entire driver by simply ftracing surface_xbl_*

-- 
balbi
