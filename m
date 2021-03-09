Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19E0233206B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Mar 2021 09:23:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229652AbhCIIW0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Mar 2021 03:22:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230202AbhCIIWR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Mar 2021 03:22:17 -0500
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D1E1C06174A
        for <linux-arm-msm@vger.kernel.org>; Tue,  9 Mar 2021 00:22:17 -0800 (PST)
Received: by mail-pl1-x629.google.com with SMTP id n17so2634773plc.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Mar 2021 00:22:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KqIH0eXEmOA5B3cm9SqcxO50AkEENA5KgpSWYl9q3QY=;
        b=mjcMwMyeiSg18EZDnZBIwVME9SMp9Nn7nomngaQG/Z/i3qas91LUSAXxj6R4bj778m
         lgHeCn+HKfmHBowPaOhC7lSsUCrffUrZwwoiRqZa6j2yqD7qrEoxBc/E0zgUK8IGanjy
         FL2qY4dKveXSZnx9A7a8AexhL3AYo6VZ81wiKuCoNwHR0+C/SNSI71n2fFsIqU0JMOVV
         OYixgZq116ce3eY+L0MYtrGmz+CMLcs+NYbtyF3EEGxSnKTHGYShi5NpkAXSQOI6Ttpz
         /aAxZBPKWVRvVEd0DsPVaa6vektKCtRBbZQcuo05tMRJfUoo0J4ZrWjutbATZC+bZZOE
         zTKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KqIH0eXEmOA5B3cm9SqcxO50AkEENA5KgpSWYl9q3QY=;
        b=Eby6JYMaApwvDyOTsW+svmwd6Vq5Fk2OX/JFQk9kRSIC005p6YFQDu9/Su2V14dbgY
         QkU/94BWobYpZbRpiH8lbpiSr2TTHdpKahEQ2vs49TxHN8ZbGOwUUNDWLoakjLYjceh/
         mQav/blFtnkvpl1jwNYUeL00ebwfnJso5ps7QP+RXvqF+AGMBel3HtcZnjWZfiPfjrTP
         gk0OuIcikXteJTNBv4xvbmn3iKJuBQLyDP2b2ArLpCEaSYI7wC5MZeD3GephJ0z8dHM9
         /JKWMf466AcE/6wVvIu2Z+cLhG+tqJUQExJd1Hqt6IyY4dfjlq0Cf6LWGaxDxvouifuH
         a/Ig==
X-Gm-Message-State: AOAM530yNNpvaCTlzhcujMuZUlWf9EFuXr8r8QlK13s5UnnMGwN5cwG1
        qYS9i8un+WVP/0UmZlxb9QgBJ8p4yIyYHoWDq/SGWQ==
X-Google-Smtp-Source: ABdhPJyAFnZEE0ZtzJMHvH8R6Md9PxqNKtQ3y8wYDdSVzuzOp3OYrd6NNbs7Ly8SPD4D5zJ2PPlgykzSoF6JPn6TqJQ=
X-Received: by 2002:a17:90a:1463:: with SMTP id j90mr3508798pja.205.1615278136808;
 Tue, 09 Mar 2021 00:22:16 -0800 (PST)
MIME-Version: 1.0
References: <1615228851-17783-1-git-send-email-loic.poulain@linaro.org> <20210308105059.22f6f038@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20210308105059.22f6f038@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Tue, 9 Mar 2021 09:30:08 +0100
Message-ID: <CAMZdPi98qD7PCV+kgwLYvc83APzV6ZopwtyN2FEL2t9oFJr9fw@mail.gmail.com>
Subject: Re: [PATCH] bus: mhi: Add Qcom WWAN control driver
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Hemant Kumar <hemantk@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Aleksander Morgado <aleksander@aleksander.es>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Jakub,

On Mon, 8 Mar 2021 at 19:51, Jakub Kicinski <kuba@kernel.org> wrote:
>
> On Mon,  8 Mar 2021 19:40:51 +0100 Loic Poulain wrote:
> > The MHI WWWAN control driver allows MHI Qcom based modems to expose
> > different modem control protocols to userspace, so that userspace
> > modem tools or daemon (e.g. ModemManager) can control WWAN config
> > and state (APN config, SMS, provider selection...). A Qcom based
> > modem can expose one or several of the following protocols:
> > - AT: Well known AT commands interactive protocol (microcom, minicom...)
> > - MBIM: Mobile Broadband Interface Model (libmbim, mbimcli)
> > - QMI: Qcom MSM/Modem Interface (libqmi, qmicli)
> > - QCDM: Qcom Modem diagnostic interface (libqcdm)
> > - FIREHOSE: XML-based protocol for Modem firmware management
> >           (qmi-firmware-update)
> >
> > The different interfaces are exposed as character devices, in the same
> > way as for USB modem variants.
> >
> > Note that this patch is mostly a rework of the earlier MHI UCI
> > tentative that was a generic interface for accessing MHI bus from
> > userspace. As suggested, this new version is WWAN specific and is
> > dedicated to only expose channels used for controlling a modem, and
> > for which related opensource user support exist. Other MHI channels
> > not fitting the requirements will request either to be plugged to
> > the right Linux subsystem (when available) or to be discussed as a
> > new MHI driver (e.g AI accelerator, WiFi debug channels, etc...).
> >
> > Co-developed-by: Hemant Kumar <hemantk@codeaurora.org>
> > Signed-off-by: Hemant Kumar <hemantk@codeaurora.org>
> > Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
>
> You need to CC netdev.
>
> >  drivers/bus/mhi/Kconfig     |  12 +
> >  drivers/bus/mhi/Makefile    |   3 +
> >  drivers/bus/mhi/wwan_ctrl.c | 559 ++++++++++++++++++++++++++++++++++++++++++++
>
> Linux kernel tree is not organized by bus. This belongs somewhere under
> drivers/net.

Ok, so this driver will fall under networking, which makes some sense
for something called WWAN.
I guess it's time to create at least a wwan directory as a common
place for WWAN related drivers.

Regards,
Loic
