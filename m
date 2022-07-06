Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2EBB568E2E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Jul 2022 17:51:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233543AbiGFPuO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Jul 2022 11:50:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233522AbiGFPtX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Jul 2022 11:49:23 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BFEF2A960
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Jul 2022 08:44:04 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id e12so26601947lfr.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Jul 2022 08:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=9vQCQQEHozN/CKCyvBt3RmwrseBMzr8DZRLmrXsr6Vk=;
        b=xGdDsvCZ93HCAJQGgrVqKH9nd651H8wO6nk6g4ZSzMR2yRgrUVmzPa/elcZd5L4Lde
         /Q5Gpz1ztCxj5dL9sIJTvAn6vHVMtKGu0J0E9QX0TSZYY+FpxVy58hDP/FzALwaI8mxG
         d3poucFFf0vaghLZUf5xjAH0phOs+1BpzaQCOyYxObA0oxig9oPiexkeNhpb8dUdXVND
         l9h6HpaERJadAhRkq2s38orTXYCIqcyB+OpIvW2xAKZmYSjoanjd2tZrwtYp9rDf3U6n
         /aAO9zg3xkHYHk8xinqeW6k/82hKd6+360WBOFJiyprazmQoI9CkTWE1guV2/d+4Ts+L
         YkhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=9vQCQQEHozN/CKCyvBt3RmwrseBMzr8DZRLmrXsr6Vk=;
        b=pTrUJwvcMvNINUhkRr6lEAx+QJvkzSYKHhLClLojtef8ovbqdaZHHXSba/88Ix8P11
         34nSeBJzgOMx5ZxS5cNmMoaL5gdRsbHOfT947JBxYq0JT+mu+TWVUts2lIuLHudcmIj/
         uqnRt53ljhMnjeTjTt1vFkve8CExiKuqNhWH40aJco0uiMkB1d4+f+3+ndSLXmapIY8M
         kj6rOz+Y1Jc6mhEwzXykuRYRZLcw0rtcPvfZCghDf1Y5uepzzZ+FyqTvETNUFPtbZQK2
         wPF8NZnfJOuM3o5C84x3TBcP3zxPXcn+025nYSnTHjoRwl8JSf7A+C09XLJC6r0MgFlp
         4H7g==
X-Gm-Message-State: AJIora/hFulE2wX9MLwAwYOIL7aiusjZ8jtkKbxF7IdV0JnBM6m+b8Mt
        OqjgF7FJyYjBDu9M7yU7k1wTmw==
X-Google-Smtp-Source: AGRyM1tFVri7akrkvOuHoOv7M8H62ctTF43uQERPnuj8O45tl7BTZfj5hL5DTJ9KyKtLQDUAMl/AaA==
X-Received: by 2002:a05:6512:3e2a:b0:47f:7549:e3f1 with SMTP id i42-20020a0565123e2a00b0047f7549e3f1mr26431687lfv.386.1657122241371;
        Wed, 06 Jul 2022 08:44:01 -0700 (PDT)
Received: from [192.168.1.52] ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id e14-20020a05651c038e00b0025a7056f4easm6260769ljp.85.2022.07.06.08.44.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Jul 2022 08:44:00 -0700 (PDT)
Message-ID: <4e61ab03-6edf-c228-78c3-d250e36e8556@linaro.org>
Date:   Wed, 6 Jul 2022 17:43:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/6] arm64: dts: qcom: sc7280: use constants for gpucc
 clocks and power-domains
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20220706145412.1566011-1-dmitry.baryshkov@linaro.org>
 <20220706145412.1566011-2-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220706145412.1566011-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 06/07/2022 16:54, Dmitry Baryshkov wrote:
> To ease merging of bindings and dts files, the constants were replaced

In the future I recommend just adding defines in top part of DTSI (under
ifdef not defined). Then when time comes, you drop this entire piece of
defines which makes it extra readable and easy to review. Nice clean
patchset.

To review this approach, I would need to check every define if it
matches the previous number.

Best regards,
Krzysztof
