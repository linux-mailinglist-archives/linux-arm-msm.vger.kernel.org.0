Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D4E5687F89
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Feb 2023 15:09:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231866AbjBBOJu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Feb 2023 09:09:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229609AbjBBOJt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Feb 2023 09:09:49 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 481018A7C4
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Feb 2023 06:09:48 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id f7so2117685edw.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Feb 2023 06:09:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Juz5ueJFXhL7XKrszOQfs1PBXZrl+c4YL8+rqK6U1U8=;
        b=j+WEHtOCCfA7VlRwL3Iqo65d8MZ3CI+SwAlrN5hO4rNGo+gqFwATS9fqlJq0nJTLxW
         5zY3WEL3+fCQvy8mpdZzFfDHJbCmZ9Kbtb4wm6vd8DgQC7FXZsvva0ZFIMbo5QBaNrdd
         YfRAleetYwSoObIcZpWVx2kkVzhZPZn3W6x7yedvDbnhRavShn8cb4Bc5Gc+WT55AsdA
         pbA9dJuhSdxrSCuMhqj94VOAG2nxgiW8iOkj7md17E8VRCMgk2FnaIjUZFOQqYqlP+nB
         HWVr5BTar24Pr20pp5RdPNnOlKk/XfpTMB8/54smOyTgcDyvXVoaFCJ5x1SvnNV5RJnH
         QDmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Juz5ueJFXhL7XKrszOQfs1PBXZrl+c4YL8+rqK6U1U8=;
        b=hN07UTbmGjAo4drvAwDO8ul+wzhstIi+dlJEeeDw8VAPTYNhWCSk3B3Z5pP1jgrvY0
         D7/nx+lgMFAarzROq8rGugSZOvZmZRBSTlJgZQUChnCs6zHHu+Gm7LgbsKfK8+t4c2Kj
         2STTj1+v7UOMSlsvw01QN2Zier16gRIl8FLWJiQZMwsfgJ5LhVRbxxw962KXcvX+GZ7J
         JTN+LX8f2OZSfx3x8hSD38GcZ+TvE/hGxavzN/fTIX64zTJE/h+4ru26aMtOrgb50xGN
         YrW74eJV2F2cFx+JIznsX74VT/JzsV5F/wM3kDvp/1W1J0yzsMB1qqXapZPeDUsdC587
         SJgg==
X-Gm-Message-State: AO0yUKX1wBOYvioH5foJ70X1Q9LuqAAh9+wkHsrigPtv0ysz+PpY/Sx4
        hS4x4ncDHahTaK8YJHcl7swVYA==
X-Google-Smtp-Source: AK7set/VHn/9zc33kX4W55nqc1RPP2cZPMZ9u7RS018t6p6yIh4L+e2MMUigyutlhqIzXxHqdt80PQ==
X-Received: by 2002:a05:6402:34cc:b0:4a2:5b11:1a51 with SMTP id w12-20020a05640234cc00b004a25b111a51mr6831769edc.2.1675346986772;
        Thu, 02 Feb 2023 06:09:46 -0800 (PST)
Received: from [192.168.1.102] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id z3-20020a50eb43000000b0045b4b67156fsm11197555edp.45.2023.02.02.06.09.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Feb 2023 06:09:46 -0800 (PST)
Message-ID: <65aefb8a-7384-ce0c-9aab-cb8fd38bc1c6@linaro.org>
Date:   Thu, 2 Feb 2023 16:09:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.0.2
Subject: Re: [PATCH v8 6/9] dt-bindings: qcom-qce: Add new SoC compatible
 strings for qcom-qce
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, Rob Herring <robh@kernel.org>,
        Jordan Crouse <jorcrous@amazon.com>
References: <20230202135036.2635376-1-vladimir.zapolskiy@linaro.org>
 <20230202135036.2635376-7-vladimir.zapolskiy@linaro.org>
 <0fc4c509-2db4-0bce-75c6-11835d6987d0@linaro.org>
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <0fc4c509-2db4-0bce-75c6-11835d6987d0@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Krzysztof,

On 2/2/23 15:57, Krzysztof Kozlowski wrote:
> On 02/02/2023 14:50, Vladimir Zapolskiy wrote:
>> From: Bhupesh Sharma <bhupesh.sharma@linaro.org>
>>
>> Newer Qualcomm chips support newer versions of the qce crypto IP, so add
>> soc specific compatible strings for qcom-qce instead of using crypto
>> IP version specific ones.
>>
>> Keep the old strings for backward-compatibility, but mark them as
>> deprecated.
>>
>> Cc: Bjorn Andersson <andersson@kernel.org>
>> Reviewed-by: Rob Herring <robh@kernel.org>
>> Tested-by: Jordan Crouse <jorcrous@amazon.com>
>> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>> ---
>>   .../devicetree/bindings/crypto/qcom-qce.yaml  | 19 +++++++++++++++++--
>>   1 file changed, 17 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
>> index a159089e8a6a..4e0b63b85267 100644
>> --- a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
>> +++ b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
>> @@ -15,7 +15,22 @@ description:
>>   
>>   properties:
>>     compatible:
>> -    const: qcom,crypto-v5.1
>> +    oneOf:
>> +      - const: qcom,crypto-v5.1
>> +        deprecated: true
>> +        description: Kept only for ABI backward compatibility
>> +      - items:
> 
> Drop items.
> 
>> +          - enum:
>> +              - qcom,ipq4019-qce
>> +              - qcom,ipq6018-qce
>> +              - qcom,ipq8074-qce
>> +              - qcom,msm8996-qce
>> +              - qcom,sdm845-qce
>> +              - qcom,sm8150-qce
>> +              - qcom,sm8250-qce
>> +              - qcom,sm8350-qce
>> +              - qcom,sm8450-qce
>> +              - qcom,sm8550-qce
> 
> Unfortunately my comments from v6 was not addressed, nor responded to.
> 
> We already got a public comment from community that we handle Qualcomm
> bindings in a too loose way. I don't think we should be doing this (so
> keep ignoring ABI), just for the sanity of cleanup.
> 
> It's fine to discuss it with me, but since v6 there was no discussion,
> so let's be clear here - NAK on ABI break.

Can you please elaborate, what is the ABI break you find here?

As for me it looks like an incremental change, thus I don't understand
your comment why ABI is broken.

--
Best wishes,
Vladimir
