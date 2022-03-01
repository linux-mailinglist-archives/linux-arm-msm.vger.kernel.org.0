Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6FACE4C8204
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Mar 2022 05:11:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232199AbiCAEMe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Feb 2022 23:12:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232221AbiCAEMe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Feb 2022 23:12:34 -0500
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4911259390
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Feb 2022 20:11:54 -0800 (PST)
Received: by mail-pf1-x434.google.com with SMTP id t5so3964491pfg.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Feb 2022 20:11:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ow+x/A02/p6wuhxlMKjVF6tagFa+f42YnShr2G/XUGE=;
        b=XAGgI92Vz0aYAS+wtIPI0bam6zx4Ppv4RucLqApTLTuBp70WUnJ4JC6eogliNV5N/X
         OA3rzgKJrRwN4lc3jfuHChOi/O9nibbF8Ox3fDl1mWaGbRXIZuDebMyYt4B6NzJO+3PA
         FOgJ25trZ8+JmmyfMo2S8qC6rHKH0GJU5rQMQK4CNHiEj0iEq3gRrJenKzK0Db+q8O9C
         bvnIUUjxav2osj6EVLAIDBHzs6ClEBFZv9i1lGAToLOIf4SiiVSg9sRE+W6jP0kMQrLx
         rBOAkbZbkgQmQr7zl7zP6nkAdH3520cq7vcsLH4kd6r0dRt442CSGZUwbqeYfBRL+9YW
         JR0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ow+x/A02/p6wuhxlMKjVF6tagFa+f42YnShr2G/XUGE=;
        b=PujJV38yltt2H/3erpDEbKZyzH+cKUMx4deohTzo02ZEKAa1OYe5dQkirQ67jKoP7b
         fSY1OzQKVQYTGv/Xng9Al5lGntzgivJgn4Zkgkx5lj3k7q7GDs+yyh4nYBqfHvxIISjI
         IAiSzwQrMdj5Yoc0SLlxMpt0h/Rr+jKzs00nVvo4ppweB57oqCXpm05vqaEPTOq/wEs6
         jyP8WIxPSsj6Uk3KWAVz7spa+sr2H5NwnHshIibsW2XDWNiHKO5FwqrlxOpXf45+AdXZ
         ImAJ15Eym/3G9jkC/fG2K9GZTJWu4vYHmezDtNR+2Jnpl8Wszk2wTbUt9pu2aJ4dv29k
         gcOQ==
X-Gm-Message-State: AOAM53016N7twf0Tc2H67HSIdoLOxexd7EH/IBOSJmAW3YKg0rxYI/VD
        2BoRART6x5S+OU/GwDRaxsI49Q==
X-Google-Smtp-Source: ABdhPJxKMbY2StYAlC6eIjI0FC7YY4N2VGA4FpyTazwS6B6sBlH9cQSMhhoZRsUHz4J6ZoiLvnEiTA==
X-Received: by 2002:a65:4cc4:0:b0:373:d441:f999 with SMTP id n4-20020a654cc4000000b00373d441f999mr19908063pgt.387.1646107913781;
        Mon, 28 Feb 2022 20:11:53 -0800 (PST)
Received: from dragon (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id z23-20020aa79597000000b004e1bf2f5818sm15915098pfj.87.2022.02.28.20.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 20:11:53 -0800 (PST)
Date:   Tue, 1 Mar 2022 12:11:47 +0800
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, bhupesh.linux@gmail.com,
        agross@kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, vkoul@kernel.org,
        linux-phy@lists.infradead.org, robh+dt@kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 6/8] arm64: dts: qcom: ipq6018: Fix qmp usb3 phy node
Message-ID: <20220301041147.GI269879@dragon>
References: <20220228123019.382037-1-bhupesh.sharma@linaro.org>
 <20220228123019.382037-7-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220228123019.382037-7-bhupesh.sharma@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Feb 28, 2022 at 06:00:17PM +0530, Bhupesh Sharma wrote:
> Fix the following 'make dtbs_check' warning(s) by
> using phy@ instead of lanes@ and by moving '#clock-names' to

s/clock-names/clock-cells

> sub-node:
> 
> arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dt.yaml: ssphy@78000:
>  'lane@78200' does not match any of the regexes: '^phy@[0-9a-f]+$', 'pinctrl-[0-9]+'
> 
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Rob Herring <robh@kernel.org>
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>

Other than that:

Reviewed-by: Shawn Guo <shawn.guo@linaro.org>

> ---
>  arch/arm64/boot/dts/qcom/ipq6018.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
> index 66ec5615651d..ad7914e49532 100644
> --- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
> @@ -674,7 +674,6 @@ ssphy_0: ssphy@78000 {
>  			reg = <0x0 0x78000 0x0 0x1C4>;
>  			#address-cells = <2>;
>  			#size-cells = <2>;
> -			#clock-cells = <1>;
>  			ranges;
>  
>  			clocks = <&gcc GCC_USB0_AUX_CLK>,
> @@ -686,12 +685,13 @@ ssphy_0: ssphy@78000 {
>  			reset-names = "phy","common";
>  			status = "disabled";
>  
> -			usb0_ssphy: lane@78200 {
> +			usb0_ssphy: phy@78200 {
>  				reg = <0x0 0x00078200 0x0 0x130>, /* Tx */
>  				      <0x0 0x00078400 0x0 0x200>, /* Rx */
>  				      <0x0 0x00078800 0x0 0x1F8>, /* PCS */
>  				      <0x0 0x00078600 0x0 0x044>; /* PCS misc */
>  				#phy-cells = <0>;
> +				#clock-cells = <1>;
>  				clocks = <&gcc GCC_USB0_PIPE_CLK>;
>  				clock-names = "pipe0";
>  				clock-output-names = "gcc_usb0_pipe_clk_src";
> -- 
> 2.35.1
> 
