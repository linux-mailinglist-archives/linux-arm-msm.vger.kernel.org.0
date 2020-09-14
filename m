Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A10D2688B6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Sep 2020 11:45:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726303AbgINJp3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Sep 2020 05:45:29 -0400
Received: from mo4-p00-ob.smtp.rzone.de ([85.215.255.24]:16724 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726239AbgINJp2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Sep 2020 05:45:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1600076722;
        s=strato-dkim-0002; d=gerhold.net;
        h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=XRFqOPGjL8wggEcBctjIdnImU/A4E36qYOOqx+M8ZNg=;
        b=VUNLRXGN1tvVc0jadbWcBdG8Q4Xz0URaYLsd3f8lNm5ZhQRwzjJNPjA7PhkZxxUOr1
        /q3WPEaYrd8crGyMewLnCLBPzYED/bsUPsmsQEllQcPvmeHHBed6FeSoJplxeOH9yWwy
        9bgh2LbsD0GLc5pOSauVxKNu/YdboNFMyyTbpkPiV8GbeFcZSUn11xzv6JAxX3+AknUA
        y4kZeeM5iFMeEG4hVTKNJAfzlLzOv0UtLoMnFhrFLopI6FnR2wUzIJSvR9+eNqiBBzlk
        Pw/CaRwNt9JsUaofTCMFQKRDo1+FRxauweUhD6D6RNSO/yWQiBSOxAmtV8YZx4KhUwwm
        TUcg==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u26zEodhPgRDZ8j7IcfFBg=="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
        by smtp.strato.de (RZmta 46.10.7 DYNA|AUTH)
        with ESMTPSA id g0b6c1w8E9huht2
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Mon, 14 Sep 2020 11:43:56 +0200 (CEST)
Date:   Mon, 14 Sep 2020 11:43:41 +0200
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 00/10] Convert MSM8916 boards to use labels, reduce
 duplication
Message-ID: <20200914094341.GA1246@gerhold.net>
References: <20200720085406.6716-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200720085406.6716-1-stephan@gerhold.net>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bjorn,

On Mon, Jul 20, 2020 at 10:53:56AM +0200, Stephan Gerhold wrote:
> Board device trees for newer SoCs reference labels to override properties
> for components of the SoC. This patch series converts all MSM8916 boards to
> use the same style.
> 
> Additionally, in the second part of the series I attempt to reduce duplication
> within the MSM8916 board device trees a bit. If we keep copying a large number
> of properties to each and every board of a SoC then (in my opinion)
> it makes sense to consider if those can be shared in some include.
> 
> This will make it easier to add new boards in the future.
> 
> Stephan Gerhold (10):
>   arm64: dts: qcom: apq8016-sbc: Remove properties that are already
>     default
>   arm64: dts: qcom: msm8916: Declare sound node in msm8916.dtsi
>   arm64: dts: qcom: apq8016-sbc: Define leds outside of soc node
>   arm64: dts: qcom: msm8916: Add more labels
>   arm64: dts: qcom: msm8916: Use labels in board device trees
>   arm64: dts: qcom: pm8916: Add resin node
>   arm64: dts: qcom: msm8916: Move PM8916-specific parts to
>     msm8916-pm8916.dtsi
>   arm64: dts: qcom: msm8916: Move more supplies to msm8916-pm8916.dtsi
>   arm64: dts: qcom: msm8916: Set default pinctrl for blsp1_uart1/2
>   arm64: dts: qcom: msm8916: Move common USB properties to msm8916.dtsi
> 

It's been two months since I sent this series - are there any changes
I should make? Maybe you just overlooked it :)

Would be great to make some progress since I have a few more patch
series ready to send out that build on top of this one (some more
cleanup for MSM8916, converting MSM8916 to use rpmpd power domains, ...)

Thanks!
Stephan
