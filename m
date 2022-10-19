Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 819006046CC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Oct 2022 15:21:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232218AbiJSNVM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Oct 2022 09:21:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231985AbiJSNUo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Oct 2022 09:20:44 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E236BE37
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Oct 2022 06:06:04 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id j23so22055749lji.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Oct 2022 06:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hkU5CJVPM8w28zvAmjVOcpJHc9WnxNS4s4QHzh73UBg=;
        b=wBHcNPDSnkO2WOpz0CAH3Sb1gJ+6t3XqfwkD0wY+R02Q4IL41mVxMnivcPc/eWvaeR
         BaEy8xcpTg1oU1QCvhd31rl9xOLAbiFgrZUgnlwMO/gD4zk8H1nBo/zaDzNWJ4bdc+Vq
         rJBQ+ITqT75A27ANpt2MzFIrn/4GcfqIGc/hMPGjCc/RLMuY/frR5IWJq5UgQwzHI2dN
         sdxHneSTJDvX34BmvdqfiSbvYjdxKEajnq8jdNT82jKih22rMlYu/d2kxM6Ble4Q+sbq
         j37NUEhrubwIgeFkI/zxTliXr94Dt/JrRnLFJoXXY6FQK+O7WvmH1lYTArHKLWIxVLsb
         Gz/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hkU5CJVPM8w28zvAmjVOcpJHc9WnxNS4s4QHzh73UBg=;
        b=rDOqoOaouYS9EfdRE9MbPJak/aWG2Odkq+wOk/oWM7P7QsUFX+3XZ6ZfWg9G0Upxf7
         X8smFK1W1fxlofPEcinop5y/+jsiWf9FANwP/nI/7zp3BeIhM6nGDNDzCKTwUX3JAfBl
         0elcLhGsBdbJYwGNfhpr+9JQY1w/vGdMkr1gS7nrclATi7qQ/LWrQZruMTPhRusjD0xQ
         vWzs9g+93UaimlJiZ98wXXuwTttJ5FTMy0MKUKz0akKyX6538UzqJu02Lt2p9rqgvzZW
         20krFIiKH2rvG3rgxHPTDSa9d0g2pKaoirHAwijBHARQspkVRNMmmFFAI2/Jnv2X6pJi
         cWMg==
X-Gm-Message-State: ACrzQf08XmtcRHBB8fiLBkEYMqFlc3gW8CyKlG2xWa3KuX+S2AGkuvzG
        pQBnm22XKHEdQ1yi44U22gULvA==
X-Google-Smtp-Source: AMsMyM7FMyQvAw4FpSNfLyO514H2NhzJIoPo24uC4C7rLWtdWW9cjLPlFh8qlplgz0nvbbB0dk5ljg==
X-Received: by 2002:a05:651c:178d:b0:261:bd23:a5f8 with SMTP id bn13-20020a05651c178d00b00261bd23a5f8mr2683157ljb.411.1666184758489;
        Wed, 19 Oct 2022 06:05:58 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id n28-20020a05651203fc00b00494643db68bsm2285934lfq.78.2022.10.19.06.05.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Oct 2022 06:05:58 -0700 (PDT)
Message-ID: <58e2f639-b764-6712-2072-5acb0fa2cd93@linaro.org>
Date:   Wed, 19 Oct 2022 16:05:57 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v2 06/15] phy: qcom-qmp-pcie: rename PHY ops structure
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
References: <20221019113552.22353-1-johan+linaro@kernel.org>
 <20221019113552.22353-7-johan+linaro@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221019113552.22353-7-johan+linaro@kernel.org>
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

On 19/10/2022 14:35, Johan Hovold wrote:
> Rename the PHY operation structure so that it has a "phy_ops" suffix and
> move it next to the implementation.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

