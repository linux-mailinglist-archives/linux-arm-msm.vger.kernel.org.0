Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D4055FCC3A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Oct 2022 22:42:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229933AbiJLUmG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Oct 2022 16:42:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229871AbiJLUlq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Oct 2022 16:41:46 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5AD2108DE8
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Oct 2022 13:41:18 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id bu25so27486133lfb.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Oct 2022 13:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zhIhDVAW97twCZ5MabuY2Ud1J2BRwr7Q3gcJPzfiaEk=;
        b=tY823eaX9qaerZcByxSCq2osg6Lf/C5tVZOcbk+7w6oMH2Yb3eXKepAmmFRsxdQfmL
         msXjMQQC8rPz+4rmbII1HicOWeLPBxxR+O8v7To0wVTXM9JNXwq+9UOpFnUmEqzlSDPm
         qB7hJ9jQbsDXaHaCtXozTdI5udkBZ6XONT1aLVmt/52+9ODjbTqvwr4zNJXYQuwRr+pl
         xQNYWDid92w8r7/fWf2z2b/zH4vcNecDUw8HpQIwFjzkTL4QlZOwEUK+XF9ToYLirEDe
         anERX8ikS0QWwV2ptGuGQXwdSiYw+D5zJi2naA7wX5MQNW+AvVfTvcyLuelxW+rbvgyM
         093g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zhIhDVAW97twCZ5MabuY2Ud1J2BRwr7Q3gcJPzfiaEk=;
        b=knVodyOYAIngr5V/B5Rf0q5YNfEpiEqMX+RqILo7RTUq9BFoYxylvftccZ8RR58X00
         w8FsXOFR7mxN4Fr1wWz5q2JMvj9YAEMHGOZqTy/JN+ZUocJnqXZKywyGAxACn58f+tp9
         H+dzG49mmueWq+R2LJC3SNriG7Wx1Msv9Von6xlXeckNaO8XBdjuGxfrIq+iJYJunmRi
         dSuQ9NI/rMLy+rvmEmeRtfme5MKJLR0lh/yxjtsBQKQ1HRH4G0O9rYEuCUktqwrf7d10
         VliYsCGO35SiLyxcZXsf91zJc8qfYlShRsqzKf8SnRcbKkuEXYs+WaLqr/mb9PiroW8+
         SFyg==
X-Gm-Message-State: ACrzQf1lAXYtUQnJZ37P9rW8QCfjoUEDZ1E+Aa2O9QfauqVy91BH9x4H
        x4e7jY7hYc7XS/ZZ1m37ZlmT0w==
X-Google-Smtp-Source: AMsMyM7BZl+KItpQHc4Q5ULHiFXjULZdB5o+YQoucUFZJK4MoeNepvpiWO07gZm3CSiyDLBss75QuA==
X-Received: by 2002:ac2:4e0c:0:b0:4a2:4042:8698 with SMTP id e12-20020ac24e0c000000b004a240428698mr10713490lfr.170.1665607266941;
        Wed, 12 Oct 2022 13:41:06 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id b16-20020a056512071000b004a27bb1ad62sm93941lfs.205.2022.10.12.13.41.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Oct 2022 13:41:06 -0700 (PDT)
Message-ID: <24474f58-c513-f3f4-380a-e09b5e0cb30c@linaro.org>
Date:   Wed, 12 Oct 2022 23:41:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 11/14] phy: qcom-qmp-combo: drop sc8280xp power-down
 delay
Content-Language: en-GB
To:     Johan Hovold <johan+linaro@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20221012081241.18273-1-johan+linaro@kernel.org>
 <20221012081241.18273-12-johan+linaro@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221012081241.18273-12-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/10/2022 11:12, Johan Hovold wrote:
> The SC8280XP combo PHY does not need a delay before starting the USB PHY
> (which is what the has_pwrdn_delay config option really controls) so
> drop the unnecessary delay.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 4 ----
>   1 file changed, 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

