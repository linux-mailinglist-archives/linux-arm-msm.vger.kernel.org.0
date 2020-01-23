Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 33661146773
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2020 13:01:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726743AbgAWMA7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Jan 2020 07:00:59 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:42331 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726260AbgAWMA7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Jan 2020 07:00:59 -0500
Received: by mail-pf1-f196.google.com with SMTP id 4so1436693pfz.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2020 04:00:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=xsupKns0vCTM3WeJcGkVjDP+YbP5uYoNms0JHy0fvAM=;
        b=dHB/RV9/Z0x+PyahfYcA/w3hi0IXq91YXf34XiKLEBPH7PVcQB3ly2nZNmJIfFosSh
         tfju8Bz7/ljCBPKPqeFO2RXN6V9nqsdtEK3slMAXurUXxdfgbJyrwE++vJRJjX4jSogo
         od+wWoDNC7GcaB18EqZrn5BTX0VP53HsxAlE6A5YVRZnnMpEnp+uF5Y222hDXRIZIykC
         vYcz3MlH2qI0q3+XyRu74FTf/21m/WHahvQXdDXMzsO5fobC0Y54Dd2WAXwgs/bl5wGU
         sTRwq7LDAK5xkzv8cnenJLCs2emZOsrU6U9TE8EOkYafvUVEP9l89bPXkAjgBnptMStZ
         yCkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=xsupKns0vCTM3WeJcGkVjDP+YbP5uYoNms0JHy0fvAM=;
        b=ZPIg9STzGmAMQHTnbQQsDwYM8Kh7G+b8CfRVFld9bCCVe7WPRx13VLkp36Vqxg/63g
         IsIjRLcItVx0sVJHI5vexVcr2W/TgquqfXbI4YoZSFJtN/VQXUpmdbeTvlhv2CluJdX4
         opuvsPq+YHkaqcPGO3+qHtG7Cz2STvuhZjZo7HkLbj2cSkM6hw4BySOVm8AaG0zCUP9C
         aglSoqeMoB6tPejOAKlztXFHxH5CcivVV810ZKLqdyk3cGK4R6ECyQwDz+m47ahXNsdo
         fkgzsFCmXIc+MLt6ZoI8n+PEUswUKlZE3JnV35hmAWXZ/G2R9rbjOUIPOD1VPbL4imoH
         /Ieg==
X-Gm-Message-State: APjAAAVRv9mc7kyI822eKu0w8SFw69NiMvAXykJklIVRsmajLoeky+N9
        PnhNluqj98HmXq5BW7ylFgqH
X-Google-Smtp-Source: APXvYqx87g/e7WC505+cEagRJXfEeDjlYeTZUqvcM8Ppu1p39CKD9QfMfVAClfv/Qg5lNSR8rjwWNg==
X-Received: by 2002:a63:6ac1:: with SMTP id f184mr3524288pgc.133.1579780858733;
        Thu, 23 Jan 2020 04:00:58 -0800 (PST)
Received: from mani ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id k23sm2602114pgg.7.2020.01.23.04.00.55
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Jan 2020 04:00:58 -0800 (PST)
Date:   Thu, 23 Jan 2020 17:30:50 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     gregkh <gregkh@linuxfoundation.org>, smohanad@codeaurora.org,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Kalle Valo <kvalo@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        hemantk@codeaurora.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 05/16] bus: mhi: core: Add support for ringing
 channel/event ring doorbells
Message-ID: <20200123120050.GB8937@mani>
References: <20200123111836.7414-1-manivannan.sadhasivam@linaro.org>
 <20200123111836.7414-6-manivannan.sadhasivam@linaro.org>
 <CAK8P3a2pZEdsAi6YQ5z3YD=zD1iZLu+WPirhwmxeZ33k7sjkeg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a2pZEdsAi6YQ5z3YD=zD1iZLu+WPirhwmxeZ33k7sjkeg@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Arnd,

On Thu, Jan 23, 2020 at 12:39:06PM +0100, Arnd Bergmann wrote:
> On Thu, Jan 23, 2020 at 12:19 PM Manivannan Sadhasivam
> <manivannan.sadhasivam@linaro.org> wrote:
> 
> > +int __must_check mhi_read_reg(struct mhi_controller *mhi_cntrl,
> > +                             void __iomem *base, u32 offset, u32 *out)
> > +{
> > +       u32 tmp = readl_relaxed(base + offset);
> ....
> > +void mhi_write_reg(struct mhi_controller *mhi_cntrl, void __iomem *base,
> > +                  u32 offset, u32 val)
> > +{
> > +       writel_relaxed(val, base + offset);
> 
> Please avoid using _relaxed accessors by default, and use the regular
> ones instead. There are a number of things that can go wrong with
> the relaxed version, so ideally each caller should have a comment
> explaining why this instance is safe without the barriers and why it
> matters to not have it.
> 
> If there are performance critical callers of mhi_read_reg/mhi_write_reg,
> you could add mhi_read_reg_relaxed/mhi_write_reg_relaxed for those
> and apply the same rules there.
> 
> Usually most mmio accesses are only needed for reconfiguration or
> other slow paths.
> 

Fair point. I'll defer to readl/writel APIs and I also need to add
le32_to_cpu/cpu_to_le32 to them.

Thanks,
Mani

>       Arnd
