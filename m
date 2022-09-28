Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 184D15EE2DC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Sep 2022 19:16:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234579AbiI1RQT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Sep 2022 13:16:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234490AbiI1RP4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Sep 2022 13:15:56 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39633B7F8
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 10:14:58 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id i26so21340822lfp.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 10:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=Lst2h60nLeZJR9My1LZ1Q189d4nio5lVLP5z2V/PmZ8=;
        b=UTz5Rq0k+/9D9uHOoIBm07Ri3OFCQuX9ipw2Ht5vd72Uat5H9EZDzdWIwkeqpQtFzD
         8pgGQZdu004nqThUPmEtGMV9zjWEEuk3aAX43Gqe+UcYaYdETIn0VsOoLe3tDJrEcTPr
         /2WYld0PUqxYirixfIstgtoN4Ko8zIbDyZToQzY0oBTdU4GwfqkQPUpDi5QvWrFlrsBF
         YKDhqzMyY9ZpqwU2fr+sTHMpn5g/2YiPZ8dF4KFy1qId+kygsmDsrKMnoQIOnKsEAn6L
         bQYHNHyQM4T58s8Pqqn+DSfL/0usyrsHdOZKMBw2GqWS+n+CaWv/BmqYXWicqmkJQ1yy
         GR0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=Lst2h60nLeZJR9My1LZ1Q189d4nio5lVLP5z2V/PmZ8=;
        b=nosOF2uodfFsS0F5+BXNQ5pgyTqphXGJ41CummY02m581TEsiTdXmJyF4PoY8mLUxy
         9HBVnMjsIcbPOmz1uTO+GaWA5cQ3Mw9HItnCdWZvHaLoc0mQsbq5NphP9Kj8NnVzKBZ0
         6kHuP5qa6X6g1J/50mv15rrPtsfXLlwgd8XXL/Y9B6RheyJh3G6/nuOnfBfT5iXjJ79g
         5NX4e/LYZTqnVCOHM9SWZW63QdrhKq+9iVVV1QXYSTNczORfYAw7RvusmNOIlrqIk3O/
         4rts3Uve0DL48N7G43FIywuCT4PT/rYmITXz8bM8ca5nyREWjU6tbKWfrHA0bz1lUQ4W
         OB3A==
X-Gm-Message-State: ACrzQf3Dq74BwvQl/q2K4VsRWI299d6tNNUz9U8B3xAbpsKdloK8RMFD
        +sLgB5QBOTDprrTIBT9+aapyEHYZYrGheQ==
X-Google-Smtp-Source: AMsMyM6G1z4IMeKq+lGMvDfdaJn1qYn3PomKrIkF4P3N0jXtuHoIc6CAkb2g5Eb+nQOpLuuj2Mxltg==
X-Received: by 2002:ac2:5e69:0:b0:497:a698:1acc with SMTP id a9-20020ac25e69000000b00497a6981accmr14454097lfr.316.1664385295996;
        Wed, 28 Sep 2022 10:14:55 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id q12-20020ac25a0c000000b00494a1b242dasm528178lfn.14.2022.09.28.10.14.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Sep 2022 10:14:55 -0700 (PDT)
Message-ID: <309ff92e-16ef-09c0-5ed6-fb2e13f2d62b@linaro.org>
Date:   Wed, 28 Sep 2022 19:14:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v3 3/5] arm64: dts: qcom: msm8916-samsung-j5-common: Add
 initial common device tree
Content-Language: en-US
To:     "Lin, Meng-Bo" <linmengbo0689@protonmail.com>,
        devicetree@vger.kernel.org
Cc:     Stephan Gerhold <stephan@gerhold.net>,
        Nikita Travkin <nikita@trvn.ru>,
        Julian Ribbeck <julian.ribbeck@gmx.de>,
        Josef W Menad <JosefWMenad@protonmail.ch>,
        Markuss Broks <markuss.broks@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220928164806.179314-1-linmengbo0689@protonmail.com>
 <20220928165920.181087-1-linmengbo0689@protonmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220928165920.181087-1-linmengbo0689@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 28/09/2022 19:00, Lin, Meng-Bo wrote:
> The smartphones below are using the MSM8916 SoC,
> which are released in 2015-2016:
> 
> Samsung Galaxy J5 2015 (SM-J500*)
> Samsung Galaxy J5 2016 (SM-J510*)
> Samsung Galaxy J3 2016
> - SM-J3109/SM-J320Y/SM-J320YZ
> - SM-J320N0/SM-J320ZN
> - SM-J320P/SM-J320R4/SM-J320V/SM-S320VL
> 
> Add a common device tree for with initial support for:
> 
> - GPIO keys
> - SDHCI (internal and external storage)
> - USB Device Mode
> - UART (on USB connector via the SM5703 MUIC)
> - WCNSS (WiFi/BT)
> - Regulators
> 
> The three devices (some varints of J3, all other variants of J5 released
> in 2015 and J5X released in 2016) are very similar, with some differences
> in display and GPIO pins. The common parts are shared in
> msm8916-samsung-j5-common.dtsi to reduce duplication.
> 
> Signed-off-by: Lin, Meng-Bo <linmengbo0689@protonmail.com>
> ---
>  ...6-samsung-j5.dts => msm8916-samsung-j5-common.dtsi} | 10 ++--------

Nope, we loose a board in this commit. Your changes are still not
bisectable - board is gone.

Best regards,
Krzysztof

