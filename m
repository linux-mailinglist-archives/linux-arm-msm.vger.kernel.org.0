Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC1CC3E4BA7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Aug 2021 19:58:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235053AbhHIR6P (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Aug 2021 13:58:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235432AbhHIR50 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Aug 2021 13:57:26 -0400
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DFC9C06179C
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Aug 2021 10:56:57 -0700 (PDT)
Received: by mail-ot1-x32b.google.com with SMTP id e13-20020a9d63cd0000b02904fa42f9d275so8038641otl.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Aug 2021 10:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=KOmXqq5WUgRYl6rKi6CL03DpE0hkR+KRhfuo0fQGavg=;
        b=Z/+6IzvspqSNNMbLZuEZJjfe3DAzYbiCzK4bmXKU4jiJDkAqMJAEhPkm8l3nnwOlLi
         bio6K49f6/+5uBHlNm2Sf9kz/cpY0VRRjGgQFFGZZ1L+e41qNR9Ope5StTZsMN7QeNAT
         QooLqHcKMEYOmkpnDQAlSJquavCjJ56ed/ZLM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=KOmXqq5WUgRYl6rKi6CL03DpE0hkR+KRhfuo0fQGavg=;
        b=P8PHnlnDUdIfrJNIzwoDIqiTAeiCrgPjJG0O/suukhQnukls4c0YG0OmuzV2Ao1WVv
         O7VGk/mNZ7BuWBfCTGx2x9t7pdGo3hu0eN44fjBLPt4t6tUEKybupl3vaSCmG6xZs7eD
         7qRficKYPsvNPRkgfHqDvtglamxqx94AnE097+jGexZ6GifUjpm/6R6v/XtXwoa1UboE
         WdLZ/zNGKc9yoBoVaEAmuca57jAR7mi9Gp3IHwxAweS1M6tvDJEk6K3QcbVvX9+ESYGs
         Tq9q4S0wNnhcZuW8drDvUwh2DnozddTlqsTrI3Bjf+4/4yZaeVoK2JsiHp40Qf842jlU
         ZWxg==
X-Gm-Message-State: AOAM530BWtZLb+6+im2gFe2l8fK7DAU+/ra6ss2klmxO4vuWDRPF1+XE
        SoTRsYYmTD9vQl+fCoBGvvgYsRWij+9VICFPq5uzNQ==
X-Google-Smtp-Source: ABdhPJzIQbkU3YPJSfHfxkH5DUXal/MJiqT8OMpcVvT1eQyFk7oJwh0p1lPoBxT2KgXNEh9K2vENY9/viIcaKFRY8X0=
X-Received: by 2002:a05:6830:1490:: with SMTP id s16mr18002662otq.233.1628531816398;
 Mon, 09 Aug 2021 10:56:56 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 9 Aug 2021 10:56:55 -0700
MIME-Version: 1.0
In-Reply-To: <4b3b6b0f-8c21-53ce-4341-1e8686d3b73c@codeaurora.org>
References: <1628161974-7182-1-git-send-email-deesin@codeaurora.org>
 <1628161974-7182-2-git-send-email-deesin@codeaurora.org> <CAE-0n50fN42fhAcoCJBz-PEW5sEdqSKT5YuaxWE_29J=P1=vQw@mail.gmail.com>
 <4b3b6b0f-8c21-53ce-4341-1e8686d3b73c@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Mon, 9 Aug 2021 10:56:55 -0700
Message-ID: <CAE-0n53cxsMMsJg3dpnTi+AwKiZKxG=xy4jBKX=FDKMzHc3y1Q@mail.gmail.com>
Subject: Re: [PATCH V5 1/2] soc: qcom: aoss: Expose send for generic usecase
To:     Deepak Kumar Singh <deesin@codeaurora.org>,
        bjorn.andersson@linaro.org, clew@codeaurora.org,
        sibis@codeaurora.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, Andy Gross <agross@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Deepak Kumar Singh (2021-08-09 02:57:26)
>
> On 8/6/2021 12:04 AM, Stephen Boyd wrote:
> > Quoting Deepak Kumar Singh (2021-08-05 04:12:53)
> >> diff --git a/drivers/soc/qcom/qcom_aoss.c b/drivers/soc/qcom/qcom_aoss.c
> >> index 934fcc4..b84cb31 100644
> >> --- a/drivers/soc/qcom/qcom_aoss.c
> >> +++ b/drivers/soc/qcom/qcom_aoss.c
> >> @@ -515,6 +521,43 @@ static void qmp_cooling_devices_remove(struct qmp *qmp)
> >>                  thermal_cooling_device_unregister(qmp->cooling_devs[i].cdev);
> >>   }
> >>
> >> +/**
> >> + * qmp_get() - get a qmp handle from a device
> >> + * @dev: client device pointer
> >> + *
> >> + * Return: handle to qmp device on success, ERR_PTR() on failure
> >> + */
> >> +struct qmp *qmp_get(struct device *dev)
> >> +{
> >> +       struct platform_device *pdev;
> >> +       struct device_node *np;
> >> +       struct qmp *qmp;
> >> +
> >> +       if (!dev || !dev->of_node)
> >> +               return ERR_PTR(-EINVAL);
> >> +
> >> +       np = of_parse_phandle(dev->of_node, "qcom,qmp", 0);
> >> +       if (!np)
> >> +               return ERR_PTR(-ENODEV);
> >> +
> >> +       pdev = of_find_device_by_node(np);
> >> +       of_node_put(np);
> >> +       if (!pdev)
> >> +               return ERR_PTR(-EINVAL);
> >> +
> >> +       qmp = platform_get_drvdata(pdev);
> >> +
> >> +       return qmp ? qmp : ERR_PTR(-EPROBE_DEFER);
> >> +}
> >> +EXPORT_SYMBOL(qmp_get);
> >> +
> >> +void qmp_put(struct qmp *qmp)
> >> +{
> >> +       if (!IS_ERR_OR_NULL(qmp))
> >> +               put_device(qmp->dev);
> > Where is the corresponding get_device() call?
> of_find_device_by_node() internally calls get_device(), so no need to
> call get_device() explicitly.

Got it. Can you add a comment here so we remember?

	/*
	 * Match get_device() inside of_find_device_by_node() in
	 * qmp_get()
	 */

and it would be super useful if we could update the documentation on
that API, and the one it calls, so callers know about this.
