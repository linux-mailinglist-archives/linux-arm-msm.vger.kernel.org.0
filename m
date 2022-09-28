Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B8995ED707
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Sep 2022 10:02:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233825AbiI1ICY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Sep 2022 04:02:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233000AbiI1ICW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Sep 2022 04:02:22 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE0FD1CE914
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 01:02:20 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 10so19196832lfy.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 01:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=sWrqv0/C3Xw/80S7MDLGuqnPRZ0UJtGJrRekrfjkTs4=;
        b=nwo4S9KAhpN/GNIOof7KcWwiUrw6CsMMBhfm2o5HTvftrdIbEpObYeDYb07fkt015K
         96usNALO4Fsrr5npKzQavY2vQ0PeVQDRQrKiPuifQky0GrdPEPUeIrHDAFMb7xcONRFM
         Wr6tN5+b2OqlUQsDAowh19hCiz2ioYx6ThTky+OwWBxRcVNCSGwqoUPf0EFoJMCSpCLc
         Zylw0CGxW6537gQy/QIG2z1X0mao/NxoFA6G/uS+kN6Ng2ve8Ik/4PVtVxJoaFOhAqhs
         oJUOrniSTIyIJ8eYsJEeoGHX2dNFKssZl/wqoXa5MmgRN3Z9zZjGbybDXHQPmnt+jpwW
         3cNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=sWrqv0/C3Xw/80S7MDLGuqnPRZ0UJtGJrRekrfjkTs4=;
        b=XNk96B9BVVyyB71lVfPIlP+dQkuyAOzxpO2on9qhr3h1HEjrLAshF6AxtOiegx2xP7
         JiyOrrb9JMupZsX3JFqvHcBkM2GOcu2nHJhXfJTZpNBQZbffN0UKszshGi9YvACMJ7Y/
         2w/hPMbKmUL7x51Aw++zhLZ235i3IPqD0MVVj77u1MBLCkuDK0+t2vRSgkkaKfSw9+9w
         B0MTOHIY63T8E6x6M5a7PNcHKlRIA0x32SgzSXjNz7c1KWuIsE3+u7Q4tFhxSMOfxTPa
         oUWzJGuN7CP6Hrflqdb8qedQpRY8BcWFMhvDdr3A3ARiUSuXX7zVQ3xZ0xWeX+MC+0TI
         4/VA==
X-Gm-Message-State: ACrzQf0r2SOznLIsOFK/8iA7xgE7ZMmTOv76fUM6mW8I+6NeFRCxRZPX
        dZJP4xr+stn4k+zQzIog5ylfHA==
X-Google-Smtp-Source: AMsMyM462e2gzDRMcigpo0E6CoujlM0kS7F3rvPxqhQ4iJiCLr4zVMLsaxyFyUhvlxw/JsGTzjPYBw==
X-Received: by 2002:a05:6512:e9f:b0:498:f1e5:26e5 with SMTP id bi31-20020a0565120e9f00b00498f1e526e5mr13741248lfb.517.1664352138921;
        Wed, 28 Sep 2022 01:02:18 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id t17-20020a2e5351000000b00266af46abccsm372086ljd.72.2022.09.28.01.02.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Sep 2022 01:02:17 -0700 (PDT)
Message-ID: <06a2d726-180b-19de-eea8-1a0432d6ea49@linaro.org>
Date:   Wed, 28 Sep 2022 10:02:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 2/2] arm64: dts: qcom: ipq6018: move ARMv8 timer out of
 SoC node
Content-Language: en-US
To:     Robert Marko <robimarko@gmail.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@somainline.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220927201218.1264506-1-robimarko@gmail.com>
 <20220927201218.1264506-2-robimarko@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220927201218.1264506-2-robimarko@gmail.com>
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

On 27/09/2022 22:12, Robert Marko wrote:
> The ARM timer is usually considered not part of SoC node, just like
> other ARM designed blocks (PMU, PSCI).  This fixes dtbs_check warning:
> 
> arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dtb: soc: timer: {'compatible': ['arm,armv8-timer'], 'interrupts': [[1, 2, 3848], [1, 3, 3848], [1, 4, 3848], [1, 1, 3848]]} should not be valid under {'type': 'object'}
> 	From schema: dtschema/schemas/simple-bus.yaml
> 
> Signed-off-by: Robert Marko <robimarko@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq6018.dtsi | 16 ++++++++--------


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

