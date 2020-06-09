Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06E3F1F36DE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2020 11:18:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726923AbgFIJSg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Jun 2020 05:18:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728454AbgFIJSe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Jun 2020 05:18:34 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9378C03E97C
        for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2020 02:18:33 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id c3so20396456wru.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2020 02:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=6Lmml4M7Z4ziTfNEmNEtKQKmy1BckR3tOh87Yi/zhEI=;
        b=xxllwIBFPa9hy5DLrW6cRSoDJI0zz+5+HQdj5tH70yCDS4JGPOjiCzCG6cM0MiYQPj
         EfN+FWLXPHOhUhSVOJapOg05fq93VbU4BX4NmShGrkt1vdWGQLaUqxaxUkNSmfMcrr/R
         UIcV6z++/l1r1r9i5WD8Y4LH1Xkb/b5mrdmyQJYPWnsHXgyTXYcpEMZqtgTtoAkqTRcq
         uMZ2c6JH8Ayy6em7FDrIY5UikVpiGgFfvK/PmsJPxhv8cTwSt0xTcjYncQXEl295c0aw
         j0dzuvh0i+jvSatnu6RkKNPgKeMMYyectdUBldh8SwODrFVWkbJM50vg1JCeBjZsa99s
         DWEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6Lmml4M7Z4ziTfNEmNEtKQKmy1BckR3tOh87Yi/zhEI=;
        b=cenC5FOvLPavcm+vPtJ4hQqYGvzt/qBT/xXDumfzW1sIHFT5tGii/F9xjlU43FjaGS
         N0TRGHvAnKAv7RgnxyJ3Qhc7FC9IsBPEQlAewBWZXHjZxZTYaSpT6Pl0m8i84YnMIzGu
         PJUHPDCpFCUDMPRPU4XIfehMpoYUacvPvQtctGknrNt4Lh1GQ+I+xvPe3VojiM5ov+DW
         wPDdi1CIhBr8n0gmTkVqAm8EVYoP2H5e4HuP9PcRQgZA4WfhEVt49h996ZQD+B1MfvvU
         SWp4PjzMowhOOUI5DeE7mLyPg9b+ccAfUbdXtacP3kVvVC7i6xMBONDYfkRau6fmSlDm
         IteQ==
X-Gm-Message-State: AOAM531dK/U/BuyiiPnyTAOZS+6I3AyCYP/q9BFeX3H+2oTvylN8IpLh
        v5n+HkLdqDQsigIcvHo10COyYQ==
X-Google-Smtp-Source: ABdhPJxCzTpJcd7FYZjv+tgHBCwJsyM/1n0vfBmpn5hNpRsPMUzZfa8W58KoFUQGFjFAjaNdUdircA==
X-Received: by 2002:a5d:6085:: with SMTP id w5mr3302320wrt.322.1591694311979;
        Tue, 09 Jun 2020 02:18:31 -0700 (PDT)
Received: from [192.168.86.34] (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.googlemail.com with ESMTPSA id z25sm2238686wmf.10.2020.06.09.02.18.30
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Jun 2020 02:18:31 -0700 (PDT)
Subject: Re: [PATCH 1/5] soundwire: qcom: fix abh/ahb typo
To:     Jonathan Marek <jonathan@marek.ca>, alsa-devel@alsa-project.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Sanyog Kale <sanyog.r.kale@intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20200608204347.19685-1-jonathan@marek.ca>
 <20200608204347.19685-2-jonathan@marek.ca>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <d5dfb83d-eed1-ed09-e305-781cf5a84afb@linaro.org>
Date:   Tue, 9 Jun 2020 10:18:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200608204347.19685-2-jonathan@marek.ca>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 08/06/2020 21:43, Jonathan Marek wrote:
> The function name qcom_swrm_abh_reg_read should say ahb, fix that.
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

>   drivers/soundwire/qcom.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index a1c2a44a3b4d..f38d1fd3679f 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -114,7 +114,7 @@ struct qcom_swrm_ctrl {
>   
>   #define to_qcom_sdw(b)	container_of(b, struct qcom_swrm_ctrl, bus)
>   
> -static int qcom_swrm_abh_reg_read(struct qcom_swrm_ctrl *ctrl, int reg,
> +static int qcom_swrm_ahb_reg_read(struct qcom_swrm_ctrl *ctrl, int reg,
>   				  u32 *val)
>   {
>   	struct regmap *wcd_regmap = ctrl->regmap;
> @@ -754,7 +754,7 @@ static int qcom_swrm_probe(struct platform_device *pdev)
>   		return -ENOMEM;
>   
>   	if (dev->parent->bus == &slimbus_bus) {
> -		ctrl->reg_read = qcom_swrm_abh_reg_read;
> +		ctrl->reg_read = qcom_swrm_ahb_reg_read;
>   		ctrl->reg_write = qcom_swrm_ahb_reg_write;
>   		ctrl->regmap = dev_get_regmap(dev->parent, NULL);
>   		if (!ctrl->regmap)
> 
