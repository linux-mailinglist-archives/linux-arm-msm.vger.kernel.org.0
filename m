Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E626421DA6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Oct 2021 06:46:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229812AbhJEEsV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Oct 2021 00:48:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231393AbhJEEsU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Oct 2021 00:48:20 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9872C06174E
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Oct 2021 21:46:30 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id s55so15254894pfw.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Oct 2021 21:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=oU0y/L1Kv7h8rjDf7ezD8KvTWO00EJ3BiI+ZclBMT+w=;
        b=pRO4hYs7dy8DnFLkzsum1hayDKhtSmwJ0KwVN49yNiKOTVcDCqgL6Nym+QWQ6KKGIk
         u0Qm1EhsfiI10jUTsTm//HiUtUjPTywNgnnbPFQ1tbXidYSXeuIaOliknF/ksiDu0YM9
         8hfwIKq2Y86O0Tr5RccWvDaM8rfVK6wD0Q2ZlPbxBbkPG+pW3FL7cN4+JdFH1E5l2e50
         uqVTAMlaZWEUHkLtsAnYLgXsXA44W3xV7UdHN+cmH0chEH3MPPuQ2IfIGy/Z3vyOslPu
         SspaBL6ccG4F+0nd7B8TJIVKrkF0cXXN/WCgqLdQwJU9x9QyuqYadxUYh2Qu8Nu7y1yP
         eONA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=oU0y/L1Kv7h8rjDf7ezD8KvTWO00EJ3BiI+ZclBMT+w=;
        b=CC7OCcj5n1Kg4Ht03yZF9wD4jY53uJPUYv0rrTktyd///gXTDQqY3Tnt7+Nd+50oUb
         95/sQk7GOcS7vB1K6/tSC5AgRSyddZf+KnNHs+ePZ0eK1leHBGwI469cvdBh8lLMkakA
         e6NalksfabCTYz5bLlKQj8q+3Kir4Yyi5INytpboiIM+f+iCHuWRZMTzmTzR03pxE+ZA
         QBG1XQ3/Y+B3MFaQkD6Y8RTgRNpg+ARCFPCyY+LC66lGc2BEaFd1rnzDxv9nFaWAMjGy
         YUhWA71ITH68MCDUet1mCBzJT5G/Qh+wwCFDUgqcb3RtolVWkY6rSCiKXWMldoN2XlRF
         HJbQ==
X-Gm-Message-State: AOAM531qBEfCgbe5Z/5xd7EZO55OJZmaO+jm4PL8KKUhD5O0gPRQhlkm
        UljZtK/4gbSf0xnD/Y4lq4TO
X-Google-Smtp-Source: ABdhPJxhXUmFhJYMG650PXT4U5Cg8sHpINcD7y5trS4JlMzsEZwxtjoLOtzNO02sROfoinqm3g6TTA==
X-Received: by 2002:a63:b707:: with SMTP id t7mr13893203pgf.55.1633409190133;
        Mon, 04 Oct 2021 21:46:30 -0700 (PDT)
Received: from workstation ([120.138.13.79])
        by smtp.gmail.com with ESMTPSA id z33sm15305980pga.20.2021.10.04.21.46.24
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Oct 2021 21:46:28 -0700 (PDT)
Date:   Tue, 5 Oct 2021 10:16:23 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     rafael@kernel.org, robh+dt@kernel.org, bjorn.andersson@linaro.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: cpufreq: cpufreq-qcom-hw: Convert to YAML
 bindings
Message-ID: <20211005044623.GA4195@workstation>
References: <20211004044317.34809-1-manivannan.sadhasivam@linaro.org>
 <20211005042300.ix46h3ceu7aiwrg7@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211005042300.ix46h3ceu7aiwrg7@vireshk-i7>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Oct 05, 2021 at 09:53:00AM +0530, Viresh Kumar wrote:
> On 04-10-21, 10:13, Manivannan Sadhasivam wrote:
> > Convert Qualcomm cpufreq devicetree binding to YAML.
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> 
> I hope you will be resending this after fixing the DT warnings ?

Yes, but I'm not sure why I can't reproduce the warnings locally. I did
upgrade dtschema package and installed yamllint.

Anyway, will remove "maxItems" property as reported by the bot.

Thanks,
Mani

> 
> -- 
> viresh
