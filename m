Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BAE85616F06
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Nov 2022 21:45:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230303AbiKBUpc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Nov 2022 16:45:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231343AbiKBUpc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Nov 2022 16:45:32 -0400
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com [IPv6:2607:f8b0:4864:20::82b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30C0C65A2
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Nov 2022 13:45:31 -0700 (PDT)
Received: by mail-qt1-x82b.google.com with SMTP id h21so97514qtu.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Nov 2022 13:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NsgBnhD+StlYkJHjbJPv8coG9/eowe5XzdG3zACEu0g=;
        b=kZz4fGbechWDCheoNWKozSE4TKIO6InaTFx5I3D7nkDm7xbo8Xxb4OZa3Vlx3J4InU
         fViWih5UD5YOsQ/6scKHEmEIVaS1V9Y4jWTbxjQjlbNJ9vTneotv/lJR6aQeeIDuPHnB
         C9K48XnJPc4djN3YSxV25lfojGVpTf+NCDD4JCFWcDQ+tIJNgJZDocyf3jtvpd4V3kex
         W6F0oVczqneXLm15AL4wtH8R9nHZyw1/Q/r7FpAdHXRIEH+hoVVvCtfJ7SvSgJL+dhuO
         qruSq8I3QLdwiyYIJ6MgJHjxTkDyYNQMs5SlWjOm4r1hRKJ1CxLNeEz3quPMN0uFapwM
         PNcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NsgBnhD+StlYkJHjbJPv8coG9/eowe5XzdG3zACEu0g=;
        b=o16PTUMSP4RERpZxaoJnEV9rjprg3A2yDoGv0CBBz4MrvzSenVfqHKDX9IDy8FjNwY
         4SNEESPY3PE3+EO48KcvwLnwRY9ksZ2nxnYGdXtQ1SPoqdNnKN1/P0sMNqByzXqSnl8U
         vfdGDZWzRwtREdDeJ2KO7hfI5aP1RmMJOaIy3rMUQDOPcN2IbKHH8W5pz9GlQ6WrqCdr
         onDRuOkT+JRs5dz+03p9UMfFT5Vlezn5oYZQCxfLjPLXmQnEBVrWS2/JObMPqUmxzBZH
         UrAIQQO9R86sMtrd9oEfYzEe/wXHZl7piLZe6/vO9JNXK2TMqsrKR6oP6XESAKLCg6zD
         3iNw==
X-Gm-Message-State: ACrzQf3RhrNZ1CeCPZp2a+lqeFmNXrg0wIoFpznvplZomtcYSssGCRjb
        XdVnze3MVL5faE91dSJZHDmQzg==
X-Google-Smtp-Source: AMsMyM5QI/mHGZBEb3PXe/1szUOQbbEBHCmLJnY1CHrW+2T+GlHfVm0lp/6P7wb4CDfKpSOUvPf+Ww==
X-Received: by 2002:ac8:5bc9:0:b0:3a5:71c:61ac with SMTP id b9-20020ac85bc9000000b003a5071c61acmr21649224qtb.680.1667421930347;
        Wed, 02 Nov 2022 13:45:30 -0700 (PDT)
Received: from ?IPV6:2601:586:5000:570:28d9:4790:bc16:cc93? ([2601:586:5000:570:28d9:4790:bc16:cc93])
        by smtp.gmail.com with ESMTPSA id he40-20020a05622a602800b0039a55f78792sm7102776qtb.89.2022.11.02.13.45.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Nov 2022 13:45:30 -0700 (PDT)
Message-ID: <2bde4bd8-44d3-7049-95c3-3f3f658ca304@linaro.org>
Date:   Wed, 2 Nov 2022 16:45:28 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH 02/10] arm64: dts: qcom: sm6350: Add pinctrl for SDHCI 2
Content-Language: en-US
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Luca Weiss <luca@z3ntu.xyz>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221030073232.22726-1-marijn.suijten@somainline.org>
 <20221030073232.22726-3-marijn.suijten@somainline.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221030073232.22726-3-marijn.suijten@somainline.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30/10/2022 03:32, Marijn Suijten wrote:
> Use the generic pin functions specifically for sdc2.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  arch/arm64/boot/dts/qcom/sm6350.dtsi | 44 ++++++++++++++++++++++++++++


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

