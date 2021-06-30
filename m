Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 941633B89C9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jun 2021 22:36:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234270AbhF3UjN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Jun 2021 16:39:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233899AbhF3UjM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Jun 2021 16:39:12 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E491AC061756
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jun 2021 13:36:42 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id gt10so5069946ejc.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jun 2021 13:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+e9XcKmeP7OQ6ANj1zbSPehU2EUrRWUePdwhtD47xq4=;
        b=WxxMb2WRtKqU+i2ZvoCpsMSHSD+xvl3JzSPPcguW0rTtfN1vUtABKPBp3n2UAla9PB
         U6iJwhtlejZ7U8FDLdbVy5dGFFKP7OMS4wMQeEXLxz4X84NgpRxburq9XaqGsKRJpE1a
         XqZ7HloKS1LnBJ85OfZM4BjqTjUoVxUC4FoUTKCOBPzDIx91DFjomYCieBz3EhVJVT4k
         BaoRDjsk7H0QjWqUu/r5aghVXIKM9/bwK3AG2/5mfGcsYFlxCEkdZu+eTshv/FqwYeXf
         6nEO1UtwWgXtFa4lN1tiDY+HOpfofPd0OsVyzaz4qsDbAKfQxu1JfBFrwGkO0F7jLaTR
         TAjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+e9XcKmeP7OQ6ANj1zbSPehU2EUrRWUePdwhtD47xq4=;
        b=BCipbpGSCABMu/7rQeuxyglwSKZCiVyxmM2c7Rqj5iRH8pUGicID3s21lXAIQzaOgB
         vxS6h8B3yNB7ivoGRd4Gqh+Tr21RIvSrFB0KxKHqMcRV0dIOAwUIvdExr5QPAmWONQXh
         YJYq0NaQJ6xvHPpdUApVltPAuC7zM6ZoZQso8LwzWf049kPWZkH9wrn+JgwZ63jDDeo5
         NtukctuJyFsqPVh4JTrnsdLW1h7DQ1O+/17gmxcMBLF/52d+MhSxJvaj9BUt+CkTyoeQ
         PjSClwgBBAPb8c/+/t/Lur7KbGq80dpshsrJlWFI724LYZpFmYwYh9A1nxEW2cwDPXMQ
         N/8w==
X-Gm-Message-State: AOAM531VGyNjJVCx5MbpXyL/OWe0nIxgZVnDViCme38tN+RTPwrEw9Vs
        XeI3tp2fwbg5P9kq8OKCTL2tRdGmqmSB2dTx6SbjdPLGMq8=
X-Google-Smtp-Source: ABdhPJzybv00Ve7FIEP3KmDp1w3jbJ56XPh4U+jY67O1pOpEMRGHUxpk27fbuield7ru4wgK32bF4tHLqz9LZKvQIKk=
X-Received: by 2002:a17:907:7d8b:: with SMTP id oz11mr1008185ejc.143.1625085401418;
 Wed, 30 Jun 2021 13:36:41 -0700 (PDT)
MIME-Version: 1.0
References: <TNZIVQ.NUOZ8IPZF0UA1@ixit.cz>
In-Reply-To: <TNZIVQ.NUOZ8IPZF0UA1@ixit.cz>
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
Date:   Wed, 30 Jun 2021 15:36:31 -0500
Message-ID: <CAOCOHw6Sx3Xs8NomniP=9=UnKu9GuGy2KAGo5j8mLLD3gb+miQ@mail.gmail.com>
Subject: Re: "soc: qcom: mdt_loader: Support loading non-split images" breaks
 wcnss fw loading on Nexus 7
To:     David Heidelberg <david@ixit.cz>
Cc:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Andy Gross <agross@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jun 30, 2021 at 12:39 PM David Heidelberg <david@ixit.cz> wrote:
>
> Kernel: stable-5.10.y
> HW: chipset APQ8064, Nexus 7 2013 (codename flo or deb)
> Problem first occured when I was porting Nexus from 4.19 to 5.4 LTS.
>
> Hello,
>
> after reverting this particular commit (
> 498b98e939007f8bb65094dfa229e84b6bf30e62 ), I'm able do
>
> echo 'start' >
> /sys/devices/platform/soc/3200800.riva-pil/remoteproc/remoteproc0/state
>
> [ 64.271634] remoteproc remoteproc0: powering up 3200800.riva-pil
> [ 64.276210] remoteproc remoteproc0: Booting fw image wcnss.mdt, size
> 6804
> [ 70.087107] remoteproc remoteproc0: remote processor 3200800.riva-pil
> is now up
> [ 70.100817] qcom_wcnss_ctrl remoteproc0:smd-edge.WCNSS_CTRL.-1.-1:
> WCNSS Version 1.4 1.2
> [ 70.124279] wcn36xx: mac address: 18:00:2d:88:9c:a9
> [ 95.357907] wcn36xx: firmware WLAN version 'WCN v2.0 RadioPhy
> vIris_TSMC_2.0 with 48MHz XO' and CRM version '201080'
> [ 95.357938] wcn36xx: firmware API 1.4.1.2, 41 stations, 2 bssids
>
> with current stable-5.4.y - stable-5.10.y (cannot test later since it
> crashes without saving pstore dmesg):
>

I believe that the APQ8064 boards fell out of the various automation
setups and we lost track of the status. Hopefully we can resurrect
e.g. the ifc6410 to catch these kinds of regressions.

> [ 50.972560] remoteproc remoteproc0: powering up 3200800.riva-pil
> [ 50.977121] remoteproc remoteproc0: Booting fw image wcnss.mdt, size
> 6804
> [ 50.977166] remoteproc remoteproc0: Failed to load program segments:
> -22
> [ 50.977225] remoteproc remoteproc0: Boot failed: -22

Seems like the reasons for this would be that the ELF header and
signature segment are stacked differently from the firmware I looked
at when I came up with that patch.
Can you please share the output of "readelf -a wcnss.mdt"?

Regards,
Bjorn
