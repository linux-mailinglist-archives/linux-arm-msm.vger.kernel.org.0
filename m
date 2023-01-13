Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1AB6B669E81
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jan 2023 17:45:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230177AbjAMQpm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Jan 2023 11:45:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230012AbjAMQpJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Jan 2023 11:45:09 -0500
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA1E4840BD
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 08:43:27 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id u9so53654342ejo.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 08:43:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R5TBHhWOg/cGP3GwNuSQQYLC6uWPP5Tc/CfzUCwt4Vo=;
        b=P2rn2bYVRi+BPMUY6x87WSoUBr/2encUtkRJEa5OtPXyVSqqVsGmq8NkFJIPaCUMqB
         vtpKCqzXMlv+Z0yr2OlRGXCdeqhvNFZPhrrUmcvWFwm/GNQGR7hFWeImr94rPwKcd7/m
         Nz0Oj5JT6C3e8YYrMSAtNX6ZcszyuA/ffvqWBqlucRoN3WJ+1YTZCdQPp7XSOpLmtIGv
         9blx23e6FbEcSb8Oykx/Pt5HphpaNJ74ZYQY3kaN9yoOcDj7jLxIfUXBnKGcaHw93iGy
         6M4IiPkwJqFibek+e6Tl99tbvwYylf4RWUrKDFABhkjJhdp8ILqDhd6zaYHXeUQCEDEL
         YraQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R5TBHhWOg/cGP3GwNuSQQYLC6uWPP5Tc/CfzUCwt4Vo=;
        b=RVBBOwJMZJdKp48kiXZm6A9T1016t/4USEgPDqTEEHH+HK+zKxhvUbkU6RigWi0+px
         vREFTo7wMjQy0VKEvmp/gfG90+U6LHw3Td3LJEQXKUpobZcOJb0DhHBVQCYHCmuZFKcz
         hXaE0ZYl1EzTaA0DdfaJLZRgzpNzRQO6h4i+4XcGC9LXobIVlv27C2K4c0BvlUSAgk7Z
         68XuP/PL1nSTLJj3EbSIfKdYe8WSp5wwuWnfNBdzEf6epnnXGTnS08B0Jeqya3qGme0P
         hZNUg55etucFZL6s4sw2Z1T8rnZRcAlTSL0vPuygScdUUeXeBl1uo6xqZnhxYDGC6/G/
         cyiA==
X-Gm-Message-State: AFqh2koMRpULLaMNkYrjedCI+PotAnU55VnotdYBKjzyvnYQCebCFtuA
        t1q1w0GTggMHMD2Y1FFwxvgGew==
X-Google-Smtp-Source: AMrXdXu38+lA+L1LAhjnTNHI2N2jhp/qW7WEQuaOzjRu/0RoFdiMG9StnSs99somhiAlleuaV+eIKQ==
X-Received: by 2002:a17:907:508:b0:84e:d302:1551 with SMTP id wj8-20020a170907050800b0084ed3021551mr12948867ejb.37.1673628206600;
        Fri, 13 Jan 2023 08:43:26 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id ez6-20020a056402450600b0048ebe118a46sm8311122edb.77.2023.01.13.08.43.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jan 2023 08:43:26 -0800 (PST)
Message-ID: <e92e2da3-bf81-a1f3-878a-b5ae68690bdb@linaro.org>
Date:   Fri, 13 Jan 2023 17:43:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 2/6] dt-bindings: soc: qcom: smd-rpm: Add IPQ9574
 compatible string
Content-Language: en-US
To:     devi priya <quic_devipriy@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org,
        lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc:     quic_srichara@quicinc.com, quic_gokulsri@quicinc.com,
        quic_sjaganat@quicinc.com, quic_kathirav@quicinc.com,
        quic_arajkuma@quicinc.com, quic_anusha@quicinc.com,
        quic_poovendh@quicinc.com
References: <20230113150310.29709-1-quic_devipriy@quicinc.com>
 <20230113150310.29709-3-quic_devipriy@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230113150310.29709-3-quic_devipriy@quicinc.com>
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

On 13/01/2023 16:03, devi priya wrote:
> Add the dt-bindings for the RPM communication over SMD for IPQ9574 SoC
> 
> Co-developed-by: Praveenkumar I <quic_ipkumar@quicinc.com>
> Signed-off-by: Praveenkumar I <quic_ipkumar@quicinc.com>

That's just one line, one compatible. Which part of the patch is
authored by other person?

> Signed-off-by: devi priya <quic_devipriy@quicinc.com>
> ---

Best regards,
Krzysztof

