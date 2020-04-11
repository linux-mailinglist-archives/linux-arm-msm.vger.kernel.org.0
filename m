Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 21A331A4D53
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2020 03:38:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726654AbgDKBi1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Apr 2020 21:38:27 -0400
Received: from mail-pj1-f65.google.com ([209.85.216.65]:50813 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726678AbgDKBiY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Apr 2020 21:38:24 -0400
Received: by mail-pj1-f65.google.com with SMTP id b7so1406150pju.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2020 18:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=swcitsqOrp58FORQR6T5KNfMtaqgZ3ciuAXDoS3Hbqo=;
        b=PuxOgWKDl1hgeYSMVpjOVmwtTETL3LXwNZADwUOqPmnBYuhipAD2GY8W6C5ReWqEvx
         Z+W6Bv+9WKGL2PfJo9IAtujh9iieBrSf+U8mM+/b3D0o66miYllbwPB4YqmUq9+U8HQF
         JbbWx5lC91J/G7oZPDRfMXNopsd4hcagAyzq6zGujyq4Hh639JIDkI+/9e27Q6iG++HA
         I1NqSwaE51xW6YOWuHftsR0L15rIjCxdKQBEAVuJl7f0XDNXF3m7CDx4Y+Cm/+GnsNeC
         JJXmqIhc53suaJYWR+7c9SvSd3IGDHwzzEu1Pdx8mh06pwZd+rZON9qkbM970HOnUShP
         DOZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=swcitsqOrp58FORQR6T5KNfMtaqgZ3ciuAXDoS3Hbqo=;
        b=aKyVAOsFVqrpZBcG4pHK9O7iCpm1TFfPlzvTfsu489RPvN1zaHeEFubO28XwbWsZdP
         xDjiVI2H/3YqSY/jC0xmC/oe4xagpW57bMX694qBLihIfrfsu9mI3WYIR3h9qxKrbr35
         XJoZwVH/uDjX0f+65XuoVpSOxBrnGmRAf29mgrHEJO7v9lmCIkqEtNoJPrOBD1smvZCz
         2cVlXT6qk/VLKQeU5WihRU5JVU3bRBXE8AA2xbq6uKuM11lRWNQJw2Fg38RsHq4S/Wd0
         5GClqt0tzSJscY+DAmjBL/VaREhp2BCXvXmpTcWx4ox0lFTDQTVIZs/BocBFcBBU0bfT
         6k0g==
X-Gm-Message-State: AGi0PuanxWUafPmB0Vib23YtEYKO3AbcMeySWCFSvrtcREeUHE2fqsj8
        +JEBPtb2rMuFliIUBXr+FEoMaA==
X-Google-Smtp-Source: APiQypJ0hK8rOYfRRiqeUhwUyZ3mwi2rgoHu5r2CQteEA4e2TZZYQ4yTZm1FMIjHH84L6jDIce6XwA==
X-Received: by 2002:a17:90a:c708:: with SMTP id o8mr7232843pjt.190.1586569103585;
        Fri, 10 Apr 2020 18:38:23 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id u10sm2825089pjd.13.2020.04.10.18.38.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2020 18:38:23 -0700 (PDT)
Date:   Fri, 10 Apr 2020 18:38:33 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Iskren Chernev <iskren.chernev@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Daniele Debernardi <drebrez@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 5/6] ARM: dts: qcom: msm8974-klte: Remove inherited
 vreg_boost node
Message-ID: <20200411013833.GI576963@builder.lan>
References: <20200410023203.192048-1-iskren.chernev@gmail.com>
 <20200410023203.192048-6-iskren.chernev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200410023203.192048-6-iskren.chernev@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 09 Apr 19:32 PDT 2020, Iskren Chernev wrote:

> From: Daniele Debernardi <drebrez@gmail.com>
> 
> The Samsung klte does not have a vreg_boost node. vreg_boost also
> depends on pm8941-gpio which are not present on the klte.
> 

May I ask what PMICs this device actually has, if it doesn't have a
PM8941 GPIO?

Regards,
Bjorn

> Signed-off-by: Daniele Debernardi <drebrez@gmail.com>
> Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
> ---
>  arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts b/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
> index de0bf6b7e732..ad26c83fee81 100644
> --- a/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
> +++ b/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
> @@ -1,7 +1,5 @@
>  // SPDX-License-Identifier: GPL-2.0
>  #include "qcom-msm8974pro.dtsi"
> -#include "qcom-pm8841.dtsi"
> -#include "qcom-pm8941.dtsi"
>  #include "qcom-pma8084.dtsi"
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/input/input.h>
> @@ -196,6 +194,8 @@ l27 {
>  			};
>  		};
>  	};
> +
> +	/delete-node/ vreg-boost;
>  };
>  
>  &soc {
> -- 
> 2.26.0
> 
