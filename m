Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E10F5700D37
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 May 2023 18:44:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237188AbjELQn6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 May 2023 12:43:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237182AbjELQn4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 May 2023 12:43:56 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1484C30E5
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 May 2023 09:43:55 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-4f139de8cefso53296614e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 May 2023 09:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683909833; x=1686501833;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oQ35jiD0iHCimmXNvqE7wf5xzhSOyJCookuzUyurpLM=;
        b=LmEGhTe2a0TlygbG0pgEn3ULmATOXb0sCfMtBAEgM5W8HG+6IAO5PVCooWsF9UEups
         c7QodB3vbWifw2arGdJiSkUy+9wDhkMxw3zwR3IRHGWoootxT9mc7amQycF3LDRUdFHZ
         jEI3pSuMaamdcLeQJgKQXHIEgGwNg8gQZkxiIzxDAdl4u0/mTwG6yeSwGEC8yR6R2GI6
         CujVaK1xb9uvKUYlGGTcvPHUuaIOuWkuaT3hGJbbmPAB/upM9nCpfpbRGVRw9EsCrVea
         obaH884kC3q3FsXANPfe4kS18rAryzP+5Wa/CwJLJhmu1D8Yv+1jd+tsjMJCtcCs1a6N
         93Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683909833; x=1686501833;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oQ35jiD0iHCimmXNvqE7wf5xzhSOyJCookuzUyurpLM=;
        b=DoIDii62IJBQP4Q1nnwCzXMrG0L85cjD8qSYe/YmCTvf4gKfYN8/o1fn754oiOr698
         x8h62t8TsVPyHqAKmfg9MISPLxrK+n8/dPIcU+CE0s9OUOdCDiRymkU33Douf4YLGBwO
         nZf4NzPiNbsyrRrmnkf8G3YhnKFl6OYOF8h3ShcH5glEBgM9KyTDQJXZrnehsE8PiVI0
         zvrNcvFHV1FxsSm9nNQfMJBfzTXBSfhYCMK6QcfUh/8MwaMXpLit1iW5EgJGg59HZZjx
         XZh7F1yTKOUFIiDivcKplIRfRXbvNtlPT52wkuq2dInYpFEsmmq2DMBA/imMgmlzETB9
         WnRg==
X-Gm-Message-State: AC+VfDzlShaeu/vyYnwDOP0DGa5PEOVRic/5gxVeUtBzVLgBMbpxBtcQ
        B7YtlSdxzFYYYYEeuvPjqLSo1g==
X-Google-Smtp-Source: ACHHUZ6Knr8V9h2tzeBW26Liibmojqhi318dz0i7nIVAWX3Oxrywq7eHYWTvTbXUamXXHscf7fgd4A==
X-Received: by 2002:a05:6512:3f19:b0:4ec:83fd:1599 with SMTP id y25-20020a0565123f1900b004ec83fd1599mr4095277lfa.33.1683909833320;
        Fri, 12 May 2023 09:43:53 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id o14-20020a05651238ae00b004f250513215sm1513284lft.198.2023.05.12.09.43.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 May 2023 09:43:52 -0700 (PDT)
Message-ID: <ddb79cfb-8ddd-5ca3-e133-465518e5e973@linaro.org>
Date:   Fri, 12 May 2023 19:43:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v7 0/8] add DSC 1.2 dpu supports
Content-Language: en-GB
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>,
        dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        sean@poorly.run, swboyd@chromium.org, dianders@chromium.org,
        vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
        agross@kernel.org, andersson@kernel.org
Cc:     quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com,
        quic_sbillaka@quicinc.com, marijn.suijten@somainline.org,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1683827607-19193-1-git-send-email-quic_khsieh@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1683827607-19193-1-git-send-email-quic_khsieh@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/05/2023 20:53, Kuogee Hsieh wrote:
> This series adds the DPU side changes to support DSC 1.2 encoder. This
> was validated with both DSI DSC 1.2 panel and DP DSC 1.2 monitor.
> The DSI and DP parts will be pushed later on top of this change.
> This seriel is rebase on [1], [2] and catalog fixes from rev-4 of [3].
> 
> [1]: https://patchwork.freedesktop.org/series/116851/
> [2]: https://patchwork.freedesktop.org/series/116615/
> [3]: https://patchwork.freedesktop.org/series/112332/

Please run the series through ./scripts/checkpatch.pl --strict. For this 
series it reports tons of issues with the mixed indentation, 
whitespaces, alignment, etc.

-- 
With best wishes
Dmitry

