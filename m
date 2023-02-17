Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F3AE69B4F3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Feb 2023 22:43:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229530AbjBQVnA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Feb 2023 16:43:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229585AbjBQVm7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Feb 2023 16:42:59 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BEFD12861
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Feb 2023 13:42:55 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id t4so2396292lfr.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Feb 2023 13:42:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RVfAM1aoMCSGNnm3y845Ami8wb0wHuWhrZQr32w3Tjw=;
        b=wzjVOLTW6zAlPTdYq7bgQm9Wzv5yjfA8OZFcEROYZZ2Mfnj+ZZ5MzH3IXa+sWZrRi+
         8QsMXdMyTXefyp6TLW/iHdR0owiFo7cQGipaAdZhemqcVNTyQ3Lj8/OVVkOmAJRlQCak
         xGd+hk0sxnIJaEB6GkAi8lX6NaHq83yde+Pyd4BWBASaUu9kl8KzfUgtxZa2svfkkrpC
         b0xLBfIBsqTOxLxKAiZP7/h6FPPlz6IWGSPUeNceoRcQhxn3Ft+P5ZCk6BKLgAwIRbyr
         4at0jYWC6i7Qm43dfl+X3D8yhwm3sl8yj4dZqM/8Gsiz4ZiOQ30h3HUgEBV8cK1/N/xh
         E7+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RVfAM1aoMCSGNnm3y845Ami8wb0wHuWhrZQr32w3Tjw=;
        b=kbyxSkTlbWA2n4qF0+ccMAKHWwKFACDmMYZA9kPUdaAjHxbIFjTUJ3hLbJIb/0O9s3
         jxC26I/7GA4t4E+f+wUgoRNZynP8W67kKhotQBe4tuCaEF9ozdUFE8bBHRM3Lr84c1VN
         QBA+YR43yuw5ZoA61P2fWZa2/MC240wv0S6AYoYWl1zH2YpSwwVReKmCUkAxb3agUWSm
         DcaLwMymMmooa5nZ/R/fRkAthYItHjHxB5sY/VIjceAwR9Bwc4C2eVJJPpTyxtTSdjP1
         5th3/93K9R6MpcHr3TmjNJHw3dNvV9toAguuCS6tqBpfBfifKZU1L2cYwuhpH3tkE7Vn
         aDBA==
X-Gm-Message-State: AO0yUKUal5tJbKGhDRX+2FBeJIJ1gIT+pwI9Dq//m87YJYSXfvQPOHub
        dAyAAv0KRk4wwozQZ/IPCLMhiw==
X-Google-Smtp-Source: AK7set/CxZjGHo846Qka7vuunh7JdD0xMbvLWcB46lLmZmqb987pyAwT8cS37VQHh6qvPh/aW+XtdA==
X-Received: by 2002:a05:6512:24e:b0:4cc:5e3a:dd82 with SMTP id b14-20020a056512024e00b004cc5e3add82mr815421lfo.58.1676670174032;
        Fri, 17 Feb 2023 13:42:54 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id u9-20020ac25189000000b004dc84e73fd8sm310981lfi.278.2023.02.17.13.42.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Feb 2023 13:42:53 -0800 (PST)
Message-ID: <473f4c26-90cd-85ad-afe5-315fa224dc27@linaro.org>
Date:   Fri, 17 Feb 2023 23:42:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v2 09/14] drm/msm/a6xx: Fix some A619 tunables
Content-Language: en-GB
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     marijn.suijten@somainline.org, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Chia-I Wu <olvaffe@gmail.com>,
        Douglas Anderson <dianders@chromium.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20230214173145.2482651-1-konrad.dybcio@linaro.org>
 <20230214173145.2482651-10-konrad.dybcio@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230214173145.2482651-10-konrad.dybcio@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14/02/2023 19:31, Konrad Dybcio wrote:
> Adreno 619 expects some tunables to be set differently. Make up for it.
> 
> Fixes: b7616b5c69e6 ("drm/msm/adreno: Add A619 support")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

