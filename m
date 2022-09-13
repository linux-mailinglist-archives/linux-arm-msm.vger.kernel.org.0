Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 660765B6A4A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Sep 2022 11:08:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231423AbiIMJIb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Sep 2022 05:08:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231430AbiIMJIa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Sep 2022 05:08:30 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A2F1558E8
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Sep 2022 02:08:28 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id n17-20020a05600c501100b003a84bf9b68bso9043885wmr.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Sep 2022 02:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=TTwyWPBlC2nq54/plFBOskLhs9iNQkcq2izDuthcGZo=;
        b=EVbXz/COmLDDnayLaWDmCDTed4QDwYcFW9tXmbl51O1CGK8hI3C0mGI0ar+OIAXxel
         nKTPGkZ17SDl5w3odiF8JKOAkBYFglYVAju2PPYHW9ue0YauePy7g4KXnkR92kvDAwsl
         +ykzDuu6LZSSsk85hVic7elSrucs3RxWxEr/DRDdp4L7/1v11FGaIB/994852kFCtQv1
         99vHYursVGu/o+IAJ2UvyWwYFaijUetqzYcLYUNprGPo9R0vHwq47G9aVuRusfR6Dl8D
         CnGI5MsRctvqPUZ57oWccXt6PNjLJBhP1ea8KXJ5IhmjHSCWeb1P/mSu8tgnAIpKSoTj
         +H3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=TTwyWPBlC2nq54/plFBOskLhs9iNQkcq2izDuthcGZo=;
        b=ZYYm0fYkA1oPx+VfrdKKDdj8Hh9M1LA6JS3v0NAPYtKXB3EWoF8fObmuTOiG00vSy9
         kJslxEkkartW2Dje+Ek4uYCi+oNpkWLYW0c39FCwTHvudluATYGDYGfbdAZe3fE4b5ku
         UPCh4lVYBfRv3dYj/Sf92UDp8KFO+e+yXeRq/RigZlfBDkR1DNdNaUSpizr2Xf4zecDg
         TYmOH64qHuAfWcR4uyYrY2hGOxskgOUlYGYFphEULxIVzHTEj3XykDEnMXw7COhabchW
         LNcbu19eJIzTS4eV9Iae1WWPn2QorJP4MdzjuaCwdL4/gqvN4qeFqHQebQVRNIDdcfsq
         0Crw==
X-Gm-Message-State: ACgBeo11UzfNMLfouImVLcD391NLzjpy58EeE5oVCx1QHtI2Rfbl3In/
        gxEcyF2zA6IxmPjeDSKLrOFJdg==
X-Google-Smtp-Source: AA6agR6MS0ohvt3dRo5ZeiC0fhkxAEld5LpHSpFEL7u4/Ny/JfV4trZR/bAn5Ie8U9zgpAjIaPp5VQ==
X-Received: by 2002:a05:600c:4fd4:b0:3a6:2694:e3bc with SMTP id o20-20020a05600c4fd400b003a62694e3bcmr1563171wmq.60.1663060106741;
        Tue, 13 Sep 2022 02:08:26 -0700 (PDT)
Received: from [10.119.22.201] ([89.101.193.70])
        by smtp.gmail.com with ESMTPSA id y4-20020adfd084000000b002206203ed3dsm9756730wrh.29.2022.09.13.02.08.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Sep 2022 02:08:26 -0700 (PDT)
Message-ID: <bf9c7756-22ec-9900-b280-dcdf1e102178@linaro.org>
Date:   Tue, 13 Sep 2022 11:08:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3 00/14] ASoC/qcom/arm64: Qualcomm ADSP DTS and binding
 fixes
Content-Language: en-US
To:     Mark Brown <broonie@kernel.org>
Cc:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami <bgoswami@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220908091946.44800-1-krzysztof.kozlowski@linaro.org>
 <Yx9IKU4+SjQJGuP1@sirena.org.uk>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Yx9IKU4+SjQJGuP1@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/09/2022 16:54, Mark Brown wrote:
> On Thu, Sep 08, 2022 at 11:19:32AM +0200, Krzysztof Kozlowski wrote:
> 
>> Dependencies/merging
>> ====================
>> 1. The DTS patches are independent.
>> 2. The binding patches should come together, because of context changes. Could
>>    be one of: Qualcomm SoC, ASoC or DT tree.
> 
> I'm happy to pick them up if people are happy with that, they
> look to be mostly ASoC changes?

Hi Mark,

This sounds reasonable, please go ahead. Just take note that I sent a v4
with minor changes (re-order for better bisectability and one new patch
 in the set).

Best regards,
Krzysztof
