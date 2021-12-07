Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F08146BDC4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Dec 2021 15:33:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237886AbhLGOhS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Dec 2021 09:37:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233364AbhLGOhR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Dec 2021 09:37:17 -0500
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B39CC061748
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Dec 2021 06:33:47 -0800 (PST)
Received: by mail-ot1-x330.google.com with SMTP id v15-20020a9d604f000000b0056cdb373b82so18290047otj.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Dec 2021 06:33:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=0m2GF26E40xs6mb1JEeofYn5H0g7vqPjjF1kUlGlw1g=;
        b=qTMDWbLjlnnwBWIxkq7P3nMajKwCc4EprCObUf3oK+rgEK99LWCDchKSgEBzp3taXi
         L9OdOkdcVYPJPOSSFjixzUJDR6Z6f5/5yiQI7AU50vOq7eDrvkkfGF09XoA7TRFDxZt7
         6B7Mo1KflEauK7z7QPu2luy3bqlkZ0fFTTAicwhdgvGQ48fbrCGHyYKe2Hu720QR/85m
         PLsr02ynd/it9TtM/XFds17CdDdIPalHH/xZMFuX8cxcGFOErICua4RTr+oOrX5PwsOv
         D9vm6YT3Ufpfb2ZMp+P1Esa5Oar8v/aSvtil36hD1bfWnrX44y61rvvmgVjKOwknwH5N
         tdtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0m2GF26E40xs6mb1JEeofYn5H0g7vqPjjF1kUlGlw1g=;
        b=vErsrE2JWDSUF0vCMvnMfsp9GXkxYMlZpBYV03SpzLqiXeFvGgFm4PJcNC7ep6oL70
         Utp22mgS+S1Szp9V6LcWiB2KRTIojUZk4oVcgmA/l1Qkl1ZDHwZCkO3EnV7QnEriF6Yx
         WEejU3I5bfiTL9078+GtLftCDDERdXz8Dlmpxo1eS12nFtKoPEtFcmHNfaXEf6Fs/S8s
         hpIWbdZysAeU5BPCnnF/Oi9U8G06fwGNIRLv01J+qDl+HAghCZQN49SnP2Ne/+eyfFld
         VU1fiOn5yLuzXe+IREGSkDpOGuTOH4UsSon2xsIb9cgv3ouguKC9+8wi614TwtPIZOes
         gigw==
X-Gm-Message-State: AOAM532jHVwXfZm6/AdfRWLVnoamK99d1pgTSGkS4x9u+PKykfFJ0UE+
        ZyK6YP4UnK9qO9kySJuvuPoIew==
X-Google-Smtp-Source: ABdhPJy9LoOphSM1nEVxuWvLYLMmN9Elgk4jmv3+PE9nQA06m25+qZiTiG26zXQGeLFhHPulg3eG2Q==
X-Received: by 2002:a9d:62c5:: with SMTP id z5mr36478679otk.166.1638887626915;
        Tue, 07 Dec 2021 06:33:46 -0800 (PST)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id bh12sm3469459oib.25.2021.12.07.06.33.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Dec 2021 06:33:46 -0800 (PST)
Date:   Tue, 7 Dec 2021 06:35:11 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/15] arm64: dts: qcom: Add base SM8450 DTSI
Message-ID: <Ya9xHzykSknMdqcd@ripper>
References: <20211201072915.3969178-1-vkoul@kernel.org>
 <20211201072915.3969178-2-vkoul@kernel.org>
 <3fe36e35-8c4b-f772-be43-8e8c49e97f63@somainline.org>
 <Ya2iJD8kfFfj/MpY@matsya>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Ya2iJD8kfFfj/MpY@matsya>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun 05 Dec 21:39 PST 2021, Vinod Koul wrote:

> On 01-12-21, 16:03, Konrad Dybcio wrote:
> > 
> > On 01.12.2021 08:29, Vinod Koul wrote:
> > > This add based DTSI for SM8450 SoC and includes base description of
> > > CPUs, GCC, RPMHCC, UART, interuupt-controller which helps to boot to
> > > shell with console on boards with this SoC
> > >
> > > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > > ---
> > >  arch/arm64/boot/dts/qcom/sm8450.dtsi | 476 +++++++++++++++++++++++++++
> > >  1 file changed, 476 insertions(+)
> > >  create mode 100644 arch/arm64/boot/dts/qcom/sm8450.dtsi
> > >
> > > diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> > > new file mode 100644
> > > index 000000000000..d838283bde4b
> > > --- /dev/null
> > > +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> > > @@ -0,0 +1,476 @@
> > > +// SPDX-License-Identifier: BSD-3-Clause
> > > +/*
> > > + * Copyright (c) 2021, Linaro Limited
> > > + */
> > > +
> > > +#include <dt-bindings/interrupt-controller/arm-gic.h>
> > > +#include <dt-bindings/clock/qcom,gcc-sm8450.h>
> > > +#include <dt-bindings/clock/qcom,rpmh.h>
> > > +#include <dt-bindings/soc/qcom,rpmh-rsc.h>
> > > +
> > > +/ {
> > > +	interrupt-parent = <&intc>;
> > > +
> > > +	#address-cells = <2>;
> > > +	#size-cells = <2>;
> > > +
> > > +	chosen { };
> > > +
> > > +	clocks {
> > > +		xo_board: xo-board {
> > > +			compatible = "fixed-clock";
> > > +			#clock-cells = <0>;
> > > +			clock-frequency = <76800000>;
> > > +			clock-output-names = "xo_board";
> > > +		};
> > > +
> > > +		sleep_clk: sleep-clk {
> > > +			compatible = "fixed-clock";
> > > +			clock-frequency = <32000>;
> > > +			#clock-cells = <0>;
> > > +		};
> > 
> > No clock-output-names for this one?
> 
> This should have one, will fix and update in v2

No need, the clock's name is not significant for anything beyond
debugging. So if you're going to change something let it be dropping the
clock-output-names from &xo_board.

Thanks,
Bjorn

> > 
> > 
> > Other than that:
> > 
> > Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> 
> Thanks for the review!
> 
> -- 
> ~Vinod
