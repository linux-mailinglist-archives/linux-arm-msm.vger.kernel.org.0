Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE1E8314197
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Feb 2021 22:21:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236206AbhBHVVW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Feb 2021 16:21:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236176AbhBHVVS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Feb 2021 16:21:18 -0500
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9E67C061786;
        Mon,  8 Feb 2021 13:20:38 -0800 (PST)
Received: by mail-pl1-x62b.google.com with SMTP id g3so8542498plp.2;
        Mon, 08 Feb 2021 13:20:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=R+r2jOyAlqjRMKHtvLPADXW3voMgq9h98r709KcrCLA=;
        b=on8PcE7z2qaHBS1NRAIcQDoBXSzdz3AfDUoAyrGwgMKmBymB8+KwNn/wQ8bxs/nE8W
         F4+jm/1ZrtEw2O3+RjFPADSLKNZtUYPAFmJqs8iB9H2lppiw+EQp7dBDi2JyI1AqPoPP
         H6pWUG78CBYYcLwAQvNvv7Q6OelL3XodzgyVOaPFcp12WC+VTD/ea+aaeULbzkwVCsAX
         NGtjR2iaRo/kU901b5AjsBBCjdSb6vFLAwL0t6Uzl48C9fxcV6ygj9O4biTxV/qn6lY3
         oxt3BS01ghGL4UxY+wQpHaoyqqmD+gTxUanw5JXjP53YIBdZlvf7LSJd/TC1eicyLSL9
         jOKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=R+r2jOyAlqjRMKHtvLPADXW3voMgq9h98r709KcrCLA=;
        b=hHZh5F3PZrAEl2D+aOHkiDnZ/8JCJSLoKjKJGAUgoHEjf0SXNUpGT+5/733Z0vSccl
         4SjwjJGbBzNhWkjcTWMmozeG2PML0/Ea0TcHqnRW3PFSQnaDvp8uGZ1QyWlOyANF3A4O
         RON9HSVhEgh7z3dBsm1WxM2UDaGls62DkIZpSc9bkrBotj8U4gb5JbhNb3PArWmdXjL3
         UOCDEUM+JdCb9fhE1mXVV1mDCKpH1PtWj3ZMD/etRgKsI9JzcPJnPTHrmurE9a/GHppc
         +nqZRb+SNkykgn+4NFsrgtPXUNyJwfTMOXkeKz5vZm8h0q9DVQNl1TGu2njm1skhVNF9
         zE0g==
X-Gm-Message-State: AOAM532slb+ge+EJKQgiJ1dhdIduDdjngHtEWfKisb+urpca8D246XNT
        gq7rlPnHvnFMFxeuYwTwRBuM2Rg6cZQ444AjRQzivU0d
X-Google-Smtp-Source: ABdhPJwlLrUw1rV3Nhhbhev6KiudY8wFgGQ6XXUwlUEyRbugwdSU+pRmpSd2OCN8pUcKOXmjuWx45WHicCFxjzqqWkU=
X-Received: by 2002:a17:90b:14cf:: with SMTP id jz15mr716661pjb.180.1612819238195;
 Mon, 08 Feb 2021 13:20:38 -0800 (PST)
MIME-Version: 1.0
References: <20210118041156.50016-1-manivannan.sadhasivam@linaro.org>
 <161280637168.76967.9168707371952675235@swboyd.mtv.corp.google.com> <20210208181954.GA276254@thinkpad>
In-Reply-To: <20210208181954.GA276254@thinkpad>
From:   Jassi Brar <jassisinghbrar@gmail.com>
Date:   Mon, 8 Feb 2021 15:20:27 -0600
Message-ID: <CABb+yY2pCdQnvmkBMBuYXsMYCNKheqmroQxF5YvjDQ5xqJP-NA@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] Add APCS support for SDX55
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        agross@kernel.org, linux-arm-msm@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-clk@vger.kernel.org,
        Devicetree List <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Feb 8, 2021 at 12:20 PM Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:
>
> On Mon, Feb 08, 2021 at 09:46:11AM -0800, Stephen Boyd wrote:
> > Quoting Manivannan Sadhasivam (2021-01-17 20:11:51)
> > > Changes in v2:
> > >
> > > * Modified the max_register value as per the SDX55 IPC offset in mailbox
> > >   driver.
> > >
> > > Manivannan Sadhasivam (5):
> > >   dt-bindings: mailbox: Add binding for SDX55 APCS
> > >   mailbox: qcom: Add support for SDX55 APCS IPC
> >
> > I think I can apply the clk patches to clk tree without the mailbox
> > patches, right?
> >
>
> Yes, you can. Thanks for applying!
>
> Jassi: Can you please look into the mailbox patches?
>
They are compatible strings mostly... so assume it ok.

cheers!
