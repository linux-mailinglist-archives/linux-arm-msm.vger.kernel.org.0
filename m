Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 067936D78A0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Apr 2023 11:42:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237398AbjDEJl7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Apr 2023 05:41:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237448AbjDEJl6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Apr 2023 05:41:58 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A1E2524F
        for <linux-arm-msm@vger.kernel.org>; Wed,  5 Apr 2023 02:41:55 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id y4so139616892edo.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Apr 2023 02:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680687713;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0GjPZEs8t5YeiwXNylHqVxhWNUDxoz5iAqxoJIu/8Q0=;
        b=yLqz41niCnA/4M7/IrxcpnX+Rzo4R6MbgmPCqwq2kgPg/nr+Y/R4zhnDHiboyEfeHZ
         sgsAvPj4xkfkVHxUQ/U/64JQKOaevc52GhQnSgzkueU/7uAgfWHsItJaAtvGlGEgbue6
         aZdgY7oKNN8kRfDtsIE/r6thnnk71KDvsVKxmdmM23LdB5nUHJaKh3lRf8h7jBgudKmS
         O8SaYoHpbZ25XDySw1N0lu4UgF9GS9ntyjnJhSKurB0EznnNBmRB267YvyBmuAhpazrO
         CnVSvdOpFVZAZ6Rse1DqDZctMuGFLwb1DBbIDUNky4dLha8Z/Qf/o5ctMJcn+pQQGjVa
         9mnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680687713;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0GjPZEs8t5YeiwXNylHqVxhWNUDxoz5iAqxoJIu/8Q0=;
        b=nLLB6DX5csr9jbragThCcTi8PReo0REYgNV8iXfGcg5nY2SCWgAxDtZNYVc2PlINnQ
         j/VNdh6V/CyqKIFW/1Gxht5nhfp8OGyiqom/G7G1j/+va2hGFM1JEBMySzttK1vpzR8U
         p9GJMm/xXp4Nj4mSAS0K+Qj9JfUtG7frBAz6lecH0CC78KbUAx1iN46L5FdtYRGKvnui
         BFkP39gpPUVjYgOTr6kV3C+EzmAL81sRnzOeNAPnFSMAolux/Zfu0STXXKVET2ZT0MoY
         IwrqIotolmejakWOHRr6uWVpzBRVpqlng3UryYGsQsVYDbRQV43H5JqYXXuLDxOa479P
         sBGA==
X-Gm-Message-State: AAQBX9e++fw6Te9nhQjZwjhMsb1/vEUumFSLk+rd06GmvtlRca3Lm8k2
        16d0mYqxfOy4VM66W2RzUXlGSX0orZA/E7jvkzM=
X-Google-Smtp-Source: AKy350Z+GWU8X5Rfpn9ZSONreiFN8UZk88nM4GBu2VN6MfCfdsudG3SA9Oy22EAYtXBrPqLsB6sqfQ==
X-Received: by 2002:a17:906:a854:b0:8a6:e075:e364 with SMTP id dx20-20020a170906a85400b008a6e075e364mr2221475ejb.26.1680687713687;
        Wed, 05 Apr 2023 02:41:53 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:3f:6b2:54cd:498e? ([2a02:810d:15c0:828:3f:6b2:54cd:498e])
        by smtp.gmail.com with ESMTPSA id tc27-20020a1709078d1b00b009231714b3d4sm7142175ejc.151.2023.04.05.02.41.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Apr 2023 02:41:53 -0700 (PDT)
Message-ID: <1403741d-ef51-a9c5-821f-358c8f470dab@linaro.org>
Date:   Wed, 5 Apr 2023 11:41:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 1/2] dt-bindings: phy: qcom,qmp-usb: Fix phy subnode
 for SM6115 & QCM2290 USB3 PHY
Content-Language: en-US
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        linux-kernel@vger.kernel.org, bhupesh.linux@gmail.com,
        robh+dt@kernel.org
References: <20230401154725.1059563-1-bhupesh.sharma@linaro.org>
 <20230401154725.1059563-2-bhupesh.sharma@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230401154725.1059563-2-bhupesh.sharma@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01/04/2023 17:47, Bhupesh Sharma wrote:
> The USB3 SS (QMP) PHY found on Qualcomm SM6115 & QCM2290 SoCs is
> similar to sm8150 QMP PHY in the sense that the phy subnode supports
> 6 regs, namely TX lane 1, RX lane 1, PCS, TX lane 2, RX lane 2 and
> PCS_MISC.
> 
> Update the dt-bindings document to reflect the same.


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Bhupesh,

Can you use scripts/get_maintainers.pl to get the Cc addresses instead
of writing them manually or inventing?

Best regards,
Krzysztof

