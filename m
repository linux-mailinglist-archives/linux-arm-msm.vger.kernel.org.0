Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A363647F2D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Dec 2022 09:24:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229656AbiLIIYu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Dec 2022 03:24:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229732AbiLIIYm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Dec 2022 03:24:42 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02C915F6E9
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Dec 2022 00:24:38 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id b3so5910118lfv.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Dec 2022 00:24:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Pgtluh/qFWbybHqU1pIl0XhIK9Ltz3NWQ9TH4ULNdCI=;
        b=G36fOEIYfuH+EBBgjd3NprynhcRlOGJBonsGn8oLy35Dqd2ZJm1vUwX6ocgi7ZqPMY
         jeOZFevMryWdnMBbg9Ff6qpnUzT+z9en6w//DgHaA0lwl/Bs/WYW8Q9+qpWDZQxpF5Vl
         6N1W6nkFu7wW0X1e7jjvPqb/KLWAc/3CJSij5EkPZd+kKxaoMwR1Ezyk+MZz5a87re6b
         gLyRsUL+IaRWe6oTymVEfze7cUshq+wY+QpwB9jkk8x5WYK8Mttpbl7kcLKqVaS/v6ck
         HcqPODHPNu84k3sMV3th4xF7SB1H419ZYPf9wB8JgAEJhPxKIN8qhLXxakKoIGnD0Zwg
         wYiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Pgtluh/qFWbybHqU1pIl0XhIK9Ltz3NWQ9TH4ULNdCI=;
        b=QbcpFBItoUJbnqKWnZPNrXTm9YcseoruhAi8rr/UitzlPPRrkzB1vVSr1ntkVS8n35
         KPR5yye+3CQpdUrztuBmk11a7H6S4mt0JuRvNZ3MRpI0D+c7UYVwRKr/JCQuRp/3KsAe
         aDlRVLYSpWkAZzMmJ0EgjAEBUrIQvbGO2bZPzmG5of1WyckiNDeP380os1AX3L/H1nAL
         jt0C/nYZ2L3sYfVnOFHXQ/L4gemBLE+/csy3Dxr7/qhifLO8MInXMSG/2CgXPkmYViQw
         JkW+vB/IqOpFU/5g34j0C5AaIHfmTkARyIaqPeQpoOoBKvGf+3mWQit9oXfXFxpwsJqR
         ETRg==
X-Gm-Message-State: ANoB5pmUW4kjOu/gEMx3o0OrZpCVKuENkYAx6bH18E6yfkQMVzpLefp4
        mt94hi1oxbkd3EkCfOiVNuIAaw==
X-Google-Smtp-Source: AA0mqf59zsEkuV6mRtwVCxKJ8kPshhmnfpMTK48L/4Lyt5MsxS8/oOM77BEHpexiBl5OfB0RVuLQ0g==
X-Received: by 2002:ac2:539b:0:b0:4b5:5efb:7d26 with SMTP id g27-20020ac2539b000000b004b55efb7d26mr1228920lfh.37.1670574277319;
        Fri, 09 Dec 2022 00:24:37 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id x18-20020a056512079200b004b54ca56cf9sm159499lfr.303.2022.12.09.00.24.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Dec 2022 00:24:36 -0800 (PST)
Message-ID: <4413e2b4-7faf-fa0f-469f-bc90d3446cee@linaro.org>
Date:   Fri, 9 Dec 2022 09:24:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH net-next 1/2] dt-bindings: net: qcom,ipa: Add SM6350
 compatible
Content-Language: en-US
To:     Alex Elder <elder@linaro.org>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com
Cc:     Luca Weiss <luca.weiss@fairphone.com>, andersson@kernel.org,
        konrad.dybcio@linaro.org, agross@kernel.org, elder@kernel.org,
        linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221208211529.757669-1-elder@linaro.org>
 <20221208211529.757669-2-elder@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221208211529.757669-2-elder@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 08/12/2022 22:15, Alex Elder wrote:
> From: Luca Weiss <luca.weiss@fairphone.com>
> 
> Add support for SM6350, which uses IPA v4.7.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> Signed-off-by: Alex Elder <elder@linaro.org>

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

