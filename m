Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E0864A5940
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Feb 2022 10:33:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236019AbiBAJdT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Feb 2022 04:33:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236014AbiBAJdS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Feb 2022 04:33:18 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1E25C06173D
        for <linux-arm-msm@vger.kernel.org>; Tue,  1 Feb 2022 01:33:17 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id k18so30749211wrg.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Feb 2022 01:33:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=zy6K8PUDmgs77Or+qsmZ28H775spNrjL3whUVFwVhGY=;
        b=j0euv2Q6EvcqdtFqlPCDtOcFaVMCFTKpwOLm7pMxcgkHpOrwiJOFO7H6H8m5LnEKRy
         O0OZRmomprLMLC0SKYBF2bTA6h6z+gZ45hOAxgAz1OzSTLDQKFUN7yvS2xvVc75/phF9
         VH7JNkYgLgM1jOWDTfCWzu9tj5bXYgkl9LcdM0fpbwsUuXuUrej+4rAVG3MiAi7cY3Zn
         SRcvhU5JfN3f9Lq/70adaPdO+tczMqDsNHhs7tA8qGPVGtADqnhYZV+6yC4oA+lJCQ2t
         lGz/bz8bPqqh/Wx27mUizLroq4JLtiNylYf9WUhRUh00jygPPaUr9cz4Rak6q59h569/
         GJmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=zy6K8PUDmgs77Or+qsmZ28H775spNrjL3whUVFwVhGY=;
        b=q2jiUbuUAHyfbT0VBDhlimE2hxDp09UQxQrDf5iDcVk1OMTi7wnbpc3DNsyppcNmyd
         2Jus76tASxQKIvDoau2XrsvbOpDpmiDxlYeDT5wg5kz6/ALq0CrRjBMbWlWaJMVZsI2P
         5huXtjRFqNI/v4qG9X6pBvT25oJMlYxKSojWI2NhbWqQelB1EbVkZWAgfwW4K1qlx9kE
         EYw1SI6/SvaGQvRJYtC9Dv0DHOTSnJbSmFfA2mz4KQZq8SdwUdKTJq9uWRqaX3k6CQH3
         JQ1WBp7svZ+rLX7YpYfre+UpLg/TfhKyMKxaTVHQCgOZwOdz64qwPL6O/VabB5seePJO
         UXiQ==
X-Gm-Message-State: AOAM531pWfjGirc9uYvoiW/KH3Fa/tF4RO+VeneUhB6/aT0BcL1I5pwO
        s0mTQpWp6tPiS8Yitu3+JlKGyw==
X-Google-Smtp-Source: ABdhPJx9oPrI6TQQgTcpzGOEmXTJDaoJx3+V+lDv5Yu1O3x993RA0tvYhXcqGz+d3y4Tw8M5td6LgA==
X-Received: by 2002:adf:f9d2:: with SMTP id w18mr20679586wrr.588.1643707996349;
        Tue, 01 Feb 2022 01:33:16 -0800 (PST)
Received: from ?IPV6:2a01:e34:ed2f:f020:accd:30fa:dc2c:eeeb? ([2a01:e34:ed2f:f020:accd:30fa:dc2c:eeeb])
        by smtp.googlemail.com with ESMTPSA id j19sm1676678wmq.17.2022.02.01.01.33.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Feb 2022 01:33:15 -0800 (PST)
Message-ID: <95f9828e-df26-78e1-8c1d-6fb7d471e560@linaro.org>
Date:   Tue, 1 Feb 2022 10:33:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [Patch v3 1/3] thermal: qcom: lmh: Add support for sm8150
Content-Language: en-US
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Thara Gopinath <thara.gopinath@linaro.org>
Cc:     agross@kernel.org, rafael@kernel.org, rui.zhang@intel.com,
        robh+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220106173138.411097-1-thara.gopinath@linaro.org>
 <20220106173138.411097-2-thara.gopinath@linaro.org> <Ydd8DAAEClRcklTy@ripper>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <Ydd8DAAEClRcklTy@ripper>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 07/01/2022 00:32, Bjorn Andersson wrote:
> On Thu 06 Jan 09:31 PST 2022, Thara Gopinath wrote:
> 
>> Add compatible to support LMh for sm8150 SoC.
>> sm8150 does not require explicit enabling for various LMh subsystems.
>> Add a variable indicating the same as match data which is set for sdm845.
>> Execute the piece of code enabling various LMh subsystems only if
>> enable algorithm match data is present.
>>
>> Signed-off-by: Thara Gopinath <thara.gopinath@linaro.org>
> 
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>


Applied, thanks

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
