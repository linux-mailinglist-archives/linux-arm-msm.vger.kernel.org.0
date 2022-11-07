Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F9F561EFC9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Nov 2022 10:58:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231807AbiKGJ6m (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Nov 2022 04:58:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231806AbiKGJ6k (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Nov 2022 04:58:40 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C4C264D2
        for <linux-arm-msm@vger.kernel.org>; Mon,  7 Nov 2022 01:58:37 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id 21so16685815edv.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Nov 2022 01:58:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YSbyaSH9rlmVEUhLx8jjHu624J6OwA+8MCp7bQgR+dw=;
        b=SKOLpX7bP5jtGQZ2Did/+xgW/K8y6/pStx4Ks8o61G0IQXe5b4zlrUNFhYDRVMJqN0
         Iab630QCeMTgi2jbiq2K3mQXbZv5QH+zvzzaVdlgrz5Jo8o258b5v+knBDjsSwIp+jiL
         kFU+MZc3eYh0QVcamZHbcWRzvXDBMguoCRDLha+uFPGF9iFwARS2j4PFJk7zBKlGPejo
         lncEQgqJFvYX2c95vIuH9T5ZBAS9OzF7iApToFCp168oyooM2qj1LKdthk+0svKgzDv/
         lASFu+TUa+MOvyIPGow//vra9sVTX9eg1AsIhtmcjDSfW2am1eneJbNtW9OGPIBqUzGd
         RbnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YSbyaSH9rlmVEUhLx8jjHu624J6OwA+8MCp7bQgR+dw=;
        b=y6EYsp+zrEvTlkZ5/ve5++BXDtsPbW5QZ85sHFnJ9L4ubw4FWh5VDDqoL7bnkIEVq4
         g8XXNIn774P81OB/fcwh97KdHEszZ6JQrUcGWlRVDpWno0mwJKTrP/jgJX93INnTEBIz
         3wQSvcI5H3MTImGJGzUQnaVtPvZW0rL6xwxZyY0QWIMjuV7fsFgMAqzVyWbAdSaBauut
         Uoyp5pa3WqMF3jetpeMVw9r2Ot/Bs9TTxb+MjF/1yuKEF2XRdbHWZfQiGNgv4pDemS7Q
         7Sey2rKTbQkZt/7cLrZOD/lxpuld4SCCx50J1z/MQDeA82uJjyTb2o3lNz1bN5Y6dcXZ
         iQdg==
X-Gm-Message-State: ACrzQf2QrjBwXHZFW/jhN9ORxuOzdHlPnGPQjXv8QXuecKQAL8HxGe96
        P1Vzd5W59qx3Vv7ieAwNCQ9zyQ==
X-Google-Smtp-Source: AMsMyM7VVyZh2L71ej6mSQYv8BfRo5Cn5yb+3cebZieVD4w+w1z1qj8OBxsgmHLkS/RrAv1PdTiTRA==
X-Received: by 2002:a05:6402:7c4:b0:462:9bc2:d0d0 with SMTP id u4-20020a05640207c400b004629bc2d0d0mr50231226edy.122.1667815115950;
        Mon, 07 Nov 2022 01:58:35 -0800 (PST)
Received: from [192.168.31.208] ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id 21-20020a170906329500b00782ee6b34f2sm3118457ejw.183.2022.11.07.01.58.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Nov 2022 01:58:35 -0800 (PST)
Message-ID: <9995283f-d367-dbab-65eb-b4eedfae1dd4@linaro.org>
Date:   Mon, 7 Nov 2022 10:58:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH 2/3] arm64: dts: qcom: hk10: use GPIO flags for tlmm
To:     Robert Marko <robimarko@gmail.com>, agross@kernel.org,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221107092930.33325-1-robimarko@gmail.com>
 <20221107092930.33325-2-robimarko@gmail.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221107092930.33325-2-robimarko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 07/11/2022 10:29, Robert Marko wrote:
> Use respective GPIO_ACTIVE_LOW/HIGH flags for tlmm GPIOs instead of
> harcoding the cell value.
> 
> Signed-off-by: Robert Marko <robimarko@gmail.com>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>   arch/arm64/boot/dts/qcom/ipq8074-hk10.dtsi | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq8074-hk10.dtsi b/arch/arm64/boot/dts/qcom/ipq8074-hk10.dtsi
> index 262b937e0bc6..651a231554e0 100644
> --- a/arch/arm64/boot/dts/qcom/ipq8074-hk10.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq8074-hk10.dtsi
> @@ -5,6 +5,7 @@
>   /dts-v1/;
>   
>   #include "ipq8074.dtsi"
> +#include <dt-bindings/gpio/gpio.h>
>   
>   / {
>   	aliases {
> @@ -39,12 +40,12 @@ &blsp1_uart5 {
>   
>   &pcie0 {
>   	status = "okay";
> -	perst-gpios = <&tlmm 58 0x1>;
> +	perst-gpios = <&tlmm 58 GPIO_ACTIVE_LOW>;
>   };
>   
>   &pcie1 {
>   	status = "okay";
> -	perst-gpios = <&tlmm 61 0x1>;
> +	perst-gpios = <&tlmm 61 GPIO_ACTIVE_LOW>;
>   };
>   
>   &pcie_phy0 {
