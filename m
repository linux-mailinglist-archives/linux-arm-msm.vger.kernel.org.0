Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D51652BD06
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 May 2022 16:17:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237439AbiERNKo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 May 2022 09:10:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237591AbiERNKj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 May 2022 09:10:39 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF5E81AB798
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 May 2022 06:10:25 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id u7so1761234ljd.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 May 2022 06:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=+b2kJbCQjxe7fZUbjqvLH/wJyCAU5HIJ3JzBSgXlc2g=;
        b=gDbsIUdII1wcs2EpKhTuW28O+P8cdc+sO8YSXKIAWpvpnedMSMgyr3RgkAAk/DVvht
         DsyXJ/jT8HQfq7B9CeoMrpIX8KMQgm8TUl0UqaMhmu8W8+EGj3J1+s5Rn6PN8rAGv2K0
         HNjXPq9JQev89Eko1cdiqxmefanGPoBgDjLwhn/WTXlDO6Fm3tJJvikqeUwkfUCuU85+
         /58tJF0mMQknDYAfbPtpV/KSZt72teOI9xPgRGIExddQwUpBndzoC+BLjFLfuwJvCPOT
         /xELk94+zE/s66lxdlvxt6vTrY5zW9m9ADpO7Tlw43FyHTOmwg3zvTfG0bZ5kQIHt+Od
         M4rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=+b2kJbCQjxe7fZUbjqvLH/wJyCAU5HIJ3JzBSgXlc2g=;
        b=k5O6lzrfknHPf0C5Cyx3AHo8Na9n+1R1JKhQ/ShAZqiTQ0aUYYM1ISd97RzeCUFxW1
         T0Jc8QOfSkQWDg4lsdSHdvpTxVCKf+w2qC9y+Bk0Ilkvc+jyYAVEysSU59HkxLKVLToB
         h+9tIUiImLZiXUgsZdjf1hA41k6s3DYz1QoS2CQz5YFq4QD9sxYAUGigixs5eHrRkhfE
         IS5L5R333SDY+uH3V01u1Z4/p3dK0lhiIOa3NXt6cQ2T4UyGzA2anFr3rl86j6Qw5FMK
         f085vYoIMJ4z35POgwQjlnXYB37xlYLFpcT6lweFj1ylUHUOtbtgU1Iy/ddJ9SjeLGf7
         jC6g==
X-Gm-Message-State: AOAM533RqPt2SL6kEGBWxlHhfUiV2fyDwEgXO2vcmyvPmERYeZ0vM+dj
        QN8UrF0qBGohsCGF6drcr/iePQ==
X-Google-Smtp-Source: ABdhPJw3ZZEz0IO+p8W0PuSOZYSbEkgk1HzwIbid4bAjfiWrs8DO4UHAy0Em3/ZaTfECsrR9kKjSRw==
X-Received: by 2002:a2e:a80a:0:b0:24f:3010:8114 with SMTP id l10-20020a2ea80a000000b0024f30108114mr17569964ljq.95.1652879423874;
        Wed, 18 May 2022 06:10:23 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id q12-20020a2eb4ac000000b00250749dab23sm211926ljm.99.2022.05.18.06.10.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 May 2022 06:10:23 -0700 (PDT)
Message-ID: <511ca90b-6c82-440f-0363-03ca4a0989e9@linaro.org>
Date:   Wed, 18 May 2022 15:10:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3 3/6] dt-bindings: regulator: qcom,spmi-regulator: add
 PMP8074 PMIC
Content-Language: en-US
To:     Robert Marko <robimarko@gmail.com>, agross@kernel.org,
        bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20220517205341.536587-1-robimarko@gmail.com>
 <20220517205341.536587-3-robimarko@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220517205341.536587-3-robimarko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 17/05/2022 22:53, Robert Marko wrote:
> Document the PMP8074 PMIC compatible.
> 
> Signed-off-by: Robert Marko <robimarko@gmail.com>
> ---
> Changes in v3:
> * Add supply matching


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
