Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE77A61F7F8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Nov 2022 16:52:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232289AbiKGPwl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Nov 2022 10:52:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232084AbiKGPwl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Nov 2022 10:52:41 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 353EAB39
        for <linux-arm-msm@vger.kernel.org>; Mon,  7 Nov 2022 07:51:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1667836310;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=jKqEegX7OgcJy3yUQyqatoiqD10vcofZSbYNQadN7Ek=;
        b=J+Nd2gtzjVr+rkEnrOwmtDjTGqD2XQMKat8DZizrQ0Lg/y4oZxLE9Io1A52wylWp0c94A+
        7gVlOZ9p0Y1MWVy3xPhEejBvfgLZFcWZPMlS6F5MNhA5fnjd4AhU3rHtCfucwN1pSJ/sxs
        kYZrdXcgjp9NJpcpBqEIMCfufGRwxxI=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-625--_VonGepMoi6d35UauV3Vg-1; Mon, 07 Nov 2022 10:51:49 -0500
X-MC-Unique: -_VonGepMoi6d35UauV3Vg-1
Received: by mail-oi1-f199.google.com with SMTP id a5-20020aca1a05000000b00359de30f06dso4607896oia.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Nov 2022 07:51:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jKqEegX7OgcJy3yUQyqatoiqD10vcofZSbYNQadN7Ek=;
        b=jL9QFb5t8jPkWhIV8CkIMFKh6TkGSFWJjAHiQzQ6WedH8Fejj6f36qW9TOJP1G8edC
         +sKqSscn2rSJtPY4xSZiTbdUEqo4BlDGl+tFSGkGGbYMdb5+xo3/uhwjfoL5qhCsyiSM
         lD2moMMZYXHcl3QP9LTWbB0hXxYxdNj3SQ2JNaDXtGyOzCAWiwyxwuTw7X70/DjODjLV
         bATXTHxrvn5yAOaR7oO3gerQWtFsvqKrgVnYKKIGxHLwYv9YhIrONYp0+d9Ym2QRJKSI
         Q+KvNtiWeE/RTJgKZ1RYU/n5dj7SGOpT95qE6qMwF3JliwtbrzB9nwo+YJASi3/QZ47I
         e8FA==
X-Gm-Message-State: ACrzQf0NBTgp5kOSHZXAn1rkkdIgPTJxNJxeqWh8XOyuCbb1Nj7fl9xh
        8dnIvhvIgosOFDDxw3k/lrZNTZqT4/4IKsCGpfcXkFtIzRZWoGBOCU+gEO1+CpS80xICJbjt8BF
        wd4Zzcao3XkmRhm2rnXEU9irmLw==
X-Received: by 2002:a05:6808:1796:b0:359:e5f6:6662 with SMTP id bg22-20020a056808179600b00359e5f66662mr26691821oib.256.1667836308569;
        Mon, 07 Nov 2022 07:51:48 -0800 (PST)
X-Google-Smtp-Source: AMsMyM4ZjtbShF1jQWywiTvyIgE7lltPnxOVzJZFu9R+Imftqkh3XahaunnziORphW9W136kJURU/A==
X-Received: by 2002:a05:6808:1796:b0:359:e5f6:6662 with SMTP id bg22-20020a056808179600b00359e5f66662mr26691802oib.256.1667836308297;
        Mon, 07 Nov 2022 07:51:48 -0800 (PST)
Received: from halaney-x13s ([2600:1700:1ff0:d0e0::21])
        by smtp.gmail.com with ESMTPSA id a22-20020a9d4716000000b0066c41be56e7sm3013797otf.55.2022.11.07.07.51.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 07:51:47 -0800 (PST)
Date:   Mon, 7 Nov 2022 09:51:45 -0600
From:   Andrew Halaney <ahalaney@redhat.com>
To:     Johan Hovold <johan+linaro@kernel.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp: fix USB MP QMP PHY nodes
Message-ID: <20221107155145.tvxxi7oed7a6nms7@halaney-x13s>
References: <20221107081705.18446-1-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221107081705.18446-1-johan+linaro@kernel.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Nov 07, 2022 at 09:17:05AM +0100, Johan Hovold wrote:
> Update the USB MP QMP PHY nodes to match the new binding which
> specifically includes the missing register regions (e.g. PCS_USB).
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Reviewed-by: Andrew Halaney <ahalaney@redhat.com>

Address region matches downstream, and with this change in place
make CHECK_DTBS=y qcom/sa8295p-adp.dtb no longer complains about
the node failing to follow the dt-bindings.

Thanks,
Andrew

