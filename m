Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D46846E304
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Dec 2021 08:13:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232171AbhLIHRa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Dec 2021 02:17:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232101AbhLIHR3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Dec 2021 02:17:29 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC6BEC061746
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Dec 2021 23:13:56 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 4F4EEB823BF
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Dec 2021 07:13:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29082C341C3;
        Thu,  9 Dec 2021 07:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639034034;
        bh=KVyJqYLC0Jq4xEDs+GKSjnFSo1blIp+bjpWv6b4k1Bs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VwnwMuYyHE0RhpXvpGfmBJkjIvLZrg/O8eEA2CI5wFwCqtT2UqjxYjyFErUuEf7xK
         p6V35GB9gTlF1Pm2N2U27C6Lzfqc4zzReSpKVc6OgdPuc99/t++qSc38s0D7cVOiXX
         CS9cZ4qTI9NkHEL4a0vVQcDKA8zEd8ZsK/CqOSQhl3igsijWPgO26FQHANuuXbhxhj
         2N4dR+e25Yn6nQmqb7VCkQJ9R4fDsPsTEOc52YvL+/N/uJwx3xSTNGcEXBaLZbbIm8
         +xfVckGLmS01m00k39zQ5520ibtllOOqwmMsHMtBIlrv9lg5arwWAzp6v+ENO8uafp
         XrVI9rorDDM/A==
Date:   Thu, 9 Dec 2021 12:43:50 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 15/15] arm64: dts: qcom: sm8450: add i2c13 and i2c14
 device nodes
Message-ID: <YbGsrqxC6cSGqjZ+@matsya>
References: <20211201072915.3969178-1-vkoul@kernel.org>
 <20211201072915.3969178-16-vkoul@kernel.org>
 <ee38afe9-0e9e-cae1-c4c5-70db9f166a38@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ee38afe9-0e9e-cae1-c4c5-70db9f166a38@somainline.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01-12-21, 16:30, Konrad Dybcio wrote:
> 
> On 01.12.2021 08:29, Vinod Koul wrote:
> > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >
> > Add device tree nodes for two i2c blocks: i2c13 and i2c14.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > ---
> >  arch/arm64/boot/dts/qcom/sm8450.dtsi | 64 ++++++++++++++++++++++++++++
> >  1 file changed, 64 insertions(+)
> >
> [...]
> 
> 
> >  		config_noc: interconnect@1500000 {
> >  			compatible = "qcom,sm8450-config-noc";
> >  			reg = <0 0x01500000 0 0x1c000>;
> > @@ -687,6 +725,32 @@ tlmm: pinctrl@f100000 {
> >  			gpio-ranges = <&tlmm 0 0 211>;
> >  			wakeup-parent = <&pdc>;
> >  
> > +			qup_i2c13_default_state: qup-i2c13-default-state {
> > +				mux {
> > +					pins = "gpio48", "gpio49";
> > +					function = "qup13";
> > +				};
> > +
> > +				config {
> > +					pins = "gpio48", "gpio49";
> > +					drive-strength = <2>;
> > +					bias-pull-up;
> > +				};
> > +			};
> > +
> 
> This should be collapsed into:
> 
> 
> qup_i2c13_default_state: qup-i2c13-default-state {
> 
>         pins = "..."
> 
>         function = "..."
> 
>         drive-strength = <2>
> 
>         bias-pull-up;
> 
> };
> 
> 
> And the same goes for the rest of the pins.

Yeah that looks neater and done that now

-- 
~Vinod
