Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A658A318AB
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Jun 2019 02:09:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727143AbfFAAJV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 31 May 2019 20:09:21 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:33458 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726937AbfFAAJU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 31 May 2019 20:09:20 -0400
Received: by mail-pg1-f194.google.com with SMTP id h17so4909661pgv.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 May 2019 17:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=nU7TNgR5LpcNvtYfSjIrl1EToZnQ809br5ciYzVxz7U=;
        b=I9FC/0ZN/P/uw2vcGA853atGEf+PUvmHuWe6siUN9uSS4JO2+5MB8qHRmZy20iRVpB
         YU72lxTiwZZ/cBdhfRmt7Zy9/C4xG2ZRKMpeA92Y5B2NXOz/SkEa4hL6q+pZoWboE9MU
         26z1rzEZaUZj1mx/EQ2vdmwpGyEj0YQpvCPLbv3RQuaK0IL2yu6SamJAtAgubX8z8nrM
         O753bm2N089NIIjQ6BNnrFigotYL4rmqLenI31/X9TBd3m46slJ44Z8tN0NMky7Rrsne
         ojR5pFxSLUTBs1UtZx25wL/TpcPYTVC8ez1Kkd38jLrJLXcsZXXVrXufvs70Qnidi2Sw
         vtDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=nU7TNgR5LpcNvtYfSjIrl1EToZnQ809br5ciYzVxz7U=;
        b=VXZQB+7CnG/HgwHXrTNjsY6OZ6M6G25ekg57kxDZPcQsGFKoGSTu9uO2TIT0saOzyV
         01jIUevR70BYqwkx7KuAINFxicNY8Ts1ZHV1ucToTpYz9/sSbwMxI75hVb6hh11ADEwV
         c352i1SyzUnYahPSefTFeODZeaYG3nFrZ/RzHpqxHrezoNIzzZ3tMkAx0X+nuTShP8u7
         kVg+Gz1dL3d3cx9R9725Ig4HSMhCqoFJdG6Z2hgqspgO4mnC/+ZFQHurlD8+4Cm4iQFh
         SYXWwAEA32/vW1E4vTohcQb+Cs6p6xI8FyAtWa5Tp9WW8s6nS1FbW6fGo5iJ5/WENYMc
         0dHw==
X-Gm-Message-State: APjAAAV/weUGcNJmLvWiUIAa/oIYplEp6t4UyQqVfJBP4Cejowr8dKhR
        Lv2usltXikrOItUFBfd8WMYJzg==
X-Google-Smtp-Source: APXvYqyy+66Tc/ezRAw9Zd8t0fwoOYr/EWkFnuNA2Mr7izQNHyFv54Hb3h8WLJ37PE1ILgdrom0QRg==
X-Received: by 2002:a62:582:: with SMTP id 124mr13734526pff.209.1559347760035;
        Fri, 31 May 2019 17:09:20 -0700 (PDT)
Received: from minitux (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id e4sm6451863pgi.80.2019.05.31.17.09.18
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 31 May 2019 17:09:19 -0700 (PDT)
Date:   Fri, 31 May 2019 17:09:17 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Doug Anderson <dianders@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Arun Kumar Neelakantam <aneela@codeaurora.org>,
        Vinod Koul <vkoul@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v8 2/4] soc: qcom: Add AOSS QMP driver
Message-ID: <20190601000917.GE25597@minitux>
References: <20190531030057.18328-1-bjorn.andersson@linaro.org>
 <20190531030057.18328-3-bjorn.andersson@linaro.org>
 <CAD=FV=V=_ozPiTvT-Fnrc1a+qfHYi3ynNn8cbw9ibqfKk7Am_w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD=FV=V=_ozPiTvT-Fnrc1a+qfHYi3ynNn8cbw9ibqfKk7Am_w@mail.gmail.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 31 May 15:24 PDT 2019, Doug Anderson wrote:

> Hi,
> 
> On Thu, May 30, 2019 at 8:01 PM Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> >
> > +/**
> > + * qmp_send() - send a message to the AOSS
> > + * @qmp: qmp context
> > + * @data: message to be sent
> > + * @len: length of the message
> > + *
> > + * Transmit @data to AOSS and wait for the AOSS to acknowledge the message.
> > + * @len must be a multiple of 4 and not longer than the mailbox size. Access is
> > + * synchronized by this implementation.
> > + *
> > + * Return: 0 on success, negative errno on failure
> > + */
> > +static int qmp_send(struct qmp *qmp, const void *data, size_t len)
> > +{
> > +       int ret;
> > +
> > +       if (WARN_ON(len + sizeof(u32) > qmp->size))
> > +               return -EINVAL;
> > +
> > +       if (WARN_ON(len % sizeof(u32)))
> > +               return -EINVAL;
> > +
> > +       mutex_lock(&qmp->tx_lock);
> > +
> > +       /* The message RAM only implements 32-bit accesses */
> > +       __iowrite32_copy(qmp->msgram + qmp->offset + sizeof(u32),
> > +                        data, len / sizeof(u32));
> > +       writel(len, qmp->msgram + qmp->offset);
> > +       qmp_kick(qmp);
> > +
> > +       ret = wait_event_interruptible_timeout(qmp->event,
> > +                                              qmp_message_empty(qmp), HZ);
> > +       if (!ret) {
> > +               dev_err(qmp->dev, "ucore did not ack channel\n");
> > +               ret = -ETIMEDOUT;
> > +
> > +               /* Clear message from buffer */
> > +               writel(0, qmp->msgram + qmp->offset);
> > +       } else {
> > +               ret = 0;
> > +       }
> 
> Just like Vinod said in in v7, the "ret = 0" is redundant.
> 

If the condition passed to wait_event_interruptible_timeout() evaluates
true the remote side has consumed the message and ret will be 1. We end
up in the else block (i.e. not timeout) and we want the function to
return 0, so we set ret to 0.

Please let me know if I'm reading this wrong.

> 
> > +static int qmp_qdss_clk_add(struct qmp *qmp)
> > +{
> > +       struct clk_init_data qdss_init = {
> > +               .ops = &qmp_qdss_clk_ops,
> > +               .name = "qdss",
> > +       };
> 
> As I mentioned in v7, there is no downside in marking qdss_init as
> "static const" and it avoids the compiler inserting a memcpy() to get
> this data on the stack.  Using static const also reduces your stack
> usage.
> 

In which case we would just serve it from .ro, makes sense now that I
read your comment again. 

> 
> > +       int ret;
> > +
> > +       qmp->qdss_clk.init = &qdss_init;
> > +       ret = clk_hw_register(qmp->dev, &qmp->qdss_clk);
> > +       if (ret < 0) {
> > +               dev_err(qmp->dev, "failed to register qdss clock\n");
> > +               return ret;
> > +       }
> > +
> > +       ret = of_clk_add_hw_provider(qmp->dev->of_node, of_clk_hw_simple_get,
> > +                                    &qmp->qdss_clk);
> 
> I still prefer to devm-ify the whole driver, using
> devm_add_action_or_reset() to handle things where there is no devm.
> ...but I won't insist.
> 
> 
> Above things are just nits and I won't insist.  They also could be
> addressed in follow-up patches.  Thus:
> 
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Thanks!

Regards,
Bjorn
