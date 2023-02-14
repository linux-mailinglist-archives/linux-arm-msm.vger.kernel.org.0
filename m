Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12249695FAF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Feb 2023 10:48:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232585AbjBNJsM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Feb 2023 04:48:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229731AbjBNJrq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Feb 2023 04:47:46 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA432233C6
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Feb 2023 01:47:45 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id j32-20020a05600c1c2000b003dc4fd6e61dso13216795wms.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Feb 2023 01:47:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u3RPTKzuRFOyVfeP8KPrGZy3f2PFRah932ztv2gi7LM=;
        b=Ehku01k+/yYEpZOWuGKz0Y+qBe4tXs89e0TgnDttDvcXQLfmTURvkF+aIZ0D8Ir0H+
         zA4p6oKaZlt1fYFPagiJJdemDa78ClAug+gB8/j2h3DE/1RRfcnEAQotOBD0VXa/7jXS
         SGxrwTZaJ1fcLUfrIBzbCOg5MB3YoronJsb2zgF0Jrvk654aLZ02dj7u8JKjSn6DjJUK
         /BAMkSdpGQlrnczXrXb2f9cJ73YvEp3AwZQNxwvpclWFRBj8A/fvSwgVpdwsSsOj5lNq
         eNwIZVNa0lnMFvKzQFvYIdKZ5XblEKjXNURoGKKtn0Ir/WdgOtnLJ9/Q6pzEahbosPUO
         JbAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u3RPTKzuRFOyVfeP8KPrGZy3f2PFRah932ztv2gi7LM=;
        b=ZYNMbr1yxNob1V0OTSA3BqtrE89jVUHqEsLhjo7QMeRxspHbJHJ0Is62A5xeAzoZ8L
         3XvgmaG8gqvq6D64QINysV3CdODwGwPKw5ydj4ake3HbAiyRxnCdFG0Pa1K8V3EjPHWX
         5AkL1E0K4QrcRwCIvC+VMTgaZMaZlpI1U1iy1xrm9ZFyqvcDDG2i3YeUZyzdaRYWQvfG
         yK/XIfE2GivjNdpoOUce4ZnKPqUhvK6pL8e9ej4hfHX3wW7T1NE4woKUls0X227see9q
         sNSN4vDDUYBRLh8/S2WrfgqNAOg7Vl1m8nei/4suSzms0eG4RdatV1eQ8kqTyYLwEyNx
         qeJw==
X-Gm-Message-State: AO0yUKWWNtAxYkMB5FGCoUUoqH6iFP26yKSvuRQKKh8buP6kj4BDG5HX
        xQVr4eSPpGNBsJLEUKDHqCEvZkm5PK/5hoYf
X-Google-Smtp-Source: AK7set/SHwwA36oOl1cfZ9Xajv6+FBR32/vaHlEdMYk0ojT9JelNUuP5y02Qh9FKx+tIMw4D9nhTAg==
X-Received: by 2002:a05:600c:1695:b0:3dc:561a:79e7 with SMTP id k21-20020a05600c169500b003dc561a79e7mr1473755wmn.2.1676368064265;
        Tue, 14 Feb 2023 01:47:44 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id l40-20020a05600c1d2800b003dd1b00bd9asm18386329wms.32.2023.02.14.01.47.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Feb 2023 01:47:43 -0800 (PST)
Message-ID: <7336923b-e322-1211-0c1d-7ad70c7bfef7@linaro.org>
Date:   Tue, 14 Feb 2023 10:47:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/3] arm64: dts: qcom: qdu1000: Add IPCC, MPSS, AOSS nodes
Content-Language: en-US
To:     Melody Olvera <quic_molvera@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230213190122.178501-1-quic_molvera@quicinc.com>
 <20230213190122.178501-2-quic_molvera@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230213190122.178501-2-quic_molvera@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 13/02/2023 20:01, Melody Olvera wrote:
> Add nodes for IPCC, MPSS, and AOSS drivers. Also update
> the scm node to include its interconnect.
> 
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---


>  
> +		aoss_qmp: power-controller@c300000 {
> +			compatible = "qcom,qdu1000-aoss-qmp", "qcom,aoss-qmp";
> +			reg = <0x0 0xc300000 0x0 0x400>;
> +			interrupts-extended = <&ipcc IPCC_CLIENT_AOP
> +						     IPCC_MPROC_SIGNAL_GLINK_QMP
> +						     IRQ_TYPE_EDGE_RISING>;
> +			mboxes = <&ipcc IPCC_CLIENT_AOP IPCC_MPROC_SIGNAL_GLINK_QMP>;
> +
> +			#clock-cells = <0>;
> +			#power-domain-cells = <1>;

This does not look right. Which part of aoss-qmp registers power domains?

Best regards,
Krzysztof

