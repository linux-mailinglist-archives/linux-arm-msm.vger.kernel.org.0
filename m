Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC9A17609F4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jul 2023 08:03:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231934AbjGYGDZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Jul 2023 02:03:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231933AbjGYGDX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Jul 2023 02:03:23 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC82819A0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jul 2023 23:03:21 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-52256241b76so51424a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jul 2023 23:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690265000; x=1690869800;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gKw/y6xbJLHLrKoOqib8wE6g0TwzZr90wRZOEpTA+QM=;
        b=dNI26837h7Z5m0NpSRAEvJuTHCMrt52ddpJT/KP/SmM9gS2AlifEtXu8hfCiII80+6
         MOzZ2S8PMgpT/gp6fSkvkiiyWvp/Ob0Qr8Sb0f9Bt38bWZc+Sd1mnZnpeTVYnaEzm153
         3oJpljLbO/50dSg3zUfiZJVDMRAtYvknwId3JkXsAqFs94btqf1LvEkUAt9GDAMX7cr1
         GQshODgEtvdIe7IcWgTl9i1pC6HQzSDG4HkBINIVJtlDnWsZJ0vJ91IEeahD0ZKolSHz
         oWVc3FZ6WQ9MCIilIDA9k5BVW1NJTPM/VyoK+fLAFMPVWIKVcEynBMqshK5ILAUNtHeF
         ih6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690265000; x=1690869800;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gKw/y6xbJLHLrKoOqib8wE6g0TwzZr90wRZOEpTA+QM=;
        b=UxhKfSb9gbtaNtYhU6QrO6vdHjUQpd1gzio/DatZ0O+hPKipiNc0JANJwmbacHTpMW
         vw+FBRWHTATjUVYCz6QncXSsUEESHQfX8S99SygBgCld221tzYBRqoYYf8uqS9iyX8/J
         HR+ZXTDZbT/ixHBg5NBReMmJqSMI2ApFzEYVcwGcTUzy8OJpfLzJGDIHi88HXCqBTn94
         73fMYxg2RrOG1ZyyKqwWOHgA9jW5Kx5cxXWbEEJgpfVvoEkZ5h5qwf2UrLHlI+0N6T+V
         dVMvHg0Pioqp33a7ZEkyrtXFaHs0F7YkpGyPUWdAVWYL4tWkjCPLRPwcZ3wOYeee5YKr
         8JwA==
X-Gm-Message-State: ABy/qLYQkTQJ8zwN6N5zulL+9Php9ByGVftPrep9wA19zm040/0hJrOW
        Rjd/RjzlsDjYLZLgfgKQ7IDIYQ==
X-Google-Smtp-Source: APBJJlEP7l6qFTgow+ggwKiOot4c+RCyryVYPqohvTQF/Ys7TpoCWLWFPrROZM2D/IBUsQ0xpJczzw==
X-Received: by 2002:a17:907:a070:b0:993:da91:6e0c with SMTP id ia16-20020a170907a07000b00993da916e0cmr11275219ejc.3.1690265000364;
        Mon, 24 Jul 2023 23:03:20 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id a6-20020a1709065f8600b0098ec690e6d7sm7723489eju.73.2023.07.24.23.01.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jul 2023 23:02:14 -0700 (PDT)
Message-ID: <db7ffc4b-54c5-6f54-51ae-03479576f2b8@linaro.org>
Date:   Tue, 25 Jul 2023 08:01:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 1/3] dt-bindings: arm: convert nested if-else construct
 to allOf
Content-Language: en-US
To:     Nikunj Kela <quic_nkela@quicinc.com>, sudeep.holla@arm.com
Cc:     cristian.marussi@arm.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20230718160833.36397-1-quic_nkela@quicinc.com>
 <20230724164419.16092-1-quic_nkela@quicinc.com>
 <20230724164419.16092-2-quic_nkela@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230724164419.16092-2-quic_nkela@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 24/07/2023 18:44, Nikunj Kela wrote:
> Nested if-else construct is not scalable therefore, convert
> it to allOf:if-else.
> 
> Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
> ---
>  .../bindings/firmware/arm,scmi.yaml           | 55 +++++++++----------
>  1 file changed, 27 insertions(+), 28 deletions(-)
> 


Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

