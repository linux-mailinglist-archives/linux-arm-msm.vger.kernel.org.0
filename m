Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A42FE6F41F5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 May 2023 12:46:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229457AbjEBKqB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 May 2023 06:46:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231964AbjEBKp7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 May 2023 06:45:59 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBFF010DE
        for <linux-arm-msm@vger.kernel.org>; Tue,  2 May 2023 03:45:57 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-50bd2d7ba74so4461920a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 May 2023 03:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683024356; x=1685616356;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2RjKRf4rxtbcC4Sh8zFnfVKYv2B+zGR4PixvmDCtDjQ=;
        b=S4H0G+L+2uU1rG8lOMfYBkk46EkfFR11eEvSrn5PQ3z8YoATN2a5gCL8nvNoIw/DEm
         laZDROi5tNLD9YVH/pv/ss/5VBzvIzR/yQ+HlYHgw5fXA83ZgYXJYeAKSMHUCb3pCaGp
         gPRBwx61THx2FPYpFpyhfAQ4CuKR5xbkB2WWsQYPjIxTd4/r71xcgmu8Q8RhWDxzvt4Z
         9G/MongLXK1GrANAK7hqdvrRkOR+5Z1jDl/DelppI/4tt0dejDDjc706QB74ZRt5SvZT
         BFo3pJaP56ZVT9LHJOAFF6X3Hju7u0scsILsPvUpWmbvOKK1iOPwP8PcmisKQbCyrmum
         Rdsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683024356; x=1685616356;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2RjKRf4rxtbcC4Sh8zFnfVKYv2B+zGR4PixvmDCtDjQ=;
        b=XhEd1sPBfZGBod3x9CDaGaIZboddgLenf5xACY2h/Bqrtf3NColBoX5mkXUl9oVkkd
         Z8x6z0tnBbRo9xuVqUZGYCApPyOz435iJt8AIBfeD1wKkzDCYVpFSNfDodEzr6CLiZoh
         XJ02uMwRwakPklptirJPVug2Jeroh3mPnNPxGmDfV9QN5oKX15bFCeUPbPEgBKL86X+u
         UZCmL+gzg1Bwa0BknD0Jq49b4KodP4TberuhsC5ZSlhFpckw0u6WZn6X5YmRXJblsPxQ
         yqy80oVCtkG26rXSYD4mE1WF88Xrz9Zv4qxzxWH9Z+po8wBDtSCXgqy8aowPVh0Qd4P8
         Q+hw==
X-Gm-Message-State: AC+VfDzpSpitFlGOR0FALtVuWUfJmzViDUBs4eUwnpV+RuoI7opIskFj
        MysfldvJ+1lBL0uIOqsmKcFRKA==
X-Google-Smtp-Source: ACHHUZ7j4yYkI9Nc9gpEH5cvzDvZWy/LY1LcCUvSGpVLfs2Wdk7mJ+7jjHCPYGyLlyGRTkohW1yAYg==
X-Received: by 2002:a17:907:8687:b0:94e:ffab:4ce3 with SMTP id qa7-20020a170907868700b0094effab4ce3mr17024356ejc.32.1683024356305;
        Tue, 02 May 2023 03:45:56 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:bafd:1283:b136:5f6a? ([2a02:810d:15c0:828:bafd:1283:b136:5f6a])
        by smtp.gmail.com with ESMTPSA id s22-20020a170906169600b0094f3132cb86sm15798854ejd.40.2023.05.02.03.45.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 May 2023 03:45:55 -0700 (PDT)
Message-ID: <c3107648-3041-c6e3-1380-0a2fc354889c@linaro.org>
Date:   Tue, 2 May 2023 12:45:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v6 04/13] dt-bindings: phy: qcom,sc7180-qmp-usb3-dp-phy:
 Add input and output ports
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux@roeck-us.net,
        heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, luca.weiss@fairphone.com,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     caleb.connolly@linaro.org, konrad.dybcio@linaro.org,
        subbaram@quicinc.com, jackp@quicinc.com, robertom@qti.qualcomm.com
References: <20230501121111.1058190-1-bryan.odonoghue@linaro.org>
 <20230501121111.1058190-5-bryan.odonoghue@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230501121111.1058190-5-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01/05/2023 14:11, Bryan O'Donoghue wrote:
> Add a ports declaration which is optional containing two port@
> declarations.
> 
> port@0 to receive an orientation-switch message from the Type-C port or
> redriver
> 
> port@1 to subsequently transmit the orientation-switch on once the PHY has
> finished doing its orientation turn-around.
> 
> If ports is declared the input port port@0 is mandatory but the output
> port@1 is optional.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../phy/qcom,sc7180-qmp-usb3-dp-phy.yaml      | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml
> index d307343388888..c370b9cd58c2e 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml
> @@ -65,6 +65,25 @@ properties:
>      description: Flag the port as possible handler of orientation switching
>      type: boolean
>  
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports

on this level: additionalProperties: false
(because otherwise it will allow port@2 etc)


Best regards,
Krzysztof

