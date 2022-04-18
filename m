Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9BED950528C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Apr 2022 14:48:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234984AbiDRMuE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Apr 2022 08:50:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239805AbiDRMrp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Apr 2022 08:47:45 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 377AE2A266
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Apr 2022 05:33:18 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id l7so26633487ejn.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Apr 2022 05:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=9HCxKtGYnrYzRWcKvwUpWOME3pq91zTtzI7mYRWUSFk=;
        b=omx+m7v2RoJtfSG2aBLdGa7HxZ7GfNpOCDmVlxW4PKxzVm+w1oFeS8L9arLKLYcJzv
         RMWOd/zQBkle+usHZmChfJtCBv8azcEwloUbGAH+KoQrcSvqN+lI3h/c5RGmSYGpaOR0
         GYEEnaUljNV5D0jBjC6fDBOkm77MBEHlezkgNINExr594gl09vf249YnLxV2fwa4YGR8
         MkmUxSHxuEF8guisk3KJ3SXsWc2RX8N5BZsaapUsrsTLSYJwhWTxVoKkqoTmMXRf3WSP
         m8eNnbMvQ1XYQ8Lif8H8RBk2yImxaPrH/tlSLOhUybUgsqAx059etvXaxcpEhaNINH5+
         IGXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=9HCxKtGYnrYzRWcKvwUpWOME3pq91zTtzI7mYRWUSFk=;
        b=hV9c+VX9rRRmOWpN1n7BVpc5l+fdDPyVA5Q18SMv5TrD5nHZ9GAW0KFq1T/EZGJNXq
         3LBLz473W1URiOuKDHZ2ZIDg8gEOVWQ2JMXsfXCpAH7n3LiPAHsDqK1hfpnQdLfQap9T
         6Yar3YRsuyhgVcr1sPTYkx1H/dMHGXmbkorrkX4rqSg2p4YayEFKPoFS/Eb8IbVLOrj3
         pO23SRYDrprBsOFlFfDYbFE93cGfgjb8EPhWOoBkVnDbXcMNJs9zLsGqLtPp382yd5SQ
         ZlBGGICJT6Ew3el+tYchbJUiv5UtveqpizUPXGLKKJNag93BwL5XXUjMU7asO/LoLVSX
         oCIw==
X-Gm-Message-State: AOAM533FEIYXdnJRl7KdubAT21CD7THkshXzbkTe+9cZNqMQmeAoX/NE
        Wzh6KCFu0UAYiUJ03ICgmfjGsg==
X-Google-Smtp-Source: ABdhPJySfcNdNNLWRKDZXDnSJYYxL3w0tDnKnsqG//kUAd5ueSM6aLRRtj+zFxoAvXaGXWkDSeWGFg==
X-Received: by 2002:a17:907:86a8:b0:6e8:d649:5e2e with SMTP id qa40-20020a17090786a800b006e8d6495e2emr8989506ejc.276.1650285196630;
        Mon, 18 Apr 2022 05:33:16 -0700 (PDT)
Received: from [192.168.0.217] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id i1-20020a1709064ec100b006e89dfff2d6sm4596844ejv.141.2022.04.18.05.33.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Apr 2022 05:33:16 -0700 (PDT)
Message-ID: <8c880b7a-ddb8-dea1-40c1-892247c6439d@linaro.org>
Date:   Mon, 18 Apr 2022 14:33:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 02/23] ARM: dts: qcom-msm8974: Remove properties that are
 always overriden
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220415115633.575010-1-konrad.dybcio@somainline.org>
 <20220415115633.575010-3-konrad.dybcio@somainline.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220415115633.575010-3-konrad.dybcio@somainline.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 15/04/2022 13:56, Konrad Dybcio wrote:
> Model and compatible are set per-device, so having them in the SoC DTSI is
> superfluous. Remove them.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
>  arch/arm/boot/dts/qcom-msm8974.dtsi | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
> index 412d94736c35..e216630a1d02 100644
> --- a/arch/arm/boot/dts/qcom-msm8974.dtsi
> +++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
> @@ -12,8 +12,6 @@
>  / {
>  	#address-cells = <1>;
>  	#size-cells = <1>;
> -	model = "Qualcomm MSM8974";
> -	compatible = "qcom,msm8974";

The compatible by convention is in the DTSI, even if it is not actually
used, it gives clear information what is the expected fallback.

Best regards,
Krzysztof
