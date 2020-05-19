Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A291B1D8FD8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2020 08:13:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726605AbgESGMk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 May 2020 02:12:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728359AbgESGMi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 May 2020 02:12:38 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A7DAC05BD0A
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2020 23:12:37 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id q16so5192680plr.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2020 23:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=NucwNVkAqqb7Hv4lqQXSBES90B7yxHZZLhQ//c0Ras4=;
        b=f4lRrgtUvWI0qJ3jX5cXK6OYM5hoLZxi3aJUbDDjAxhDtNaVGOHnPYytvoHQiP5vm5
         Db72vAc2ERN0BgKyMDcdnogzC1NVXfGqrp9LBTnaIEKE3qqLwuTINoLU0DWfDVbtq3A9
         9HyFsZmopQ84ovzE1oa/3t7Y56pYcM/AOyf2lS4x7+yBMTrhf7douZGUvnJqwMENy+V2
         XgsVKBW//XyOQr4p6smXQhFRZi1Cuo7GeLz09Xr+S+H/2haqGPeDdrPewgZXnSMlD0Xo
         zadd3SGR/SqJs+mcibetxNnHi0uEIpjAZGzqSemmA9+hwGZtFDhr4rb8ZzDGdfhfVKph
         oKxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NucwNVkAqqb7Hv4lqQXSBES90B7yxHZZLhQ//c0Ras4=;
        b=m3r6uV3VA2ArpWN9dnS+5N/kL3T7LBFQ9APRZ4zyuZn+Ij0G7/ODOtEMuG0USxVtY1
         V0FdJK9DnfIlSwkTyBjLavJtRocYQyO4UKJoiFJqBQnLwkDdfuBat7TPiI7JV/LsPBSQ
         Mg6+UIbNo0ZBzafR2hVvo8Kodsw8lATNbMi7ArqPixekka3IGzP49G9dZLSMwrPeXh2h
         tGbhR7q6EHNAInjc6nUNxNWcQH/9bd3IrpleTjvMGtNNTA3/DBIbvZi7zPcheRpHobRK
         L6n5GEP3fT4azjm9rgyOoN3YNcpRu3XcbrouGJKfC1uFwhTuMH1fV7rE3xkNOmFKkxac
         /A3Q==
X-Gm-Message-State: AOAM5310yoD6WfgLuGS/5SpGfJ+AYPjDMPPs38Kfbumq5nRmmM44/1Mm
        uFkNBhNW7qyaA4Nq3SSCvBNENw==
X-Google-Smtp-Source: ABdhPJw3/VikrqtOLgds+XntQ5DKyIHUIpkcu4Jk42AWonuOtANw9OWOvvbPlQHYKCVlWlTSX9GdmQ==
X-Received: by 2002:a17:90a:17ed:: with SMTP id q100mr3089926pja.80.1589868756741;
        Mon, 18 May 2020 23:12:36 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id 135sm10222244pfu.125.2020.05.18.23.12.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 23:12:36 -0700 (PDT)
Date:   Mon, 18 May 2020 23:11:14 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Eli Riggs <eli@rje.li>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 3/3] arm64: dts: qcom: Add initial support for Xiaomi
 Redmi Note 8T
Message-ID: <20200519061114.GC2165@builder.lan>
References: <20200517115410.3374-1-eli@rje.li>
 <20200517115410.3374-3-eli@rje.li>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200517115410.3374-3-eli@rje.li>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun 17 May 04:54 PDT 2020, Eli Riggs wrote:

> Adds initial device tree for Xiaomi Redmi Note 8T, codename xiaomi-willow.
> It uses the sm6125 SoC. Currently only boots into initrd shell over UART.
> Requires appended DTB with qcom,board-id = <0x22 0x0> and
> qcom,msm-id = <0x18a 0x10000> to actually boot.
> 

If I read this correctly you need to supply board-id and msm-id in order
to be able to get this booting?

Even though we don't like them, I would prefer if you just add them in
the dts file, in this patch.

> Signed-off-by: Eli Riggs <eli@rje.li>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |  1 +
>  .../boot/dts/qcom/sm6125-xiaomi-willow.dts    | 19 +++++++++++++++++++
>  2 files changed, 20 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/sm6125-xiaomi-willow.dts
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index cc103f7020fd6..060aa98200e47 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -22,6 +22,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-cheza-r3.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-db845c.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-mtp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm850-lenovo-yoga-c630.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= sm6125-xiaomi-willow.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8150-mtp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8250-mtp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-1000.dtb
> diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-willow.dts b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-willow.dts
> new file mode 100644
> index 0000000000000..444b32ccb9d48
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-willow.dts
> @@ -0,0 +1,19 @@
> +// SPDX-License-Identifier: GPL-2.0-only

Please make this GPL/BSD dual license.

Apart from these few remarks your patches looks good, looking forward to
see more of this platform!

Regards,
Bjorn

> +// Copyright (c) 2020, Eli Riggs <eli@rje.li>
> +
> +/dts-v1/;
> +
> +#include "sm6125.dtsi"
> +
> +/ {
> +	model = "Xiaomi Redmi Note 8T";
> +	compatible = "xiaomi,willow", "qcom,sm6125";
> +
> +	aliases {
> +		serial0 = &qupv3_se4_2uart;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +};
> -- 
> 2.20.1
> 