> ---
> 
> The corresponding binding and driver fixes are now in linux-next so that
> the devicetree can be updated. [1]
> 
> Note that there's yet no support for the multiport controller in
> mainline.
> 
> Johan
> 
> [1] https://lore.kernel.org/lkml/20221028160435.26948-1-johan+linaro@kernel.org/
> 
> 
>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 62 ++++++++++----------------
>  1 file changed, 24 insertions(+), 38 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> index 1b309fa93484..506172206b8a 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> @@ -1090,70 +1090,56 @@ usb_2_hsphy3: phy@88ea000 {
>  			status = "disabled";
>  		};
>  
> -		usb_2_qmpphy0: phy-wrapper@88ef000 {
> +		usb_2_qmpphy0: phy@88ef000 {
>  			compatible = "qcom,sc8280xp-qmp-usb3-uni-phy";
> -			reg = <0 0x088ef000 0 0x1c8>;
> -			#address-cells = <2>;
> -			#size-cells = <2>;
> -			ranges;
> +			reg = <0 0x088ef000 0 0x2000>;
>  
>  			clocks = <&gcc GCC_USB3_MP_PHY_AUX_CLK>,
>  				 <&rpmhcc RPMH_CXO_CLK>,
>  				 <&gcc GCC_USB3_MP0_CLKREF_CLK>,
> -				 <&gcc GCC_USB3_MP_PHY_COM_AUX_CLK>;
> -			clock-names = "aux", "ref_clk_src", "ref", "com_aux";
> +				 <&gcc GCC_USB3_MP_PHY_COM_AUX_CLK>,
> +				 <&gcc GCC_USB3_MP_PHY_PIPE_0_CLK>;
> +			clock-names = "aux", "ref_clk_src", "ref", "com_aux",
> +				      "pipe";
>  
>  			resets = <&gcc GCC_USB3_UNIPHY_MP0_BCR>,
>  				 <&gcc GCC_USB3UNIPHY_PHY_MP0_BCR>;
> -			reset-names = "phy", "common";
> +			reset-names = "phy", "phy_phy";
>  
>  			power-domains = <&gcc USB30_MP_GDSC>;
>  
> -			status = "disabled";
> +			#clock-cells = <0>;
> +			clock-output-names = "usb2_phy0_pipe_clk";
>  
> -			usb_2_ssphy0: phy@88efe00 {
> -				reg = <0 0x088efe00 0 0x160>,
> -				      <0 0x088f0000 0 0x1ec>,
> -				      <0 0x088ef200 0 0x1f0>;
> -				#phy-cells = <0>;
> -				#clock-cells = <0>;
> -				clocks = <&gcc GCC_USB3_MP_PHY_PIPE_0_CLK>;
> -				clock-names = "pipe0";
> -				clock-output-names = "usb2_phy0_pipe_clk";
> -			};
> +			#phy-cells = <0>;
> +
> +			status = "disabled";
>  		};
>  
> -		usb_2_qmpphy1: phy-wrapper@88f1000 {
> +		usb_2_qmpphy1: phy@88f1000 {
>  			compatible = "qcom,sc8280xp-qmp-usb3-uni-phy";
> -			reg = <0 0x088f1000 0 0x1c8>;
> -			#address-cells = <2>;
> -			#size-cells = <2>;
> -			ranges;
> +			reg = <0 0x088f1000 0 0x2000>;
>  
>  			clocks = <&gcc GCC_USB3_MP_PHY_AUX_CLK>,
>  				 <&rpmhcc RPMH_CXO_CLK>,
>  				 <&gcc GCC_USB3_MP1_CLKREF_CLK>,
> -				 <&gcc GCC_USB3_MP_PHY_COM_AUX_CLK>;
> -			clock-names = "aux", "ref_clk_src", "ref", "com_aux";
> +				 <&gcc GCC_USB3_MP_PHY_COM_AUX_CLK>,
> +				 <&gcc GCC_USB3_MP_PHY_PIPE_1_CLK>;
> +			clock-names = "aux", "ref_clk_src", "ref", "com_aux",
> +				      "pipe";
>  
>  			resets = <&gcc GCC_USB3_UNIPHY_MP1_BCR>,
>  				 <&gcc GCC_USB3UNIPHY_PHY_MP1_BCR>;
> -			reset-names = "phy", "common";
> +			reset-names = "phy", "phy_phy";
>  
>  			power-domains = <&gcc USB30_MP_GDSC>;
>  
> -			status = "disabled";
> +			#clock-cells = <0>;
> +			clock-output-names = "usb2_phy1_pipe_clk";
>  
> -			usb_2_ssphy1: phy@88f1e00 {
> -				reg = <0 0x088f1e00 0 0x160>,
> -				      <0 0x088f2000 0 0x1ec>,
> -				      <0 0x088f1200 0 0x1f0>;
> -				#phy-cells = <0>;
> -				#clock-cells = <0>;
> -				clocks = <&gcc GCC_USB3_MP_PHY_PIPE_1_CLK>;
> -				clock-names = "pipe0";
> -				clock-output-names = "usb2_phy1_pipe_clk";
> -			};
> +			#phy-cells = <0>;
> +
> +			status = "disabled";
>  		};
>  
>  		remoteproc_adsp: remoteproc@3000000 {
> -- 
> 2.37.4
> 

