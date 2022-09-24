Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84B4F5E8ADD
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Sep 2022 11:31:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233589AbiIXJb0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 24 Sep 2022 05:31:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233578AbiIXJb0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 24 Sep 2022 05:31:26 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 372C0E7C2A
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Sep 2022 02:31:25 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id s10so2451064ljp.5
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Sep 2022 02:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=RF5aLBH9UafPGsBx2/NbJWWQLB1DVmRkzZOsOwOYsD8=;
        b=pSelQqH70MK7kbykGMMxDNVDHXmjCs9Hv4LFxAVPFP5PzdCM7SX1FJK1cRx0aNWLHF
         dU0FB7D83sewhPBKXqiOD7ZymZdauex6ohlwUMJxb7rMbJ1z/uMUU1k/zM8FnCLCysSs
         SODCDv0MNnt3x3mcnhhflfyywBBMj50er2x7MZ9IYAsbS9nnDQ/qUrWbslhe9CVGvK/1
         vyDUZNjoEN03oF/tXmW6auNz4gUUJ87pxq9YJKJgpZvoSpFYTJtKELPlNMjvkTrhqbu6
         hLmTvKB/Z2cC6HpvLsQPwNyGFJNY8iyrLrQToadhF0Z//QlfEzEwmQOWBR1s+PPsITGB
         FIVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=RF5aLBH9UafPGsBx2/NbJWWQLB1DVmRkzZOsOwOYsD8=;
        b=5fOST3d5GnQGT6GyprXV+vYuQpfnHZJgz7PeaDcHkGnbogM6M7b1ehgVqlsWMqfiRD
         1lomU5HE/eH+f/N7L4MmSaCxgMAAP5QUwfMI5rp52wLgjCBFXT3vXmNmOtdD4og6Qzir
         jQlLXZtw8UTwjhLQTWmllTFryTgGGcBJrMpmqc2tL8M5YO71kdkE1g1+x+MPQ7lq65LK
         iwjlbP8sRAlsMVd7OwhV3OjjFpthA2w05vc7+UyR/QrQwgKTwAB/BxV0vQc6rplddZeV
         M1afBFsNPYzTdEn3EH1C0exKL3rCROcZeqnyXJd6YL1goaoYIzyFi6Z3qucqq9y8Nbog
         9xKQ==
X-Gm-Message-State: ACrzQf2SdRvq5IrHd+1WVBW1tSc2mesdaBppLrWvP/VvHr2RiNi+pZ6f
        yyrlVTlfZZFU4WmYCPuZc48AUw==
X-Google-Smtp-Source: AMsMyM7hvEXNYUbMtrVnw7eFWevADIJedTdpXqSegKLMuLkyylWLkNZY+sF0O2C0paaRkava/DHILA==
X-Received: by 2002:a2e:a887:0:b0:26a:871b:a16d with SMTP id m7-20020a2ea887000000b0026a871ba16dmr4477103ljq.482.1664011883356;
        Sat, 24 Sep 2022 02:31:23 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id x15-20020a19e00f000000b00498fc3d4d15sm1836099lfg.190.2022.09.24.02.31.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Sep 2022 02:31:22 -0700 (PDT)
Message-ID: <b8c37872-fe98-a66c-008b-748049dd8d78@linaro.org>
Date:   Sat, 24 Sep 2022 11:31:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 5/9] arm64: dts: qcom: sc7180: change DSI PHY node name to
 generic one
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20220924090108.166934-1-dmitry.baryshkov@linaro.org>
 <20220924090108.166934-6-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220924090108.166934-6-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 24/09/2022 11:01, Dmitry Baryshkov wrote:
> Change DSI PHY node names from custom 'dsi-phy' to the generic 'phy'.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

