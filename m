Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0352B74A788
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jul 2023 01:23:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231833AbjGFXXB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Jul 2023 19:23:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229807AbjGFXXA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Jul 2023 19:23:00 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC4871BC9
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jul 2023 16:22:59 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4fafe87c6fbso1874861e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jul 2023 16:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688685778; x=1691277778;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pAuD422yaocz6mSARxaXOG2X28jLXqDNZRoVPwDpGMY=;
        b=TTeNoPbzsWFiyCSt7IL6eQva8/rL1Yo0KvsZzQpGjoMPaOs1RlTnpm2HN2ZZqgNxXM
         85pYvZCJEzLuBpuakEANQafLFxpO/CfVgZz1tnURFOMs7JlZMdjhyKWCWWUcZV3jPawm
         oXv2Do0SbLRWhKFh415PsL7MCnjnx+TbFMogWPbBKUEuJk1Wpn7gUiUDAtTc/0zrGVeE
         K82uvun29lPGibc6h2GqoB8vns6tP98rfCTpukk1xLfU/0pHZZ8DJnvPQnseqUA1PN+i
         WLmlbj9JWaVmNx9u9y+uqBIS0XphkpXDFw9Btsj5hK8tKsVh6oArkdO5C8sFk/lJW13b
         ungA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688685778; x=1691277778;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pAuD422yaocz6mSARxaXOG2X28jLXqDNZRoVPwDpGMY=;
        b=Bx/rBWYBrx/GErCcQkQDJuFLlvZJQNjB0GIEG0bQr7kWmrNCGQyubbrPnqAbRDTDQh
         Zk3jVczjHiUYIkocF0gPoZeWI6pNRolTNjV+TxxcncjXLITQP8FQOPaShL89/3JK+WrK
         odmBzqmpNwP1mDTS6+QHANS1BL2J/sXFeiKmHpa58qffSMO/maoBWJoZjciHbKIhlHsH
         K6ps1obJ9ggpWf9uULx4z3xi1+5dbLVCrzSpBdRs3o44p5aUL795vayvs+L03OMm05iT
         /EmZsKhYN2b0ZyCXkrfm96IH5COFoiTETBc6MHTX8VJEvdtJJ5LNBdXrRtMZ5NGvpDCo
         qSzQ==
X-Gm-Message-State: ABy/qLagdHK3tazkgFpAfEqWQJcDpBX7/g5NcI8/Pc9VTXSqzz92o/U9
        +U+4geI9U6Kd1VKNsWtRi4DbloUIdIjGUcTlO8wIqA==
X-Google-Smtp-Source: APBJJlHgRITQqgW3eggtfi7HM9//NWQO+t35mgaEAcrsW0HuzMOhHot7qRbzlhg7cZglYX3WYFkO9g==
X-Received: by 2002:a05:6512:252b:b0:4fb:8cc0:57e3 with SMTP id be43-20020a056512252b00b004fb8cc057e3mr2753017lfb.62.1688685778115;
        Thu, 06 Jul 2023 16:22:58 -0700 (PDT)
Received: from [192.168.1.101] (abyj26.neoplus.adsl.tpnet.pl. [83.9.29.26])
        by smtp.gmail.com with ESMTPSA id d2-20020ac244c2000000b004fbbd81856asm437654lfm.143.2023.07.06.16.22.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jul 2023 16:22:57 -0700 (PDT)
Message-ID: <97693b20-f374-db81-47b0-e77802dfe3a6@linaro.org>
Date:   Fri, 7 Jul 2023 01:22:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 02/12] drm/msm/adreno: Remove redundant gmem size param
Content-Language: en-US
To:     Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>
References: <20230706211045.204925-1-robdclark@gmail.com>
 <20230706211045.204925-3-robdclark@gmail.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230706211045.204925-3-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 6.07.2023 23:10, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Even in the ocmem case, the allocated ocmem buffer size should match the
> requested size.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
[...]

> +
> +	WARN_ON(ocmem_hdl->len != adreno_gpu->info->gmem);
I believe this should be an error condition. If the sizes are mismatched,
best case scenario you get suboptimal perf and worst case scenario your
system explodes.

Very nice cleanup though!

Konrad
>  
>  	return 0;
>  }
> @@ -1097,7 +1098,6 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>  
>  	adreno_gpu->funcs = funcs;
>  	adreno_gpu->info = adreno_info(config->rev);
> -	adreno_gpu->gmem = adreno_gpu->info->gmem;
>  	adreno_gpu->revn = adreno_gpu->info->revn;
>  	adreno_gpu->rev = *rev;
>  
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> index 6830c3776c2d..aaf09c642dc6 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -77,7 +77,6 @@ struct adreno_gpu {
>  	struct msm_gpu base;
>  	struct adreno_rev rev;
>  	const struct adreno_info *info;
> -	uint32_t gmem;  /* actual gmem size */
>  	uint32_t revn;  /* numeric revision name */
>  	uint16_t speedbin;
>  	const struct adreno_gpu_funcs *funcs;
