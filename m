Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C96F269AD5B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Feb 2023 15:09:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229809AbjBQOJP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Feb 2023 09:09:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbjBQOJO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Feb 2023 09:09:14 -0500
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FDD367816
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Feb 2023 06:09:12 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id e30so1218578ljb.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Feb 2023 06:09:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eAcHRXTLt7SupN6OB2+PfIbmUDEWyQYUaBk0d3PubKo=;
        b=XX+5ab8wML2ibWLmDYvDu+h3Mjgg84TttF8Sb5bXmJ9vgkDafURuIrnVx3lJYV+THw
         T2pujcOHq56N2jHo1P0leoHSGFwgmPR4Jw0E7ocmygdE090LufshHZ9AiMef2OMW+YrE
         sPvbeCpsqWcTwFa224uaonT5w6OY7JrIv62jDSjU5mcJ5P5dLujI7wYwE8LSCx5DXSDj
         b4R5Zo6SBeDwrK1R28i+kpUfe+BKB4Mtu/TMafx3z75NHWPNNNg0HEFSkcu/k243HfgJ
         g2bi+w61U213J6NznH2zJOetaTpDu9cQTqyDgmfu02U62rJr8dS6RXobS/9bKrRGG1te
         6Oog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eAcHRXTLt7SupN6OB2+PfIbmUDEWyQYUaBk0d3PubKo=;
        b=UEdXric1HKlDDfVl+Z4+3uRGr9Pm6Qw+ZNiOOCaIXQbC4dc93NBAsCtjvGdW/9++K+
         c2MD5RG6UF9sWzKPNfCZVqdRHFsyuaL8MbokOTI6amsVe7l4y9LzDBrye/bru6kEDN/L
         wkoyew6em4bdsxotzjdNRA6xVW6pmdNjDoirrEMfGvqynCYLOeWdH1ukY+1ahLuxkvvM
         bu9GmG9PtLOio/cv/r+D0OY7FgD/ZUzfqoCnkeFYaVRNScRWjWlBLGE2XqW3z838IQyS
         pX2s4iCgZRvz5JGjJiwaRVw2Tsjwj/sZTXi/LjucVNTZrntZa5v1Ts4PTOBPofPDWPtY
         VHcQ==
X-Gm-Message-State: AO0yUKVIVlbsNiGumBKqRrsVdsbgrqjANt1VfMpPsiHeoMaqS7xLlvWU
        De4gtu0wslGcYxjMiln7z/WbcA==
X-Google-Smtp-Source: AK7set/jy4R5UST1yIabXGvqmH2beS3jnDZRk+0LwZDG70gUpUnQhKS9mjEG66BUv/onu23P4gQDdQ==
X-Received: by 2002:a2e:a238:0:b0:294:70b7:fd65 with SMTP id i24-20020a2ea238000000b0029470b7fd65mr863927ljm.30.1676642950765;
        Fri, 17 Feb 2023 06:09:10 -0800 (PST)
Received: from [192.168.1.101] (abxh117.neoplus.adsl.tpnet.pl. [83.9.1.117])
        by smtp.gmail.com with ESMTPSA id t5-20020ac243a5000000b004dcf20843efsm16847lfl.239.2023.02.17.06.09.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Feb 2023 06:09:10 -0800 (PST)
Message-ID: <4a8ff51e-b4d8-23bc-e9d6-e27ecf1e303d@linaro.org>
Date:   Fri, 17 Feb 2023 15:09:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v10 3/6] dt-bindings: soc: qcom: cpr3: Add bindings for
 CPR3 driver
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Robert Marko <robimarko@gmail.com>,
        Viresh Kumar <vireshk@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Niklas Cassel <nks@flawful.org>, devicetree@vger.kernel.org,
        Nishanth Menon <nm@ti.com>, Andy Gross <agross@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, linux-pm@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Mark Brown <broonie@kernel.org>
References: <20230217-topic-cpr3h-v10-0-67aed8fdfa61@linaro.org>
 <20230217-topic-cpr3h-v10-3-67aed8fdfa61@linaro.org>
 <167664119785.650200.1249609435784298678.robh@kernel.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <167664119785.650200.1249609435784298678.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 17.02.2023 14:47, Rob Herring wrote:
> 
> On Fri, 17 Feb 2023 12:08:26 +0100, Konrad Dybcio wrote:
>> From: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
>>
>> Add the bindings for the CPR3 driver to the documentation.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
>> [Konrad: Make binding check pass; update AGdR's email]
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
>>  .../devicetree/bindings/soc/qcom/qcom,cpr3.yaml    | 299 +++++++++++++++++++++
>>  1 file changed, 299 insertions(+)
>>
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/qcom/qcom,cpr3.example.dtb: opp-table-cprh: opp-1: 'qcom,opp-cloop-vadj', 'qcom,opp-oloop-vadj' do not match any of the regexes: 'pinctrl-[0-9]+'
> 	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/opp/opp-v2-qcom-level.yaml
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/qcom/qcom,cpr3.example.dtb: opp-table-cprh: opp-2: 'qcom,opp-cloop-vadj', 'qcom,opp-oloop-vadj' do not match any of the regexes: 'pinctrl-[0-9]+'
> 	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/opp/opp-v2-qcom-level.yaml
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/qcom/qcom,cpr3.example.dtb: opp-table-cprh: opp-3: 'qcom,opp-cloop-vadj', 'qcom,opp-oloop-vadj' do not match any of the regexes: 'pinctrl-[0-9]+'
That's added in the previous patch

> 	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/opp/opp-v2-qcom-level.yaml
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/qcom/qcom,cpr3.example.dtb: opp-table-cprh: opp-3:qcom,opp-fuse-level:0: [2, 3] is too lonAnd that's fixed in

https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/pm.git/commit/?h=opp/linux-next&id=68d8ad3bd9c397f2bf009368cb13e48cb91ea018

Konrad
> 	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/opp/opp-v2-qcom-level.yaml
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230217-topic-cpr3h-v10-3-67aed8fdfa61@linaro.org
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.
> 
