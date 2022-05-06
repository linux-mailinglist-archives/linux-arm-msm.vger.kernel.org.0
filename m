Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE7D451CF4B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 May 2022 05:16:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1388480AbiEFDU0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 May 2022 23:20:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1388476AbiEFDUZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 May 2022 23:20:25 -0400
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAF0C1A833
        for <linux-arm-msm@vger.kernel.org>; Thu,  5 May 2022 20:16:43 -0700 (PDT)
Received: by mail-oi1-x233.google.com with SMTP id l16so6314268oil.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 May 2022 20:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=XDAab3lFiT4oWPvDdIok5sqYK5jSVOc29GloIg/CLzs=;
        b=M0srnKgPkJySL8mZ86biFhA5OuOllZTy3Ykf2nF4IdVq0ZwcscLBqGUA2U9AYumHGC
         QgDx8Dj5zZYal/OguV/5ygwsWART5MfMI2creJnrsp7adnbljV7xcHcNb0Eml0GJur8w
         RsSJyeZ+SEp0oSdN37ulcoQbqr6ZnqVdB/5BifgK06CbNLcbO6F5U8qbKi/XHQ0bRAN9
         aa3q5QuIP8Zl0+7zKYErOrsUgpMXI0+Q4+eNJYrIPVthdQ59EbaZ/rCYwUpy1+WOJ/fj
         YeZkTnppN78qT2LhPEpvrOIuaeezbKNaqoYkBJ7MDualrT1EQ5xskORqitfbRofS8yRY
         Z3kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XDAab3lFiT4oWPvDdIok5sqYK5jSVOc29GloIg/CLzs=;
        b=KmURHao8eheIo5tHuvQie8na4z7F/vph0WGK4le+N0FTpvEIVbMVCtd9xlDKOLTihv
         koJm1jsK/Qp/UN6m4dALd9pzItyTtgQ37PY6VZ997mGXGuKVJJ8mvJmAYDEDADQ5zGjI
         0R6P9m7HsH/D4KmYqKErfi0cH6xiMi5muetd5F3LOii4oBPrShw6NQ/mwz+sLOqq9jIj
         gK7Lj6rXy5S7WMQjjaKb0+9SsXJjjT7e0gfmnoCM1Qm8RM9sYCzERs+MaWjdnZ3JVnLa
         eNkqVtNImQqZoP8BpOv566gKR8NU2BFaa6GN2y/27A6S2OzuF9b8WRPoaQOf1odeg5oG
         ONfg==
X-Gm-Message-State: AOAM531tB8yWHzHnUf2bKVgL2waqxxE9V1JIwA8/MJsoqRn0wvtEaknC
        ZDiEUbFmWZnYVa1j5vW70E4bSg==
X-Google-Smtp-Source: ABdhPJyGhZMLU7kovwSB7RSCQTNkWr5ruVjbo0AhP9QogwaAMX2QH+ktw7ZhWEoESJ3wrYu7cDt7ng==
X-Received: by 2002:a05:6808:92:b0:325:bdf6:f824 with SMTP id s18-20020a056808009200b00325bdf6f824mr4089983oic.147.1651807003107;
        Thu, 05 May 2022 20:16:43 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id f97-20020a9d03ea000000b00606387601a2sm1226855otf.34.2022.05.05.20.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 May 2022 20:16:42 -0700 (PDT)
Date:   Thu, 5 May 2022 22:16:37 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, bhupesh.linux@gmail.com,
        linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/3] arm64: dts: qcom: Fix node names for sdhci
 'opp-table' nodes (across dts files)
Message-ID: <YnSTFRuMDFYclHYh@builder.lan>
References: <20220429214420.854335-1-bhupesh.sharma@linaro.org>
 <20220429214420.854335-3-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220429214420.854335-3-bhupesh.sharma@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 29 Apr 16:44 CDT 2022, Bhupesh Sharma wrote:

> Since the Qualcomm sdhci-msm device-tree binding has been converted
> to yaml format, 'make dtbs_check' reports a number of issues with
> node names for sdhci 'opp-table' nodes, as it doesn't seem to like
> any 'preceding text or numbers' before 'opp-table' pattern in the
> node names.
> 
> Fix the same.
> 
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Rob Herring <robh@kernel.org>
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 4 ++--
>  arch/arm64/boot/dts/qcom/sm6350.dtsi | 4 ++--
>  arch/arm64/boot/dts/qcom/sm8150.dtsi | 2 +-
>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 2 +-
>  4 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 86175d257b1e..b6df3186e94c 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -725,7 +725,7 @@ sdhc_1: sdhci@7c4000 {
>  
>  			status = "disabled";
>  
> -			sdhc1_opp_table: sdhc1-opp-table {
> +			sdhc1_opp_table: opp-table-sdhc1 {

There's only a single opp-table child node of &sdhc_1, so I would prefer
that these would just be:

			sdhc1_opp_table: opp-table {

Like  what you did in the sm8150 and sm8250 case below.

Can you please update this accordingly?

Thanks,
Bjorn

>  				compatible = "operating-points-v2";
>  
>  				opp-100000000 {
> @@ -2609,7 +2609,7 @@ sdhc_2: sdhci@8804000 {
>  
>  			status = "disabled";
>  
> -			sdhc2_opp_table: sdhc2-opp-table {
> +			sdhc2_opp_table: opp-table-sdhc2 {
>  				compatible = "operating-points-v2";
>  
>  				opp-100000000 {
> diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
> index fb1a0f662575..87a5d72b2ca0 100644
> --- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
> @@ -497,7 +497,7 @@ sdhc_1: sdhci@7c4000 {
>  
>  			status = "disabled";
>  
> -			sdhc1_opp_table: sdhc1-opp-table {
> +			sdhc1_opp_table: opp-table-sdhc1 {
>  				compatible = "operating-points-v2";
>  
>  				opp-19200000 {
> @@ -941,7 +941,7 @@ sdhc_2: sdhci@8804000 {
>  
>  			status = "disabled";
>  
> -			sdhc2_opp_table: sdhc2-opp-table {
> +			sdhc2_opp_table: opp-table-sdhc2 {
>  				compatible = "operating-points-v2";
>  
>  				opp-100000000 {
> diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> index 2700a8145cb9..e265d61f7c05 100644
> --- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> @@ -3563,7 +3563,7 @@ sdhc_2: sdhci@8804000 {
>  
>  			status = "disabled";
>  
> -			sdhc2_opp_table: sdhc2-opp-table {
> +			sdhc2_opp_table: opp-table {
>  				compatible = "operating-points-v2";
>  
>  				opp-19200000 {
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index dc2562070336..5ca16f76ddeb 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -2937,7 +2937,7 @@ sdhc_2: sdhci@8804000 {
>  
>  			status = "disabled";
>  
> -			sdhc2_opp_table: sdhc2-opp-table {
> +			sdhc2_opp_table: opp-table {
>  				compatible = "operating-points-v2";
>  
>  				opp-19200000 {
> -- 
> 2.35.1
> 
