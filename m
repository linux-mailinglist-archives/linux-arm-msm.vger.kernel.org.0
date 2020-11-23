Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90AAE2C17B6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Nov 2020 22:32:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730108AbgKWVch (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Nov 2020 16:32:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728178AbgKWVch (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Nov 2020 16:32:37 -0500
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B443FC0613CF
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2020 13:32:35 -0800 (PST)
Received: by mail-ot1-x343.google.com with SMTP id k3so17346663otp.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2020 13:32:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YGEsthVs3B3hpcPO96gKAE8/Tbhb2GtyiWxG6X0ff1A=;
        b=Hpdo+ZH+YbPMZk6AoVaNen/HS0pbiAnyzzkjyUMDAcgyXzkn17RwhboNFC1Dl8NkpW
         +bukjwN0ku9yq9YXueExtfVSuyO5AjDgKIPgNV/QlqHkjFywNHjsEbYVSVoyKmRg3kyu
         4UWB2tXO8sSnZAyP3KJO5Wuh7KyuZM/KpWJ8g38FSkNiSwIeyhUMk0gYjNIzSntIP3MP
         jb9v7nuwsVanx3tqDSPJINnpmJtMRwxxsz6VGrnDeqaP8C8RJLQ4WbCRs2jmwh2zUxB4
         PJnTiufVA+R99AE/CGY8MUfYb/KvpC6f2I3gLogxSALE+tOjYnG48KBDWTIXfeMecaIG
         5/8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YGEsthVs3B3hpcPO96gKAE8/Tbhb2GtyiWxG6X0ff1A=;
        b=LON/R29hwTSKQ6dyGETcpxDGy97ScwnZ845SQqsFCs3jS177F4c7Hlv+2Yq9xihQVa
         yjpLDxyMrD2TC1LeHdLMd00P+Ptl+HXOfjfyxT5pvszByIrlvI/RfyIorBR5xy6iyR3K
         kPKDeCcTew4gmcpUanfsF7V2N602THrOKBC9Y3zS3K+OJTBoaPyDeFQVPwcFvRFGaPNk
         7rfHFmIFE7SaWCRTckuoZ0KtvERDa4BV3xtwidCXryJB8CZwQGthqMtWOg2gUcsxNGQq
         zg5ogmbEz2JA84tZKwK2LSpyCEWF1yxSC77iqBEqJLoryVLAks9CTSWBoiKOJFeNpJ7y
         nTdA==
X-Gm-Message-State: AOAM530H2NUaO5+07z/KC2p/RnGA7jowS6ZOblLmc01gSLUmul6OINn5
        ndJz+t8obi/rbs00zKeIJVRtV8DdxXpB0086gtsgOw==
X-Google-Smtp-Source: ABdhPJydhGbdKp6iLz07GpoW+34/30MyOBfwhaN0lC6Yh83oFAC8Rqv47taP4eKZjQyKSDVmE1UQYTtKAzCLfSuJhIY=
X-Received: by 2002:a9d:851:: with SMTP id 75mr1132645oty.102.1606167155091;
 Mon, 23 Nov 2020 13:32:35 -0800 (PST)
MIME-Version: 1.0
References: <20201121063302.84090-1-john.stultz@linaro.org> <e860242d-9024-0f68-9b83-ef4938fc17d8@codeaurora.org>
In-Reply-To: <e860242d-9024-0f68-9b83-ef4938fc17d8@codeaurora.org>
From:   John Stultz <john.stultz@linaro.org>
Date:   Mon, 23 Nov 2020 13:32:23 -0800
Message-ID: <CALAqxLU0e=DtZ8UkJPojDEuAw8UAzKW2-jPqQ426FRzSJLLkrw@mail.gmail.com>
Subject: Re: [PATCH] regulator: Kconfig: Fix REGULATOR_QCOM_RPMH dependencies
 to avoid build error
To:     Maulik Shah <mkshah@codeaurora.org>
Cc:     lkml <linux-kernel@vger.kernel.org>, Todd Kjos <tkjos@google.com>,
        Saravana Kannan <saravanak@google.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Nov 23, 2020 at 8:55 AM Maulik Shah <mkshah@codeaurora.org> wrote:
> On 11/21/2020 12:03 PM, John Stultz wrote:
> > The kernel test robot reported the following build error:
> >
> > All errors (new ones prefixed by >>):
> >
> >     xtensa-linux-ld: drivers/regulator/qcom-rpmh-regulator.o: in function `rpmh_regulator_vrm_get_voltage_sel':
> >     qcom-rpmh-regulator.c:(.text+0x270): undefined reference to `rpmh_write'
> >     xtensa-linux-ld: drivers/regulator/qcom-rpmh-regulator.o: in function `rpmh_regulator_send_request':
> >     qcom-rpmh-regulator.c:(.text+0x2f2): undefined reference to `rpmh_write'
> >     xtensa-linux-ld: drivers/regulator/qcom-rpmh-regulator.o: in function `rpmh_regulator_vrm_get_voltage_sel':
> >>> qcom-rpmh-regulator.c:(.text+0x274): undefined reference to `rpmh_write_async'
> >     xtensa-linux-ld: drivers/regulator/qcom-rpmh-regulator.o: in function `rpmh_regulator_send_request':
> >     qcom-rpmh-regulator.c:(.text+0x2fc): undefined reference to `rpmh_write_async'
> >
> > Which is due to REGULATOR_QCOM_RPMH depending on
> > QCOM_RPMH || COMPILE_TEST. The problem is that QOM_RPMH can now
> > be a module, which in that case requires REGULATOR_QCOM_RPMH=m
> > to build.
> >
> > However, if COMPILE_TEST is enabled, REGULATOR_QCOM_RPMH can be
> > set to =y while REGULATOR_QCOM_RPMH=m which will cause build
> > failures.
> Seems typo here, you mean to say, REGULATOR_QCOM_RPMH can be set to =y
> while QCOM_RPMH=m....

Ah, yes, thanks for catching that. I'll fix it up.

> > The easy fix here is to remove COMPILE_TEST.
>
> As config QCOM_RPMH also has COMPILE_TEST, i don't see why it should be
> removed from REGULATOR_QCOM_RPMH.
>
> Can REGULATOR_QCOM_RPMH have depends on ARCH_QCOM set similar to
> QCOM_RPMH? As test bot reported build errors on other ARCH with
> regulatore driver of QCOM arch.

I think Mark's suggestion of "|| (QCOM_RPMH=n && COMPILE_TEST)" is
probably better, as you could still trigger the build issue with a
ARCH_QCOM and compile test.  But I appreciate the suggestion!

Thanks so much for the review!
-john
