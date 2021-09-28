Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8E7541A5D3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Sep 2021 05:01:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238673AbhI1DC4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Sep 2021 23:02:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238655AbhI1DCz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Sep 2021 23:02:55 -0400
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31E00C061575
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Sep 2021 20:01:17 -0700 (PDT)
Received: by mail-ot1-x331.google.com with SMTP id l16-20020a9d6a90000000b0053b71f7dc83so27184903otq.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Sep 2021 20:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=FHuHO2He2woiAxdN++JqYcpf3pYVN/DIGyfNIKeTVbA=;
        b=B7T/YnyhBbGZ0d4ZYsouWc6sQWQXW4xXSkWxQNzYcbUYxZzTLb7IOzT2MUoxR0c9hW
         ynAmZa6ebozVZGq2RAhxhoEf9VXU/mPih0yTdJRzSxY0fmneF903RWGTCNqiLFIUus8+
         Cyx8+31z96OTJP+UWoIP90oArU+Ff/7Ipglk+49pGmhmh30qABnMrHLtBKa4L1bEzWpF
         9rVxD8qiFmPaWdzcQC99ez99YG1WS54uxu7qHBuO8h3cLaImJwAkyPy82m+TLRApIGF+
         wVjto9/AKTfOA8SID7CKJHu2epUlyrS7fgw/TO4yKCYWbYxfGLd6EdUbDEvFpgM1aKWC
         q0xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=FHuHO2He2woiAxdN++JqYcpf3pYVN/DIGyfNIKeTVbA=;
        b=oS+71wuKyHJ5V6xGBwrve/TXdCGoNsR+u0GiLh1r0JJdIlm3MxeR0oC3a38lv6AlxW
         lxf/KX1OdW1QFyGObIcITh2P5SCmtT5OZSuSR/Bn3ImLVqSGmBcbOFjpHOvvb8zuIxM/
         2EixGF0bJx6ghezLZ5jgrFbNj2ZZr6gPxmRu6Jq2Q1NDqrgAOpbnvehkRr4pqzoqPNRR
         KpJVH0FN3MNNPQhzWyJ7zxF7frcB2m0qI6eOMVr+weJX8yAXftX7nnr1Z1+UKIObN0+U
         R/rDv60VgHZx8gRdFFwfiuWF0gL6ApVH4G+B7DCItrAwORD6GCPyzOH4tT6/7C/DgCp7
         oitQ==
X-Gm-Message-State: AOAM532OBgYpA32epNHMEMfM/fPl1aJtxj2tg3d3MsdtVNKjsxAlj6zw
        WFGu3o+0z375k2eRT03Lg6xAd9cxKituzw==
X-Google-Smtp-Source: ABdhPJzPYOMVbGt6/MeLS6xjKOPREgFzY3eMKxMnBbOCa4vN9OqrjLQH3zhaeqW2XaG3ThSUBR2low==
X-Received: by 2002:a05:6830:1018:: with SMTP id a24mr3122576otp.300.1632798076361;
        Mon, 27 Sep 2021 20:01:16 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id s29sm1774405otg.60.2021.09.27.20.01.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Sep 2021 20:01:16 -0700 (PDT)
Date:   Mon, 27 Sep 2021 22:01:14 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     linux-arm-msm@vger.kernel.org, agross@kernel.org,
        kernel@gpiccoli.net
Subject: Re: [PATCH] arm64: dts: qcom: db820c: Improve regulator voltage
 range and mark it as always-on
Message-ID: <YVKFeqpe/sWj3h6K@builder.lan>
References: <20210927163745.2066610-1-gpiccoli@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210927163745.2066610-1-gpiccoli@igalia.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 27 Sep 11:37 CDT 2021, Guilherme G. Piccoli wrote:

