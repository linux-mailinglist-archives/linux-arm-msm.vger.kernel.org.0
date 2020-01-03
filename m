Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CDFC512FCE5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2020 20:16:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728460AbgACTQD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Jan 2020 14:16:03 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:42917 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728452AbgACTQD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Jan 2020 14:16:03 -0500
Received: by mail-pg1-f196.google.com with SMTP id s64so23803189pgb.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jan 2020 11:16:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=vZomX7k0gRVpj14/WdJAyZSo4OdRTfm/ogrPyU/9NuM=;
        b=VmUoJ7cuQOj8yvosIWRMEu6d5NSTnv4p0HCrFcIu9fQ4l81Ey6q939zzYUJeJaZ64a
         ZH8V3w/Bxs4NPF/ciAa/Idlx5QoLWz7IlUOexJ2fdFdHBiONrwSU/VYL5byEW+44CLfQ
         SMfc1uIBdlW6N7rHmwH63GYVPdqwbGIdXyBTt5ll2vlVFjZw6dO7LIYME8drzz9PvEUf
         Cr4DqbBrGxUqrRXNQYMHmTDa8yTAWLx+XW05Xb12ejiGIgLOCQ1KDNTsEubkkZQ4vg0n
         HDrz4DuaHQxjGrYKBtm18XZDIWGtMELTBthS32VS8DHo3BsMjSYp/gr1AWuQYKhJ/JGx
         7hcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=vZomX7k0gRVpj14/WdJAyZSo4OdRTfm/ogrPyU/9NuM=;
        b=VHAakutQlk5f+64r8W1GoHXxX+Cvk3qpwDJB8WIY0UGFG/uEQL0ibnoM7UYXcSC4Cd
         CDUert8yQIr8wo5S+T2hFUngaGzRWTmvdfekXv23cbqtQY/E6UxzSTgiWEv2CtNmzXsq
         u/yjCbG2tOvkw1iDh83qgFWTphjsEoFHZhs26irOVOKSNgZHard14a9+C6pLur+JhiU4
         WOeq0ce3EQoZbiXcaI7FugrbwNXKq06z8h89+iNnF77zjirbPpU3SyN5lRpPx9bYWp4h
         P/75/i+5LT0N7dJEKzDhbZh5TQGWVo1r/YtlTQbCWfskbOIjKeGIc1C4saJuCKUvMm3b
         shKg==
X-Gm-Message-State: APjAAAUe/CF8huoPgr3tCfcE0NCQ/2hV9jlkDPHByBTaVWyqW20LPoAU
        KabDP03y4cboORX+n7/Sb49t4w==
X-Google-Smtp-Source: APXvYqwbWrzgOHLfBKPcJOel52aFz7gJfvMHupIec6iWxtw+mfGglLXvkI30VeaYCSjb/tycYQe4Sg==
X-Received: by 2002:a63:6c82:: with SMTP id h124mr97258222pgc.328.1578078962175;
        Fri, 03 Jan 2020 11:16:02 -0800 (PST)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id 13sm67210755pfi.78.2020.01.03.11.16.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2020 11:16:01 -0800 (PST)
Date:   Fri, 3 Jan 2020 11:15:59 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Niklas Cassel <nks@flawful.org>
Cc:     sboyd@kernel.org, mturquette@baylibre.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v4] clk: qcom: apcs-msm8916: use clk_parent_data to
 specify the parent
Message-ID: <20200103191559.GV549437@yoga>
References: <20200103111429.1347-1-nks@flawful.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200103111429.1347-1-nks@flawful.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 03 Jan 03:14 PST 2020, Niklas Cassel wrote:

> From: Niklas Cassel <niklas.cassel@linaro.org>
> 
> Allow accessing the parent clock names required for the driver operation
> by using the device tree 'clock-names' property, while falling back to
> the previous method of using names in the global name space.
> 
> This permits extending the driver to other platforms without having to
> modify its source code.
> 
> Co-developed-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>

Tested-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
> Changes since v3:
> -Don't set dev->of_node explicitly, since the clock framework will now
> automatically use the parent node pointer when needed.
> 
> Requires the following patch to the clock framework to land first:
> https://patchwork.kernel.org/patch/11313639/
> 
>  drivers/clk/qcom/apcs-msm8916.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/clk/qcom/apcs-msm8916.c b/drivers/clk/qcom/apcs-msm8916.c
> index 46061b3d230e..cf69a97d0439 100644
> --- a/drivers/clk/qcom/apcs-msm8916.c
> +++ b/drivers/clk/qcom/apcs-msm8916.c
> @@ -19,9 +19,9 @@
>  
>  static const u32 gpll0_a53cc_map[] = { 4, 5 };
>  
> -static const char * const gpll0_a53cc[] = {
> -	"gpll0_vote",
> -	"a53pll",
> +static const struct clk_parent_data pdata[] = {
> +	{ .fw_name = "aux", .name = "gpll0_vote", },
> +	{ .fw_name = "pll", .name = "a53pll", },
>  };
>  
>  /*
> @@ -62,8 +62,8 @@ static int qcom_apcs_msm8916_clk_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  
>  	init.name = "a53mux";
> -	init.parent_names = gpll0_a53cc;
> -	init.num_parents = ARRAY_SIZE(gpll0_a53cc);
> +	init.parent_data = pdata;
> +	init.num_parents = ARRAY_SIZE(pdata);
>  	init.ops = &clk_regmap_mux_div_ops;
>  	init.flags = CLK_SET_RATE_PARENT;
>  
> -- 
> 2.24.1
> 
