Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 43D424D55D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2019 19:39:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726649AbfFTRjM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Jun 2019 13:39:12 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:36270 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726526AbfFTRjM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Jun 2019 13:39:12 -0400
Received: by mail-pf1-f195.google.com with SMTP id r7so2072636pfl.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jun 2019 10:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=cc1ritaWfB8okWYpyfEgKKo47agXWGIBS6N2MHN/GYs=;
        b=vuQhYp+6eDLIk8XExGRgk2rgXE+mzKmk4DsxpWyKKBSH1UjUeoVNhTmSPG5D4MFvQO
         S/5PAdojDjzCO/n2vYXv52252MTac8DzMp3ykB5wALlce+oZPlQrJwYK0Z2PF+JrgRlm
         8HkTr545vZgVZQxEDQTkH2Ny4G4D/tHWgb2UASI/vriwo3IdhSRwT7GN/vqadmCK7N6g
         2EaqnxIA/oSIA5GpZNzLEYvnYWUh18CloBaCEmhWF36pkDgVptx5eKqA8NaZiN/a7CNS
         K1Rp5udGauWwef5sJuFVAkrgF8PCbAXy+0bhNANQFFW5aehjOMqrM97PXNUYqLSgh2pm
         dJxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=cc1ritaWfB8okWYpyfEgKKo47agXWGIBS6N2MHN/GYs=;
        b=lHS6X0lLgh3G6ciRFL/6aU8Z72AWLVunHORuYVHhjl0NnAdkNY2TwPhIzFu2QJC5Yk
         JklfSyv9cJxPJzg4hBiuihSF1NVjYVAcVS6LgyHO4hjCswDc3WqgoLMq0d+BhnduO6eu
         Npal7gpdmugDQXODcSIv2to/QWPoetPDAEVU6DAR1sBEuN/RHTpubKSdLHEGenQ+6vGu
         dq8U8pScIa9IZDEEvEhjkZaOaGCIU4S4rugqGLPyIPyZ6iTN6XSXFbPP07hdDefihzwL
         zA1Sx1tAgyThX1lWUtCQ+s7/6sibH4MwATY3AIBDx9GzSVstTaCZH8lQK/phOloUeKJ6
         ii3A==
X-Gm-Message-State: APjAAAXVkLfnD+PPEmn65V/cyIcKZ7yZjrgkshMBEPGpIdHlNijlhTjM
        mPAM5opykTxA65gMcMy1/rIhdQ==
X-Google-Smtp-Source: APXvYqwExTPnMaUlhkHdlTdYWDKivjZXCj1uKm+C1IqlKfA29kclGbLVua9EqCTBKhqKLwndm8l9oA==
X-Received: by 2002:a63:c301:: with SMTP id c1mr13911552pgd.41.1561052351600;
        Thu, 20 Jun 2019 10:39:11 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id p6sm221710pgs.77.2019.06.20.10.39.10
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Jun 2019 10:39:10 -0700 (PDT)
Date:   Thu, 20 Jun 2019 11:39:08 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Suzuki K Poulose <suzuki.poulose@arm.com>,
        Leo Yan <leo.yan@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/2] coresight: Set affinity to invalid for missing CPU
 phandle
Message-ID: <20190620173908.GA5581@xps15>
References: <cover.1561037262.git.saiprakash.ranjan@codeaurora.org>
 <49d6554536047b9f5526c4ea33990b7c904673d3.1561037262.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <49d6554536047b9f5526c4ea33990b7c904673d3.1561037262.git.saiprakash.ranjan@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Sai,

On Thu, Jun 20, 2019 at 07:15:46PM +0530, Sai Prakash Ranjan wrote:
> Affinity defaults to CPU0 in case of missing CPU phandle
> and this leads to crashes in some cases because of such
> wrong assumption. Fix this by returning -ENODEV in
> coresight platform for such cases and then handle it
> in the coresight drivers.
> 
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---
>  drivers/hwtracing/coresight/coresight-platform.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-platform.c b/drivers/hwtracing/coresight/coresight-platform.c
> index 3c5ceda8db24..b1ea60c210e1 100644
> --- a/drivers/hwtracing/coresight/coresight-platform.c
> +++ b/drivers/hwtracing/coresight/coresight-platform.c
> @@ -160,15 +160,17 @@ static int of_coresight_get_cpu(struct device *dev)
>  
>  	if (!dev->of_node)
>  		return 0;

An error should be returned if the above condition is true.  

> +

Spurious newline

>  	dn = of_parse_phandle(dev->of_node, "cpu", 0);
> -	/* Affinity defaults to CPU0 */
> +
> +	/* Affinity defaults to invalid if no cpu nodes are found*/
>  	if (!dn)
> -		return 0;
> +		return -ENODEV;
> +
>  	cpu = of_cpu_node_to_id(dn);
>  	of_node_put(dn);
>  
> -	/* Affinity to CPU0 if no cpu nodes are found */
> -	return (cpu < 0) ? 0 : cpu;
> +	return cpu;
>  }
>  
>  /*
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
> 
