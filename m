Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65170CDB98
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2019 07:48:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727010AbfJGFsG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Oct 2019 01:48:06 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:43716 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726984AbfJGFsG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Oct 2019 01:48:06 -0400
Received: by mail-pg1-f196.google.com with SMTP id i32so197555pgl.10
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Oct 2019 22:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=5tzoF5jEWBGYn2YEncgp+nUwEVI8tjzoOCexGDe1hVc=;
        b=iWm2gbrxXJtQbLIiHmiKtOzlK0kdACMqzvNyCI0Bvt31xz+eLXkAX3gfjASqtsyxd2
         pibAMwyUux/rIge9wN9ApuhvjHkiHSb6pKraakhzlhJbh8JgeyELWbZL3PIl53pLUXyM
         iC4fFVNWHchNI0Y9vRlKepoKrk43B7Q/GtfRWIqXe+L/euPWh53pNl7YkRPu2Px87Ijb
         ti4S14CzINDFcQoHtWJxeSosRNR3kd6DjPJfm/4b+LrhRudNDYrseCHJvA0sPBhBVIts
         zkUet9HlTvXp/wvmIvi/ZrzCOh/d/RQI2xYxO0LV3j4KYxlVl9xwzjWI37g1ahIIy/6B
         m2Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=5tzoF5jEWBGYn2YEncgp+nUwEVI8tjzoOCexGDe1hVc=;
        b=lK27zn+QLmTpgpzpfAIhONjwVSCpeYFx6y4tkQaRij39KnVhGxDOXUmAhrLBsA0JpM
         c8rlumbmmiQgj+BmUN9xPSwqTvhDB+vUBtxrzvfbtLIy9urHejhDumHanVWpJcuAjatC
         kx+XTlzoBjGsXFhaSiieV4JzHs6+itQjWKyeyOXWm88xM5MjsZwfBCFj3KfyIph1SEbN
         Zxk4AqXVzs1rrlHIFNpw+cIkePV8OUvrx/mjzt9UxnPTI9DdrLi+2hp8dc027eLEAh+l
         ktxMpEc3C/8TC7s8lfjeMijdLapxRAwnwrFrtT1XtPFUUGth+EKQJFkLTOKuM64lSebl
         Pf4Q==
X-Gm-Message-State: APjAAAVGn5gvUbKrknIX/WsYrR2DscB05Aix7g/0RBSc/mqH3f6mcG6e
        cf5IeLpiL1oO2UiODv7xp+mJdA==
X-Google-Smtp-Source: APXvYqx8wMELgRKaVDfwPVaxFK4vskD26Isa8VG9p6kFK7Fr+X+pG18Z3YrxVjib5kmWx8LxnhwKbg==
X-Received: by 2002:a65:504c:: with SMTP id k12mr16046935pgo.252.1570427285224;
        Sun, 06 Oct 2019 22:48:05 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id u7sm5730980pfn.61.2019.10.06.22.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2019 22:48:04 -0700 (PDT)
Date:   Sun, 6 Oct 2019 22:48:01 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Brian Masney <masneyb@onstation.org>
Cc:     robdclark@gmail.com, sean@poorly.run, a.hajda@samsung.com,
        Laurent.pinchart@ideasonboard.com, airlied@linux.ie,
        daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, jonathan@marek.ca,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH RFC v2 3/5] ARM: dts: qcom: pm8941: add 5vs2 regulator
 node
Message-ID: <20191007054801.GH6390@tuxbook-pro>
References: <20191007014509.25180-1-masneyb@onstation.org>
 <20191007014509.25180-4-masneyb@onstation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191007014509.25180-4-masneyb@onstation.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun 06 Oct 18:45 PDT 2019, Brian Masney wrote:

> pm8941 is missing the 5vs2 regulator node so let's add it since its
> needed to get the external display working. This regulator was already
> configured in the interrupts property on the parent node.
> 
> Note that this regulator is referred to as mvs2 in the downstream MSM
> kernel sources.
> 
> Signed-off-by: Brian Masney <masneyb@onstation.org>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Picked this patch for now, once the driver updates are landed I will
take the last two dts patches.

Regards,
Bjorn

> ---
> Changes since v1:
> - None
> 
>  arch/arm/boot/dts/qcom-pm8941.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom-pm8941.dtsi b/arch/arm/boot/dts/qcom-pm8941.dtsi
> index f198480c8ef4..c1f2012d1c8b 100644
> --- a/arch/arm/boot/dts/qcom-pm8941.dtsi
> +++ b/arch/arm/boot/dts/qcom-pm8941.dtsi
> @@ -178,6 +178,16 @@
>  				qcom,vs-soft-start-strength = <0>;
>  				regulator-initial-mode = <1>;
>  			};
> +
> +			pm8941_5vs2: 5vs2 {
> +				regulator-enable-ramp-delay = <1000>;
> +				regulator-pull-down;
> +				regulator-over-current-protection;
> +				qcom,ocp-max-retries = <10>;
> +				qcom,ocp-retry-delay = <30>;
> +				qcom,vs-soft-start-strength = <0>;
> +				regulator-initial-mode = <1>;
> +			};
>  		};
>  	};
>  };
> -- 
> 2.21.0
> 
