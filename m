Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AD6C36E2E9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Apr 2021 03:22:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229888AbhD2BX3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Apr 2021 21:23:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229794AbhD2BX2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Apr 2021 21:23:28 -0400
Received: from mail-vk1-xa2b.google.com (mail-vk1-xa2b.google.com [IPv6:2607:f8b0:4864:20::a2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E133EC06138B;
        Wed, 28 Apr 2021 18:22:42 -0700 (PDT)
Received: by mail-vk1-xa2b.google.com with SMTP id v3so5882437vkn.7;
        Wed, 28 Apr 2021 18:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ViBgxGCT8wGE7JBD0u1eysSz+PhOzrYgLess3huZ56U=;
        b=vh6nUW7529gpJAy6rJnyn5l8oAN1nIzkQSassiRMQIeF7JNZK10rY3ma+D4oogLfFf
         7OAXcjtWr7gw0x/GBb+SRFuepDyElMjx3E2bwqkpJEFU0418uw21mvneNn60e3Te1X0z
         No2PY02Wfn8qDTIp5oOprlMJiT7+rJYbJz8FpOjUU8RDil4gWiFmSBZHZyqq6+0epLwB
         EXoK7yiH3sr46ZhaDlMCYsNK/e43/3HXkyS78M1beKb1jeH2rVwDAGDz9E89XGoj0aL3
         g+X/OdPPu8OR7GECPBlnucmZ7cGrm51H20zagJI85LkFAXc1Q1ku42F0tqhcH4j8tBYl
         BYhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ViBgxGCT8wGE7JBD0u1eysSz+PhOzrYgLess3huZ56U=;
        b=KyoS/muOveRPOd2DXqY3ixzp/9PZWCaAEqEY0WoyiX+4UJezITo7iiKAppKLOw8/PG
         GER/jvSm864vXXDl33YSoVHm6ppCo/11Iv3qn3RkLERVZXekmYivnUhAfIzPL07j0f6c
         +gEbXpBVr4ekwkr2jeBugPZrJhmSL20yOUpZcx7HM/YSM5ztqn1jlPlRE7qIcpoNWusx
         rdVHDWbEXM6F7DNryouWyvYA3dizA7Epo/zxOE+Ev/7sbSwXDYXt6XlwVmdi4gCnbuiu
         CC5StFfq8SxehhU6TnHQQA7CnXfbPlEno1MgahL3UVceKWvlTQaAuCRJZnhjOPWZWZM+
         9CfQ==
X-Gm-Message-State: AOAM530swj34UxzSTpa4b29UnPX2jjqQTL1A3bLpZBkw5VSbrrX7/vR0
        Ki054C8ZU5++9nshjwNm0kPqgBPlwFTUVEUK+4M=
X-Google-Smtp-Source: ABdhPJzZGFapknzKZPv3UlZvoGIZbQzR2Gyq6MTd1Tub533B/q5iV3dkRPIhqnicdI8UukonEHQHi5JIcagHmwJ0pPc=
X-Received: by 2002:a1f:a24c:: with SMTP id l73mr30003357vke.0.1619659361614;
 Wed, 28 Apr 2021 18:22:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210421065501.3134-1-jarvis.w.jiang@gmail.com> <CAMZdPi-H=mnH9SFQZ7XQ8fjb0VtYbaWKGFhoXYyurDAB+RpQ5w@mail.gmail.com>
In-Reply-To: <CAMZdPi-H=mnH9SFQZ7XQ8fjb0VtYbaWKGFhoXYyurDAB+RpQ5w@mail.gmail.com>
From:   Jarvis Jiang <jarvis.w.jiang@gmail.com>
Date:   Thu, 29 Apr 2021 09:22:29 +0800
Message-ID: <CAPncsNNQKC_o4ZeP7PcfPWK5X70b5+f3oBNFRYaWcjJj1hPjgw@mail.gmail.com>
Subject: Re: [PATCH v1] bus: mhi: pci_generic: T99W175: update channel name
 from AT to DUN
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     Manivannan Sadhasivam <mani@kernel.org>,
        Hemant Kumar <hemantk@codeaurora.org>,
        open list <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Chi-Wei Chen50 <cchen50@lenovo.com>,
        Mark Pearson <mpearson@lenovo.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Apr 28, 2021 at 4:30 PM Loic Poulain <loic.poulain@linaro.org> wrote:
>
> On Wed, 21 Apr 2021 at 08:56, Jarvis Jiang <jarvis.w.jiang@gmail.com> wrote:
> >
> > According to MHI v1.1 specification, change the channel name of T99W175
> > from "AT" to "DUN" (Dial-up networking) for both channel 32 and 33,
> > so that the channels can be bound to the Qcom WWAN control driver, and
> > device node such as /dev/wwan0p3AT will be generated, which is very useful
> > for debugging modem
> >
> > Signed-off-by: Jarvis Jiang <jarvis.w.jiang@gmail.com>
>
> Ok, it seems the spec claims it's a DUN channel, but all vendors use
> it for AT protocol, so it's fine (and correctly handled by the
> mhi_wwan_ctrl driver).
>
> Could you please add a Fixes tag since it fixes your previous commit?
>

Sure, I will add it in the next patch.

thanks,
Jarvis

> with that
>
> Reviewed-by: Loic Poulain <loic.poulain@linaro.org>
>
>
>
> > ---
> >  drivers/bus/mhi/pci_generic.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
> > index 7c810f02a2ef..8c7f6576e421 100644
> > --- a/drivers/bus/mhi/pci_generic.c
> > +++ b/drivers/bus/mhi/pci_generic.c
> > @@ -311,8 +311,8 @@ static const struct mhi_channel_config mhi_foxconn_sdx55_channels[] = {
> >         MHI_CHANNEL_CONFIG_DL(5, "DIAG", 32, 1),
> >         MHI_CHANNEL_CONFIG_UL(12, "MBIM", 32, 0),
> >         MHI_CHANNEL_CONFIG_DL(13, "MBIM", 32, 0),
> > -       MHI_CHANNEL_CONFIG_UL(32, "AT", 32, 0),
> > -       MHI_CHANNEL_CONFIG_DL(33, "AT", 32, 0),
> > +       MHI_CHANNEL_CONFIG_UL(32, "DUN", 32, 0),
> > +       MHI_CHANNEL_CONFIG_DL(33, "DUN", 32, 0),
> >         MHI_CHANNEL_CONFIG_HW_UL(100, "IP_HW0_MBIM", 128, 2),
> >         MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0_MBIM", 128, 3),
> >  };
> > --
> > 2.25.1
> >
