Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E875378EA3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 May 2021 15:51:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233622AbhEJNa7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 May 2021 09:30:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349663AbhEJMtv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 May 2021 08:49:51 -0400
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com [IPv6:2607:f8b0:4864:20::f36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 279C7C06138B
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 May 2021 05:44:50 -0700 (PDT)
Received: by mail-qv1-xf36.google.com with SMTP id dl3so8195575qvb.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 May 2021 05:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=yJZh56rU3bYx3u0hyhnSmYJm+7oluLwY5PsDMkWTwj8=;
        b=dTD7X4qIOIW3q0wnQpu5kBaqCx0W1aLhKu9OI27JNbz8W1AMe4smiu22nLshqX1a2q
         EvM7yVOK23HKGKjBtvtWPVqL6hxaL0QS6mCGIHLZJRswSm0uvAblgBxyOgyfxFuwHd3D
         qnV8CwF1/83ZO3dFpVMs5U3yrI8vnUHr8PTCg5sLMSZi94FWRf9/Cbr1g8czyrzcxSRv
         jPy6LPAAIjyOrPoZLPNNFeRykjHnojG/wE9qI8VMjZ/HPgG878lXlz86OENfDVUDnF+a
         rxqkhDZoyASdeH/GJ1al729dx4GbqRZ5KceBI/35iTepDgoUrTxhsLl0J5aW9GigPCa4
         vmYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=yJZh56rU3bYx3u0hyhnSmYJm+7oluLwY5PsDMkWTwj8=;
        b=cYMOkAc5VWI+8XSB1GLtaaspqJUXaMc50RM5B4F9tGftJyI0onDHvIsmbkuG+XEk65
         MVsHgVU9/oQQvg9cB5FIV5TlIzvhVO972/u+RTCYGGOTU5U0prxywnAlZLsEuPuNwRzu
         x1oHoNtuMjFyGptBJ7Y19ep0XmyRkOk4/ap7bKGzeiVNRqd/RZXQpSpVRtRUM/285G95
         zu8f4g+Pn5NCZ64BJiGsMMyqJ//7e6fl4JpeY57Um+h7SVKgR2g5V0FJ3D7Q4S5g3Qow
         zsxTu1vKCBVbKJMUL4XWb3Dtl4FyKO9RdhBfNBUtDnD9bF4uCVADEyTzKRnxl61sukzc
         iKlQ==
X-Gm-Message-State: AOAM531hA1M+EUB1fWVx44uCrqVEG2mGm2UpZQnbx2V4W12V9EqllVoT
        isPZaxpaWSEr5BzGpnFD7F48Ww==
X-Google-Smtp-Source: ABdhPJzJFl6qzX5SQHXoL2AsR/59ShHpx0CUAhmEN4kCRmLiFglIN+kwZNnN3Ku1cuR/w5/yol5byw==
X-Received: by 2002:a0c:f808:: with SMTP id r8mr9686322qvn.18.1620650689313;
        Mon, 10 May 2021 05:44:49 -0700 (PDT)
Received: from [192.168.1.93] (pool-71-163-245-5.washdc.fios.verizon.net. [71.163.245.5])
        by smtp.gmail.com with ESMTPSA id l16sm11425151qkg.91.2021.05.10.05.44.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 May 2021 05:44:48 -0700 (PDT)
Subject: Re: [thermal-next PATCH v2 2/2] thermal: qcom: tsens: simplify
 debugfs init function
To:     Ansuel Smith <ansuelsmth@gmail.com>
Cc:     Amit Kucheria <amitk@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210429010518.13319-1-ansuelsmth@gmail.com>
 <20210429010518.13319-3-ansuelsmth@gmail.com>
From:   Thara Gopinath <thara.gopinath@linaro.org>
Message-ID: <6fe0749e-e0e1-6094-e000-7b12f6c7b71d@linaro.org>
Date:   Mon, 10 May 2021 08:44:46 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210429010518.13319-3-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 4/28/21 9:05 PM, Ansuel Smith wrote:
> Simplify debugfs init function.
> - Add check for existing dev directory.
> - Fix wrong version in dbg_version_show (with version 0.0.0, 0.1.0 was
>    incorrectly reported)
> 
> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>

Acked-by: Thara Gopinath <thara.gopinath@linaro.org>

Warm Regards
Thara

> ---
>   drivers/thermal/qcom/tsens.c | 12 ++++--------
>   1 file changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/thermal/qcom/tsens.c b/drivers/thermal/qcom/tsens.c
> index b37d5fd71f3a..e43898bf3199 100644
> --- a/drivers/thermal/qcom/tsens.c
> +++ b/drivers/thermal/qcom/tsens.c
> @@ -657,7 +657,7 @@ static int dbg_version_show(struct seq_file *s, void *data)
>   			return ret;
>   		seq_printf(s, "%d.%d.%d\n", maj_ver, min_ver, step_ver);
>   	} else {
> -		seq_puts(s, "0.1.0\n");
> +		seq_printf(s, "0.%d.0\n", priv->feat->ver_major);
>   	}
>   
>   	return 0;
> @@ -669,16 +669,12 @@ DEFINE_SHOW_ATTRIBUTE(dbg_sensors);
>   static void tsens_debug_init(struct platform_device *pdev)
>   {
>   	struct tsens_priv *priv = platform_get_drvdata(pdev);
> -	struct dentry *root, *file;
>   
> -	root = debugfs_lookup("tsens", NULL);
> -	if (!root)
> +	priv->debug_root = debugfs_lookup("tsens", NULL);
> +	if (!priv->debug_root)
>   		priv->debug_root = debugfs_create_dir("tsens", NULL);
> -	else
> -		priv->debug_root = root;
>   
> -	file = debugfs_lookup("version", priv->debug_root);
> -	if (!file)
> +	if (!debugfs_lookup("version", priv->debug_root))
>   		debugfs_create_file("version", 0444, priv->debug_root,
>   				    pdev, &dbg_version_fops);
>   
>
