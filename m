Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9EA2461EFCC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Nov 2022 10:59:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231840AbiKGJ7J (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Nov 2022 04:59:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231858AbiKGJ7G (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Nov 2022 04:59:06 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDAFF12D09
        for <linux-arm-msm@vger.kernel.org>; Mon,  7 Nov 2022 01:59:05 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id a13so16720576edj.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Nov 2022 01:59:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K8of/oAJws/QSmCAC0YWn8g/hdNuzur7wOUoaPRB20w=;
        b=UVhVoV7mKmkz8e0NlclJKabTSUP5kNNkY7uGxKCwBhSIoycEa6zV8x5E1jfjvU3oGe
         8z1ctzbBtjhiW4Vni8KiTdyJxPWlBHbSCF3SP2H0kpt/Q3xLgRfasCZkcPTBMSMZgeZ7
         Odn51ehQ3cm+/ozEkKQH8LL0/iV95ghZ4TswA6eCNhOVNICTQ+KrBwNQUSYnmaRnM1FA
         0jZZa36OQKgu2A1Y5nW/MkqPNi1fMFkYiRWcnXJgbD8AF6bVhtrjJKFrWgN1RXWPib+W
         rp5PSL/mUjURrOGGUmnXADj3DfNrOE1kU3lu6k4I6658yHYBYHY5QS3JvCRNM3hDykFE
         ELqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K8of/oAJws/QSmCAC0YWn8g/hdNuzur7wOUoaPRB20w=;
        b=QXJ1qkJj+nXksFtMnReZM58zKSyJLJ2SWUtu2+PsUVwDdjhcn2imS8ObqyPCfGUGax
         yGTuIpPGtyDst9yaLt7+F4jcYc0rjMdgBfhDElHem4CRWLTwB3XGQGUgNYPNoIkeBqR/
         5/JRUkPQzDyRC0N+cbS61Dvykyu5aNRlfVurWujMrMNDq+jTZXoAY3HODtfO+yIf7EGB
         jv27rFgnbhvsIswuLa3skx30ZYFpRqiSY4OLv8jrxCzIbHSA1btCKIU0TB/WECAOh7kz
         p6NgSUMoJ/KvwEv9JID2QbeODqGzD6I+LmSCqN4zKapeCxj69jobsGmSFUuhZY3Str77
         9mIA==
X-Gm-Message-State: ACrzQf2ujuK9WnVfLUj/OetkWzLX8QzUsAQeav3HYa82f17t6CIkrS/K
        XWDw2RwgNmTAJGSb+Y5OvTcA3Q==
X-Google-Smtp-Source: AMsMyM4ZTb8SnvvFaMldWp9JMNkf3rSQ7nxgOA+HkaqOtlKvbAhk3k+5d3Qg+q+Qi/p7gBCQgZ6O6Q==
X-Received: by 2002:aa7:c0cf:0:b0:463:8ba0:522f with SMTP id j15-20020aa7c0cf000000b004638ba0522fmr38275764edp.176.1667815144446;
        Mon, 07 Nov 2022 01:59:04 -0800 (PST)
Received: from [192.168.31.208] ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id vl2-20020a170907b60200b0078d0981516esm3153470ejc.38.2022.11.07.01.59.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Nov 2022 01:59:04 -0800 (PST)
Message-ID: <f3239a2d-9aa0-8ed3-f0a7-af9243fa7168@linaro.org>
Date:   Mon, 7 Nov 2022 10:58:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH 3/3] arm64: dts: qcom: hk01: use GPIO flags for tlmm
To:     Robert Marko <robimarko@gmail.com>, agross@kernel.org,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221107092930.33325-1-robimarko@gmail.com>
 <20221107092930.33325-3-robimarko@gmail.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221107092930.33325-3-robimarko@gmail.com>
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
>   arch/arm64/boot/dts/qcom/ipq8074-hk01.dts | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq8074-hk01.dts b/arch/arm64/boot/dts/qcom/ipq8074-hk01.dts
> index b60b2d4c2ea5..c3f3f78271e9 100644
> --- a/arch/arm64/boot/dts/qcom/ipq8074-hk01.dts
> +++ b/arch/arm64/boot/dts/qcom/ipq8074-hk01.dts
> @@ -4,6 +4,7 @@
>    */
>   #include "ipq8074.dtsi"
>   #include "pmp8074.dtsi"
> +#include <dt-bindings/gpio/gpio.h>
>   
>   / {
>   	model = "Qualcomm Technologies, Inc. IPQ8074-HK01";
> @@ -52,12 +53,12 @@ &blsp1_uart5 {
>   
>   &pcie0 {
>   	status = "okay";
> -	perst-gpios = <&tlmm 61 0x1>;
> +	perst-gpios = <&tlmm 61 GPIO_ACTIVE_LOW>;
>   };
>   
>   &pcie1 {
>   	status = "okay";
> -	perst-gpios = <&tlmm 58 0x1>;
> +	perst-gpios = <&tlmm 58 GPIO_ACTIVE_LOW>;
>   };
>   
>   &pcie_phy0 {
