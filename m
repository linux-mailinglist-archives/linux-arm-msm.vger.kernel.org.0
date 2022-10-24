Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D41A60BBAE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Oct 2022 23:10:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229961AbiJXVK3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Oct 2022 17:10:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234202AbiJXVJZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Oct 2022 17:09:25 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0C9D2CDEF9
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Oct 2022 12:16:15 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id s24so3505366ljs.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Oct 2022 12:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+2as1mhURYl6ztefkLaN+H4eFtyrR60CAeO5HCD+7zE=;
        b=okg3KNpZOsQ7UwA4Yg7gl9GHgVeOiE1JT2FYl7qeiV5w7U1lrEkP9rS4AQYhIGSrbA
         x3uJm37dGqrPZhwoN5XiTi3OHZvmArT1eHyTo/wJ31A1gTrJ4p1QmPrTKowRN6E+uSO0
         3RBo4wZ3MwNZwZwGCcvzUV4zcJfJUIrxfPCh4H/0NOgBzqDWL++ar0dqKuXEZ6uo8JV+
         BX85Ib7Mem6FJPBQQBOfOXJvkSJvedFsZSskyxK05MFg2uNtX4Ksuo3Z37KSNSoKVasq
         2NydzkRsUdyHEZ35xKvYLL0R3bMbu8k9hIEZgOHgvkNzs7WUemBujEYFZRh3AVMCrdUW
         ssUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+2as1mhURYl6ztefkLaN+H4eFtyrR60CAeO5HCD+7zE=;
        b=i0zyvOcmRiY+z4cn1RK+BTs2X2KgUrhKYeGpHiFsqZxa59DdZlPOQlWxSiQF6h1rNX
         DN9Twu7qdlcHRqB9Fmbx+aCgmrHQmqFaVv5FkBIYSiWirVLT6TMV5FZlqcmJOiQzxC7Q
         g0VZ8eJfHn+N6A+fFuPfNqrorOc7PUvygm+uEvMDSuFzlspBExv1cj4yh4UUVHydvl+/
         dncoPI7jgSE4v4IyhPYB2m2mu5VqEW5OPqUbl+pbcYgiqCe+Syy+/09htca41tiSOJW+
         7cFmazXChjFQ2EFf5jblxFPJahCIkxHiI2ppFHx+jJ20mEPdaYI1QpXjphxfFrHaPQbf
         LWnw==
X-Gm-Message-State: ACrzQf11kb72I+Kqq7zYpJ+lYs/3MFff1XgmqhMMzLuBdSiSAlwkrWig
        ttowuXdH2YC2ZTYZjJtyuCMvIhPXZbApjhsU
X-Google-Smtp-Source: AMsMyM61FEPqaObKjORxFtXvRTGcSDTRzooCTowBzAoBkOFvhXvCx/oWfl/ICM45pj74XuOE2W80MQ==
X-Received: by 2002:a2e:8186:0:b0:26e:8893:fef with SMTP id e6-20020a2e8186000000b0026e88930fefmr12594550ljg.377.1666618434903;
        Mon, 24 Oct 2022 06:33:54 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id f28-20020a05651c03dc00b0026dced9840dsm4794607ljp.61.2022.10.24.06.33.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Oct 2022 06:33:54 -0700 (PDT)
Message-ID: <f27662ad-5798-720b-19b2-28bbf1b6a620@linaro.org>
Date:   Mon, 24 Oct 2022 16:33:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH 05/13] phy: qcom-qmp-usb: merge driver data
Content-Language: en-GB
To:     Johan Hovold <johan+linaro@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221024100632.20549-1-johan+linaro@kernel.org>
 <20221024100632.20549-6-johan+linaro@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221024100632.20549-6-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,DATE_IN_PAST_03_06,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 24/10/2022 13:06, Johan Hovold wrote:
> The USB QMP PHY driver only manages a single PHY so merge the old
> qcom_qmp and qmp_phy structures and drop the PHY array.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-usb.c | 239 ++++++++++--------------
>   1 file changed, 96 insertions(+), 143 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

