Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 545386D1249
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Mar 2023 00:40:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230411AbjC3Wkm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Mar 2023 18:40:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230416AbjC3Wkk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Mar 2023 18:40:40 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24094DBE6
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 15:40:39 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id c9so16104832lfb.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 15:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680216037;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2/ja3fIGJRWDcuO7yeZRURjc4pI/MTQBKxIMYeWLRVY=;
        b=qxp4eqg4dlFQ3Fki7aQ/XWlce3pMJmYyAdcynlUAxSx7WvVnpgOrYyfvCRnHC+OFeo
         ofKlGEJlLVys+eQBfjt7OWLKx3GkjNs3xqhHF1e947OPe/y6cY77vUevXASfVaA23PuY
         olHGfPgJ9IvScdxwkbNCQC417JLxcSK5h5xY/iTszrORiMXybJLVbTKlPIctEzrwt0G3
         U8rluHKnKvh2PMfnSS6EB4ESFzWgxKcIpQxenIIHxk8q9zsBU+jmvJYMNvGgDvEZ1c2a
         5tphqwaDvbB+Q1b1Ol7VPiGxczco5ievV7XdX1b44e1afsN9caTxAdsJUq1XvOkeY2K3
         mbUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680216037;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2/ja3fIGJRWDcuO7yeZRURjc4pI/MTQBKxIMYeWLRVY=;
        b=YS98R0jtBjmquxpvJOSOQiyjaztC7h1DTlzdizRinGZXi097GhLYvq4f+Ntfis4A9R
         3M1TGFpW31aFyOpCDefI6I3YTvkBPP1KQQ2dCnbDSDD7jKIBU/om8F0YC1/XLs1F6BGj
         WdOGu8uiGSUXLlYrTw+nSjcd4hBG/GOo9lTIvGHCYnIpzY/Wc2pEKDioTsJKma+NBytA
         ZLx7JxDYtZr4O7/rgg5tkciI3SgFxT7BpZTUfqDZB5hb9Ypc88nC5pJxGmeWvfjyzv6b
         YKUZZ5109Eq35OpZy+NYP9m6sg9scsOtYL5wAOqNPgneXrENuVBSwDQGDRinkNH6gxIU
         WonA==
X-Gm-Message-State: AAQBX9eI3J/WqFa7sA2/NoHEPybm7gsiDu+orypJ8aocIoVaPFD1Giog
        Zp2ay6btsUuHR360YtAVJsO8Ng==
X-Google-Smtp-Source: AKy350aJj/YVs57oOua+pPg52YOhSmhHcSSpoKDYtxIqVi7a9hZWSol2a27ncUM0XvE2g54LV2AHSg==
X-Received: by 2002:a19:e05c:0:b0:4d8:86c1:4786 with SMTP id g28-20020a19e05c000000b004d886c14786mr2401377lfj.27.1680216037367;
        Thu, 30 Mar 2023 15:40:37 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
        by smtp.gmail.com with ESMTPSA id v26-20020ac2561a000000b004cb8de497ffsm114763lfd.154.2023.03.30.15.40.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Mar 2023 15:40:37 -0700 (PDT)
Message-ID: <f32f9f21-aef2-cf58-bfcc-2f946e532fcb@linaro.org>
Date:   Fri, 31 Mar 2023 00:40:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [v3,28/38] drm/msm/dpu: enable DSPP on sc8180x
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
References: <20230330215324.1853304-29-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230330215324.1853304-29-dmitry.baryshkov@linaro.org>
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



On 30.03.2023 23:53, Dmitry Baryshkov wrote:
> Enable DSPP blocks on sc8180x platform, basing on the vendor dtsi.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> index 92a8e474e380..bbdfec415185 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> @@ -90,6 +90,8 @@ static const struct dpu_mdss_cfg sc8180x_dpu_cfg = {
>  	.sspp = sm8150_sspp,
>  	.mixer_count = ARRAY_SIZE(sm8150_lm),
>  	.mixer = sm8150_lm,
> +	.dspp_count = ARRAY_SIZE(sm8150_dspp),
> +	.dspp = sm8150_dspp,
>  	.pingpong_count = ARRAY_SIZE(sm8150_pp),
>  	.pingpong = sm8150_pp,
>  	.merge_3d_count = ARRAY_SIZE(sm8150_merge_3d),
