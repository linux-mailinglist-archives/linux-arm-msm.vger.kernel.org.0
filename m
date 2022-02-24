Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7CF704C3610
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Feb 2022 20:44:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233993AbiBXTol (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Feb 2022 14:44:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233076AbiBXToh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Feb 2022 14:44:37 -0500
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A69C1C9452
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Feb 2022 11:44:06 -0800 (PST)
Received: by mail-oi1-x236.google.com with SMTP id l25so4477337oic.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Feb 2022 11:44:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6UcRxp9kACZzHXhxXXBrsGjD5/thuvHHqLsrvWRzW00=;
        b=PFItRgf8j7HlA6HdmRScXwKPDVRfwrJ36SO6Y5iraV/GbbXg6KIjYbQ6PJ2NmojuRE
         qRe/6NNxoZJZkG32eaoXaJ4bo4o1pKwEr1bNLMc+GDs15oVKvHhnHmqZY1EFqO3eVmVk
         ZYarZsHNQ2bhMM7InZ8YeoJRUsf2macfGXo5q/ddJnkxou2zmlWyXeVg1RsaSh1NiI5w
         dC8I+vMQz1ne4JrMWZAffB1QQYNF7+omLeHdccmzgRc41qHOk9zoLNSTGYxYwmp95rse
         7q+k+Gcs4qnfIThFZ42fS2R34fjd6AMJVoczHtc7/NAr0Hde1thEopz9nHRW8Ojt+gEB
         WfYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6UcRxp9kACZzHXhxXXBrsGjD5/thuvHHqLsrvWRzW00=;
        b=oD2WKkKGW21qkGcVtJIbgI6b3Xx1TVeCHVLOMGXhagPM4fvBTbcUjYxTBckS2k7PjO
         Bv44y416uc7WyJ13pVtCpIjgPMaVD53EqtJIky+fIoguS3tNRy5Svnoegx3FQjUZ9gTV
         z5wJJ+519ySy1Pm/GuGg6XkbyJdHyjiT/9sLtYUWwv+I4yRiMdAGuxlpxL7S7tuBWqRW
         88xREoXWcwgb1GFQwapo6WWE6KWfzfk3BRMia8kU3di2gM1LAVVNnjMfj92BES442LZY
         MY61wa/NvgFzIpPQGeSKX4qh88G8HrJqn2mz4rwiAXcTkTmvkvqk8IzUM6lxzN1QLpO8
         vYNA==
X-Gm-Message-State: AOAM530mTntL5h3bhtLRcKXErSkcGT+UU9dZLHrA9g0s96bAxLSdwoqc
        7vNgzh2OL34sdYP3vxEjFbK03A==
X-Google-Smtp-Source: ABdhPJzJZxAk+ZQGlBdXsfRylXvvpesnKNFw1w9vNrvRvXXh73PSKeSctBeyKlfNVy+CtA+slIMWfA==
X-Received: by 2002:a05:6808:1aa9:b0:2d4:958a:ec5a with SMTP id bm41-20020a0568081aa900b002d4958aec5amr2220715oib.275.1645731843125;
        Thu, 24 Feb 2022 11:44:03 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id o22-20020a0568080bd600b002d49b19bc2fsm253363oik.23.2022.02.24.11.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Feb 2022 11:44:02 -0800 (PST)
Date:   Thu, 24 Feb 2022 13:44:00 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rohit Agarwal <quic_rohiagar@quicinc.com>
Cc:     agross@kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: qcom: Add chosen node information for SDX65.
Message-ID: <YhfgAL8z6rO+zU3w@builder.lan>
References: <1644574845-23248-1-git-send-email-quic_rohiagar@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1644574845-23248-1-git-send-email-quic_rohiagar@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 11 Feb 04:20 CST 2022, Rohit Agarwal wrote:

> Add chosen node in the base dtsi file of SDX65.
> 

While this happens to be the same on most boards, it is still a
board-specific decision which UART is the debug uart, or if there is one
at all...

So this property should remain in the dts.

Thanks,
Bjorn

> Signed-off-by: Rohit Agarwal <quic_rohiagar@quicinc.com>
> ---
>  arch/arm/boot/dts/qcom-sdx65-mtp.dts | 4 ----
>  arch/arm/boot/dts/qcom-sdx65.dtsi    | 4 ++++
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/qcom-sdx65-mtp.dts b/arch/arm/boot/dts/qcom-sdx65-mtp.dts
> index 59457da..3a75c21 100644
> --- a/arch/arm/boot/dts/qcom-sdx65-mtp.dts
> +++ b/arch/arm/boot/dts/qcom-sdx65-mtp.dts
> @@ -14,10 +14,6 @@
>  	aliases {
>  		serial0 = &blsp1_uart3;
>  	};
> -
> -	chosen {
> -		stdout-path = "serial0:115200n8";
> -	};
>  };
>  
>  &blsp1_uart3 {
> diff --git a/arch/arm/boot/dts/qcom-sdx65.dtsi b/arch/arm/boot/dts/qcom-sdx65.dtsi
> index 796641d..653df15 100644
> --- a/arch/arm/boot/dts/qcom-sdx65.dtsi
> +++ b/arch/arm/boot/dts/qcom-sdx65.dtsi
> @@ -17,6 +17,10 @@
>  	qcom,msm-id = <458 0x10000>, <483 0x10000>, <509 0x10000>;
>  	interrupt-parent = <&intc>;
>  
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
>  	memory {
>  		device_type = "memory";
>  		reg = <0 0>;
> -- 
> 2.7.4
> 
