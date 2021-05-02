Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C081370F2B
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 May 2021 22:53:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232401AbhEBUyo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 2 May 2021 16:54:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232541AbhEBUyn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 2 May 2021 16:54:43 -0400
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFEE9C06138D
        for <linux-arm-msm@vger.kernel.org>; Sun,  2 May 2021 13:53:50 -0700 (PDT)
Received: by mail-oi1-x233.google.com with SMTP id n184so3636221oia.12
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 May 2021 13:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=4x9K/RVZT8er1Orv37V20DH7ZsJDPJpXZVJ6DFDq/Q0=;
        b=SocEfMh8uZKOpIp/V0sx2Hx9B1XVx3oe+XtcRGGbU0Ww/hHFXSercbkk/J7bTsSsxf
         C7JjjCOVKnHIJTEfzaVux3peUZ1wcsknzXB7lkoCrMtblyvvkUXrXEpE6xM1ld+8e3le
         /n/TXPQX/ocpWxO/zPO0/b1iLQ/zyptntvIzhkrd24qqcX7d1zyeDN+JvtUYv/Q54gFq
         oOeDjtF6Suyj3/t5CdB5JoLDXS1n/Red9IGQ2Bof1Bj6fM2hDqJDSyUiSRtGjXVE62LM
         rg0EhKTktXYYO5SNK/wRuJZpe8TDryWnyoh9NtVcq/Nd3c8xnRxiELv9Iigk8i6iEoyu
         p+DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4x9K/RVZT8er1Orv37V20DH7ZsJDPJpXZVJ6DFDq/Q0=;
        b=mF9WcH28Mw46ga0RyH1BDgkceLL5PdmLP+qLeWED2CeBC3YAI8ax1tlo+Dd20ZOdRb
         r29OtSffnRMDmneDOS3NWa4DEDAfaTDIhz3Nm8sDHI8cfTkA11tlIW1//vFGPF24t4lk
         VZwZ19+KRrEzuxgWHKzwMmRqC+y6rDzbReeX/2gd/uqItCzyts75vfquITS9/zNkHEXG
         HUe0x+yADmEf7ioc/vS+Rs/jnR6brkoG0cvn2AJ1zUVuBh2AAH0oZZkYZqMm9TsgeQVC
         zvVejhNZdSrW5X1hyBErAvKPPAzsIFxGIHgJPaaqRnCbFeoLefThMXrL4o7+6erbn9zM
         NJEw==
X-Gm-Message-State: AOAM533oF53vmsA/6MggsjPA4cGNpN8sSpv7yxTb99NvgErEhytJaOp6
        Rd2oh5ViB6B9p/SMUQXKKRxvQQ==
X-Google-Smtp-Source: ABdhPJz0vz+XSangB3TzFh5Wkn6/Wgz+OBLPU1dvG90f8G2sdidcNTTIm3nCtfEvP5hQ/mjGJ8eGaQ==
X-Received: by 2002:aca:c7ce:: with SMTP id x197mr242663oif.93.1619988829858;
        Sun, 02 May 2021 13:53:49 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id l4sm2325047oic.26.2021.05.02.13.53.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 May 2021 13:53:49 -0700 (PDT)
Date:   Sun, 2 May 2021 15:53:46 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Pavel Machek <pavel@ucw.cz>, Andy Gross <agross@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Uwe Kleine-K?nig <u.kleine-koenig@pengutronix.de>,
        Lee Jones <lee.jones@linaro.org>, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pwm@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Luca Weiss <luca@z3ntu.xyz>,
        Subbaraman Narayanamurthy <subbaram@codeaurora.org>
Subject: Re: [PATCH v7 1/6] dt-bindings: leds: Add Qualcomm Light Pulse
 Generator binding
Message-ID: <20210502205346.GD2484@yoga>
References: <20210429211517.312792-1-bjorn.andersson@linaro.org>
 <20210429211517.312792-2-bjorn.andersson@linaro.org>
 <20210430200542.GA3779966@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210430200542.GA3779966@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 30 Apr 15:05 CDT 2021, Rob Herring wrote:
> > diff --git a/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml b/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml
[..]
> > +  qcom,power-source:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      power-source used to drive the output, as defined in the datasheet.
> > +      Should be specified if the TRILED block is present
> 
> constraints?
> 

Yes, we should be able to constrain this a little bit.

> > +
> > +  qcom,dtest:
> > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > +    description: >
> > +      A list of integer pairs, where each pair represent the dtest line the
> > +      particular channel should be connected to and the flags denoting how the
> > +      value should be outputed, as defined in the datasheet. The number of
> > +      pairs should be the same as the number of channels.
> 
> Sounds like a matrix rather than array. Constraints on the values?
> 

I wasn't aware of uint32-matrix and that I can describe the constraints
of the values in the matrix. I'll familiarize myself with it and see if
I can tighten this up a little bit.

Thanks,
Bjorn
