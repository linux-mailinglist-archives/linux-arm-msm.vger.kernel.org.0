Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5463E6DED69
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Apr 2023 10:19:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229624AbjDLITf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Apr 2023 04:19:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229752AbjDLITe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Apr 2023 04:19:34 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AEED172A
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Apr 2023 01:19:33 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id jg21so26396791ejc.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Apr 2023 01:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681287572;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LquOzlkyKxehJwDFL94uuL+mZHnm4ypcdZd+4o5Ged4=;
        b=F1IrCq74k6tf6dr0Qc7aTdHAsgfGrG9hJELpGAh8kF5IOvOTqF0UrclwyIfZbuBzxS
         NM+tgPhkyyiL55Fv9rqrJxvnhMko9d++g2tQPdeHZG41JeB7xN0VrhSIrKb2XeuW8zPC
         ZgMEFy8m1isYfUTi3qDcNP+laDGqNOXz3yF/7NYHsoqL2XsZeOq+m409D8Su4KVB+dSI
         0ikClf9gW1ZGDGjiUy94QvtY9SexQXw7Q/s+nq/l3vIbzjjZoZnYArYC5Jv+VXD/uMhM
         +eEuAblS54Wc6Nm6x+HIzxwQXqug0CCtmfdebj/marMW6oJbqSMSkVLj86jsJd11fSOe
         UcrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681287572;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LquOzlkyKxehJwDFL94uuL+mZHnm4ypcdZd+4o5Ged4=;
        b=qYT8QrNiRas+bt3mAKmQH0nC4Sf4Ci5coacH/fuyUWFbbVLONH8NeGU723UppvbSFT
         0461Tr26K4JrRYZJlis3PBfYQgOD8A5S1XKUYS3AeyR90t22SM4jvZKh6VIATFgBe+Y6
         uP/54gQnHmd0ZY54M8EUzdwbwQ3N2RNjKt9z/xgIc1PBCfCWaZazRf6V1n8cK2/ExTvw
         r5xULfrq1rBQomXP/+8RsPS/cQyhaeCyGzEOBUd5rfhs6PjhGsI9/wSnrY/flyGbuJP+
         LC5zXm1ICRZLfFS3Ywsuer8cdUMryaGud+mlXLu23P7lPQYjj2SxvKGUOuV2+rDHGL7c
         9H/g==
X-Gm-Message-State: AAQBX9dGEVMhs4lKpq8ArzkzzpTFRudMj0mgK0muZoPJ8hSKfEPR5/Y0
        +gPL84TAbMGX7htqTn75TsQqgA==
X-Google-Smtp-Source: AKy350aUIRnZQrhIU0+8BIzA1Tzh6d3p28M/rwt/syiKhSoZSWUFrGONjAuXmxFG4qTc8Drh88wNvw==
X-Received: by 2002:a17:906:da82:b0:94a:464a:e88e with SMTP id xh2-20020a170906da8200b0094a464ae88emr15184505ejb.42.1681287571933;
        Wed, 12 Apr 2023 01:19:31 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:8fa0:9989:3f72:b14f? ([2a02:810d:15c0:828:8fa0:9989:3f72:b14f])
        by smtp.gmail.com with ESMTPSA id qk16-20020a1709077f9000b0094d7bc8e9aasm2037006ejc.94.2023.04.12.01.19.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Apr 2023 01:19:31 -0700 (PDT)
Message-ID: <1f276e6d-4a13-49f8-0953-9b1658d31c04@linaro.org>
Date:   Wed, 12 Apr 2023 10:19:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH V2 1/3] dt-bindings: sram: qcom,imem: Add Boot Stat region
 within IMEM
Content-Language: en-US
To:     Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Sibi Sankar <quic_sibis@quicinc.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>
References: <cover.1680874520.git.quic_schowdhu@quicinc.com>
 <96601c1f9e433ef8fbc608d5ca09365b9c0d8132.1680874520.git.quic_schowdhu@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <96601c1f9e433ef8fbc608d5ca09365b9c0d8132.1680874520.git.quic_schowdhu@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 07/04/2023 16:04, Souradeep Chowdhury wrote:
> All Qualcomm bootloaders log useful timestamp information related
> to bootloader stats in the IMEM region. Add the child node within
> IMEM for the boot stat region containing register address and
> compatible string.
> 
> Signed-off-by: Souradeep Chowdhury <quic_schowdhu@quicinc.com>
> ---
>  .../devicetree/bindings/sram/qcom,imem.yaml         | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sram/qcom,imem.yaml b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
> index 665c06e..9998d65 100644
> --- a/Documentation/devicetree/bindings/sram/qcom,imem.yaml
> +++ b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
> @@ -26,6 +26,7 @@ properties:
>            - qcom,sdm845-imem
>            - qcom,sdx55-imem
>            - qcom,sdx65-imem
> +          - qcom,sm8450-imem

Use recent Linux kernel for your work.

Best regards,
Krzysztof

