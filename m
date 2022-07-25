Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF57E57FA2F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Jul 2022 09:24:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232875AbiGYHX7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Jul 2022 03:23:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231773AbiGYHX4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Jul 2022 03:23:56 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D44812775
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Jul 2022 00:23:48 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id v13so6883241wru.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Jul 2022 00:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=QetEzkmBBXj/HOuiTlbMd5kkoGul/UMX9FiZtkQzY38=;
        b=Rd7tGFWCx0xQKhZWnwH9OEYG3o2gtViQ1dGe9wprYcG3Sjw+XWo69SeKMMGPNSHImD
         R4Di2fxv75cI5pLF7G9aq1wlpAipOhgu28O5zH+id4OwH44Ps8rcu1mlfjVHVy5J9Iz4
         1z7gTYDi67EAI1fRlH2KPyTrKY0ZsYa2u13aYGdoPFGZoufsyjmacM8fV3CSVspfoSao
         o7nF1yvIhxuYKqO6RQdPkjBRAGPNHvVRFsYsH2+v7Mcm1dG+125HcYW1Tfimi+4wLbxA
         SZNBneiRAqyZ7IqC5rKo6XnCSwUNb1P8VHRwIfOLT/9Z+PnxhagbHsNG4nC84isXLofI
         QtHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=QetEzkmBBXj/HOuiTlbMd5kkoGul/UMX9FiZtkQzY38=;
        b=JyIr9AsE0S3v+0YMbzt13BEbJDq8hA9fSpThoV/teqQnAbi9W6JGlzGig+TxXXK3x5
         k4qmtfA6nC8ygQiJz7MbRC+ZaYvzCakGIYDDWNRsWS1PJzcnKDdtm6WzzhbXsQEvLCOD
         NFvO4dUqzUh6Z6Mrn+eR86VRF6vHaAR0ymANgjP8ijKRrwy/5LvNLiLglyFaaIQLAbID
         qDhzYZ4uzOpivY40mijgyT1dUlfxZ6YiMGYo8/P6JiAC25qYRYUJlgUV4BqxNaz5CXRs
         rER+lMVqSFwqNIhcOdk1nOvodfawj0Hq+M3nta57UyG9fj1nygRWha4BUh9YLckxQkGe
         OjLg==
X-Gm-Message-State: AJIora86b9Ocepe7xsd2JpHfmj3QjmNptH628FQB6pxcQPygs5NJYkUl
        LPDOnisI1ZfdIAIcGsN8YT/jXg==
X-Google-Smtp-Source: AGRyM1uU+sGv98lNFHgNqjbocZUmrFN6gV5e3mOKlYyLZ3736xfrgnfzygF8oN3WenDK55fOUMmopg==
X-Received: by 2002:adf:f7c7:0:b0:21e:4aab:1641 with SMTP id a7-20020adff7c7000000b0021e4aab1641mr6604291wrq.166.1658733826674;
        Mon, 25 Jul 2022 00:23:46 -0700 (PDT)
Received: from linaro.org ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id e10-20020adfe7ca000000b0021dbaa4f38dsm13356483wrn.18.2022.07.25.00.23.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jul 2022 00:23:46 -0700 (PDT)
Date:   Mon, 25 Jul 2022 10:23:44 +0300
From:   Abel Vesa <abel.vesa@linaro.org>
To:     XU pengfei <xupengfei@nfschina.com>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        konrad.dybcio@somainline.org, mturquette@baylibre.com,
        sboyd@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kernel@nfschina.com
Subject: Re: [PATCH 1/1] clk/qcom/drivers/sm6350: qcom_cc_really_probe(pdev,
 &gcc_sm6350_desc, regmap) is assigned an extra semicolon
Message-ID: <Yt5FAJiEv0WWuDNV@linaro.org>
References: <20220725021623.3910-1-xupengfei@nfschina.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220725021623.3910-1-xupengfei@nfschina.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22-07-25 10:16:23, XU pengfei wrote:
> I think this semicolon could be deleted.
>
> Signed-off-by: XU pengfei <xupengfei@nfschina.com>

Thank you for your patch, but there are a few things you should change.

First of, the subject line should be something like:

clk: qcom: gcc-sm6350: Remove unnecessary semicolon

Then, your commit message should say what it does.
Maybe something like:

Remove unnecessary semicolon after qcom_cc_really_probe call.

Also, there is a document that describes everthing about submitting
patches. See Documentation/process/submitting-patches.rst.

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
