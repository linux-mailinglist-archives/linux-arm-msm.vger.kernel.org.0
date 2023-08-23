Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 77DAC785B56
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Aug 2023 17:01:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236746AbjHWPBq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Aug 2023 11:01:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236742AbjHWPBp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Aug 2023 11:01:45 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE033E71
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Aug 2023 08:01:43 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1bdbbede5d4so45370495ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Aug 2023 08:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692802903; x=1693407703;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=z2+k6cAGFMR5RaZsHktDXUu9ODrgw3V1mMBLPGXhMTA=;
        b=FTjquEpjeOb53++i943DoGCqI9h41vEtwOGKq/SoeMOD2W1KSEOG1PE6Lw2KRpoLwR
         Z12Pz//meiNvJLj6WRg1Gp7mfwt3ctiQF2lR0VV7FXA1+ziVnYg9DfRy85x8mAm6VgFS
         MGdPDQkk8pn97fOtySTZJ+hB7553kJ5Rqs+XEsFBWyltE/xsHz3B9e0n0g12j/8DP8q9
         O3TkH+gP+APkj4PQ6HQRlJG5abaU9Kt3JTRVVwQYGy+eoeVnjrzBPTp4QjviWaJsGq8J
         L9ypoVX6zMrKtFIqNtGx6Xt2ZIC2YPcX8v1kCqe5qH1FSYg2QTrWAWaRCs1NzYfXwez9
         v82w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692802903; x=1693407703;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z2+k6cAGFMR5RaZsHktDXUu9ODrgw3V1mMBLPGXhMTA=;
        b=W+139AOZ2I7ZrxL2Tr2p5wDqkEZ3fPT3Kol2G0/slCyubllziSwc5BIQ8jMFtszSja
         oC14gdC6byD5EQ0Ug+6m9bIHcRPkcshje72Qx/rtKefsIRCtR3ZeksAEZrDDDFUDYGlE
         SmBeL/EKQ8EAb/5/fVPArjaKYUKQsO8kU5YmNVadTQTna/3DtGJnb8kVtq+P6L9kDbQ0
         SFOBS73UGwjxyOg1zvftWYOJ4222XPZQ5CHzyzIooNHjDej30zJiN6JaaRvmSorYySTB
         IjXZyH4cmxbUFRt3IQw23u6k1uNPss7ezVx8gOqLK4Z5gACE3c+aIaw3B7rR79EDLfiq
         ZB/Q==
X-Gm-Message-State: AOJu0Yyem7Tzl+wjbBhTwfqp6IXtqqL8sO57Y9/QhKVuBG89pwjN3lUk
        T8Fn9UG0jW9W5anFtiS42JOKvA==
X-Google-Smtp-Source: AGHT+IHxRsDTQ4GGwu3ku2CXGa3QkXLzI/onNiihjEQHr1t5QREaiIJx3tVEmUDH3nSv60FodszUoA==
X-Received: by 2002:a17:902:da88:b0:1bc:203f:3b3c with SMTP id j8-20020a170902da8800b001bc203f3b3cmr14899660plx.24.1692802903098;
        Wed, 23 Aug 2023 08:01:43 -0700 (PDT)
Received: from localhost ([122.172.87.195])
        by smtp.gmail.com with ESMTPSA id n15-20020a170902e54f00b001b89536974bsm11090898plf.202.2023.08.23.08.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 08:01:42 -0700 (PDT)
Date:   Wed, 23 Aug 2023 20:31:39 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Neil Armstrong <neil.armstrong@linaro.org>
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 0/2] qcom-cpufreq-hw: add support for 4 freq domains
Message-ID: <20230823150139.ljk3kblwuhfsorff@vireshk-i7>
References: <20230821-topic-sm8x50-upstream-cpufreq-4-domains-v1-0-2d4d9fc828d8@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230821-topic-sm8x50-upstream-cpufreq-4-domains-v1-0-2d4d9fc828d8@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 21-08-23, 09:39, Neil Armstrong wrote:
> New platforms can have up to to 4 frequency domains,
> Document and add support for this.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
> Neil Armstrong (2):
>       dt-bindings: cpufreq: qcom-hw: add a 4th frequency domain
>       cpufreq: qcom-cpufreq-hw: add support for 4 freq domains
> 
>  Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml | 5 ++++-
>  drivers/cpufreq/qcom-cpufreq-hw.c                              | 2 +-
>  2 files changed, 5 insertions(+), 2 deletions(-)
> ---
> base-commit: 47d9bb711707d15b19fad18c8e2b4b027a264a3a
> change-id: 20230821-topic-sm8x50-upstream-cpufreq-4-domains-2ca50ff2cce2

Applied. Thanks.

-- 
viresh
