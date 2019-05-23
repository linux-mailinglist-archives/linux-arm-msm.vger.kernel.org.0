Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 41F81283F2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 May 2019 18:38:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731371AbfEWQib (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 May 2019 12:38:31 -0400
Received: from mail-vk1-f193.google.com ([209.85.221.193]:37825 "EHLO
        mail-vk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731369AbfEWQib (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 May 2019 12:38:31 -0400
Received: by mail-vk1-f193.google.com with SMTP id j124so1494190vkb.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 May 2019 09:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=r0rDpYcpEU2DlpfJPWclkw5oXzfo0RvY7oAeAA+3T90=;
        b=f7DFyXKTBWt5U7XgFYEc6tpBvygZbJf11fOqOQXgOXkwOVzXyJkqrEFj1jL04GFqyF
         KaPeTgWPv1xcwPktqe+PKBE5ipEuuUyahM+6zRAjX7mwCrDn8SQiMqpgRr8v4QSo8uBt
         mai/Br9ocyY4z1h4P4lZ9JoH9BK9pnb/uS9X8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=r0rDpYcpEU2DlpfJPWclkw5oXzfo0RvY7oAeAA+3T90=;
        b=jnlxNF8x/+LTi/j9j5+hHT0NG2bMcvfeARl0k3k9N7a+2QqO6d9m39p0Ny/3InfYSl
         DnGOEqIJ2L1IomoIJp1KJzDElrTXe4/M4tV0NSKBBfIZXuGIzdOQvW/QPseM01xmCAhV
         OeVlEtVABMl7QtNQYHfu6raRw/oIylGT35fWA2i12cMfwfukVVpVHumZtZc2EAXCvOpH
         sVMiE5p6RKNrKpkwrN4I/4H4Esmbi9Q1jsMLlRQ/HowU/+G5+NGz7oD2ZmQtmxnevUBR
         OPSJbe5Aqp0/IRdoI9DlwctjiiSQrLbHvl/6qJP4mZQu/nJwkJTLXwCdu9YVLZMGYu0b
         LcCQ==
X-Gm-Message-State: APjAAAU6Eoi73iip+Bu3nBaYRLWcaWfcfOn69BIqxc26ZbFTo04vKHl6
        VJC7NdF0HoP0pUTu9mqDSw4fHNulrs8=
X-Google-Smtp-Source: APXvYqz/oTfbEtlGty3H8JglgyULdsM94SrJkPI1zjEvU8nSyQWsPBN1eMUA5Bndy7K5lwhccXvryg==
X-Received: by 2002:a1f:4ec6:: with SMTP id c189mr2109607vkb.17.1558629509336;
        Thu, 23 May 2019 09:38:29 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id v133sm2142883vkv.5.2019.05.23.09.38.25
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Thu, 23 May 2019 09:38:27 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id d128so3968589vsc.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 May 2019 09:38:25 -0700 (PDT)
X-Received: by 2002:a67:1cc2:: with SMTP id c185mr23275103vsc.20.1558629505309;
 Thu, 23 May 2019 09:38:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190501043734.26706-1-bjorn.andersson@linaro.org> <20190501043734.26706-3-bjorn.andersson@linaro.org>
In-Reply-To: <20190501043734.26706-3-bjorn.andersson@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 23 May 2019 09:38:13 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VVxKSp6e=j8YM8JBrhsF+T=0=8xDjd_817hphOMWHVFA@mail.gmail.com>
Message-ID: <CAD=FV=VVxKSp6e=j8YM8JBrhsF+T=0=8xDjd_817hphOMWHVFA@mail.gmail.com>
Subject: Re: [PATCH v7 2/4] soc: qcom: Add AOSS QMP driver
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Apr 30, 2019 at 9:38 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> +static int qmp_qdss_clk_prepare(struct clk_hw *hw)
> +{
> +       struct qmp *qmp = container_of(hw, struct qmp, qdss_clk);
> +       char buf[QMP_MSG_LEN] = "{class: clock, res: qdss, val: 1}";

nit: "static const" the buf?  No need to copy it to the stack each
time.  In qmp_qdss_clk_unprepare() too.

...your string is also now fixed at 34 bytes big (including the '\0').
Do we still need to send exactly 96 bytes, or can we dumb this down to
36?  We'll get a compile error if we overflow, right?  If this truly
needs to be exactly 96 bytes maybe qmp_send()'s error checks should
check for things being exactly 96 bytes instead of checking for > and
% 4.


> +static int qmp_qdss_clk_add(struct qmp *qmp)
> +{
> +       struct clk_init_data qdss_init = {
> +               .ops = &qmp_qdss_clk_ops,
> +               .name = "qdss",
> +       };

Can't qdss_init be "static const"?  That had the advantage of not
needing to construct it on the stack and also of it having a longer
lifetime.  It looks like clk_register() stores the "hw" pointer in its
structure and the "hw" structure will have a pointer here.  While I
can believe that it never looks at it again, it's nice if that pointer
doesn't point somewhere on an old stack.

I suppose we could go the other way and try to mark more stuff in this
module as __init and __initdata, but even then at least the pointer
won't be onto a stack.  ;-)


> +       int ret;
> +
> +       qmp->qdss_clk.init = &qdss_init;
> +       ret = clk_hw_register(qmp->dev, &qmp->qdss_clk);
> +       if (ret < 0) {
> +               dev_err(qmp->dev, "failed to register qdss clock\n");
> +               return ret;
> +       }
> +
> +       return of_clk_add_hw_provider(qmp->dev->of_node, of_clk_hw_simple_get,
> +                                     &qmp->qdss_clk);

devm_clk_hw_register() and devm_of_clk_add_hw_provider()?  If you're
worried about ordering you could always throw in
devm_add_action_or_reset() to handle the qmp_pd_remove(), qmp_close()
and mbox_free_channel().

...with that you could fully get rid of qmp_remove() and also your
setting of drvdata.


> +static void qmp_pd_remove(struct qmp *qmp)
> +{
> +       struct genpd_onecell_data *data = &qmp->pd_data;
> +       struct device *dev = qmp->dev;
> +       int i;
> +
> +       of_genpd_del_provider(dev->of_node);
> +
> +       for (i = 0; i < data->num_domains; i++)
> +               pm_genpd_remove(data->domains[i]);

Still feels like the above loop would be better as:
  for (i = data->num_domains - 1; i >= 0; i--)


(BTW: any way you could add me to the CC list for future patches so I
notice them earlier?)

-Doug
