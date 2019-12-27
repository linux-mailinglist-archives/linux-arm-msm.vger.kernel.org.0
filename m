Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A97DE12B205
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Dec 2019 07:39:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727311AbfL0Gja (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Dec 2019 01:39:30 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:35978 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727287AbfL0Gja (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Dec 2019 01:39:30 -0500
Received: by mail-pl1-f196.google.com with SMTP id a6so10636668plm.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Dec 2019 22:39:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=t0JhfQXqwvsrBVHIc9FoCtLnTmKQkndMD2Zq+leqajk=;
        b=ATeg/AZpEVVu/zzKxM41Gi38Tego1wb4/bAhm5+kH/7D3iosOE0ZaLSI4hsJ2sw3Py
         yi9T+xKB8IiYFZsxGDS5EqPNS4pQ3m9uz/n/rILt/Z61xaxMKGgGuApZ2wWNvK6VI/Xc
         1+IKM8EQ1fNer+hMWAou4/OhTnYjoaKcq8oCerlJGjm5iPDAwimFyuMCIWtO1MPlKRsF
         ZxzjGVvdYzTgntX/o2FgtZq0BiGycxuLPuSM0WpjH37YnMmZkuu5iK2KiMnCf87tDLjF
         +NZYtuEqX7qm5nQ1s1MnGonfwqXCxW4u7JygoPXpi/opDP4XG+KlmKUACFoQW7IdqATY
         oqYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=t0JhfQXqwvsrBVHIc9FoCtLnTmKQkndMD2Zq+leqajk=;
        b=R6TH0wl/sjZ7l6e2/J6lFkHzIhSHtRfEr0pKbfPbqEz2QN0ovzJVGWpxKdgGPG1BVw
         xioZ1hheHcjr/oiOkfXl1kxnJSOJdcmZAo7MMkTspX37xwWCinqW72OT3tjopC56/XtS
         6zuYjGAuTBXCYPJaaTBsxrNPNdcOGtvbiR2obJBSbMTnvwuksiA/P2INhBRMeH4dqREv
         hwRhNG8SaSaexIhL1veWXw/ccLLTUabL3LoCV284fmxV9Xd0lypu2CKg2jDfuMd4rbAk
         TyJPgVJoDTSgjHdM3IgUvnSvYVOUTNC0E74SitASvuxi/lqL7QmCwIgZ2Npd7xjDV+LN
         wTVA==
X-Gm-Message-State: APjAAAVbtshsgmQotrlTXtPmLMUVyB7Iny7nYufPDjbGAwRTsCaARDxK
        PqMFoLDuT0ogWL+5VWPayfA9IQ==
X-Google-Smtp-Source: APXvYqyFA5E8nGzaiWY8T+cpTP6ABUjEiZB7ONgvKrMEFw6iP/g3fmeY4/Xr2ZWP5NFoXB4htPGF+w==
X-Received: by 2002:a17:902:b609:: with SMTP id b9mr50522157pls.70.1577428769647;
        Thu, 26 Dec 2019 22:39:29 -0800 (PST)
Received: from ripper (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id l9sm35705531pgh.34.2019.12.26.22.39.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Dec 2019 22:39:29 -0800 (PST)
Date:   Thu, 26 Dec 2019 22:39:15 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     catalin.marinas@arm.com, will@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] arm64: Add qcom Kconfig fragment
Message-ID: <20191227063915.GI1908628@ripper>
References: <1576850160-1564-1-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1576850160-1564-1-git-send-email-loic.poulain@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 20 Dec 05:56 PST 2019, Loic Poulain wrote:

> Add qcom Kconfig fragment which enables the appropriate symbols for
> support of Qualcomm based boards, like the 'popular' dragonboards.
> This permits to fully support the boards upstream without having to
> rely on downstream deconfig changes.
> 
> This patch has been tested with Dragonboard-410c and Dragonboard-820c.
> 

As Catalin said, this should be added to the generic defconfig. I have a
few of these queued up already for v5.6 in linux-next, but please do
send me additional patches and I'll include them in the qcom/defconfig
branch.

> qcom.config fragment has been generated with ./script/diffconfig
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> ---
>  arch/arm64/configs/qcom.config | 57 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 arch/arm64/configs/qcom.config
> 
> diff --git a/arch/arm64/configs/qcom.config b/arch/arm64/configs/qcom.config
> new file mode 100644
> index 0000000..9358df8
> --- /dev/null
> +++ b/arch/arm64/configs/qcom.config
> @@ -0,0 +1,57 @@
> +CONFIG_ARM_QCOM_CPUFREQ_HW=y
> +CONFIG_BT_HCIUART_3WIRE=y
> +CONFIG_BT_HCIUART_QCA=y
> +CONFIG_BT_HCIUART_RTL=y
> +CONFIG_CRYPTO_DEV_QCOM_RNG=y

=m

> +CONFIG_EXTCON_QCOM_SPMI_MISC=y
> +CONFIG_INTERCONNECT=y
> +CONFIG_MFD_QCOM_RPM=y

This is for 32-bit targets.

> +CONFIG_PHY_QCOM_PCIE2=y

=m

> +CONFIG_PHY_QCOM_QMP=y

=m

> +CONFIG_PHY_QCOM_QUSB2=y

=m

> +CONFIG_PHY_QCOM_UFS=y

I recently proposed a patch to add 8996 UFS support to the common QMP
driver, so hopefully we can get that merged for v5.6 instead.

> +CONFIG_PM8916_WATCHDOG=y

=m

> +CONFIG_POWER_RESET_QCOM_PON=y

=m

> +CONFIG_QCOM_APR=m
> +CONFIG_QCOM_FASTRPC=y

=m

> +CONFIG_QCOM_RMTFS_MEM=m
> +CONFIG_QCOM_RPMHPD=y
> +CONFIG_QCOM_RPMPD=y
> +CONFIG_QCOM_SOCINFO=m
> +CONFIG_QCOM_WCNSS_CTRL=m
> +CONFIG_QCOM_WCNSS_PIL=m
> +CONFIG_SCSI_UFS_QCOM=y

=m

> +CONFIG_SND_SOC_CROS_EC_CODEC=m
> +CONFIG_SND_SOC_MAX98927=m
> +CONFIG_SND_SOC_MSM8916_WCD_ANALOG=m
> +CONFIG_SND_SOC_MSM8916_WCD_DIGITAL=m
> +CONFIG_VIDEO_QCOM_CAMSS=m
> +CONFIG_VIDEO_QCOM_VENUS=m
> +CONFIG_WCN36XX=m
> +CONFIG_BT_QCA=m
> +CONFIG_BT_QCOMSMD=m
> +CONFIG_INTERCONNECT_QCOM=y
> +CONFIG_INTERCONNECT_QCOM_MSM8974=y
> +CONFIG_INTERCONNECT_QCOM_QCS404=y
> +CONFIG_INTERCONNECT_QCOM_SDM845=y
> +CONFIG_INTERCONNECT_QCOM_SMD_RPM=y

Selected as needed by previous options.

> +CONFIG_PHY_QCOM_UFS_14NM=y

Follows CONFIG_PHY_QCOM_UFS, and should be replaced by
CONFIG_PHY_QCOM_QMP

> +CONFIG_QCOM_CLK_RPM=y
> +CONFIG_REGULATOR_QCOM_RPM=y

These two are for 32-bit targets.

Regards,
Bjorn

> +CONFIG_SND_COMPRESS_OFFLOAD=y
> +CONFIG_SND_SOC_COMPRESS=y
> +CONFIG_SND_SOC_MSM8996=m
> +CONFIG_SND_SOC_QCOM_COMMON=m
> +CONFIG_SND_SOC_QDSP6=m
> +CONFIG_SND_SOC_QDSP6_ADM=m
> +CONFIG_SND_SOC_QDSP6_AFE=m
> +CONFIG_SND_SOC_QDSP6_AFE_DAI=m
> +CONFIG_SND_SOC_QDSP6_ASM=m
> +CONFIG_SND_SOC_QDSP6_ASM_DAI=m
> +CONFIG_SND_SOC_QDSP6_COMMON=m
> +CONFIG_SND_SOC_QDSP6_CORE=m
> +CONFIG_SND_SOC_QDSP6_ROUTING=m
> +CONFIG_SND_SOC_RT5663=m
> +CONFIG_SND_SOC_SDM845=m
> +CONFIG_VIDEOBUF2_DMA_SG=m
> +CONFIG_WCN36XX_DEBUGFS=y
> -- 
> 2.7.4
> 
