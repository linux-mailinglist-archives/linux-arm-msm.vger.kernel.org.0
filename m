Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE9EB211F5E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2020 11:02:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727059AbgGBJC1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Jul 2020 05:02:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726980AbgGBJC1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Jul 2020 05:02:27 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DA42C08C5C1
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2020 02:02:27 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id j4so24789434wrp.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2020 02:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:autocrypt:message-id:date
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=GTjBc/hGNzcdceABAK8fzhzIDZV3nXCY7b4Mavy/ci4=;
        b=dKQMuoA7HIpaNtUkzWhx3mdsNLhbCrlZ8RJbekzqaLKEnDgAEfs7o+4ek33OUTza6K
         HWx3pqxLSLn9RV93satwEB/+SQ3Na376tQj223LP6YbnuU8xwEcSePDqdOq8MeS0e224
         cyTkt7uofZrXzLv5ZgPL8TZWOj8B1klRB2+/rj6JvZqqNJixZ23RCIuF0j0zm93KpaJc
         W4oqYuu8T+SRmOpGgqBJ1VNDYXcFuk9MvR+M6vUNTh0x91SgHqVYwFva6P0tbC/mL1Gq
         sh/NkHdsTSfW7ZKnoB5Mg8knSpLVOhGQs1UA+0HCOgpo8806bKYCbePRUSD/kBa9dr9D
         w2Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GTjBc/hGNzcdceABAK8fzhzIDZV3nXCY7b4Mavy/ci4=;
        b=KSDw+Cd7Fni4WEqF738K3ToCWT7iuELl0LzJk7a01fFmvN9YPEuLkzGdUsdFBd0eLA
         9bpVZ24B1KQ8PFdDh/C+iKl2bzXYEcur/EsRypulZIjZmR0AHzaxdeqMih/EiQeMWZdr
         MUlz9c/0KFaSnKUCZZT6pVr7DeX6RWS9fiQJjyHQcf7zfiOOYo3NTUbaqOPem5LfSWPO
         61teeo5emTm98plg5CPmhY02jKy7c81p510TCiCbwqwGRgnqiRkKrIfhO8qRINQIdknu
         dSTkaKz5J8f4MixOuiVNHe/F6Nn0M2s8pQE31Um3mkWDNgcCVBfW3WqwSG6tnpDJb+ks
         d5eA==
X-Gm-Message-State: AOAM531T5OKAUyzzbyCs+IoFz1uhsdZ6j5IcV/7l1JsoiKFRtEFJJc7E
        75YoGq3vc91q6IzZkwnIdxzxTYBSp8g=
X-Google-Smtp-Source: ABdhPJzxHeV5yMLoBrPWiPRB1A0Q06rRRCdhwyYMDS5EvocURzJNJalrdw6sGQYsUIaP6YcsrRltFQ==
X-Received: by 2002:adf:dd4a:: with SMTP id u10mr30173514wrm.169.1593680545840;
        Thu, 02 Jul 2020 02:02:25 -0700 (PDT)
Received: from [10.44.66.8] ([212.45.67.2])
        by smtp.googlemail.com with ESMTPSA id b17sm9919016wrp.32.2020.07.02.02.02.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2020 02:02:25 -0700 (PDT)
Subject: Re: [PATCH 1/4] interconnect: qcom: Support bcm-voter-specific TCS
 wait behavior
To:     Mike Tipton <mdtipton@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, agross@kernel.org,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200623040814.23791-1-mdtipton@codeaurora.org>
 <20200623040814.23791-2-mdtipton@codeaurora.org>
From:   Georgi Djakov <georgi.djakov@linaro.org>
Autocrypt: addr=georgi.djakov@linaro.org; prefer-encrypt=mutual; keydata=
 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
 KEmKjLDvB0pePJkdTw==
Message-ID: <fee03dda-4c17-701b-bb1a-bf9482cc476d@linaro.org>
Date:   Thu, 2 Jul 2020 12:02:23 +0300
MIME-Version: 1.0
In-Reply-To: <20200623040814.23791-2-mdtipton@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Mike,

On 6/23/20 07:08, Mike Tipton wrote:
> Currently, all bcm-voters set tcs_cmd::wait=true for the last VCD
> command in each TCS (AMC, WAKE, and SLEEP). However, some bcm-voters
> don't need the completion and instead need to optimize for latency. For
> instance, disabling wait-for-completion in the WAKE set can decrease
> resume latency and allow for certain operations to occur in parallel
> with the WAKE TCS triggering. This is only safe in very specific
> situations. Keep the default behavior of always waiting, but allow it to
> be overridden in devicetree.
> 
> Signed-off-by: Mike Tipton <mdtipton@codeaurora.org>
> ---
>  drivers/interconnect/qcom/bcm-voter.c | 32 ++++++++++++++++++---------
>  1 file changed, 21 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/interconnect/qcom/bcm-voter.c b/drivers/interconnect/qcom/bcm-voter.c
[..]
> @@ -336,7 +342,11 @@ static int qcom_icc_bcm_voter_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  
>  	voter->dev = &pdev->dev;
> -	voter->np = pdev->dev.of_node;
> +	voter->np = np;
> +
> +	if (of_property_read_u32(np, "qcom,tcs-wait", &voter->tcs_wait))

This DT property needs to be documented.

Thanks,
Georgi
