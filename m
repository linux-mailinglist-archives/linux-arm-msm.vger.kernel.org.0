Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2B3C353941
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Apr 2021 19:53:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231316AbhDDRxg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 4 Apr 2021 13:53:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229861AbhDDRxf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 4 Apr 2021 13:53:35 -0400
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97405C0613E6
        for <linux-arm-msm@vger.kernel.org>; Sun,  4 Apr 2021 10:53:29 -0700 (PDT)
Received: by mail-ot1-x32f.google.com with SMTP id k14-20020a9d7dce0000b02901b866632f29so9525276otn.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 Apr 2021 10:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Xw0RpuFgi9qxMTOk7aswsBKccO6EkqEKvpv3Yejbriw=;
        b=oPU4xfAhTu7df+3OmlVCKI/mJybOlX8Pik1WMwQyCzG8ZpZBinOmHKJauHEpj3jGyR
         01T4TOiNbCYjkiyY6cIxhCGA7J6w+D8JZyFcJn2c/sgmbHqntWFUNdn1qW/1LiIS/1A0
         JYMfm9Xyt/dyFcTJ93z6RhEK5Ork5B8UyB8NlENFzMGHLTYOv2KnZkL/XRRXz9L3mtDC
         pXSdL72UvGFH4J2cPL0Ntq/uRbeOycdZaF3P1Spf2iiSd47APeYDiI7qQk9KlPhuZEbJ
         SHSWzAnfrFgsgLYXeI7cEerP5ifE7yXsF9sEZSjyllKJakotSMLFgAXkx9UQ8FNzG2uN
         e/zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Xw0RpuFgi9qxMTOk7aswsBKccO6EkqEKvpv3Yejbriw=;
        b=riczLf0yBL7pCzYhsPTbdaHSPozrQUyFTWeCWC8C3PhGas/C0Vqq8nTmQPDbl0z85O
         dzzF0PkIyoV1L6Al092gPFjFLkyrLh5GhZGTfWZ9iBDlGy31PTocjns7PbBqzEuiFMSY
         p5xLL1tjtEOM1+X+kvi7XdJhvGAr3LL0tM7kNh35CBJD4EjgMVKQVQ5PEk4Du5buax1w
         LvM8mEFTzVBzELjeWgOl9GvPApbYbbT2iycrlNWDXwd9PQOm5iEow/X4Bqr9jDAqyE5Y
         tRHGzpg3sRnfFBN4DkxSKH0zvx935JDjMEQNFLRr/+6adTWGqILGdfoBXoNmdcl0EGpz
         L/Cw==
X-Gm-Message-State: AOAM532WRGVSHSsVPgXAVLmmGS7PjSgTfMLo82WYjydOy8r/SijSJgFO
        a1+RBJq9O3o4LT69yZfE37dhzQ==
X-Google-Smtp-Source: ABdhPJxNyL3q4qrYsQg4FBUoMv9pdQ1gdLtPMov0jOwO+8YGyq8+g/WA1ihibKJtH5s92doDUWiiCA==
X-Received: by 2002:a9d:66:: with SMTP id 93mr19046144ota.147.1617558808909;
        Sun, 04 Apr 2021 10:53:28 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id x20sm2695458oiv.35.2021.04.04.10.53.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Apr 2021 10:53:28 -0700 (PDT)
Date:   Sun, 4 Apr 2021 12:53:26 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Jami Kettunen <jamipkettunen@gmail.com>
Cc:     phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        agross@kernel.org, robh+dt@kernel.org, keescook@chromium.org,
        anton@enomsg.org, ccross@android.com, tony.luck@intel.com,
        ~postmarketos/upstreaming@lists.sr.ht, martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: Re: [PATCH RESEND] arm64: dts: qcom: Add support for OnePlus 5/5T
Message-ID: <YGn9FpX9pYuSj9Fa@builder.lan>
References: <20210322161648.14615-1-jamipkettunen@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210322161648.14615-1-jamipkettunen@gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 22 Mar 11:16 CDT 2021, Jami Kettunen wrote:
[..]
> diff --git a/arch/arm64/boot/dts/qcom/msm8998-oneplus-cheeseburger.dts b/arch/arm64/boot/dts/qcom/msm8998-oneplus-cheeseburger.dts
> new file mode 100644
> index 000000000000..13b6b8ad4679
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/msm8998-oneplus-cheeseburger.dts
> @@ -0,0 +1,42 @@
> +// SPDX-License-Identifier: GPL-2.0

The DT community prefer to get these under BSD-3-Clause instead? Would
you be willing to change this?

> +/*
> + * OnePlus 5 (cheeseburger) device tree
> + *
> + * Copyright (c) 2021, Jami Kettunen <jamipkettunen@gmail.com>
> + */
> +
[..]
> diff --git a/arch/arm64/boot/dts/qcom/msm8998-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/msm8998-oneplus-common.dtsi
[..]
> +/* Disable all remoteprocs for now until RPM XO clock is usable */
> +&remoteproc_mss {

Can you please disable this in msm8998.dtsi and make devices explicitly
enable it instead - in a separate patch.

> +	status = "disabled";
> +};
> +
[..]
> +/* Hold off on WLAN enablement until MSS remoteproc and friends are brought up */

Are you saying leave disabled until MSS is up?

If so then move the comment inside the node and make it something like
"Leave disabled until MSS is functional" - to make it clearer that this
relates to the "status" of the node.

Regards,
Bjorn

> +&wifi {
> +	vdd-0.8-cx-mx-supply = <&vreg_l5a_0p8>;
> +	vdd-1.8-xo-supply = <&vreg_l7a_1p8>;
> +	vdd-1.3-rfa-supply = <&vreg_l17a_1p3>;
> +	vdd-3.3-ch0-supply = <&vreg_l25a_3p3>;
> +};
> diff --git a/arch/arm64/boot/dts/qcom/msm8998-oneplus-dumpling.dts b/arch/arm64/boot/dts/qcom/msm8998-oneplus-dumpling.dts
> new file mode 100644
> index 000000000000..b46214a32478
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/msm8998-oneplus-dumpling.dts
> @@ -0,0 +1,25 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * OnePlus 5T (dumpling) device tree
> + *
> + * Copyright (c) 2021, Jami Kettunen <jamipkettunen@gmail.com>
> + */
> +
> +#include "msm8998-oneplus-common.dtsi"
> +
> +/ {
> +	model = "OnePlus 5T";
> +	compatible = "oneplus,dumpling", "qcom,msm8998";
> +	/* Required for bootloader to select correct board */
> +	qcom,board-id = <8 0 17801 43>;
> +};
> +
> +/* Update the screen height values from 1920 to 2160 on the 5T */
> +&framebuffer0 {
> +	height = <2160>;
> +};
> +
> +/* Adjust digitizer area height to match the 5T's taller panel */
> +&rmi4_f12 {
> +	touchscreen-y-mm = <137>;
> +};
> -- 
> 2.30.1
> 
