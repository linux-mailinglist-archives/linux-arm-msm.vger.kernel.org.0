Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 197634FB12F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Apr 2022 02:55:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237865AbiDKA5f (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 10 Apr 2022 20:57:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237026AbiDKA5f (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 10 Apr 2022 20:57:35 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D4E21ADB4
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 Apr 2022 17:55:23 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id h11so18261818ljb.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 Apr 2022 17:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=OGafDg3DxeHztujL+sSHxizX/gbRwwn9uMxQuC04w7k=;
        b=hsIdT/GmWbO+U9EX4aKGvbGV8JS8jvtcjwggO/EJFEm3VcYSmGVdL5lYZOa1rJgiL/
         plK7KaELvjRgYwi4v/WIkiB0eHJXUIdk5L67hRcklZuAhhTYuZQf6POsJg7/K+sKKEb0
         5SAttD+FHIJwJXpLYsOKDKEzPhQli9WIBnCPnpWd9zcJnxThatcsy15uXc35UMqsCbJ3
         CIXXREMdLa8l/EYJDbqTKgelf3GSUkXTBfVPYnTeJsjJnPsCaTe0+Au5CaARYjsOAYfj
         MX7o8hNSx31P0f9j0a6SRlsjbmToThwVzNkR5lkBN+R2SPqTtNVD7aNaPupdK2llJKjJ
         8CPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=OGafDg3DxeHztujL+sSHxizX/gbRwwn9uMxQuC04w7k=;
        b=t4BQo9Ckx+psRJ20xy/o5f9wuxZWTUc6Ii48Pfpb01jN1tK40jByOKv+ewb6RpK326
         g33qg6iYis6+XVrkevGK24wNUgvUHZXx3Nff+b4lprBqPj0JmVqkhUzNf7NECLPZa7G0
         33dmZxOmYONvyZWeDX6tIa70HQ77iUdLvosjuHHPMzC2RY/c2+Iy9KnfZb9zQ1cIdVD4
         chh1LtFT/6Sytd/B2AKvrMrqjEjV2TT0L8xvM3+WB+S9ks58l9MMYd2OtEnLM7ghVhO0
         0/w+HmqJUcQGKBn1xyvfPn9f69LbRJWLQi912LZnT0sjB1mdvD28sL5UCQkqhAG9ak4k
         r2oQ==
X-Gm-Message-State: AOAM5304lEgWE8eDOqBDRE+npWqLFTvPtVipj8ZJ34/Pd1phb4dT6anX
        p6ZDBeQ0Phov/xiNKexHk839Tg==
X-Google-Smtp-Source: ABdhPJyO8+aniDjnYx0zU3hsNKlVq026qfQlqZSsrhX6p6/U0Zl56YhNUcNT+MVRGEnOdhKodQiglg==
X-Received: by 2002:a05:651c:548:b0:24b:5e49:7714 with SMTP id q8-20020a05651c054800b0024b5e497714mr3939851ljp.223.1649638521243;
        Sun, 10 Apr 2022 17:55:21 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id g15-20020a056512118f00b0044a835fd17esm3161424lfr.162.2022.04.10.17.55.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 Apr 2022 17:55:20 -0700 (PDT)
Message-ID: <a263814b-3377-f64e-6ed3-13a9c9a1cda0@linaro.org>
Date:   Mon, 11 Apr 2022 03:55:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] drm/msm/dsi: Use connector directly in
 msm_dsi_manager_connector_init()
Content-Language: en-GB
To:     Stephen Boyd <swboyd@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <seanpaul@chromium.org>
References: <20220318000731.2823718-1-swboyd@chromium.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220318000731.2823718-1-swboyd@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 18/03/2022 03:07, Stephen Boyd wrote:
> The member 'msm_dsi->connector' isn't assigned until
> msm_dsi_manager_connector_init() returns (see msm_dsi_modeset_init() and
> how it assigns the return value). Therefore this pointer is going to be
> NULL here. Let's use 'connector' which is what was intended.
> 
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Sean Paul <seanpaul@chromium.org>
> Fixes: 6d5e78406991 ("drm/msm/dsi: Move dsi panel init into modeset init path")
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
