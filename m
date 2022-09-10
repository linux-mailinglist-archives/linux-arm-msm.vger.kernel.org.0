Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1CE855B47B3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Sep 2022 19:22:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229593AbiIJRWI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 10 Sep 2022 13:22:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbiIJRWG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 10 Sep 2022 13:22:06 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A1123C154
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Sep 2022 10:22:05 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id bq9so8384689wrb.4
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Sep 2022 10:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=nPCSVK9pdaIBJcPEVZGRT55TFQr/Oe9ib1kIMeabBB8=;
        b=CHH6mDbo9WtruJDHBaleEzJCvp4+L6hVaUy7X+365IqMW2Exnbd/pIElaqqLBOngEx
         JoCVTF9sRENaZcEecykQ4R0kTsgePdfeZ17NRtVdpJxD8KhiOY/FmiusP4hdpub34yhV
         GLRMjxz73OgB5BZe06p13GcO62EM61Z45BhpPo0Thy2ZxkWkzzJyN76K02IlGrMS/yYa
         Zw+57X8HNwXWCKNJvwuKHnzOXbcvIo+xpaTJU3wqz5xEb8rojHYdN7p2eOslkYdTa/Su
         R4P1wyMlBOmeFa5f0Nti9R3X1acfeRw6mJMS/RlXwX1QcC5hoKp8TwzZ7zxI5XZ+7fFK
         jyPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=nPCSVK9pdaIBJcPEVZGRT55TFQr/Oe9ib1kIMeabBB8=;
        b=vEQgW/7IjH26VWEqz9bgUxuYHBOyDWn09Yf8tuJOguKwLW6+f9yZbf8jK+wlK5jfCg
         KI2Yh9RoLmVS6PSAvnvniFaHzOlkA/eifVk0GbsRVzaQZ+Jrl060Qv1CiCAbGEGKEvTC
         N9fvxrA1VgVWuHDPiihBzptZd2dc+LcmcM2mf2vsBSWo74tH5Zq9e2E7PhEBzrPJ9ui5
         KiNzyMM50g3hJB80D3CxH9/azwOaMmAa5OloPPJ+PKsU4Nl016w/3wn8mftyR+rQlpUC
         oh11724uUUY5xU/YO96dX4NHzwAN+HAeeuYfnGmSX9HId42OfOE28iz9e3W9QvURE6dm
         1B3g==
X-Gm-Message-State: ACgBeo0d9x+mYvUhUySs+fZFXtandSYfl9HxmSeitWcX8zoQDcB1/cFB
        cyxK83Jx6E/3JFfdsmcyueH9Qg==
X-Google-Smtp-Source: AA6agR5KKtHnpe0ulUs2She+q6y/RMaBCM+sygMPbaVKYfTNsEaZ5DavYqYaXJwgwNqVKHzvIUhBsQ==
X-Received: by 2002:adf:fbc7:0:b0:220:6004:18ca with SMTP id d7-20020adffbc7000000b00220600418camr10582323wrs.632.1662830524071;
        Sat, 10 Sep 2022 10:22:04 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id o28-20020a05600c511c00b003b462b314e7sm3927105wms.16.2022.09.10.10.22.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Sep 2022 10:22:03 -0700 (PDT)
Message-ID: <ee9f1ba2-cc53-beeb-7f96-5d1097f8e2e7@linaro.org>
Date:   Sat, 10 Sep 2022 18:22:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 1/1] ASoC: dt-bindings: Mark old binding
 qcom,cpu-lpass-apq8016 as deprecated
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, robh+dt@kernel.org,
        agross@kernel.org, devicetree@vger.kernel.org,
        andersson@kernel.org, krzysztof.kozlowski+dt@linaro.org
References: <20220910014206.1101962-1-bryan.odonoghue@linaro.org>
 <20220910014206.1101962-2-bryan.odonoghue@linaro.org>
 <1662821635.164850.34696.nullmailer@robh.at.kernel.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <1662821635.164850.34696.nullmailer@robh.at.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/09/2022 15:53, Rob Herring wrote:
> On Sat, 10 Sep 2022 02:42:06 +0100, Bryan O'Donoghue wrote:
>> We've had some discongruity in the compatible string of the lpass for 8916
>> for a while.
>>
>> Mark the old compat as deprecated. New SoC additions such as msm8936 and
>> msm8939 should use the compat string "qcom,apq8016-lpass-cpu".
>>
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> ---
>>   .../devicetree/bindings/sound/qcom,lpass-cpu.yaml   | 13 ++++++++-----
>>   1 file changed, 8 insertions(+), 5 deletions(-)
>>
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> ./Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml:23:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
> 
> dtschema/dtc warnings/errors:
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/patch/
> 
> This check can fail if there are any dependencies. The base for a patch
> series is generally the most recent rc1.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit.
> 

Bah, you were right.

I didn't see this in the noise generated by the tool

/home/deckard/Development/qualcomm/qlt-kernel/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml:23:9: 
[warning] wrong indentation: expected 10 but found 8 (indentation)

Is there some way to slim the output down to just the yaml file I am 
interested in ?

Dmitry submitted a patch for this at some stage I think
