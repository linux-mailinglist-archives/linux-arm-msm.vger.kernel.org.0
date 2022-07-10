Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE8AC56D048
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Jul 2022 19:00:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229563AbiGJRAq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 10 Jul 2022 13:00:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229579AbiGJRAo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 10 Jul 2022 13:00:44 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B49713E93
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 Jul 2022 10:00:43 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id e12so5267622lfr.6
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 Jul 2022 10:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=z+025bwtj1+XxqfJAYSywQz3zfNZwf8KlNReu6sIH04=;
        b=r3SWgrDqeFIihjpgWX1tGqhS9nvKTMAMwhpH+U4sAOXaUvV9tjewn2dLBHPTMq+GTs
         Ff2uJT7icSDEVCN/UYDLjVOMYKdU/iezSVoQtEmn8xcy3U0YiSIeA9ug+I1y7L6ZUzPT
         QEl3dFzenx2BBNwis/oW7FiSmEhelbQZjnk61dx6cm28RBjI5yZc5brc9zFaArLGqP83
         5atpqkhw3etHGTVclLy7WhUWAdOdsubJwxjzNT7WchU0tzoHl79G7MSVYYcNuMYQLLNY
         flT7yNC4yKbSM1ZQd31FxPechG9moAl22MNKSMzPsbdgAoh7uVFXUIh08H2sqRK1CGJl
         SXuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=z+025bwtj1+XxqfJAYSywQz3zfNZwf8KlNReu6sIH04=;
        b=oWEPLR24jff+xe1LSdlGIs/oMe9O7EtF2o3bR9DhQ7/G3oCTzauwE+ZrpUPYiwLlWi
         Hg3o+Gr0xD2+ViQmLb1YigKOZkCv7zlJ4SBydp3j64GAitPQeS5r+szFw/LtYyOjByte
         754bpS0EUU1dabBXzhnM9R9V0QnmM6vv536H5/TVpPCYdtC6A8FgHm9Ws2yLj06lrD5S
         ELU237HaVDtssJMlMa1o3eZsMR19/0AQG2klpDYcbHbVueOK2OAjUqiS7FhIPM+W4YzF
         VsIK1FA1IpE9ZXFopwjd1gRuPYBR0nExGL0EsqfY9kDhEBKznKnnZr2MRmHtozVvdv6E
         /kvQ==
X-Gm-Message-State: AJIora9dBmG28Xnq5UyXmZ2eJaaF/YfsSXFlEnv12305k/gVY6Aa40PX
        gCPwyHV+B998HE56bW4IDFV2qA==
X-Google-Smtp-Source: AGRyM1sjRnBSq/F0i1b5lkm7tuWeJt24tjr1ryEGRO6bsTBrwKL2G8G8JFM5hXn6oM8WNvELa38Rbw==
X-Received: by 2002:a05:6512:1096:b0:489:cbad:de4f with SMTP id j22-20020a056512109600b00489cbadde4fmr5557082lfg.164.1657472441640;
        Sun, 10 Jul 2022 10:00:41 -0700 (PDT)
Received: from [192.168.43.7] ([188.162.65.244])
        by smtp.gmail.com with ESMTPSA id q22-20020a19a416000000b0047968606114sm1005525lfc.111.2022.07.10.10.00.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 Jul 2022 10:00:41 -0700 (PDT)
Message-ID: <20269855-766d-4954-b6aa-bcff6d67c967@linaro.org>
Date:   Sun, 10 Jul 2022 20:00:39 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 04/11] dt-bindings: display/msm: split qcom, mdss
 bindings
Content-Language: en-GB
To:     Rob Herring <robh@kernel.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, Andy Gross <agross@kernel.org>,
        Sean Paul <sean@poorly.run>, freedreno@lists.freedesktop.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Clark <robdclark@gmail.com>, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Daniel Vetter <daniel@ffwll.ch>
References: <20220710090040.35193-1-dmitry.baryshkov@linaro.org>
 <20220710090040.35193-5-dmitry.baryshkov@linaro.org>
 <1657472056.252419.1602129.nullmailer@robh.at.kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1657472056.252419.1602129.nullmailer@robh.at.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/07/2022 19:54, Rob Herring wrote:
> On Sun, 10 Jul 2022 12:00:33 +0300, Dmitry Baryshkov wrote:
>> Split Mobile Display SubSystem (MDSS) root node bindings to the separate
>> yaml file. Changes to the existing (txt) schema:
>>   - Added optional "vbif_nrt_phys" region used by msm8996
>>   - Made "bus" and "vsync" clocks optional (they are not used by some
>>     platforms)
>>   - Added (optional) "core" clock added recently to the mdss driver
>>   - Added optional resets property referencing MDSS reset
>>   - Defined child nodes pointing to corresponding reference schema.
>>   - Dropped the "lut" clock. It was added to the schema by mistake (it is
>>     a part of mdp4 schema, not the mdss).
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   .../devicetree/bindings/display/msm/mdp5.txt  |  30 +---
>>   .../devicetree/bindings/display/msm/mdss.yaml | 161 ++++++++++++++++++
>>   2 files changed, 162 insertions(+), 29 deletions(-)
>>   create mode 100644 Documentation/devicetree/bindings/display/msm/mdss.yaml
>>
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> ./Documentation/devicetree/bindings/display/msm/mdss.yaml: Unable to find schema file matching $id: http://devicetree.org/schemas/phy/qcom,hdmi-phy-qmp.yaml

The tree is based on linux-next (well, msm-next, which is a part of 
linux-next).


-- 
With best wishes
Dmitry
