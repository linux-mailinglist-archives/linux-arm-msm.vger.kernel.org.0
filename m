Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C46FE4FDF80
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Apr 2022 14:29:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352805AbiDLMVA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Apr 2022 08:21:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354949AbiDLMSi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Apr 2022 08:18:38 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9792020BE4
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Apr 2022 04:19:37 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id d10so21999819edj.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Apr 2022 04:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=sfA6MOf6DJPMsOSqk9RCV7ucB2ENy9uF0MY2NddqiJ0=;
        b=GOZLhWT6sj5S6DZkRYib+a8qhec0MIZi7DeZV2s1Q4nEtveh6a91GEI4ZwDw+gZqHw
         3ODAiTgMLt6jFoWSuAm8vY2/xNHHjJsZUJj6+S+PEaMF4f2p71nqeCJfUz8i5BL4HsmS
         FXThgANArJeilbkXcrw7iQ/LGx/ohbbmeAN0G8ardfP7RUJAZuAqkll9/g2385NmIrV1
         yPoXA3HoIomkAGQrLIdfzNjkfzT6rPZ24aBWzDRF6VlGEV7WvCUoJw4FM960M8IiwJsK
         Bfmw4CxwHK348O+2D3dIiIsPa6FaMRuwwoEfA7BZg8piR33144r0crTkgL1XH/GSzPwi
         eK+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=sfA6MOf6DJPMsOSqk9RCV7ucB2ENy9uF0MY2NddqiJ0=;
        b=P5a6ILL7ouvYcOVV4xJNIYICHybZHUUU6zrjHn9TNNUObfQVjHpr/4XtL08nxFc+FQ
         gyr6l7vZCicFUoxzfMmNP2SxXs5fx2fGcCD2p3ZX6TBn51FjBkt/gYhD0enl/Rh6TVuv
         LYO9PtsfCCSZrifN1Cgc2p4KgCN8ZwhO+IVjnH1T8HHuQ1yl6z6YTMCvArORGHpDOb3a
         /vjC+WigmhpAF9WMkqYkdHV08s8vP8MDxGrbpXL93bDvyGcIozuPdExluQEt/CxhgZ8P
         h+MxdYWEP2JgXLjbItt3k8tJV5Yf/8u5+lXTTEp3T8HBrB7P2JpeVLij/F3YN0eBLpd5
         Nl8Q==
X-Gm-Message-State: AOAM530EwmEFwnT3OSP6IAV56y/5R5jF2jxmvgsu7RKzrJYSxkiuLpHc
        ixbaCTjJ70YQEEndsQn1sHURdA==
X-Google-Smtp-Source: ABdhPJyK3qlSlj0CpjyC8VFeOLrhS8DGiBfW/ctihuISbvxeyNVGHo85Ouw9i8f0oSgrHk0LQvCIKg==
X-Received: by 2002:a05:6402:3044:b0:41c:d4d4:8664 with SMTP id bs4-20020a056402304400b0041cd4d48664mr38275880edb.239.1649762376235;
        Tue, 12 Apr 2022 04:19:36 -0700 (PDT)
Received: from [192.168.0.194] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id qf21-20020a1709077f1500b006e84ee40742sm5123438ejc.218.2022.04.12.04.19.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Apr 2022 04:19:35 -0700 (PDT)
Message-ID: <2a97d1d4-ece4-1725-6cf7-f50f6664f15e@linaro.org>
Date:   Tue, 12 Apr 2022 13:19:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/4] ARM: dts: qcom: sdx65: Add interconnect nodes
Content-Language: en-US
To:     Rohit Agarwal <quic_rohiagar@quicinc.com>, agross@kernel.org,
        bjorn.andersson@linaro.org, gregkh@linuxfoundation.org,
        robh+dt@kernel.org, krzk+dt@kernel.org
Cc:     manivannan.sadhasivam@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1649761414-19217-1-git-send-email-quic_rohiagar@quicinc.com>
 <1649761414-19217-2-git-send-email-quic_rohiagar@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1649761414-19217-2-git-send-email-quic_rohiagar@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/04/2022 13:03, Rohit Agarwal wrote:
> Add interconnect devicetree nodes in SDX65 platform.
> 
> Signed-off-by: Rohit Agarwal <quic_rohiagar@quicinc.com>
> ---

>  			};
> +
> +			apps_bcm_voter: bcm_voter {

No underscores in node names. This will break upcoming schema.

> +				compatible = "qcom,bcm-voter";
> +			};
> +
>  		};
>  	};
>  


Best regards,
Krzysztof
