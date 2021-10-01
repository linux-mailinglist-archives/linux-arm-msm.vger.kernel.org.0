Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FA2841E86C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Oct 2021 09:35:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231248AbhJAHgy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Oct 2021 03:36:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231220AbhJAHgv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Oct 2021 03:36:51 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09A34C061775
        for <linux-arm-msm@vger.kernel.org>; Fri,  1 Oct 2021 00:35:07 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id r201so2740575pgr.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Oct 2021 00:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=PAf84sro73ZCWncNc0iwsBfbeJybUI3E6DiBtl9giX8=;
        b=Kai8Ss3rJ83JjJxZNAODvmerGbUpu74N6s5XufsTCB2MJcc8I/uO3wwresacKCVPLf
         1ubb3ts4FEiIr8W0Qq1SdJAx2byCFC+5hJXcQHaUNcdbbIqY4AOpAJVtmdewbJLjkWe0
         HoLSSDn6Q8ta4OAJTh0ojP2ADFXJPm7icPvebUmo2JOBPo+/GS5J+ys2iFeOayVzelDm
         qKQHMTJOQrqwvxCB2EfZmzEszfu+G8hI3zInK8rh52YKxiKZl7gLnYK4JLJ3SO5pWmb1
         1KzinSwGVDzfeQxNRYfWcyP+4KC193hxvcFSKEcgEK38YXaMakKnusGxdBNhiiDzzGMs
         7lZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PAf84sro73ZCWncNc0iwsBfbeJybUI3E6DiBtl9giX8=;
        b=qqcjKT80znQwSWeSWrdLBF3uHUPCz24LmCkR9Nq9WDy/HJuE80yU4AOogOV9F6qjpv
         G0YgBX4VRwvgHt7igQq5Ez3fG5KtYSfn+mAXUj6DLQKuMq/POzVlZ8Ku4BmzXCV4yASh
         hWzsenypBGBM8NK0tCHIoPv/RUh1QaEpcENuqv7lwlJM+jDydqH53zIgnBbLf5I9XYxm
         9kvAzQYRP2pX5GdatZjheapti6e8p3wL6D0f+aoOpvgQ/pkdMZkMpR/bGHaZ0KNN4axT
         fe5einVRFmvRtnphezhfnZKhFhJXIE8ymPiHclEz4JfzePK/LSA5BaT6e3VY13osnqmM
         A73Q==
X-Gm-Message-State: AOAM533I2vzRV3ALLZ0+19APxlXBn+zmqYET6d8d86uSFd4KiNoY6zrQ
        1ZZNq8qaj34OhZpP8NwVBOU5
X-Google-Smtp-Source: ABdhPJwAQuzxjymauoK5Pufu1b59SX89jkmJZcgrmX/m7n4PiepBuGuiXPCcYqUPpoQth4vEmWy1uA==
X-Received: by 2002:a05:6a00:1a02:b0:446:d18c:8e7e with SMTP id g2-20020a056a001a0200b00446d18c8e7emr9985561pfv.46.1633073706309;
        Fri, 01 Oct 2021 00:35:06 -0700 (PDT)
Received: from thinkpad ([117.193.209.206])
        by smtp.gmail.com with ESMTPSA id k190sm5511089pfd.211.2021.10.01.00.35.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Oct 2021 00:35:05 -0700 (PDT)
Date:   Fri, 1 Oct 2021 13:05:01 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Aleksander Morgado <aleksander@aleksander.es>
Cc:     Thomas Perrot <thomas.perrot@bootlin.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        hemantk@codeaurora.org, Loic Poulain <loic.poulain@linaro.org>,
        stable <stable@vger.kernel.org>
Subject: Re: [PATCH] bus: mhi: pci_generic: increase timeout value for
 operations to 24000ms
Message-ID: <20211001073501.GB5821@thinkpad>
References: <20210805140231.268273-1-thomas.perrot@bootlin.com>
 <f358044a-78d0-ad63-a777-87b4b9d94745@aleksander.es>
 <73A52D61-FCAB-4A2B-BA96-0117F6942842@linaro.org>
 <CAAP7ucL1Zv6g8G0SWAjEAjr6OSVTyDmvmFkH+vMmmBwOH2=ZUQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAP7ucL1Zv6g8G0SWAjEAjr6OSVTyDmvmFkH+vMmmBwOH2=ZUQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Sep 29, 2021 at 03:17:04PM +0200, Aleksander Morgado wrote:
> Hey Mani,
> 
> > >> diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
> > >> index 4dd1077354af..e08ed6e5031b 100644
> > >> --- a/drivers/bus/mhi/pci_generic.c
> > >> +++ b/drivers/bus/mhi/pci_generic.c
> > >> @@ -248,7 +248,7 @@ static struct mhi_event_config modem_qcom_v1_mhi_events[] = {
> > >>
> > >>   static const struct mhi_controller_config modem_qcom_v1_mhiv_config = {
> > >>      .max_channels = 128,
> > >> -    .timeout_ms = 8000,
> > >> +    .timeout_ms = 24000,
> > >
> > >
> > >This modem_qcom_v1_mhiv_config config applies to all generic SDX24, SDX55 and SDX65 modules.
> > >Other vendor-branded SDX55 based modules in this same file (Foxconn SDX55, MV31), have 20000ms as timeout.
> > >Other vendor-branded SDX24 based modules in this same file (Quectel EM12xx), have also 20000ms as timeout.
> > >Maybe it makes sense to have a common timeout for all?
> > >
> >
> > Eventhough the baseport coming from Qualcomm for the modem chipsets are same, it is possible that the vendors might have customized the firmware for their own usecase. That could be the cause of the delay for modem booting.
> >
> > So I don't think we should use the same timeout of 2400ms for all modems.
> >
> 
> Please note it's 24000ms what's being suggested here, not 2400ms.
> 

Doh, sorry I missed one zero ;)

> > >Thomas, is the 24000ms value taken from experimentation, or is it a safe enough value? Maybe 20000ms as in other modules would have been enough?
> > >
> >
> > It was derived from testing I believe.
> 
> Following your reasoning above, shouldn't this 24000ms timeout be
> applied only to the Sierra Wireless EM91xx devices (which may have
> custom firmware bits delaying the initialization a bit longer), and
> not to the generic SDX24, SDX55 and SDX65?
> 
> If I'm not mistaken, Thomas is testing with a custom mhi_pci_generic
> entry for the EM91xx; as in
> https://forum.sierrawireless.com/t/sierra-wireless-airprime-em919x-pcie-support/24927.
> I'm also playing with that same entry on my own setup, but have other
> problems of my own :)
> 

Hmm, then it makes sense to wait until we get the separate config from Thomas.

Thanks,
Mani

> 
> --
> Aleksander
> https://aleksander.es
