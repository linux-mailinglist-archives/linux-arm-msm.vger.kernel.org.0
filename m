Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A457409D55
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Sep 2021 21:42:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347565AbhIMTns (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Sep 2021 15:43:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241380AbhIMTnr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Sep 2021 15:43:47 -0400
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FD1CC061762
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Sep 2021 12:42:31 -0700 (PDT)
Received: by mail-ot1-x332.google.com with SMTP id c42-20020a05683034aa00b0051f4b99c40cso14975334otu.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Sep 2021 12:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=BqyiYC70ZQUHHw9//0XYXSrAX8+tnM8/YgezErnlDrU=;
        b=e/ksqZ8nK4LM8K7qBzx6ztRoNrqG6PH8PC4yEvjbNVYCxAkYDmbjw+IMZbNNQPvF7R
         fAfXBrgXMcKl+IMNADZbsi5JOMxER5obm4NoKcY/o71HCmbu9xY+Fnt3rDf/PnxozAoe
         WlqJnz4bjYXgBaQmmKDkmPlCT/C9EH8dwVNhY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=BqyiYC70ZQUHHw9//0XYXSrAX8+tnM8/YgezErnlDrU=;
        b=OReqiwKzJpLiVv6wuB3v0TKTMn2moVIbWbSaznbndOF6P+CjwQph3rkTr4VccMqg0L
         AYC6Yp480C7ikOH+pAROCtHeyTaa0OgAxrYzioZHb1WeGm9fMVbxQLbSwLc/V5go1lcp
         vZA4usxUCqLYZ7IxxF4oXDl00QVU+ra2waGhxB43T5jQOlGpHCQJFo6xtXY8WhnbCnta
         M+kAE3b/coz/XlrAiy1hTKR1e7t330FFJjPGeRBgOMOJBfDgma+6QelB2efU/gVx0npc
         AKZ4ao/wArTxDEbggvCHJ3ewQB0+9odR3TQfYxE5s9I6fg1A7WjfzssXn6yU0KvHJmNY
         AC0w==
X-Gm-Message-State: AOAM530/P7Y+JQIeT3MuA6AoRyVSWIgFGAoj2RD/lbyYO3WMW0pvM0IG
        DKwzxKAKihEBlcwVo60e53DdtUusZ2qCMIt1eCy0JA==
X-Google-Smtp-Source: ABdhPJwZ8mXUoFC7htDszmiW3cET2FEd1QCjxSbxY2/mXROYf8yoBexV2QICbOCDGNL/7hR7V6ReQxz2sOFr7dvaHZ8=
X-Received: by 2002:a05:6830:1212:: with SMTP id r18mr10734921otp.159.1631562150764;
 Mon, 13 Sep 2021 12:42:30 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 13 Sep 2021 12:42:30 -0700
MIME-Version: 1.0
In-Reply-To: <4697bec1-af58-53e4-9fd1-293bfd8754be@codeaurora.org>
References: <1629108335-23463-1-git-send-email-deesin@codeaurora.org>
 <CAE-0n528DuP4MiAOhYY+Du+L=OZaGM5YJm=NwWia3JF7hp7sAA@mail.gmail.com> <4697bec1-af58-53e4-9fd1-293bfd8754be@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Mon, 13 Sep 2021 12:42:30 -0700
Message-ID: <CAE-0n51XcRbY7UeU6bhrrnkvD7rboq3QZFw9Tu0xQZ6e1VyjRw@mail.gmail.com>
Subject: Re: [PATCH V2 1/1] soc: qcom: smp2p: Add wakeup capability to SMP2P IRQ
To:     Deepak Kumar Singh <deesin@codeaurora.org>,
        bjorn.andersson@linaro.org, clew@codeaurora.org,
        sibis@codeaurora.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, Andy Gross <agross@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Deepak Kumar Singh (2021-09-13 10:45:19)
>
> On 8/17/2021 1:53 AM, Stephen Boyd wrote:
> >> +       ret = device_init_wakeup(&pdev->dev, true);
> > I still wonder if it's better to leave this off by default and only
> > enable it if the kernel is using autosuspend (PM_AUTOSLEEP). Then
> > userspace is responsible to decide if it can handle the wakeup with the
> > screen off, reload the remoteproc, and go back to suspend if it isn't
> > using autosuspend.
>
> Seems like not all targets use PM_AUTOSLEEP feature, even those targets
> may require wakeup to handle
>
> modem crash so that important modem events are not missed. I think we
> can keep wake up as default behavior
>
> and let the user space disable it through sysfs if it doesn't want it as
> wake up source.

I don't understand. What if userspace is simple and doesn't use
autosleep and will turn the screen on when the kernel resumes? Why do we
expect the modem crashing and causing the screen to turn on to be a good
user experience?
