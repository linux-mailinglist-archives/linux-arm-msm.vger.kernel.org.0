Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60ECF65046C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Dec 2022 19:57:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230195AbiLRS5t (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 18 Dec 2022 13:57:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230159AbiLRS5q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 18 Dec 2022 13:57:46 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 264747660
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 Dec 2022 10:57:44 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id m29so10584959lfo.11
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 Dec 2022 10:57:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+wJaB6Ex81QFBi9bFVy4oOTpzpMwPB5fD6rd3Cemj3A=;
        b=dDKc6zP5EpXqq5JKYIjuOt6gAPvOxuwXqxuAydNjBOYtyKTTp1QkN8RI6PHA6en+0C
         0oXipdbyXTNOqZaSFk/8WSXEIEAYsXpZ59cjx43JlrZSEeKY/SJrGXuTv18nXrz/gK7P
         cNM6e48tsZqYCHUStin1M1jb5qFyLXOjdj9u008D/w3RAZYULCE/8YAtc8T3eI5XRJjE
         4W1KWvL80oXtXoqpWE9oF50ZVqLiSvHNvMs9oU5SvfgZC5VOA2Tj2lAZD7by8PM5bMyV
         SFGJTVc/rS7q3uYWR66Iz0GQcxxcM8lmYQuWsU2kBpEhXWQjPEw2KPKsIqi4bNUj0Cm8
         2zjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+wJaB6Ex81QFBi9bFVy4oOTpzpMwPB5fD6rd3Cemj3A=;
        b=EdhVUYG8NwvP1VAb7HBht/RSO03UVfPB5QMBVy9Bo0E+W+w0urwApL/sqRs5Je1JMg
         Jj5WAZTJwEkg6E7P8HwoWsUtsB+59MSl1zp3A+KBssdGjXhhrFbumnUIhSdA/EPet34j
         UKxhcmvd9CIx4TzuF26/Jv1goZ1T8n8nqG0B4zpJug1FyJojc+pwSIJ6dRsOtIfJTTQq
         jDKzZd76XginJgfv4HwMGnUVr/iMJ7Mg4th6tXd38t35SRmqAraVadsOKlURHFrKgG9V
         62HO5G3l8ELGers3Pb4GfXYngJcBQjbO2NtHc3eATJC3A/QP8NcBTOFOH6H3VIXNNFeA
         ytyA==
X-Gm-Message-State: ANoB5pmldKZIR6QL5FR/0MvsmhFxTBJVwPcNwzdmvEPiDFqXY7Kb/TEc
        9PUeYV/x+2zKwbWC+txgmCqwng==
X-Google-Smtp-Source: AA0mqf7MFhWfbsVgo0WuZoGvDN+xSMA+fz2YO0RP/VMcD9ChTcKCvQ1Bh2BqeCMDY5W4v8gttTkgRg==
X-Received: by 2002:a19:6405:0:b0:4b5:b268:dbc8 with SMTP id y5-20020a196405000000b004b5b268dbc8mr9446079lfb.45.1671389862539;
        Sun, 18 Dec 2022 10:57:42 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id a10-20020a056512200a00b004b515f9d117sm878787lfb.271.2022.12.18.10.57.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Dec 2022 10:57:42 -0800 (PST)
Message-ID: <4e35dc75-10d8-3412-6570-a9927aed6ab6@linaro.org>
Date:   Sun, 18 Dec 2022 19:57:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v5 1/2] dt-bindings: pinctrl: qcom: Add QDU1000 and
 QRU1000 pinctrl
Content-Language: en-US
To:     Melody Olvera <quic_molvera@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221216230852.21691-1-quic_molvera@quicinc.com>
 <20221216230852.21691-2-quic_molvera@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221216230852.21691-2-quic_molvera@quicinc.com>
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

On 17/12/2022 00:08, Melody Olvera wrote:
> Add device tree bindings for QDU1000 and QRU1000 TLMM devices.
> 
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---
>  .../bindings/pinctrl/qcom,qdu1000-tlmm.yaml   | 134 ++++++++++++++++++


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

