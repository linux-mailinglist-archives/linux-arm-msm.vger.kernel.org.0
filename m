Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA85DF6EE8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Nov 2019 08:10:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726845AbfKKHKg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Nov 2019 02:10:36 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:38314 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726360AbfKKHKg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Nov 2019 02:10:36 -0500
Received: by mail-pg1-f194.google.com with SMTP id 15so8883474pgh.5
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 Nov 2019 23:10:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=sX4vkHAEzc9p5ZJu3ak6NA+j+4cKDtaOpldCbF2kYAg=;
        b=kGsZwUBiNG9RFgC6y5TV3EGCwNc/pKv3YDg5qJobpQk4w3uGjpp0MJviMvJkseN/Eu
         14iFDz6QX9Nu9eZsWkh0JZxiaMQaJJjph6Bs+yVCv18yfpkacIz2j8OMe2QI+c3f/piC
         v2sfSdRNaKBOmSJv6rsKU0Zl0gay6nsJoL/B3B2zDGEQVkWsLZb76V6pUvdGQW0euXIA
         QMZG+rqBHq25rgkZhLMpJM1XajVKYD9ymwxORktWNpnYwqWddeMAcKDeYfrty8rF2Ut0
         tcC7ojQJo7ZVXElTjQ/fKC1n+VrqqYK3W7k7Ey7JFkhIGK6UjoWyCulBcG5xk3lqGVXN
         173Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=sX4vkHAEzc9p5ZJu3ak6NA+j+4cKDtaOpldCbF2kYAg=;
        b=ojPUNIgk2OgHrIFtnEPOsIZ19x+hSZCgpOycCSspp7JA9c+xp49s/74eL7EmXaSCVE
         EEFgqGzUyc7mhFg/gFzi/3mvIqVX2HSHsqM6AJQ25a6+mUfUbIOR4T0GhotAXV6QQxpU
         Im1DMLMUy8pHZD3++05xVLMV7MWvrVyjB/VYs/FVWyppj3pIprErjd1XVcdzG7Ydvld5
         2fSL1t46ikua8/wjl0l2wVOgVz8XrZueOrPfflUT4/gXAk3ZbCKRG9eSlVpOkCvEeEej
         zXfz4gq8m5yZ0duZBhX2bJUfn43eBBRCTq34WGOsAP6FPTM6vb1K66M5LKsSm7YQATGL
         u2PA==
X-Gm-Message-State: APjAAAWq7rvD4mz1qaC0XEaSrCXRDVVoNNvJ+NtcYqwgWbGiNTT5mggb
        yF0EQJEelXf8WcfN5/kSvogBFw==
X-Google-Smtp-Source: APXvYqwEgk3cfRBuAZo9P2F9C3HD7clznEJMa6lEDybUeoKqhApb54tnR1gOUHvpPcnVzwfYEepzcg==
X-Received: by 2002:a17:90b:30d7:: with SMTP id hi23mr5371917pjb.10.1573456234078;
        Sun, 10 Nov 2019 23:10:34 -0800 (PST)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id w26sm19676792pfj.123.2019.11.10.23.10.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Nov 2019 23:10:33 -0800 (PST)
Date:   Sun, 10 Nov 2019 23:10:30 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     Marc Zyngier <maz@kernel.org>, agross@kernel.org,
        robh+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mka@chromium.org, swboyd@chromium.org,
        Lina Iyer <ilina@codeaurora.org>
Subject: Re: [PATCH v5 06/13] drivers: irqchip: qcom-pdc: Move to an SoC
 independent compatible
Message-ID: <20191111071030.GB3797@yoga>
References: <20191108092824.9773-1-rnayak@codeaurora.org>
 <20191108092824.9773-7-rnayak@codeaurora.org>
 <0d5090fc9def3b9fa03a733d4adc2ae0@www.loen.fr>
 <9c2b33f2-02bb-e516-4cb5-b466757cd67a@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9c2b33f2-02bb-e516-4cb5-b466757cd67a@codeaurora.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 08 Nov 01:55 PST 2019, Rajendra Nayak wrote:

> 
> On 11/8/2019 3:10 PM, Marc Zyngier wrote:
> > On 2019-11-08 10:37, Rajendra Nayak wrote:
> > > Remove the sdm845 SoC specific compatible to make the driver
> > > easily reusable across other SoC's with the same IP block.
> > > This will reduce further churn adding any SoC specific
> > > compatibles unless really needed.
> > > 
> > > Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> > > Reviewed-by: Lina Iyer <ilina@codeaurora.org>
> > > Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> > > Cc: Marc Zyngier <maz@kernel.org>
> > > ---
> > >  drivers/irqchip/qcom-pdc.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
> > > index faa7d61b9d6c..c175333bb646 100644
> > > --- a/drivers/irqchip/qcom-pdc.c
> > > +++ b/drivers/irqchip/qcom-pdc.c
> > > @@ -309,4 +309,4 @@ static int qcom_pdc_init(struct device_node
> > > *node, struct device_node *parent)
> > >      return ret;
> > >  }
> > > 
> > > -IRQCHIP_DECLARE(pdc_sdm845, "qcom,sdm845-pdc", qcom_pdc_init);
> > > +IRQCHIP_DECLARE(qcom_pdc, "qcom,pdc", qcom_pdc_init);
> > 
> > Acked-by: Marc Zyngier <marc.zyngier@arm.com>
> > 
> > How do you want me get this (and the DT change) merged? I can either take
> > these two patches in the irqchip tree, or you arrange them to be taken
> > by the platform maintainers. Your call.
> 
> I think it makes sense for you to take these two via your tree (The driver
> and binding doc updates) and the DT node addition for pdc to go via Andy/Bjorn.
> Andy/Bjorn, does that sound fine?
> 

Yes, that sounds good.

Regards,
Bjorn
