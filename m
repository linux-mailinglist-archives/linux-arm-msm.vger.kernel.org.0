Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01F8C576F9F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Jul 2022 17:09:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229579AbiGPPJq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 16 Jul 2022 11:09:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229501AbiGPPJq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 16 Jul 2022 11:09:46 -0400
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com [IPv6:2001:4860:4864:20::2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8939717594
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 Jul 2022 08:09:45 -0700 (PDT)
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-1013ecaf7e0so12755688fac.13
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 Jul 2022 08:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=v6MiM9RoNdUUGvkVD1r4P94mUQxQv0P220wTTYZRwVU=;
        b=ZGvBMX4y9d9GhcA245+T1Uw6fhHCYK8qSsCOrQEqkEEri77/1RRDg9aeR3nsz3aPYT
         KPW6tVTMJc/n1BPI+j29xQFi0zq3rLMmGVx9WlPxjGyRkp03A8bKPFxpdHMexLIZ3GaK
         xWqYjmOgp61508nmiw3PTVStjsrr6DQSvhU1ZmuiwXmOs6GbHA6jxBoKnLR+IIELM4ad
         TwCYs0NChNiqJ/DD7g8nEs1S5hNdTouL1PkMyI84yVXQeU4C9t8lYdFqVQXuaMVb/NIY
         eqZk7MRxW7NgeKhhyMBXH5XGiRUGPCbEv3T/3aLu+UqjZMO9KYEowVwsdnsYhtzPmDCw
         Q03w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=v6MiM9RoNdUUGvkVD1r4P94mUQxQv0P220wTTYZRwVU=;
        b=pphKI+HZb8TFB+c0QVltuJILiiSWNzpI5bHpLNMGP56USYKHXoUL56MFni9YTV7ffw
         NP/b8x2GTR67QJodVoZYogwZwhEiK4ZrU0+ZytlcSmzSh38ffSjScbUoGGlr/pLC3887
         EfjggdPsbn4GJlA4OmtgzMKAjtPxK1O37fKRl+Et+EYIDXfoU2j7I5l8BVvhlWuig2HT
         IWtFdSPYNYjnmwo0SCtudJDvUml37oapyWRxhzSRABudISjKgIkibV5bFZ04cQoCiWiF
         AyeuM0+0Vn2bUPDo4pv1+2gftCeFPQ/F5eBQbAS/HtzEQtoCK84Vy4sp0Nmb6tXTuAAG
         RieA==
X-Gm-Message-State: AJIora+xXcQxBVO+Nyj+DbkvVTgFDs2G5Myg4sIcVv0TM9pyAs06YxeM
        Az66rdT9Hr//sk49ggWWMy39q2ikH5kZxg==
X-Google-Smtp-Source: AGRyM1uHf1vVIHJYSDyo2Pg9NhRVS4DqD7W67x7HmhHmQ7ZM34wu1LTW55rvabX3A/6I09iYaoL/6w==
X-Received: by 2002:a05:6870:d1d2:b0:10c:d05:7588 with SMTP id b18-20020a056870d1d200b0010c0d057588mr13213047oac.180.1657984183765;
        Sat, 16 Jul 2022 08:09:43 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id k11-20020a056870d0cb00b0010c60ec553esm3757518oaa.44.2022.07.16.08.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Jul 2022 08:09:43 -0700 (PDT)
Date:   Sat, 16 Jul 2022 10:09:41 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Parikshit Pareek <quic_ppareek@quicinc.com>
Cc:     Andy Gross <agross@kernel.org>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Prasanna Kumar <quic_kprasan@quicinc.com>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v4] soc: qcom: Fix the id of SA8540P SoC
Message-ID: <YtLUtTY7iui5EtXz@builder.lan>
References: <20220711083957.12091-1-quic_ppareek@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220711083957.12091-1-quic_ppareek@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 11 Jul 03:39 CDT 2022, Parikshit Pareek wrote:

> Change the id of SA8540P to its correct value, i.e., 461.
> Also, map the id 460 to its correct values, i.e. SA8295P.
> 
> Fixes: 76ee15ae1b13 ("soc: qcom: socinfo: Add some more PMICs and SoCs")
> Signed-off-by: Parikshit Pareek <quic_ppareek@quicinc.com>
> Reviewed-by: Eric Chanudet <echanude@redhat.com>
> Tested-by: Eric Chanudet <echanude@redhat.com>

Thanks for the fix and welcome to the upstream kernel!

I added "socinfo:" to the subject prefix and applied the change.

Regards,
Bjorn

> ---
>  drivers/soc/qcom/socinfo.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
> index c2c879ccc6c0..4554fb8655d3 100644
> --- a/drivers/soc/qcom/socinfo.c
> +++ b/drivers/soc/qcom/socinfo.c
> @@ -328,7 +328,8 @@ static const struct soc_id soc_id[] = {
>  	{ 455, "QRB5165" },
>  	{ 457, "SM8450" },
>  	{ 459, "SM7225" },
> -	{ 460, "SA8540P" },
> +	{ 460, "SA8295P" },
> +	{ 461, "SA8540P" },
>  	{ 480, "SM8450" },
>  	{ 482, "SM8450" },
>  	{ 487, "SC7280" },
> -- 
> 2.17.1
> 
