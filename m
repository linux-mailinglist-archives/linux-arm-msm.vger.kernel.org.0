Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F8C4699219
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Feb 2023 11:47:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230072AbjBPKrS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Feb 2023 05:47:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229875AbjBPKrR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Feb 2023 05:47:17 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7380411EB3
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Feb 2023 02:46:57 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id bi36so2229214lfb.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Feb 2023 02:46:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EwBpAqMFpFr4je9eCvVMSDtRlxM1xwSCZYICMzxMvIg=;
        b=yyl94jbkA/n+iLA6tvBVKkEaoRUKL3iIwO0qH4nhh/hwyqyB8dtxe22GoU8vDmCyWO
         yXF1YFEa+O3zPUSpBsH+/+iw0QN58tRuGdKc3HVtzrKWKPUKFVU6QiE3wOwUp29dklp0
         0Rs/2G40XC8P3tiZst7TmiWwy+zIHRqjINF1LvACaXxyk9jeNJzs59+EQPNb4fh3s2II
         y/Y+MZjU7tDnC/11w5fWw0ECeVAHt1gBRI4gkyIgYC8cLDLpD8f812REXBe1pi7NlYYA
         fEHLy3sd5jgT+GbwSWAUaIEkAXI8im1HiFO4Q/CX0ryh5fwB3lPmPXHf/AM+e0HI1TsO
         IynQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EwBpAqMFpFr4je9eCvVMSDtRlxM1xwSCZYICMzxMvIg=;
        b=UM8HxG45ivmqX0Y3SS9DH+9JiXDm04/bFfCv7zglIgRsedmY/8DKnr63nSW4UjUpxl
         j286IEMSWfvMyRb0AABAi3JK906cDt8irm5LU+DxvZS0bA5Wwl+DfvhPuag633mI9NCh
         Q3jfykHtJEmYtSdB6dyz8/zCCXU76Jcnh9SctVF9ildLc+TkHGWBBvZCO3F/Kz/snhe9
         sOiMpjNiu/sjFC91kEPTLUrwE98VVq6fn4m3elzqukKhbtdm1OhNY0EIB8eHmwev84+9
         nhY/5UjRayQk8U5Z6l8bZ6solh/317sbq31CO4iVh5ysGhg1qPc/UyTLe1dmDLWPhabg
         kVpw==
X-Gm-Message-State: AO0yUKXNwhVr8wbPhGixuGVPMheoQHjL+8zRl+bwh1k79XREvazCc85n
        J+SgA5uq75xqxrhdh0I42i1rPg==
X-Google-Smtp-Source: AK7set92+49/NTBUM3QPtQPvbgIyz52LEGJVNJWCBHL1j0qmJWItafGhFS4IIKRiTqFaUPRfBrp1hg==
X-Received: by 2002:a19:7506:0:b0:4b4:89a9:6bfd with SMTP id y6-20020a197506000000b004b489a96bfdmr1403805lfe.7.1676544413350;
        Thu, 16 Feb 2023 02:46:53 -0800 (PST)
Received: from [192.168.1.101] (abxh117.neoplus.adsl.tpnet.pl. [83.9.1.117])
        by smtp.gmail.com with ESMTPSA id i10-20020a056512006a00b004dc4af9b351sm245745lfo.153.2023.02.16.02.46.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Feb 2023 02:46:53 -0800 (PST)
Message-ID: <8df56794-090f-dd34-eecf-e0debabdb7f1@linaro.org>
Date:   Thu, 16 Feb 2023 11:46:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH 3/4] ARM: dts: qcom: ipq4018-ap120c-ac: align SPI-NAND
 with DT schema
Content-Language: en-US
To:     Robert Marko <robert.marko@sartura.hr>, agross@kernel.org,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     luka.perkov@sartura.hr
References: <20230214161211.306462-1-robert.marko@sartura.hr>
 <20230214161211.306462-3-robert.marko@sartura.hr>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230214161211.306462-3-robert.marko@sartura.hr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 14.02.2023 17:12, Robert Marko wrote:
> SPI-NAND node name should be flash@1 and not nand@1 according to schema.
> 
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm/boot/dts/qcom-ipq4018-ap120c-ac.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/qcom-ipq4018-ap120c-ac.dtsi b/arch/arm/boot/dts/qcom-ipq4018-ap120c-ac.dtsi
> index cd2a32d0d5548..bb0c888b048ec 100644
> --- a/arch/arm/boot/dts/qcom-ipq4018-ap120c-ac.dtsi
> +++ b/arch/arm/boot/dts/qcom-ipq4018-ap120c-ac.dtsi
> @@ -186,7 +186,7 @@ partition@190000 {
>  		};
>  	};
>  
> -	nand@1 {
> +	flash@1 {
>  		compatible = "spi-nand";
>  		reg = <1>;
>  		spi-max-frequency = <40000000>;
