Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A18AF4FE047
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Apr 2022 14:38:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353100AbiDLMkd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Apr 2022 08:40:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354882AbiDLMio (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Apr 2022 08:38:44 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA32663518
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Apr 2022 04:59:02 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id bg10so36860962ejb.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Apr 2022 04:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=WaJAMSrJDoo9/Hssj5JitI09tEE075kukXq21wu/5L0=;
        b=nhcJ8zGYc/klHu9Y8GsxATSJikwbOFEWekXMlCmX5sxb9li4oSg9PGeeUbXZGFy8Nc
         IXF5LFi7P0i3sbGcyqTvlFaWkyCfUMMmV/v91H3n5Hu+RZY7L5gwySHmiar1TezMG0dA
         PNMJMjqsuVe9EzVY1D7+Oboem+blu2muLkNlfajeYd5kD1SMJnhKX/RsWGsQq+wGma65
         X/shOW3/nET3zNJ2Rg1QlOEeSAe6DcHQyQStm4D0XuYkN6yN7vot6ngbuLu99m6XKXbk
         Pz26pbFrolE9LlRnkGAHyePGw6JGBezdYLs0FYzZaEI5H+6ffUb7F4PP8Y0YUwstuYwL
         P5yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=WaJAMSrJDoo9/Hssj5JitI09tEE075kukXq21wu/5L0=;
        b=LmlCYgcuMohRJ+Q7CW/dTDZSMP9phczjjMFnU0QN7Hu/mPhxQSKRuqApVIbueMzZ6t
         AX/8UHql/cj7nzqaaOvP244UOSkLJtyocLCMtUABcDdo6CWggACtC6jz0T5zeO99PX1I
         RdrMypSthqHgh5fi06oNmgWGla9Hw2pNfSvCLY1eVUcBSgX670F3dMtGBwywTEi0VAHl
         wDUDXCfhmbjI4Aw/lkvtnQqoPAwws79F4lc9XMumpAhIc30L68xiovkjC07Zo1EGQwyC
         edYLzbF/Nh7DzPHtOMDigccYQ1nKsDCM5h98RBbkW1vkuIUGM5K4VUoBLxiGbvpMTGOF
         1j6A==
X-Gm-Message-State: AOAM533YQ4c3KqzBIxH4sUiXzy4GO8G77li0s2JI0592yDATR8a3kUUZ
        DnrR8Vnh/bHMmboDI0OZj2cm5A==
X-Google-Smtp-Source: ABdhPJziQxoyCTOQu+uWYcATEWIVf2W413EKsvJ+OhevBIrRejTHf3dVPmpga24MDq56YcGwUd2kmA==
X-Received: by 2002:a17:906:af7b:b0:6e8:8123:78ab with SMTP id os27-20020a170906af7b00b006e8812378abmr10912595ejb.434.1649764741569;
        Tue, 12 Apr 2022 04:59:01 -0700 (PDT)
Received: from [192.168.0.195] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id w6-20020a170906d20600b006ca00cb99e0sm12989864ejz.34.2022.04.12.04.59.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Apr 2022 04:59:01 -0700 (PDT)
Message-ID: <e278c563-d333-5b79-04b8-406d845ae165@linaro.org>
Date:   Tue, 12 Apr 2022 13:59:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH V4 1/2] dt-bindings: mmc: sdhci-msm: Add gcc resets
 strings
Content-Language: en-US
To:     Shaik Sajida Bhanu <quic_c_sbhanu@quicinc.com>,
        ulf.hansson@linaro.org, robh+dt@kernel.org, krzk+dt@kernel.org,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org
Cc:     quic_rampraka@quicinc.com, quic_pragalla@quicinc.com,
        quic_sartgarg@quicinc.com, quic_nitirawa@quicinc.com,
        quic_sayalil@quicinc.com
References: <1649759528-15125-1-git-send-email-quic_c_sbhanu@quicinc.com>
 <1649759528-15125-2-git-send-email-quic_c_sbhanu@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1649759528-15125-2-git-send-email-quic_c_sbhanu@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/04/2022 12:32, Shaik Sajida Bhanu wrote:
> Add gcc hardware reset supported strings for qcom-sdhci controller.
> 
> Signed-off-by: Shaik Sajida Bhanu <quic_c_sbhanu@quicinc.com>
> ---
>  Documentation/devicetree/bindings/mmc/sdhci-msm.txt | 5 +++++
>  1 file changed, 5 insertions(+)
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
