Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C01C8626777
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Nov 2022 07:21:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234724AbiKLGVV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 12 Nov 2022 01:21:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234116AbiKLGVU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 12 Nov 2022 01:21:20 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 527DC6035C
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Nov 2022 22:21:19 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id s24so6716703ljs.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Nov 2022 22:21:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mFeNrqQl5J9ANlETlekblWE28Ck3TgYP7FWq4RbjmOc=;
        b=z8xbufEHC7dDTyTo7nCI0VL7+cOzUpISCkTg9g6nfclTGY/rLMlVCyUpVjNufzxA2n
         AufmxD/mli5tFB8qL10hL5Pz5NhnvlIKhY55JEeVa+3lbz2YmI1RJAC1pe5ru+XWosFF
         9myCMg1FzgLsBMJW4WA3r1RX61oDiCJaNIdqW+GB+gi8WnQWZuyOeuqRnBARykFSBmFF
         PJhcu12+pz/wIRQ8Lqgd7vPSpawX4/5VUeq+Mnc8ii7anvye3PCpJwrkryJTj3bK5cf2
         gTQqDpZL6MyiVzWOuDIfg+j52DI1aT6/nbHWkynRr0SJwzpOyNDtF00d41VW/7RoDMx3
         6ljw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mFeNrqQl5J9ANlETlekblWE28Ck3TgYP7FWq4RbjmOc=;
        b=DciZCMZL1uqhvBHijmbEsNfLeIDWvxCaawvGssC9WXb5sHTYSWl3hDmjHIQVS/UMNF
         dYKJanpxR4RwMQYRYmA+ovXMulS5EDrjn3KA8Wjldeq1COYZPx8jngP7JasRx2Yfh+j7
         jSTcCz+ovLGXNbXk7ZI9DisIsDG1Ifwh8I9P65D1iD/AvstRWyXoiDptgdIciSyYxZOE
         ysZBzMuyPBAvIIoXdkWqn6i2nl6LSPEwA0xWSoDqeWt0PHENfa3oql77hQdW3g19A+KB
         t9wIGCnyBmuFzK8hn1jQKKBD+/aXhSnG2oFKCUQ6G3szSy4iVp22+/aQIzlMigNbK951
         1Acg==
X-Gm-Message-State: ANoB5plOQyB5RF7IRtu19VLpLAQNNfZDN6YW53VxLmwrXmYRffr59rQ/
        arenzTXigGKDzPm6PiB08yH7EQ==
X-Google-Smtp-Source: AA0mqf74UZa+MPXgy2g8PwliOetw0zLHzqxSEB/7IKKUAz9HX8DzXoKU97uy/uj8aISeES2W6JuU2A==
X-Received: by 2002:a2e:9dd1:0:b0:26a:c77f:57f8 with SMTP id x17-20020a2e9dd1000000b0026ac77f57f8mr1438016ljj.465.1668234077746;
        Fri, 11 Nov 2022 22:21:17 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id bi30-20020a0565120e9e00b004acb2adfa1fsm703312lfb.307.2022.11.11.22.21.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Nov 2022 22:21:17 -0800 (PST)
Message-ID: <a980d73d-b6ce-53b4-e9aa-c9be558afb37@linaro.org>
Date:   Sat, 12 Nov 2022 09:21:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH 08/22] phy: qcom-qmp-combo: separate USB and DP init ops
Content-Language: en-GB
To:     Johan Hovold <johan+linaro@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20221111085643.9478-1-johan+linaro@kernel.org>
 <20221111085643.9478-9-johan+linaro@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221111085643.9478-9-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/11/2022 11:56, Johan Hovold wrote:
> Separate the USB and DP init and exit operations by calling the common
> initialisation code directly from the USB operation and adding a "dp"
> infix to the DP callbacks.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 36 ++++++++++++-----------
>   1 file changed, 19 insertions(+), 17 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

