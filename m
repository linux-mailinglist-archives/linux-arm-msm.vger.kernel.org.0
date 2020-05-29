Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9950D1E7390
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2020 05:26:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407290AbgE2DX5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 May 2020 23:23:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407182AbgE2DX4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 May 2020 23:23:56 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DCF5C08C5C7
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2020 20:23:55 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id c75so678460pga.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2020 20:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Upfqc1+C901bdB2ErdMTP32Txt/QBIC+Jzp9qFA0w9Q=;
        b=fZjciYwIkVhkSVfHBvq6SE1SemAyaZX1Rs5sDzOSCRr2SN8jgLFZL8/1m+giO+zDx4
         HarftfFLbfUjP58QwzYgo/J5qbRzU+uCQOzeqJKm1FxsNi3ZwXQHO0OvxuRBSUFDtBoN
         h3ZrwSvgvIoXRWmpixf1/K8P346Coud+qvqGjZvtMt6T56wzhcNEb9QWJXpYVEQhxrCj
         0uHNrErHisflXFgvzIHrIzr6qskkWla1SkPVxv+nxvOKYuDbHEL8HGKxmHIctTvsSBO+
         6YbtmVIpiVQ+NAnX0/MSuPZZNlk/yWxjk/8FZKxaOLx4ITUxvDrgxghGvuMjbJ91MRY6
         snfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Upfqc1+C901bdB2ErdMTP32Txt/QBIC+Jzp9qFA0w9Q=;
        b=jUsyhqYIYnffx3aqVMUya/WIpu5BStwsW7pV70Lib8iKkAhD2qOi4n/3s0k6pvNhXX
         RaU+DUoC8BjtqupHUguydAZJaxCCbF/0rlkqOyRjQULK4dMbZfaUAyWgapuyMzTj/RKH
         ieFmholE3ypaDhGRUJFGWzyHdYxMYfaMLIt8wxfdvtj6vB/XmoIXCwzIHQAL0jzuGYP2
         lEA0F4DKEjwvuwTnLatBp6r2H/vSaDFP/XiQO+WSz4osKrIfXpAETw3Q4tdPuvhUcWyi
         vyCxlX3qEqI12VcAG42PQ7CqjJtVSCtTaO0s3rX5rAcYioodcSi37rqZLf/CK1XdHMwz
         EuLA==
X-Gm-Message-State: AOAM530VyNTBIVBFr/KxQbOikR7bmmQrwP0nIRqCAKQyICUAYMg2Ag3E
        LeUlSWlkMJdtVNIbsz30VwhTIg==
X-Google-Smtp-Source: ABdhPJxJVeTzhxMoR4M0mlcvIQiOYVe6/YmLhRrrOeXZQke7CTmsuOJmYwgCNbkB5FRdxEugLkWmlw==
X-Received: by 2002:a63:6f04:: with SMTP id k4mr6286671pgc.313.1590722634601;
        Thu, 28 May 2020 20:23:54 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id m14sm5493103pgn.83.2020.05.28.20.23.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 20:23:53 -0700 (PDT)
Date:   Thu, 28 May 2020 20:22:48 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: qcom: sm8250: use dt-bindings defines for
 clocks
Message-ID: <20200529032248.GC279327@builder.lan>
References: <20200523131213.18653-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200523131213.18653-1-jonathan@marek.ca>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat 23 May 06:12 PDT 2020, Jonathan Marek wrote:

> Use the dt-bindings defines for qupv3_id_1 node's clocks.
> 

Applied

Thanks,
Bjorn

> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index 9c210fbac65e..04c9c215ffcd 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -292,7 +292,8 @@ qupv3_id_1: geniqup@ac0000 {
>  			compatible = "qcom,geni-se-qup";
>  			reg = <0x0 0x00ac0000 0x0 0x6000>;
>  			clock-names = "m-ahb", "s-ahb";
> -			clocks = <&gcc 133>, <&gcc 134>;
> +			clocks = <&gcc GCC_QUPV3_WRAP_1_M_AHB_CLK>,
> +				 <&gcc GCC_QUPV3_WRAP_1_S_AHB_CLK>;
>  			#address-cells = <2>;
>  			#size-cells = <2>;
>  			ranges;
> @@ -302,7 +303,7 @@ uart2: serial@a90000 {
>  				compatible = "qcom,geni-debug-uart";
>  				reg = <0x0 0x00a90000 0x0 0x4000>;
>  				clock-names = "se";
> -				clocks = <&gcc 113>;
> +				clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
>  				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
>  				status = "disabled";
>  			};
> -- 
> 2.26.1
> 
