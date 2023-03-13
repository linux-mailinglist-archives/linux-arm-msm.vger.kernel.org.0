Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 20CF76B71E9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Mar 2023 10:02:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230402AbjCMJCX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Mar 2023 05:02:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229694AbjCMJBy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Mar 2023 05:01:54 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4D796152E
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Mar 2023 01:57:54 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id d36so14686804lfv.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Mar 2023 01:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678697868;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vG2hIsjaOd4MbHUHiVXsu6+98QpgUAMpZAz1HLFBAYw=;
        b=rLCKnc6LXfF/l+vowgqu+45yxJxvQS6zrLssUXcoNGQL2pM7GLKBgql42hlynGkkZD
         vGj+6eWu2GmxH0MMpcwK+UE9oKSrPf2LI1UEyyxvkC0XhffB9aBqLKpkTEBb1iHhXrY2
         OudZZhiB7R8UDeGNreLdHlhVoZVj+Gnj0lD1svZYYO214PcEiS+9Il4OvPwTyHcW2KyY
         o+engJreIQHPFMxna9ytRVoIaRSGbOI57HIpkAKNT6VYPlsESMypkyb0J6z+pRcEy+fr
         KrAc/iJ0QVkA/uQj8Gn/mG/zttCfzWQ/QB6BBXILWjVFf6Gg5zcXSPTRIs7n1W8TYmU2
         JbhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678697868;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vG2hIsjaOd4MbHUHiVXsu6+98QpgUAMpZAz1HLFBAYw=;
        b=qukHBhKPT5O9LP7Ewh02lL7fG+I8/oFwjyZKsZ2F6OYguQqSv1ZyH2lr5fsYbFUt2V
         k+2N5jliZCob/HdBiRLClqiPEHgSbYxbqYQcfO11Tfoij44cv0ZAhiTbX275OELZPufh
         eBsTEHWi4ONh57RG6awktXI5wT1dYFuXxBlDeU03rXn2B+TwjACC6pnKMdBn2lVbZHT2
         B/XnX+m3U7dlmIWMrct0BGT5Loxks90XPY2Xy/XbpsmkVY7aJyv7Ju/sPLn0VHo4g+uc
         TBUl/F2CORpD3JvclQZIpC3DsOiJl6/6tt3S2oz4Lx+rwRH+tN/tpjEIFAKo7ycY2vf4
         xS9A==
X-Gm-Message-State: AO0yUKUze5FFMDdhzmxOLnyC2lg6X+kEvtFuhBOUNDCsi5qXcHM5T077
        edliNu7EAQ+QKQqGrNdtDe2qKQ==
X-Google-Smtp-Source: AK7set9EtBcxmlEICRY/EI2PNnRVRF2HUoh341r7FSr8bbFAZ81faYrNhqlaWpezNQf9esZ6fqJUFA==
X-Received: by 2002:ac2:5fef:0:b0:4db:38aa:a2f4 with SMTP id s15-20020ac25fef000000b004db38aaa2f4mr9423816lfg.14.1678697868197;
        Mon, 13 Mar 2023 01:57:48 -0700 (PDT)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id z2-20020a056512376200b004d783b0d310sm892550lft.307.2023.03.13.01.57.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Mar 2023 01:57:47 -0700 (PDT)
Message-ID: <39ada68d-e294-9602-f3f6-506b9a6645d8@linaro.org>
Date:   Mon, 13 Mar 2023 09:57:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/2] interconnect: qcom: rpm: fix msm8996 interconnect
 registration
Content-Language: en-US
To:     Johan Hovold <johan+linaro@kernel.org>,
        Georgi Djakov <djakov@kernel.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20230313084953.24088-1-johan+linaro@kernel.org>
 <20230313084953.24088-2-johan+linaro@kernel.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230313084953.24088-2-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_HTTP,RCVD_IN_SORBS_SOCKS,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 13.03.2023 09:49, Johan Hovold wrote:
> A recent commit broke interconnect provider registration for the msm8996
> platform by accidentally removing a conditional when adding the missing
> clock disable in the power-domain lookup error path.
> 
> Fixes: b6edcc7570b2 ("interconnect: qcom: rpm: fix probe PM domain error handling")
The hash seems to be different:

https://git.kernel.org/pub/scm/linux/kernel/git/djakov/icc.git/commit/?h=icc-next&id=9038710161f0f028e36ef383fca59080f48420ee

> Reported-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Link: https://lore.kernel.org/r/641d04a3-9236-fe76-a20f-11466a01460e@wanadoo.fr
> Cc: stable@vger.kernel.org      # 5.17
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>  drivers/interconnect/qcom/icc-rpm.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/interconnect/qcom/icc-rpm.c b/drivers/interconnect/qcom/icc-rpm.c
> index 4d0997b210f7..3b055cd893ea 100644
> --- a/drivers/interconnect/qcom/icc-rpm.c
> +++ b/drivers/interconnect/qcom/icc-rpm.c
> @@ -498,7 +498,8 @@ int qnoc_probe(struct platform_device *pdev)
>  
>  	if (desc->has_bus_pd) {
>  		ret = dev_pm_domain_attach(dev, true);
> -		goto err_disable_clks;
> +		if (ret)
> +			goto err_disable_clks;
*wipes glasses*.. right..

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  	}
>  
>  	provider = &qp->provider;
