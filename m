Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 329B279E2B5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Sep 2023 10:55:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230267AbjIMIzk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Sep 2023 04:55:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239119AbjIMIzj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Sep 2023 04:55:39 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7FFC1999
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Sep 2023 01:55:35 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-31c5c06e8bbso6633250f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Sep 2023 01:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694595334; x=1695200134; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3s4XTmZuXvVvkm0V75pftgs9YXVxmixMmIhKraOPVhI=;
        b=UzS8VAEcinFpI6HSw2/LRpJNhK13qDFwkRBdbLq0CYo54n4xofFgWo+oF0gtkGzKR7
         QHv6Ogre5NkbuTHjCuE6BlIaqpWi3s3pdh0ArOabtC+EARy80CfPde99aszfTztAFLXN
         nMfd4pQ+nvJaL88vSRan6Z27A5zvz/XsDh/k3zm10aDRQfiKdHPB6GT59L/0tm+o1qT+
         jYB04l8Oe2xNIOlu+wwxR/4zP2DNboDwaIj8BgFYXyjC/OJ0vO9dI7d5iRAiffIxY/gf
         aAbl6OKonhhvKRwo++J2WKoRZuXztXLBd9PdrDoQFBNI+G1+J8YNtBcSazoLQBjUC5Ob
         lm5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694595334; x=1695200134;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3s4XTmZuXvVvkm0V75pftgs9YXVxmixMmIhKraOPVhI=;
        b=Lf0yNx1iM2oRognpwAT1tB2/DS9uUqiGU6QQC9JEefd9HV+IhXN8s9sPp60MsTLVtK
         /juIpFVvftfoHVa9rfhvcALK9T2pdvKJ72vLOZxAfd/qCWdUU5hg4oke5lNI2upZ6CYc
         uPU6TjmWYg7RlIIAOWBHMcVxzE8nLUVvrYXU0m+jqYqeoyT5xL3WIP1L9YYYqbIh5GEV
         zjpTmEJtZF2hr7r709Stv6zm0fDo8n0BYrpBEm1CU8Bw0JcksuPZIUPAx+tT3BcaO//v
         mQhCIVu7EyREdylA1AnhDftfAxebKupBLFo9Vjh/19ri8jjkBmJfqCPuYg4V8uCklWg3
         YapQ==
X-Gm-Message-State: AOJu0Ywc9l1ChNK/uyS/hmLCUo0+tMOU6W29d6S4lCufomSTZPZ6VX3q
        AywbfXWn+iqTKmR3uFFybxf8vg==
X-Google-Smtp-Source: AGHT+IGN8q/6+xxALx9gUe9stgKotwY8iX0ZO8k2F0PDEZ1P0Uoeo9yl6chJOtzG1X7GSQJV67hvyg==
X-Received: by 2002:adf:f3cc:0:b0:31a:ea9f:1aa6 with SMTP id g12-20020adff3cc000000b0031aea9f1aa6mr1464200wrp.47.1694595334276;
        Wed, 13 Sep 2023 01:55:34 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id n15-20020a5d598f000000b0031fba0a746bsm3925446wri.9.2023.09.13.01.55.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Sep 2023 01:55:33 -0700 (PDT)
Message-ID: <3a65082c-200c-ce59-a662-ecd623dc68b4@linaro.org>
Date:   Wed, 13 Sep 2023 10:55:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH V2 6/7] arm64: dts: qcom: ipq9574: Add support for nsscc
 node
Content-Language: en-US
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Devi Priya <quic_devipriy@quicinc.com>, andersson@kernel.org,
        agross@kernel.org, konrad.dybcio@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        catalin.marinas@arm.com, will@kernel.org, p.zabel@pengutronix.de,
        richardcochran@gmail.com, arnd@arndb.de, geert+renesas@glider.be,
        nfraprado@collabora.com, rafal@milecki.pl, peng.fan@nxp.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
        quic_saahtoma@quicinc.com
References: <20230825091234.32713-1-quic_devipriy@quicinc.com>
 <20230825091234.32713-7-quic_devipriy@quicinc.com>
 <CAA8EJpo75zWLXuF-HC-Xz+6mvu_S1ET-9gzW=mOq+FjKspDwhw@mail.gmail.com>
 <CAMuHMdXx_b-uubonRH5=Tcxo+ddxg2wXvRNQNjhMrfvSFh0Xcw@mail.gmail.com>
 <daed3270-847e-f4c6-17ad-4d1962ae7d49@linaro.org>
 <CAMuHMdVxykGwyrKKSHBv9AHy4gAeH7DT7caZarbs-F40zz5Jpw@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAMuHMdVxykGwyrKKSHBv9AHy4gAeH7DT7caZarbs-F40zz5Jpw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 13/09/2023 10:38, Geert Uytterhoeven wrote:
> Hi Krzysztof,
> 
> On Wed, Sep 13, 2023 at 10:26 AM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>> On 13/09/2023 10:23, Geert Uytterhoeven wrote:
>>>>
>>>>> +                       clock-names = "nssnoc_nsscc", "nssnoc_snoc", "nssnoc_snoc_1",
>>>>> +                                     "bias_pll_cc_clk", "bias_pll_nss_noc_clk",
>>>>> +                                     "bias_pll_ubi_nc_clk", "gpll0_out_aux", "uniphy0_nss_rx_clk",
>>>>> +                                     "uniphy0_nss_tx_clk", "uniphy1_nss_rx_clk",
>>>>> +                                     "uniphy1_nss_tx_clk", "uniphy2_nss_rx_clk",
>>>>> +                                     "uniphy2_nss_tx_clk", "xo_board_clk";
>>>>
>>>> You are using clock indices. Please drop clock-names.
>>>
>>> What do you mean by "using clock indices"?
>>> Note that the "clock-names" property is required according to the DT bindings.
>>
>> Indeed, thanks for pointing this out. Probably bindings should be changed.
> 
> But what's so great about not having "clock-names"?
> There are _14_ input clocks.

There is nothing particularly wrong. They are just not used by Linux
implementation and they confuse people into thinking items are not
strictly ordered. Thus agreement long time ago for Qualcomm clock
controllers was to drop the clock-names to avoid that confusion and make
it explicit.

Best regards,
Krzysztof

