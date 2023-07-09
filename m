Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2267674C6B3
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Jul 2023 19:26:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231185AbjGIR0n (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 9 Jul 2023 13:26:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230317AbjGIR0m (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 9 Jul 2023 13:26:42 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A1A3E56
        for <linux-arm-msm@vger.kernel.org>; Sun,  9 Jul 2023 10:26:28 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5149aafef44so4662923a12.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 09 Jul 2023 10:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688923587; x=1691515587;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N13e8qHoPdUNItDm39HEWkePArYa3KUVlo9kWPFhjdI=;
        b=ksEz3NhhIOXsjzRNA8hzCKSBYkchsF5hx0eS8CUctujx7WgiowTHsUCRGfgRGDAhlH
         AjFrN8APA4vbXnKN9ib/Vf84OpBfKemrOFb/04ns2iBO5hURwUE/cM6TDAPIn5eOPby0
         JpubXN3x5+9pkV9RMFZmjnLcOhLqPGUg5DaqgyrTBUexZ1+8TKDcSKfLtV8I5USOYyw6
         l5JWhP5TTBhh4Byh30UVQWS8AIdn3B390RIrnmzsvHGJXnX6O02Ovk+/Jr7InBGGGkLL
         eI3b29rMNNzl312xOPCBOWlfMwByVYnWyPBTzOynb0NBzvR5sPbR9UP1hS488RPNlTl7
         76Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688923587; x=1691515587;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N13e8qHoPdUNItDm39HEWkePArYa3KUVlo9kWPFhjdI=;
        b=bM4fDgmVn0cvEVsI8ZWcShxU3GagC0CxfBXg77SSFJcs9/h7UGBf1RjJZe8vqPB2fc
         qD8HP+wZ3H6DQ4n/lH5LmYPW4+DGuE0U1vnYetejr5WnYc+7JbDZisAv2REksfy2WIEL
         nPdmIa1hgU5oh6tdnpiSrQSId5paR2Iy9H8LEzQ3ut+2Y2ZzWs79/aU5dHrIiUu47LB9
         SghrF/P3dGA1TJJa96ipFoydama3Nx123Vnvo8CfM+4CxRaUSA/i34iITW3+N6LSkGvO
         oYiMLp3ypeGTSP+kA8gIBcy3eKuBE2iAPoNaj3dpYDHdCAb5SKQH1TJgt/qyJE5rdd4v
         3cuw==
X-Gm-Message-State: ABy/qLbRM/VEyC2RDwXY+cplMmcXkmqVWA3QcaX3M2RvCZXbMbZL0uut
        v+gYd8efDLwEM+xjCFdz9hmXfA==
X-Google-Smtp-Source: APBJJlEEjNntLhWspHz5vAUrXDvzwdtVSmuZ9eGCEUn0U8UWLFf6pBnyXESFk9mZcOYOlnnxlLuUWw==
X-Received: by 2002:a05:6402:150b:b0:51e:4e77:3347 with SMTP id f11-20020a056402150b00b0051e4e773347mr3965222edw.41.1688923587050;
        Sun, 09 Jul 2023 10:26:27 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id b14-20020aa7c90e000000b0051e1a4454b2sm4680110edt.67.2023.07.09.10.26.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Jul 2023 10:26:26 -0700 (PDT)
Message-ID: <39775b1d-5967-7401-6415-da6244546a6a@linaro.org>
Date:   Sun, 9 Jul 2023 19:26:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 10/11] ARM: dts: qcom: Update devicetree for QCOM ADC
 bindings path change
Content-Language: en-US
To:     Jishnu Prakash <quic_jprakash@quicinc.com>, agross@kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linus.walleij@linaro.org, Jonathan.Cameron@huawei.com,
        sboyd@kernel.org, dmitry.baryshkov@linaro.org,
        quic_subbaram@quicinc.com, quic_collinsd@quicinc.com,
        quic_kamalw@quicinc.com, quic_jestar@quicinc.com,
        marijn.suijten@somainline.org, andriy.shevchenko@linux.intel.com,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org
Cc:     linux-iio@vger.kernel.org, linux-arm-msm-owner@vger.kernel.org
References: <20230708072835.3035398-1-quic_jprakash@quicinc.com>
 <20230708072835.3035398-11-quic_jprakash@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230708072835.3035398-11-quic_jprakash@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 08/07/2023 09:28, Jishnu Prakash wrote:
> Update ADC dt-bindings file paths in QCOM devicetree files to
> match the dt-bindings change moving the files from 'iio' to
> 'iio/adc' folder.
> 
> Signed-off-by: Jishnu Prakash <quic_jprakash@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/pm6125.dtsi                       | 2 +-

Also (I am repeating myself):

Please use subject prefixes matching the subsystem. You can get them for
example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
your patch is touching.

Best regards,
Krzysztof

