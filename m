Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E41064B9C0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Dec 2022 17:30:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235888AbiLMQax (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Dec 2022 11:30:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236031AbiLMQaq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Dec 2022 11:30:46 -0500
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12172218A1
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Dec 2022 08:30:45 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id y4so3817987ljc.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Dec 2022 08:30:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h3woSRz2y/SJrD6ltZKFreTP0REPpiU9kQzFQVw4B5o=;
        b=THCDeyPPTCP/Jm99TmZvxdg+u2Ogh6K7AsvPOu+FmZUsLwfxiSeIkxAGrP1RCji18/
         n0PjaqHYMjXXIHYR1D7wa8YCRfoHn8sm6+nHTq0LDr7/jeocDvbut2r2U7VWQu6hmUqj
         4VBSL1eIZcWvVfLvz20cmhjghxfEbjGD6wnPwMj+T8FKIHlexJcENhtQLgNlFnbKmasx
         eocVIl1K+hktmzVCpOWCYRjE/dAoxm5I3/+btXyd1KHx/GFpqb/gWsmzm6i4qWUUqARE
         p/vE6WIpfEwT7YgZCfPQXC+gLxOV+17lhJ36DgSRiqSHjvyPlKrQsyhjJJzaQlI2W856
         efHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h3woSRz2y/SJrD6ltZKFreTP0REPpiU9kQzFQVw4B5o=;
        b=xMZ/atCil5oNzJkI56y9nqTOrROixpTHh4YLkUsoSK2OSFSS+qB5ykjS/Ir4NH4zzr
         bhWB4CtyLr4kCTEjoIEkCFgqCcf7pxntp3zQp2zpENeLHqEwETH7y4yDFx8k0MQX8t2v
         okCSfEIgc7cd1boB3bb1i0KMAAkXH5/8i/yfOn2uemyCJ9oN9Nohs9EAreqxtxXDMvC7
         G/HZtsxl8DT1T/bG8yKw4ZPo8Z1Hgw+nn4YMWuGEjttrE9BXIVb503PPUKdVmXlNXL2L
         ABsfBmVbud5lpHBGWSLTQLeViqhzYNxlc58G/JiowAI5Ulbo6bYxlzu+PB0WjIeOR4Cr
         8lUg==
X-Gm-Message-State: ANoB5pmfXxPN5dRxko5JLRcZq3QBGrvQ2+wbTKJGWtCgLtbLmnRZuAl4
        BHHygWIqbdYWz9akLK+PPqOpfA==
X-Google-Smtp-Source: AA0mqf5yAXlgWBn08FkBH926iDaxsB58klZ6Lr/bs3tzdlW1LbEeQVTcWr7RcysmpUSuopHwPywu0w==
X-Received: by 2002:a2e:a809:0:b0:277:4fa8:8eb3 with SMTP id l9-20020a2ea809000000b002774fa88eb3mr5275404ljq.18.1670949043370;
        Tue, 13 Dec 2022 08:30:43 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id i66-20020a2e2245000000b0027a099ad7efsm314091lji.35.2022.12.13.08.30.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Dec 2022 08:30:43 -0800 (PST)
Message-ID: <d1f4ad81-1612-77e8-9c2d-4abde1ca8b5c@linaro.org>
Date:   Tue, 13 Dec 2022 17:30:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v2 05/13] arm64: dts: qcom: sc7280: Fix the base addresses
 of LLCC banks
Content-Language: en-US
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, bp@alien8.de,
        tony.luck@intel.com
Cc:     quic_saipraka@quicinc.com, konrad.dybcio@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        james.morse@arm.com, mchehab@kernel.org, rric@kernel.org,
        linux-edac@vger.kernel.org, quic_ppareek@quicinc.com,
        luca.weiss@fairphone.com, stable@vger.kernel.org
References: <20221212123311.146261-1-manivannan.sadhasivam@linaro.org>
 <20221212123311.146261-6-manivannan.sadhasivam@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221212123311.146261-6-manivannan.sadhasivam@linaro.org>
Content-Type: text/plain; charset=UTF-8
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

On 12/12/2022 13:33, Manivannan Sadhasivam wrote:
> The LLCC block has several banks each with a different base address
> and holes in between. So it is not a correct approach to cover these
> banks with a single offset/size. Instead, the individual bank's base
> address needs to be specified in devicetree with the exact size.
> 
> While at it, let's also fix the size of the llcc_broadcast_base to cover
> the whole region.
> 
> Also, let's get rid of reg-names property as it is not needed anymore.
> The driver is expected to parse the reg field based on index to get the
> addresses of each LLCC banks.
> 
> Cc: <stable@vger.kernel.org> # 5.13
> Fixes: 0392968dbe09 ("arm64: dts: qcom: sc7280: Add device tree node for LLCC")
> Reported-by: Parikshit Pareek <quic_ppareek@quicinc.com>

Same comments here and in all further patches.

Best regards,
Krzysztof

