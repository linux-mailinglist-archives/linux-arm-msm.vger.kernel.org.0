Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 124CD3D40B9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jul 2021 21:28:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229461AbhGWSrm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Jul 2021 14:47:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230490AbhGWSrm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Jul 2021 14:47:42 -0400
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F727C061757
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jul 2021 12:28:14 -0700 (PDT)
Received: by mail-ot1-x336.google.com with SMTP id c7-20020a9d27870000b02904d360fbc71bso3046839otb.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jul 2021 12:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=Bs+9Wf2Rg7YUqulOFkE7bAQ3itXKARyReOSzJvhssws=;
        b=EZ92o+lU4+P+XV7xO6773WcUyvEJ/+NHJbWZkHjHBnYF8dDDdjb+oH7HgG/fmo4XEQ
         8ZnGklqLIagB3CjPx52/0BFFaDy3J1PTTuLAi/AUmOx77rJR7GlZ2OxfBmx9+QKqLayf
         44+/7xRfVvPMZMYJRm31me7qFPlWYWG/Np0ao=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=Bs+9Wf2Rg7YUqulOFkE7bAQ3itXKARyReOSzJvhssws=;
        b=ABKS3zitSDEmSgrIqVNpMKd27S5+95AydGDBz4BMlPbZeWHO2tEE1EFLnsmnQwTUOl
         4GHTyt9FEnLqbsKKCp/YaAlw/JQC3JGPdiyzmpHDZL9JZllhiRnFCrogYN3ND6w73Uvb
         2D22Xjj2Uxc0CbXih269o5Nor3ZJSb6dhG/+WLkeU5wSo6YYaVPn8W+DJtSfftPnaGB0
         swku7CzYWHiv+F3qlb6uBseQgLdgzxa8HY7BQ/+G4zxA6qevjit3BHs0zE1trNfTbERq
         rS4wQDuSWlEMAWhELtocWIIvgmBDM01JwHvVOSip1f1/8qeIkLWNQBcZmuGxh8+FcCHN
         fQcg==
X-Gm-Message-State: AOAM5339ixRBag2ixuxXCBQpkLfZrjNgCBGOmQE8cDnweFcc7Ykd382v
        0s+Lqanquq+75DYEzhwEATpJoTxtiInUwmPkepADkw==
X-Google-Smtp-Source: ABdhPJz6hKhnuc07sMCNisJAktb5x8bleD4y8wHakw0tll6AwU3RSHxxohogKWMuvWqjWon3uBzCV+xu7sZ4SrYCDkM=
X-Received: by 2002:a9d:8c7:: with SMTP id 65mr4160483otf.25.1627068493821;
 Fri, 23 Jul 2021 12:28:13 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 23 Jul 2021 19:28:13 +0000
MIME-Version: 1.0
In-Reply-To: <eaa90fa6-e7a4-169d-4ac0-42f8c9545a5b@codeaurora.org>
References: <1623237532-20829-1-git-send-email-sibis@codeaurora.org>
 <1623237532-20829-2-git-send-email-sibis@codeaurora.org> <CAE-0n506v5cmyUb+Ge-H7t1HsqNatgxDmq28rqdyGZDbsM4pXg@mail.gmail.com>
 <eaa90fa6-e7a4-169d-4ac0-42f8c9545a5b@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Fri, 23 Jul 2021 19:28:13 +0000
Message-ID: <CAE-0n50Nkd2etcS_ciiT6Pmz5NXPJm4xS_YaABPNgBUF2mFrzg@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] soc: qcom: aoss: Expose send for generic usecase
To:     Deepak Kumar Singh <deesin@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>, bjorn.andersson@linaro.org
Cc:     agross@kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, manivannan.sadhasivam@linaro.org,
        Chris Lew <clew@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Deepak Kumar Singh (2021-07-23 02:51:50)
