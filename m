Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A11776D04FA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Mar 2023 14:39:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230019AbjC3Mjs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Mar 2023 08:39:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229742AbjC3Mjr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Mar 2023 08:39:47 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A79D7A5CF
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 05:39:20 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id y20so24353927lfj.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 05:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680179959;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3R3nPD3qFWgilc9137SlJTFMh5JUV9k90a6EhVZUbfc=;
        b=VWgMfw5vMFuW9l6DTwdAhG8puqPhV6tLQpKUo7pdbDkHTwEDI+XontB3ocebEsfHbL
         l3VfyZQFkbAQqBLY1TAskq1hSyvA+S4PLw3Rt1YJgQKjyrwR0Wisdk5OW3ib66iklGmU
         vcYPPwmXNNX3dSmZ1Fl3Wpt9a87cF+HyAgyy3aoGhJD8gOhfhAf9vbELn0x+GPgqICjF
         1+1Zvj3nBiUeDmOK++X0DKD4v+/FtgZtSs5KfD7Vd2hZYg0K3Qt74uNjnVRLTxX1CGd/
         zZs6Ub9kfzt9M+uYHO8vmzq8+PAUb0AH2QJZ3t0o44E5PN8gLP50xcT/3bAOcg7B66TK
         Dbcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680179959;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3R3nPD3qFWgilc9137SlJTFMh5JUV9k90a6EhVZUbfc=;
        b=2KyJtC579r6ZP15kj6aJqnoZPWqE3SHlxsYdn34wzc2ybeZUTijXwLU8hTZ7bbU9Vc
         Db4Ux/24HJ4IQatKP9y7q5X3BlXGiUqCDIxRApYMvQJrpJP+fxicGZgpi9wEDjSsFGVN
         xWqqx9vKEzqzMlWmojn2t8+ayhtpyW6cYQB5C1O9ZsLifiG4MwJoixGpE4HftsvEfvhZ
         9lv28mf/br1YKCsYLi42bbvyCPQIL1LXin04lk8C8LM+7psqBDamtMLRlrw1xG3KM9MF
         hOFQFoiq2s8N58708wSF56AXkfqUL89vcrW//8GOhrTmayiSnNHODgsUMzgWr9ecBeKX
         9iKw==
X-Gm-Message-State: AAQBX9cVCyeiDOguMrEa0wHoWKHQ+He+Tf4ZGIEMfLGuAkd/vqWJFIZ0
        kW1sk20MB8rdnzElhTUpaTXF0Q==
X-Google-Smtp-Source: AKy350bLpzKJFAnX7mIedg2RtMhZzL8xIMz5h26kAsbDhPqh6l/YDnnkZsD5R6IC+MCFkQxQ+FEZyg==
X-Received: by 2002:ac2:5699:0:b0:4e8:3bac:4e32 with SMTP id 25-20020ac25699000000b004e83bac4e32mr6183124lfr.53.1680179958934;
        Thu, 30 Mar 2023 05:39:18 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
        by smtp.gmail.com with ESMTPSA id g1-20020a19ee01000000b004eaf8b20014sm3436476lfb.76.2023.03.30.05.39.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Mar 2023 05:39:18 -0700 (PDT)
Message-ID: <e60607e3-8786-e4fe-f0fa-0851dbb53a3a@linaro.org>
Date:   Thu, 30 Mar 2023 14:39:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [v2,40/50] drm/msm/dpu: enable DSPP on sc8180x
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        dri-devel@lists.freedesktop.org,
        Stephen Boyd <swboyd@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@gmail.com>
References: <20230211231259.1308718-41-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230211231259.1308718-41-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 12.02.2023 00:12, Dmitry Baryshkov wrote:
> Enable DSPP blocks on sc8180x platform, basing on the vendor dtsi.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
There's only a single difference between 8150 and 8180:

qcom,sde-dspp-dither = <0x82c 0x00010007>;

is only present on the former. Not sure if it makes any difference.

Konrad
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> index c51e1bba1533..457733a6986e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> @@ -91,6 +91,8 @@ static const struct dpu_mdss_cfg sc8180x_dpu_cfg = {
>  	.sspp = sm8150_sspp,
>  	.mixer_count = ARRAY_SIZE(sm8150_lm),
>  	.mixer = sm8150_lm,
> +	.dspp_count = ARRAY_SIZE(sm8150_dspp),
> +	.dspp = sm8150_dspp,
>  	.pingpong_count = ARRAY_SIZE(sm8150_pp),
>  	.pingpong = sm8150_pp,
>  	.merge_3d_count = ARRAY_SIZE(sm8150_merge_3d),
