Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E87655DC32
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jun 2022 15:25:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241122AbiF0UP0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Jun 2022 16:15:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240499AbiF0UPX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Jun 2022 16:15:23 -0400
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com [IPv6:2001:4860:4864:20::29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 380E01D309
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jun 2022 13:15:22 -0700 (PDT)
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-101dc639636so14361118fac.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jun 2022 13:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=3blwfZZTMRBH390nLectWFhgIDm492Spnq2Xbbt6JLs=;
        b=WwMLVEADRqo0P379S218zDtekCtrer/BHLyL1Q2GaVLMcC5xK9GWWt7DxKFdvVZVnZ
         FejS5WV95S3MzGXd57qtDbBRWVd/tn+PYMXOlPxV48dS0NOa4SjR1EffahaZGmf1Jhcr
         eziLCY/lyiwqwkZYBgZkxclzxmmrH9tRF7uyCDs4xsFD+1LMMGG7LFpoEI+RvldIqm3e
         09xfsDIVVV6s/cWINSeGZi9zUrbBZF08G2i2qTyvOOmst+4WJg9Sq6ePf8noRA5QB1AE
         2xVqZ7v6vPUmbVC73zoANim7if9CR/SVuolDXeVO+Kxd5SP7VZLyM0TRkIuVPhdt/ZhO
         H3vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3blwfZZTMRBH390nLectWFhgIDm492Spnq2Xbbt6JLs=;
        b=1NRgEXWFU6Csj/LmSKKpGgtgYGXFm9uhOawRhQ15pbj4oUOxFaooCYRvr0LbvcJ+nl
         Lu58awIo/y6TpTYu4WzxEd5BBIrkfHgZ22ac4WEV5n6hG5DaEECZxCHTqRbdrddAZTYF
         kotM0U83ErbUPtCtZKdPxP6/Yv6n35wWM0iio72ZURONmlgxGmoT0nKLTgwhyTJxZNN3
         HFJlAY46VDcVECx3l68kh8jJTLwc1EfkReat3OgCVmICFiXyYks3K9CtLKoSAUgbQuZ6
         NA1BSMBi3TtaDAwcl7uLUjXU6ArPVJIlXsf3PArMVfg7ajozeTmHuniHNIzrL5QaN0zA
         947A==
X-Gm-Message-State: AJIora+eJ0flFIQHn51T8xcdVRJkRf1ASdQ4zGwJLHjAdCFshLh479vm
        qaw3LGGoi86ohl0i/34d8bOiKg==
X-Google-Smtp-Source: AGRyM1s6/0wpqNUDQhjiqZ+M7gqbWaoTWXguFmAH0NmwWfEtd/aNBLP+yimen/s314Wj9uF8MuPn7g==
X-Received: by 2002:a05:6870:430c:b0:101:f886:3760 with SMTP id w12-20020a056870430c00b00101f8863760mr8002029oah.88.1656360921523;
        Mon, 27 Jun 2022 13:15:21 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id a18-20020a9d3e12000000b006168dbb001fsm6731199otd.7.2022.06.27.13.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 13:15:20 -0700 (PDT)
Date:   Mon, 27 Jun 2022 15:15:18 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Li kunyu <kunyu@nfschina.com>
Cc:     agross@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drivers: the return value statement of the
 gcc_sm6350_probe function has an extra semicolon
Message-ID: <YroP1pW3dzoV9F4D@builder.lan>
References: <20220627020500.135125-1-kunyu@nfschina.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220627020500.135125-1-kunyu@nfschina.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun 26 Jun 21:05 CDT 2022, Li kunyu wrote:

> I think this semicolon could be deleted.
> 

Thank you for the patch Li.

Please look at the git log for suggestions about the prefix for your
commit subject (clk: qcom: gcc-sm6350: in this case).

I've updated the commit message and picked up the patch.

Regards,
Bjorn

> Signed-off-by: Li kunyu <kunyu@nfschina.com>
> ---
>  drivers/clk/qcom/gcc-sm6350.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/gcc-sm6350.c b/drivers/clk/qcom/gcc-sm6350.c
> index a4f7fba70393..69412400efa4 100644
> --- a/drivers/clk/qcom/gcc-sm6350.c
> +++ b/drivers/clk/qcom/gcc-sm6350.c
> @@ -2558,7 +2558,7 @@ static int gcc_sm6350_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> -	return qcom_cc_really_probe(pdev, &gcc_sm6350_desc, regmap);;
> +	return qcom_cc_really_probe(pdev, &gcc_sm6350_desc, regmap);
>  }
>  
>  static struct platform_driver gcc_sm6350_driver = {
> -- 
> 2.18.2
> 
