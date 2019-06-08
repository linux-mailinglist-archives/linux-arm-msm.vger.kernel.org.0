Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5C12939A6A
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Jun 2019 05:51:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732332AbfFHDvG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Jun 2019 23:51:06 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:37722 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731161AbfFHDvG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Jun 2019 23:51:06 -0400
Received: by mail-pf1-f194.google.com with SMTP id 19so1394486pfa.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Jun 2019 20:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=IzVl5hZC8i4hei2lB4B7NGvZFOFsdZTFEiwkTZdNcbI=;
        b=zbm4x2IQkkYxrWv2IeE0ppaapAoezEstTyL/waMvEJf48eUcGb66KQkuRDgP0rCjmg
         7l5drrzOpjDnXq2S6r1kqEeRKF3JED1OfwZDuCi8Uxejc1mRxsPvSadhDPfJWkeL2C9i
         iywuh9w4eNWS3i0i2GHUU1xWuGF1bHV4Xwicm/fq8jsKbfb55r5Hbe6vCtojoae7sN6Q
         KSDdoYBO5GgiuaN/Fec0DXMB4wHwxoRGSLQrIfZj605T9U04WO+oeuyuS+SNIplKFvge
         SKmROS12EnVu8egM+TlTg5JOtdYsdQRNZnqFIp4Ox1r4xHyLbC+VEwECjNDTXmwfOj5q
         BfyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=IzVl5hZC8i4hei2lB4B7NGvZFOFsdZTFEiwkTZdNcbI=;
        b=RCp7jzmdfEDp6aU8promT7iqeBPlpeMYv10+W4LiVCyKXaYuiynhZpoDBIA8sAOdxH
         feqYNsyq9GkSyQO7RGGN1Gjfj61IGBB9OoBunWj+/gHXu25H8DGoCvtUKLlspv7GzyAq
         VMJ/LyMFin1iOdzKKt5ugG7cHkQddPNdnMimung+N4xBppO1HJI68lOkwwjJuQdDR5+I
         Km0ov4Oc8ejgVEO32VZRvFJ5mvQrGCIOI65s/vRJzm/PSyjxm3gVsicPgzSOUChyEsN2
         7zWSf41f7lVxL+1/ZLik9RoKUG+p8TWBy5XTwITWgEYSZitOYryIcTBoA/pYqwchYLy/
         6iWA==
X-Gm-Message-State: APjAAAUBxbZV+kO+U4dEgIcWlemTKw1mremS6OsWQLVT0CJ2gEdE45WT
        t4l2eLl23QguXImskaZhrln9IQ==
X-Google-Smtp-Source: APXvYqzv3Wi+b5fl0fYtshM8YZCs9iIWMwg5/dCaLo03hUwNyJHjJ6/OEMKN/nVc0NV5ckcKb0L1pw==
X-Received: by 2002:a62:1b0c:: with SMTP id b12mr60478869pfb.230.1559965845025;
        Fri, 07 Jun 2019 20:50:45 -0700 (PDT)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id m19sm7622094pff.153.2019.06.07.20.50.44
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Jun 2019 20:50:44 -0700 (PDT)
Date:   Fri, 7 Jun 2019 20:50:42 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Niklas Cassel <niklas.cassel@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, amit.kucheria@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: msm8996: fix PSCI entry-latency-us
Message-ID: <20190608035042.GI24059@builder>
References: <20190604122931.22235-1-niklas.cassel@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190604122931.22235-1-niklas.cassel@linaro.org>
User-Agent: Mutt/1.10.0 (2018-05-17)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 04 Jun 05:29 PDT 2019, Niklas Cassel wrote:

> The current entry-latency-us is too short.
> The proper way to convert between the device tree properties
> from the vendor tree to the upstream PSCI device tree properties is:
> 
> entry-latency-us = qcom,time-overhead - qcom,latency-us
> 
> which gives
> 
> entry-latency-us = 210 - 80 = 130
> 
> Fixes: f6aee7af59b6 ("arm64: dts: qcom: msm8996: Add PSCI cpuidle low power states")
> Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>

Thanks Niklas

Applied,
Bjorn

> ---
>  arch/arm64/boot/dts/qcom/msm8996.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> index b7cf2a17dcb5..e8c03b5c8990 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> @@ -174,7 +174,7 @@
>  				compatible = "arm,idle-state";
>  				idle-state-name = "standalone-power-collapse";
>  				arm,psci-suspend-param = <0x00000004>;
> -				entry-latency-us = <40>;
> +				entry-latency-us = <130>;
>  				exit-latency-us = <80>;
>  				min-residency-us = <300>;
>  			};
> -- 
> 2.21.0
> 
