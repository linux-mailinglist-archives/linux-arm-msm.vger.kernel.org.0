Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB581773104
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Aug 2023 23:14:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229588AbjHGVOs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Aug 2023 17:14:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229480AbjHGVOr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Aug 2023 17:14:47 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FEC499
        for <linux-arm-msm@vger.kernel.org>; Mon,  7 Aug 2023 14:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1691442839;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=JXMzJkxEcN+WGfxIBPJSFTXLV2MrljSWgXeNKR2c0yU=;
        b=D6wlBqb4NcesOjQfrr5ofEu030jgVYL1Gzzi2WEHNDWVBnwkL1vGJXa+NYG5Akid3tJ+Ug
        7uXOJ9gugHn8hIK4eod/V2L8NBHm3SAnnZ3+dnJOCOL0JRhyQRNjpnVULMAkLp4d7rmfwa
        1/FUbdZdFsJDt57qpmhQXCvxfgzIPVU=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-398-3thsniF0O1CWfG4DV2FmFA-1; Mon, 07 Aug 2023 17:13:58 -0400
X-MC-Unique: 3thsniF0O1CWfG4DV2FmFA-1
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-63f7fa45db5so21784216d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Aug 2023 14:13:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691442838; x=1692047638;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JXMzJkxEcN+WGfxIBPJSFTXLV2MrljSWgXeNKR2c0yU=;
        b=KIpBoY7R7hkaE706Fv0TG12pxv5/dR7i8XMKL3dsueqtVqNh150qpMa+RjymsmPWq+
         a8rkStvT4REuAbxN8HJxPTmjHMMPq4cmTMUl5BO5fAHq0kIT9tASlu2DHWliditB0EPY
         FTFkLnWM6y3agXN6eupbBiZj7KxtiL6ESmIcDYO9pTy06+wR6i85MwpL7PlfW1thqKrv
         9qH1lZFelBVurBRbD91YHjUViOG5wVwr1jKEapgq0DeRd0q31nwWdIVq38jwPTgOC0RU
         XPuuzIgaylcOjf4cLTbmj7yuvqMEHWY+OBsWCLhawFToKTu+a9NaxoTdjvnJmXsAWS04
         NAoA==
X-Gm-Message-State: AOJu0YyEUfXfesATn2KEKJfYKO0B75Wa1yu0LSyMJyBf985yjEgSPyeo
        LXd4FurgQ0JoS0cUm/9osL2Ba33ma5/OPx6oaI2h7QfZDybT2VlNquvYQRzU1wcYZDIaS3wDpqY
        Guh+fufdJh0fq6oREZSM8dQ0xlA==
X-Received: by 2002:a05:6214:9b0:b0:63c:eb21:206c with SMTP id du16-20020a05621409b000b0063ceb21206cmr9882503qvb.15.1691442837883;
        Mon, 07 Aug 2023 14:13:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+2IbnpjDPIat8Tq4vIR27JGYoz62RjC98fpBMP9qRuLqSziOFTaIDrnTWCH8qksC3yB9NXQ==
X-Received: by 2002:a05:6214:9b0:b0:63c:eb21:206c with SMTP id du16-20020a05621409b000b0063ceb21206cmr9882484qvb.15.1691442837616;
        Mon, 07 Aug 2023 14:13:57 -0700 (PDT)
Received: from fedora ([2600:1700:1ff0:d0e0::37])
        by smtp.gmail.com with ESMTPSA id x15-20020a0ce0cf000000b0063d193369c3sm3121670qvk.29.2023.08.07.14.13.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Aug 2023 14:13:57 -0700 (PDT)
Date:   Mon, 7 Aug 2023 16:13:55 -0500
From:   Andrew Halaney <ahalaney@redhat.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alex Elder <elder@linaro.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 2/9] arm64: dts: qcom: sa8775p: add a node for EMAC1
Message-ID: <wlx5q5v7isdnbbmf2xvhumj6ycakqufyzttqzlkfphfba4yw2u@n6krstdzb4d2>
References: <20230807193507.6488-1-brgl@bgdev.pl>
 <20230807193507.6488-3-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230807193507.6488-3-brgl@bgdev.pl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Aug 07, 2023 at 09:35:00PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Add a node for the second MAC on sa8775p platforms.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Andrew Halaney <ahalaney@redhat.com>

> ---
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi | 34 +++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> index 38d10af37ab0..82af2e6cbda4 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> @@ -2325,6 +2325,40 @@ cpufreq_hw: cpufreq@18591000 {
>  			#freq-domain-cells = <1>;
>  		};
>  
> +		ethernet1: ethernet@23000000 {
> +			compatible = "qcom,sa8775p-ethqos";
> +			reg = <0x0 0x23000000 0x0 0x10000>,
> +			      <0x0 0x23016000 0x0 0x100>;
> +			reg-names = "stmmaceth", "rgmii";
> +
> +			interrupts = <GIC_SPI 929 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "macirq";
> +
> +			clocks = <&gcc GCC_EMAC1_AXI_CLK>,
> +				 <&gcc GCC_EMAC1_SLV_AHB_CLK>,
> +				 <&gcc GCC_EMAC1_PTP_CLK>,
> +				 <&gcc GCC_EMAC1_PHY_AUX_CLK>;
> +
> +			clock-names = "stmmaceth",
> +				      "pclk",
> +				      "ptp_ref",
> +				      "phyaux";
> +
> +			power-domains = <&gcc EMAC1_GDSC>;
> +
> +			phys = <&serdes1>;
> +			phy-names = "serdes";
> +
> +			iommus = <&apps_smmu 0x140 0xf>;
> +
> +			snps,tso;
> +			snps,pbl = <32>;
> +			rx-fifo-depth = <16384>;
> +			tx-fifo-depth = <16384>;
> +
> +			status = "disabled";
> +		};
> +
>  		ethernet0: ethernet@23040000 {
>  			compatible = "qcom,sa8775p-ethqos";
>  			reg = <0x0 0x23040000 0x0 0x10000>,
> -- 
> 2.39.2
> 

