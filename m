Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7ACC57040BB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 May 2023 00:09:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245703AbjEOWJK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 May 2023 18:09:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245548AbjEOWJH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 May 2023 18:09:07 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C42671BDF
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 May 2023 15:08:26 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4ec8eca56cfso15406362e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 May 2023 15:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684188427; x=1686780427;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LD3bzTcohof43Cv5AIGVz5AV6O0c+E0Pt23Vyll0iRw=;
        b=m7SEzQnaOG9G40vLqC6KQRYLcHGnGmqXVV6ugylQNm9QRGPCm7OChPJDzYf5HlG/VD
         6fFqfpcon8wfBF1cfeOkgvWQ59BU7jWRGdMxbnto+4xTd94i6uIlGRXEsxlVm/RE7OBe
         PwCM84DiHy+nJDJreIk99Nw95sWtUEYPNtr4ZlFO74oHKStI6gRBS/O0on8tKEvQaDHe
         Q5Vs81fimTZXvYfUvuPx+LzPbrMtGB7Su2wc1Dgwdt62XUuwPf9DVdXpaU+zBQhCbqRU
         LlBDfxS5o/tj98PluRPBBFMFM1ueWT342vMJzk2iJEnNyDGvf0yHMMxpez0vTjHsWbS2
         SRDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684188427; x=1686780427;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LD3bzTcohof43Cv5AIGVz5AV6O0c+E0Pt23Vyll0iRw=;
        b=gcyMlQ/UyAqspKC71sOiyKcIb1MehbdQoxd+5inMphWMVRLzl6u+b7ZEd96uoOhyQ8
         Nfmj78chUJHpVcNpUPg1JvD4Zat++Ix+g7iqPOfF+xog1SCgAA2cWDBKzsJWXSq4zTHI
         xA6Qt0+8rog5L0xjCp6S7m+bQxp6nC8BM/ZBULWHWX9CMZhidiaJJbWd92zBIGP1jUzY
         /+uBoL/pqjBSJdWB67QP2t4vGAXmYW4V3LzR4NKmTXo8wo2k8ExbSbCWuT5GP4uYjOff
         rLRF3Ck7Yu2MNa3mMvpM8LQ6YxQRc1L/HoOVtbgSBG/2uqjXr5E4Te7esFJ7VpyAVKoZ
         ui0w==
X-Gm-Message-State: AC+VfDwlhdyTpTrWbE1NTGmMjFNLF2HcvPqH8HnOq4G1Y5g4gw87laaq
        jQqSBp9u79UfrmLg37Ey3agI1w==
X-Google-Smtp-Source: ACHHUZ7rAS8Yhzo15Yx5iO4kwGAT54cP3w6YUHDGMWLvzttCZGZfbj1o6VqJoKR83WVC9y08J07Fnw==
X-Received: by 2002:ac2:46c1:0:b0:4f3:85eb:97b1 with SMTP id p1-20020ac246c1000000b004f385eb97b1mr888074lfo.8.1684188426777;
        Mon, 15 May 2023 15:07:06 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id 6-20020ac25686000000b004f25ccb6f7bsm2558045lfr.301.2023.05.15.15.07.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 May 2023 15:07:06 -0700 (PDT)
Message-ID: <a5a56711-3607-407c-aa8f-aed39a41fb73@linaro.org>
Date:   Tue, 16 May 2023 01:07:05 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v10 4/8] drm/msm: Add MSM-specific DSC helper methods
Content-Language: en-GB
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>
Cc:     freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org
References: <20230329-rfc-msm-dsc-helper-v10-0-4cb21168c227@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v10-4-4cb21168c227@quicinc.com>
 <kx3be4c2okye2ts4rzy4j4ltnveixf7v4rxp5v4tl2irvevg6t@c5tuelunmn4c>
 <0e8a8af5-5ab8-c1b9-e08d-909072cc9b76@quicinc.com>
 <4cbqbu47vcshskl4npyzos5r7gxipjbbzyfvdfx7fenfh4mzmx@jj6lrysp35du>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <4cbqbu47vcshskl4npyzos5r7gxipjbbzyfvdfx7fenfh4mzmx@jj6lrysp35du>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 16/05/2023 01:01, Marijn Suijten wrote:
> On 2023-05-15 13:29:21, Jessica Zhang wrote:
> <snip>
>>> Const, as requested elsewhere.  But this function is not used anywhere
>>> in any of the series (because we replaced the usages with more sensible
>>> member accesses like slice_chunk_size).
>>
>> Acked.
>>
>> I would prefer to keep this helper so that we have a way to easily get
>> BPP information from the DRM DSC config in the future, but if you'd
>> prefer we add this helper then, I'm also ok with that.
> 
> The inverse helper is available ad DSC_BPP in drm_dsc_helper.c.  Perhaps
> we can move the two variants to the header and define them uniformly?
> This isn't MSM-specific it seems (i.e. the format supports fractional
> bpp but no RC parameters appear to be defined for such a format yet).

I think DSC_BPP was removed (around v2 or v3 if I read changelog correctly).

As for the fraction-point BPP, I think AMD supports .5 bpp granularity, 
see drivers/gpu/drm/amd/display/dc/dml/dsc/qp_tables.h

-- 
With best wishes
Dmitry

