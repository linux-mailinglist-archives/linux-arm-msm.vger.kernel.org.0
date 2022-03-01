Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8FA14C81ED
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Mar 2022 05:09:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232184AbiCAEKJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Feb 2022 23:10:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231183AbiCAEKI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Feb 2022 23:10:08 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BADB46B01
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Feb 2022 20:09:28 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id q8-20020a17090a178800b001bc299b8de1so1107232pja.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Feb 2022 20:09:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=quZTQxwk0NWM3WGhGpbLGo6RYtfkEu68zMDB/uBuTfc=;
        b=cK7YVLFPpjgGyo/3YJGvYg2R/sBMDBLA5FPYxDB6p2dUXahXvr0P7Z+seLuA8H53cP
         oGVpnbrjtRzgiKn4mnO4/quWGnyIeR5XM6ow9Zprshnj/1hRwsihS4mZBYcuIPV9xOGq
         ynge0fIXLVcxVSJKGM8PGBS3YhddDzAjzEMTUj3uxjvqvVP0heceYYRGiZuxVhD8bldY
         6xB94qh8EWDMWEsJodalKGJPCGICn0YXVV+LieAS2CYrC0F9CsGcuyuHUd9PQIw89Y8/
         t8t1E9qAkQ/lVbrlNr90dEyPCA4PQRnWGZ7brz4ZX58NVX+fJoRpNiSFD2m40HLqAUGE
         CJrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=quZTQxwk0NWM3WGhGpbLGo6RYtfkEu68zMDB/uBuTfc=;
        b=d4aiCFTdDaYYwqsAAlMCOjjF8NNfXhw1fzYkrpEmF9LT0Ycewq0bZ5WtH14hezRO9v
         ocLLy8DSeTcSXuNnRFKIV4aPM6Zj03TGNJDf9pp0/KZ694f/lc+DuYijSYdPDsYMS4y6
         LItdB6atP+cFVuJ+9nR31AY/vnV0LFjQvYMuG0tNDj5jEqBy8tFxx1b0Ycpr8rXQHQXV
         EsorWN72xq5sEHrPsQpGmhCsHnt4oxTqfsYEBSriGZgi9j4aTO86ZClRjd0vBYDwKKcv
         ZhF4er/oTIiQhn+WMVr6VVb6M+s8ACkrriS7NsjxB/3768Y1s37U1JEIRWFy4vm81MeJ
         sBUA==
X-Gm-Message-State: AOAM533n7xUlppoPwEGlYUMaj7AckTdtaX0Vey3Bmzg/GCgtAEU2O7iy
        K108btM0bXSpaF7RJG1F2rPwWQ==
X-Google-Smtp-Source: ABdhPJz/4cqwvUAT2nHdOOndhoW5R+LBbAj/1KgEzitnkuYcy7PkmLPJVqhm/+2hfL86kD8/WPp1QA==
X-Received: by 2002:a17:90a:ca16:b0:1bc:16a7:e840 with SMTP id x22-20020a17090aca1600b001bc16a7e840mr19857923pjt.225.1646107767936;
        Mon, 28 Feb 2022 20:09:27 -0800 (PST)
Received: from dragon (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id j13-20020a056a00130d00b004f1025a4361sm15252492pfu.202.2022.02.28.20.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 20:09:27 -0800 (PST)
Date:   Tue, 1 Mar 2022 12:09:21 +0800
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, bhupesh.linux@gmail.com,
        agross@kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, vkoul@kernel.org,
        linux-phy@lists.infradead.org, robh+dt@kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 4/8] arm64: dts: qcom: sc7280: Fix qmp phy node (use
 phy@ instead of lanes@)
Message-ID: <20220301040921.GG269879@dragon>
References: <20220228123019.382037-1-bhupesh.sharma@linaro.org>
 <20220228123019.382037-5-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220228123019.382037-5-bhupesh.sharma@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Feb 28, 2022 at 06:00:15PM +0530, Bhupesh Sharma wrote:
> Fix the 'make dtbs_check' warning:
> 
> arch/arm64/boot/dts/qcom/sc7280-idp.dt.yaml: phy@1c0e000:
>   'lanes@1c0e200' does not match any of the regexes: '^phy@[0-9a-f]+$', 'pinctrl-[0-9]+'
> 
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Rob Herring <robh@kernel.org>
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>

Reviewed-by: Shawn Guo <shawn.guo@linaro.org>

> ---
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index 937c2e0e93eb..575f1f00f602 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -1669,7 +1669,7 @@ pcie1_phy: phy@1c0e000 {
>  
>  			status = "disabled";
>  
> -			pcie1_lane: lanes@1c0e200 {
> +			pcie1_lane: phy@1c0e200 {
>  				reg = <0 0x01c0e200 0 0x170>,
>  				      <0 0x01c0e400 0 0x200>,
>  				      <0 0x01c0ea00 0 0x1f0>,
> -- 
> 2.35.1
> 
