Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 21A6F7196D4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Jun 2023 11:25:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232712AbjFAJZJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Jun 2023 05:25:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232838AbjFAJYv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Jun 2023 05:24:51 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 313F012F
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Jun 2023 02:24:49 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-4f3b39cea1eso639710e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Jun 2023 02:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685611487; x=1688203487;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l67mFELnQ95kbBDf6A1lIfQC3w6WT7OnCfmvnOjywXo=;
        b=XK1cjGtLxZ5LBtefdHPG1FRjfnuDDWOqhcrS5UL0wuXLhvSIbTOsMd2j4Sz0INoHrM
         ExJTBMJXGj4ayH95V+S4eGBLw3Yx1X0A8Yvi8tgsgInZbRJczYwTsuJKNKcUJWnEP+19
         Ohj+PrnPlgClaC0RIk9gPPPM5NShuttADjGjG502gVKuvEeoRssu2kzKGLE5hfECGmov
         gjVyf52jlKHKwN2lVG2C/GxNh2TqOV5NhJX3jHJmvrjyxahoM0+VCctX1lVwUtEq874c
         spMy4KJySKc2olfoxJoi9/hB+cuk47R066u+o2wdbWPmlDfEBQpe9z+83oUOmpq0KqPG
         ZF7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685611487; x=1688203487;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l67mFELnQ95kbBDf6A1lIfQC3w6WT7OnCfmvnOjywXo=;
        b=XAfuYVPuRnvmfBALVKmKGzwd35jTupER47Ig/5vFDSHrE6BRmZDAFWRTtlDkRgSz2P
         HuGg50UgW/CEI6IRXIhufBdXkNgPOlX7awbWXY4OpS66gefYC0qTK6IDFnIalELJatKZ
         wHqTQCs/hCWB47mn5Iz9O1q7T4nib77fV2aqjfas45l3LAPef2f1QlrRiTVSPpLeB4do
         5Z5hlwRaRRo5a7A0ud4eKeWMxk/PesKX73jZljphupLg4nbqtIF92bdeXbG04u8VNnCB
         fhyucu8jzYW0XF9fZSwGIK/quh0ecCiIvo3HKXRDBeTMEVHFbUcR9DBUusvwRMNBFmT+
         hRRg==
X-Gm-Message-State: AC+VfDx28KInoymJQc2YbKBG7bfSIBratIu+aJk+PCr7AM4GXqw/8L1N
        GY1yyAE9UpCveqF5WduNoeDQ+A==
X-Google-Smtp-Source: ACHHUZ7HcjNC1bJcGD2PdyRwxkAxsYZQebckEFIFDjgvBwLLbC/nPA7T78B4LmWGk2j9nHbfsG9x8w==
X-Received: by 2002:a05:6512:4c8:b0:4f0:81c:73eb with SMTP id w8-20020a05651204c800b004f0081c73ebmr1014009lfq.42.1685611487409;
        Thu, 01 Jun 2023 02:24:47 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id w17-20020a05651204d100b004f13f4ec267sm1022689lfq.186.2023.06.01.02.24.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Jun 2023 02:24:47 -0700 (PDT)
Message-ID: <f4124824-7976-507b-278e-1b632ffd2c31@linaro.org>
Date:   Thu, 1 Jun 2023 12:24:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 02/20] clk: qcom: smd-rpm: Move some RPM resources to the
 common header
Content-Language: en-GB
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Leo Yan <leo.yan@linaro.org>, Evan Green <evgreen@chromium.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org
References: <20230526-topic-smd_icc-v1-0-1bf8e6663c4e@linaro.org>
 <20230526-topic-smd_icc-v1-2-1bf8e6663c4e@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230526-topic-smd_icc-v1-2-1bf8e6663c4e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30/05/2023 13:20, Konrad Dybcio wrote:
> In preparation for handling the bus clocks in the icc driver, carve out
> some defines and a struct definition to the common rpm header.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/clk/qcom/clk-smd-rpm.c   | 13 -------------
>   include/linux/soc/qcom/smd-rpm.h | 15 +++++++++++++++
>   2 files changed, 15 insertions(+), 13 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

