Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E93624D594D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Mar 2022 04:54:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345771AbiCKDzH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Mar 2022 22:55:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236527AbiCKDzH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Mar 2022 22:55:07 -0500
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com [IPv6:2607:f8b0:4864:20::c34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F00B18FAE5
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Mar 2022 19:54:04 -0800 (PST)
Received: by mail-oo1-xc34.google.com with SMTP id 6-20020a4a0906000000b0031d7eb98d31so9234466ooa.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Mar 2022 19:54:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=sZfHvkJKS8yaHN8WYfqJ8pOq4+GXhz/qEgdhfNSZgv8=;
        b=aLaPHpvNyMznOcG5oNJBuMxmVHIoRSaUoXA89DDdjr8P1y9SK+/3WYQo8rhP4YtxUB
         tQlyaD2sSjQ8PDznA6dUnLfUr0BX1rwfEFmdZn/eXb30R6ghq3d7ljxNOX6ppKgtlCld
         6jus8xLKu4kaFsdPwgdsrabiPJvKf9qUwkkb1noPU2ajzR08nxleacxV6t68FJfALOnu
         mPj05vYXUX7+G4RcTsqN47r2JK+2ie2yg43gv6hWrTdIY04QS53afjbdrUZ0v50/rwEA
         F7ZG/l8joqToOC1I5Y00aSRvq/5GnjkLJQptK/hSS7vH9g0XsrUWfN/Uzhu917CmRLBJ
         TfRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=sZfHvkJKS8yaHN8WYfqJ8pOq4+GXhz/qEgdhfNSZgv8=;
        b=c2YkJUk6eWzYJ3EyU5nS9SiGd3qWyLntYjPegRDkvI0fJMpArCIt267Q2EV9S5VcE5
         lYG5tgSyxGPP4Vu6LSHRHk3L6d62k706aFgheTdCZrVF//rY9D4fn/LyEFoZ+XaSGJZs
         Fq99hBSwP4rU5kgaGnefKuk5EDiTu1iNAEWdjr77X7FuelE2nHJSbeYVh50QzgH95hRY
         6oj5BdS1fQ/cBXvHhJQe0MEQY1VYxjUMVO9GT6KUTLzZ76bnWOwL9twcr+DQiWJN/uGJ
         XBT+MveK/6A9CqflHjo8RH+9ATr7AiVequtvAlsiGS3vFsIbOEpcWiaxZd3l3K9ECJ6i
         /VLA==
X-Gm-Message-State: AOAM532hTMMuBwsMAUXPSjAWREtfh9rcwF/Q7QAz/44Ip1737J1bQqPs
        P8FHvXQVt/qsTJcFy3fTMLE6UQ==
X-Google-Smtp-Source: ABdhPJxRbXUuC1D2tO1Q3R2NddgYYD1/BgTSRkCtqLU52Nw8td9E5ZesoOy8gtYZoFPkrwTJc+TKrQ==
X-Received: by 2002:a05:6870:559f:b0:da:b3f:320d with SMTP id n31-20020a056870559f00b000da0b3f320dmr4606119oao.189.1646970841846;
        Thu, 10 Mar 2022 19:54:01 -0800 (PST)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id l7-20020acabb07000000b002da34f9ffc3sm3312505oif.37.2022.03.10.19.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Mar 2022 19:54:01 -0800 (PST)
Date:   Thu, 10 Mar 2022 19:55:41 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Shaik Sajida Bhanu <quic_c_sbhanu@quicinc.com>
Cc:     krzk+dt@kernel.org, agross@kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_asutoshd@quicinc.com,
        quic_rampraka@quicinc.com, quic_pragalla@quicinc.com,
        quic_sartgarg@quicinc.com, quic_nitirawa@quicinc.com,
        quic_sayalil@quicinc.com
Subject: Re: [PATCH V2] arm64: dts: qcom: sc7280: Enable gcc HW reset
Message-ID: <YirIPRvcSSYhxiNv@ripper>
References: <1646923503-28847-1-git-send-email-quic_c_sbhanu@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1646923503-28847-1-git-send-email-quic_c_sbhanu@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 10 Mar 06:45 PST 2022, Shaik Sajida Bhanu wrote:

Without looking at what Krzysztof suggested, I think $subject should
reflect the fact that it's the reset of the two SDCC controllers that
you're adding.

Something like "arm64: dts:qcom: Add resets for SDCC controllers" would allow me to grasp the full
purpose of the patch by only reading the subject.

> Enable gcc HW reset for eMMC and SD card.
> 
> Signed-off-by: Shaik Sajida Bhanu <quic_c_sbhanu@quicinc.com>
> ---
> 
> Changes since V1:
> 	- Updated commit message, subject and comments in dtsi file as
> 	  suggested by Krzysztof Kozlowski.
> ---
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index c07765d..721abf5 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -881,6 +881,9 @@
>  			mmc-hs400-1_8v;
>  			mmc-hs400-enhanced-strobe;
>  
> +			/* Add gcc hw reset dt entry for eMMC */

When you read this comment 2 weeks from now it won't add any value.

> +			resets = <&gcc GCC_SDCC1_BCR>;
> +			reset-names = "core_reset";

Doesn't seem that this binding has been converted to YAML, but the .txt
binding doesn't mention "resets" and I don't see a reason for having a
reset-names for a single reset.

And please keep the empty line before the opp-table.

Regards,
Bjorn

>  			sdhc1_opp_table: opp-table {
>  				compatible = "operating-points-v2";
>  
> @@ -2686,6 +2689,9 @@
>  
>  			qcom,dll-config = <0x0007642c>;
>  
> +			/* Add gcc hw reset dt entry for SD card */
> +			resets = <&gcc GCC_SDCC2_BCR>;
> +			reset-names = "core_reset";
>  			sdhc2_opp_table: opp-table {
>  				compatible = "operating-points-v2";
>  
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
> of Code Aurora Forum, hosted by The Linux Foundation
> 
