Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB6977197EE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Jun 2023 11:58:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232045AbjFAJ6H (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Jun 2023 05:58:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232094AbjFAJ6F (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Jun 2023 05:58:05 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F7ED137
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Jun 2023 02:58:02 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-4f60a27c4a2so260662e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Jun 2023 02:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685613480; x=1688205480;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5e5HiqWT3PuEndgMVrCpwqNzZMHcz9XeJvxwN5OYRzI=;
        b=XSJSjXRWZS7z8OxxKAH5wOaem+pMPX5kL0B01c3pxaQzcwlGolZLtSxeWKBD4795RN
         TXSJzMC4Gr5Nqwn1LzA5StMm2NNSNfu9awfLhcogvoXkaha37Ovkh6WVJhesWDO68tqw
         TDXeekQOBe2gyM+swZ40xmn9LZ054x+qMoBGU1llz3aihf2W27ZZe5s1L3nfEiU/79Mg
         k8+REnykcEIB1ntWeNCriY321c6K06Yq1Va4LNy7QZ3nYFXTxKQgxaMP0gu/7myhwnQP
         n0YCgs3Tn5xmvHiEF7gBAaqMK1dw2FgzV23tT0Rt9tje4MUDIBPqeEuWom6EwIVe/VZj
         3mZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685613480; x=1688205480;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5e5HiqWT3PuEndgMVrCpwqNzZMHcz9XeJvxwN5OYRzI=;
        b=Zjuuk5wtOmwmgH23r+lj3UomHs3mktKkntY8FCoKfclyI3NBN8Rn6fKXD5sJvOy4AM
         Yi/jr9ygs5lIwxKoxGNk6iqavht3FP31s+tiemZK3A/UT0qTI2oI7uXxDUjYCaChXL8s
         6Fed7e4WFmR4+TWBvCoHBnnuzQ7j4dERzfc5hKKAOrW4tgWabKPdLPGvddn4c7O4TYbV
         AYcKVGIm7n6VH8VYS76Xfwu2mobwEaZ3CWC4vbYitcgLitUQjUoYmrpXnQPXAoCt4e9N
         M78nAbS6zqZQ779q/ShjO4oKqbYKip0iz7n+sqHIIoFjgpNxRNuoqj48c1MjJSgETbAH
         olwg==
X-Gm-Message-State: AC+VfDwMKSNgVshREANiV+p/f8dO6Jtix9drR6RX463Isk0DgOcjnHoq
        5Z/pjXhHOjEr6iS64bHD0Ku2+Q==
X-Google-Smtp-Source: ACHHUZ6UHaajeYnFYWzR+O3b0DU37PtYgsj/rbM09U+XN9FEtXqKfa42YaeeyysIs/IQLb3ykQ4FbA==
X-Received: by 2002:ac2:4c14:0:b0:4eb:42b7:8c18 with SMTP id t20-20020ac24c14000000b004eb42b78c18mr1198608lfq.53.1685613480289;
        Thu, 01 Jun 2023 02:58:00 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id b24-20020ac25638000000b004f3a1033078sm1027774lff.52.2023.06.01.02.57.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Jun 2023 02:57:59 -0700 (PDT)
Message-ID: <ea21f29f-482e-1dd3-12d7-b9f685b1d5dd@linaro.org>
Date:   Thu, 1 Jun 2023 12:57:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 07/20] interconnect: qcom: Fold smd-rpm.h into icc-rpm.h
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
 <20230526-topic-smd_icc-v1-7-1bf8e6663c4e@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230526-topic-smd_icc-v1-7-1bf8e6663c4e@linaro.org>
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
> smd-rpm.h is not very useful as-is and both files are always included
> anyway.. Combine them.

If we ever add interconnect driver for non-SMD RPM platforms (like 
MSM8960/APQ8064), we can just ignore the smd part.

> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/interconnect/qcom/icc-rpm.c |  1 -
>   drivers/interconnect/qcom/icc-rpm.h |  5 +++++
>   drivers/interconnect/qcom/msm8916.c |  1 -
>   drivers/interconnect/qcom/msm8939.c |  1 -
>   drivers/interconnect/qcom/msm8974.c |  2 +-
>   drivers/interconnect/qcom/msm8996.c |  1 -
>   drivers/interconnect/qcom/qcm2290.c |  1 -
>   drivers/interconnect/qcom/qcs404.c  |  1 -
>   drivers/interconnect/qcom/sdm660.c  |  1 -
>   drivers/interconnect/qcom/smd-rpm.c |  2 +-
>   drivers/interconnect/qcom/smd-rpm.h | 15 ---------------
>   11 files changed, 7 insertions(+), 24 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

