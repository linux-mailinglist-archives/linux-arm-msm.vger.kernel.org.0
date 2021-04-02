Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2CE73529C9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Apr 2021 12:32:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234788AbhDBKcb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Apr 2021 06:32:31 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.54]:30617 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229605AbhDBKc3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Apr 2021 06:32:29 -0400
X-Greylist: delayed 853 seconds by postgrey-1.27 at vger.kernel.org; Fri, 02 Apr 2021 06:32:29 EDT
ARC-Seal: i=1; a=rsa-sha256; t=1617359528; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=FPSSpG+MVQli7ePryvGW+Oo/I0dBjfL9hLU8bJ+c2m5hABaZDQuyvkuUTDSqP2cXec
    5JO34V4Z3XZVAGYnaxREFPnPWq7pmqfhZEmpsp0LEvEVXMJ7oj6a7YEr9LtpMhlo+Cjw
    ZeIej/kthdnS4soFQ8tfCdgkF8WWUg1/E9dTNqK49vGL2AVr5FGGWKsSnTvsC42upbIV
    hwlCHYuuw+GVF+J5CVnEidO3zKCbNvzcDaVioB458IGLAWZaAJyUX2PeJw5pf+BLh1/x
    j1o+3X+nnRj3tKCOSkf7hMig0oC/7pa4mKszeaYO6dEgi2dOtSk09VNoig58xfZZkoOR
    epMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1617359528;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=/RLjeiTGsAL2F3PsEpvQHXAR52emwi+CSPIQsS5l1Ek=;
    b=RSa1skwwrm0jbzIvFd8Bh829Bh1XzuphVHC39s5GEkoWKPnh4dvUuEfOzehVZQNgE8
    XkQwpeM8jaHCpWWhi8dSHd2sohMooZ2fq1TwFCCA8jXOm25qy9cfsEVAxUalolchaAob
    sAkT6yDRHTwIY6iv37cK4+YyuAoxWGEDjSu/d4F+9kRt1RoLkmhCHsOWujf2UzUA1iyr
    zWcPBtixIJ+yzF+3XgynXb2fy7Gw0EuyUTNmfqqidCIQ8jmJts5jTRTgmZbZmYilo1bt
    b71dM2JgGPwWrKFRRI3ZVSus6pxejU1Vbrwlg3jcmLxx8IpRtPGwkmX7ypT3Lb11UJND
    WZCQ==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1617359528;
    s=strato-dkim-0002; d=gerhold.net;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=/RLjeiTGsAL2F3PsEpvQHXAR52emwi+CSPIQsS5l1Ek=;
    b=FIwAlb7bORDEWvpp55amm/wFte0K3JuvFLdBp9yqoZj0ga2VspZxhdeaN04FQObbTv
    oflo5D5mRlRf8tIXE9OpI6pOXKsfnXNB2bbVY0UiLuGY5qR0jPWdp6T68mB/bS4ddg+u
    kB9ilc+vo47wXYcDN2jn+oJ4f75+eRLAOIkm3bE3k0ESUx6zTc0cnT1BmZbQz1fN15BR
    6k6OvtY7uDSWO1Ljv/T/KVswNCYoVjALWAmWu/oFE8VazIlAKlgIHhvPGzuOSiMM7X+S
    jENafn6ZlYrLVI6cEc225FZpASffm0H57a/f7N0sw2zWpb9C+qPX0P5KmfgYskZRoNpC
    oE+g==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u26zEodhPgRDZ8j9Ic/GaYo="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
    by smtp.strato.de (RZmta 47.23.1 DYNA|AUTH)
    with ESMTPSA id q0a3c1x32AW8zfR
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Fri, 2 Apr 2021 12:32:08 +0200 (CEST)
Date:   Fri, 2 Apr 2021 12:32:02 +0200
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Leo Yan <leo.yan@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Coresight ML <coresight@lists.linaro.org>,
        Georgi Djakov <georgi.djakov@linaro.org>
Subject: Re: [PATCH v3] arm64: dts: msm8916: Enable CoreSight STM component
Message-ID: <YGbyonw8mRd8tI8O@gerhold.net>
References: <20210321124212.4253-1-leo.yan@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210321124212.4253-1-leo.yan@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Mar 21, 2021 at 08:42:12PM +0800, Leo Yan wrote:
> From: Georgi Djakov <georgi.djakov@linaro.org>
> 
> Add DT binding for CoreSight System Trace Macrocell (STM) on msm8916,
> which can benefit the CoreSight development on DB410c.
> 
> Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
> Signed-off-by: Leo Yan <leo.yan@linaro.org>

Thanks for sending the new patch so quickly!

The changes look good to me but I cannot really say if they are fully
correct or work correctly. (Actually I have no idea how to use coresight
or how it is useful! :D)

FWIW:
Acked-by: Stephan Gerhold <stephan@gerhold.net>

> ---
> 
> Changes from v2:
> * Correct for author name.
> 
> Changes from v1:
> * alphabetically and address ordering for DT node; pad addresses with
>   zeroes (Stephan Gerhold).
> 
>  arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi |  1 +
>  arch/arm64/boot/dts/qcom/msm8916.dtsi     | 27 +++++++++++++++++++++++
>  2 files changed, 28 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
> index 3a9538e1ec97..2165b7415add 100644
> --- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
> +++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
> @@ -410,6 +410,7 @@ &wcd_codec {
>  &funnel0 { status = "okay"; };
>  &funnel1 { status = "okay"; };
>  &replicator { status = "okay"; };
> +&stm { status = "okay"; };
>  &tpiu { status = "okay"; };
>  
>  &smd_rpm_regulators {
> diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> index 402e891a84ab..f02b976480d5 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> @@ -489,6 +489,26 @@ snoc: interconnect@580000 {
>  				 <&rpmcc RPM_SMD_SNOC_A_CLK>;
>  		};
>  
> +		stm: stm@802000 {
> +			compatible = "arm,coresight-stm", "arm,primecell";
> +			reg = <0x00802000 0x1000>,
> +			      <0x09280000 0x180000>;
> +			reg-names = "stm-base", "stm-stimulus-base";
> +
> +			clocks = <&rpmcc RPM_QDSS_CLK>, <&rpmcc RPM_QDSS_A_CLK>;
> +			clock-names = "apb_pclk", "atclk";
> +
> +			status = "disabled";
> +
> +			out-ports {
> +				port {
> +					stm_out: endpoint {
> +						remote-endpoint = <&funnel0_in7>;
> +					};
> +				};
> +			};
> +		};
> +
>  		/* System CTIs */
>  		/* CTI 0 - TMC connections */
>  		cti0: cti@810000 {
> @@ -562,6 +582,13 @@ funnel0_in4: endpoint {
>  						remote-endpoint = <&funnel1_out>;
>  					};
>  				};
> +
> +				port@7 {
> +					reg = <7>;
> +					funnel0_in7: endpoint {
> +						remote-endpoint = <&stm_out>;
> +					};
> +				};
>  			};
>  
>  			out-ports {
> -- 
> 2.25.1
> 
