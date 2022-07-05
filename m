Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6688A567685
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jul 2022 20:32:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230293AbiGEScF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jul 2022 14:32:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230013AbiGEScE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jul 2022 14:32:04 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 043F91D330
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jul 2022 11:32:03 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id f39so22030011lfv.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Jul 2022 11:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=D7p/sDYm9E/8XqmiA5LCzNTiG40IUVuc7U3G6pKRMDI=;
        b=iK/1VeDZGeqhZtaRP8JXyzmjmfKPHoqHsrT3kFEFCYnYSTmFePKupGg5DjzkqiTaOF
         uhhrlDEcmYe7rnLNNqf1k9mk6rdAdbkP7xUlYfxhzTRORaGKYmZAg8s3Tz/039HYKLMf
         5i+x4EVBN6SW5hwOoWoS6+35pbe3UMo/uBUgrg+D8RUejpGXAKOUTIu5XtKWaY1ffHHF
         i8XG5CaR7nwZ3EtN0KrOAqmiwde/y6JQe2QdsrIyT5/aRajsS2MfswSMoUJf+/3ENk36
         qGixnLcaQJU6sCQ8K1FSCxV70cpki+N42/8BfleRxDePwlLAXpUjmj9pQF9R8BhLdbUi
         Kw7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=D7p/sDYm9E/8XqmiA5LCzNTiG40IUVuc7U3G6pKRMDI=;
        b=fsbXIOtRp/4n3wV5hhpgAWhbKlBFHJh56kU6kql4QQDekNPZeTxj6sttrOt0V7fm4E
         jbgai9nuedwogA2nO7Ue3u2nO3GOEONeJpvz+kxJ2gltbjK+YFVELHNNrEqxi4A7V8PY
         nEwdhm0F9P4W6rKYg/J5BMSHqCk5KUrdJw9M8TAlecheQ5wk3aap3aQkLoJ91DVq6GX7
         iDwio8CRWP7hnuotaWH9XPt/0ffe46xiqfh3xwDoaw/09bMGfQV1VLrSL2pHwDB/kvMd
         LIUqobsmonhpXI0Lwp2Pun/G9O4N4v5DaJX3FZneJ1xEFQbFll8U8ZyvTRzzDjbvcZZu
         HCuA==
X-Gm-Message-State: AJIora/esjBT9ng0eC57w6k0rs0iRmhXgtYfpI1bXX88tiVY2Dpon1+C
        3N1kncYjaHcnnFgh6IYHR7vn9A==
X-Google-Smtp-Source: AGRyM1t2wLoT1QWk9JTsHRGXDhwZlXzky4+x2+l2qkjQodcPdKTyE9N2H3IJN13d8nRtoTmfHpmg6A==
X-Received: by 2002:a05:6512:260e:b0:47d:ae43:62b3 with SMTP id bt14-20020a056512260e00b0047dae4362b3mr25369019lfb.77.1657045921399;
        Tue, 05 Jul 2022 11:32:01 -0700 (PDT)
Received: from [192.168.1.52] ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id h15-20020a2eb0ef000000b00255500154fasm5710910ljl.52.2022.07.05.11.32.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Jul 2022 11:32:00 -0700 (PDT)
Message-ID: <1413a50e-5966-00f7-30a9-4a6c99536e1e@linaro.org>
Date:   Tue, 5 Jul 2022 20:31:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [V5 0/2] Add support for proxy interconnect bandwidth votes
Content-Language: en-US
To:     Sibi Sankar <quic_sibis@quicinc.com>, bjorn.andersson@linaro.org,
        swboyd@chromium.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     mathieu.poirier@linaro.org, agross@kernel.org,
        konrad.dybcio@somainline.org, linux-remoteproc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mka@chromium.org
References: <1657020721-24939-1-git-send-email-quic_sibis@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1657020721-24939-1-git-send-email-quic_sibis@quicinc.com>
Content-Type: text/plain; charset=UTF-8
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

On 05/07/2022 13:31, Sibi Sankar wrote:
> Add proxy interconnect bandwidth votes during modem bootup on SC7280 SoCs.
> 
> V5:
>  * Improve phandle-array schemas [Stephen/Rob/Krzysztof]
>  * Add more details to the firmware-name/memory region string array [Stephen/Rob]
>  * Drop 'items' from label [Rob]
>  * Drop the patch 1 since Bjorn picked it up

Use proper subject prefixes - you miss here PATCH. The easiest is to use
`git format-patch -v5`. You can do it other way as well, but just make
it a correct patch with proper subject elements.

Best regards,
Krzysztof
