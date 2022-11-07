Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB86961F49B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Nov 2022 14:47:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231264AbiKGNrI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Nov 2022 08:47:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230430AbiKGNrI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Nov 2022 08:47:08 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44CF81CFCE
        for <linux-arm-msm@vger.kernel.org>; Mon,  7 Nov 2022 05:47:07 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id a14so16295824wru.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Nov 2022 05:47:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1AC3YGIaP9V1NcYduZ2gjnjW3VyF2paTalXWaqNImmI=;
        b=KLK3MEHraVuw0BOWHmqR+3FnxAOspxOavkgD/w0ogGrKoqK4J7grUD3vCU9UiMvvkk
         anTuvcA3puB2XEMmJccwxTgT0KnO3dgE0uqJSlw7oM7gYjxHgaRLPtvZClknXpDBz7N0
         Igz22I5YxH7BOclDKEKmpw3QZl2IThI/e9XBuNEbcwmszPnk/fQXie5HQP1tnTp51d2K
         139rhA+cd8yjFyCN8JYf0sEnJsQSAKriyxORFpdJZTzFyXtgv3NmoaCZ5yGD0JPa/OG8
         MscUMDNjE+skdsVGX00144TF9odadea0kL6mqWhSW7pZbzxrt4OtPjEmkOBQKX9W5Zpg
         pRbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1AC3YGIaP9V1NcYduZ2gjnjW3VyF2paTalXWaqNImmI=;
        b=3gNg80r3Xx3zUDnFfAw9fvssLrm5eVMwnTiMU72dfiaqMm8N/+xxFgPHmtlvqAq+Aw
         ukQbIB1t9/ams1axka7Hess0ZmOTLo9DDHhcvlfmsx+f2+75Ag2bXod7SmoUDAj03qjC
         bofcqxsfWRF1qJ/HXc+EbofYa7aOipIkO70s8s0h6j0acnfUq2IPPQAy46Wr1yQfY0cB
         288tmP0DYfWMv9rVOYoYlwUNKwMNucJHTQX21pxj7pd5ude6OWqjVttAAyRljfNXfnDh
         Wovu2wVaM8yd0HItxxdPseHRUX7cJMGaykvPaGQ+VH0w7h1KQcaCO4VsT44mg61FhETb
         AEog==
X-Gm-Message-State: ACrzQf3Ms8laVMB/rA8rjLaFy+x4hCIrcePMNj+mmcbCc621eMqdaO8P
        qgDAPmqfCS98vm4e6uASf2fPSRi/vAfV/FnaG1C44g==
X-Google-Smtp-Source: AMsMyM6VsyV3GUEU7A+sgU0cqpAT4MmNpY2dA52ocj/n4oPUEh0wtdHEKdSgxjNFgVTLvmgUnIE9aPQF/edsvVebtCA=
X-Received: by 2002:adf:e84a:0:b0:236:5f2d:9027 with SMTP id
 d10-20020adfe84a000000b002365f2d9027mr31265063wrn.89.1667828825558; Mon, 07
 Nov 2022 05:47:05 -0800 (PST)
MIME-Version: 1.0
References: <CAGRyCJGWQagceLhnECBcpPfG5jMPZrjbsHrio1BvgpZJhk0pbA@mail.gmail.com>
 <20221107115856.GE2220@thinkpad>
In-Reply-To: <20221107115856.GE2220@thinkpad>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Mon, 7 Nov 2022 14:46:29 +0100
Message-ID: <CAMZdPi-=AkfKnyPRBgV-7RxczePnB4shLq2bdj+q3kh+7Web3w@mail.gmail.com>
Subject: Re: MHI DTR client implementation
To:     Manivannan Sadhasivam <mani@kernel.org>
Cc:     Daniele Palmas <dnlplm@gmail.com>, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org,
        Network Development <netdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 7 Nov 2022 at 12:59, Manivannan Sadhasivam <mani@kernel.org> wrote:
>
> + Loic
>
> On Tue, Sep 20, 2022 at 04:23:25PM +0200, Daniele Palmas wrote:
> > Hello all,
> >
> > I'm looking for some guidance related to  a possible MHI client for
> > serial ports signals management implementation.
> >
> > Testing the AT channels with Telit modems I noted that unsolicited
> > indications do not show: the root cause for this is DTR not set for
> > those ports through MHI channels 18/19, something that with current
> > upstream code can't be done due to the missing DTR client driver.
> >
> > I currently have an hack, based on the very first mhi stack submission
> > (see https://lore.kernel.org/lkml/1524795811-21399-2-git-send-email-sdias@codeaurora.org/#Z31drivers:bus:mhi:core:mhi_dtr.c),
> > solving my issue, but I would like to understand which would be the
> > correct way, so maybe I can contribute some code.
> >
> > Should the MHI DTR client be part of the WWAN subsystem?
>
> Yes, since WWAN is going to be the consumer of this channel, it makes sense to
> host the client driver there.

Agree.

>
> > If yes, does it make sense to have an associated port exposed as a char
> > device?
>
> If the goal is to control the DTR settings from userspace, then you can use
> the "AT" chardev node and handle the DTR settings in this client driver.
> Because at the end of the day, user is going to read/write from AT port only.
> Adding one more ctrl port and have it configured before using AT port is going
> to be a pain.
>
> Thanks,
> Mani
>
> > I guess the answer is no, since it should be used just by the AT ports
> > created by mhi_wwan_ctrl, but I'm not sure if that's possible.
> >
> > Or should the DTR management be somehow part of the MHI stack and
> > mhi_wwan_ctrl interacts with that through exported functions?

Is this DTR thing Telit specific?

Noticed you're using the IP_CTRL channel for this, do you have more
information about the protocol to use?

At first glance, I would say you can create a simple driver for
IP_CTRL channel (that could be part of mhi_wwan_ctrl), but instead of
exposing it rawly to the user, simply enable DTR unconditionally at
probe time?

Regards,
Loic
