Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2CBB75BE0BA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Sep 2022 10:49:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231485AbiITItF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Sep 2022 04:49:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231591AbiITIsk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Sep 2022 04:48:40 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9C8D6BCC7
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Sep 2022 01:48:37 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id u18so2595075lfo.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Sep 2022 01:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=MyK7g5vOt7OLNZ8qZikUV2n8eSBwV/+RgPlkSyOJlKI=;
        b=n/UjAlwCSuThsJKKdbs2h4vv8GLHsHMTYgyrAp5/4CeWmEus9mtzwZtUUMTROOzmp5
         6xtIHEiZMgovisgg2vJFXUMud6mDs+AU8tOCxKCIROBHbqwgB66I0HHRSJY6NI2XzRvq
         QqIxnmXwTNwU5kBSrc7OzHJQapF8z9fbnBww/IRm5yi1svTM8aX7+LJnBSRlvqZVhXUx
         OWlvYkOMIEmgl3lPMi/NhX9tYFJs7e7BwHbF++GwsBhcOQmlSF3IKYN5BesDVUYgUIg0
         AzVxnB8sfEj3z9NEY/f3P7YoGMyfyH45GjMUefEWnZj3krhfNfeLvhD+qZNNvrlhc+tY
         oKyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=MyK7g5vOt7OLNZ8qZikUV2n8eSBwV/+RgPlkSyOJlKI=;
        b=f1KclNeRNncD2fm4Otgk6ZPOYTmsPqOn+BZBHSOQtssI1dO8JgTXuR+WJbtYaHB+Og
         +jhTd4i+8sWoZX9h8Zaeb2wNp6EFvT/V0X/Fj1OKzNUwGc94tEgl8Fzj5lruOI8ER9tf
         MRKKG28pr9R/uH2SoMKnFojMRbUyKaY572kq9CljFl1Xo+PdpgGIET5Ufv/2fQs/DEr0
         d/gFx4KAiajkREVvRBlwcAQpnRU8vdedR3VmEKfvFpCCf+3L84BIHL5t8zvOlQYgpTco
         x/GcKVS05ECQwfaalttpinHSji6lAc1DmISZhYqI1LYaYMqx/c1l33pcLFposr00UMvH
         iCMg==
X-Gm-Message-State: ACrzQf09spHbzIZVG3i/NZ1+T983nEef9kwiq2Zniv84oCGXdJDbZxx0
        yKRHog+oC8ujZEcbgxB7hivM1A==
X-Google-Smtp-Source: AMsMyM4s1Z4R8q7MGFJxL0cNejD2laGiWwLxGTaJpzkdN6zhcqwchYVGsbhrVkzvakZIx9RmE+H7rg==
X-Received: by 2002:a05:6512:3b22:b0:49a:d302:ae04 with SMTP id f34-20020a0565123b2200b0049ad302ae04mr8223966lfv.72.1663663715822;
        Tue, 20 Sep 2022 01:48:35 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id v17-20020a2e9f51000000b0026c3975f488sm157414ljk.26.2022.09.20.01.48.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Sep 2022 01:48:35 -0700 (PDT)
Message-ID: <1a03bcd4-02af-3b2a-59ac-f8d776c37b43@linaro.org>
Date:   Tue, 20 Sep 2022 10:48:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 1/2] dt-bindings: power: rpmpd: add sdm670 power domains
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Richard Acayan <mailingradian@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>
References: <20220920021927.2489-1-mailingradian@gmail.com>
 <20220920021927.2489-2-mailingradian@gmail.com>
 <20220920081739.eh3qzohw74elqyfm@krzk-bin>
In-Reply-To: <20220920081739.eh3qzohw74elqyfm@krzk-bin>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20/09/2022 10:17, Krzysztof Kozlowski wrote:
> On Mon, 19 Sep 2022 22:19:27 -0400, Richard Acayan wrote:
>> Add the RPMh power domain IDs and compatible string for Snapdragon 670 to
>> make SDM670 power domains accessible to the device trees.
>>
>> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
>> ---
>>  .../devicetree/bindings/power/qcom,rpmpd.yaml          |  1 +
>>  include/dt-bindings/power/qcom-rpmpd.h                 | 10 ++++++++++
>>  2 files changed, 11 insertions(+)
>>
> 
> Running 'make dtbs_check' with the schema in this patch gives the
> following warnings. Consider if they are expected or the schema is
> incorrect. These may not be new warnings.
> 
> Note that it is not yet a requirement to have 0 warnings for dtbs_check.
> This will change in the future.
> 
> Full log is available here: https://patchwork.ozlabs.org/patch/
> 
> 
> power-controller: 'clock-names', 'clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
> 	arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dtb

This might be unrelated to your patch.

Best regards,
Krzysztof
