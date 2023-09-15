Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D3F17A1F07
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Sep 2023 14:45:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234959AbjIOMpY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Sep 2023 08:45:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234981AbjIOMpX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Sep 2023 08:45:23 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7DFD115
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Sep 2023 05:45:18 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-31f7400cb74so1781416f8f.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Sep 2023 05:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694781917; x=1695386717; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H+2OXea/ftSG4Gd1agwTiwOgex+CgxldQL9L1lT6oBA=;
        b=zzLPSsLwDzULOsbEHmeMIVzGojEyQCrSztPdfatZ9XPJvLPnKsC6+C84IuQXkl+hpI
         SYH4Kr1vNYmT1OotX5dPw6kGpY/x0fjgai/OZEvTeqv91wNsY1QK3gJT30K1sBjvVgOp
         ZQmvIRGSu1IDFDvNvggpXzeQu8bTlMkmcX3RQFKMHb9FcxIBaOIKCfqbFk8l4QGyD5vE
         F3z/qV56yGIplskbdAb7LZ3kJ9GI9bau4iyKH4OJQV3zOZ3MCBsb5ZqEcfLG/qPT5MTW
         cyxuD23qBj2k6d33FffsMZHOsIjvm22SIyJPHz615rPlBHFLJgHvAeEpUCyj6SmPDruM
         P/Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694781917; x=1695386717;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H+2OXea/ftSG4Gd1agwTiwOgex+CgxldQL9L1lT6oBA=;
        b=iPCV+8A+R41MnrfaP3aS23vgcD2a+IunCOJPdRbofAJSVmxInveR5i7ourvcbwNfRa
         I33Od3RPwA26yAnUxuUEasi6GAItkMtln2gmW1pGGN4DpeAtoOzCD2YXgtSDmK0g9F0N
         4hkvdQyaz6WpUuUJUtLiDxRvMw+FRUxYiKaWs6rsXpvfEJhjMLnzCUXntckxufRwedoz
         fUxWu4hivrWEysTepOahJraJNVyYrk4Nt45BH5CrDqRS4GjdSfTQ37Lk0ElJpgZLz6xO
         94r0hiFFhv+Jc+AsnL1F3d8VSVG2jMqFb+nLhEHhPmdQjXza0CK80U6JCMpmC+7Kumhp
         Li5A==
X-Gm-Message-State: AOJu0YzthBCmsk4ldS1ouLe0n17K8ox6e3cL2mXz/6UqJem+t0p8btLo
        08xKhGfrTrzAH7MEygeFXVFabg==
X-Google-Smtp-Source: AGHT+IEoXgSbsXVbsxNSLj/Bhx0V4eqZsaCxLqI84tEVnJ4LzNaQIMK9DwnYzzQaRkCCMm5dO+YlvA==
X-Received: by 2002:a5d:4152:0:b0:31c:7ada:5e05 with SMTP id c18-20020a5d4152000000b0031c7ada5e05mr1395517wrq.51.1694781917052;
        Fri, 15 Sep 2023 05:45:17 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id z6-20020a05600c220600b00402dbe0bbdcsm7369991wml.28.2023.09.15.05.45.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Sep 2023 05:45:16 -0700 (PDT)
Message-ID: <f5aee51d-0345-1294-a85b-ea96ed937685@linaro.org>
Date:   Fri, 15 Sep 2023 14:45:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH V2 1/4] dt-bindings: thermal: qcom-tsens: Add ipq5018
 compatible
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        srinivas.kandagatla@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        thara.gopinath@gmail.com, rafael@kernel.org,
        daniel.lezcano@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, dmitry.baryshkov@linaro.org
References: <20230915121504.806672-1-quic_srichara@quicinc.com>
 <20230915121504.806672-2-quic_srichara@quicinc.com>
 <03b0cafa-49c7-8838-b116-927c9649cbd3@linaro.org>
In-Reply-To: <03b0cafa-49c7-8838-b116-927c9649cbd3@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 15/09/2023 14:43, Krzysztof Kozlowski wrote:
> On 15/09/2023 14:15, Sricharan Ramabadhran wrote:
>> IPQ5018 has tsens v1.0 block with 4 sensors and 1 interrupt.
>>
>> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
>> ---
>>  [v2] Sorted the compatible and removed example
>>
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

No, unreviewed. Your driver says it is not compatible with
qcom,tsens-v1. This does not look right :/

Best regards,
Krzysztof