>
> On 7/21/2021 12:07 PM, Stephen Boyd wrote:
> > Quoting Sibi Sankar (2021-06-09 04:18:51)
> >> From: Deepak Kumar Singh <deesin@codeaurora.org>
> >>
> >> Not all upcoming usecases will have an interface to allow the aoss
> >> driver to hook onto. Expose the send api and create a get function to
> >> enable drivers to send their own messages to aoss.
> >>
> >> Signed-off-by: Chris Lew <clew@codeaurora.org>
> >> Signed-off-by: Deepak Kumar Singh <deesin@codeaurora.org>
> >> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> >> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> >> ---
> >>
> >> v4:
> >>   * Fix compilation error due to missing qmp_put
> >>   * Minor typos [s/tarcks/tracks]
> >>
> >>   drivers/soc/qcom/qcom_aoss.c       | 70 ++++++++++++++++++++++++++++++++++++--
> >>   include/linux/soc/qcom/qcom_aoss.h | 36 ++++++++++++++++++++
> >>   2 files changed, 104 insertions(+), 2 deletions(-)
> >>   create mode 100644 include/linux/soc/qcom/qcom_aoss.h
> >>
> >> diff --git a/drivers/soc/qcom/qcom_aoss.c b/drivers/soc/qcom/qcom_aoss.c
> >> index 934fcc4d2b05..e8f48760bac8 100644
> >> --- a/drivers/soc/qcom/qcom_aoss.c
> >> +++ b/drivers/soc/qcom/qcom_aoss.c
> >> @@ -522,13 +582,14 @@ static int qmp_probe(struct platform_device *pdev)
> >>          int irq;
> >>          int ret;
> >>
> >> -       qmp = devm_kzalloc(&pdev->dev, sizeof(*qmp), GFP_KERNEL);
> >> +       qmp = kzalloc(sizeof(*qmp), GFP_KERNEL);
> >>          if (!qmp)
> >>                  return -ENOMEM;
> >>
> >>          qmp->dev = &pdev->dev;
> >>          init_waitqueue_head(&qmp->event);
> >>          mutex_init(&qmp->tx_lock);
> >> +       kref_init(&qmp->refcount);
> >>
> >>          res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> >>          qmp->msgram = devm_ioremap_resource(&pdev->dev, res);
> >> @@ -569,6 +630,8 @@ static int qmp_probe(struct platform_device *pdev)
> >>
> >>          platform_set_drvdata(pdev, qmp);
> >>
> >> +       atomic_set(&qmp->orphan, 0);
> >> +
> >>          return 0;
> >>
> >>   err_remove_qdss_clk:
> >> @@ -577,6 +640,7 @@ static int qmp_probe(struct platform_device *pdev)
> >>          qmp_close(qmp);
> >>   err_free_mbox:
> >>          mbox_free_channel(qmp->mbox_chan);
> >> +       kfree(qmp);
> >>
> >>          return ret;
> >>   }
> >> @@ -590,7 +654,9 @@ static int qmp_remove(struct platform_device *pdev)
> >>          qmp_cooling_devices_remove(qmp);
> >>
> >>          qmp_close(qmp);
> >> +       atomic_set(&qmp->orphan, 1);
> > This looks odd. Why are we letting the device be removed while it is in
> > use by other drivers? Can't we pin the device with get_device() so it
> > can't be removed and then prevent the driver from being removed until
> > all the consumer drivers drop the reference, i.e. suppress sysfs unbind?
> >
> > Otherwise it looks like a generic problem that all provider devices,
> > clks, regulators, gpios, etc. have to deal with and thus this
> > hand-rolled mechanism can't be right.
>
> As per my earlier discussion with Bjorn, device could be unbound using
> sysfs, in which case
>
> remove() is called irrespective of whether any client driver is holding
> struct device reference
>
> or not. That's why i have added separate refcount for qmp handle and
> marking it invalid if
>
> qmp_remove() is called.
>

We have struct device_driver::suppress_bind_attrs for that. Can you set
it?
