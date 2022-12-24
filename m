Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F49C655A4B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Dec 2022 15:11:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230259AbiLXOLK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 24 Dec 2022 09:11:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230492AbiLXOLI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 24 Dec 2022 09:11:08 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 646355F95
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Dec 2022 06:11:06 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id y25so10478843lfa.9
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Dec 2022 06:11:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7i8PDX6l3eEw1wJuHTItF/tlr5bRZPnd8D6+DDXevgk=;
        b=bMXOXsRisi6vn7T+KXq2VpaU4rxodLZqqEkUQusMWCL3suw03pBU8B/tVfBpEZb1hd
         PPWEawv12rZVa8jCqHy3G6Dapp7Nt+KoQYPn76D5n/TDPdvylxYNJFDhBjWidNDhKITP
         vw50rkwFf4ShnXARnJZKbvNOmDwsix8JKxTdhp5Je8p9IBg1n41xUgFHA4o9RkFK1kJu
         olXcXWtUczuVuLt1lF1Py6dpScNSOdTMjE/RNgoyGAimhiWm44f44l66Bs+eVMLRuwDQ
         +MbvqAJsgxVvP4c8jfn9EPhmCw9YVWFDesm7plzeIzGhXuk6a45JtsayZZJTwi7XwSJ8
         3OtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7i8PDX6l3eEw1wJuHTItF/tlr5bRZPnd8D6+DDXevgk=;
        b=6ranI9DQnwDNHaRK/f5dx3iI8A/Rbsg4/69lVe3Y0cPs5DnRPJ9hQveFZ9R+pl65rS
         mejcBcHY+0T7PM0CGoYC0R3gocn8yxRfOiUg2f87e8UvCtbECLHfIT2k81Qe922EFlRv
         fkSruxyFuBApnzXU5KvxiwfUZzUtToE6Vb50E5Ce2KlweZViiErm1nmR4ElI9GsAZuDZ
         H3NxqzWdy6qk6h5UN8Irvvxm9Xc0pW4x2gAGB/sVQ0dXzFm7szmfq0iWLzUIm1A8cUl7
         yFSnEVkp1iQqtvZd8OClphja0DYohvVMlQjc8UQLLREr6W9jax/5AWY0PP5SBd1/3znH
         wtcg==
X-Gm-Message-State: AFqh2krpdXiyuiwAbSPkA6EW3rbfdGOLCamxMOA5lKBVIZQ5LaWDr/N0
        DyaAQirhptI4VFGYRIOidAUzag==
X-Google-Smtp-Source: AMrXdXs27LWhq/R/v/bzBRXBDa3IRnApOBskMTcl11tIBIp0KzFFFda6UBLJ0OYtZ5r1i0CzPnYZ3A==
X-Received: by 2002:ac2:431a:0:b0:4c8:ae6b:ea8d with SMTP id l26-20020ac2431a000000b004c8ae6bea8dmr3223529lfh.8.1671891064815;
        Sat, 24 Dec 2022 06:11:04 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id h4-20020a056512054400b004a9b9ccfbe6sm967581lfl.51.2022.12.24.06.11.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Dec 2022 06:11:04 -0800 (PST)
Message-ID: <e1fb7474-d029-8004-709d-1d0b437f192d@linaro.org>
Date:   Sat, 24 Dec 2022 15:11:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 1/3] dt-bindings: leds: spmi-flash-led: Add pm6150l
 compatible
Content-Language: en-US
To:     Lee Jones <lee@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Fenglin Wu <quic_fenglinw@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221209-fp4-pm6150l-flash-v1-0-531521eb2a72@fairphone.com>
 <20221209-fp4-pm6150l-flash-v1-1-531521eb2a72@fairphone.com>
 <Y6WiQKRI/YCbMBhA@google.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Y6WiQKRI/YCbMBhA@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 23/12/2022 13:42, Lee Jones wrote:
> On Fri, 09 Dec 2022, Luca Weiss wrote:
> 
>> Add the compatible for the flash-led block found on pm6150l PMIC.
>>
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>>  Documentation/devicetree/bindings/leds/qcom,spmi-flash-led.yaml | 1 +
>>  1 file changed, 1 insertion(+)
> 
> Who takes LED DT Bindings presently?

Preferably Pavel and/or you. Rob was taking only on exceptional cases.

Best regards,
Krzysztof

