Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 711FC516B12
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 May 2022 09:07:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358468AbiEBHLF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 May 2022 03:11:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358428AbiEBHLE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 May 2022 03:11:04 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8840D31523
        for <linux-arm-msm@vger.kernel.org>; Mon,  2 May 2022 00:07:36 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id j6so11619479pfe.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 May 2022 00:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=jcSxE86zVLj7E/7jleEylGGHP0tlw5PsdtapltFVYeM=;
        b=Dv0b4+1pBOn4rpCQ+XV8wH1SByWSIeDtawC0IWMits3v1q5KIipiaYKfbmEVn+HxAC
         VxAI8ofUZl41dFs0oREVI9rX3XNJojpkGEQh1CEF+8RAmlUdfn6z835vGllr5z71o6O7
         slFgtznMN/kuPGYZDIzsy9PtjBRRRsix8RiLoZNwW8w2SR5zf4yiOzCKaaYWKGG8dk9E
         KZxZMEPFvzdPdVGk2I5JE8TCNBcpJDfecRiskF6+NztYBBFro91vI7VGPz9OmDNlikp+
         Rydy2l9YvQRTMxeuBe17taQ591J4wlcnEzoxmXAkbbFlerA3ZWrMsm/FH7ennmwj98qG
         rCCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jcSxE86zVLj7E/7jleEylGGHP0tlw5PsdtapltFVYeM=;
        b=JxfhrVUMfAGWPnhhjWhuu9H8yzjW9GBsbsz2Kkay6nV2SJVlfvkLFuRuiFPvnNxckB
         QHkD2SuH7wj/fisnAh8qqyVmEdrPqqv5Tkh7mNYtt61JrMQNFC247U5StL3zFy47cQGg
         bEjM37Xcp+wYwACNbIrRbBy6IcDE1G7UDiELm5Z8jdNFcEjBWSpW3qp+GWGKVek+xd8m
         SXDK38jLhTX/6IOSCOBN+wgkMpC2/O9UYOjvovSglOaBSaDVx/A9okLP44VECeUrTSza
         ZEg4J9YVKFq4bhZAo5EkERsjcUwxIRy96P2HMZCjEJwQYtsoNBYxTRqMdRHVMSegNqH/
         PQLA==
X-Gm-Message-State: AOAM532/Tqxe6qAfiHhSprkS8JNGVoAwenG8uRpszcofzGkjzXmqR86T
        52m2anSvPIHtb1Wd+U1r7tws
X-Google-Smtp-Source: ABdhPJywApFsi9W71oHrgb3N9EEZ0yKzVLVDmqKkG5J8t3AEzzmSFUdcfBIdh8ExOA1a1HOt6MMnJQ==
X-Received: by 2002:a05:6a00:1145:b0:4f6:3ebc:a79b with SMTP id b5-20020a056a00114500b004f63ebca79bmr9818863pfm.41.1651475255924;
        Mon, 02 May 2022 00:07:35 -0700 (PDT)
Received: from thinkpad ([27.111.75.99])
        by smtp.gmail.com with ESMTPSA id x5-20020aa79a45000000b004fa743ba3f9sm4047904pfj.2.2022.05.02.00.07.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 00:07:35 -0700 (PDT)
Date:   Mon, 2 May 2022 12:37:30 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Kaushal Kumar <quic_kaushalk@quicinc.com>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] ARM: dts: qcom: sdx65-mtp: Enable QPIC NAND support
Message-ID: <20220502070730.GE5053@thinkpad>
References: <1651332610-6334-1-git-send-email-quic_kaushalk@quicinc.com>
 <1651332610-6334-5-git-send-email-quic_kaushalk@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1651332610-6334-5-git-send-email-quic_kaushalk@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Apr 30, 2022 at 08:30:10AM -0700, Kaushal Kumar wrote:
> Enable QPIC NAND devicetree node for Qualcomm SDX65-MTP board.
> 
> Signed-off-by: Kaushal Kumar <quic_kaushalk@quicinc.com>
> ---
>  arch/arm/boot/dts/qcom-sdx65-mtp.dts | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom-sdx65-mtp.dts b/arch/arm/boot/dts/qcom-sdx65-mtp.dts
> index 5c5fcb0..3628104 100644
> --- a/arch/arm/boot/dts/qcom-sdx65-mtp.dts
> +++ b/arch/arm/boot/dts/qcom-sdx65-mtp.dts
> @@ -72,6 +72,21 @@
>  	status = "ok";
>  };
>  
> +&qpic_nand {

Nodes need to be sorted in alphabetical order.

Thanks,
Mani

> +	status = "ok";
> +
> +	nand@0 {
> +		reg = <0>;
> +
> +		nand-ecc-strength = <4>;
> +		nand-ecc-step-size = <512>;
> +		nand-bus-width = <8>;
> +		/* ico and efs2 partitions are secured */
> +		secure-regions = /bits/ 64 <0x500000 0x500000
> +					    0xa00000 0xb00000>;
> +	};
> +};
> +
>  &apps_rsc {
>  	pmx65-rpmh-regulators {
>  		compatible = "qcom,pmx65-rpmh-regulators";
> -- 
> 2.7.4
> 
