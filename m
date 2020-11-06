Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F6E62A9971
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Nov 2020 17:28:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726074AbgKFQ2X (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Nov 2020 11:28:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725868AbgKFQ2X (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Nov 2020 11:28:23 -0500
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 456BFC0613CF
        for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2020 08:28:23 -0800 (PST)
Received: by mail-pf1-x441.google.com with SMTP id g7so1802200pfc.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2020 08:28:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:user-agent:in-reply-to:references:mime-version
         :content-transfer-encoding:subject:to:cc:from:message-id;
        bh=ZBuroc65g5MW4sWFJAdKF0xE7Bmk2Kd5JzOQa/Yr928=;
        b=W3SZLd26PE0jd4Dt35onQHoPfTRR1wOlNp0xhtsoiGlunbXSD/w5E7tyfTPtt4aMPs
         gXfDAda1Ws8C3S4cLCyhT5G3o1zJhrQ00qNMrssNWjSiye2GIR07csETbkxxP3F4XB1o
         GyIVa21OPm/KJAvYmYzMSCWGgGG4yo83qglCY/WDQ6Ohmb2GL5dGxGfHB/Kp0YPvibCt
         exVp9Agm9XHlIXSm0NrzVEALbZSuhISWqfs9m5rQa+kkKpxjve0sDgXk/+rkcYVSSpbi
         2dQTlWpHg2of2UKXNG2e2UFQ7ena5rw0vbw4WAdeXGGAf6QaIQkpxM958x1aYm4AxD1P
         HPvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:user-agent:in-reply-to:references
         :mime-version:content-transfer-encoding:subject:to:cc:from
         :message-id;
        bh=ZBuroc65g5MW4sWFJAdKF0xE7Bmk2Kd5JzOQa/Yr928=;
        b=E82v7X894g9pbNGWgy3FeFcnLNUY4bdYgGGx6FRvg+MKGyyhfrNBazMA2tAAuBPAVS
         aTcu4Kh6FhnxtmP3LVBsNp69knNl3TNzNBSSuH5rGCO7AXc8+LVIyaFFugJHIY8vpRkH
         4Q2jHOuZbhYarxeY+dMFWkgJMcE42vTsEd+Gi+2AYdXb81P+CqdeKjWAgPBsxc/0VDwM
         WhJhLEv2AaEmlWmsgMd1MYV7laa0WQAR/h/IcT1Jifk1Em7UZri43i6l7xCGnz1LaLMd
         IAhjTv59ghxyuRTu4dEZps+qwTUP3VS6T/d1L093UQ6GziP03fmJmchNbvXrEQQbWC7T
         X3+Q==
X-Gm-Message-State: AOAM532SssAI014xXJOhfnSaDqbd3w332OZluABStkKQfeGjkpzh9r6w
        vglGFYJ/cUuaUy+tIuYT//kI
X-Google-Smtp-Source: ABdhPJzPdXqKMXb/HsCZgrn8LKy6GT1USyA1bjpKhJiW/F0hq65z1eU+AENYPkDznR/gSS/9M1FJBQ==
X-Received: by 2002:a17:90b:3708:: with SMTP id mg8mr367085pjb.192.1604680102616;
        Fri, 06 Nov 2020 08:28:22 -0800 (PST)
Received: from [192.168.0.104] ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id 6sm2562149pfh.112.2020.11.06.08.28.19
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 06 Nov 2020 08:28:21 -0800 (PST)
Date:   Fri, 06 Nov 2020 21:58:12 +0530
User-Agent: K-9 Mail for Android
In-Reply-To: <20201106080445.00588690@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
References: <1604424234-24446-1-git-send-email-loic.poulain@linaro.org> <20201105165708.31d24782@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com> <20201106051353.GA3473@work> <20201106080445.00588690@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v10 1/2] bus: mhi: Add mhi_queue_is_full function
To:     Jakub Kicinski <kuba@kernel.org>
CC:     Loic Poulain <loic.poulain@linaro.org>, davem@davemloft.net,
        netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bbhatt@codeaurora.org, willemdebruijn.kernel@gmail.com,
        jhugo@codeaurora.org, hemantk@codeaurora.org
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Message-ID: <B9A7A95E-BD2F-49C0-A28C-56A8E6D903AC@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 6 November 2020 9:34:45 PM IST, Jakub Kicinski <kuba@kernel=2Eorg> wrot=
e:
>On Fri, 6 Nov 2020 10:43:53 +0530 Manivannan Sadhasivam wrote:
>> On Thu, Nov 05, 2020 at 04:57:08PM -0800, Jakub Kicinski wrote:
>> > On Tue,  3 Nov 2020 18:23:53 +0100 Loic Poulain wrote: =20
>> > > This function can be used by client driver to determine whether
>it's
>> > > possible to queue new elements in a channel ring=2E
>> > >=20
>> > > Signed-off-by: Loic Poulain <loic=2Epoulain@linaro=2Eorg>
>> > > Reviewed-by: Manivannan Sadhasivam
><manivannan=2Esadhasivam@linaro=2Eorg> =20
>> >=20
>> > Applied=2E =20
>>=20
>> Oops=2E I should've mentioned this (my bad) that we should use an
>immutable
>> branch to take this change=2E Because, there are changes going to get
>merged
>> into the MHI tree which will introduce merge conflicts=2E And moreover,
>we
>> planned to have an immutable branch to handle a similar case with
>ath11k=2E
>
>Damn, sorry=2E
>
>> Since you've applied now, what would you propose?
>
>Do you need mhi_queue_is_full() in other branches, or are you just
>concerned about the conflicts?
>

Yes, I need this patch in mhi-next=2E

>I'm assuming the concern is just about the mhi/core patch, or would=20
>you need to refactor something in the net driver as well?

Just the mhi_queue_is_full() patch=2E=20

Thanks,=20
Mani

--=20
Sent from my Android device with K-9 Mail=2E Please excuse my brevity=2E
