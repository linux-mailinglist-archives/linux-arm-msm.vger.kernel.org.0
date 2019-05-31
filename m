Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 891FE31722
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Jun 2019 00:24:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726446AbfEaWYQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 31 May 2019 18:24:16 -0400
Received: from mail-ua1-f65.google.com ([209.85.222.65]:41432 "EHLO
        mail-ua1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725913AbfEaWYQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 31 May 2019 18:24:16 -0400
Received: by mail-ua1-f65.google.com with SMTP id n2so4428395uad.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 May 2019 15:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NQat/hmrJY1AaWIgT3mTRP/HxuxnRB68t461DgyKajk=;
        b=aIKKW82dvdOzE+1wEmRt5/OwfwxeYiGLLG20GVyJdVys1rGKr/+ihpppzprb/QLFRA
         CKos1Ee4G0Qz03wjNyxB/eB2jNB7FjGKMaAx9dfsX6Zdsu3o/y5JAI9PvBKgRa+xkyQP
         eWD/nvaNTkLAYBd98lvZQunL1eNswJ832l2pY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NQat/hmrJY1AaWIgT3mTRP/HxuxnRB68t461DgyKajk=;
        b=ZegJSj35PuZa2aGhsqzzSwus92E0yRw8rCS4reRGVN1SiRRPJtUm8DuMlHxUnjoeIp
         XY+bgVq5hON6WLGPHkH6soqf5pzgdz6q+cXgew/iz6pUUGo50a1jKJ9K7Q75hIGFULs1
         LLUj6pwD7c2MuJPRDxQzyRE89Q+TEOqR9UC0i9FsRhz25Z8tteqbJuoZoZfRm4E/ea78
         GKjyhDNTDe+4Fwq2HW0ZJ38GM8lz8zRXM3jxbvyl2NXOHUOtCqOkaSZOYPAYDjw7bJkq
         iac9sFEtXUqo1txjglHMWauHG1l/S1Ub1Q9q2dn+CQEximiF+A9l9chJi6EE6DdLqgY2
         pO9A==
X-Gm-Message-State: APjAAAXsSuwyV2FjIo3d7asMBZXTsdOsyk30hUh57vckwKZ2/SyDJvoI
        xS02+D+fJ7pTyOSXco2qPNr7z686DeQ=
X-Google-Smtp-Source: APXvYqxBv43JdPjvUcMj/+UFEQSgwAE44TuaHvn/M01X8luUOhtNwdyUyHt0yR8gZVull2bPTKbMxg==
X-Received: by 2002:ab0:671a:: with SMTP id q26mr3928128uam.7.1559341455035;
        Fri, 31 May 2019 15:24:15 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id n132sm7423921vke.18.2019.05.31.15.24.13
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Fri, 31 May 2019 15:24:13 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id o5so7728835vsq.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 May 2019 15:24:13 -0700 (PDT)
X-Received: by 2002:a67:442:: with SMTP id 63mr2686288vse.111.1559341452918;
 Fri, 31 May 2019 15:24:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190531030057.18328-1-bjorn.andersson@linaro.org> <20190531030057.18328-3-bjorn.andersson@linaro.org>
In-Reply-To: <20190531030057.18328-3-bjorn.andersson@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 31 May 2019 15:24:00 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V=_ozPiTvT-Fnrc1a+qfHYi3ynNn8cbw9ibqfKk7Am_w@mail.gmail.com>
Message-ID: <CAD=FV=V=_ozPiTvT-Fnrc1a+qfHYi3ynNn8cbw9ibqfKk7Am_w@mail.gmail.com>
Subject: Re: [PATCH v8 2/4] soc: qcom: Add AOSS QMP driver
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Arun Kumar Neelakantam <aneela@codeaurora.org>,
        Vinod Koul <vkoul@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, May 30, 2019 at 8:01 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> +/**
> + * qmp_send() - send a message to the AOSS
> + * @qmp: qmp context
> + * @data: message to be sent
> + * @len: length of the message
> + *
> + * Transmit @data to AOSS and wait for the AOSS to acknowledge the message.
> + * @len must be a multiple of 4 and not longer than the mailbox size. Access is
> + * synchronized by this implementation.
> + *
> + * Return: 0 on success, negative errno on failure
> + */
> +static int qmp_send(struct qmp *qmp, const void *data, size_t len)
> +{
> +       int ret;
> +
> +       if (WARN_ON(len + sizeof(u32) > qmp->size))
> +               return -EINVAL;
> +
> +       if (WARN_ON(len % sizeof(u32)))
> +               return -EINVAL;
> +
> +       mutex_lock(&qmp->tx_lock);
> +
> +       /* The message RAM only implements 32-bit accesses */
> +       __iowrite32_copy(qmp->msgram + qmp->offset + sizeof(u32),
> +                        data, len / sizeof(u32));
> +       writel(len, qmp->msgram + qmp->offset);
> +       qmp_kick(qmp);
> +
> +       ret = wait_event_interruptible_timeout(qmp->event,
> +                                              qmp_message_empty(qmp), HZ);
> +       if (!ret) {
> +               dev_err(qmp->dev, "ucore did not ack channel\n");
> +               ret = -ETIMEDOUT;
> +
> +               /* Clear message from buffer */
> +               writel(0, qmp->msgram + qmp->offset);
> +       } else {
> +               ret = 0;
> +       }

Just like Vinod said in in v7, the "ret = 0" is redundant.


> +static int qmp_qdss_clk_add(struct qmp *qmp)
> +{
> +       struct clk_init_data qdss_init = {
> +               .ops = &qmp_qdss_clk_ops,
> +               .name = "qdss",
> +       };

As I mentioned in v7, there is no downside in marking qdss_init as
"static const" and it avoids the compiler inserting a memcpy() to get
this data on the stack.  Using static const also reduces your stack
usage.


> +       int ret;
> +
> +       qmp->qdss_clk.init = &qdss_init;
> +       ret = clk_hw_register(qmp->dev, &qmp->qdss_clk);
> +       if (ret < 0) {
> +               dev_err(qmp->dev, "failed to register qdss clock\n");
> +               return ret;
> +       }
> +
> +       ret = of_clk_add_hw_provider(qmp->dev->of_node, of_clk_hw_simple_get,
> +                                    &qmp->qdss_clk);

I still prefer to devm-ify the whole driver, using
devm_add_action_or_reset() to handle things where there is no devm.
...but I won't insist.


Above things are just nits and I won't insist.  They also could be
addressed in follow-up patches.  Thus:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
