Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B2C9169FE67
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Feb 2023 23:22:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231726AbjBVWWx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Feb 2023 17:22:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232260AbjBVWWw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Feb 2023 17:22:52 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 958A3E393
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Feb 2023 14:22:44 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id bp25so12126468lfb.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Feb 2023 14:22:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=atzpGGm4vagUHizle3JgA9VVbXqT62LG4zh3TeyuV3k=;
        b=z3HAXW0r+lBjP33n3TNvCI7k44IekUH5PFat+cB07EL6dqRd2YdAOFE6sHRm06PTCx
         5ZRmH6n7pROQPFle8JBqNEs/lyQY1sZPmKdPB13sKN5sjz4TKeIMgF0F1jVPR/4mW8+7
         IJjxEJwCzXjmQVjqK3k3+erufB2HHOSUwxpp0HZQvBuB/3mUGt4GssoSkle12dUBv/b5
         32HVgPy9GJlDkp3JxNO0tgIE3UAe7HpN2aoTbDnE5q8RiU8hMpAH72pxsJ3l62kt7+ZE
         bwSqs+AK+lrxCwPCvBpOCHlqPZjOmJ+k6JYkoBtpZArbD9pQOCUMd12Wv4PU8p4pITvT
         WJsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=atzpGGm4vagUHizle3JgA9VVbXqT62LG4zh3TeyuV3k=;
        b=ieofMH+wuJ4MScI/q+vR1aS0wpP2zNFUX1dOM5/AesHU9uqq92M+qB6/8HJJzwCMwB
         tP/iTbhLsOFMY1/LZv4d2bRRbHdYV8FtdnLuIospMlQ9HmZcLhzeXPSgTYsPzsKZJrWY
         c5CbbA+uGSjt/vgvPgxhtPmF+4Q4O1/s1E4DfQOw5gjtjOaDHfYUXIMcrGi+ynGwL7we
         AF9455MODGftG6QDnwzWs1Dpk5E6sZnlCROY0sNwKUmoAlBxkZI85uVsnC2KKJcL7xkS
         neyIXTqgoFRM788lto8lF4noP6FegBq8j4ueLSBjXu0aI8jGj/nEyXyemSJgA005FKt3
         hoGA==
X-Gm-Message-State: AO0yUKUIryIOZGAHhSSHwOXjffECOWRNf7cn6s2Cj/sNWmJ1XfOIkjMH
        G2iMn1iuUa53LUmwo24f0iz9EQ==
X-Google-Smtp-Source: AK7set9n3cIGAeZEY7Yp6SQEIqmsXNCVJMpeL/gyWazXzSu4mnct6+IYJTjeiy23AJy9CGnSUq/4DQ==
X-Received: by 2002:ac2:46d9:0:b0:4dc:807a:d134 with SMTP id p25-20020ac246d9000000b004dc807ad134mr2911452lfo.65.1677104562994;
        Wed, 22 Feb 2023 14:22:42 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id r1-20020ac25a41000000b004d85a7e8b17sm398111lfn.269.2023.02.22.14.22.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Feb 2023 14:22:42 -0800 (PST)
Message-ID: <414f038f-7196-e3ca-5854-222c7c42348d@linaro.org>
Date:   Thu, 23 Feb 2023 00:22:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH 4/5] drm/msm/a4xx: Implement .gpu_busy
Content-Language: en-GB
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20230222-konrad-longbois-next-v1-0-01021425781b@linaro.org>
 <20230222-konrad-longbois-next-v1-4-01021425781b@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230222-konrad-longbois-next-v1-4-01021425781b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22/02/2023 23:47, Konrad Dybcio wrote:
> Add support for gpu_busy on a4xx, which is required for devfreq
> support.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/gpu/drm/msm/adreno/a4xx_gpu.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

