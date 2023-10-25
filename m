Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 24C437D6624
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Oct 2023 11:03:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233714AbjJYJDb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Oct 2023 05:03:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233933AbjJYJDa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Oct 2023 05:03:30 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD7D2129
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Oct 2023 02:03:27 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-507e85ebf50so6100645e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Oct 2023 02:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698224606; x=1698829406; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i1ba5ZfuZoidwEJuzAD2iAaLRr29ZSc16tdqJzC6C0o=;
        b=WVjB/VJg/SQdMJ27nxVVMJ1+IWtl4pntnw/9s+n/QmLQLajUM1j5s86HeNjBmV//pR
         kwwRgLr3H+0KI88KjlC7BY7UQ4cuOQLg1X2wrMJ5R9Ur244IwaU7MlP+Sx49nHHWFTKQ
         BmzdYR7MqzUKBMM0lMahC8dmpAY3RfoYSXtfRtlIjjbBtlTOo2hsDVx4RY5gSUifygDE
         eMyhBfI1XUnN4h4VkGLMn2kZAgOejBuDoqc4yIWK5rOj6sdwj08QzjM572evNONAj4n4
         1b4flP5pdJRTYQOoglil4r9RNvAoeNOmwIZlP7kZP0W9c2bBEnmXcm73njf3YnLaB31g
         Kmqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698224606; x=1698829406;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i1ba5ZfuZoidwEJuzAD2iAaLRr29ZSc16tdqJzC6C0o=;
        b=L1x6heht5GxltrjGhbDxFNXyfVtRkj7AVkAMlMBY7bMtibUZDnNprx0B3/5HTlQDPm
         sCOkCwnr1U48w/Zze5D1IXjRLsEtd0avEpc8VW6Yu5KluJIHyDZy38GQDG8vHAnd2JZo
         M67BvPjNVw49whNzXc1NjUpBCxOzWXdcL6uInvwV2ARrPks0TqWHI1mAHFeB7vTdjO/Z
         lUI1qaASje02jcd8z9FxcWx0VrTtGW90ZQ4peZGNnyG4iRiYJeXfIWurtL2rPv5ezsKB
         S/YGcRzUsJM+JRhcaPfQ9pqU6WTLgIgDQHpc8CZIj40minidtHhlrer6YUQF8D83RoAM
         U5vA==
X-Gm-Message-State: AOJu0YwmZdDXbmXvqY9wbLsJvTcftxRD0QEu/pl1unsXBwJfIqBf+JER
        O3YHBRDTph8LOpcLp10ZEfAK2A==
X-Google-Smtp-Source: AGHT+IHjy4z+eK3GpubNmSvf/+9V60ABr+i2eXWVp5HvoXEfFCL9ZuPzRg4kv7Vx2dYzpCyh4TpyrA==
X-Received: by 2002:ac2:58e7:0:b0:500:b53f:fbc2 with SMTP id v7-20020ac258e7000000b00500b53ffbc2mr10186641lfo.26.1698224605158;
        Wed, 25 Oct 2023 02:03:25 -0700 (PDT)
Received: from [172.30.204.57] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id k10-20020ac257ca000000b005079ab8ab19sm2458305lfo.150.2023.10.25.02.03.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Oct 2023 02:03:24 -0700 (PDT)
Message-ID: <b789229d-7d5b-4019-93b1-b7f71bcb65b4@linaro.org>
Date:   Wed, 25 Oct 2023 11:03:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 4/8] arm64: dts: qcom: sm8650: add initial SM8650 MTP
 dts
Content-Language: en-US
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20231025-topic-sm8650-upstream-dt-v1-0-a821712af62f@linaro.org>
 <20231025-topic-sm8650-upstream-dt-v1-4-a821712af62f@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231025-topic-sm8650-upstream-dt-v1-4-a821712af62f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 10/25/23 09:47, Neil Armstrong wrote:
> Add initial QRD (Qualcomm Reference Device) DT,
> only boots to shell with USB device support.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
