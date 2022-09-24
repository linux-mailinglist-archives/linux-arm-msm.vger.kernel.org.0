Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43A765E8AEE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Sep 2022 11:32:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232228AbiIXJch (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 24 Sep 2022 05:32:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233451AbiIXJcg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 24 Sep 2022 05:32:36 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73888E9CD9
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Sep 2022 02:32:35 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id b6so2421937ljr.10
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Sep 2022 02:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=UhfSf2CMm4aexoQYjsSQyZk7bwSh8tin0SfTbWRZyJk=;
        b=eG+FiDWiXDILhdt2T5wwU6v6nOoldLYauzCBreGoqTOEP86dJrJ/0Ameg5TWcLPNT7
         eVPHgVYQqoY9ByHNPsNKodEE8eLQK9rxHq+Z0lBbbo/gTvGWtGiDHSuDQKJF8dluYDs7
         HBJoivDCZxCHjGyHZjBhiQiYVbiaEQxe7yfAg+HyJmQFbe41aSuaIwbOKQNp6BuIxaDV
         L02anBuSUTtFr2VkyBUI7VMQSCAfsrUcSNzsr2s7gF0eI1BOjRqAs37hhSAsgWKsnW0a
         uKtKjs/ta+HCGE8i3BLrcLOOlZlkKfOHUc4rt5Bi/ISAf07sttdS0W8dEadJNqP+CVXK
         mpMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=UhfSf2CMm4aexoQYjsSQyZk7bwSh8tin0SfTbWRZyJk=;
        b=mDG4646oNOX3u3i/yDSWx/zKCKP7oa8e+lMFcUtcN93o9T3XwPoJ0Q+iJ0Mf25ggtO
         1kime1EBptakJ5lgzAPtbi4nNAAuywmJozdV5KybgfEbWLafcDZW5bakncVOO5osH5A1
         USRbg6b/XxLd3gDF5/x+XXhqVtlnr/jYn5BTUKhwHDY8jIaNYKX/9syVkWpdlef1hQmZ
         zGE31Mg1+sNRN8Yrweqa4iPbNh45kIb8wNLKm2Nb4j/B51jcK+Y7/bQP/UN5cGOOeM7K
         W+D8sSORRdWjfGQovVMOWorLQ8G1/dB91hPyDHWUdKxpIWxrGFdND1G7r62i7jLtkumI
         +FXA==
X-Gm-Message-State: ACrzQf3ZKc+Nq08v6po7EnA5Dsf900nbHdOkFhOjTNKBKrLB7o65zOEY
        QVm5ZRAvJtIsomH1TiPGeh9S7g==
X-Google-Smtp-Source: AMsMyM7N1dwXNw/7q6ugVHeYBN9H8X5Ecb3R5C2y44tiRaC/BlIhfA/m0WqD9TEQf7puKdFubvub0w==
X-Received: by 2002:a2e:9c2:0:b0:26a:cbe5:21ae with SMTP id 185-20020a2e09c2000000b0026acbe521aemr4418978ljj.354.1664011953866;
        Sat, 24 Sep 2022 02:32:33 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id k4-20020a05651239c400b0049908e21e26sm1830317lfu.253.2022.09.24.02.32.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Sep 2022 02:32:33 -0700 (PDT)
Message-ID: <4eabf0bf-cae0-5457-7b0e-3a9991402de6@linaro.org>
Date:   Sat, 24 Sep 2022 11:32:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 9/9] arm64: dts: qcom: sm8250: change DSI PHY node name to
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
 <20220924090108.166934-10-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220924090108.166934-10-dmitry.baryshkov@linaro.org>
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


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

