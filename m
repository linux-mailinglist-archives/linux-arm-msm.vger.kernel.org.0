Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 073365B4507
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Sep 2022 09:56:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229563AbiIJH4Z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 10 Sep 2022 03:56:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229604AbiIJH4B (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 10 Sep 2022 03:56:01 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 222FC7A748
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Sep 2022 00:55:44 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id m15so6496467lfl.9
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Sep 2022 00:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=o4+g0Ul+yFX57gPNano/g2N/s9ygDtFMVwdxjvOVlNA=;
        b=vmjDjbDdeU1WeSoAmbfiDJmklhgmoq9clNnmnpKRsnBqi9DkgxLALP5w3MYOKqOpjV
         1PX8hhLVfoJgukQqz8JHUgqfN7c6s1Mx8++12QAnSrWN84RpjJTaKXVWIKFPnX/5Ls+6
         DF7T9vNvo5+oIDB1cfsJMP7NKzW+JpBOh0r2rZ5lXJeXLo67QnXZtYyR/6wiySTbyVnm
         NidRAKMqK8IgRMkndiyBrtLG0icFVv3mbc42HoRY0yDjow8TlWvhDxldo5nE0wwbiYpS
         O2iIBVIgoBBS8DtBSZHCB8tRWNfSwJgcKi1p6O5+7arZMDOvs4A9AeSsGE+0JgzM0Y/p
         zFUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=o4+g0Ul+yFX57gPNano/g2N/s9ygDtFMVwdxjvOVlNA=;
        b=FVMHlhd6J/GbDWamibXuRc0Y5Qo3o4gDQ5RW4hXJPNobxLD5T+dzMp16d57izVeWBt
         fyxaA5nukiw1ka4x99mPctVfLKmkTbGWzDF5VgXi0FmofUV77EhtS72P8i/CBP2toNfj
         1bdQiIsTjASx+aMFijMLupx1P0V4IAfUoJGXhdkAF+XYgfZUrsYlzFqM1g2gRoFbdWBE
         7qjEW1ImwDvXJ1d0yiNjHC5srshdVxXP8gOI7JcBknYOL/lle3l31S6fFh1WcXEyMjWn
         /ZdPMb6wZf+cNSqJ+Y/AFd8fCOwVSBAWJNUPv/6hAFVqHUBNKXrY4L5ZBqTN/kCA2RMa
         ziMw==
X-Gm-Message-State: ACgBeo0oHNNO6E7O2o7mQizSZd+A5v1R4dlKqGU2/qExxVjS2dfTFs5v
        u9QygudhE7u+50ZDqg+PV1qUXg==
X-Google-Smtp-Source: AA6agR4eYBA0iP5KyprNbJzTbVW03ddcyPH8ru0SARVWRgoqV8fA8VINJsCuGlbd97QRZ67MirwvFA==
X-Received: by 2002:a05:6512:6cc:b0:48d:acaa:8a66 with SMTP id u12-20020a05651206cc00b0048dacaa8a66mr6106715lff.272.1662796542780;
        Sat, 10 Sep 2022 00:55:42 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id s28-20020a195e1c000000b004979da67114sm170255lfb.255.2022.09.10.00.55.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Sep 2022 00:55:42 -0700 (PDT)
Message-ID: <d47aa92f-d8fa-24fd-653b-aa01c3f7c040@linaro.org>
Date:   Sat, 10 Sep 2022 09:55:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 1/1] ASoC: dt-bindings: Mark old binding
 qcom,cpu-lpass-apq8016 as deprecated
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, agross@kernel.org,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220910014206.1101962-1-bryan.odonoghue@linaro.org>
 <20220910014206.1101962-2-bryan.odonoghue@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220910014206.1101962-2-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/09/2022 03:42, Bryan O'Donoghue wrote:
> We've had some discongruity in the compatible string of the lpass for 8916
> for a while.
> 
> Mark the old compat as deprecated. New SoC additions such as msm8936 and
> msm8939 should use the compat string "qcom,apq8016-lpass-cpu".
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../devicetree/bindings/sound/qcom,lpass-cpu.yaml   | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
> index ef18a572a1ff3..e2c0f573a3084 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
> @@ -18,11 +18,14 @@ description: |
>  
>  properties:
>    compatible:
> -    enum:
> -      - qcom,lpass-cpu
> -      - qcom,apq8016-lpass-cpu
> -      - qcom,sc7180-lpass-cpu
> -      - qcom,sc7280-lpass-cpu
> +    oneOf:
> +      - enum:
> +        - qcom,lpass-cpu
> +        - qcom,apq8016-lpass-cpu

The indentation looks odd here. Are you sure it passes the `make
dt_binding_check`?


Best regards,
Krzysztof
