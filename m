Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A854B5B4F22
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Sep 2022 15:38:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230091AbiIKNiQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 11 Sep 2022 09:38:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230184AbiIKNiP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 11 Sep 2022 09:38:15 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6E18F18
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Sep 2022 06:38:13 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id l12so7625736ljg.9
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Sep 2022 06:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=ZRxI/s6Zz71Tid6e7oxzqHOX6TOjJ4mXR4nM2d5M1Gs=;
        b=KsFZTp1yBcbnEAfSPlp8rx05rFnqvl+wA9WY6IogNAN+PRfFxGP+EHKfleRKk66WPA
         /jwwC+XEMESGUAcDtYeye9zce8hFQwFxXO7vN3PC6UYEeaEkT6GIy/w+CpKgafEdc0Rz
         pXa8IIEt+titd9xoSPzIkAGvT/PON2tc2uYCeQTkAmIgbAk3Mv0yIlAfWBfcsCENabVj
         5hRFRRgqIr74vbURpx8F1hirC5xnsn8Db+5W3oBabJDu63uh5+B/Yt1e6KtH0PgY/6Rr
         Gi9ZO2/Takyd0kunk2ZAUGd2uWhK1e6HS1hlZUM20CHtGZ+9HJyBLQ0aF/YhHZrrcz7A
         UVsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=ZRxI/s6Zz71Tid6e7oxzqHOX6TOjJ4mXR4nM2d5M1Gs=;
        b=AcIJ4FIpwHgMiMiR0LVw5NGsWjMws9TyfhuUYaaVIhF3pj7YitugEvYZRO1H2P0gaO
         wn8y1AszL6B+SJRwQHX0D4PEe/gAqzoUvWUqp5zYV6wcq39e8HcsV1pWqTaAzlfKfXpm
         xVshw+q61MGRKWY4QPceYEnQKd+hjCGlTn72oSUAwkoTNaSgci3drO1u2FqgkW8ZK+EX
         SirAmqsrnn+NoN4tO58lUvYXUbuhUeU1apD9NKyY72BldD/H0YduhnuaZQsyPoe8re0b
         RjinGkoH/jIL9lgt8nhDxyITHaNpMzRTwmb1haAoDr7cdRFIaxR+sjMjyp8FBt4Zmvo/
         kK0g==
X-Gm-Message-State: ACgBeo17OW5y99pPaqbKXmAtK6HwJnb5VRLtdhThjLP1QdUUTp3TxURH
        JcNqCmxlL5FX0Lp1NU12uhBm+w==
X-Google-Smtp-Source: AA6agR5XSysgbYN2VoKXqQuzjEN64v1Iu40Kz4k6P94mG4gsYF5ZgArS1iG6UEFhR7+MF8XBCWMiKA==
X-Received: by 2002:a2e:2244:0:b0:26b:e1c0:8ae8 with SMTP id i65-20020a2e2244000000b0026be1c08ae8mr3639525lji.146.1662903492076;
        Sun, 11 Sep 2022 06:38:12 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id o1-20020a05651205c100b0048b0099f40fsm608607lfo.216.2022.09.11.06.38.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Sep 2022 06:38:11 -0700 (PDT)
Message-ID: <bde2b924-024c-761a-c487-e56b9dd9cc7e@linaro.org>
Date:   Sun, 11 Sep 2022 15:38:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [RFC PATCH 09/10] arm64: dts: qcom: msm8916: specify per-sensor
 calibration cells
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220910124701.4060321-1-dmitry.baryshkov@linaro.org>
 <20220910124701.4060321-10-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220910124701.4060321-10-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/09/2022 14:47, Dmitry Baryshkov wrote:
> Specify pre-parsed per-sensor calibration nvmem cells in the tsens
> device node rather than parsing the whole data blob in the driver.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

You should describe the dependencies - the patchset is non-bisectable as
it depends on the driver changes and DTS cannot go along with DTS in the
same branch.

This must wait for next release.

Best regards,
Krzysztof
