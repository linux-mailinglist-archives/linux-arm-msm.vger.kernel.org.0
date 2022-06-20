Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62FC355174A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jun 2022 13:23:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240648AbiFTLXD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Jun 2022 07:23:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241191AbiFTLXB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Jun 2022 07:23:01 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F60A2DE4
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jun 2022 04:23:00 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id fu3so20439229ejc.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jun 2022 04:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=D5DnREkEjVNx3v/VNxec7CBf/bIIKItaeTzt3nym0eQ=;
        b=GufTziXY8Te2UU01WEJZdmOutWCueBiljcwYxcmW6OS70fBGTzQIjYhjF5WggfaoZr
         l9ZMTCCutqBzIpo8DeIAAKy++olIcx3fU4hVkEzx2Oh9GY5pGeHrfpKkng3U0hQG7xhs
         X7AITukiZNmvwVKN8cJ7hFnTUJ1/i2XKEls1Ujdl+zm/GQcq2Oie7oW0UyKa5hfy74qd
         OTiAKM7+3Sf2bt8LwjE1/msj3imCTEUyS4V7ljYVB+zXosXhc3O84nD8j89Ps8b1/cep
         SvA1OljQd1StlKM8DrnhUHnHrG14O5ErI2107PXYUpK+dtOvmzXZNiCrdN7rOHQMWv5/
         t2nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=D5DnREkEjVNx3v/VNxec7CBf/bIIKItaeTzt3nym0eQ=;
        b=QitDteoaNeuNl8QmnneHsb8Vgv8E0iLHVf9bOugJNQ/UiRyflkvfPz0brPf51kFI0R
         Z7fPZunI/UQ+tBI5eHHNB4uFRb59fy51xKf70iL7qxbQxlrUAj455QHeTmAWrAgAbjUc
         zNxPXQ4zqa/srke5DwjDXHfsg3teHlo5HmwqTS77NiU6w+MZ5ZYVmNrtS9VAxL/x1pmt
         NJem+xj7wC+3D166mxjX3hkxgc4GiAzxUqRW6RKlr+cfPr25uq23fBCgo2Kn7Hxs0emj
         B4rlfK3ZgcKCfko8zYLLnLGUzHdBhNn9lqUcP+dxXUGB0pZbrCjTUFjDiiVgY+qMcJnz
         t2Qw==
X-Gm-Message-State: AJIora9U/hzgwID5vAMyjDxRS4EQzKFoJNGUA4LEkUYdNnI3fVBDoqjg
        Ajb6Fi5bFC4TFKrM53upKfoCXw==
X-Google-Smtp-Source: AGRyM1u/rRpQgvndnz59kIa2WoXYQDMKkw0CUGGxxKkKieWrT0NpHwVk3cBmEl9a4afIqBZn+6tSxQ==
X-Received: by 2002:a17:906:7786:b0:712:3c92:4335 with SMTP id s6-20020a170906778600b007123c924335mr20116084ejm.610.1655724178922;
        Mon, 20 Jun 2022 04:22:58 -0700 (PDT)
Received: from [192.168.0.209] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id kv14-20020a17090778ce00b006fe8b3d8cb6sm5808078ejc.62.2022.06.20.04.22.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jun 2022 04:22:57 -0700 (PDT)
Message-ID: <9e6ed640-7c51-feca-a61f-2a960eb9986b@linaro.org>
Date:   Mon, 20 Jun 2022 13:22:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/4] dt-bindings: clock: qcom,gcc-msm8996: add more GCC
 clock sources
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20220620071936.1558906-1-dmitry.baryshkov@linaro.org>
 <20220620071936.1558906-2-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220620071936.1558906-2-dmitry.baryshkov@linaro.org>
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

On 20/06/2022 09:19, Dmitry Baryshkov wrote:
> Add additional GCC clock sources. This includes PCIe and USB PIPE and
> UFS symbol clocks.
> 
> Fixes: 2a8aa18c1131 ("dt-bindings: clk: qcom: Fix self-validation, split, and clean cruft")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/clock/qcom,gcc-msm8996.yaml         | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof
