Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A08054B0B09
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Feb 2022 11:39:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238091AbiBJKjs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Feb 2022 05:39:48 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:51696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239902AbiBJKjr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Feb 2022 05:39:47 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D49FFEB
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Feb 2022 02:39:48 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id k18so7270412lji.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Feb 2022 02:39:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=uV6ErWvRHqjgOJVJNqpy2N27QhZ/SkH6lhneV2eezQE=;
        b=nKbcz2Gdq39piyfbPiMit7TrOu1sDICMWcR+0EmABFsSkx77n2YjUmhr9Oadftelnl
         nzyFf1sLKC1AWxptKuKsXPV9p1RmG+D6jQyD31hPB1kGkeMvwGndSrj/dfuJGfmhzuDY
         x7S9su9VVRlprEq876OXVw4utyS2H0wqlon8AG1vz+iAvf48UQJTXuAFcdGIJBA5on0Z
         DIGzgHX/3Kl+0fAUOe+dqph4GRG5mxn4T/P0Wca67iJEh4fWjf/jZ7MKOc/6LKZqW2UX
         NSqzOhzbWmjRiq5SG4CHSX1xrfFFVHM8mAgo+Tqxdx4SNMrAzC6Yv6jiXtWS1NgpyGsp
         OlAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=uV6ErWvRHqjgOJVJNqpy2N27QhZ/SkH6lhneV2eezQE=;
        b=5G0Lx8ITYTGCgJyLRuvX2jDfzfT3OzD4lZRuKR/C3kxX1hxv7JmDKg+0IJHumg3gD9
         aKyePfzQwhpTyuMe6utzUENae2+4/JmCBxro3NtMq3fLPNnxFIr8uH/Lj9EEiRdJAIIM
         XKbGuChBQDpGfT+L+KcBK4/ZbwYVn/UeqNJ9IBxDE/rInR6LLEGss/6OE9WQL/g/7NTM
         NxE3yFNKoESbDeFptx/8lOF9pORQ0Dj16CXrzheVg43xByNapOpPUvb2tLfUkAshNybH
         XDK59vYfGIXLl1FkqC7sTk68XY9Ih7DrE1uUPNczChyHgGS3O0CSbxzFQXDL52nCYbtq
         rktw==
X-Gm-Message-State: AOAM533z8VxAM3oz9ni4ict+DwZfoHpd+EwvmBJH7H8aiueyaQjxyACi
        RfPrzBedS9EmA/WrMugb00oAWQ==
X-Google-Smtp-Source: ABdhPJzWQaQGUC9tOFhfWQgRhHoC89SI5cdC7nImJz2CXY8dRllDB4UDR090ZDdk+eOaZKSH3cgx9g==
X-Received: by 2002:a05:651c:54a:: with SMTP id q10mr4541444ljp.441.1644489586976;
        Thu, 10 Feb 2022 02:39:46 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id z22sm2754597lji.63.2022.02.10.02.39.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Feb 2022 02:39:46 -0800 (PST)
Message-ID: <88925781-ccca-b180-4d68-dbc689bd5184@linaro.org>
Date:   Thu, 10 Feb 2022 13:39:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [REPOST PATCH v4 09/13] drm/msm: Add missing structure
 documentation
Content-Language: en-GB
To:     Vinod Koul <vkoul@kernel.org>, Rob Clark <robdclark@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20220210103423.271016-1-vkoul@kernel.org>
 <20220210103423.271016-10-vkoul@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220210103423.271016-10-vkoul@kernel.org>
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

On 10/02/2022 13:34, Vinod Koul wrote:
> Somehow documentation for dspp was missed, so add that
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/msm_drv.h | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index e7a312edfe67..6425a42e997c 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -102,6 +102,7 @@ enum msm_event_wait {
>    * @num_lm:       number of layer mixers used
>    * @num_enc:      number of compression encoder blocks used
>    * @num_intf:     number of interfaces the panel is mounted on
> + * @num_dspp:     number of dspp blocks used
>    */
>   struct msm_display_topology {
>   	u32 num_lm;


-- 
With best wishes
Dmitry
