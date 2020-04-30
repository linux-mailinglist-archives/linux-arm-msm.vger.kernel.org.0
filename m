Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19AC71BF19A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2020 09:35:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726505AbgD3Hfd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Apr 2020 03:35:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726412AbgD3Hfd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Apr 2020 03:35:33 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D008C035494
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2020 00:35:31 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id a31so368618pje.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2020 00:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=5j98N+kyJG3HhZ4ROV8U2tYLoi9tRHcX6NSDJJqOtoY=;
        b=JcS/Ek/NLrw/zFeQFXDMsRv+5b8YkJqFapKIbmYbIZu5J8iCGJTnzZY5Kqyur+MqLb
         3wAb08uh1nT/TKJnarFdg+XtedtgdBRvQicEA1Y50ks4OnXdWf+1Y0iPIqyGdfyGtvyc
         aIP5z7Jvmlg99b1csm7TSxBu7ZFykOLUyWUL5nd+CqRIZdDIThkW2VKeB+60QIxKzxQn
         lIk/011ysKrrUE5C030fw6vhwb0ITUM591bkMUNTHqdU9ptmCo9Pziq72LqfMzBH+jzH
         rXkRIejqbUbmsn2zQ63x+9VebYys11Rql0axMptefkvwJBGm3m3NADDiVyX2EMgfjgFy
         qqgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=5j98N+kyJG3HhZ4ROV8U2tYLoi9tRHcX6NSDJJqOtoY=;
        b=m9b+nbX1Vwh/KwQe9jgishdbqU016dquCm1j+trhl7VBqZ21wqR2Q3oakOCONlCeYD
         gUI5z3Y4OKEv4MunECvxIG2yl8gdPykJEM4L5m8cOT+lCnLnoekggQoKzGdpUWVNsafG
         gbnNsFjMfaTZM2GYSGvl16xANLTLD08ExH6AahO/MYSBv011sypYwnqOZ8p2U4Uha3y4
         QeccuSASa5rvhNtUEuqAf3OsnwqcsqfDOIO1u/u1oQMDKoQwZHSipc3hrAX3EUMTPNtq
         kUGKJ/XNDNjle2HIlQx3ESLtCttUXtmHRyTkI7gXjChIQJH7T7UC15JB1QXyg1u/I1mk
         8hLg==
X-Gm-Message-State: AGi0Puan7iizJfFSjPbMAnjXqYzzoHBqe+mmuhQ1sz1OPiqZsX0ynEvu
        p9kiVnD95i+8AZJP8n2HHmMI
X-Google-Smtp-Source: APiQypKA2FTVHA3mAFE6sqMc81pOC0XsYAaj9CrcJzQecfjqc0mWYdEfh70BzUrTtAC2r3utgvRp2g==
X-Received: by 2002:a17:902:aa88:: with SMTP id d8mr2524821plr.213.1588232130776;
        Thu, 30 Apr 2020 00:35:30 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:6081:946c:419e:a71:7237:1613])
        by smtp.gmail.com with ESMTPSA id t3sm2703551pfq.110.2020.04.30.00.35.24
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Apr 2020 00:35:29 -0700 (PDT)
Date:   Thu, 30 Apr 2020 13:05:21 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     rananta@codeaurora.org
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        jassisinghbrar@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>
Subject: Re: [PATCH 2/2] soc: qcom: ipcc: Add support for IPCC controller
Message-ID: <20200430073521.GB9449@Mani-XPS-13-9360>
References: <20200430063054.18879-1-manivannan.sadhasivam@linaro.org>
 <20200430063054.18879-2-manivannan.sadhasivam@linaro.org>
 <93afcf6810308580a299905da2b8dad0@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <93afcf6810308580a299905da2b8dad0@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Apr 29, 2020 at 11:45:27PM -0700, rananta@codeaurora.org wrote:
> On 2020-04-29 23:30, Manivannan Sadhasivam wrote:
> > +static int qcom_ipcc_probe(struct platform_device *pdev)
> > +{
> > +	struct qcom_ipcc_proto_data *proto_data;
> > +	int ret;
> > +
> > +	proto_data = devm_kzalloc(&pdev->dev, sizeof(*proto_data),
> > GFP_KERNEL);
> > +	if (!proto_data)
> > +		return -ENOMEM;
> > +
> > +	ipcc_proto_data = proto_data;
> > +	proto_data->dev = &pdev->dev;
> > +
> > +	proto_data->base = devm_platform_ioremap_resource(pdev, 0);
> > +	if (IS_ERR(proto_data->base)) {
> > +		dev_err(&pdev->dev, "Failed to ioremap the ipcc base addr\n");
> > +		return PTR_ERR(proto_data->base);
> > +	}
> > +
> > +	proto_data->irq = platform_get_irq(pdev, 0);
> > +	if (proto_data->irq < 0) {
> > +		dev_err(&pdev->dev, "Failed to get the IRQ\n");
> > +		return proto_data->irq;
> > +	}
> > +
> > +	/* Perform a SW reset on this client's protocol state */
> > +	writel(0x1, proto_data->base + IPCC_REG_CLIENT_CLEAR);
> We can skip doing a SW reset here. Few of the subsystems may be brought out
> of reset via the bootloader and the interrupts from them might be pending.
> Doing a SW reset here would clear those interrupts.
> 

Okay, will remove it.

Thanks,
Mani

> Thank you.
> Raghavendra
