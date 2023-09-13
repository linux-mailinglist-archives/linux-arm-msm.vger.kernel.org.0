Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 55FAF79E1D3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Sep 2023 10:18:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231656AbjIMISp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Sep 2023 04:18:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234572AbjIMISo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Sep 2023 04:18:44 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03BB5199C
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Sep 2023 01:18:39 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-403012f276dso43916925e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Sep 2023 01:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694593118; x=1695197918; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vwUUxaP5y+PTaTEbxwe7UpWq12N8jlqbyZbCYEg72fo=;
        b=nkycTckrP8HdFKUV5uVj93rz9CIQ0vIe/lWNI5Mht9aWGn9ARA47W+zwCZJLnA7nqz
         9oBLSs8vXq9IPpV9saqED0G8T2XXmWOU3DsfH87Vjd+TftYg5xPMYxfQiLK/QGfsTHqc
         apJdVd/7q1S3uQIUcy3rN25Xmz30yNEg+ic26nzUoVetr5j2N/l4gv137+QSyeJwmACp
         yvbnipujkT06AH0xGaqlr83xnx9IUnNQp89PFoDe2hkLmdAFqhvzOocTWAZECbI/FNai
         W06KC+JZWbFDbY4Vg48+a220GF6ml/d6uMBQ7xhzjfEqbgcD09+BprTovOFKofUfvIfC
         9dzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694593118; x=1695197918;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vwUUxaP5y+PTaTEbxwe7UpWq12N8jlqbyZbCYEg72fo=;
        b=Bk7yzyfI5zSjyEwhuQHs1qz1JGykbOLikNbn/MnjO0T1GtOxST2vLJfbXd06ZC8oyX
         a9aWX/vAOw/il6ccqm5UOMfp69U99M6usZWsERxfw5rjOYEjNkonBwXLidCOBvZ3Zh/a
         Peeo4G6A3DnxGbwdyXX7idG01IBWZIzWsNPTvOQd3D7tmmDx071Klpr8b+7RfX/buwiJ
         F83d5/nZTWrt5KU9olz9765NrupgLVs03ARTclpDadwP6VJZQRNiDpwl9yvZJDIEorfn
         5Q99J28XbmqCrq1sg0sRwFSONJvE7j7L7mFevb/igthppuZwJUl0ob0hTec3z/Yt2Spy
         Kgfw==
X-Gm-Message-State: AOJu0Yz8v5KFF3/9JMJLmQRzgRBJojKoarq5fj3/98eMR5g7xMWxuQ3E
        qwm2yEkNSVeJAl6lGebwOlDLUQ==
X-Google-Smtp-Source: AGHT+IGtCk7VyJXdF5BMBjTf7j0eels6E5OC9Af+NH7CCXmJf24asywn1LuqHumwFefnCyRSRVL/Fw==
X-Received: by 2002:a1c:6a11:0:b0:401:b53e:6c3b with SMTP id f17-20020a1c6a11000000b00401b53e6c3bmr1464789wmc.6.1694593118417;
        Wed, 13 Sep 2023 01:18:38 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id l14-20020a1c790e000000b003fe4ca8decdsm1275565wme.31.2023.09.13.01.18.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Sep 2023 01:18:37 -0700 (PDT)
Message-ID: <da6379ee-a024-0dca-4bde-137ad9090fc2@linaro.org>
Date:   Wed, 13 Sep 2023 10:18:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 1/4] spi: dt-bindings: qup: Document power-domains and OPP
Content-Language: en-US
To:     Stephan Gerhold <stephan.gerhold@kernkonzept.com>,
        Mark Brown <broonie@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230912-spi-qup-dvfs-v1-0-3e38aa09c2bd@kernkonzept.com>
 <20230912-spi-qup-dvfs-v1-1-3e38aa09c2bd@kernkonzept.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230912-spi-qup-dvfs-v1-1-3e38aa09c2bd@kernkonzept.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/09/2023 16:30, Stephan Gerhold wrote:
> Document power-domains and operating-points-v2 to allow making
> performance state votes for certain clock frequencies of the SPI QUP
> controller.
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@kernkonzept.com>
> ---
>  Documentation/devicetree/bindings/spi/qcom,spi-qup.yaml | 8 +++++++

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

