Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D925246089
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Aug 2020 10:44:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726769AbgHQIov (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Aug 2020 04:44:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726810AbgHQIok (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Aug 2020 04:44:40 -0400
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com [IPv6:2607:f8b0:4864:20::e41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F8FCC06138A
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2020 01:44:40 -0700 (PDT)
Received: by mail-vs1-xe41.google.com with SMTP id i129so7855671vsi.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2020 01:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JW8u7xiSKNIzGMhYWbwC+RKDQR8pzglywvhzZXDEkZQ=;
        b=WHXclwahJSz/Cxrjjcju+WOHdG8o0dUnAAakONyLI65BlMgWeRagwi6qVETf7MW9tm
         R+5kFslbjP2FQgV8J8DYMH/8owm2iFxmwGKoNTkuKOQxor0qoEPZv9S2yPl596YZymuF
         Xq9yPFKKxEuUBgsnaSXaDPciI8oqVyyjr6CY6DLm/rqst+003VjBk5l3IvB0VdXiMvQe
         dhtFwQHIklZ9Wb+Gmrb4/yG9Pt248XXZunKUIzE045m7luJYAFPaLMQNV4PXRYaQd5A0
         tMgC6NzU7nKj+SgOr3wxECIANIgB3N+nQkWv3H+yN3HRZcVmif44ZXgEiW5izAeanb0b
         hroQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JW8u7xiSKNIzGMhYWbwC+RKDQR8pzglywvhzZXDEkZQ=;
        b=hMXMvL7gfNJ2zqPHXh13G5sem22CoJdffRxNUi9ivAPibcbfnobhIkkJkrjYVWVPyT
         SrjpP/nfPyJO4uFjxsO87L9sU5I7sHPZhltVLKMsZ3XET11oIXr1378Rr+TdxvPEIWFR
         WXhT74us3jPl9iZS+qBDntkAekRx/u8vXzLhkoXTG/9oDeMgWHODqfMJdQDmcs4wfqYe
         H+k6Nkmd3eVhS+tW6vBAK80bW3Lj4wo7WyblSu3ZPOeSa0Xf9DhGIXFKJ0dxGVZNToFn
         rGOkajWkMWzjQpFkQnhS3nZDS8ltCP616ZZeb419xSSQ8AUlxIxixWWlbxDurAyQQ1/U
         KFZA==
X-Gm-Message-State: AOAM531ZmnAEsLdDVrpYuDbkGGvotI1vGw7IOjbnoTsFhybCmbu4oeZB
        5FJ+qAzlm1eCUwx06EPK8ZjXB/mnKru73q7i6JRczw==
X-Google-Smtp-Source: ABdhPJw35yYpOaJW1X+f4vuBqtH7/IKZ8YOmgvU3WY2dnnlAcinZeZ/zAzO2H+c6qCaz0SSHgyynVt0yqlzSmqmZ5Kc=
X-Received: by 2002:a67:8c06:: with SMTP id o6mr7569090vsd.200.1597653878128;
 Mon, 17 Aug 2020 01:44:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200811190252.10559-1-sibis@codeaurora.org> <CAPDyKFqNMEtHwcJFxYQP5H1Yjrsr1T3UUZoXes69EthSjAYs2A@mail.gmail.com>
 <1ba3e4d703dd0a52547d63fa014451eb@codeaurora.org> <CAPDyKFrH9WTg4O5L+e1AijNvsagLYZ9QVTeoD0x0SQgYd3hkBg@mail.gmail.com>
 <1ca666c336ebee569a429e729d5ae547@codeaurora.org>
In-Reply-To: <1ca666c336ebee569a429e729d5ae547@codeaurora.org>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Mon, 17 Aug 2020 10:44:01 +0200
Message-ID: <CAPDyKFrqxRrWSX5VaMy4DSjFNaMikKBYsZy5NiPMJvUybYttsw@mail.gmail.com>
Subject: Re: [PATCH 1/2] PM / Domains: Add GENPD_FLAG_SUSPEND_ON flag
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Andy Gross <agross@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux PM <linux-pm@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pavel Machek <pavel@ucw.cz>, Len Brown <len.brown@intel.com>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Doug Anderson <dianders@chromium.org>,
        linux-kernel-owner@vger.kernel.org,
        Kevin Hilman <khilman@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 13 Aug 2020 at 19:26, Sibi Sankar <sibis@codeaurora.org> wrote:
>
> On 2020-08-13 18:04, Ulf Hansson wrote:
> > On Wed, 12 Aug 2020 at 19:03, Sibi Sankar <sibis@codeaurora.org> wrote:
> >>
> >> Uffe,
> >> Thanks for taking time to review the
> >> series!
> >>
> >> On 2020-08-12 15:15, Ulf Hansson wrote:
> >> > On Tue, 11 Aug 2020 at 21:03, Sibi Sankar <sibis@codeaurora.org> wrote:
> >> >>
> >> >> This is for power domains which needs to stay powered on for suspend
> >> >> but can be powered on/off as part of runtime PM. This flag is aimed at
> >> >> power domains coupled to remote processors which enter suspend states
> >> >> independent to that of the application processor. Such power domains
> >> >> are turned off only on remote processor crash/shutdown.
> >> >
> >> > As Kevin also requested, please elaborate more on the use case.
> >> >
> >> > Why exactly must the PM domain stay powered on during system suspend?
> >> > Is there a wakeup configured that needs to be managed - or is there a
> >> > co-processor/FW behaviour that needs to be obeyed to?
> >>
> >> Yes this is a co-processor behavior that
> >> needs to be obeyed. Specifically application
> >> processor notifies the Always on Subsystem
> >> (AOSS) that a particular co-processor is up
> >> using the power domains exposed by AOSS QMP
> >> driver. AOSS uses this information to wait
> >> for the co-processors to suspend before
> >> starting its sleep sequence. The application
> >> processor powers off these power domains only
> >> if the co-processor has crashed or powered
> >> off.
> >
> > Thanks for clarifying!
> >
> > Although, can you please elaborate a bit more on the actual use case?
> > What are the typical co-processor and what drivers are involved in
> > managing it?
>
> The co-processors using the power domains
> exposed by qcom_aoss driver are modem,
> audio dsp, compute dsp managed using
> qcom_q6v5_mss and qcom_q6v5_pas driver.
>
> >
> > As you may know, runtime PM becomes disabled during system suspend of
> > a device. Which means, if the driver tries to power off the
> > coprocessor (via calling pm_runtime_put() for example), somewhere in
> > the system suspend phase of the corresponding device, its attached PM
> > domain stays powered on when managed by genpd.
>
> The drivers aren't really expected
> do anything during suspend/resume
> pretty much because the co-processors
> enter low-power modes independent to
> that of the application processor. On
> co-processor crash the remoteproc core
> does a pm_stay_awake followed by a
> pm_relax after crash recovery.

Okay, thanks again for clarifying. You have convinced me about the
need for a new flag to cope with these use cases.

Would you mind updating the commit message with some of the
information you just provided?

Additionally, to make it clear that the flag should be used to keep
the PM domain powered on during system suspend, but only if it's
already powered on - please rename the flag to GENPD_FLAG_NO_SUSPEND,
and update the corresponding description of it in the header file.

[...]

Kind regards
Uffe
