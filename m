Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53ECF686571
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Feb 2023 12:32:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230366AbjBALc3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Feb 2023 06:32:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230520AbjBALcV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Feb 2023 06:32:21 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FCBC6184B
        for <linux-arm-msm@vger.kernel.org>; Wed,  1 Feb 2023 03:32:18 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id v13so17321437eda.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Feb 2023 03:32:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DlwhsXjEnUWBuvOS3y+L+yIP8gcjGDDxDY/9YpgT1J0=;
        b=Fin4rOBsEx26VggqOY8HWUDZaTQa2KzJgc5TKFyFI+llcywDd9NGM8+LKu6WX3VsmY
         cw80R6DELBl+LsMbBriHOTD3wRrRBh42RpNIkx3jz+mon75vXxKKTbzJQPBnh7gFvLM8
         Fomue/Mv1ig3P0/J4pibs4U2+hOlkY+951MGmQUcn3TQrb0DnIqjk08KigQyrBvJccgD
         adVZU1e8paz2dydAdmZ8HByWG1+ByE7kHq1kais/i2c4wuS9Sh/KeIZKcXu7lA2LqJDC
         iLsypLAHf4fHbC3Wt+8NfDJgtOQvZUxlXstUIWWFVzeF/FZPx9lXqrv7roBKa6YBjMqb
         ZLxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DlwhsXjEnUWBuvOS3y+L+yIP8gcjGDDxDY/9YpgT1J0=;
        b=M4tNYNF7fqtvGrlsmIrWzbRtqAdZ/vB/kIOtzsnpGhsZk5bwDbxMtMW0vX1Hm4p839
         pi7aU/QjkHUvs8FFpOdtZluK0Apgag3iQzXBIy+4VVtE3VFbVy1JBmls7Ttg7E37nuFB
         +ePo5Lclar3AX3vPhR6mLHbBKjLN6TGJp3Po51oay7ENIWHqEgWcvAkBDVa4qKXDIOl5
         JoCwYub6YhApFAQwUzQ3jxxZjc5VWtHmd5DBBn9aV5fvhk3Z0TnEKJwt5G0Zd727hhZp
         xLYd5LNaH9wHIsNd61dRbCqOJpVlEDh+qIVovQ/3pSG5GFUc/MXO3omJibIUI+QmRYBi
         m42A==
X-Gm-Message-State: AO0yUKXmXdAOIdOnoLzYP76aPW8nM609mjd29o01MrlYA1JV3fZ/Gp7n
        clnYsUbF69p/kb/giIfHptFaLw==
X-Google-Smtp-Source: AK7set/FgWtS4x+n2SnGkxpJIErFGVtXW/VeFv+kvHRT8+l3UUvA9cr+9RdFCfSqxeyqWyowBKz57w==
X-Received: by 2002:a05:6402:1c84:b0:4a2:64eb:26ea with SMTP id cy4-20020a0564021c8400b004a264eb26eamr1684943edb.42.1675251136653;
        Wed, 01 Feb 2023 03:32:16 -0800 (PST)
Received: from [10.10.15.130] ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id j23-20020aa7c0d7000000b0046892e493dcsm9669024edp.26.2023.02.01.03.32.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Feb 2023 03:32:16 -0800 (PST)
Message-ID: <515f4e9e-2804-e03a-26f5-f2d3ac331109@linaro.org>
Date:   Wed, 1 Feb 2023 13:32:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/2] PM / devfreq: qcom: Introduce CCI devfreq driver
To:     Jun Nie <jun.nie@linaro.org>, myungjoo.ham@samsung.com,
        kyungmin.park@samsung.com, cw00.choi@samsung.com
Cc:     bryan.odonoghue@linaro.org, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20230201080227.473547-1-jun.nie@linaro.org>
 <20230201080227.473547-2-jun.nie@linaro.org>
Content-Language: en-GB
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230201080227.473547-2-jun.nie@linaro.org>
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

On 01/02/2023 10:02, Jun Nie wrote:
> Cache Coherent Interconnect (CCI) is used by some Qualcomm SoCs. This
> driver is introduced so that its freqency can be adjusted. And regulator
> associated with opp table can be also adjusted accordingly which is
> shared with cpu cluster.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>   drivers/devfreq/Kconfig    |   9 +++
>   drivers/devfreq/Makefile   |   1 +
>   drivers/devfreq/qcom-cci.c | 162 +++++++++++++++++++++++++++++++++++++
>   3 files changed, 172 insertions(+)
>   create mode 100644 drivers/devfreq/qcom-cci.c

Could you please describe in some additional details what are you trying 
to achieve? Should the CCI frequency be scaled manually or does it 
follow the cluster frequency? Do clusters vote on the CCI frequency?

I'm inclined to ask if it is possible to shift this to the cpufreq OPP 
tables?

-- 
With best wishes
Dmitry

