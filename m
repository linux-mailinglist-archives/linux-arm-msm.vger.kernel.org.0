Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8EBCC714CEF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 May 2023 17:24:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229726AbjE2PYy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 May 2023 11:24:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229899AbjE2PYy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 May 2023 11:24:54 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35D76CF
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 May 2023 08:24:52 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-3f6cbf02747so22375805e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 May 2023 08:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685373890; x=1687965890;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5f2zChfvlBZctjKm0/pngMUzptIbe3EwKOOWokiV3IQ=;
        b=s/jI9GfN8C1Y2+mzyegw9mEoyvchpNPrA0da2GD6i5E9Z4yjRTV+9EsYPtxfrC5E2m
         bIMVyNKcmkau9co9ufuynSRNwmNeSqlkR3/i/LnrO0K2hd1xBiVnrDRuTH6UgFulv0uY
         4R92MAAazxh1oE8xEwcpACWsg5QecRCuRgJwj8KMkXx0h9eyU80gCDbLMzY2wJno7cSz
         FxZuEFtlotwErpOnxZlcyV56HedU270it60UkUSYa/175L1xaZl/vY2VNcT4a8bdQAVV
         wMJBiDgfNCmxYCDdY3499L+PT25LjvxPM1pTC8+fj8ycGL41bbvm9Gxh3iPqISLZAfvv
         oKUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685373890; x=1687965890;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5f2zChfvlBZctjKm0/pngMUzptIbe3EwKOOWokiV3IQ=;
        b=ax2PPWZUqx5pUJbZbOB4tQH9F8dOP6KCeDzLj/vDffLZ6C1DlWx4RanX3VRyk76kAS
         bInX/vKV9TYVKM8lXveTKDCTDgZLuM72+nmyzeYiT1ErJXBycd0CdJ/LMXQkWesM4TVh
         fK3dUsOjluN3cOy6VwON1k0bG7vr+TUxEQ09gPGE6d+ttTjeqemib4MAvTa6f/OUR/0i
         c0myi7yg0aJUtFG33Mo+ltg+BtePhlLo+Ifb7aKwizTI8gZe/zXk2/7t/xAnMyDUunBp
         eHKgOAmDfH4HMbZR4bynDjQtBCB6oFRx83u1aYuDXCjE+VzJ9cOHl1EN1OYXVzdn//e/
         FrxA==
X-Gm-Message-State: AC+VfDzK8Yk4X8UKLAz0mB1JIjvqYf2zJndAM1+RzLY7i7ld74w3Szl1
        1yU5i34eI0LwbqYxJqyCdWQOQw==
X-Google-Smtp-Source: ACHHUZ5WSGcFvoPKyN+6LJwYLNMQhoLXY+frrzHtAP3t+4MB27NlW4Y9llMxwOVgwKAmcVSPNusp2g==
X-Received: by 2002:a05:600c:a391:b0:3f7:5d:49fd with SMTP id hn17-20020a05600ca39100b003f7005d49fdmr3666424wmb.1.1685373890587;
        Mon, 29 May 2023 08:24:50 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id p25-20020a7bcc99000000b003f1751016desm14619126wma.28.2023.05.29.08.24.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 May 2023 08:24:50 -0700 (PDT)
Message-ID: <17f31258-bc38-245f-532f-fdaa1ee8ad33@linaro.org>
Date:   Mon, 29 May 2023 16:24:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 4/6] arm64: dts: qcom: msm8916/39: Clean up MDSS labels
Content-Language: en-US
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230525-msm8916-labels-v1-0-bec0f5fb46fb@gerhold.net>
 <20230525-msm8916-labels-v1-4-bec0f5fb46fb@gerhold.net>
 <6f1954e6-e98d-6911-8721-c50082bfb1d7@linaro.org>
 <ZHS-HSgaBxMXiKy9@gerhold.net>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <ZHS-HSgaBxMXiKy9@gerhold.net>
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

On 29/05/2023 16:00, Stephan Gerhold wrote:
> Do you mean update the examples in the yaml bindings

Yep.

grep dsi0_out Documentation/* -r | grep qcom
grep dsi0_in Documentation/* -r | grep qcom

Consider splitting this patch out and fixing up Documentation/* and 
arch/arm/boot/dts/*.dts[i] , arch/arm64/boot/dts/qcom/*.dts[i]

We may as well be consistent everywhere.

---
bod



