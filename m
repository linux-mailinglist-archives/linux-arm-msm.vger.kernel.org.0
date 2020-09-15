Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07A5A26B2CA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Sep 2020 00:53:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727384AbgIOWx2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Sep 2020 18:53:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727393AbgIOPjo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Sep 2020 11:39:44 -0400
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com [IPv6:2607:f8b0:4864:20::842])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AC4DC061221
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2020 08:38:59 -0700 (PDT)
Received: by mail-qt1-x842.google.com with SMTP id y11so3464001qtn.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2020 08:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=HC238Ige8DRb8ygAtnYFCL6nACxI3bOXmHHkEflAUkI=;
        b=kS8R9V2mdJvLcV9YbZYn94h6pcHob1/i65DmFV0rTmUFeBnMVwH1UwQ1e3RfuTRBr7
         Zh3eemuHz1S8S9a6kky4amFbSTof972VgE3Gn2JEzDPVwBbxIWmt/Jcscdu55bCn3eHl
         qB5AickfsqTZpO14l85evEOWKtuUu4m38QzYDlSyu9AHe3aXbqPX8ZBPj5jDI9tU0pST
         VVkGollQ97Hw6Gzi9acjW4ndP/vySxGJ7Es5F2Zg5H0RroFO5sSJw/XlyBoTgE3FF2DR
         6oGLMyC5uMT2xn5pi6UtTFLstk+Mh/pxrhdRuRdDG5iVV7YAtAVMsNG/xTsSdk4T/1Rt
         ewCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HC238Ige8DRb8ygAtnYFCL6nACxI3bOXmHHkEflAUkI=;
        b=bGHgICGrySmZDJX4OQ6n49CxNrA5VwwZJP9YWMTtkaSVVEBFRcfBdIIs7CMrn5n4XD
         IBKml88ha85Q/uTWGVxoA1k411saHFkdFNr5K7s+s8ve//pccaJCtCEfP0AO8aG5jdP4
         p4bBMGoR7UsZfAtqwe6EeD4UTIwCQsm2OgrM/0UTDwaSv83bAlHZ4vlMHoZPIHBpZVL8
         v858+36fl8tFhqxCgNCO8m2oUAScdOTb3bV3CjDjEfactHFK0a2f6ize1C0o2MtCcwCk
         QGzADlvjHG42BCNbYSW7J7UODn/0Rr/P10U83aQ5LlTyeP+PcxlwC0oQryXa7qCvfPSi
         +FAA==
X-Gm-Message-State: AOAM533B/WW++zxTMjKJzf6iNyCJRh+PV23OMn4171Tm9Z8uPA6PsW4d
        TzhAUaNp711AxARFd68uVjulIQ==
X-Google-Smtp-Source: ABdhPJzNq44unJ9cfA4NcVtVXuI98pXkT64mh9kNx76o1npSpbPUKHJCbfUfbVHS1n5Z6ufNIW+rZA==
X-Received: by 2002:ac8:76cb:: with SMTP id q11mr6175301qtr.63.1600184336642;
        Tue, 15 Sep 2020 08:38:56 -0700 (PDT)
Received: from uller (ec2-34-197-84-77.compute-1.amazonaws.com. [34.197.84.77])
        by smtp.gmail.com with ESMTPSA id x126sm18337154qka.91.2020.09.15.08.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2020 08:38:56 -0700 (PDT)
Date:   Tue, 15 Sep 2020 15:38:54 +0000
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Amit Kucheria <amit.kucheria@linaro.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 06/14] arm64: dts: qcom: msm8916: Drop qcom,tcsr-mutex
 syscon
Message-ID: <20200915153854.GE478@uller>
References: <20200915071221.72895-1-stephan@gerhold.net>
 <20200915071221.72895-7-stephan@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200915071221.72895-7-stephan@gerhold.net>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 15 Sep 07:12 UTC 2020, Stephan Gerhold wrote:

> The hwlock device node does not (directly) use memory resources
> of the SoC, so we should move it outside the "soc" node.
> 
> However, as of commit 7a1e6fb1c606 ("hwspinlock: qcom: Allow mmio usage
> in addition to syscon") we can now assign the memory region directly
> to the hwlock device node. This works because the register space
> used by it is actually separate and not used by any other components.
> 

A side-note on that...

In addition to the listed commit, it was also determined that the old
two-node split is prohibited and the DT binding was updated to deprecate
it.

So in the event of us having to also access registers from e.g. the
remoteproc driver (which 8916 doesn't doesn't do), we would have to use:

	compatible = "qcom,tcsr-mutex", "syscon";

Regards,
Bjorn

> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---
>  arch/arm64/boot/dts/qcom/msm8916.dtsi | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> index 003451ccf3ee..10e177988555 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> @@ -458,9 +458,10 @@ gcc: clock-controller@1800000 {
>  			reg = <0x1800000 0x80000>;
>  		};
>  
> -		tcsr_mutex_regs: syscon@1905000 {
> -			compatible = "syscon";
> +		tcsr_mutex: hwlock@1905000 {
> +			compatible = "qcom,tcsr-mutex";
>  			reg = <0x1905000 0x20000>;
> +			#hwlock-cells = <1>;
>  		};
>  
>  		tcsr: syscon@1937000 {
> @@ -468,12 +469,6 @@ tcsr: syscon@1937000 {
>  			reg = <0x1937000 0x30000>;
>  		};
>  
> -		tcsr_mutex: hwlock {
> -			compatible = "qcom,tcsr-mutex";
> -			syscon = <&tcsr_mutex_regs 0 0x1000>;
> -			#hwlock-cells = <1>;
> -		};
> -
>  		rpm_msg_ram: memory@60000 {
>  			compatible = "qcom,rpm-msg-ram";
>  			reg = <0x60000 0x8000>;
> -- 
> 2.28.0
> 
