Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A99FF6C659D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Mar 2023 11:49:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231646AbjCWKtJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Mar 2023 06:49:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231639AbjCWKsy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Mar 2023 06:48:54 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA1A01E1EE
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 03:47:23 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id eh3so84477732edb.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 03:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679568442;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZwBaazd46Os1h8UWb3mzhS3tM1p34VAmXxtP/Asef4g=;
        b=Dtslf0444+9v58G4yE+r0N4jTKSFCxfgxadg83fFpxNHJ4ac4nlxy0bFQDZh3eNAKB
         6WssITCbUrDgO1As33oV9qKLdQbyrHIJ2/gRtUdUK8XNctG/tWxxNfnYwi9XdL67Rwz2
         jN5zgGK5gewqPRnTYvHYAntqZ1Mrs6KMySeUgtH1R0O51kUmgjC5iviB4XcBg1oXkJ4C
         wsPdAy3FmmaFAuFdsxIiH2CG84/CHpAs1LMRnB5QWHwBtoXNosOoPlLukKgM+rmy+rJ4
         VrJPlkZfxEfp7h9c067CxWlfsxIXgtjVtA8ANFGhrqOP7GyVkLgwoh2y61aQiFLP4vgB
         YbAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679568442;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZwBaazd46Os1h8UWb3mzhS3tM1p34VAmXxtP/Asef4g=;
        b=MixNZ7FNmOPYEANakMzMrlzBfx/Ufs65rW5Y+B9YEuduR6Waz0tkEfRxFR9BCn5EyK
         QHPCJfvsu2/sbW6Ev5+2LgcUXtG5qF/L+Y7uiZ8pzODseWp8cNzD0T5IW/0DLoLZE8iG
         1LhIDkngsfhakK+Rtb4tIbjKMEoZC0miUdcmmkUw2Rce1Whm3RTHi1jp+djG2006I+eE
         hhk8u2d6N3g9y1qTseS3MLW3HiFUsmO17Dt8X8dB1aXTjqz2LNHMUvAZCJ0R67ezz+j+
         jjLP7ZrycE8VUH8uDg7lRfitn7E/uW8M68KK2AOWY3VR87MViwquioSpE6/tyFtYIb5C
         nfSQ==
X-Gm-Message-State: AO0yUKX+VIZ/G6hhLLEqTxjKuhJzFKr2+GRHtJTqy35eZnKTZpATzbOP
        L4evMBnSbsBKND1Be8dO6Oox+g==
X-Google-Smtp-Source: AK7set+syZHTlqpATJV5H45QwNgqlRP+3WJYWaGjq6Y6tMtvCBdNqC47gy0P9OOBSjJ/vCiMdvKECQ==
X-Received: by 2002:a17:906:9457:b0:930:a74:52bb with SMTP id z23-20020a170906945700b009300a7452bbmr5414585ejx.14.1679568442296;
        Thu, 23 Mar 2023 03:47:22 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:a665:ed1e:3966:c991? ([2a02:810d:15c0:828:a665:ed1e:3966:c991])
        by smtp.gmail.com with ESMTPSA id q18-20020a170906b29200b008c607dd7cefsm8484887ejz.79.2023.03.23.03.47.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Mar 2023 03:47:21 -0700 (PDT)
Message-ID: <35e3aa8b-ccff-25fa-42da-d8934ef366c6@linaro.org>
Date:   Thu, 23 Mar 2023 11:47:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 6/8] arm64: dts: qcom: sm8450: remove invalid npl clock in
 vamacro node
Content-Language: en-US
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Lee Jones <lee@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-scsi@vger.kernel.org
References: <20230323-topic-sm8450-upstream-dt-bindings-fixes-v1-0-3ead1e418fe4@linaro.org>
 <20230323-topic-sm8450-upstream-dt-bindings-fixes-v1-6-3ead1e418fe4@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230323-topic-sm8450-upstream-dt-bindings-fixes-v1-6-3ead1e418fe4@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 23/03/2023 11:25, Neil Armstrong wrote:
> Fixes the following DT bindings check error:
> codec@33f0000: clocks: [[137, 57, 1], [137, 102, 1], [137, 103, 1], [137, 70, 1]] is too long
> codec@33f0000: clock-names: 'oneOf' conditional failed, one must be fixed:
> 	        ['mclk', 'macro', 'dcodec', 'npl'] is too long
> 
> The implementation was checked and this npl clock isn't used for the VA macro.
> 

This does not look correct. DTS looks good, you miss some patches in
your tree.

Best regards,
Krzysztof

