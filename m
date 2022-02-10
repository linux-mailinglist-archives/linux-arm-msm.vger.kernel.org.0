Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6AD664B0A6A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Feb 2022 11:18:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239550AbiBJKQz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Feb 2022 05:16:55 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:37330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239553AbiBJKQx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Feb 2022 05:16:53 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80829FFA
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Feb 2022 02:16:50 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id t14so7240690ljh.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Feb 2022 02:16:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=3ne9afkcEMUgeoGNnWkV++QClTAUsFhKUiDokSSK4gs=;
        b=cpwqd0ostl/K+0LDjp2O6emA6OJVYcuj390GkHObcgJdcYkRtqUketq5yz81ZW1ECl
         XNHUYvbLv6X9XrwkTOPMd0aj8dFeJivC7rqhA/EwEwFsHu/2/2VYqiP4gmU1vK1v5bgH
         0r1SH59cy3GO/YFDMyrJ90Z9jcifx/DZvIZ+Smo8syz3lY5yQByFDE+P5EK0qRWKKzVc
         6D17AWW2PEHr/FfcoztmL0216RO4PipqiK8X08Zedwbl90LI3Dkv5sTl0B5SJr2o9ONs
         JgS3JxvDgP0iqwaryvvqtf8raA7fGcBKOV9bXpANRbVytEfgzOPqqB4852ysoRhjbuN+
         NDkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=3ne9afkcEMUgeoGNnWkV++QClTAUsFhKUiDokSSK4gs=;
        b=Mr6DzceO4/yLNyOdo0oKxYuHhqoVRgr1mCWr8FwQy8oJJOOVjPLacZ1TGL/m6bvw0d
         BXyqiELttrs/w00PEnqv+qdgHw7X6nsxYcrG/TVBefZZ/o5zFZnni3w4WF95fM4R2fuu
         TWzFCS9r0P4w1mC8FeVDTb2dLVGLKZxPYV3W0m8LekEc+miIQYeVyVaI9Gdsv2ifwLLq
         tFtEtsEDisyC6cr82XriWME7LitwcWSE9eHCzfzxt0xslnLRlH6eIN27Fe+F30gpz60Q
         XtSvBBQyokVjnMIKdF2vTmoq38JRkwhWl+RjLoUGIbGwPUwTyA+gzq6UHjDJTWRm5k42
         3PqQ==
X-Gm-Message-State: AOAM532ZknF2rZrP3psNmP2fe8YwubLEMbUn5ajOv4Fyv8XGAKcelsW8
        xWIn4QDiS+y23FajiwOHj1jSBw==
X-Google-Smtp-Source: ABdhPJxjobzeo5yzVqpZ1edrDcbPHOwnY2/Az6fBOhCPktWcPtktCsDi7eYsUWXornR+W6Dt96frYg==
X-Received: by 2002:a05:651c:1413:: with SMTP id u19mr4516534lje.240.1644488208827;
        Thu, 10 Feb 2022 02:16:48 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id a6sm2841646ljb.93.2022.02.10.02.16.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Feb 2022 02:16:48 -0800 (PST)
Message-ID: <19b96972-cee7-937f-21ce-c78982ed2048@linaro.org>
Date:   Thu, 10 Feb 2022 13:16:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH] media: qcom: use div64_u64() instead of do_div()
Content-Language: en-GB
To:     Qing Wang <wangqing@vivo.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1644395913-4091-1-git-send-email-wangqing@vivo.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1644395913-4091-1-git-send-email-wangqing@vivo.com>
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

On 09/02/2022 11:38, Qing Wang wrote:
> From: Wang Qing <wangqing@vivo.com>
> 
> do_div() does a 64-by-32 division.
> When the divisor is u64, do_div() truncates it to 32 bits, this means it
> can test non-zero and be truncated to zero for division.
> 
> fix do_div.cocci warning:
> do_div() does a 64-by-32 division, please consider using div64_u64 instead.


NAK

The div64_u64 is not equivalent to do_div. It returns the quotient
rather than modifying the first arg. Moreover it is unoptimal on 32-bit
arches.

> 
> Signed-off-by: Wang Qing <wangqing@vivo.com>
> ---
>   drivers/media/platform/qcom/venus/vdec.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
> index 91da3f5..941a904
> --- a/drivers/media/platform/qcom/venus/vdec.c
> +++ b/drivers/media/platform/qcom/venus/vdec.c
> @@ -435,7 +435,7 @@ static int vdec_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
>   		return -EINVAL;
>   
>   	fps = (u64)USEC_PER_SEC;
> -	do_div(fps, us_per_frame);
> +	div64_u64(fps, us_per_frame);
>   
>   	inst->fps = fps;
>   	inst->timeperframe = *timeperframe;


-- 
With best wishes
Dmitry
