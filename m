Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C26A719876
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Jun 2023 12:10:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231942AbjFAKKj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Jun 2023 06:10:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233436AbjFAKKJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Jun 2023 06:10:09 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EFEAE42
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Jun 2023 03:08:49 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-4f4b80bf93aso723709e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Jun 2023 03:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685614127; x=1688206127;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kYo8BRl5LkkQXi3mYOgwIwVJRno87626SaL9vwHSxWM=;
        b=LYa5l9f+Co4mqxLciHYmPqSTu0vn9mtS7s3xt2p4yR/EvZmDTHHVjN9r8koGe/yfBs
         BaLczKu0EPtcUXAjTsHitxB/7fAR0Lhveg8+Cr3YdioC8SQqCpUxgX0jdKtzkHK6s9OG
         T+8qtMgIQCJjSon5oofyMR3UMs4h2SxAeVzbCp3RPCVeipl+aYJyfmO/NTxuhdtP2Fj5
         3ROO0jiH+i1mR0thj6g56VxHcA/P05/+t+AOp3NfD+UIWFHUUXRo1yB0DqgU4J7KkN97
         +L0PrClNEpqxUezuWyzgFiPcI4kv92P8DT4JKRut7s5hHb+/LR2f6PACYuhUpLzOtAcD
         fA3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685614127; x=1688206127;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kYo8BRl5LkkQXi3mYOgwIwVJRno87626SaL9vwHSxWM=;
        b=gcRZ+7Gd258Y0IwgJY+peYAApdM99pPSoxvSEod02nC+eS7g/5KPMQOoUl25ibfxxO
         eG8T/fWdgTcgWTOQyQsh2v9DwYiBAa7L4kjVYwi06HXY8pjIKuzguNP/JPZ5L2TtWxbp
         WHddK1N5Il74Wng8m8WK6qy0cn1xaKpfTpshmDxw9TAx5AWY3oLwrOOlUehRo5Mk5DuB
         NSxpSFICgRHmrhSACkpAVUBjEnIns7lWYCs0fTTnOxpQTHRnqhnXQ3z8wXlFVRCQYz20
         FOGTqsXl3OJ3OimnLrTeouu6YfmreZWbIgp/NeUxhe18lBxuibgRq2NNsD9Bh+aq4syA
         fvUg==
X-Gm-Message-State: AC+VfDzC2RmwCgGEmXS2XQHlhS1RKpUEOVg3cBhUpz68LtPB+9zPaC03
        hMw9qx3s8Ap/Ei4oxZlUZdEn0g==
X-Google-Smtp-Source: ACHHUZ67/smOf8ihbVtI+96ZqJH8SqDguoqxhAr6nWP7ZgonkmQvW270cRUoj0abDxlenEg3q9kV2Q==
X-Received: by 2002:ac2:518f:0:b0:4f4:d45d:1616 with SMTP id u15-20020ac2518f000000b004f4d45d1616mr1015233lfi.67.1685614127627;
        Thu, 01 Jun 2023 03:08:47 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id l3-20020ac24a83000000b004db3900da02sm1037672lfp.73.2023.06.01.03.08.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Jun 2023 03:08:47 -0700 (PDT)
Message-ID: <327d8f65-f6e8-fbb6-a159-2db424b29b0d@linaro.org>
Date:   Thu, 1 Jun 2023 13:08:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 11/20] interconnect: qcom: sdm660: Hook up RPM bus clk
 definitions
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
 <20230526-topic-smd_icc-v1-11-1bf8e6663c4e@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230526-topic-smd_icc-v1-11-1bf8e6663c4e@linaro.org>
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
> Assign the necessary definitions to migrate to the new bus clock
> handling mechanism.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/interconnect/qcom/sdm660.c | 5 +++++
>   1 file changed, 5 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

