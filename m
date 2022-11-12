Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1449B6267A5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Nov 2022 08:32:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234515AbiKLHch (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 12 Nov 2022 02:32:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230043AbiKLHcg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 12 Nov 2022 02:32:36 -0500
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7A132FC21
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Nov 2022 23:32:34 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id l8so6820117ljh.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Nov 2022 23:32:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pBE8mTVZNOCDexI2LZd9kRkhIvtiQCngd0IeOQt9iqo=;
        b=rli1ruYmdULOcEGpSwKzzw5kMjZOc0pjMS+AjAVFNlkDSsbEGQsGcBmpcPeFfcwE0U
         ByUtU0uOgMj87JYi4cXmyvZ8hpZ8cxyS32cO2rhRydP56Buk2wbnDVlBi8U/ESflGVMR
         LRR59Oem7kFtvyclqcW6+s80xcO5BI+uzm21B/mUFWkemHrWsNPMRrfpSUu+aspIMfDf
         VL+a9jK+iuKMi/6miaMJbG6fpEMbFD9g6nPx643M0ksOTUQrtf1coJjhf7O3AmA8Tk8K
         JXbylbKMwKF+pED7rB+EzSSOhqInsM0rDdNQDywXC1Q7iuJBtVneb1JeJCRXV/xee7mW
         rgCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pBE8mTVZNOCDexI2LZd9kRkhIvtiQCngd0IeOQt9iqo=;
        b=cAGIHAyg7nPgrd9TMr2yrQemz4qzEVPZqcTDUBxn2p8rkwGIaq5Je4aLTdQ/0sZA1G
         oTFEyBGc+W5ByHLDQp2tU7HXLuf3LU6UmphqAmOYM7rVhBT8q0odcwtYYr0GDi+eCVi0
         Io2YEdS5+RrgxKDZWJOa/4KRIWx34ixQ3SNiYOy3tijBIt5rqgpin4m8zKqqzGT/sSwH
         ayc01kll+/vVANy+WWQ+Bq26M5l+2t2AAId+onW8XJf5ay73LWXn/rlB/y9zJrH8VK7m
         SWTS91d6KCqr1iKeuR133NRx0DdVNkTn/ibcwt+xgebBOmlkcPYAttp5oraO2MEJIw7J
         PsiQ==
X-Gm-Message-State: ANoB5pll+5OcfrWleUgE2dya1MJKHPVu1KhoDsfcBQaAtfkQvMGLHy16
        6AjDfLaClKstsD4bCVATm0dYtrhxyq2TNbUY
X-Google-Smtp-Source: AA0mqf64GHv5fPsVLYitVzUKEc52bQfCAC+HN/3kkGC9Ix+S8fK2p2bjIX8hlXNOgyR4F6ymnSq4EQ==
X-Received: by 2002:a2e:b705:0:b0:277:1c8f:7e8c with SMTP id j5-20020a2eb705000000b002771c8f7e8cmr1752443ljo.296.1668238353012;
        Fri, 11 Nov 2022 23:32:33 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id t13-20020a19ad0d000000b004946e72711bsm734062lfc.76.2022.11.11.23.32.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Nov 2022 23:32:32 -0800 (PST)
Message-ID: <82d49d67-d012-fb49-9551-6cfaa06e8ed1@linaro.org>
Date:   Sat, 12 Nov 2022 10:32:32 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH 10/22] phy: qcom-qmp-combo: separate USB and DP power-on
 ops
Content-Language: en-GB
To:     Johan Hovold <johan+linaro@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20221111085643.9478-1-johan+linaro@kernel.org>
 <20221111085643.9478-11-johan+linaro@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221111085643.9478-11-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/11/2022 11:56, Johan Hovold wrote:
> Separate the USB and DP power-on and power-off operations in two
> dedicated implementations.
> 
> Note that the pipe clock is only used by the USB part of the PHY and
> that no DP configuration has a pcs (or rx) table or has has_pwrdn_delay
> set.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 100 +++++++++++++---------
>   1 file changed, 59 insertions(+), 41 deletions(-)
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

