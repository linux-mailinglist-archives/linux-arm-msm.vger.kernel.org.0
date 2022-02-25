Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2BC684C46AE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Feb 2022 14:37:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241511AbiBYNhl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Feb 2022 08:37:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241499AbiBYNhj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Feb 2022 08:37:39 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0115ECC7E
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Feb 2022 05:37:04 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id l1-20020a7bcf01000000b0037f881182a8so1702473wmg.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Feb 2022 05:37:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=LLpFgz78t1oyzWMh4Y4sBh571G9i6nh/jXJ+jWwza7k=;
        b=qnSHncmvDNQSyhYwHGMPduQc2VHvZllkFXUi8WCqlPYsqHsGyxR7diTmu96tNyuXTX
         9x+bEH6fjmLd7nsN9gI993CY2H8nLTNdPb6gMW7NirEFAE7nBZBJprOTc39xjriFm4mu
         XAPm0YAplY9IcafACSXZHkVYKY+pUxToW8/h5YP2QbePSEZq3kUOXiy1rAIDTXxEzBMp
         WVabxd+aXfZqvKx1VEX6pl3lsbfhk/TpDsJEJJBqfsdViqm/75f5hWJVLMJQeblI7pN8
         3oMkXBdzlipXLk6CcWSaY4eDW0EGo9il0p7ext2xodaVi7ogy4RUR9CqDTV6Cbbow4zs
         BkTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=LLpFgz78t1oyzWMh4Y4sBh571G9i6nh/jXJ+jWwza7k=;
        b=I2A9vuMMijqtZbqzbRpJbKRJVQg4zKRhrZkM4sJmbkRBqq5UsLWNOkNYj8qQODIyxP
         ZYtTDCAQPbbEa3MMT2YBdrle1POWCYAPlLWCIruq2qKPfL0E3p2wUK3lSnKxBHute46W
         fMS1fTT7+RIvSvM6ocFscHQT1Gxixvo6BngodV2/Kdf4KdorsVtzOWz6qRnDeupfsirj
         cS3z65fip7QL5dWSGlCL7tVAVIX6sFrOvVraRV6UyIlV/kzNaCXQDFR4/qGBk/HNsDtk
         h/La9FdpA5XvvLNzBRh/7DQ0lwYCGITIqgg3pLMmksh9UuNT++kbzgPeu8VkLC15qx2T
         4aSA==
X-Gm-Message-State: AOAM530kPahMl7y3ZrQ32o+Gkynp0wYeH07FWZzTpDj2vFZ+0/p88HKP
        FfQ+ee6POvyXzmeHqf3GjV5RTA==
X-Google-Smtp-Source: ABdhPJzlbmW009bfZhIOcWbIfq2JDYEC5ZLuIC33VFPLGDBy/EY9ndE8Zc9MvpIUd5BXrDsqFTyknA==
X-Received: by 2002:a05:600c:3d06:b0:37b:f831:2a98 with SMTP id bh6-20020a05600c3d0600b0037bf8312a98mr2759914wmb.36.1645796223402;
        Fri, 25 Feb 2022 05:37:03 -0800 (PST)
Received: from [192.168.86.34] (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
        by smtp.googlemail.com with ESMTPSA id u14-20020adfed4e000000b001e3323611e5sm2406589wro.26.2022.02.25.05.37.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Feb 2022 05:37:02 -0800 (PST)
Message-ID: <861cd4c1-43a9-8175-7ad1-e7e51f5781b4@linaro.org>
Date:   Fri, 25 Feb 2022 13:37:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] soundwire: qcom: remove redundant wait for completion
Content-Language: en-US
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, quic_plai@quicinc.com,
        bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
        rohitkr@codeaurora.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, swboyd@chromium.org,
        judyhsiao@chromium.org, koul@kernel.org,
        yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.intel.com, sanyog.r.kale@intel.com
Cc:     Venkata Prasad Potturu <quic_potturu@quicinc.com>
References: <1645795667-20176-1-git-send-email-quic_srivasam@quicinc.com>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <1645795667-20176-1-git-send-email-quic_srivasam@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 25/02/2022 13:27, Srinivasa Rao Mandadapu wrote:
> Remove wait_for_completion_timeout from soundwire probe
> as it seems unnecessary and device enumeration is anyway not
> happening here.

May be some details on the side effects of this wait would be good to 
add in the log.

> Also, as device enumeration event is dependent on wcd938x probe to be
> completed, its of no use waiting here.

fix tag is missing

Fixes: 06dd96738d618 ("soundwire: qcom: wait for enumeration to be 
complete in probe")

> 
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> ---
>   drivers/soundwire/qcom.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index 5481341..9a32a24 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -1309,8 +1309,6 @@ static int qcom_swrm_probe(struct platform_device *pdev)
>   	}
>   
>   	qcom_swrm_init(ctrl);
> -	wait_for_completion_timeout(&ctrl->enumeration,
> -				    msecs_to_jiffies(TIMEOUT_MS));
>   	ret = qcom_swrm_register_dais(ctrl);
>   	if (ret)
>   		goto err_master_add;
