Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 240A74FED8A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Apr 2022 05:27:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231520AbiDMD3i (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Apr 2022 23:29:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbiDMD3h (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Apr 2022 23:29:37 -0400
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com [IPv6:2001:4860:4864:20::34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 861A12497A
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Apr 2022 20:27:17 -0700 (PDT)
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-dacc470e03so773157fac.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Apr 2022 20:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=dUpDo/QNpCbo5GZEPxRqX5x6FMXpOsSDNvk0dyDtdNE=;
        b=Qoa2SFBc+/cWAU+18k83xzBSnsr6mjIjIKevIRfXjlLAf5wkUT/HB1wyDu+Hh7v3nH
         3CyOtYYpS6fH0ebGk+lemTxWmpGSyXa5hdiHc5909dUCHiR20YfENjYgR527HYEKJPlJ
         yLBN03W/usixM7bZoAyAXcRh/LUcQdbaxhLFBE6JWjlXUqJTvfaMlRweZXeybWZlyqMI
         q8VHX3ej2/m/A9LOET/tHEi2QMLPEVWwjrUiy+1wy9ZdF9vjFWTpYUofk9iP+qcAGifz
         LaoDVGKvmeKHoiMrEWqtYVU/oepepXLfyo9FniBIILSRg10dueSSg5WsBFVaKS3N2xzZ
         oUdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=dUpDo/QNpCbo5GZEPxRqX5x6FMXpOsSDNvk0dyDtdNE=;
        b=OxOjE5hWJKsOsHX7HZaDKPciScgEQLjhGq42HHx4IqxplgsJNH51y3cYIIxXuZ7HvC
         MTqTp0gKkEIzm1rB1ABMmcStwI6oLe3rOgqlfTWshP7Qclxpcyg602FlD3naG6tWqKfB
         EtqjQd46XblrfyhijFsQ55haNngDNBfmoDglOVrxY2GmlmmcohKVHIUx29G307b14DBC
         pVyIbKPcVdSsOjIkhAmnbW10sQoAJFgvL+Xjh3NDqetex7y9Q7hsqE4EJv5XXUeeV77d
         OO4THZ3XfTu97S0mH5jUJSSGhed5MPJtOfJL9s5rmbziCja8n9NIlBL0ioVRi8zwf138
         OuHw==
X-Gm-Message-State: AOAM532U377vKHV2Mm0Ep8HS1sTG+LZb0THYvsQZTb+Wt2xiNrOOwkwp
        2+nK6/6JfAuv/UU1m0yWeP0J2Q==
X-Google-Smtp-Source: ABdhPJydY2hFrfknHiVRaGDlyOcQdWrVsnV9NAvW1aQdEvbPls9I0GRD+D3Gb4XN/CTvQJ56SnYovA==
X-Received: by 2002:a05:6870:e3c1:b0:d7:2dc8:7fd0 with SMTP id y1-20020a056870e3c100b000d72dc87fd0mr3535533oad.104.1649820436948;
        Tue, 12 Apr 2022 20:27:16 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id o64-20020acad743000000b002ef3b249b9esm13165081oig.58.2022.04.12.20.27.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 20:27:16 -0700 (PDT)
Date:   Tue, 12 Apr 2022 22:27:14 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rohit Agarwal <quic_rohiagar@quicinc.com>
Cc:     will@kernel.org, robin.murphy@arm.com, joro@8bytes.org,
        robh+dt@kernel.org, krzk+dt@kernel.org, ulf.hansson@linaro.org,
        agross@kernel.org, manivannan.sadhasivam@linaro.org,
        linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux-foundation.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 7/7] ARM: dts: qcom: sdx65: Add Shared memory manager
 support
Message-ID: <YlZDEk2Z47GoX/jQ@builder.lan>
References: <1649670615-21268-1-git-send-email-quic_rohiagar@quicinc.com>
 <1649670615-21268-8-git-send-email-quic_rohiagar@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1649670615-21268-8-git-send-email-quic_rohiagar@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 11 Apr 04:50 CDT 2022, Rohit Agarwal wrote:

> Add smem node to support shared memory manager on SDX65 platform.
> 
> Signed-off-by: Rohit Agarwal <quic_rohiagar@quicinc.com>
> ---
>  arch/arm/boot/dts/qcom-sdx65.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom-sdx65.dtsi b/arch/arm/boot/dts/qcom-sdx65.dtsi
> index 210e55c..8fef644 100644
> --- a/arch/arm/boot/dts/qcom-sdx65.dtsi
> +++ b/arch/arm/boot/dts/qcom-sdx65.dtsi
> @@ -113,6 +113,12 @@
>  		};
>  	};
>  
> +	smem {
> +		compatible = "qcom,smem";
> +		memory-region = <&smem_mem>;
> +		hwlocks = <&tcsr_mutex 3>;
> +	};

As you only have the single region, please move the compatible and
hwlocks properties into the &smem_mem node (see sm8450.dtsi in arm64 as
an example).

I've applied the other dts changes.

Thanks,
Bjorn

> +
>  	soc: soc {
>  		#address-cells = <1>;
>  		#size-cells = <1>;
> -- 
> 2.7.4
> 
