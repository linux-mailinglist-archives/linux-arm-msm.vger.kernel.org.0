Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC4AD69F6C9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Feb 2023 15:41:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230478AbjBVOk7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Feb 2023 09:40:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231127AbjBVOk5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Feb 2023 09:40:57 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C502F37B65
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Feb 2023 06:40:52 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id bp25so10447074lfb.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Feb 2023 06:40:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PvLTXVhFf+9UO9yJz50JTAIFh9uNCAolWXsnSIodUYI=;
        b=VPBJFAXyNbqDjZxq9pO/ZNoH2BJ8eEOKyOGnzkifVboY9avrnNrKkYlKM1Y+FIkiTw
         ggz/lsxUmzfqnR2xmvyy6zckac8EjkrGhtRXkRjXH0Id+/yG42kdjUWUVh1IAJTfn0oV
         rKwcRDzWZm6zcZbYS7zH//wWIYmZsV8eqSFmng4fSxqnwJbmTsQMKs6hPRowXdxyzdfU
         t39+rSq39OMJkvy/MLh+bHSlrFSIsNq2LrWyEIdTZJtNibYJOyOqw6pVjA2+Ih6e5zoi
         9m/4Vm4n6bzWtoBa3BY9M/nNAE/CwS9LZEInrNl+v5DhVzE2zGPjNNTEJ7MyQ5TOaIIE
         voTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PvLTXVhFf+9UO9yJz50JTAIFh9uNCAolWXsnSIodUYI=;
        b=c+UJ5yxYhNaatfhLGTwluhVzIGHQZluodZgnA3+YKVtT/+JIu+NhdCvy+yqzrNDoSF
         fIol3RiY2vGgkbUO64VmDOvaEP5+cauv+YdJTQc/U8+iFinqe6grxCEGUjJhsUOXr8Ku
         aFTl4h13KzXEs/h1kzy2Tlh98FStDAwcXyo1gNeO+XO/mhaj/12Z1oOvkSerkKaEvU1K
         oJ3iYRzlgj6kIvPMEWjgIUKbIDU2uxIcY/h063tzlORvmAJBLnjgekiyMLYmTSJnRuIj
         LXIQ31dc4QK6vwiDHG7iFAr0iJL1f5QS+ueqaXqY11ezD35AQ1Tr5m8Kt1UqCvbdY4Vo
         e2Ew==
X-Gm-Message-State: AO0yUKVUPx8K6pbqGDc5afrG5iklxt5wwt+H28FrQdzfNrPgi8dXQjft
        YfQtOJCatkV65NhXsPJMhOmVHDW6C9s+AYtk
X-Google-Smtp-Source: AK7set9tbOG1JDa7ON96GIX0/P9bCWVAB5FYV2Dl3q9zTf2BKn/G3+lDGlHuV1sEnIwqqksw55SqdQ==
X-Received: by 2002:ac2:5298:0:b0:4da:9b7d:637e with SMTP id q24-20020ac25298000000b004da9b7d637emr2890097lfm.42.1677076850982;
        Wed, 22 Feb 2023 06:40:50 -0800 (PST)
Received: from [192.168.1.101] (abxi151.neoplus.adsl.tpnet.pl. [83.9.2.151])
        by smtp.gmail.com with ESMTPSA id 8-20020ac24848000000b004db250355b3sm479255lfy.138.2023.02.22.06.40.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Feb 2023 06:40:50 -0800 (PST)
Message-ID: <f1d78b2a-f9ae-6a46-4db6-25e0b823ac46@linaro.org>
Date:   Wed, 22 Feb 2023 15:40:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] soundwire: qcom: correct setting ignore bit on v1.5.1
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Sanyog Kale <sanyog.r.kale@intel.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        linux-kernel@vger.kernel.org
Cc:     stable@vger.kernel.org
References: <20230222140343.188691-1-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230222140343.188691-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 22.02.2023 15:03, Krzysztof Kozlowski wrote:
> According to the comment and to downstream sources, the
> SWRM_CONTINUE_EXEC_ON_CMD_IGNORE in SWRM_CMD_FIFO_CFG_ADDR register
> should be set for v1.5.1 and newer, so fix the >= operator.
> 
> Fixes: 542d3491cdd7 ("soundwire: qcom: set continue execution flag for ignored commands")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/soundwire/qcom.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index d5b73b7f98bf..29035cf15407 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -733,7 +733,7 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
>  	}
>  
>  	/* Configure number of retries of a read/write cmd */
> -	if (ctrl->version > 0x01050001) {
> +	if (ctrl->version >= 0x01050001) {
>  		/* Only for versions >= 1.5.1 */
>  		ctrl->reg_write(ctrl, SWRM_CMD_FIFO_CFG_ADDR,
>  				SWRM_RD_WR_CMD_RETRIES |
