Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E471741917
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jun 2023 21:54:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231491AbjF1Ty2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Jun 2023 15:54:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230451AbjF1TyY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Jun 2023 15:54:24 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC1FD1FDC
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jun 2023 12:54:22 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-3fb10fd9ae9so3419175e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jun 2023 12:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687982061; x=1690574061;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n/1WCRqInbEQkf2duMLeRlZtPpMeZ3I2eJEdWnZJEsE=;
        b=wiPuQnqHresP/hP0AhH1LIlgDRlJXchiEYdcoJEDzHt+UEmeFgraxKndgHVw2OY4aR
         4HUeN7Jck9SA3LDs7HeM7rY382ov4iowO5DNF9tkJk8C0LAfThHl2opwboerfshAvRcy
         iTVg/XJEfYET1X0VT8BFLN73IoV0I0h9W4VNlxOEApz0pU9MYDaS+dXuWtGLPG2YkKtA
         cQWE+2GWR4RbF7YmvjlnJ6+yd9RzhRVt+buHpFXgq8o78DUxox9bdD3kPJPvRDScCYrf
         pjoi1g3TTAJlC8Q9ufWLwix5Vek1E+ehCKgCB/y/cXspQICa+BVJAxHFblMY3rh8nBch
         c3hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687982061; x=1690574061;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n/1WCRqInbEQkf2duMLeRlZtPpMeZ3I2eJEdWnZJEsE=;
        b=loXwEEcVlxfG0BXGoX9B8PDUFWcmV6/FFXu1gJxeg7vRM3q+0EvnhXIDDHrNgA1s6s
         TnXo8yb+lreULrXpjKMmtW8/+CWf0WFPKvfmxF4rRA975Zf7TKhkNdoCXuBbKaj8kxXS
         QzV0L39U7KjtefF+Jq4TdS/IKca8kadm9phBWYAPMARZhksL3cWzCYnzR7uzGqpZAh4/
         EPSjIdxmIfRxVuPUfg6lvIuaplyO88xe2OcUbsySOhXimqIIGOO0y0e5xZ5JTIknQYq6
         DTAGeXvR18lIlV8CSD44tOHe9OG/fKVMyWwHmJc91sKqyV7iHEiiUdK2zqE5uDTLZQhF
         QPOg==
X-Gm-Message-State: AC+VfDxFzH13MRCbnLiODt0X1NGJL9DEnlCTiAr0xwC8aao/ni5WrbcS
        cZs1mDAqgyQzrrP/+t00snMxRA==
X-Google-Smtp-Source: ACHHUZ4W+0A/p+ZwDwpOl46I6quIlwSWSeRsQ9uhmc+nS4yPI9mGFeGKCLwc1djZ2BtqVpoSvJ2zRQ==
X-Received: by 2002:a05:600c:2041:b0:3fa:7808:3e16 with SMTP id p1-20020a05600c204100b003fa78083e16mr12935716wmg.29.1687982061246;
        Wed, 28 Jun 2023 12:54:21 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id x9-20020a05600c21c900b003fb41491670sm7241386wmj.24.2023.06.28.12.54.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jun 2023 12:54:20 -0700 (PDT)
Message-ID: <ef074384-1eee-ec88-b02f-c4ada72037a4@linaro.org>
Date:   Wed, 28 Jun 2023 22:54:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/msm/adreno: Assign revn to A635
Content-Language: en-GB
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20230628-topic-a635-v1-1-5056e09c08fb@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230628-topic-a635-v1-1-5056e09c08fb@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 28/06/2023 22:05, Konrad Dybcio wrote:
> Recently, a WARN_ON() was introduced to ensure that revn is filled before
> adreno_is_aXYZ is called. This however doesn't work very well when revn is
> 0 by design (such as for A635). Fill it in as a stopgap solution for
> -fixes.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

I'd have probably added:

Fixes: cc943f43ece7 ("drm/msm/adreno: warn if chip revn is verified 
before being set")

or

Fixes: 192f4ee3e408 ("drm/msm/a6xx: Add support for Adreno 7c Gen 3 gpu")


> ---
>   drivers/gpu/drm/msm/adreno/adreno_device.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> index cb94cfd137a8..8ea7eae9fc52 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> @@ -345,6 +345,7 @@ static const struct adreno_info gpulist[] = {
>   		.address_space_size = SZ_16G,
>   	}, {
>   		.rev = ADRENO_REV(6, 3, 5, ANY_ID),
> +		.revn = 635,
>   		.fw = {
>   			[ADRENO_FW_SQE] = "a660_sqe.fw",
>   			[ADRENO_FW_GMU] = "a660_gmu.bin",
> 
> ---
> base-commit: 5c875096d59010cee4e00da1f9c7bdb07a025dc2
> change-id: 20230628-topic-a635-1b3c2c987417
> 
> Best regards,

-- 
With best wishes
Dmitry

