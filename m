Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BCBA44DDF6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2019 02:01:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725936AbfFUABY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Jun 2019 20:01:24 -0400
Received: from onstation.org ([52.200.56.107]:55740 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725905AbfFUABY (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Jun 2019 20:01:24 -0400
Received: from localhost (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id 2D4FF3E9C9;
        Fri, 21 Jun 2019 00:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1561075283;
        bh=HioIi7Zf7bcx4llI3gAto23W8JISs2Ta/a56m7blXz4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BP3OdbcJGD+jb7E8+lWiz2jM+4ibZUxFoxLdp4sRCI0wGnSCcqct8+ty1wllF9cLA
         afsAtwvbjHeXUoVFvnj1gNdPezng2V4QEJv3ENLuzqX+zXYcWqudBhCLXMdv9joLJh
         rXgX30CVhXMvIucRCGNz4/qsLxSCo7wVQIUV89U0=
Date:   Thu, 20 Jun 2019 20:01:22 -0400
From:   Brian Masney <masneyb@onstation.org>
To:     Luca Weiss <luca@z3ntu.xyz>
Cc:     linux-arm-msm@vger.kernel.org,
        ~martijnbraam/pmos-upstream@lists.sr.ht,
        Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: msm8974-FP2: add reboot-mode node
Message-ID: <20190621000122.GA13036@onstation.org>
References: <20190620225824.2845-1-luca@z3ntu.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190620225824.2845-1-luca@z3ntu.xyz>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Luca,

On Fri, Jun 21, 2019 at 12:58:24AM +0200, Luca Weiss wrote:
> This enables userspace to signal the bootloader to go into the
> bootloader or recovery mode.
> 
> The magic values can be found in both the downstream kernel and the LK
> kernel (bootloader).
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
> Sidenote: Why are there no userspace tools to be found that support
> this? Anyways, we have one now in postmarketOS :)
> 
>  arch/arm/boot/dts/qcom-msm8974-fairphone-fp2.dts | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom-msm8974-fairphone-fp2.dts b/arch/arm/boot/dts/qcom-msm8974-fairphone-fp2.dts
> index 643c57f84818..f86736a6d77e 100644
> --- a/arch/arm/boot/dts/qcom-msm8974-fairphone-fp2.dts
> +++ b/arch/arm/boot/dts/qcom-msm8974-fairphone-fp2.dts
> @@ -338,6 +338,20 @@
>  			};
>  		};
>  	};
> +
> +	imem@fe805000 {
> +		compatible = "syscon", "simple-mfd";
> +		reg = <0xfe805000 0x1000>;
> +
> +		reboot-mode {
> +			compatible = "syscon-reboot-mode";
> +			offset = <0x65c>;
> +
> +			mode-normal	= <0x77665501>;
> +			mode-bootloader	= <0x77665500>;
> +			mode-recovery	= <0x77665502>;
> +		};
> +	};
>  };

I think that it makes sense to put this snippet in qcom-msm8974.dtsi
with a status of disabled, and then enable it in
qcom-msm8974-fairphone-fp2.dts like so:

imem@fe805000 {
	status = "ok";
};

What's the pmOS utility that utilizes this? I'll test it on the Nexus 5.

Thanks,

Brian
