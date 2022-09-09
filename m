Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 841C15B3908
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Sep 2022 15:31:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230504AbiIINb4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Sep 2022 09:31:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230458AbiIINb4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Sep 2022 09:31:56 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEFDAEB2C9
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Sep 2022 06:31:54 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id k10so2711988lfm.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Sep 2022 06:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=cZxkflV/q5ieg6QIGvNNw96tN+Wgvq8rOl0y2IRENRo=;
        b=znzz2/7abQQkt4vAdjs6bJVDpUSlbqZ895K4XDM99ipILFZSxTJLF28IwoJXozPkIG
         3yBZasPtIRtEprKfyIvVdy+AhmGsczPzS4VVTBL2fmkGq0O33Yj2j5CqUihNE72Gz98M
         mc+RgWomNe37JqmX+BWIVdld8Z9bQLaB12op2V3FC0XKBk7sX4rq1Vxpu1vsHkhmTC61
         IUoTPvaq2tvgCJrbvlUD3QQbGCDsvHYTxRTmskb3WLz06+YkVG+/5HVMq1kuIg80aiYr
         07uVdrtybjEqwFmx2yji+JTosp4zqIqY7KeEZtZecIsVWAPrUuAC9ZwpcckRE5VoAAsz
         4gQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=cZxkflV/q5ieg6QIGvNNw96tN+Wgvq8rOl0y2IRENRo=;
        b=ixAlMUX0WUUYkcDZE9hHA11fg72Pu+tDjuctvqQgdGxPFBYPGKM6b2jOvfwKJqygJ1
         tQlxm0pI49KQMn8ztPaeNpxhxHuybYSEmMnK6R+RdUaeZZ30me/Z19oTuAVlx3Uo/0r6
         MeCW69OBKgaxuPyPSzdw2HIkqSQdSpZmYu60HeoISyoS+DT1xvGSA4xj633xxslZg4Oj
         4K5yFLo+zUoWm1iRsNsrYaA0YnpCkNdbXmB8sjYKpirH+Y+F5N3PLvzUanBlpEtSzPjX
         HhCzC9go+mXqkKXrmVEEJGxLcVXv1FeBW5Eesd178r5s5QNLhXMY9demDc/5buhGhzGR
         ZBOg==
X-Gm-Message-State: ACgBeo3jipXGjbLIhLNf6b3LUPRa6Sg7WXFRytGjHnWZgV3lVumaSMIE
        6AfOGws/dV8mclYItQvOltWjcg==
X-Google-Smtp-Source: AA6agR6SrrVszTgecSUF4mraXRXnzc9XOymrHwu9PdfD+Q5Lv2UdQT9V7Mddk5ArGOetg25usOQyRQ==
X-Received: by 2002:a05:6512:e98:b0:492:cf3c:8860 with SMTP id bi24-20020a0565120e9800b00492cf3c8860mr4375495lfb.603.1662730313275;
        Fri, 09 Sep 2022 06:31:53 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id e3-20020a056512090300b00494974f951esm77463lft.267.2022.09.09.06.31.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 06:31:52 -0700 (PDT)
Message-ID: <c5d54b15-8caa-764a-6f6c-32ab5b07be0b@linaro.org>
Date:   Fri, 9 Sep 2022 15:31:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 6/6] ARM: dts: qcom: apq8064: use hdmi_phy for the MMCC's
 hdmipll clock
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Vinod Koul <vkoul@kernel.org>, linux-phy@lists.infradead.org,
        Kishon Vijay Abraham I <kishon@ti.com>
References: <20220909132010.3814817-1-dmitry.baryshkov@linaro.org>
 <20220909132010.3814817-7-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220909132010.3814817-7-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 09/09/2022 15:20, Dmitry Baryshkov wrote:
> Link hdmi_phy as a clock provider of "hdmipll" clock to the MMCC.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  arch/arm/boot/dts/qcom-apq8064.dtsi | 2 +-


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Although this depends on the driver change for bisectability.

Best regards,
Krzysztof
