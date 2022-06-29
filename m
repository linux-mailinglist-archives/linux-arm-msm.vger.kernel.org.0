Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0474255F546
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jun 2022 06:30:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229868AbiF2E35 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Jun 2022 00:29:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229623AbiF2E34 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Jun 2022 00:29:56 -0400
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 919D22A25B
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jun 2022 21:29:53 -0700 (PDT)
Received: by mail-oi1-x235.google.com with SMTP id h65so20029356oia.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jun 2022 21:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=LsNHzGbkuQ0ikYT/nQZumtGtHKyGK4TJkVZyZ8Oslx4=;
        b=zTBheeC9uY3ar46fXbbYgTH1O05N1u298bqy4nNOcoohcEmDfXUDmut0iOYG+xdl2c
         Y9rZQPmLNOiQr/O07Zfik/QSer4mX43ruVWSvEhhSOrgSlYJSl7wcukLqv2yD85cBDB9
         t26B5SAkGTch5Yvng2cpsP9oiqlCEsVjq96VvOrou2/gOqjp4jN3kqfW+FTQE/RxAnRE
         Bk4lVmAMA1W8ad58wDSxJFycFkvZOrKBUHQfkr9q76y/tBSAAWeWu8OEuyx0R8JoXa4g
         afptFf3Cut7L+u/bDr+TTptIOJOh1x09L0LYCp2jcjiMeWPdRrYXMWdPOIHo/EZTKttK
         Eqsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=LsNHzGbkuQ0ikYT/nQZumtGtHKyGK4TJkVZyZ8Oslx4=;
        b=ABi5NjZ4nTOxY24UR59dyQkJMiWdESyrqxmsC3nfxUIf4ePo3SJTmwg3D56LaKlSuL
         C7Cv9J+BXat4Fj/F3ZwKXMz4hu1MZ3zKuLvBHsIiX4DPVxLppp+4EJoxw3v6nYVJavku
         RaKMppYEfXKELwsmmlSbC5Su6QZM4kUBRU8mvmM+aqiFtstT4sYRvFo9aqrmEJf8tB0A
         Hao5T/Ifdu3IOyKePWtH29qzYQ5vLJhetm2sW1zkliQAT55v2c4ftaSVX3VFospbdmez
         eoFBZhj1+y9SAJkXaMVgaQAZgcZAyeLwSjVEraL0b7V/XadEkB6YgUH/3UrRColkQRd8
         wRIw==
X-Gm-Message-State: AJIora/BbqqZvT56TzOvp6RwZfmVPPfNxqPNUdiI9wVaAKP8mP5uYLmR
        yq4rAmxsJOZz9fUSQhs/9IYXyw==
X-Google-Smtp-Source: AGRyM1urAWT89N7cpLwph3oPJCnPahOlsnfZJ9b7JsB3ugSECMdMylrbT0nE50nn9tcWXfcklF7JSQ==
X-Received: by 2002:a05:6808:68e:b0:335:4901:1b2f with SMTP id k14-20020a056808068e00b0033549011b2fmr842227oig.149.1656476992933;
        Tue, 28 Jun 2022 21:29:52 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id r15-20020a056830080f00b0060c574ebae6sm8965045ots.76.2022.06.28.21.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jun 2022 21:29:52 -0700 (PDT)
Date:   Tue, 28 Jun 2022 23:29:50 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc:     freedreno <freedreno@lists.freedesktop.org>,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Rob Clark <robdclark@gmail.com>,
        OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS 
        <devicetree@vger.kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Chia-I Wu <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] drm/msm/a6xx: Add support for a new 7c3 sku
Message-ID: <YrvVPiLQL6d4MrFV@builder.lan>
References: <20220510132256.v2.1.Ibf12c1b99feecc4130f1e3130a3fc4ddd710a2e9@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220510132256.v2.1.Ibf12c1b99feecc4130f1e3130a3fc4ddd710a2e9@changeid>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 10 May 02:53 CDT 2022, Akhil P Oommen wrote:

> Add a new sku to the fuse map of 7c3 gpu.
> 
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>

Is this series still needed/wanted? I've been waiting for patch 1 to be
merged in the driver so that I can pick up the dts change.

Regards,
Bjorn

> ---
> 
> (no changes since v1)
> 
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 841e47a..61bb21d 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -1771,6 +1771,8 @@ static u32 adreno_7c3_get_speed_bin(u32 fuse)
>  		return 0;
>  	else if (fuse == 190)
>  		return 1;
> +	else if (fuse == 96)
> +		return 2;
>  
>  	return UINT_MAX;
>  }
> -- 
> 2.7.4
> 
