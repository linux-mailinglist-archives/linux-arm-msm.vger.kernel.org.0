Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4C275F6179
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Oct 2022 09:14:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230174AbiJFHOM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Oct 2022 03:14:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230138AbiJFHOK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Oct 2022 03:14:10 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4000388DF4
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Oct 2022 00:14:08 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id f9so1158779ljk.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Oct 2022 00:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=GE8M6ZJ5o6R2icJ1+JO0lmFsJdBKSsRC/yaJmko71mo=;
        b=z2kC3GALZ8dDDiEWEYQdlZCcECxKbAO3Rwx1Yclyj9+WJrqQ8MRrjM6FqVsi1ob2Lm
         qWGE+mnpRegeTDhIX4Fpwi4KOkJ5y6QowY4Go7puj/HNocWt5vQNZ3XlWCvzZolZLyGA
         +g6C27UN6TZnLxD0F0LDFEfVtBwN2tfTJRwyq7W0yAdwlm17wyxsWwleKGsCYT7tEbk0
         L3FH7GItgRUJ+lFYwjeMWIpCGSneZ5qD2m4lvhcmEnXW7y555yKoK4YVN82xTPJRsPdS
         uUlglbGItc1dWhrS7M5v3/rEVyu6Wpj5GQGQsbpNFSecFxc28cirGYne877sz65arKlY
         KHwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=GE8M6ZJ5o6R2icJ1+JO0lmFsJdBKSsRC/yaJmko71mo=;
        b=J3dJ5/m1LIa1Z3wDSjNIMkQsbij/puPlWTJJUD+301OO4hhbnlFn8/A9nUCFPiJuIS
         danMh8xGl6XHGwXR2BAIpJ4cfb93PvactXq03EosObTAt9l7zOPbx67kQx+vaiwgoCYF
         JOZ82O/vcVN3HUxovXOd2kP3sKPEcmfkGzzav3rtez1KgzuJhQFHeMEeV2oQ4k9BCuOS
         aMuTFItTMVDnajuSkFsIVK+wBsPCgiIVYsUiLK5/RToNMmTGZiN4+oXWgjy3rPKIYS8m
         NJ/IRMheRbKdh8Bwfc4ZLeLs/TNWpWCJSfkupbk4pmFo39IFfwneEocyZA+FEt6A/2ko
         7/qQ==
X-Gm-Message-State: ACrzQf0bwxTQtaS9LM27EKX/b0FRvvTZSRaCOEvYeK1dtCuKT8GYkZ1M
        ylpWOhedu5MmygLKKp/9nqAeYG1b2twHSg==
X-Google-Smtp-Source: AMsMyM7Haw1Oa/bZDStDlWRYqGsb4v1odEx6BIMGnNUEqPiohUUhxEzRrYSsjNCz5FWI62efbzpkWg==
X-Received: by 2002:a05:651c:882:b0:261:81b3:16b3 with SMTP id d2-20020a05651c088200b0026181b316b3mr1141452ljq.142.1665040446637;
        Thu, 06 Oct 2022 00:14:06 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id d10-20020ac2544a000000b00492f45cbbfcsm2585900lfn.302.2022.10.06.00.14.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Oct 2022 00:14:06 -0700 (PDT)
Message-ID: <80891d76-aac9-1f51-bb29-87cf9df0903f@linaro.org>
Date:   Thu, 6 Oct 2022 09:14:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v7 3/3] pinctrl: qcom: add sdm670 pinctrl
Content-Language: en-US
To:     Richard Acayan <mailingradian@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20221004215814.11694-1-mailingradian@gmail.com>
 <20221004215814.11694-4-mailingradian@gmail.com>
 <1ed91afd-74d2-1ab0-0d15-1b6e0dfba13b@linaro.org>
 <20221005222350.47420-1-mailingradian@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221005222350.47420-1-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 06/10/2022 00:23, Richard Acayan wrote:
>> On 04/10/2022 23:58, Richard Acayan wrote:
>>> The Snapdragon 670 has a Top-Level Mode Multiplexer (TLMM) for various
>>> features. Add a driver to support it.
>>
>> (...)
>>
>>> +
>>> +const int sdm670_reserved_gpios[] = {
>>> +	58, 59, 60, 61, 62, 63, 64, 69, 70, 71, 72, 73, 74, 104, -1
>>> +};
>>> +
>>> +static const struct msm_pinctrl_soc_data sdm670_pinctrl = {
>>> +	.pins = sdm670_pins,
>>> +	.npins = ARRAY_SIZE(sdm670_pins),
>>> +	.functions = sdm670_functions,
>>> +	.nfunctions = ARRAY_SIZE(sdm670_functions),
>>> +	.groups = sdm670_groups,
>>> +	.ngroups = ARRAY_SIZE(sdm670_groups),
>>> +	.ngpios = 151,
>>> +	.reserved_gpios = sdm670_reserved_gpios,
>>> +	.complement_fw_gpio_ranges = true,
>>
>> This still fails to build... v6 was not compilable, v7 is still.
> 
> Sorry, I only see the problem with complement_fw_gpio_ranges being removed from
> the struct and not being removed here (in v7). Is there another issue that
> affected v6?

Check the reports from kernel build robot.

Best regards,
Krzysztof

