Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27BC44497E5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Nov 2021 16:13:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235206AbhKHPPr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Nov 2021 10:15:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241068AbhKHPOh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Nov 2021 10:14:37 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8BE7C061570
        for <linux-arm-msm@vger.kernel.org>; Mon,  8 Nov 2021 07:11:48 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id j21so63606972edt.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Nov 2021 07:11:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=aleksander-es.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=p98pmoW6R0jsajhFKYsJ+jEJR0Xu5dyHpT5bKSTMS/M=;
        b=AhwP09P2pTpWlzHbnfODh/PvnEbCS0bb+Y0MhkCJhJWEUqmgwf2Ei4vlNh0uzYO3d/
         NCTi6Q6OW7ZV2DxC76iGHVoEalMkhyPEEmvSaNzbdAc0GnF1U/2mUC+YhplV5eJUxR1/
         Xapyu4h95iS6I3+nI1wcRreJlf+2gNNK+brC/GJkEOHYGHLkWNMds+EAkcTzpTPHvBxJ
         NFd6fCEIx0iqQV4xG1XDI5y2AbtSE48yZNaSvSfrfvoZ3RNkyLfIl/6QGi0oujQp5wiC
         HLZvM7uJif45iycF/J93ocC06WPcgFd0gIM4Ce2e65OispXMC/BF7x2DCX6BncL0yC+E
         81Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=p98pmoW6R0jsajhFKYsJ+jEJR0Xu5dyHpT5bKSTMS/M=;
        b=0BagNui8p2wQ1M9Ayn1v9QfuC62cnkHHripRttApfBBuPgV3u0l9zS4gMG+xBUUHYD
         psETXZavwZzSHA/QkwLFCjar8eSnxhM3e5zSjlucIxvs3ckCbAGFoCQbR/c3UE+52/ie
         UUFxLQkvld1qPCBxx0QYHzV/e51ZXVMezahgisUij0R5/B8jLQkqTYvhmOmeUMOEocKg
         XXSBGhkR5AOqLuh0Co0T4fyiw2nxgKq7/hfBPV05VgraSQVTYcC/cooXPyAR1jNZNQ2w
         yyodntJzBoGN7iNamS+JWtnjcgjALknDn2psUNPWY+33zTuB24BktCrkWNIVJCgBdCJt
         +VCw==
X-Gm-Message-State: AOAM530NEXN/AWC5/fsm9dC8fN7qPABsGGD7skz5OP5/FGyMsYBEyqOI
        CRsOb7efqP1uieDjmWc3k875Ye75alliWftTgQUm+Q==
X-Google-Smtp-Source: ABdhPJwf+Pv4LakijuhJWamrC59tHA3eA7dCQcRlobE7MlS9arnU4nPshPJyTMS3ryyDvfoghmQDoeALZZgJjLFMbo4=
X-Received: by 2002:a17:906:a217:: with SMTP id r23mr23046ejy.548.1636384307318;
 Mon, 08 Nov 2021 07:11:47 -0800 (PST)
MIME-Version: 1.0
References: <CAAP7ucLJYfftfCuKxnW8Q7-duyEuGgHA5gk+h2JyyAzNq75QSA@mail.gmail.com>
 <da0ed6cf2c0a07295a09758259521b03a7bcdc19.camel@bootlin.com>
In-Reply-To: <da0ed6cf2c0a07295a09758259521b03a7bcdc19.camel@bootlin.com>
From:   Aleksander Morgado <aleksander@aleksander.es>
Date:   Mon, 8 Nov 2021 16:11:36 +0100
Message-ID: <CAAP7ucJ6a+r6b6C4C51ov6O8sepYmut2uc7sXDqFOOdJruW6nQ@mail.gmail.com>
Subject: Re: Sierra Wireless EM9191 integration issues in mhi+wwan
To:     Thomas Perrot <thomas.perrot@bootlin.com>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Hemant Kumar <hemantk@codeaurora.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hey Thomas,

Reviving an old email :)

> On our setup, using i.MX6DL based board and a PCIe Sierra Wireless
> EM9190 module, running Yocto and Linux 5.13, we don't have much success
> for the moment, qmi and mbim commands very often end in timeout.
>
> Otherwise, when responses are received, we also can observe strange
> things: unexpected messages, response to previous commands or queue
> buffer issue.
>

Once all my boot reliability issues seem solved, I've also started to
notice what you mean here. If I run a normal ModemManager build with
both QMI and MBIM enabled, MM will try to probe both the QMI and MBIM
ports. When that happens, I have no idea why, the modem gets in some
weird state with commands timing out and what not. Maybe it's because
we're using both ports at the same time, maybe it's because we run QMI
on both the QMI and MBIM ports, no idea, the only thing I know is that
if you choose to use either one or the other, the whole setup is fully
stable.

E.g. I'm right now testing my build after compiling ModemManager using
--without-mbim (so QMI only), and I have absolutely no error. Another
option if you don't want to rebuild MM is to flag the MBIM or the QMI
port as ID_MM_PORT_IGNORE with udev rules, which is very likely what
I'll end up doing in upstream ModemManager to have a proper default.

I was thinking in preparing and sending for review the EM91xx entry
for drivers/bus/mhi/pci_generic.c, but it's mostly based on what you
suggested in the Sierra Wireless forum, so not sure if you'd like to
send it yourself here? The only changes I did w.r.t. what you
suggested are setting sideband_wake to false, and listing the
PCI_DEVICE_SUB() before the more generic PCI_DEVICE() one.

-- 
Aleksander
https://aleksander.es
