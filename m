Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 51D835BF7E2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Sep 2022 09:39:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230244AbiIUHiu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Sep 2022 03:38:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230213AbiIUHio (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Sep 2022 03:38:44 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C4B283F06
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Sep 2022 00:38:43 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id a10so5993182ljq.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Sep 2022 00:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=1E5AZjGgyHRiDLYg9tyzymUqLnlnDil+S1TdOOqAWYM=;
        b=XyLRZYwf3GtdCefIi5mwLae40typDU4QLNYmkQYLkijdIhvSygP3Jb3RlAqMcw6yo+
         GPWZ7Av1IpRwUuRZYB1U77KsxELeo2rbC6//RIa+TpItvPy4ITP1zoCz+nXUCjqYX2/D
         craK3vpcDGCP4oaY8f2meOgd0PIKHECGaQtN67zUeRXaXKH0NB/26Ie2Imnf0J4OugxH
         Qv5xfHDkK+ZoSl9kEBAdda7c0xnjBa+sazKLvFrOqVyUs82Nokjgtuss8x6kUSn7Q4z1
         CTH695oWHbLIhf72qjsOne1ytdtTxMyZiRVZDC4JgoYTXfpZkJIfN2v+lrHJXEXHKKKz
         jsmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=1E5AZjGgyHRiDLYg9tyzymUqLnlnDil+S1TdOOqAWYM=;
        b=g5LxdDmV72v4MayHebdK5HJq0dvozRmp/tWWA/nekgbhn+QdTYx/VKoZIDlziVqzDo
         A/hFYfC1x7uwtywuFJdpz+GzFmgfaqxY5LWMH/geDmMPURXS2P8kP+GIrzFFj3z9kjJx
         ZKiZ2mOdw2X4eIO4Ox4C38ZryrUqSTTj4oyKiQ8PyRdvSeDdd0/KStwIpFqqjuz530VD
         SSwsbZl+hzM/l/9pS6lVH4Qw3Y+NgFpl2kX2KsZ8jBFqYtKXCborL20ABF9UQduqC8Da
         AtJwZn2Jk6zkJwCeA6J9JANqlEmANSSOWBvw/V8vKv7Ddvy8hU2Y1aosoopl1zJxJfj2
         tBKg==
X-Gm-Message-State: ACrzQf0qLcmSeRUx0ZbKphrwH2vTjHG6W/s5OQHMYaoQ1q508BulSDrN
        KsCybBpg2N8fdUQj8feviymUJg==
X-Google-Smtp-Source: AMsMyM6ZHRUfvM4+wi/nj0vYAfDaSyWBKAxc/Ra1PFI/EUzb5VZd4unXvaAoB7dDlc2h7K2YdjkxIA==
X-Received: by 2002:a2e:2c01:0:b0:26c:3e9c:3daa with SMTP id s1-20020a2e2c01000000b0026c3e9c3daamr6875050ljs.221.1663745921436;
        Wed, 21 Sep 2022 00:38:41 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id o15-20020a05651205cf00b0049f53b65790sm314351lfo.228.2022.09.21.00.38.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Sep 2022 00:38:40 -0700 (PDT)
Message-ID: <9a5de4ed-669e-e5f5-fa33-95df3bcee905@linaro.org>
Date:   Wed, 21 Sep 2022 09:38:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 1/2] dt-bindings: regulator: qcom,rpmh: add pm660 and
 pm660l pmics
Content-Language: en-US
To:     Richard Acayan <mailingradian@gmail.com>,
        linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org
References: <20220920223331.150635-1-mailingradian@gmail.com>
 <20220920223331.150635-2-mailingradian@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220920223331.150635-2-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 21/09/2022 00:33, Richard Acayan wrote:
> The SDM670 uses RPMh for managing the PM660 and PM660L. Document RPMh
> support for the PMIC.
> 
> Link: https://android.googlesource.com/kernel/msm/+/58064f13c0a436a82c35f2e3b5a122d874ae5846%5E%21/#F0
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
