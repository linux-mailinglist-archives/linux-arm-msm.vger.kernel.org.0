Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F79F660E02
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Jan 2023 11:43:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232677AbjAGKnC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 7 Jan 2023 05:43:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236844AbjAGKmx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 7 Jan 2023 05:42:53 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A023CF1A
        for <linux-arm-msm@vger.kernel.org>; Sat,  7 Jan 2023 02:42:50 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id bf43so5536067lfb.6
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Jan 2023 02:42:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kGN16aqYn7nnEFzLqCDtMXfMmc5KaVn18pKv+2l0zPs=;
        b=VY6oNvkmWjhRGic3GpIAfMU1yEMK3tGNHwnDzV6wHrhp4Fbe0g3dAEcc9NRFRQseSh
         ZiXkGIpNBi7jMJVNVqJ5Di9K2HNXRajJFPm9WNpbonRZhzJ2m5Sevy5n7EIbo/14Jc33
         67tISzYCv6Jrrjnjk9e72nOwg45IaCKlU8LwTRpvNtBS/VoIHXgR2EjIURaao6Co7suX
         y94J3fb1pvMglACkQGj4mUjhJz5TR4YoES4lmvxEqZKPAyqBAc84wkvIumBUAr4ddLgr
         yXFAyC9exRV2N2DuV9s2UK6JV0V0Uhy55fddnnQU3RSbUXcmfU/+XWiVOeN5zuiUvO6R
         QePw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kGN16aqYn7nnEFzLqCDtMXfMmc5KaVn18pKv+2l0zPs=;
        b=v3DZywON0bKvTlSVVTQ2HJs1UAUm89PJsrvS3T/fyMrhGaim1LKUOzq5USfzyyy3fd
         vMLc3fYbB1hUz425NMA0OcMz0rxOMd9EsXBRBl84/+ccILhTAiGhX5mGS9PgW4wYLnT8
         i5FDOQzBE0+bJxBvTEfSjOctJp398UH+/kKQvqzJ742NBE/oMoAdxZHCBE8wkuB0CFd3
         C7t0gaId/Ccji4uT2rF7KMRw9inGK2dKloYhY57773MycMU1ERZB3/OyF1HWeRwnPUV/
         5o3wEpRtYJtTXCYBwh7akkuuu4D2AWGV5Klt6tM46ClXPfcHWSFR8E7M3OBPW/dGK2O7
         DCiw==
X-Gm-Message-State: AFqh2kp6zfGBqZqg2cMeGK2Y1v3kPPGaoQWaW26VMp5uNwpgcrgXLbAS
        P8r89W8JbRC6Ax48beSB4et7Vg==
X-Google-Smtp-Source: AMrXdXvCBCR/iCDguU7sLHfJxkX+3TX2Kf/NNCLnyW6RQirRqdHF7YJwwhhzcrCpPLB2CmMni/Nn9Q==
X-Received: by 2002:a05:6512:2987:b0:4a4:68b7:d642 with SMTP id du7-20020a056512298700b004a468b7d642mr16526215lfb.41.1673088169031;
        Sat, 07 Jan 2023 02:42:49 -0800 (PST)
Received: from [192.168.1.101] (abxi45.neoplus.adsl.tpnet.pl. [83.9.2.45])
        by smtp.gmail.com with ESMTPSA id m17-20020a056512015100b004cb45148027sm529467lfo.203.2023.01.07.02.42.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Jan 2023 02:42:48 -0800 (PST)
Message-ID: <c9d22563-ed9c-7fba-e00d-02eb1cdfbef8@linaro.org>
Date:   Sat, 7 Jan 2023 11:42:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 1/2] dt-bindings: reserved-memory: rmtfs: Document
 qcom,assign-to-nav
Content-Language: en-US
To:     Bjorn Andersson <andersson@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, agross@kernel.org,
        krzysztof.kozlowski@linaro.org, marijn.suijten@somainline.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230102165034.830620-1-konrad.dybcio@linaro.org>
 <20230106175558.7sfutxaishdlwhoe@builder.lan>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230106175558.7sfutxaishdlwhoe@builder.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 6.01.2023 18:55, Bjorn Andersson wrote:
> On Mon, Jan 02, 2023 at 05:50:33PM +0100, Konrad Dybcio wrote:
>> Some SoCs mandate that the RMTFS is also assigned to the NAV VM, while
>> others really don't want that. Since it has to be conditional, add a
>> bool property to toggle this behavior.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
>> v1 -> v2:
>> - Rewrite the newly added description
>>
>>  .../devicetree/bindings/reserved-memory/qcom,rmtfs-mem.yaml | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/reserved-memory/qcom,rmtfs-mem.yaml b/Documentation/devicetree/bindings/reserved-memory/qcom,rmtfs-mem.yaml
>> index 2998f1c8f0db..4026788a4e40 100644
>> --- a/Documentation/devicetree/bindings/reserved-memory/qcom,rmtfs-mem.yaml
>> +++ b/Documentation/devicetree/bindings/reserved-memory/qcom,rmtfs-mem.yaml
>> @@ -31,6 +31,12 @@ properties:
>>      description: >
>>        vmid of the remote processor, to set up memory protection
>>  
>> +  qcom,assign-to-nav:
>> +    type: boolean
>> +    description:
>> +      Whether to also assign the region to a third (NAV) VM, as opposed to
>> +      the usual 2.
> 
> For better or worse, the binding currently takes the vmid of the first
> instance in qcom,vmid. Would it not be cleaner to turn qcom,vmid into an
> array and pass the nav vmid as a second element in that array?
I suppose I could do that..

Konrad
> 
> Regards,
> Bjorn
> 
>> +
>>  required:
>>    - qcom,client-id
>>  
>> -- 
>> 2.39.0
>>
