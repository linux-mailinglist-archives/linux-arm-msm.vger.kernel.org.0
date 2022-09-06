Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C30695AE4B6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Sep 2022 11:49:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239376AbiIFJtF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Sep 2022 05:49:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239502AbiIFJsw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Sep 2022 05:48:52 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2ADA377EB0
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Sep 2022 02:48:50 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id b26so11618779ljk.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Sep 2022 02:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=is5fB0R47ED3ZHViAntaz2ARUOqJNIhKxUH3qXiQDA0=;
        b=gZKAtQWJ8a7F8Xb59+R8D4IM2euPOg5eRm5qGSSHJDUYE31sYWiBIHIEhIgkDsXPVW
         j/7CHLqMdfZAyxNbYe5gU4Pmn9qjzCxDUM6eFtYjndJGqO8+QZqat5CyQ7LAtf1ze2FF
         MKv591/g7bFoxjf2nNwULwTrMuE7UHNey1fbhN10TCYSWTwq22f8WWBLoC4V6UB8NCWq
         W9kpOkAxvGpJaYFPDyV4Ldi2JwddeIh1fEblwzfhStxbPHP6m8JUTv4JMa7eKDfZgbFR
         63jb/P7Ic4dJD379aUd3Epa4ohDXgh8LmQUz6a6qZrT0nz6NW7NPtp9Ck6cUnzhPk7+U
         xGaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=is5fB0R47ED3ZHViAntaz2ARUOqJNIhKxUH3qXiQDA0=;
        b=uqRPi/5IWdERwd4wEmxv+8Jvmmd9tg3NRaqh7+eCeQ+/pRCL3gdGwEufx9SxiEXtDl
         VoXtj1V4ZFWqg6hDkDMTDUdIqK+HXsea15VEnspCT22fjl29J4Ywhls8esfrCBsw7d51
         2/yGX9vvxXeYBpZqT26p+8XaaK0n2KN5JuKm8kfTZM2HxAjbBJRVjKcAn/pgWan2fvGW
         ThqOCWfG21Y8I0ONsh6huDFJzmnfy+5jLtkVuBV/VgHLU8Z3VMQPEjNFhKGAeKO4yeDQ
         ztejpXtgSy1uXFCYGQejPrspuoBG8QWkVHEVDZnzLmuHRc9RkmRRutqtYsrlvbPthftH
         BGWQ==
X-Gm-Message-State: ACgBeo1Zvk6Ks0WHa3dsp67E+7llMIx+9kmLCuJqfj4ecdNBN3Wlc2Nv
        H7Cg+4qghznBEu+cs2PXlHSEug==
X-Google-Smtp-Source: AA6agR5rwejMtTIwvG+jygFtc0Tj+r1PoDkl2o2deJTZdOieZjGhpP/lxCvSF+mq5+/XmVhb2hRGUA==
X-Received: by 2002:a2e:b609:0:b0:269:f386:58d8 with SMTP id r9-20020a2eb609000000b00269f38658d8mr3727876ljn.344.1662457728539;
        Tue, 06 Sep 2022 02:48:48 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id e17-20020a05651c039100b00261eb44bd16sm1805728ljp.5.2022.09.06.02.48.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Sep 2022 02:48:48 -0700 (PDT)
Message-ID: <d5f49147-11bb-7dbf-650b-769527604abf@linaro.org>
Date:   Tue, 6 Sep 2022 11:48:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3 2/7] dt-bindings: remoteproc: qcom,q6v5: Move MSM8916
 to schema
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Stephan Gerhold <stephan.gerhold@kernkonzept.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sireesh Kodali <sireeshkodali1@gmail.com>,
        Luca Weiss <luca@z3ntu.xyz>,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220831134626.2803117-1-stephan.gerhold@kernkonzept.com>
 <20220831134626.2803117-3-stephan.gerhold@kernkonzept.com>
 <5d4abf52-17d5-343b-b771-ac87bc2cff07@linaro.org>
In-Reply-To: <5d4abf52-17d5-343b-b771-ac87bc2cff07@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 06/09/2022 11:03, Krzysztof Kozlowski wrote:
> On 31/08/2022 15:46, Stephan Gerhold wrote:
> 
> Thank you for your patch. There is something to discuss/improve.
> 
>> +  qcom,halt-regs:
>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>> +    description:
>> +      Halt registers are used to halt transactions of various sub-components
>> +      within MSS.
>> +    items:
>> +      - items:
>> +          - description: phandle to TCSR syscon region
>> +          - description: offset to the Q6 halt register
>> +          - description: offset to the modem halt register
>> +          - description: offset to the nc halt register
>> +
>> +  memory-region:
>> +    items:
>> +      - description: MBA reserved region
>> +      - description: MPSS reserved region
>> +
>> +  firmware-name:
>> +    $ref: /schemas/types.yaml#/definitions/string-array
>> +    items:
>> +      - description: Name of MBA firmware
>> +      - description: Name of modem firmware
>> +
>> +  bam-dmux:
>> +    $ref: /schemas/net/qcom,bam-dmux.yaml#
>> +    description:
>> +      Qualcomm BAM Data Multiplexer (provides network interface to the modem)
>> +
>> +  smd-edge:
>> +    $ref: qcom,smd-edge.yaml#
>> +    description:
>> +      Qualcomm SMD subnode which represents communication edge, channels
>> +      and devices related to the DSP.
>> +
>> +    properties:
>> +      label:
>> +        enum:
>> +          - modem
>> +          - hexagon
> 
> This needs unevaluatedProperties:false. I will fix qcom,adsp.yaml which
> has similar problem.

... which might point to several warnings in all audio schemas. I am
working to fix these.


Best regards,
Krzysztof
