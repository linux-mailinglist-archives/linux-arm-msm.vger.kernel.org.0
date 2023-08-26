Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D814B78966A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Aug 2023 14:02:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232545AbjHZMBk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 26 Aug 2023 08:01:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230090AbjHZMBH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 26 Aug 2023 08:01:07 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26CFD2106
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Aug 2023 05:01:04 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2bcde83ce9fso26042031fa.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Aug 2023 05:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693051262; x=1693656062;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZpIF/kspXEWP+ED7ApWYX9k2YRiDKFAj43hIwcfHRok=;
        b=qQaV1KeAu7h1gr6FRZgszmE+WMMjqFyWH8UP6gn2gELe5mZFMQaEWcSkbu7z8V5j9+
         +scs2/pa+Kv5HvnJdVtO57+PAzxKSnw7xl5wnWRvQlDMl2xqtOmIyiIehzlIQ5k75lDx
         iy69mRjY4Y+RseRmLvazleu86VrLFMgyVcRTp55YzXugJze8c+MttJPlzKDnth6CGPDk
         /0VM4WzFmQ7xf5gF1Jl1VcjtmD1IbjvrwIFOOnfqEeMB2SCb7CBD8v2dYhvAY+DXGrTr
         zdVaa9a/5prnHgBLvCcs/2vSFwI4myk7CrZMaK45oSWvkVNRFw7idzhQTPQb5LXb2Twb
         jS6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693051262; x=1693656062;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZpIF/kspXEWP+ED7ApWYX9k2YRiDKFAj43hIwcfHRok=;
        b=MGWTcp6V2FmI5Mlz6vFTXd0iACOyGbBDU4lVv1EvG0Hn+iBXVJ1qo5E9z+FgaDN0YQ
         h//Kr4oLLLFjKoNa01K6QN/BKd3ASwEFB3F0yyuPkl7WvuGVIAYY2monv9JuKqFmI+v1
         guosWxZ1pYwmH9IL1w64Dvvqzi/vWkdtac9JwCaU1gx5l7HXXQ8q1wsV4QTWm3S5ST7Q
         9PpftqzkRL9vObz3NF4aNYD9IS8qzd40P6ZHAzCbgHarZPBwd9kmIaegZ3RSEQpMRWYR
         x5j1mdU+lBD4XnGLRImnWoCro+mmeW2clKbKgKWG24pIgRDwQKoAFp+FLOLf5fVpPdRT
         pcDw==
X-Gm-Message-State: AOJu0Yw4W8EzcghSfvcR01JmNHPAb9Xlq9yszCl/3XV4rRxjY3WnJ6yE
        PAFejBoLSivY7nAqD7unBJTeWQ==
X-Google-Smtp-Source: AGHT+IFCi14v5086qfu/+ybqQJUOmmw9vk0plNASNf2tPl4Cuea1GMollTWLsk91NXxTTmtW4IJ1wA==
X-Received: by 2002:a2e:9097:0:b0:2bc:f252:6cc4 with SMTP id l23-20020a2e9097000000b002bcf2526cc4mr3083690ljg.10.1693051262345;
        Sat, 26 Aug 2023 05:01:02 -0700 (PDT)
Received: from [192.168.1.101] (abyl74.neoplus.adsl.tpnet.pl. [83.9.31.74])
        by smtp.gmail.com with ESMTPSA id 9-20020a05651c008900b002b9f41a1b9asm755355ljq.110.2023.08.26.05.01.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Aug 2023 05:01:02 -0700 (PDT)
Message-ID: <724aa0d7-600f-48c9-8a5c-7f43823d0c49@linaro.org>
Date:   Sat, 26 Aug 2023 14:01:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: msm8916-samsung-fortuna: Add
 initial device trees
Content-Language: en-US
To:     "Lin, Meng-Bo" <linmengbo0689@protonmail.com>,
        linux-kernel@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Nikita Travkin <nikita@trvn.ru>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Walter Broemeling <wallebroem@gmail.com>,
        Joe Mason <buddyjojo06@outlook.com>,
        Siddharth Manthan <siddharth.manthan@gmail.com>,
        Gareth Peoples <mail@gpeopl.es>
References: <20230801111745.4629-1-linmengbo0689@protonmail.com>
 <20230801112123.4672-1-linmengbo0689@protonmail.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20230801112123.4672-1-linmengbo0689@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 1.08.2023 13:22, Lin, Meng-Bo wrote:
> From: Walter Broemeling <wallebroem@gmail.com>
> 
> Samsung Galaxy Core Prime, Grand Prime and Ace 4 are phones based on
> MSM8916. They are similar to the other Samsung devices based on MSM8916
> with only a few minor differences.
> 
> This initial commit adds support for:
>  - fortuna3g (SM-G530H)
>  - fortunaltezt (SM-G530Y)
>  - gprimeltecan (SM-G530W)
>  - grandprimelte (SM-G530FZ)
>  - heatqlte (SM-G357FZ)
>  - rossa (SM-G360G)
[...]


> +&blsp_i2c1 {
> +	/* SM5504 MUIC instead of SM5502 */
> +	/delete-node/ extcon@25;
use /delete-node/ &label instead

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
