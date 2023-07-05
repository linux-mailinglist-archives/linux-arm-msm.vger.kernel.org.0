Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01010747CD5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jul 2023 08:13:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229998AbjGEGNV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Jul 2023 02:13:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231424AbjGEGNU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Jul 2023 02:13:20 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B84D10E3
        for <linux-arm-msm@vger.kernel.org>; Tue,  4 Jul 2023 23:13:19 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-51d7e8dd118so7884154a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Jul 2023 23:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688537597; x=1691129597;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lqMvNoIwlwGFZJloXx8M+SH9QlhM1qpHkJo78qwIBSA=;
        b=B3svviN7GScCmURv8W31T4v3s4DILS79IWRmrP3x6SSDexgAU8UCOdfA0UpZkIWV0n
         a9LCvQIR//eBnaQXQfeGCbSHyFqfs5rKvu40OSlqiHH5rBMHbJf+2ve+maGvNLwKoGIu
         dehNfEh8ThpN9oijvpzqHa0ERZ2pJnH8mU24Qx4cU7Y+RF4Uw2eYb2iOC66hNW1GxIbe
         YtQwe+Ctd2O/mVhRj0MgPYOQw1EiLyVRIvP+0DnncAUXhJb6NsGoyTe57nKiRfZ5JrLZ
         MXVX52o+GlunVvI7DAqjGMQfHqFKkfNxZEQlMYdNf9iwAkO1P5RBTbec0KedyFEKKG6P
         hrzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688537597; x=1691129597;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lqMvNoIwlwGFZJloXx8M+SH9QlhM1qpHkJo78qwIBSA=;
        b=JRgK87PqevI+fdM+WP+KblHTnebpZQKhdOD84tUcuZPoyJceFe0yKFuEBu5NTT5o33
         EmOFV0oHjVHuDfPo2k7GsaIVIAs91Sz+/aL3gDPVsst5bA0bJJWpqYepFRzob63gk+mW
         /pIT/P6tSryfNGNhLG+GQexDhxPSRGnMX1Wjq+C99uh/h+a/Xk32dnpiPvYXJ2z3i/Cu
         X+LsC131u26082ARXgRFrG+/vV3cnT0w7Trzu8NHMQpmG16Cfh5Wwjw/rZb4Ys7f81fE
         L8uoPhxD7/GXvdZH1NVF2CbDafi5ro1hOcep66X+JsYPFvF7ABgVHlpcqtzKosXKkSjT
         5JVA==
X-Gm-Message-State: ABy/qLYKcEZGNqAk08YvxJC0fppGP1Hbsc0za1JnJwpbMar3QFxfWx79
        mTO7QtA9WIpxShBggM59Oe5rtQ==
X-Google-Smtp-Source: APBJJlFWsUvHbm9RIwBiH3YK3Jk6AwQxinXAU1C+Jzq+JcQ8T1YWPq5fqFUUZ7S0P6wSkw9tOymcNw==
X-Received: by 2002:a17:907:20a4:b0:94e:e6b9:fef2 with SMTP id pw4-20020a17090720a400b0094ee6b9fef2mr12041682ejb.67.1688537597558;
        Tue, 04 Jul 2023 23:13:17 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id xa10-20020a170907b9ca00b009892cca8ae3sm14122550ejc.165.2023.07.04.23.13.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jul 2023 23:13:17 -0700 (PDT)
Message-ID: <18869133-ceec-f6db-8ac1-6b4d3b83a297@linaro.org>
Date:   Wed, 5 Jul 2023 08:13:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 1/2] arm64: dts: qcom: qdu1000-idp: Update reserved memory
 region
Content-Language: en-US
To:     Komal Bajaj <quic_kbajaj@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230705053914.9759-1-quic_kbajaj@quicinc.com>
 <20230705053914.9759-2-quic_kbajaj@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230705053914.9759-2-quic_kbajaj@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05/07/2023 07:39, Komal Bajaj wrote:
> Add missing reserved regions as described in QDU1000 memory map.
> 
> Signed-off-by: Komal Bajaj <quic_kbajaj@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qdu1000-idp.dts | 26 ++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qdu1000-idp.dts b/arch/arm64/boot/dts/qcom/qdu1000-idp.dts
> index 1d22f87fd238..3f5512ec0a90 100644
> --- a/arch/arm64/boot/dts/qcom/qdu1000-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/qdu1000-idp.dts
> @@ -448,6 +448,32 @@ &qupv3_id_0 {
>  	status = "okay";
>  };
> 
> +&reserved_memory{
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +	ranges;

Drop, you should not neeed it.

> +
> +	ecc_meta_data_reserved_mem:ecc_meta_data_reserved_region@e0000000{

That's not correct style. Missing space after ':', no underscores in
node names. reg is first property, not second.

Please open existing files and look how it is done there. Srsly, just
open qdu1000.dtsi which you are extending.



Best regards,
Krzysztof

