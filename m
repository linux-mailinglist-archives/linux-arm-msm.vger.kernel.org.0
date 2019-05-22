Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D54225C2C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 May 2019 05:30:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728221AbfEVDao (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 May 2019 23:30:44 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:46565 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728099AbfEVDao (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 May 2019 23:30:44 -0400
Received: by mail-pg1-f195.google.com with SMTP id o11so365100pgm.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 May 2019 20:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Du1Br0cmErddghQYkfGNqWduGZdP1qnPtvK0AlfzZMQ=;
        b=zBH+9e+oPLwAxt2JtsA9dx6xUT33mOnftRieb1rDok9y1s+4QuNYB4P5VVkTlaQF7+
         ETYvQRegJLTfVmBWv+dw3zG3HmmWhTUotA2HqPt/Abzgnsi9hKQJVKUv0WCbreywuKFr
         4eAQA3kXXw0f1NMwBgSVMZAoPTaMbCBLj5SKLa2jp/QVdjsyck27q3K18Nq3hmFtWoTs
         mTgLihzn2iXHGL6PW0A5CIErqKwHt9g2fLOClzkc1Pxh9NpgcKfd2Jc5lr6cIrCOUd4m
         sUcXkdZTeMdyXMTGUADmjvG/pKJN12sEGJgX7iqsimfqiS7R7WzSKEpk8ni8yk+mI1X/
         rBCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Du1Br0cmErddghQYkfGNqWduGZdP1qnPtvK0AlfzZMQ=;
        b=epaHevsq0y98WWePdj8gnvlaeVbFsgE9/ryZkQ8hrrLiecOqHYsfILapd5iV7dOsMl
         Y8O/oLGQulFEjSR2Yw/8oVS1qjcZPntrd4oV6fJifBafTseDslxriCwpyeJCgSz4Fq62
         Ke96oSvbzcY62HQ9zzgAYwXcmR4S1jcZWVbxg2RKXVpRrwGyU0+Ry3G5UxA0iBLjWKx6
         6u531Y8RnrS2+la3O1QgY6J3efiJ0stIF6ZhYeBDKsVqp8UK5+/O9CaI1xgVezzhutw9
         jbCyAueeNlPLwsulMUb9gq1n3+gdijQFjRcgAnqADKuFG6X0HDozZtyCcr9uOVw9ZO6y
         KEhQ==
X-Gm-Message-State: APjAAAVydHvExhWPUTjmZkzHULFJ8OhME827sWBBu2i2JRl0U6ZP9hM3
        /OtUz1Rg+hVuDk8eHeq8i09W+Q==
X-Google-Smtp-Source: APXvYqxae4rVMiE6ukYJvShXDC88FepHsu9A4+YT044cewTqpM6UmU5wtJttPoq6ctid6Q7KviFvfQ==
X-Received: by 2002:a63:4c15:: with SMTP id z21mr43284759pga.395.1558495843573;
        Tue, 21 May 2019 20:30:43 -0700 (PDT)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id c127sm36802714pfb.107.2019.05.21.20.30.42
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 May 2019 20:30:42 -0700 (PDT)
Date:   Tue, 21 May 2019 20:30:40 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Amit Kucheria <amit.kucheria@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org, niklas.cassel@linaro.org,
        marc.w.gonzalez@free.fr, sibis@codeaurora.org,
        daniel.lezcano@linaro.org, Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        Li Yang <leoyang.li@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/9] arm64: dts: qcom: msm8916: Add entry-method
 property for the idle-states node
Message-ID: <20190522033040.GJ3137@builder>
References: <cover.1558430617.git.amit.kucheria@linaro.org>
 <0374669560d13bba30dfa33cd10a0ad8a65b604b.1558430617.git.amit.kucheria@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0374669560d13bba30dfa33cd10a0ad8a65b604b.1558430617.git.amit.kucheria@linaro.org>
User-Agent: Mutt/1.10.0 (2018-05-17)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 21 May 02:35 PDT 2019, Amit Kucheria wrote:

> The idle-states binding documentation[1] mentions that the
> 'entry-method' property is required on 64-bit platforms and must be set
> to "psci".
> 
> [1] Documentation/devicetree/bindings/arm/idle-states.txt (see
> idle-states node)
> 
> Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> Reviewed-by: Niklas Cassel <niklas.cassel@linaro.org>
> Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>

Picked up

Regards,
Bjorn

> ---
>  arch/arm64/boot/dts/qcom/msm8916.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> index 0803ca8c02da..82ea5b8b37a2 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> @@ -158,6 +158,8 @@
>  		};
>  
>  		idle-states {
> +			entry-method = "psci";
> +
>  			CPU_SPC: spc {
>  				compatible = "arm,idle-state";
>  				arm,psci-suspend-param = <0x40000002>;
> -- 
> 2.17.1
> 
