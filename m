Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D170762BDD6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Nov 2022 13:30:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238704AbiKPMaJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Nov 2022 07:30:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231403AbiKPM3n (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Nov 2022 07:29:43 -0500
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81F3522BE2
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 04:28:58 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id k19so21626036lji.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 04:28:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EM+UUNvI62fvBl2ABljWnGH5FDgLl/RuZAz74vYQ8Ds=;
        b=OeFrUQHLuPSTX33nejrDUgEyc89gWQm46awDXacUkP+cCuFehbFltJrU/GARwxILZ0
         T8MmaSXOtU3VgPCCVn625kulB2mrYdnaOaRqRN78+Jc44v2NNJHKJ58cP9avp93oVDdK
         n7SBVpemRZMF5rhdjSEHCnbNIfBR2hzeeA+MdibLjf28EG7S5hbs6H/exlc72Jo/gT2q
         5MJRQ7a4l/T/i0wGNZDEbLpglRkXEeKsw4jbJSVjlkzTpncmuBbZMTIRqUEv/HZZN9ZW
         hRJlkO+YJXH5T+lRmHUAm6q7cRiUcZ7l+vnl/0Og4jRulremIyO6Q/IzqtBJm8cA54hA
         8xHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EM+UUNvI62fvBl2ABljWnGH5FDgLl/RuZAz74vYQ8Ds=;
        b=0ODN94NAOFG9kluAa6BNgVTZIvU423EXkqONuQ9OL+F/wZqZ97WgLg8xr13iZheAS6
         UavMbm96uvGEYKe3bOdRExrrVZRyBI9iUfcnvNDQcENdasjJLTxMrqhUrksQIKtEt5h0
         yT1C9BFQZIBlna4hcgp7DrsujpcWIPN1AWpcf9EDw6WiuQdefRo61fu2nMgUKhC1rE/h
         p+X/uykYqaZC+O4rKoxsbZs5PcdRr7GzmdP42J9PKZx4EuZvOXfoq5s+Sk4tl9gSwOJ+
         gtw+dhN1SHRUBkXXGGa9KfkGWfRkx85uu8K1Fsn29uEM8ICScRCdYVHGzKuqjbMUl5jP
         SddQ==
X-Gm-Message-State: ANoB5pnjHI6rrHVvoKDcD1raHkNzvou9s4DW2UAwTmr93Weib0+TFD8k
        BYTz4nXIrKRtmKirzG8wZ5aNIg==
X-Google-Smtp-Source: AA0mqf46L1d+SwCvylCbn4fqHasxuHODF5mxI1wukp65UUC4e+36ehSHttdXWM9aJ10uU2raGqOKqw==
X-Received: by 2002:a2e:7310:0:b0:277:d86:a36d with SMTP id o16-20020a2e7310000000b002770d86a36dmr7480255ljc.288.1668601736917;
        Wed, 16 Nov 2022 04:28:56 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id b13-20020a2eb90d000000b0027781448499sm2990701ljb.85.2022.11.16.04.28.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Nov 2022 04:28:56 -0800 (PST)
Message-ID: <fcdf33fe-2ed8-1ec5-af6c-e3332b8bc75c@linaro.org>
Date:   Wed, 16 Nov 2022 13:28:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 2/4] dt-bindings: misc: qcom,fastrpc: increase allowed
 iommus entries
Content-Language: en-US
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     devicetree@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
References: <20221114-narmstrong-sm8550-upstream-remoteproc-v1-0-104c34cb3b91@linaro.org>
 <20221114-narmstrong-sm8550-upstream-remoteproc-v1-2-104c34cb3b91@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221114-narmstrong-sm8550-upstream-remoteproc-v1-2-104c34cb3b91@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 16/11/2022 11:20, Neil Armstrong wrote:
> From: Abel Vesa <abel.vesa@linaro.org>
> 
> The fastrpc components on the SM8550 SoC can require up to 3 IOMMU
> entries, this bumps the maxItems to 3 for this purpose.
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

