Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3971F37F25
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2019 22:57:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727504AbfFFU5U (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Jun 2019 16:57:20 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:36017 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727023AbfFFU5U (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Jun 2019 16:57:20 -0400
Received: by mail-wr1-f68.google.com with SMTP id n4so32566wrs.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jun 2019 13:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=yc3mIWAOmzHLsJR8ETFapoAFaIyvxuHseTv4ycdMJAA=;
        b=HfDVpn9rD1xoy6TiwTnp55C660rqvMS7UbuxsqaxbKuxOVCCCyXf/NFuK0R6wNw5e1
         iT3FG4KKohgCds+EzsVs/xOqcJyfiSv8LJyESbdXog9CfwvnSHw0iIr0OivkDwgcSLLe
         VwaiURO5zaRUphb3Ux5P5ACJDJmGKk8GXEm29+xKm+ez9IMjXq1gtadxcb7GmbZ+gFaV
         57nEgBaUd2Blq/aAreHgJzRoUPDudyyrqeClz3UeC2IV8KO9moXT17A51wgrOCxH0vMF
         hXFMwWz6+B+qJpI4kFc0lI2XJW3WqYS4rzlLoJvoS3KJU0Voy9EmP4uk5NsdfT+58Ju6
         rwwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=yc3mIWAOmzHLsJR8ETFapoAFaIyvxuHseTv4ycdMJAA=;
        b=ie6maVvPQCyrl/ls3dFpg45HXW/pfXtEO1HNduhk0X1UA8fJ9SUhlRKavbjCKZZi4a
         Gr5ThLvuhriBCjwAp2BU7EpcTIyPd+C1dNvM24tsfy9Z7+0yIEsJ+zYdURY1C18VI/Ad
         Rt+gLtF6a/hhtcvP7JcJskharRSZ/L1P7x7/KAxRdkfjXudrrT+xLuHeoQGihhVONVrn
         D9pCbhGAcG3mTGbpIBKYwPH2WPjtIzIWTjkExu5hjT7lG1PaPznR5rkeURpCAEZFRke4
         bYg7oFGDFL6yOCSkZvHsovfbewgFuZR/U4XZb9majHBHH+4Tq2W+4zGraCeU8yYhdzuX
         SAVQ==
X-Gm-Message-State: APjAAAUKJqPLe5eTuuBPyeS1agcEZAyMuxHjapjlNgoVy9+2y7e0J5g7
        G5Yd7+5Ug6POFlTbZ8oJuG0EMA==
X-Google-Smtp-Source: APXvYqwXj2etJ/M3sp849BOhuQAtV/gHqw0dA6C4Q5N+pFvKjsOwzoiYWXPOc4OBixtAveLznLnCSQ==
X-Received: by 2002:a5d:4e46:: with SMTP id r6mr15283767wrt.290.1559854638401;
        Thu, 06 Jun 2019 13:57:18 -0700 (PDT)
Received: from ?IPv6:2a02:587:1936:1900:9d54:196a:5d8d:4379? ([2a02:587:1936:1900:9d54:196a:5d8d:4379])
        by smtp.googlemail.com with ESMTPSA id x11sm45119wmg.23.2019.06.06.13.57.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Jun 2019 13:57:17 -0700 (PDT)
Subject: Re: [PATCH] Revert "media: hfi_parser: don't trick gcc with a wrong
 expected size"
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "open list:QUALCOMM VENUS VIDEO ACCELERATOR DRIVER" 
        <linux-media@vger.kernel.org>,
        "open list:QUALCOMM VENUS VIDEO ACCELERATOR DRIVER" 
        <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20190605201941.4150-1-jonathan@marek.ca>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <59d458b5-8c29-1c66-ea39-b678889e25cc@linaro.org>
Date:   Thu, 6 Jun 2019 23:57:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190605201941.4150-1-jonathan@marek.ca>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Jonathan,

I sent a fix for that here [1] and Mauro already taken it.

regards,
Stan

[1] https://patchwork.kernel.org/patch/10963369/

On 5.06.19 г. 23:19 ч., Jonathan Marek wrote:
> This reverts commit ded716267196862809e5926072adc962a611a1e3.
> 
> This change doesn't make any sense and breaks the driver.
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>   drivers/media/platform/qcom/venus/hfi_helper.h | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/hfi_helper.h b/drivers/media/platform/qcom/venus/hfi_helper.h
> index 34ea503a9842..15804ad7e65d 100644
> --- a/drivers/media/platform/qcom/venus/hfi_helper.h
> +++ b/drivers/media/platform/qcom/venus/hfi_helper.h
> @@ -569,7 +569,7 @@ struct hfi_capability {
>   
>   struct hfi_capabilities {
>   	u32 num_capabilities;
> -	struct hfi_capability *data;
> +	struct hfi_capability data[1];
>   };
>   
>   #define HFI_DEBUG_MSG_LOW	0x01
> @@ -726,7 +726,7 @@ struct hfi_profile_level {
>   
>   struct hfi_profile_level_supported {
>   	u32 profile_count;
> -	struct hfi_profile_level *profile_level;
> +	struct hfi_profile_level profile_level[1];
>   };
>   
>   struct hfi_quality_vs_speed {
> 
