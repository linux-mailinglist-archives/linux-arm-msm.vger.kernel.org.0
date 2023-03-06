Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A33DB6AB88A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Mar 2023 09:40:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229978AbjCFIku (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Mar 2023 03:40:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229940AbjCFIku (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Mar 2023 03:40:50 -0500
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE24E2128E
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Mar 2023 00:40:43 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id g3so35277650eda.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Mar 2023 00:40:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qQ0kCNRvnlBPGo3zFijI80Fs5ytanhlw1wiiBbqnEfM=;
        b=Ea6pV7O954GCjZZnA876T0Bb4Qg5OupjdBek5ck1JbEIMJ4b7kEXiDEzcbL8rSTvnA
         oaIzWTe5Lw2yxeK+XboKU72Tqs/YlVcmW37a80e0z2+xz5GhiWsXwYcgIDhgn5KkZO4E
         +HlkicDKmizcb7yP8KJqos2OJ7Kzsappz6vcJeuzl3qWYb7SLiqAvrwIvtvB2yGVD14M
         MFldyS5c1rzHRBSD/oc2Ox9lLuvEvi4IrTthJjWCDFjY+VGhaumc9H7AD5TTdHzh4ZjM
         T3O3k5OVPn9FsEn4C6dqFQ6149aKjGOS1IxWx9XbqKjrNUdAoBYGDqludp806OVGOSqQ
         uFsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qQ0kCNRvnlBPGo3zFijI80Fs5ytanhlw1wiiBbqnEfM=;
        b=VpQb0aOUw6lnfCgMVCJ1eFIEhjVzV7zwcOdm0P4T+Sq+DcjFS2aaoS2CGlwq7ysJIq
         vXTso8MqIwvHUCW36k9w9IDAbEhVE73Bj92DLmBIHS4pXnCWv6J8IT+34c4gN8l3ZXD9
         zj1XMLbLYMjvLzQm+CUm9r/khrGXp8XxNkjVrni8uflcU48QQEPJxLHDMFYA+ka3t8QV
         jBhX38W5PaxGE8DbzH65lO1RDT3aThZRcnJHVCMtLsvImU4GuDQeBtq4hEDgtU9zyDGf
         uDzNy8I2zdzkHZ4XIMLxpM3cJcBESpWbWoSQV0Fk4KwPQVTBgWQCCBzXHYyAqRvvTi4g
         yuVA==
X-Gm-Message-State: AO0yUKVLInioI57QP5ocnwPsuBKYZPDBxX6BU7nAKhGJTFOjqxcBKBa/
        8Wp1nW1nvUB+GSKtCGQka8b18Q==
X-Google-Smtp-Source: AK7set//ASnOu0ofB+sAvHW9PfcCZXmE6A9lrbCDAjj9FiQCBEuJ8PvkwlD3i0mN6IIJvOdE0LHw3Q==
X-Received: by 2002:a17:906:3141:b0:8b1:7b10:61d5 with SMTP id e1-20020a170906314100b008b17b1061d5mr9872711eje.33.1678092041758;
        Mon, 06 Mar 2023 00:40:41 -0800 (PST)
Received: from [10.203.3.194] ([185.202.34.81])
        by smtp.gmail.com with ESMTPSA id s23-20020a50d497000000b004c8948162e8sm4370855edi.67.2023.03.06.00.40.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Mar 2023 00:40:40 -0800 (PST)
Message-ID: <18e507e2-4159-d2aa-1945-4c06651d91a1@linaro.org>
Date:   Mon, 6 Mar 2023 10:40:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/2] dt-bindings: phy: qcom,qmp: Add SDX65 QMP PHY binding
Content-Language: en-GB
To:     Rohit Agarwal <quic_rohiagar@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, vkoul@kernel.org,
        kishon@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1678079913-27945-1-git-send-email-quic_rohiagar@quicinc.com>
 <1678079913-27945-2-git-send-email-quic_rohiagar@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1678079913-27945-2-git-send-email-quic_rohiagar@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 06/03/2023 07:18, Rohit Agarwal wrote:
> Add devicetree YAML binding for Qualcomm QMP Super Speed (SS) PHY found
> in SDX65.
> 
> Signed-off-by: Rohit Agarwal <quic_rohiagar@quicinc.com>
> ---
>   Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml
> index 62045dc..d877589 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml

Please use new PCIe bindings from qcom,sc8280xp-qmp-pcie-phy.yaml


-- 
With best wishes
Dmitry

