Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD863507C2A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Apr 2022 23:51:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355017AbiDSVye (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Apr 2022 17:54:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350809AbiDSVyd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Apr 2022 17:54:33 -0400
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DDD53C49B
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Apr 2022 14:51:49 -0700 (PDT)
Received: by mail-oi1-x22b.google.com with SMTP id t15so76252oie.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Apr 2022 14:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=W+ceGgRR9zvwWmU1mtTfUVYRnyt1qpRV5SmsSw2sDBA=;
        b=Q+af+xzsDFwSor0xAYNzh9AJT88R/P1yQNazf6uwd1Rtl+HJJbQeOLC9jGFQrPCJZG
         n5U1DYLFx8ndTzauAH4LmADNrnE2/Az3wycBp1mpPLXjijpLDwy5yUtp9Mz+iQZ95NIN
         P12R8uSbkkL2T7C+Gy0IkdwPksu/cRceKU+ir0fez65bOBXqJN9EfTqgYzAOu/ePwxjP
         hzK+m4GDtnODkU9N2Kc3aWq6jUtSyYPMIMgTdcNmvea36uJz8ibcYbJpaszRuaaSgcrf
         07JJP4ibUqoCdFleXmJIKt45auXCzpXv9yfx3GThrhPH5MlWhU3pv4ZRIRWFxT9F6v1K
         hbDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=W+ceGgRR9zvwWmU1mtTfUVYRnyt1qpRV5SmsSw2sDBA=;
        b=cCDPTmXWKP+YiVf1+5mwQ6aQRrU0oHop/Twl2j+iMiCJhO+QaFr9V6ynwMaW/ZsCcS
         xM6yGc9y0yTRBFY/zskEGTRtW3rO+FSjWbyI2rhIXYA4uOKinJoSiPU/I4Gm3Uq0RJIo
         DSrRIJpN89VctKap3InIgM1wa/k+yYzVbvMlto6mfWFosYAw8z7e2XmDo7tm69Sxa5km
         ovdZAYeQA9VYUmuDACDSpcV9Ojbt7NRgVgcF/m17eiqR8YwV8yta1Q0akfjt6CGIsdtd
         YCS6OrWsTmzeT/eDNw2FUpQy2OaiFBIPrwNJvNPTvMJq0/9aYF1kJ9tsI8vlbg7xCz9J
         T+4A==
X-Gm-Message-State: AOAM530PvmRU1t7ZG+iSBkXQcfts45owPET0xYj84/QKL4P8jFsuQG3z
        6yHDBnaGyDV5mj0c/Rz1ZWm0TQPnlUjMmt8k
X-Google-Smtp-Source: ABdhPJzvvmK1GDuA2/E6+cgyylCSq27IUoOJiC38CXVKFktMRKfPV/+nEQLAFY6j7CSQISgw0z5esA==
X-Received: by 2002:a05:6808:13d2:b0:322:73bd:400e with SMTP id d18-20020a05680813d200b0032273bd400emr291467oiw.97.1650405108711;
        Tue, 19 Apr 2022 14:51:48 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id pi9-20020a0568704c8900b000e58cd8146csm4929408oab.34.2022.04.19.14.51.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Apr 2022 14:51:48 -0700 (PDT)
Date:   Tue, 19 Apr 2022 16:51:46 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     agross@kernel.org, robh+dt@kernel.org, krzk+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        shawn.guo@linaro.org, jun.nie@linaro.org, benl@squareup.com,
        jwillcox@squareup.com, jgates@squareup.com, mchen@squareup.com,
        zac@squareup.com
Subject: Re: [PATCH v1 4/4] arm64: dts: Add msm8939 Sony Xperia M4 Aqua
Message-ID: <Yl8u8v0QOk2rfNwE@builder.lan>
References: <20220419010903.3109514-1-bryan.odonoghue@linaro.org>
 <20220419010903.3109514-5-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220419010903.3109514-5-bryan.odonoghue@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 18 Apr 20:09 CDT 2022, Bryan O'Donoghue wrote:

> Add a basic booting DTS for the Sony Xperia M4 Aqua aka "tulip".
> 
> Tulip is paired with:
> 
> - wcn3660
> - smb1360 battery charger
> - 720p Truly NT35521 Panel
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |   1 +
>  .../qcom/msm8939-sony-xperia-kanuti-tulip.dts | 489 ++++++++++++++++++
>  2 files changed, 490 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/msm8939-sony-xperia-kanuti-tulip.dts
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 5b8a0eb34733..3ac7f6876c09 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -19,6 +19,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-samsung-a5u-eur.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-samsung-j5.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-samsung-serranove.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-wingtech-wt88047.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= msm8939-sony-xperia-kanuti-tulip.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8992-lg-bullhead-rev-10.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8992-lg-bullhead-rev-101.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8992-msft-lumia-octagon-talkman.dtb
> diff --git a/arch/arm64/boot/dts/qcom/msm8939-sony-xperia-kanuti-tulip.dts b/arch/arm64/boot/dts/qcom/msm8939-sony-xperia-kanuti-tulip.dts
> new file mode 100644
> index 000000000000..336969f16bc9
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/msm8939-sony-xperia-kanuti-tulip.dts
> @@ -0,0 +1,489 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2015, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2022, Bryan O'Donoghue.
> + *

Same comments as the other baord dts; please drop the GPL license text
here, don't use underscore in node names and please sort the labels
alphabetically.

Thanks,
Bjorn
