Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C2B0456530C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Jul 2022 13:08:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233837AbiGDLIM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Jul 2022 07:08:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233572AbiGDLIM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Jul 2022 07:08:12 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EA9CFD00
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Jul 2022 04:08:11 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id a4so15264400lfm.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Jul 2022 04:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=24nNlsMfr3OS55kW6JyMPOHbkxZKW50v/zmuhFfVGs8=;
        b=xcD2DcIK3umUABGEvNZEq6nrj3ftwsXUJJTAyEgj871EUDssPfM7npjT28qib5BZBW
         I4J3CcpXuQjsyYxTmcWoHPKR3BrsYN4I0xaY5AF/T55kkHtfu/n90+Mk2qhWQqsbuubz
         g7Wubt16hkI+jSA950eGXOu5QXrT57Qz3Uh1dKiVtc2GFv6r/7Fm55EP9MjdlcrtqD+H
         127pSf1YDarGkhrW8ZSHP1SAv/R3y7QaOx4mvQHJswAV6QgVz/xo60ABtAzt9NKqrWuh
         AxWS1ilCKRcBMkh/zMD+xYubFxXFadJT0CwYsy7hMrV7R9m9pG5tqz1f089jf3edkyKI
         Hg2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=24nNlsMfr3OS55kW6JyMPOHbkxZKW50v/zmuhFfVGs8=;
        b=6C6/h2oQid6WlciSeXkTgh3FFLs9o51md6rGopSPnjyFe8V6M9uzVuTvkMUSfmIs3A
         E43WpFDuvgYcacB111Z3hhYWCAt8343PrnVGOunC+VqUGF7QIG2HFlBHWukUWcRZmZ+R
         pRJXmjvURKpAc2e3i9uwI6AiT5f+YxxpgF46g008aidXcAolbwBxsw1aR+HRui4twc3U
         tmGOI7Z1G+N68s2i+48e/9Igf+k8n8z4QdyYhUlDXnAPwMH2Pun0xWhqHroJvcsSR5tY
         rS4Q0E75GKWJPcPyKlcAbM4m69uNXHWSuLmzB4aZER7vjG8SylSXgudMgP6ZVXUsOXPD
         2unQ==
X-Gm-Message-State: AJIora9DFfAncctot2+an0hGv2eFkZYoTinvpWDqzj2tUI7AlfDP7Cvq
        aD6RytAKr6l2wdRAJzPI6KsGMQ==
X-Google-Smtp-Source: AGRyM1vBlEEZHvcR/ccGXcT4P+ctjxH4v4u15NOEHoHlpvwMY3krP/D+6dqwHbHoIqV+m0snDWjF6w==
X-Received: by 2002:a05:6512:3d08:b0:47f:79a9:66f0 with SMTP id d8-20020a0565123d0800b0047f79a966f0mr18535241lfv.576.1656932889472;
        Mon, 04 Jul 2022 04:08:09 -0700 (PDT)
Received: from [192.168.1.102] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id w19-20020a05651c119300b0025bb2508b8csm4416581ljo.3.2022.07.04.04.08.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Jul 2022 04:08:09 -0700 (PDT)
Message-ID: <355eda8c-ccc1-3197-257e-c018d66dd98c@linaro.org>
Date:   Mon, 4 Jul 2022 14:08:01 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] media: camss: Do not attach an already attached power
 domain on MSM8916 platform
Content-Language: en-US
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Robert Foss <robert.foss@linaro.org>,
        Todor Tomov <todor.too@gmail.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20220704105712.469657-1-vladimir.zapolskiy@linaro.org>
In-Reply-To: <20220704105712.469657-1-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 7/4/22 13:57, Vladimir Zapolskiy wrote:
> The change to dynamically allocated power domains neglected a case of
> CAMSS on MSM8916 platform, where a single VFE power domain is neither
> attached, linked or managed in runtime in any way explicitly.
> 
> This is a special case and it shall be kept as is, because the power
> domain management is done outside of the driver, and it's very different
> in comparison to all other platforms supported by CAMSS.
> 
> Fixes: 929684b7ef4d ("media: camss: Allocate power domain resources dynamically")

Fixes: 6b1814e26989 ("media: camss: Allocate power domain resources dynamically")

is the correct commit id found on media/master, please let me know, if anyone
wishes me to resend the fix.

> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>   drivers/media/platform/qcom/camss/camss.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index bf716b171c02..9e2899a0cdf4 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -1684,6 +1684,14 @@ static int camss_configure_pd(struct camss *camss)
>   		return camss->genpd_num;
>   	}
>   
> +	/*
> +	 * If a platform device has just one power domain, then it is attached
> +	 * at platform_probe() level, thus there shall be no need and even no
> +	 * option to attach it again, this is the case for CAMSS on MSM8916.
> +	 */
> +	if (camss->genpd_num == 1)
> +		return 0;
> +
>   	camss->genpd = devm_kmalloc_array(dev, camss->genpd_num,
>   					  sizeof(*camss->genpd), GFP_KERNEL);
>   	if (!camss->genpd)
> @@ -1923,6 +1931,9 @@ void camss_delete(struct camss *camss)
>   
>   	pm_runtime_disable(camss->dev);
>   
> +	if (camss->genpd_num == 1)
> +		return;
> +
>   	for (i = 0; i < camss->genpd_num; i++) {
>   		device_link_del(camss->genpd_link[i]);
>   		dev_pm_domain_detach(camss->genpd[i], true);

--
Best wishes,
Vladimir
