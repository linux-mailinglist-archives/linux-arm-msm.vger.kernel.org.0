Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF62743130A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Oct 2021 11:14:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231509AbhJRJRF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Oct 2021 05:17:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231502AbhJRJRA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Oct 2021 05:17:00 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05935C06176C
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Oct 2021 02:14:43 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id y30so50462777edi.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Oct 2021 02:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=aleksander-es.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ceQNvJVpTQBF4k/h+7ufOwqLM7sBgzlboZglEEvPiO8=;
        b=yWU413fnIgKzOEJUbAVy7gNLP7IwjtQb29lMwpGBDlbay6ZORicjL80vnrD2elo0Lz
         XYwPuyKHBCB2BZtrBT702H1pIGx8Ikg6BBPBDBq0qqZBI2y58R1p70Vg0ZqtXDfPvyQb
         jvyK0iXyhWXMLngegdc69hOBDvLdPyzVmjKL70OqsxH2LdCMQ6xxy94EDvUzsY3BLZQm
         LnRl+07WKD3zrXBU8OAdXS4BeCWojLn3xjjY9OEGZVuNZfnZ7aci5q58e6K+fxzc0tPq
         CrdJl6BrAtciTbGPtKfk5YrdL6zvRKXTrqfTfAjQqwgS6zbm3PicQAPw0oQK4v12qXQ1
         KOGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ceQNvJVpTQBF4k/h+7ufOwqLM7sBgzlboZglEEvPiO8=;
        b=JcRjPo0e035bQGnVuetdIz9JJQZ0WHUvVrCxV7ahKYElz18GMkMk8UpF8t3vAv5Q+Y
         KjYzTGdQIXQ18O/If9jg8k48iKvpDj0JlBrNNFCw7i/ivfdE2hBGbTUpoanItEa75ni0
         k8XqHQstKclY+ez3zfjPYcbLxRo0aNsHehQXtSbuXkU7XjAUOHr6sbN3ydDCx7dktBGB
         s+v1vTvDRCcwIfEREQ7wQzt1mbLlPnFrgOMoQCDAMY/Uvt+/ET+s5XFjm3N6hW1ZAeEk
         LZeGXn2ULGTgtH8KOmhYhcAOFmLwuSJ+3J8Ud/rjQzh/ioSTaIgIAUKHEsr805rtx93Q
         075w==
X-Gm-Message-State: AOAM530kP3gkvfd1ff0akYLZQMemP2t8GzYqaU3QZjwEUpsSdwVAtT0t
        v3ioxF3u7HYdicH27CGZpwXv6dA4C5aUVmpiIIfmqA==
X-Google-Smtp-Source: ABdhPJzzrYRiNO1zSpdPsqEPMvNXMGCHZynp5iETLxg/WLrhRE83765HNEko0TTkzT5TOMeDSKZWIJFiVS8PX1ggzn4=
X-Received: by 2002:a17:907:1c0c:: with SMTP id nc12mr27524587ejc.548.1634548475551;
 Mon, 18 Oct 2021 02:14:35 -0700 (PDT)
MIME-Version: 1.0
References: <CAAP7ucLJYfftfCuKxnW8Q7-duyEuGgHA5gk+h2JyyAzNq75QSA@mail.gmail.com>
 <da0ed6cf2c0a07295a09758259521b03a7bcdc19.camel@bootlin.com>
 <CAAP7ucLu9JJjo+gN6fsSZVGKHX6VGoYkgBmsA0s9qsA-hdH6=A@mail.gmail.com>
 <2c34a05884cd68eb08e061e9d4d1aa572d78f03c.camel@bootlin.com>
 <CAAP7ucLVBn3Vk25jqL18Qxtsd=PmCpTiNY5j_pgai4BBbTOGWA@mail.gmail.com>
 <CAMZdPi8QXrjN6VYU1VrGeOBhvVSnxopioM7POEOcS5ywsSFDHQ@mail.gmail.com> <CAAP7ucKL+5oUmidVp1W-oOyfuuYR3F-11GuNdxLX9iYijaL6_A@mail.gmail.com>
In-Reply-To: <CAAP7ucKL+5oUmidVp1W-oOyfuuYR3F-11GuNdxLX9iYijaL6_A@mail.gmail.com>
From:   Aleksander Morgado <aleksander@aleksander.es>
Date:   Mon, 18 Oct 2021 11:14:24 +0200
Message-ID: <CAAP7uc+5=GMGgz3MKfSWaAtes1WwCCx+6iYhb058ZUr0=A52cg@mail.gmail.com>
Subject: Re: Sierra Wireless EM9191 integration issues in mhi+wwan
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     Thomas Perrot <thomas.perrot@bootlin.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Hemant Kumar <hemantk@codeaurora.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hey all,

> [    7.056113] mhi-pci-generic 0000:01:00.0: MHI PCI device found: sierra-em919x
> [    7.063298] mhi-pci-generic 0000:01:00.0: BAR 0: assigned [mem
> 0x600000000-0x600000fff 64bit]
> [    7.071846] mhi-pci-generic 0000:01:00.0: enabling device (0000 -> 0002)
> [    7.078671] mhi-pci-generic 0000:01:00.0: using shared MSI

In this specific setup we request 4 MSI vectors through
pci_alloc_irq_vectors(), but only end up allocating a single one (i.e.
mhi_cntrl->nr_irqs = 1). Could that be related to the problem somehow?

> [    8.100563] mhi mhi0: Requested to power ON
> [    8.104971] mhi mhi0: Attempting power on with EE: PASS THROUGH,
> state: SYS ERROR
> [   10.979537] mhi mhi0: local ee: INVALID_EE state: RESET device ee:
> PASS THROUGH state: SYS ERROR
> [   10.988331] mhi mhi0: System error detected
> [   10.992553] mhi-pci-generic 0000:01:00.0: firmware crashed (7)
> [   10.998399] mhi mhi0: Power on setup success
> [   11.002710] mhi mhi0: Handling state transition: SYS ERROR
> [   11.008198] mhi mhi0: Transitioning from PM state: Linkdown or
> Error Fatal Detect to: SYS ERROR Process
> [   11.017597] mhi-pci-generic 0000:01:00.0: firmware crashed (6)
> [   11.023430] mhi mhi0: Failed to transition from PM state: Linkdown
> or Error Fatal Detect to: SYS ERROR Process
> [   11.033433] mhi mhi0: Exiting with PM state: Linkdown or Error
> Fatal Detect, MHI state: RESET
> [   11.041958] mhi mhi0: Handling state transition: PBL
> [   11.046922] mhi mhi0: Device MHI is not in valid state
> [   11.052060] mhi mhi0: Handling state transition: DISABLE
> [   11.057370] mhi mhi0: Processing disable transition with PM state:
> Linkdown or Error Fatal Detect
> [   11.066243] mhi mhi0: Waiting for all pending event ring processing
> to complete
> [   11.073561] mhi mhi0: Waiting for all pending threads to complete
> [   11.079653] mhi mhi0: Reset all active channels and remove MHI devices
> [   11.086181] mhi mhi0: Resetting EV CTXT and CMD CTXT
> [   11.091146] mhi mhi0: Exiting with PM state: DISABLE, MHI state: RESET
> [   11.097734] mhi-pci-generic 0000:01:00.0: failed to power up MHI controller
> [   11.104937] mhi-pci-generic: probe of 0000:01:00.0 failed with error -110
>

-- 
Aleksander
https://aleksander.es
