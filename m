Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA2739BC35
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Aug 2019 08:29:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726889AbfHXG3Z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 24 Aug 2019 02:29:25 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:37724 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726837AbfHXG3Z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 24 Aug 2019 02:29:25 -0400
Received: by mail-pg1-f194.google.com with SMTP id d1so7086631pgp.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Aug 2019 23:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=lk3/fdWNHGpXSG4wNNd4Z51nWhNqtO7vua0PVil2X8k=;
        b=MmZFw4++6ajNtGcDjnTyEZX45owjmCdZ77MjxfCiLNnUI6FmuFS/kri/kbpAgTsdzS
         cbmA9XAWRXj9gfAsdppqv/ff/ZeRU7OAmyY2sLRehhuBXaRkxR5jGUl0UFL6zkuQHni0
         zxoPgS3ZxJ7tFveYa+1FM5lF8srYTmrTqv3kPOhfO7S9UxwXylkR14GzFHwvVQm7pXOS
         Nae34H7jXleGz0JuV2eEYKgAS3iu61sZHrhcV8OjMKr6/eMQb6/M0cnaJgDKBw+yqVzM
         TAS3vluUriOA9JL5s8zEqc92AGJXaaEXBJ8qjWeNMj+PxdX1mlEKh8h54TNcFgtodkBJ
         HyIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=lk3/fdWNHGpXSG4wNNd4Z51nWhNqtO7vua0PVil2X8k=;
        b=d1MxBO5hGkHyErqLvjV1rNQ+fROJvss0Gedo1t1Mp4YdtgBhwPhVCrc3+OUUqgHsMN
         AyDui5wceKEzAfZPi4Q5Tjec9E07MivckEoDzY7UFIyvAXVttoFMKt/ft2QdD72OWtle
         ptsgwmUGvUMGHWhI/3zz9/gxnzqpLRuHjBdLOCgYty74bfzjMKNFPdFwrjVG0Vf6y3hs
         aLx2TtFVTDwKSl4Wk7le1+2Hs6yI8qxMuxiRgqVNS9luuuv82ydN5SQpuLZKeR3jXii+
         SUPAYXZZ+Nhw4vc8W51Fzh7un7fuOOt43HCQLWeHicjWn0EmjZKTbEUTZPNfRKytdr1X
         Vs9A==
X-Gm-Message-State: APjAAAUqDux66RRUfx7gTXJl77Dk9CuooDYEJBcEViBjaSGWZ60dsQCv
        Vo2XJ0BJIWMmXhCSBixjsXBhTg==
X-Google-Smtp-Source: APXvYqzP5aW10UjB6WQjHdGXFspmjnPMEW+2ogI0RPCqFngLxhyRS7aAGs3AqLaugeVz1K62+sqiHA==
X-Received: by 2002:a17:90a:ab01:: with SMTP id m1mr8623968pjq.69.1566628164813;
        Fri, 23 Aug 2019 23:29:24 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id w129sm8673188pfd.89.2019.08.23.23.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2019 23:29:24 -0700 (PDT)
Date:   Fri, 23 Aug 2019 23:31:15 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/4] clk: qcom: clk-rpmh: Convert to parent data scheme
Message-ID: <20190824063115.GW26807@tuxbook-pro>
References: <20190822170140.7615-1-vkoul@kernel.org>
 <20190822170140.7615-3-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190822170140.7615-3-vkoul@kernel.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 22 Aug 10:01 PDT 2019, Vinod Koul wrote:

> Convert the rpmh clock driver to use the new parent data scheme by
> specifying the parent data for board clock.
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  drivers/clk/qcom/clk-rpmh.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
> index c3fd632af119..0bced7326a20 100644
> --- a/drivers/clk/qcom/clk-rpmh.c
> +++ b/drivers/clk/qcom/clk-rpmh.c
> @@ -95,7 +95,10 @@ static DEFINE_MUTEX(rpmh_clk_lock);
>  		.hw.init = &(struct clk_init_data){			\
>  			.ops = &clk_rpmh_ops,				\
>  			.name = #_name,					\
> -			.parent_names = (const char *[]){ "xo_board" },	\
> +			.parent_data =  &(const struct clk_parent_data){ \
> +					.fw_name = "xo_board",		\
> +					.name = "xo_board",		\

Iiuc .name here refers to the global clock namespace and .fw_name refers
to the device_node local name space. As such I really prefer this to be:

  .fw_name = "xo",
  .name = "xo_board",

This ensures the backwards compatibility (when using global lookup),
without complicating the node-local naming.

Regards,
Bjorn

> +			},						\
>  			.num_parents = 1,				\
>  		},							\
>  	};								\
> @@ -110,7 +113,10 @@ static DEFINE_MUTEX(rpmh_clk_lock);
>  		.hw.init = &(struct clk_init_data){			\
>  			.ops = &clk_rpmh_ops,				\
>  			.name = #_name_active,				\
> -			.parent_names = (const char *[]){ "xo_board" },	\
> +			.parent_data =  &(const struct clk_parent_data){ \
> +					.fw_name = "xo_board",		\
> +					.name = "xo_board",		\
> +			},						\
>  			.num_parents = 1,				\
>  		},							\
>  	}
> -- 
> 2.20.1
> 
