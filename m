Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C16996A666C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Mar 2023 04:22:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229564AbjCADWF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Feb 2023 22:22:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229792AbjCADWF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Feb 2023 22:22:05 -0500
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAFE337F06
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Feb 2023 19:22:03 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id a4so9227460ljr.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Feb 2023 19:22:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NUZecSUqzu1uo/SXLpOzA6t3JV6OPyWWN5Ny9ipj8EY=;
        b=HbXthZCZbWCMCpjYnzTBhJKdyHTUZPve27TqpqciAyONXTaUXftg0Yk7rq3prW5cOf
         A7UjsBMz1j/Zb2dnU73UkECfrmHPeOCbbu9lIhpFAIrVfI9cDFMji2/6zMO7WB6OKij8
         V/3PRjCvmUJjnD7hZmwbaKNVHFwCGno7Ko8unlqMk96FaxL8eGPwCBaNn6ZZncHe4s7Y
         fodFYaHF8FsGrNtp67tVvOEZCzkZnnzB40em8ESzPm6oA4eheVMMRyJRMFMKF/3Gdz4w
         Mc20Y69E+euzG99QF6ihnNQASbaBTaRE8l25+gLVj9zvTz1eiOgXx6xerGUSCopDeqZh
         I69g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NUZecSUqzu1uo/SXLpOzA6t3JV6OPyWWN5Ny9ipj8EY=;
        b=xmaax3Basg+DN7u/BVf6sairQi3OMxuMEeU34i1GNeEaV/o6gb5FLrQgh6pdRTPny4
         XqnycBMlte73w9dn0tU8KGNd/GCCBR5O8wQcANljSU64glzi5u9bX4NzMirYUrY//y3w
         Z+LXy59bE0ctQU2vPUqAfLLdz3/GO29A7ghw0mMq/ExwxIgN3YpfeYntD+ULk1izJcFS
         UCTQoLf75UfEAMR8l+rDMZqQZgCAEblxH38TyLzDwD0biXJMXgBrAKSThR6Gr5KorLk0
         P5TtaraF4W28AJAavG8qDjomBK2KGXNtxUOdZrfkoIiGwuAc8sGRJ0tuIj2djWxqRsrQ
         DSLA==
X-Gm-Message-State: AO0yUKUpAhI6nFjc0VizBrBXS4cN/tLMu8EnKF6u0Wjhm5nsptKtD5Zo
        3vxP+tOmU7m9m6J0u9QJiYhG4g==
X-Google-Smtp-Source: AK7set+EwfKoaH2pJojg/fcrmaYhssF05s4pHXzYYARrdyhKFsh5msqxjncNNSpHuaj00TeGVOHKfQ==
X-Received: by 2002:a2e:b910:0:b0:295:a96e:4f1b with SMTP id b16-20020a2eb910000000b00295a96e4f1bmr1514777ljb.27.1677640922090;
        Tue, 28 Feb 2023 19:22:02 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id d2-20020ac25ec2000000b004db0d97b053sm1543287lfq.137.2023.02.28.19.22.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Feb 2023 19:22:01 -0800 (PST)
Message-ID: <3195f978-9997-dc99-4e32-939f0db50f68@linaro.org>
Date:   Wed, 1 Mar 2023 05:22:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v4 3/4] drm/msm/dpu: Remove empty prepare_commit()
 function
Content-Language: en-GB
To:     Jessica Zhang <quic_jesszhan@quicinc.com>,
        freedreno@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org,
        quic_abhinavk@quicinc.com, marijn.suijten@somainline.org
References: <20230221184256.1436-1-quic_jesszhan@quicinc.com>
 <20230221184256.1436-4-quic_jesszhan@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230221184256.1436-4-quic_jesszhan@quicinc.com>
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

On 21/02/2023 20:42, Jessica Zhang wrote:
> Now that the TE setup has been moved to prepare_for_kickoff(),  we have
> not prepare_commit() callbacks left. This makes dpu_encoder_prepare_commit()
> do nothing. Remove prepare_commit() from DPU driver.
> 
> Changes in V3:
> - Reworded commit message to be more clear
> - Corrected spelling mistake in commit message
> 
> Changes in V4:
> - Reworded commit message for clarity
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 19 -------------------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  7 -------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 21 ---------------------
>   3 files changed, 47 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

