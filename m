Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF4C874A7BC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jul 2023 01:32:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229506AbjGFXcK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Jul 2023 19:32:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbjGFXcJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Jul 2023 19:32:09 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A1CDDC
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jul 2023 16:32:08 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2b698937f85so20418531fa.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jul 2023 16:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688686326; x=1691278326;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uLEn00WjY5SCU/C4roxqJOMF3uwUL1rC1B9xNegkLOU=;
        b=bCpGonx5BTbCepDpBDMncKNP/fcIxYSNNaRqCSgg/F3dEj0cPngjuPwuSIk8AjPbBQ
         vJ/KH8WmIY02VIxdNsObaZO8E/ecy7UvpIfuCt2tRLWCgIhAJrGOgCcEQbMDzTt8IIJ5
         mpeZ4S6QtrnL6NLC1icpJQVduoOyR9c0iTls/GC+BHwKS1pmlw/uYNysSTHJ5VhAhAQv
         St9KrVX+krik1BbRFd1R388ZnLiSDHP9FzKgE8hHMVidQ+BMUq0HDs8+S5P6hnSBop4C
         SCKhKOdg7T66ZnnO6OH6Mx5etCqpTOcPDqvC4Fu59feCVt4QkibP/VP77S79olJMpxEq
         df0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688686326; x=1691278326;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uLEn00WjY5SCU/C4roxqJOMF3uwUL1rC1B9xNegkLOU=;
        b=A+IvK/pZ3BBFob8xSobUstBq1R/Oyx/6LmH5e4hEbLaRihVEUTKGY7uGfD2p9Xtikx
         JzILfkCjZMCuItIVUhoj5P8qr7UbOD+wNNsi4z+SrHcV1ZpJQvaK8vrF+VQyaTv/64jC
         65LMXjsrz4hvujBhmOvUi+NFwdbSzl/BaxDjDZnuGT5sZpMkziny/lYyYL4QMaEZPNye
         buPojUlk2spw8c4fuX7aw2r/pjWkP0h5s+HB9RMkdohO4fThx1Lo+25glzhqmuDulb8B
         otXPrH7lsTG/CcbOIRGDZP689GzipCOtJbBACUi+zAr9Lfv8qrxCE53b4G4vFpZE37ai
         HFaQ==
X-Gm-Message-State: ABy/qLYrRmGwiiXkLLNeyY1TEzcd0oCGD1fQ6b0bcrksIOlL/eib19RJ
        bNzaLFb6pUzx6RL8ArA5OJRj5A==
X-Google-Smtp-Source: APBJJlGUGUf8XRPOOiTI7USN+4Y91eh0YruUHFRMK1sxztIL/clbcXUX/TqDswycYXLDX9uM6MORUg==
X-Received: by 2002:a2e:98c7:0:b0:2b6:9909:79cb with SMTP id s7-20020a2e98c7000000b002b6990979cbmr2665488ljj.42.1688686326343;
        Thu, 06 Jul 2023 16:32:06 -0700 (PDT)
Received: from [192.168.1.101] (abyj26.neoplus.adsl.tpnet.pl. [83.9.29.26])
        by smtp.gmail.com with ESMTPSA id d3-20020a2eb043000000b002b6da1b49c6sm520279ljl.52.2023.07.06.16.32.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jul 2023 16:32:06 -0700 (PDT)
Message-ID: <dcb7f183-be73-2239-1051-47b0cd431602@linaro.org>
Date:   Fri, 7 Jul 2023 01:32:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 08/12] drm/msm/adreno: Bring the a630 family together
Content-Language: en-US
To:     Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>
References: <20230706211045.204925-1-robdclark@gmail.com>
 <20230706211045.204925-9-robdclark@gmail.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230706211045.204925-9-robdclark@gmail.com>
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
> All of these are derivatives of a630.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c   | 2 +-
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h | 7 ++++---
>  2 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 5deb79924897..f1bb20574018 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -1617,7 +1617,7 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
>  			SZ_256K - SZ_16K, 0x44000, "dcache");
>  		if (ret)
>  			goto err_memory;
> -	} else if (adreno_is_a630(adreno_gpu) || adreno_is_a615_family(adreno_gpu)) {
> +	} else if (adreno_is_a630_family(adreno_gpu)) {
>  		/* HFI v1, has sptprac */
>  		gmu->legacy = true;
>  
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> index 994ac26ce731..6066cfaaea52 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -335,10 +335,11 @@ static inline int adreno_is_a690(const struct adreno_gpu *gpu)
>  	/* The order of args is important here to handle ANY_ID correctly */
>  	return adreno_cmp_rev(ADRENO_REV(6, 9, 0, ANY_ID), gpu->rev);
>  };
> -/* check for a615, a616, a618, a619 or any derivatives */
> -static inline int adreno_is_a615_family(const struct adreno_gpu *gpu)
> +/* check for a615, a616, a618, a619 or any a630 derivatives */
> +static inline int adreno_is_a630_family(const struct adreno_gpu *gpu)
>  {
> -	return adreno_is_revn(gpu, 615) ||
> +	return adreno_is_revn(gpu, 630) ||
> +		adreno_is_revn(gpu, 615) ||
>  		adreno_is_revn(gpu, 616) ||
>  		adreno_is_revn(gpu, 618) ||
>  		adreno_is_revn(gpu, 619);
