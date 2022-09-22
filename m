Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E978C5E6A4F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Sep 2022 20:05:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232387AbiIVSFE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Sep 2022 14:05:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232388AbiIVSEc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Sep 2022 14:04:32 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A215D1075A6
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 11:03:31 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id k10so15988912lfm.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 11:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=CBSm0+/j7g28NuQ+i5FWRy1En5Be0Ute8R2ym7b/IN8=;
        b=AC1ntdkyYfo6RGC0/KHA08P8CowP0Bl9RAurLJoVBF8jtuklA4hjPkrGiXZKvo2UX+
         FT9A9sgodrqR0MA1r5tGGIyp9TJAQ+zbbCNWJ6/97okVG8VGAnmcnz8AY8MZS4J/7Q+u
         ObjuP0Y6u7kMqcQGirqyAaVaKepioo4cyq2kIgxj38cRjI394QjvPrCCYtjMtOt5Du0x
         6iyCm1doAMZvyJmlJR/PejLGQrUFAa1rc/rtz9uv+0ea3AcdaLEZW/PzrSB8ofj2vmc5
         A32dM/y/BFe3ErVPlg23ezelspAHaBopY3ii0NhAnftuPRQL8UpjCfQk/ZKMQu8pkv+g
         Qt0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=CBSm0+/j7g28NuQ+i5FWRy1En5Be0Ute8R2ym7b/IN8=;
        b=IvdZ6kmR0gTLLgZ4mA180BJEorX/MlKVCcqqtYh/MfbDjQcdURRUVtCwiWdATmrJNC
         xsi6lM8Z1qa2vFrtbVrAwX5JkOptmigBnvYWRV33onoMri8RTJmcSJ+STqqXgNvwFIB2
         w7SinZOunF48I+fW/N0NPFm7dT4xOu2aWZ7vzwPRrx/bDYoFFmbGfsnkmDLQqxLmK8xE
         Dju6DQVGsj82r39O2Wfldo8eiE+cHZ2YvGoqnNOuKnOsuHxFsdnlBaBf0IIryTiXwP1/
         kOgN8rSE5JppjwSW4eSDFRYfuNPhSBcIPxi7r+gkQ3gkxamMPVPWkZa8m6T7MMqDW81S
         ttVQ==
X-Gm-Message-State: ACrzQf1Bvrv+8ohIRlAYslD10Dc5Yt1ZaTev/SSq7ojL2J836gOdHIZv
        mlKkZSGALmpw4C5CHJO7KD2vDw==
X-Google-Smtp-Source: AMsMyM7sJ/AwoeK2356DER1DmoHFMGNT+ERKsIdp5mqRCRkO/8aAtHtGacciWfNgsAbR4D6zIsryog==
X-Received: by 2002:a05:6512:3503:b0:496:517:5818 with SMTP id h3-20020a056512350300b0049605175818mr1651844lfs.186.1663869809950;
        Thu, 22 Sep 2022 11:03:29 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id f8-20020a193808000000b0049473593f2csm1035030lfa.182.2022.09.22.11.03.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Sep 2022 11:03:29 -0700 (PDT)
Message-ID: <e99829fa-0dff-1304-c9a2-a93f8f62c43c@linaro.org>
Date:   Thu, 22 Sep 2022 21:03:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 1/7] phy: qcom-qmp-combo: Use dev_err_probe() to simplify
 code
Content-Language: en-GB
To:     Yuan Can <yuancan@huawei.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@somainline.org, kishon@ti.com,
        vkoul@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org
References: <20220922111228.36355-1-yuancan@huawei.com>
 <20220922111228.36355-2-yuancan@huawei.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220922111228.36355-2-yuancan@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22/09/2022 14:12, Yuan Can wrote:
> In the probe path, dev_err() can be replaced with dev_err_probe()
> which will check if error code is -EPROBE_DEFER and prints the
> error name. It also sets the defer probe reason which can be
> checked later through debugfs.
> 
> Signed-off-by: Yuan Can <yuancan@huawei.com>
> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 21 +++++++--------------
>   1 file changed, 7 insertions(+), 14 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

