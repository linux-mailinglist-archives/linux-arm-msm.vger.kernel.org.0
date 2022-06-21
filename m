Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 23AB05538F4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jun 2022 19:36:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233690AbiFURgK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Jun 2022 13:36:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230056AbiFURgJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Jun 2022 13:36:09 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9A6F2CC8A
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jun 2022 10:36:07 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id i18so9930996lfu.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jun 2022 10:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=XImEucYj10R9wQ/Mb+msU8blmp9NRnZvfxsAmALiQH4=;
        b=b0EFmQgxhuwRO5Nndx5jOs0jCxhnv7UTdhlhE9OvIb+Z1pT53u4gbXk+AZfkGRGffI
         SS/nbwK53sD+jmJAhz/uVEfgt1nvJnhjLlvGZ2UYyhzrYHQBBsjptcvc1Wi78g6a/y+F
         s1PMf8oE5y7h2Xb2CZLNuggv+5UODxVg4dGx0Iegc1O8Vw6vTwPfi8xzhM9SxG05BjS/
         lnIllNKsrELmMqBb3B6CaWIDT0h4xlgbSZliIyPP84+Z7++ePTf7XwYzIXhqfI5G+ghU
         aEnezvTBLb8HOldUg7GPEajSabe7aZsaZWEkzYhbBx8mBYrmNlPf9mT7oKKvYuAd+vsa
         TV7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=XImEucYj10R9wQ/Mb+msU8blmp9NRnZvfxsAmALiQH4=;
        b=M656+x9yFRoYUTH+f2amiM46FY5Oey+I7ankcipPyzBvwqLnn/qVWWd9S/1U3tmCur
         1po1rOIVT0aQ219QdY4QF7/U4+69GZBgdDvsmBjk4qvTQpmP50aa+/3QfsdyKFWVf+lP
         MeU0RvxX/VsCon36I6LpuS0Ms83PiwCQ9tGxYv6J2r48kL3WsXqBWALAwn+cQB0tK3ZN
         8TGNxBkFvJRafF5nTfMOAYkW89HL2kDWTEUE4TZyXmL6ipWETNBveNY4U544ebuPIzs8
         LCVBNq5gyj076VLVIHX5LRq0Vs+4BKaWHACJm7r5bBrZSoVMVwxpELAl2tVCsgMjEY7H
         hCOw==
X-Gm-Message-State: AJIora+lZIuD4nRV7r0v+YVkG1x/eL77fhffYQfnXH86sp/paEIIbRhy
        fQC00u8rHNgRAt5980pshWeBEQ==
X-Google-Smtp-Source: AGRyM1vVQNCn0lDIOXlmiuWH9hu97LddP6ByBprzSdnG895Ipzds+fvr8/ckrZFNKS2G4mOxnOvVLg==
X-Received: by 2002:a05:6512:3194:b0:479:68fa:8b7 with SMTP id i20-20020a056512319400b0047968fa08b7mr17625950lfe.129.1655832966284;
        Tue, 21 Jun 2022 10:36:06 -0700 (PDT)
Received: from [192.168.43.7] ([188.162.64.230])
        by smtp.gmail.com with ESMTPSA id z10-20020a19650a000000b0047255d211b2sm2230914lfb.225.2022.06.21.10.36.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jun 2022 10:36:05 -0700 (PDT)
Message-ID: <e90110b4-d3da-6fd9-9e3c-cda4666f00f5@linaro.org>
Date:   Tue, 21 Jun 2022 20:36:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] clk: qcom: clk-cpu-8996: use parent_hws/_data instead of
 parent_names
Content-Language: en-GB
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
References: <20220617122241.768736-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20220617122241.768736-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 17/06/2022 15:22, Dmitry Baryshkov wrote:
> Convert the clock driver to specify parent data rather than parent
> names, to actually bind using 'clock-names' specified in the DTS rather
> than global clock names. Use parent_hws where possible to refer parent
> clocks directly, skipping the lookup.
> 
> The ACD clocks (which were not defined before) are modelled using 1:1
> fixed factor clocks to fill the gap in CPU clocks definitions.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

A note to Bjorn (and reviewers). Yassine's patchset is superior to this 
patch, so I'd ask to use it instead.

> ---
>   drivers/clk/qcom/clk-cpu-8996.c | 139 ++++++++++++++++++++++----------
>   1 file changed, 98 insertions(+), 41 deletions(-)

-- 
With best wishes
Dmitry
