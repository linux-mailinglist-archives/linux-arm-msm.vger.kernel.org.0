Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E52C2EB647
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2019 18:41:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729067AbfJaRlx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 31 Oct 2019 13:41:53 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:35771 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729039AbfJaRlw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 31 Oct 2019 13:41:52 -0400
Received: by mail-pg1-f195.google.com with SMTP id c8so4512836pgb.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Oct 2019 10:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=DFxY9HZbAftkc6ZEf7DIO4SCG3jzu7OlqMydfjKW4pU=;
        b=eWiDdNXjXm7b0tkJhXmJW29hx5jKtPuG/5ga1AQNcM+4BCNwzsLltNphqpnoZJV5h4
         NlvsSh4M87vrh+o13iwst4Uso0yA3I9BE7bdOzzEAXmzEJ8rxMzhBlm41sjp/vU+9f6u
         BB/Jm75OaBDHyhpSxf1NtlpsIec7WZaZXaU0A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=DFxY9HZbAftkc6ZEf7DIO4SCG3jzu7OlqMydfjKW4pU=;
        b=CXmH+TVPBABM3JAx/J/dFBpwoDDOw7O5PCuG1GCVEZ4xDfWEkkgbDClUmjW2hYpmp3
         5vHHksBw5APJy3SUJEuMtN5UIe6a2/ux+PQBV/MfC6QYfE0woe67ViJ8XXxRBAXuMlVM
         wiBF9HYOmfYXJ/Mxqv3qYgsnYK3yLIIvetp73x3JiKrGOmFt1lshPFuJRWqw3dQlnKmL
         mXIQAqEMH4PJY8s92h0DyELe/UpZT7wvhRkP9kxEiVFYGHXEtIr0MXd/2e5sx1kxTlnT
         +zltBIyD4SkytFqOBWOga9atJz5FtQMtVzKHE8bq9q2ASI9odUF4l66L3NUjVoTThU65
         bwfA==
X-Gm-Message-State: APjAAAWa2B00riKRAdNHwflre4UDfoocz90QNizLXYfN5KDuf2xOzDwR
        j7SMcvD2pfCyl0f0g/fEd1d8XQ==
X-Google-Smtp-Source: APXvYqxaAic0W+0GltNXLrUaUFbKQaUKuojcLcEWtkxF1z781kp35xDw1V+TzemJKEpy0ZBkO/29BA==
X-Received: by 2002:a17:90a:e90:: with SMTP id 16mr9046788pjx.65.1572543711707;
        Thu, 31 Oct 2019 10:41:51 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id d14sm5531817pfh.36.2019.10.31.10.41.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Oct 2019 10:41:51 -0700 (PDT)
Date:   Thu, 31 Oct 2019 10:41:49 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Taniya Das <tdas@codeaurora.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org, robh+dt@kernel.org,
        Jordan Crouse <jcrouse@codeaurora.org>,
        eykumar Sankaran <jsanka@codeaurora.org>
Subject: Re: [PATCH v4 5/5] clk: qcom: Add Global Clock controller (GCC)
 driver for SC7180
Message-ID: <20191031174149.GD27773@google.com>
References: <20191014102308.27441-1-tdas@codeaurora.org>
 <20191014102308.27441-6-tdas@codeaurora.org>
 <20191029175941.GA27773@google.com>
 <fa17b97d-bfc4-4e9c-78b5-c225e5b38946@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <fa17b97d-bfc4-4e9c-78b5-c225e5b38946@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Taniya,

