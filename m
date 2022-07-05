Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 76466567635
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jul 2022 20:09:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231717AbiGESJo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jul 2022 14:09:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229591AbiGESJm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jul 2022 14:09:42 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1198C1C120
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jul 2022 11:09:42 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id t24so21948744lfr.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Jul 2022 11:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=KZ+txSZEd6eaGdS33pPV0JH4E6USyI0t/l6sBEbHblc=;
        b=qSzs1tFxGuWW9/qmDnle9cPEOyOgEyyw7V8EcR3TaAwggfpiSjfSQ3xMn5Iu1J5eBt
         w/xHDxIc985RJKl5bqAyAWFpZvLRunz4DIqf5/4LJqORpLEEUrwqmthkdGAb+RFFD+3y
         9016s53BdIt04/XxzbHfUYp8dxv+tyJ98O3j52F6lA/JA5Qe92k1BXNltDQgX8eWuDzD
         HotpBzA7YBbpRv3I57ExBA2xlV4q4OmcBPTb8MRvw391I0tTntsE8ai0hho7i6rjK45Y
         4bi3QKUQgwQIQKOPARa4QPwO2NABR6k0uW8KO/AeULabqALhEiaTVeeIWJN26LSoQWrW
         VPLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=KZ+txSZEd6eaGdS33pPV0JH4E6USyI0t/l6sBEbHblc=;
        b=7zYc46csQLd0lOkjs6JDIjURlQd0Soq7T6XJmqPEpdAyQy211Qk887FIciRTy75rgt
         u1yoVdg2oETosN2/A6GBk/Kt21V/pYsRfbEfAqGYRdeQlimG6ppaKKyB3Q1KF16MK5q8
         gIY4z8E+rQfvViAL3Nya33PXmWlU2T9K90HmWHt3r3SVETyFSrPOS2L5k/aIUQUIgvSd
         QsJqs/2+TMpTMhII4aAw7aQ876aJSqeU5B0dJLYy9h3VzWUpUX7uPM1NRLF39PxL+q0d
         AngJOgmEmfpCB2txwYQ0oKAhQiUcYPuW4XG1UBSsLmbEKEI09xmRwCoRYbXVZHb+0728
         0V5Q==
X-Gm-Message-State: AJIora/FXf2KzknU13ABOKQcHk7IomscJQLyNpnZ6T1kH1rfBp5bzhMn
        Kn0fmF7aXXScZ3wsD1tbI+UtEw==
X-Google-Smtp-Source: AGRyM1vxQ//E9lKymciMwf1NJB7Gni0S2ZqNblyggKUN1BspqjAQUF/sTdNeVi7G2reVu+4bQYgofQ==
X-Received: by 2002:a05:6512:1193:b0:481:22b3:f198 with SMTP id g19-20020a056512119300b0048122b3f198mr22653131lfr.446.1657044580460;
        Tue, 05 Jul 2022 11:09:40 -0700 (PDT)
Received: from [192.168.1.52] ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id t19-20020ac243b3000000b0047f6f8f20dcsm5813186lfl.28.2022.07.05.11.09.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Jul 2022 11:09:39 -0700 (PDT)
Message-ID: <034cdce6-551e-84bf-76c6-cd02c5552633@linaro.org>
Date:   Tue, 5 Jul 2022 20:09:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 7/8] dt-bindings: arm: cpus: Document "qcom,msm8909-smp"
 enable-method
Content-Language: en-US
To:     Stephan Gerhold <stephan.gerhold@kernkonzept.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Stephan Gerhold <stephan@gerhold.net>
References: <20220705143523.3390944-1-stephan.gerhold@kernkonzept.com>
 <20220705143523.3390944-8-stephan.gerhold@kernkonzept.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220705143523.3390944-8-stephan.gerhold@kernkonzept.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05/07/2022 16:35, Stephan Gerhold wrote:
> MSM8909 is a fairly old 32-bit SoC without PSCI support, so the
> additional CPU cores need to be initialized with a custom enable-method.
> Fortunately it works just like on MSM8226 and MSM8916 so just add
> an additional compatible as alias to the DT schema.
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
