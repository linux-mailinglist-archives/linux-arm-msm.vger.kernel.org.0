Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00D98419A4A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Sep 2021 19:06:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236153AbhI0RIM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Sep 2021 13:08:12 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:57260 "EHLO
        fanzine.igalia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236030AbhI0RHM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Sep 2021 13:07:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; s=20170329;
        h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:Subject; bh=U/wvgLLi41m18RNuqWjpTNZ1j3Iee5ygCK7QikzhmQI=;
        b=ehjomNjeRHeDwAM3pAbEpBO3dSKHbYD1adnhVgPiTW7u4mDahydMDn/fmVIjijydzqpEP1lW+/VMVf2OAOUiWes0MwdOOK/VywvnHfhyosr51vOhLlSDZE+fxLoGsdzNTtQVv3TRBw47vymbkpNJztrRs/+rctu6ANgIQnqMQrAUsQ+Tc/EOgd2fbgBkpDf0FNNzj9n6TVGudV2Tu5jgWs/3LVzMU7l+XZBlQYMfAAqRsprdyfACotr1MQ+aKveezfvX014VyhwQPxeFgx+t4mPMyvbVcylYUS9tRcTNOmdZPLuSjBOr2Yt40yuOuHS53Nme8fCw1RNbV1p0cyrIpw==;
Received: from [177.95.15.66] (helo=[192.168.1.64])
        by fanzine.igalia.com with esmtpsa 
        (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
        id 1mUtfA-0005rt-07; Mon, 27 Sep 2021 18:39:32 +0200
Subject: Re: [PATCH] arm64: dts: qcom: db820c: Improve regulator voltage range
 and mark it as always-on
Cc:     linux-arm-msm@vger.kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, kernel@gpiccoli.net,
        rnayak@codeaurora.org, vkoul@kernel.org
References: <20210927163745.2066610-1-gpiccoli@igalia.com>
From:   "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Message-ID: <1de7abe9-c809-952e-aab2-afedff411a83@igalia.com>
Date:   Mon, 27 Sep 2021 13:39:19 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210927163745.2066610-1-gpiccoli@igalia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 27/09/2021 13:37, Guilherme G. Piccoli wrote:
> Commit 2317b87a2a6f ("arm64: dts: qcom: db820c: Add vdd_gfx and tie it into mmcc")
> introduced this voltage regulator which seems to be essential for the GPU,
> according to the board schematics [0]. The problem is that such commit sets
> the regulator min/max voltage range to a static value, which is a bit lower than
> the range supported to such regulator [1]. With that, the GPU is not stable
> as per my experiments (in a Dragonboard 820c-based board) - I've observed
> sudden reboots into a FW bad state.
> 
> More than that, my experiment showed that this regulator must be set to
> always-on - this idea came from a commit in Linaro's tree, from Rajendra [2].
> With the voltage range updated plus set as always-on, the GPU is working
> correctly, in a stable fashion.
> 
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
> +
>  	};
>  };
>  
> 


Sorry, due to a git bad config, it supressed all CCs - adding them now!
