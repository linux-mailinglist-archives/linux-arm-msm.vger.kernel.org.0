Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 909F979E1DA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Sep 2023 10:19:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232223AbjIMITS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Sep 2023 04:19:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238529AbjIMITO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Sep 2023 04:19:14 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C58410D
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Sep 2023 01:19:09 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-31adc5c899fso6923650f8f.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Sep 2023 01:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694593147; x=1695197947; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9NsxlUjjgZOGvXotvVbRkIAcBGbmL1XTcj6hf7hYMuo=;
        b=C5S4pSBOetBrecLJnkR7Er+leZwwZGBo/BlWrW4xNZY0KCDkQTlIXTsZa5v1mv9QVe
         WTQDATLPj353PtN0ywlisfpsf9cd55cqTpwJXfK0qivDiKmfefHQWNY2kVwQszC3ffiv
         AsYLK5jLNDuHbSPXFI68nrQaJaMSEHWPJeT+25+rtnbVXTAU17aTahPShtFgvbT2MScp
         vu3lr9VEjtOVx5O5JSsCypXPzn2XQUPk2sTJJp5Bfi5UG3FGGuJSyDHtzFFBdYCay3EO
         aOzpki65oVu6G5jfejsNqro2fdIYPonOyTmGMOYPbsun2WlURtL41wImh8TKfiT5c+xz
         5OvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694593147; x=1695197947;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9NsxlUjjgZOGvXotvVbRkIAcBGbmL1XTcj6hf7hYMuo=;
        b=M8FFM/M9PubKX+b1iVflZ8jkzjN3+StPCqXnfDGonR+B9D7Ds1XXeuJ2Ka93QHEuds
         W5rB4JzB2d6wP3NNfZ02KqO10uOdu+64d0hvxNbSxL2biUrSXQmchCY4pLcWf8tOItJV
         KDIlo1MDAn+J+Q4Zmh8vv9qzjDRvLmvplLE9wdiYIm58qy1UxgsKzHeL9uXxtX5qNa99
         egGx/UTbwZQ30/COhzfg55hz+bV3nGvXjc/FjHuwxJO2W82S77G5UcMNOiYi/Ig3wx7P
         9jMZmsiMMWQx/7elSRdfThB/i1A7I+Hnes5IfKHOaOWh0jQGViAg0Xo9zw8jYljVD9MN
         IdLQ==
X-Gm-Message-State: AOJu0Yw2YBOas0OGbbr2D2xyM9WqkvKrYjDAncc24o8b6dUVKG60C8iw
        kihy2nVtj6j3+hE/EePmeb1klw==
X-Google-Smtp-Source: AGHT+IEOd4q16miJ5WMkh2ahubwP5QYlKrLKZ3mGOe56q8WuA8TKM93UnRuRsZSXzJGdPqkoXYuAIw==
X-Received: by 2002:a5d:53cd:0:b0:319:7656:3863 with SMTP id a13-20020a5d53cd000000b0031976563863mr1316115wrw.47.1694593147545;
        Wed, 13 Sep 2023 01:19:07 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id w18-20020a5d6092000000b0031c52e81490sm14934047wrt.72.2023.09.13.01.19.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Sep 2023 01:19:06 -0700 (PDT)
Message-ID: <16040f40-3938-d324-d916-ffa5775525c6@linaro.org>
Date:   Wed, 13 Sep 2023 10:19:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 3/4] spi: dt-bindings: qup: Document interconnects
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
 <20230912-spi-qup-dvfs-v1-3-3e38aa09c2bd@kernkonzept.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230912-spi-qup-dvfs-v1-3-3e38aa09c2bd@kernkonzept.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/09/2023 16:30, Stephan Gerhold wrote:
> When the SPI QUP controller is used together with a DMA engine it needs
> to vote for the interconnect path to the DRAM. Otherwise it may be
> unable to access the memory quickly enough.
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@kernkonzept.com>
> ---
>  Documentation/devicetree/bindings/spi/qcom,spi-qup.yaml | 5 +++++
>  1 file changed, 5 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

