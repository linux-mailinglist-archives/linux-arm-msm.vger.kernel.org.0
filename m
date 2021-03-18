Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8993340FA2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Mar 2021 22:16:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231983AbhCRVPj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Mar 2021 17:15:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233169AbhCRVPR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Mar 2021 17:15:17 -0400
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C279C06174A
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Mar 2021 14:15:17 -0700 (PDT)
Received: by mail-qk1-x731.google.com with SMTP id c3so765690qkc.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Mar 2021 14:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=mGThe2LI8f8/7shEyOWsV7O60TcZJdMynjNhDZeK4co=;
        b=XT3ULBNSVzzDDmbm810Cq05B/pWFzUkRk3LkGBBIgSo/pkx1TdIhEUr+oh64gBa1jk
         SCZyEIleJk5J69T/bbbuNcyuQidJ9OdkCe1T7kKee0NXPg0t+gb6I7Twh0ZLVFEwAL5H
         bLKg8SiLetF/AVcqCuRIZuNtWkrXBAOsoXUXGyYtbCin25bLN9x2ZYFywfFDpOBupi9/
         og2ZHfz3Mn2mfw+vOIJBul0+yegBQfRJkcdRvPxX7ihLuCyTPLREwuM15rPf8OYicUlY
         9b26rrIQsxKb/jmUJqD4rrTGo9dMOwmytTEQ0uc+ASW8WqZtIQKLeYAJIFpO53HrzSuW
         n5ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=mGThe2LI8f8/7shEyOWsV7O60TcZJdMynjNhDZeK4co=;
        b=oaPeO8ITB8ydvcd3uXUVO4akaC/Na7dAsLEbJ581g9cnTOlBMFotVnE4yP8l3+7Ure
         kTEhiObp7wZi5Y4gx+NR/q3wBkCVvnH7nTj442SOEk9FhNJu3LRdwXrp9tFYflWgiV7l
         3thi/Aq7t8kdv0ZCaIr6xOjfd0HnjF1PBagXo0R6K9xeiND7GpRz8HwL4qPiJqUlVn8x
         32a0FJAJNmKzIdZEEp8d8uVYABlWbk2FhgcIcCI0xuXJ1wclLSV5yZ+sY6Ae0Bd5da+M
         qiqS56x0ZrVhvfxq0nadxg9/ujmstpfqhI4iMvDW9UI4GW3AKmFhhp+u+1zZHc/nQxG8
         PA3A==
X-Gm-Message-State: AOAM532oH97/ScSgDrmFeoCopGrsOnXXdthwpV3PyKy9A0ndlT/BLe3n
        MCXaU+lizdQDpMuRJRdrntvbzw==
X-Google-Smtp-Source: ABdhPJwXlpbWvR22Qt2Ny+NO8u4ABpdOMDOVAgmQ0rlepShEE0Yp0tOmFW0x6My7UF39f68UZ/0ypw==
X-Received: by 2002:ae9:dcc4:: with SMTP id q187mr6408426qkf.5.1616102116454;
        Thu, 18 Mar 2021 14:15:16 -0700 (PDT)
Received: from [192.168.1.93] (pool-71-163-245-5.washdc.fios.verizon.net. [71.163.245.5])
        by smtp.gmail.com with ESMTPSA id k28sm2715746qki.101.2021.03.18.14.15.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Mar 2021 14:15:16 -0700 (PDT)
From:   Thara Gopinath <thara.gopinath@linaro.org>
Subject: Re: [PATCH v10 2/8] drivers: thermal: tsens: Don't hardcode sensor
 slope
To:     Ansuel Smith <ansuelsmth@gmail.com>,
        Amit Kucheria <amitk@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210217194011.22649-1-ansuelsmth@gmail.com>
 <20210217194011.22649-3-ansuelsmth@gmail.com>
Message-ID: <7e81650f-c058-c105-d465-f35dd890e563@linaro.org>
Date:   Thu, 18 Mar 2021 17:15:15 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210217194011.22649-3-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 2/17/21 2:40 PM, Ansuel Smith wrote:
> Function compute_intercept_slope hardcode the sensor slope to
> SLOPE_DEFAULT. Change this and use the default value only if a slope is
> not defined. This is needed for tsens VER_0 that has a hardcoded slope
> table.
> 
> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>

Reviewed-by: Thara Gopinath <thara.gopinath@linaro.org>

Warm Regards
Thara

> ---
>   drivers/thermal/qcom/tsens.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/thermal/qcom/tsens.c b/drivers/thermal/qcom/tsens.c
> index f9126909892b..842f518fdf84 100644
> --- a/drivers/thermal/qcom/tsens.c
> +++ b/drivers/thermal/qcom/tsens.c
> @@ -86,7 +86,8 @@ void compute_intercept_slope(struct tsens_priv *priv, u32 *p1,
>   			"%s: sensor%d - data_point1:%#x data_point2:%#x\n",
>   			__func__, i, p1[i], p2[i]);
>   
> -		priv->sensor[i].slope = SLOPE_DEFAULT;
> +		if (!priv->sensor[i].slope)
> +			priv->sensor[i].slope = SLOPE_DEFAULT;
>   		if (mode == TWO_PT_CALIB) {
>   			/*
>   			 * slope (m) = adc_code2 - adc_code1 (y2 - y1)/
> 

-- 
Warm Regards
Thara
