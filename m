Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8FD4B67D0B4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jan 2023 16:56:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232364AbjAZP4d (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Jan 2023 10:56:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229642AbjAZP4c (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Jan 2023 10:56:32 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 156632BF39
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 07:56:31 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id t18so2255119wro.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 07:56:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7X8vQJ82g1NBSgy7BqEe+UPGCLxYDo4vEHMc6PKXuH8=;
        b=v96sfa23JY65nMhchkG1AlpCZpWwa4nxe8dntBmtZU+8hj74OH82bWsxOF/ov/uYJi
         jUv2ZqiZ5sL/R5I3OkZ6usDOFByjf6LUA+IUZ+82m6nsbuQkUoRhDvVl5vxn+418dcnh
         dmbThNd+hMTOIvtQUorebw8UxLJt7uDGLvlch1C0wXNWnLx+7uT7mM2ebEBhzVhiRKnZ
         EzH70kd3ImEcAZQve/naGbUmtz6JPycN7L3gJ1bl1ZuCDgR137k0QR8Y13F/vkU6glYx
         RYcaIWUMnvejuAEFmGLQ90rvtKFr8o9CgZXxG5RQY81C1vB5cr/+boytChcc/0obDuab
         XTWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7X8vQJ82g1NBSgy7BqEe+UPGCLxYDo4vEHMc6PKXuH8=;
        b=qxJIoml1xhMkmPX30MHMUlAYP6V3otUTA6JoSkUjfZMKs33vnKfaDhJ2o0++VMkbBf
         cs7zQD/p5FIbZZ7ImfLhGSK1PY07qkDWlsHBbI/5YbYd9f1mN2JAGY4kwUZeCGkmyEjz
         Gmdua5anBbIhxcoG64YYn/UY1vRp2q1/tlCuGO2VfyGReu+e8PGIDlM9spuhEKJ8WApM
         oShnBEqDoGhCsm364hklCgoNKmLRmWQ1CEapo6GjYn+Ahono1/1YTb2VsX5IsbWGmXhB
         oUD3/575Wp4MMU3PlGY0BMqr8u7TBO76dVUdLzHuFWUtqYSGGIan3qwavCUgkEjRJlGe
         Wcdw==
X-Gm-Message-State: AFqh2kpnoALIKPR3UyZHwRr9BsoOIE47XIEzZxgiIbd+xbblUHj0ny2G
        QRTlRwXWasoEUMcbyxfLWw6XYQ==
X-Google-Smtp-Source: AMrXdXvF0Fzot1vJfqbt44iNVaA6MBvfcl5qnUKqgrLzxTreoghoY2AjqsnfgCDO8Sonz016fO0KFg==
X-Received: by 2002:adf:e611:0:b0:2bf:96b9:5865 with SMTP id p17-20020adfe611000000b002bf96b95865mr19180823wrm.9.1674748589583;
        Thu, 26 Jan 2023 07:56:29 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id x7-20020a5d6b47000000b002bbed1388a5sm1662536wrw.15.2023.01.26.07.56.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jan 2023 07:56:28 -0800 (PST)
Message-ID: <b5b0b377-b3da-1c32-3b40-6d8ef9774ca2@linaro.org>
Date:   Thu, 26 Jan 2023 16:56:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 15/24] dt-bindings: rtc: qcom-pm8xxx: add nvmem-cell
 offset
Content-Language: en-US
To:     Johan Hovold <johan+linaro@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-rtc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230126142057.25715-1-johan+linaro@kernel.org>
 <20230126142057.25715-16-johan+linaro@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230126142057.25715-16-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 26/01/2023 15:20, Johan Hovold wrote:
> On many Qualcomm platforms the PMIC RTC control and time registers are
> read-only so that the RTC time can not be updated. Instead an offset
> needs be stored in some machine-specific non-volatile memory, which a
> driver can take into account.
> 
> Add an 'offset' nvmem cell which can be used to store a 32-bit offset
> from the Unix epoch so that the RTC time can be updated on such
> platforms.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

