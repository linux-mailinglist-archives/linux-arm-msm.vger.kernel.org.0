Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75DF115DC7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2019 08:55:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726365AbfEGGzn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 May 2019 02:55:43 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:33139 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726253AbfEGGzn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 May 2019 02:55:43 -0400
Received: by mail-pf1-f195.google.com with SMTP id z28so8151319pfk.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 May 2019 23:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=UWFGclreBqK14SYbMq2K7ZoXoM7JUPH8rO1VMNdVVW0=;
        b=UMMLnWG4abHWBIpK7s91J324jWLx2vrsbjmPXim3igk7jRFo6ZQ6n83CALMKI/Axly
         G/lx7wzLrE1D6ZHk5aduEeg7Ts7VJ1bwcjIVQBeuDEQkToewjrcaKw5g6vdZegdTlHgJ
         Gpq9PbYgFW9jTYuH6aDEAA9dW846q6LtRdFtVJtKezkkZ4oCMgeIRAOilSme0DwHcMSV
         RAKHSSY2OGD6HuRts/594cqDzKi7gunoDuaj9UGMy8ZqL08qwVMWgzRj3cnWkHdyB8mG
         tyFWFZnXf45cfFlfISFcdEhVphX3J1C3zaJehPhyg16GBclqcHLzaOk694cHCZROZrC9
         w9bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=UWFGclreBqK14SYbMq2K7ZoXoM7JUPH8rO1VMNdVVW0=;
        b=dTQQtRtad0FOxB0rJilBaJ8jv9z2C2JMo8Uq07uPSQCQq71US0O1J7P+kiEQ8JX4Et
         cuJxGkNsAIHZCNeBCT+F5GacfrUAXjmAwnCpsaajg4Jp+u2g0iagedo5xq9Ci1xL3OlC
         fNNPbt/NVkQxw7EbbOmd6ySd0V9HfEGjjEQ4ucq2d/CEQcRttAZ+8WRKaf+syvWsSrH3
         IH7A1kjghc4T2/leOd+pSP8xn6Q42c8ITG8zIetPJsvC2eAwzz8uioeCcvEBmSpmlNRC
         nadr2z+VqSE3qTucvAKmihEunm7InOuZ1h1W3LCheFEpW3tvrPZbCtObkhrgDbQ/YwV8
         whqg==
X-Gm-Message-State: APjAAAUWd/N8nqgkFLny9/x+P4eSFj5EJvCqS5788cAP9yI25AgznMRm
        2us/R9bgAVma/wA/a8QdKSx8FQ==
X-Google-Smtp-Source: APXvYqwxmniIrwLxpXqEa123LJPdEDrKUmBTX9fYCqxmAL0CYOX5G+VVDnPBt11tDpN3zMNqOydAUA==
X-Received: by 2002:a65:624f:: with SMTP id q15mr21964539pgv.436.1557212142702;
        Mon, 06 May 2019 23:55:42 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id o10sm19920594pfh.168.2019.05.06.23.55.41
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 May 2019 23:55:41 -0700 (PDT)
Date:   Mon, 6 May 2019 23:55:55 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Niklas Cassel <niklas.cassel@linaro.org>,
        Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, amit.kucheria@linaro.org,
        jorge.ramirez-ortiz@linaro.org, lina.iyer@linaro.org,
        ulf.hansson@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: qcs404: Add PSCI cpuidle support
Message-ID: <20190507065555.GB2085@tuxbook-pro>
References: <20190506193115.20909-1-niklas.cassel@linaro.org>
 <20190507053547.GE16052@vkoul-mobl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190507053547.GE16052@vkoul-mobl>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 06 May 22:35 PDT 2019, Vinod Koul wrote:

> On 06-05-19, 21:31, Niklas Cassel wrote:
> > Add device bindings for CPUs to suspend using PSCI as the enable-method.
> > 
> > Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/qcs404.dtsi | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
> > index ffedf9640af7..f9db9f3ee10c 100644
> > --- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
> > @@ -31,6 +31,7 @@
> >  			reg = <0x100>;
> >  			enable-method = "psci";
> >  			next-level-cache = <&L2_0>;
> > +			cpu-idle-states = <&CPU_PC>;
> >  		};
> >  
> >  		CPU1: cpu@101 {
> > @@ -39,6 +40,7 @@
> >  			reg = <0x101>;
> >  			enable-method = "psci";
> >  			next-level-cache = <&L2_0>;
> > +			cpu-idle-states = <&CPU_PC>;
> >  		};
> >  
> >  		CPU2: cpu@102 {
> > @@ -47,6 +49,7 @@
> >  			reg = <0x102>;
> >  			enable-method = "psci";
> >  			next-level-cache = <&L2_0>;
> > +			cpu-idle-states = <&CPU_PC>;
> >  		};
> >  
> >  		CPU3: cpu@103 {
> > @@ -55,12 +58,24 @@
> >  			reg = <0x103>;
> >  			enable-method = "psci";
> >  			next-level-cache = <&L2_0>;
> > +			cpu-idle-states = <&CPU_PC>;
> >  		};
> >  
> >  		L2_0: l2-cache {
> >  			compatible = "cache";
> >  			cache-level = <2>;
> >  		};
> > +
> > +		idle-states {
> 
> Since we are trying to sort the file per address and
> alphabetically, it would be great if this can be moved before l2-cache
> :)
> 

Picked up, with the order adjusted.

> Other than that this lgtm
>  

I presume that lgtm == Reviewed-by...

Thanks,
Bjorn

> > +			CPU_PC: pc {
> > +				compatible = "arm,idle-state";
> > +				arm,psci-suspend-param = <0x40000003>;
> > +				entry-latency-us = <125>;
> > +				exit-latency-us = <180>;
> > +				min-residency-us = <595>;
> > +				local-timer-stop;
> > +			};
> > +		};
> >  	};
> >  
> >  	firmware {
> > -- 
> > 2.21.0
> 
> -- 
> ~Vinod
