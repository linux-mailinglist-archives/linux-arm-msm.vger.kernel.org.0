Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6AECC12738A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2019 03:34:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727188AbfLTCeb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Dec 2019 21:34:31 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:40041 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726964AbfLTCeb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Dec 2019 21:34:31 -0500
Received: by mail-pg1-f196.google.com with SMTP id k25so4158321pgt.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2019 18:34:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=mVLwMYU9a1Ur9p84n79pZdcxfrBVZ9dl3tOWS7SY+xA=;
        b=A5XLiLj5XSorkfvQSx4vNY7HKLa68YNU6fUVPeKVnsYSZxhYpHtADihv6LVt/KThhw
         abQr4Lo1YZ70r6Yhzt10AHq7H8T4cjrLV5hutX6T0x/76ECM+WY8MccHN1292kSeidFS
         +lq66CmXgUyXMFeHnmljFNydyHmw5XUejn6zHWNL4ZI1R9NkCKrHDWtpUP3vnKcGT7Kd
         bU5mUETfLlbIRvAgZNr9RksSLcfEBrSTRAJPsaTAXTRW+ZePHwsgiTmNvtbqKOfpg+Gu
         lnb4RlFSEv1mYTe2rn1/Z8X9nam7y5eArPaygWDvKNnvYNd55ba+LXn4qYCXQETYs6eE
         BcGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=mVLwMYU9a1Ur9p84n79pZdcxfrBVZ9dl3tOWS7SY+xA=;
        b=XxIxSNdtLVrSHVsL193qtgEdYYhAaUWDmyueu1y4O9v+TqD6u9jj4qU7hMIzOTeiNr
         X8rFIegYNIKa7s+/SpEg7gcU94o/9ahXcAlLPMNNRABBfIB3cgLMfpWB+KZKIF3V67lY
         tSLUwZgfsqiD7UuVFeyF4Bi/O6lZf9eOwC1uaTeHGrtQsxIXBj2E3THX0nyrjdCR3C91
         CbU+IWJbhR7ePrBxHTYVQeQ13OM2zXuN6jx2TywzcJJsaQiRG8lmuD8hPxbCNsPQiMdH
         Q6bLx6Rm3b5nwf1DLbQVdROZHDzLz0QY/6HO3dgJI36ziexjMXhgX0+MrkghvbSZSTjL
         nL+w==
X-Gm-Message-State: APjAAAW5el6w652zrInT+qUywPaE0eXWTnnIVmnbhyHVenqky1RjCBfA
        xleDswffuYzZayyNA91oslED5Q==
X-Google-Smtp-Source: APXvYqzQxouN9+tP55/5fJi1dLRhTZxq4NQnMIOJeo5MymuGtB8QKOUaMrH+A5MNTCh7N14bYMd1UA==
X-Received: by 2002:a62:e30f:: with SMTP id g15mr13168064pfh.124.1576809270507;
        Thu, 19 Dec 2019 18:34:30 -0800 (PST)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id x33sm8946698pga.86.2019.12.19.18.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2019 18:34:29 -0800 (PST)
Date:   Thu, 19 Dec 2019 18:34:27 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paolo Pisati <p.pisati@gmail.com>
Subject: Re: [PATCH 1/2] clk: qcom: gcc-msm8996: Fix parent for CLKREF clocks
Message-ID: <20191220023427.GL448416@yoga>
References: <20191207203603.2314424-1-bjorn.andersson@linaro.org>
 <20191207203603.2314424-2-bjorn.andersson@linaro.org>
 <20191219063719.5AF942146E@mail.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191219063719.5AF942146E@mail.kernel.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 18 Dec 22:37 PST 2019, Stephen Boyd wrote:

> Quoting Bjorn Andersson (2019-12-07 12:36:02)
> > The CLKREF clocks are all fed by the clock signal on the CXO2 pad on the
> > SoC. Update the definition of these clocks to allow this to be wired up
> > to the appropriate clock source.
> > 
> > Retain "xo" as the global named parent to make the change a nop in the
> > event that DT doesn't carry the necessary clocks definition.
> 
> Something seems wrong still.
> 
> I wonder if we need to add the XO "active only" clk to the rpm clk
> driver(s) and mark it as CLK_IS_CRITICAL. In theory that is really the
> truth for most of the SoCs out there because it's the only crystal that
> needs to be on all the time when the CPU is active. The "normal" XO clk
> will then be on all the time unless deep idle is entered and nobody has
> turned that on via some clk_prepare() call. That's because we root all
> other clks through the "normal" XO clk that will be on in deep
> idle/suspend if someone needs it to be.
> 

The patch doesn't attempt to address the fact that our representation of
XO is incomplete, only the fact that CXO2 isn't properly described.

Looking at the clock distribution, we do have RPM_SMD_BB_CLK1_A which
presumably is the clock you're referring to here - i.e. the clock
resource connected to CXO.

> Did the downstream code explicitly enable this ln_bb_clk in the phy
> drivers? I think it may have?
> 

Yes, afaict all downstream drivers consuming a CLKREF also consumes
LN_BB and ensures that this is enabled. So we've been relying on UFS to
either not have probed yet or that UFS probed successfully for PCIe and
USB to be functional.

So either we need this patch to ensure that the requests propagates
down, or I need to patch up the PHY drivers to ensure that they also
vote for the PMIC clock - and I do prefer this patch.

Regards,
Bjorn