> Commit 2317b87a2a6f ("arm64: dts: qcom: db820c: Add vdd_gfx and tie it into mmcc")
> introduced this voltage regulator which seems to be essential for the GPU,
> according to the board schematics [0]. The problem is that such commit sets
> the regulator min/max voltage range to a static value, which is a bit lower than
> the range supported to such regulator [1]. With that, the GPU is not stable
> as per my experiments (in a Dragonboard 820c-based board) - I've observed
> sudden reboots into a FW bad state.
> 

The regulator range described in the datasheet and in the regulator
driver defines what the PMIC can do, the dts refines this to a range
that it suitable for this particular board. So it's expected to be more
narrow.

The problem with vdd_gfx is that we don't have anything voting for an
actual voltage, so you will either continue to run with whatever voltage
we got from the power-on state (or bootloader), or
regulator-min-microvolt. Until someone could come up with this support
0.98V seems to have been picked as some good enough number...


The right thing would be to ensure that the voltage is scaled with the
GPU clock, presumably with some reference from gpu_opp_table. This can
perhaps be done using static voltages, but should in the long run be
done by votes against the performance states exposed by the CPR block
attached to the vdd_gfx - which will then ensure that the voltage level
is adjusted as needed on a per-device basis.

> More than that, my experiment showed that this regulator must be set to
> always-on - this idea came from a commit in Linaro's tree, from Rajendra [2].

The regulator should be enabled whenever someone is voting for the
GPU_GX_GDSC power domain of mmcc. Question is why this isn't enough.

> With the voltage range updated plus set as always-on, the GPU is working
> correctly, in a stable fashion.
> 

Could you perhaps check /sys/kernel/debug/regulator/regulator_summary to
see the voltage level you get for your VDD_GFX when it works?

> [0] See page 9 (VDD_GFX), at
> https://www.96boards.org/documentation/consumer/dragonboard/dragonboard820c/hardware-docs/files/db820c-schematics.pdf
> 
> [1] See section 3.5.3 (FT-SMPS) in the "PMI8994/PMI8996 Power Management IC",
> at https://developer.qualcomm.com/download/sd820e/pmi8994pmi8996-power-management-ic-device-specification.pdf
> 
> [2] https://git.linaro.org/landing-teams/working/qualcomm/kernel.git/commit/?h=release/qcomlt-4.14&id=75fb43f3a62
> 
> Cc: Rajendra Nayak <rnayak@codeaurora.org>
> Cc: Vinod Koul <vkoul@kernel.org>
> Fixes: 2317b87a2a6f ("arm64: dts: qcom: db820c: Add vdd_gfx and tie it into mmcc")
> Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>
> ---
> 
> Hi Andy/Bjorn/all, this patch was tested in 5.14, but I've tested it
> in the linux-next tree as well and was able to apply there cleanly.
> I'm new in the DTS world, so my apologies in advance for any rookie
> mistake - suggestions are appreciated! Thanks in advance for the review,
> 

No need to apologize, the patch itself looks really good and nice to see
that you tested it on both v5.14 and linux-next!

> 
> Guilherme
> 
> 
>  arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
> index 51e17094d7b1..977842068619 100644
> --- a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
> +++ b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
> @@ -699,8 +699,11 @@ &pmi8994_spmi_regulators {
>  	vdd_gfx: s2@1700 {
>  		reg = <0x1700 0x100>;
>  		regulator-name = "VDD_GFX";
> -		regulator-min-microvolt = <980000>;
> -		regulator-max-microvolt = <980000>;
> +		regulator-min-microvolt = <350000>;
> +		regulator-max-microvolt = <1350000>;
> +		regulator-always-on;
> +		status = "okay";

status = "okay" is the default value, so unless you want to disable a
node in the dtsi by default, or override it to "okay" when it was
previously disabled, there's no need to provide "status" here.

> +

And this empty line is undesirable.


So to summarize, I do think there might be cases where your patch
lowers the GPU voltage from 0.98V to 0.35V, which would result in a sad
outcome. I think we should try to plug some voltages into gpu_opp_table,
but perhaps we need to look into CPR to figure out what those voltages
should be?

Regards,
Bjorn

>  	};
>  };
>  
> -- 
> 2.33.0
> 
