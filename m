Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 87FCD7808C9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Aug 2023 11:40:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359305AbjHRJjg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Aug 2023 05:39:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359354AbjHRJjW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Aug 2023 05:39:22 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EFB02D7E
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Aug 2023 02:38:54 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-52683b68c2fso858739a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Aug 2023 02:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692351533; x=1692956333;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oZOscNxwfNoVZVStzGtqlJV+8GQoiF43Kvj9BwOa4uo=;
        b=cszq6LExToh88vOQqwbM5dzhlRK6+HTG43nN+h+A0Ai1huVdv8MA2qOk4Q03uw1eOP
         m/ZsxU6x5wIq103IuK0cxbybg+1sNEdrg4GxPYPyBL8O/ldT0+8HEwVYTArX0bPNovtl
         u1sckMKrhr8arFDBRBchYsbi2YvaAGUSusDeyAebaQ0E9MOEz6EZuZqHtaQjWH3Zm+ys
         8lCAKBSyuBqbEM7axYa09Y5sq5eppx0qs/n5Ij8sqCfpdtADh2QY9ZUKVoM/IT1XK4bC
         6Qn9wZW5RqA2WWO3ONR7EDKtpDhcwUHW+YPnBGmfh107PzRORmvD9ngl3aWjav3rbx2J
         rJVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692351533; x=1692956333;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oZOscNxwfNoVZVStzGtqlJV+8GQoiF43Kvj9BwOa4uo=;
        b=iyZoTvSapGxf9LBnJt374ac/1zAtFcorD9XDoho9w9nOCMKmiG7E5KYRqW/9fk8cKe
         2wGR958afTYNnJXef8ERFMofmPs0S7fHD+dMFjA5IEcHO+lCwbBe9ct0F7BPFYanqqJz
         TyqYjnJpyHUxcW3ZxCGOJGkuxKRrWYH1Fmk0Ju2YV140bQFHmV+uD29HGHiQ8uzewY03
         xdFeBgh9fsj+Jh9iQyeJEetEvb5orpUcxtxFNwGBAsrgfpFnecr8VVqpMeeqsus4Lyx5
         i7tnuU9ZCylJShIx8iqrADipfaJCLHNsr7KluEip8UGowKOUOf+LJBffZHfHoBwn3eYB
         cT4Q==
X-Gm-Message-State: AOJu0YyzIVAE6BWEKp5LccL55voAu4SldXT126uYUoI31xZyuvwo0Y64
        VmX5rGRpuBBK2hnIgvCCr6Z2fA==
X-Google-Smtp-Source: AGHT+IHA7uBzx5VfK9Nb/cCnjqFySevbzj6KkZTYwOBBY5dNuh4oV44pkGQj9/t3s++R1YTVwO5Lug==
X-Received: by 2002:a17:907:2c57:b0:992:a9c3:244f with SMTP id hf23-20020a1709072c5700b00992a9c3244fmr1517656ejc.4.1692351532928;
        Fri, 18 Aug 2023 02:38:52 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id lc21-20020a170906dff500b0099cc15f09a0sm974014ejc.55.2023.08.18.02.38.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Aug 2023 02:38:52 -0700 (PDT)
Message-ID: <5892382d-f26e-8add-0e27-13f25d279639@linaro.org>
Date:   Fri, 18 Aug 2023 11:38:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v3 1/2] arm64: dts: qcom: sm8550: add UART14 nodes
Content-Language: en-US
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230817-topic-sm8550-upstream-bt-v3-0-33f386e7b461@linaro.org>
 <20230817-topic-sm8550-upstream-bt-v3-1-33f386e7b461@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230817-topic-sm8550-upstream-bt-v3-1-33f386e7b461@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 17/08/2023 10:47, Neil Armstrong wrote:
> Add the Geni High Speed UART QUP instance 2 element 6
> node and associated default pinctrl.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8550.dtsi | 30 +++++++++++++++++++++++++


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

