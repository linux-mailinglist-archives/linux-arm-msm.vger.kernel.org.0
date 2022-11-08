Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4EED862100C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Nov 2022 13:14:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232896AbiKHMOr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Nov 2022 07:14:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233826AbiKHMOq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Nov 2022 07:14:46 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4758929C84
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Nov 2022 04:14:45 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id t1so8682257wmi.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Nov 2022 04:14:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=guhzhpPcTidguGT/JozMVbs7dH6zHHElRbNuwoyBMnU=;
        b=NmpxPx/cCz5orYkkXdEs729vSlQNk5im6wtVfGl0fjJ07NrvJ25E9lxkVnW1oBxzkn
         8L//XN1xkPdduoHFYk6WyXyqI8I2SOiXsY8vpCN8gBffWv7bXWg9vaZoDf7j+b4KaYqD
         n5Elyu5Aer33pnhJPLRx05/Tv1bEKmN6mXgIi65jnVQanE0ZuYgEULsRPTJ03nraW29t
         f+vKgP40e8hdiTI5e5DmS2ncUPnEwiair3jFPW5jYqcOGVEKq3975xFCCnKe+hZCzQuQ
         3mAKB+2HbdNGuWJVq3tjadGtqBkVjWIPJnP+XC2IXjw2ZcbL73zwnnBJBR721HNopFnS
         EPmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=guhzhpPcTidguGT/JozMVbs7dH6zHHElRbNuwoyBMnU=;
        b=DBV9LNQU9h3DWDezr+mKDM7CmA+qRc6MKVVxQWG6lUZw4d9V1xONPRQCNzW/zmHL+4
         NoNhPGnZWDdQGyJc5P9rLYWrocIn9cq+Obo03AiXZNDYcX/1Z69uJjIDj0yRhCzcy22R
         WBPmmUwHn5by36KROhBz0I90Z0CJgvLO5fv4gyBYGz6CvYDSOgpAE7INOxGt+n46xP75
         hauVg1QMzfNGOvQ+rrctYrsPK8hsEYj5Pdab2311B0sCFfc9aPI6U21c9luIZyPoVJ/9
         KhEMGmMJpIwDTwUiMw/TKwe9kJaRjoyyoSHpEQ0X2xLyh/fvjRkTHTwbof2+JKKu4gj3
         yYcA==
X-Gm-Message-State: ACrzQf37/gemetZZ/eMIrP1vCV0CsQVcGn+dFVq2Z2NiNnXoZGjwMIW+
        JViIfAstgFhTGZgr97i77S7HTw==
X-Google-Smtp-Source: AMsMyM7ZZ52pMforpdbVNtRKkZwO+PARP7ohbxCf7KdQ/+YvwgivvQmJAcIdV8ZYmOpRSTHg/wAkUA==
X-Received: by 2002:a05:600c:4f49:b0:3cf:82b9:2fb7 with SMTP id m9-20020a05600c4f4900b003cf82b92fb7mr25579645wmq.198.1667909683805;
        Tue, 08 Nov 2022 04:14:43 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:7474:d539:20c5:d55e? ([2a01:e0a:982:cbb0:7474:d539:20c5:d55e])
        by smtp.gmail.com with ESMTPSA id v15-20020a05600c444f00b003c70191f267sm15889839wmn.39.2022.11.08.04.14.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Nov 2022 04:14:43 -0800 (PST)
Message-ID: <2b810f82-1358-1eeb-122d-c80fc9a8dff2@linaro.org>
Date:   Tue, 8 Nov 2022 13:14:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v3 3/5] dt-bindings: regulators: convert non-smd RPM
 Regulators bindings to dt-schema
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, Mark Brown <broonie@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Lee Jones <lee@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        devicetree@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>
References: <20221005-mdm9615-pinctrl-yaml-v3-0-e5e045644971@linaro.org>
 <20221005-mdm9615-pinctrl-yaml-v3-3-e5e045644971@linaro.org>
 <166639133391.573161.13030451062658991334.robh@kernel.org>
Reply-To: neil.armstrong@linaro.org
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <166639133391.573161.13030451062658991334.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Rob,

On 22/10/2022 00:28, Rob Herring wrote:
> On Fri, 21 Oct 2022 17:27:55 +0200, Neil Armstrong wrote:
>> Convert the non-SMD Regulators bindings to dt-schema, the old text based
>> bindings will be deleted later since the RPM bindings are not yet converted.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   .../bindings/regulator/qcom,ipc-rpm-regulator.yaml | 128 +++++++++++++++++++++
>>   1 file changed, 128 insertions(+)
>>
> 
> Reviewed-by: Rob Herring <robh@kernel.org>

Following Bjorn's request, can I keep your review for a v4 with the file
renamed to qcom,rpm-regulator.yaml and title changed to "Qualcomm RPM regulator" ?

Thanks,
Neil
