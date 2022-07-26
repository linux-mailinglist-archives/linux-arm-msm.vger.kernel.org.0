Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E351C5811B0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Jul 2022 13:10:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238800AbiGZLKw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Jul 2022 07:10:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238790AbiGZLKv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Jul 2022 07:10:51 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACAF43121A
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Jul 2022 04:10:50 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id p11so17299643lfu.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Jul 2022 04:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=BIbHtoZSMIZLyh0GmjmBn+JXyuxmYDwFKOWUgfWh8+M=;
        b=Ff6DNl8enN/fI7RtHSJN8+TCzhdhaVFAu13OTyARia1ol6Lul1CAXBtq9FXG+isi+X
         vEbFZAQoH+0WnzjHKsSe1xpoXRAUz2SdNEci4W3i1Mcqd8L4xE0VBZdI3hoa50w8Rpq8
         qfKr5EvtpmaKnNh212LxJKcsM1DbvaQ0fq53ncAYyxlpxU8aebSkQmuPKCaeiKocgtIQ
         9PduEPHKb+NET1M9pJN0CwTc/Q5U+q8bWE+8wtHAg9GS3cuS+BIFsp2G+gbL+Tgnauff
         cbZ10Fg2phDtvVYf1vdZJg38UpSShXpnfjnSc44Dg/Lw5M5Ort+J5KwUu+W4hsehLDP2
         GDqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=BIbHtoZSMIZLyh0GmjmBn+JXyuxmYDwFKOWUgfWh8+M=;
        b=xsf7HEQOT4ntHXNgXo8F7NVtthr1moWvllLFVJ0e4vqSmf6ZhFiiIwtM+T/gNg17Ni
         LTZx8FScQX2Pq79QTMC/7HoGCjeO84CHJM6Rh8uf2rgOqWWoGp2YMKbfsjutm9L8Jn6y
         kWlZgWu8U6zNvBWXEb57r99i5nQoXZ8DiQLj9nHYd4+fT7p34hh5NyjeH5HUxfhXRdA7
         ycHfVJufjKnpeKwdTvceJau7lETLrBboC3LoDsapU0GRNHp68S3g2MNw5kbdnV7Qk5D/
         nLKbR4Z4mWvsRV99mPGtWM6Xo7LfkpIZA/qaBgA4qLxlYcdPKUFwP31qDEdTgqbGSfNe
         0e4w==
X-Gm-Message-State: AJIora+GMDflkUhIXG/xaWMUgoEcBz9tkke62QDtsCcEN//ziLI6zZOA
        ohHgEJ8oC0XhcZZl4H9MXg10+Q==
X-Google-Smtp-Source: AGRyM1uhe0CVkxx0pdcTRAFVVCH1nMl3/26PwxbOwZYC+4Ql298ZJaf5X8t6W2VY3V3003c6em02Gw==
X-Received: by 2002:a05:6512:131b:b0:48a:26dd:d823 with SMTP id x27-20020a056512131b00b0048a26ddd823mr6023574lfu.661.1658833849080;
        Tue, 26 Jul 2022 04:10:49 -0700 (PDT)
Received: from [192.168.3.197] (78-26-46-173.network.trollfjord.no. [78.26.46.173])
        by smtp.gmail.com with ESMTPSA id f11-20020a2e380b000000b0025e07e701b8sm1078641lja.63.2022.07.26.04.10.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Jul 2022 04:10:48 -0700 (PDT)
Message-ID: <0c349122-6164-bccf-2d70-072e14f059ef@linaro.org>
Date:   Tue, 26 Jul 2022 13:10:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 6/7] arm64: dts: qcom: msm8996: fix GPU OPP table
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Yassine Oudjana <yassine.oudjana@gmail.com>
References: <20220724140421.1933004-1-dmitry.baryshkov@linaro.org>
 <20220724140421.1933004-7-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220724140421.1933004-7-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 24/07/2022 16:04, Dmitry Baryshkov wrote:
> Fix Adreno OPP table according to the msm-3.18. Enable 624 MHz for the
> speed bin 3 and 560 MHz for bins 2 and 3.
> 
> Fixes: 69cc3114ab0f ("arm64: dts: Add Adreno GPU definitions")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8996.dtsi | 10 +++++-----


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
