Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B78074CC1C5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Mar 2022 16:42:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233619AbiCCPnl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Mar 2022 10:43:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234466AbiCCPnl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Mar 2022 10:43:41 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E26942E0A3
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Mar 2022 07:42:52 -0800 (PST)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id BCAAE3F1E6
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Mar 2022 15:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1646322171;
        bh=ME4I2xtDxLjtSdGBX3DKk+XrqVNliOSTqfJoYUoRWk0=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=RhrNbCWHmxJdS3FdBexI3w1qYSElCL2zMs6D5EZIW6svDF+t50bK1Nw/vs1NdT/ZP
         zCs0m3Hl5D9zKd71Gso5oWaVDBJ6Xwbxn5RHtI9ZQqNcAo1z4gkQP+my9lhf58nlBA
         yKIQsXPmJ6tYxvORH3s9eQjs1BBFuouvbRvcwWXgYQxYT24iWmi47SozMrlzSnnqe4
         BYNI/4c+kEwsR+evWkwraGcjPquBwqdxNE/8arZMf8MHvSxdpTi+uGdhLuclo65Zlj
         j9DgZ80dZtw5gyGWr0rKB8i4Q1ywhLZM5Hn51z5QYlZ6WshfkbwPRlvn5e2euEUNZ8
         M5IMDl4VgjCDg==
Received: by mail-ed1-f71.google.com with SMTP id o20-20020aa7dd54000000b00413bc19ad08so3073247edw.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Mar 2022 07:42:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ME4I2xtDxLjtSdGBX3DKk+XrqVNliOSTqfJoYUoRWk0=;
        b=Tuwmq/wBZWXwtNa4A1iU5xUV8DOM6fmL0eMqSA9l7AMBwuBAT+K1TtIkiDDFg8SEzY
         t/1Shcl3lxXexIIox0cmrzbTrpE6fY0ZCRQsYlAtKwwyDDmH0zDgxYwoxSFoLNJlsjax
         GCxS0O8WTD+MTrdE2aFjRz4XiPxWQ7iNCexE462wmPpZFkmECXXvM697Ri7pTUpenKm8
         /eergW093VGhilo42g/v8rU78mLijuziOlqPZ//hZNHOjnZ0Lw+AO6Sn6LzmNVNYsKlD
         yx5V0WlFmkLh2K+JmmBAvFDThAJLVc0gtnYnShi8roF0LOAPBHQtr0Aaek2Z+OnURrb0
         pj8g==
X-Gm-Message-State: AOAM530A/qacfjwzpwaQlhsLIdBj4ILhjhK40FXLO55bcTnoct8ZyiRx
        rplr7uka10+5mZIVTBa8+6OfuZ5veQvoRaASN/nr7KSG2Z0+JytDKrqO5Rjf2EzO8wwDTVMjIBM
        0pGDGorXJ+VsO3Z2LAz3H3v2WhpePbH31VjPjh0C2nWM=
X-Received: by 2002:a17:907:3e22:b0:6da:83fd:418 with SMTP id hp34-20020a1709073e2200b006da83fd0418mr4705172ejc.321.1646322171426;
        Thu, 03 Mar 2022 07:42:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzo2mCEi6JNvhbFVtiZ/5DeFZMU3OF1EMgZti7mkxs4OomQXS6Xn1JoWk2kQOUgUWbTOWbjDQ==
X-Received: by 2002:a17:907:3e22:b0:6da:83fd:418 with SMTP id hp34-20020a1709073e2200b006da83fd0418mr4705157ejc.321.1646322171259;
        Thu, 03 Mar 2022 07:42:51 -0800 (PST)
Received: from [192.168.0.137] (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id w15-20020a1709062f8f00b006cd545d4af6sm817849eji.45.2022.03.03.07.42.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Mar 2022 07:42:50 -0800 (PST)
Message-ID: <758fc38c-53ec-4351-534a-95e1a54fb60d@canonical.com>
Date:   Thu, 3 Mar 2022 16:42:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 2/3] dt-bindings: clock: add QCOM SM6125 display clock
 bindings
Content-Language: en-US
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Pavel Dubrova <pashadubrova@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220303131812.302302-1-marijn.suijten@somainline.org>
 <20220303131812.302302-3-marijn.suijten@somainline.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220303131812.302302-3-marijn.suijten@somainline.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 03/03/2022 14:18, Marijn Suijten wrote:
> From: Martin Botka <martin.botka@somainline.org>
> 
> Add device tree bindings for display clock controller for
> Qualcomm Technology Inc's SM6125 SoC.
> 
> Signed-off-by: Martin Botka <martin.botka@somainline.org>
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  .../bindings/clock/qcom,dispcc-sm6125.yaml    | 87 +++++++++++++++++++
>  .../dt-bindings/clock/qcom,dispcc-sm6125.h    | 41 +++++++++
>  2 files changed, 128 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,dispcc-sm6125.yaml
>  create mode 100644 include/dt-bindings/clock/qcom,dispcc-sm6125.h
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
