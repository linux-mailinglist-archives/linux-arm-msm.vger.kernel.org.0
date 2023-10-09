Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9CC67BE71F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Oct 2023 18:57:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377667AbjJIQ5z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Oct 2023 12:57:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377359AbjJIQ5y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Oct 2023 12:57:54 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D97194
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Oct 2023 09:57:53 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-5056ca2b6d1so5766644e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Oct 2023 09:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696870671; x=1697475471; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v4ilr7+Ii0ToMA97+lVnUxlCmyGDEQu3lXxCcYih3U4=;
        b=FILyCg35fxc/LoWPjx0vBT5uxOdSZC+NKfDQ2EzhaCHcp2uXm30EBuGShRo6zHqRbO
         PAn52tRAZmVEOWjZk3v5wgrnIumD8nkVzXb9t07U1UsujDMeL2hMY34+FG/Ypy/d1NQY
         +zCDrw1f5wCQunBwz0vhvPceo6l8zvwBitqjwYGWZ7tH3p4TFnmfCK3Nbhbr1qmy+OYW
         VrhU+/uZw0lSuAccCOM7Vl3ga5oo3PAQ+v/SyAp/+6tlOxXlcGMtFhEVJxTf1vqtacvP
         APXQEwXvR3kfqri6RnaWBWf5sRbT92mcfCfR8ySaV3YlCGLMj4KgkcoOxxiMTIxrL8JD
         llyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696870671; x=1697475471;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v4ilr7+Ii0ToMA97+lVnUxlCmyGDEQu3lXxCcYih3U4=;
        b=l2TvsnUrXzjH6ZMwTL3o5+4p9otNJmjQ7dowFCCSarZh3s+CVBJGjRJlzRjST+FsQM
         FrkIceuXyJVf5C4wiKjAPKEQBKvIomgZlGPkp9JvMu2LHkMQFTV3s5KTzqr+w5+2/Rhj
         adiNmZjDmKwHqB7HktcAIQwSzZqDEOiF4WrlafYV1x4jmtdDuzg5oWJ5PQQYZuGQIFvP
         N7NDqE+4ZszdqGTbS7zM/qiGtpvUfrU3fPbC65IEcEbi3Z+a5+UpXoUsXf55DmJlglsa
         g/ULtyyg5CQ3OdAvO4g+prCQiCxWczT3hiOL9OaEw5LnTwDoH+RrZkobExxqPnpnDfIL
         Unzg==
X-Gm-Message-State: AOJu0Yw1cuegxVyTJpB9Su097PL02Pd77+kfmkTY9EFJDG/w12Ve0Oiy
        6+j3zEkQ5Wftpul0oocszpZToA==
X-Google-Smtp-Source: AGHT+IFwJmsKn/WUgJqM2TLCE9a+ICJ+nX962Esuh3YK7V9GVQk/E/b+LB5Mvk9da1r9nlDr/KyWEw==
X-Received: by 2002:ac2:4da3:0:b0:4ff:9a91:6b73 with SMTP id h3-20020ac24da3000000b004ff9a916b73mr9544388lfe.17.1696870671536;
        Mon, 09 Oct 2023 09:57:51 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id q18-20020a19a412000000b005047baf3385sm1488987lfc.181.2023.10.09.09.57.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Oct 2023 09:57:51 -0700 (PDT)
Message-ID: <8d586220-eb79-446a-b789-5a7131c7a2ad@linaro.org>
Date:   Mon, 9 Oct 2023 19:57:50 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/5] drm/msm: dpu1: create a dpu_hw_clk_force_ctrl()
 helper
Content-Language: en-GB
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20231009-topic-sm8550-graphics-sspp-split-clk-v1-0-806c0dee4e43@linaro.org>
 <20231009-topic-sm8550-graphics-sspp-split-clk-v1-1-806c0dee4e43@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20231009-topic-sm8550-graphics-sspp-split-clk-v1-1-806c0dee4e43@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 09/10/2023 19:36, Neil Armstrong wrote:
> Add an helper to setup the force clock control as it will
> be used in multiple HW files.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c  | 23 +----------------------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c | 21 +++++++++++++++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h |  4 ++++
>   3 files changed, 26 insertions(+), 22 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

