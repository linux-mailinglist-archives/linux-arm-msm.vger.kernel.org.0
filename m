Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5FBA068A0D8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Feb 2023 18:51:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233497AbjBCRvh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Feb 2023 12:51:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233309AbjBCRvf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Feb 2023 12:51:35 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15D151116C
        for <linux-arm-msm@vger.kernel.org>; Fri,  3 Feb 2023 09:51:30 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id j29-20020a05600c1c1d00b003dc52fed235so4483778wms.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Feb 2023 09:51:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NgqZwDJlGJbQKbGJcGm5CXNr1997IbkwA2j+9q3gHT4=;
        b=Iy/G/M3g4IArcj9O603m9m34/6kOrzjItrYsH7SUQsiRnqQaWq5e3JKZPFU7FgNdUI
         YCLj9z4SQ+lkyUelcO1tmPSKFgMWAl3SQZsGNOsxDr64Ba5pXGEiuDtilvsptIzodN/S
         +/DOR3EDO6YJUXFjAB75cDPZ+n3nTnszkC7QRh7PLmXrd2Lz46GD8L1pKGvHsH/dG4ff
         Jap9SJ9AWvQQTb8rXTSOj73TG/qojw1ySUxlaAjSEPDc+E8xTcBVid5ayBosk7XK9Eqx
         4AQvNUsWe5sarqdjwumA3yLdxWJu9m5PClhKGEppK6I3pkjE/GxyUuU6waTfHd2Zt2nH
         N/Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NgqZwDJlGJbQKbGJcGm5CXNr1997IbkwA2j+9q3gHT4=;
        b=D6ZWMyTUNeoX+eumXhaDtIDUzhwoxfdjRXTRuAI+UnSaUdwQ0wvoGOewZSj0v+qEEl
         wANra5tOuqA+IkV6M7fvu0sLywcnf2bYaNiIXTlUK401ufeRvYEkGI74ycuafyI0/CaR
         MByWE0i5QV/50Bg7rnL9HR1lAmhDDYn60lVTg0aC+ScM7bMgOKuZHjS9dQJR7JF6CWC7
         +Z08Knn/fVYio0k7I2DMXMUe8UTVqjOIKiMHgj6QqiyZi3EREobbI2ZoK1nuVqpavTga
         JdJadBC/t1RggyTOpEqRWO5aTZhseymWzehJQPZ16RG/tJpFXwnlEuQZx9s3SwnG2zzG
         p1fw==
X-Gm-Message-State: AO0yUKWVPZsu5LMYb6P2/KxbCD77NEHyMjUY82O2xvr7bdcT9b4Y+1SA
        OZ3p2SQxBmCIBhUsC5OzGi6+bg==
X-Google-Smtp-Source: AK7set9sJiwM1eIWpiT1eJZDNvKZCvN2WYe2+VAEQqG0Fb48WRPlqzV5i4ZMRgv8FFoR+Ix+wP3vfg==
X-Received: by 2002:a05:600c:510e:b0:3d9:a145:4d1a with SMTP id o14-20020a05600c510e00b003d9a1454d1amr10301847wms.34.1675446688640;
        Fri, 03 Feb 2023 09:51:28 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id h9-20020a05600c314900b003dfeea6a85csm913474wmo.31.2023.02.03.09.51.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Feb 2023 09:51:28 -0800 (PST)
Message-ID: <68f6f309-3a8b-de63-14fd-7d14f94015cb@linaro.org>
Date:   Fri, 3 Feb 2023 18:51:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm8450: Add IMEM and PIL info
 region
To:     Mukesh Ojha <quic_mojha@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1675443891-31709-1-git-send-email-quic_mojha@quicinc.com>
 <1675443891-31709-2-git-send-email-quic_mojha@quicinc.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1675443891-31709-2-git-send-email-quic_mojha@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 03/02/2023 18:04, Mukesh Ojha wrote:
> Add a simple-mfd representing IMEM on SM8450 and define the PIL
> relocation info region, so that post mortem tools will be able
> to locate the loaded remoteprocs.
> 
> Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8450.dtsi | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> index 5704750..474ea1b 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> @@ -3536,6 +3536,21 @@
>  			};
>  		};
>  
> +		sram@146aa000 {

I don't think it's correct location - sorted.

> +			compatible = "qcom,sm8450-imem", "syscon", "simple-mfd";
> +			reg = <0 0x146aa000 0 0x1000>;
> +
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +
> +			ranges = <0 0 0x146aa000 0x1000>;

Put ranges after reg.


Best regards,
Krzysztof