On Thu, Oct 31, 2019 at 04:59:26PM +0530, Taniya Das wrote:
> Hi Matthias,
> 
> Thanks for your comments.
> 
> On 10/29/2019 11:29 PM, Matthias Kaehlcke wrote:
> > Hi Taniya,
> > 
> > On Mon, Oct 14, 2019 at 03:53:08PM +0530, Taniya Das wrote:
> > > Add support for the global clock controller found on SC7180
> > > based devices. This should allow most non-multimedia device
> > > drivers to probe and control their clocks.
> > > 
> > > Signed-off-by: Taniya Das <tdas@codeaurora.org>
> 
> > 
> > v3 also had
> > 
> > +	[GCC_DISP_AHB_CLK] = &gcc_disp_ahb_clk.clkr,
> > 
> > Removing it makes the dpu_mdss driver unhappy:
> > 
> > [    2.999855] dpu_mdss_enable+0x2c/0x58->msm_dss_enable_clk: 'iface' is not available
> > 
> > because:
> > 
> >          mdss: mdss@ae00000 {
> >      	        ...
> > 
> >   =>             clocks = <&gcc GCC_DISP_AHB_CLK>,
> >                           <&gcc GCC_DISP_HF_AXI_CLK>,
> >                           <&dispcc DISP_CC_MDSS_MDP_CLK>;
> >                  clock-names = "iface", "gcc_bus", "core";
> > 	};
> > 
> 
> The basic idea as you mentioned below was to move the CRITICAL clocks to
> probe. The clock provider to return NULL in case the clocks are not
> registered.
> This was discussed with Stephen on v3. Thus I submitted the below patch.
> clk: qcom: common: Return NULL from clk_hw OF provider.

I see. My assumption was that the entire clock hierarchy should be registered,
but Stephen almost certainly knows better :)

> Yes it would throw these warnings, but no functional issue is observed from
> display. I have tested it on the cheza board.

The driver considers it an error (uses DEV_ERR to log the message) and doesn't
handle other clocks when one is found missing. I'm not really famililar with
the dpu_mdss driver, but I imagine this can have some side effects. Added some
of the authors/contributors to cc.

> I guess we could fix the DRM driver to use the "devm_clk_get_optional()"
> instead?

It would also require a minor rework of the driver, which currently expects
all specified clocks to be available.

Another option could be to not list the clock in the device tree, then the
driver won't notice it as missing.

> > More clocks were removed in v4:
> > 
> > -       [GCC_CPUSS_GNOC_CLK] = &gcc_cpuss_gnoc_clk.clkr,
> > -       [GCC_GPU_CFG_AHB_CLK] = &gcc_gpu_cfg_ahb_clk.clkr,
> > -       [GCC_VIDEO_AHB_CLK] = &gcc_video_ahb_clk.clkr,
> > 
> > I guess this part of "remove registering the CRITICAL clocks to clock provider
> > and leave them always ON from the GCC probe." (change log entry), but are you
> > sure nobody is going to reference these clocks?
> > 
> 
> Even if they are referenced clk provider would return NULL.
> 
> > > +static int gcc_sc7180_probe(struct platform_device *pdev)
> > > +{
> > > +	struct regmap *regmap;
> > > +	int ret;
> > > +
> > > +	regmap = qcom_cc_map(pdev, &gcc_sc7180_desc);
> > > +	if (IS_ERR(regmap))
> > > +		return PTR_ERR(regmap);
> > > +
> > > +	/*
> > > +	 * Disable the GPLL0 active input to MM blocks, NPU
> > > +	 * and GPU via MISC registers.
> > > +	 */
> > > +	regmap_update_bits(regmap, 0x09ffc, 0x3, 0x3);
> > > +	regmap_update_bits(regmap, 0x4d110, 0x3, 0x3);
> > > +	regmap_update_bits(regmap, 0x71028, 0x3, 0x3);
> > 
> > In v3 this was:
> > 
> > 	regmap_update_bits(regmap, GCC_MMSS_MISC, 0x3, 0x3);
> > 	regmap_update_bits(regmap, GCC_NPU_MISC, 0x3, 0x3);
> > 	regmap_update_bits(regmap, GCC_GPU_MISC, 0x3, 0x3);
> > 
> > IMO register names seem preferable, why switch to literal addresses
> > instead?
> > 
> 
> :). These cleanups where done based on the comments I had received during
> SDM845 review. If Stephen is fine moving them to names, I could submit them
> in the next patch series.

Ok, thanks
