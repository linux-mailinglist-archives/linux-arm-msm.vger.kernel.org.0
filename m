Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1671D6FEA9B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 May 2023 06:26:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232984AbjEKE0d (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 May 2023 00:26:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230249AbjEKE0c (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 May 2023 00:26:32 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E2C72125
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 May 2023 21:26:31 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4f25d79f6bfso3011563e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 May 2023 21:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683779190; x=1686371190;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eUmCpvjWDhQdxf3lwZ60FBKbTN2JHorB/w60u1Mv/vU=;
        b=xFnk2tKBhuiOr+yfiGKI65TTdYUo5p01mFQkE996K2jQMkk71QArG+exw/q+dw1kky
         Hn32/yrkwCyu/kNf4wcSTK4ic3eTul1cEgNjC71cnJ/KeHig3gs7V7+YClbWl8ayTblq
         HDJKV0Zww1ttyDWPmBiGThd9899NAra3Spb/YWFdFkjQcaLFv95Mntd4BgrJH63XViIX
         5p5wSUTiS9UpFlBg2fC+SBG0z5GNYs2fM64+6SAKuBhsEmlRMUz1ybz+RYDK3xVr9+3K
         s2TQQQV1TbHZngVStrDc2VgeTSf0YW/2pmYRN4spASI8hxKI0iXfheOBPbzz88LUqXpP
         nshg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683779190; x=1686371190;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eUmCpvjWDhQdxf3lwZ60FBKbTN2JHorB/w60u1Mv/vU=;
        b=HqjzuL4NelVPMhWsi3UrThy3qGD7vb8ljHr31dgjVgIVldI2ONjvkU3cakClr2zegV
         x1WBARKlBHUF6/IUTmS09QGPNvcklr3lvXCnmEGkJnijnRfD451hBekcCK0he/dh1JGz
         sgYcqfsr08k9p1wTrq+/pcKXjpREA+cTyzN/0JCD522BBIsUSGtDauDYM7AwNkHuIfyq
         4zOEPJDMdT4KNReGv6lTli2+y7nDplmwYmMDLueltzGlEraZIHcCbzQuPeUHxx0x/8Fb
         PjXJQ2KTzWhIc3yzXZovAmRDo0PKAP14qa+/DP2Bn88DR8z0LG3HYv4hympNqeDpr1bo
         7rHw==
X-Gm-Message-State: AC+VfDyjSX1qJoKKDCaQsh0nEhoULqBDeaqVpZmNvDbyBTEj3CDFoP45
        EAOdKyGCFNEgyRF4vKXkzwlzYA==
X-Google-Smtp-Source: ACHHUZ4xVPNCG/PgCri7O7YabARlUEbPecdbRrz/JhmgxofTMJUuDeraPp0vq+ZhTEWCWxbOLpb9wg==
X-Received: by 2002:ac2:4313:0:b0:4ef:f630:5c1e with SMTP id l19-20020ac24313000000b004eff6305c1emr2108356lfh.51.1683779189789;
        Wed, 10 May 2023 21:26:29 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id a10-20020a2e88ca000000b002a8d01905f7sm2184933ljk.101.2023.05.10.21.26.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 May 2023 21:26:29 -0700 (PDT)
Message-ID: <7eeac1dd-8cd1-60e7-5dc0-f8f5adc18ffe@linaro.org>
Date:   Thu, 11 May 2023 07:26:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v7 2/8] drm/display/dsc: add helper to set semi-const
 parameters
Content-Language: en-GB
To:     Jessica Zhang <quic_jesszhan@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org
References: <20230329-rfc-msm-dsc-helper-v7-0-df48a2c54421@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v7-2-df48a2c54421@quicinc.com>
 <tl5zijcxx7326jdgr6lyjptvvvyxosoupz3vekvhex3vnviw5t@3vswzg244tme>
 <05021e78-6c1a-b4b1-6312-4dd3f1647074@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <05021e78-6c1a-b4b1-6312-4dd3f1647074@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/05/2023 01:35, Jessica Zhang wrote:
> 
> 
> On 5/9/2023 11:29 PM, Marijn Suijten wrote:
>> On 2023-05-09 15:06:48, Jessica Zhang wrote:
>>> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>
>>> Add a helper setting config values which are typically constant across
>>> operating modes (table E-4 of the standard) and mux_word_size (which is
>>> a const according to 3.5.2).
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>>
>> Same question about ordering.
> 
> Hi Marijn,
> 
> This patch was authored by Dmitry and originally part of his DRM DSC 
> helpers series [1], but was removed from that series for mergeability 
> reasons.
> 
> Looking over the kernel documentation, the last Signed-off-by should be 
> from the patch submitter [2], so I think my s-o-b tag should be at the 
> bottom.
> 
> As for the order in the previous patch, I can add a duplicate s-o-b 
> before Dmitry's so that it reflects the history of the patch.

I think this is an overkill. Instead you can drop my SOB from the patch 
1. We do not need this level of detail.

For this patch the ordering of tags is correct.

-- 
With best wishes
Dmitry

