Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A028228642
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 May 2019 21:03:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387442AbfEWTDm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 May 2019 15:03:42 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:44729 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387422AbfEWTDm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 May 2019 15:03:42 -0400
Received: by mail-pf1-f196.google.com with SMTP id g9so3734737pfo.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 May 2019 12:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=im5wAsqOPNS931rpYbyT5hlh62m2CH14bT+VTX4iFi8=;
        b=RlkSfawB6Tvp5PVs0RZeAovH/9G7JM9zTU/uREplPlpKkKRhJC8+1SgmGs1ojpexJC
         unerpaqfCG1W30Ow61ehhZEDTQehxhBipf6KSh/blo/DjVNa0UxIpTpB8ZebBnH7nylW
         wwXq5nxW7bPh05ldVyU5j+9F4fLepvTz8Fot7IEABAFidlS9CXdtSY1C1oM9lvy6FO50
         sBXTy9BvdeVQwHSF1zrI2FdZ+r9Pfh2qNZW/8C8J7YawnL0RHT4izwKa1UM50IzuRFbx
         zhIi8MEApWcwXP4DQqZe0tai7vElfRLD/VHcinMdAi/tUR1o9RcjW+/9UDYLFdEY4YB9
         M7Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=im5wAsqOPNS931rpYbyT5hlh62m2CH14bT+VTX4iFi8=;
        b=PabmWfXps98VlX2IcTFZ/oTuuz2ZcfvkC+aKJ3PLCCwWmBa41JtXk6gpN+P1W6bDKZ
         D8cRdZFedzNfuWsNa8UeC4dufD+AcTlONziXahoLTi2wOEYLosWN6DEy+8lWFl7Azm6m
         zanw/b2kmSXUCFQ1YALmgXMhb4ZOeFzf3f0UERQXmSa3F7InA8eVnhWO7E2s3L0GMYXe
         UCGz4cDZOjT/nPRzCxoJMA3aQJ9v1zTU40KuDMWN2VgkiYbiAlH6HZ6qfP5r8uvh0qBV
         P8+kBmTkgmKAxREES3N0jlsc+5AtA4r9PmQaGwsDOpsQ7NRSeql4xPW6ixyR7L+CNkRR
         HQyg==
X-Gm-Message-State: APjAAAXSQW2zg7sj9NKmRMc6pJ7IGlrm+Aaxqh9k78Z+G1gb6BPMJOrx
        6JLLWf5J2sjybpa3FnpRLQ++8Q==
X-Google-Smtp-Source: APXvYqwUezZglFJTkVqKMfs/5cMfpnZQCtviFEOwA6H6Iww//+PsP5Mjj+zlaHjBoZtuyERN4e3lLw==
X-Received: by 2002:a63:d816:: with SMTP id b22mr98259664pgh.16.1558638221127;
        Thu, 23 May 2019 12:03:41 -0700 (PDT)
Received: from minitux (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id a37sm110542pga.67.2019.05.23.12.03.39
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 May 2019 12:03:40 -0700 (PDT)
Date:   Thu, 23 May 2019 12:03:38 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Doug Anderson <dianders@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 2/4] soc: qcom: Add AOSS QMP driver
Message-ID: <20190523190338.GT31438@minitux>
References: <20190501043734.26706-1-bjorn.andersson@linaro.org>
 <20190501043734.26706-3-bjorn.andersson@linaro.org>
 <CAD=FV=VVxKSp6e=j8YM8JBrhsF+T=0=8xDjd_817hphOMWHVFA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD=FV=VVxKSp6e=j8YM8JBrhsF+T=0=8xDjd_817hphOMWHVFA@mail.gmail.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 23 May 09:38 PDT 2019, Doug Anderson wrote:

> Hi,
> 
> On Tue, Apr 30, 2019 at 9:38 PM Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> >
> > +static int qmp_qdss_clk_prepare(struct clk_hw *hw)
> > +{
> > +       struct qmp *qmp = container_of(hw, struct qmp, qdss_clk);
> > +       char buf[QMP_MSG_LEN] = "{class: clock, res: qdss, val: 1}";
> 
> nit: "static const" the buf?  No need to copy it to the stack each
> time.  In qmp_qdss_clk_unprepare() too.
> 

Thanks, that makes sense.

> ...your string is also now fixed at 34 bytes big (including the '\0').
> Do we still need to send exactly 96 bytes, or can we dumb this down to
> 36?  We'll get a compile error if we overflow, right?  If this truly
> needs to be exactly 96 bytes maybe qmp_send()'s error checks should
> check for things being exactly 96 bytes instead of checking for > and
> % 4.
> 

I double checked with my contacts and the only requirement here is that
memory has to be word-accessed, so I'll figure out a sane way to write
this.

> 
> > +static int qmp_qdss_clk_add(struct qmp *qmp)
> > +{
> > +       struct clk_init_data qdss_init = {
> > +               .ops = &qmp_qdss_clk_ops,
> > +               .name = "qdss",
> > +       };
> 
> Can't qdss_init be "static const"?  That had the advantage of not
> needing to construct it on the stack and also of it having a longer
> lifetime.  It looks like clk_register() stores the "hw" pointer in its
> structure and the "hw" structure will have a pointer here.  While I
> can believe that it never looks at it again, it's nice if that pointer
> doesn't point somewhere on an old stack.
> 

The purpose here was for clk_hw_register() to consume it and never look
back, but I agree that it's a bit fragile. I'll review Stephen's
proposed patch.

> I suppose we could go the other way and try to mark more stuff in this
> module as __init and __initdata, but even then at least the pointer
> won't be onto a stack.  ;-)
> 
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
> > +       return of_clk_add_hw_provider(qmp->dev->of_node, of_clk_hw_simple_get,
> > +                                     &qmp->qdss_clk);
> 
> devm_clk_hw_register() and devm_of_clk_add_hw_provider()?  If you're
> worried about ordering you could always throw in
> devm_add_action_or_reset() to handle the qmp_pd_remove(), qmp_close()
> and mbox_free_channel().
> 
> ...with that you could fully get rid of qmp_remove() and also your
> setting of drvdata.
> 

Yeah, I was worried about qmp_close() before unregistering the clock.
I'll take another look, will at least have to fix the error handling on
of_clk_add_hw_provider()

> 
> > +static void qmp_pd_remove(struct qmp *qmp)
> > +{
> > +       struct genpd_onecell_data *data = &qmp->pd_data;
> > +       struct device *dev = qmp->dev;
> > +       int i;
> > +
> > +       of_genpd_del_provider(dev->of_node);
> > +
> > +       for (i = 0; i < data->num_domains; i++)
> > +               pm_genpd_remove(data->domains[i]);
> 
> Still feels like the above loop would be better as:
>   for (i = data->num_domains - 1; i >= 0; i--)
> 

To me this carries a message that the removal order is significant,
which I'm unable to convince myself that it is.

> 
> (BTW: any way you could add me to the CC list for future patches so I
> notice them earlier?)
> 

Yes of course, thanks for your review.

Regards,
Bjorn
