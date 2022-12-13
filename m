Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E13B864B575
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Dec 2022 13:51:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234956AbiLMMvP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Dec 2022 07:51:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234027AbiLMMvO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Dec 2022 07:51:14 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 527741AA2E
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Dec 2022 04:51:13 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id g7so4730175lfv.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Dec 2022 04:51:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eOxjDrTHxpSWumKUdsc7nE4CcukLk4b683+Xlv43EZM=;
        b=ugKRlDhG3kWpQVGWkk90fS0D0RGWt2TEmmj+urzJNWRc0XDEz4PoxPp6MopG3bwbok
         WQ1o28m+dbI79ZgFq/wBhKEA5dOGeABoIaDjH4kEPjxSky6RYqd3qkQF5GgHcvG3Q4+U
         dMudw4WsIFhyX9M3JiexFIW4Lc1825fCkKFuulV4m7qqiKDt1EuuqtpzIYJy3LbbS31j
         l1JRsIPmGDIzuamJqlutVQ4xSnmNccI5Xz1Wgc4ctLjsPZTr6B/Ps/cm39nc2HP7iWxL
         kLtqN0axfbvqI0GpHYKrnEteGLdbs2vVi9ojrE2dCY6NSoA2wj3xgIAN7WjBXZCRbXZF
         oS1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eOxjDrTHxpSWumKUdsc7nE4CcukLk4b683+Xlv43EZM=;
        b=Z2sxXYxfitaGWn4ID/h4W6eLJGKtNjVEWqvo2DKPY4/N2BG78KaqiBTtCqkvXnuuAH
         iZ4D+kse7114F5g9lV8rHrAvc/0rnJFmQCaZiyoSBj5W0IO2J4zXR/gEC9NnrEec+Qg5
         jnSR35LljdRHX9VxH3t22HXzhwmsr7u0qH/6y3tpOVxma8koh44/SN8Z+Te86E3TqFfm
         WlMW1FT4JgsAOXhiwLJJaD5MaZAjna3ilUqrOiY/YlIvy/uOX2O0DPNqPBHtNMaKy7hB
         ecqMUUj/mh2qGiB3R6gxG9ZsqKp7/awuqVgPd5o+60iTtnepd3DOas8OsySr5GcPYhQC
         nMIg==
X-Gm-Message-State: ANoB5pldgiS3fpiqPUAy6UOKQwn7Kp+aXVlPtLHjqTKgck3nAes6YUIk
        +SlMOiRaISPNI2B0aMS6T76RXQ==
X-Google-Smtp-Source: AA0mqf4Ba82TJ0eerrezZlwQ1/ehmzzqB7vA8mCwmd6GKbCo1awVPmXLvc9jn8eKasilrr81MsTrmw==
X-Received: by 2002:a05:6512:1021:b0:4a4:7031:2300 with SMTP id r1-20020a056512102100b004a470312300mr4915161lfr.43.1670935871698;
        Tue, 13 Dec 2022 04:51:11 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id o17-20020ac25b91000000b00497a0ea92desm356690lfn.135.2022.12.13.04.51.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Dec 2022 04:51:11 -0800 (PST)
Message-ID: <0152d45d-75ed-db44-69b2-d7736600f120@linaro.org>
Date:   Tue, 13 Dec 2022 13:51:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 1/3] arm64: dts: qcom: sm6115: Cleanup USB node names
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     agross@kernel.org, bhupesh.linux@gmail.com,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org,
        konrad.dybcio@linaro.org, andersson@kernel.org
References: <20221213123823.455731-1-bhupesh.sharma@linaro.org>
 <20221213123823.455731-2-bhupesh.sharma@linaro.org>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221213123823.455731-2-bhupesh.sharma@linaro.org>
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

On 13/12/2022 13:38, Bhupesh Sharma wrote:
> There is only one USB controller present on SM6115 / SM4250
> Qualcomm SoC, so drop the numbering used with USB nodes

The node names remain unaffected, so please mention you do it only for
the labels. Labels do not matter for the code, has no impact.

> in the dtsi and the related sm4250-oneplus-billie2.dts.
> 
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm4250-oneplus-billie2.dts | 4 ++--
>  arch/arm64/boot/dts/qcom/sm6115.dtsi                | 8 ++++----
>  2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm4250-oneplus-billie2.dts b/arch/arm64/boot/dts/qcom/sm4250-oneplus-billie2.dts
> index a3f1c7c41fd73..fa57f4bf58256 100644
> --- a/arch/arm64/boot/dts/qcom/sm4250-oneplus-billie2.dts
> +++ b/arch/arm64/boot/dts/qcom/sm4250-oneplus-billie2.dts
> @@ -225,11 +225,11 @@ &ufs_mem_phy {
>  	status = "okay";
>  };
>  
> -&usb_1 {
> +&usb {
>  	status = "okay";
>  };

Best regards,
Krzysztof

