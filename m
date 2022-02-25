Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5CD404C3F37
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Feb 2022 08:45:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238221AbiBYHow (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Feb 2022 02:44:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229774AbiBYHow (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Feb 2022 02:44:52 -0500
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD93B2272C9
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Feb 2022 23:44:20 -0800 (PST)
Received: by mail-pg1-x531.google.com with SMTP id 27so3913358pgk.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Feb 2022 23:44:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=pebQAfXF6XweYjs0eGI3bFR9spMrRG1FqYYUkNhfn+E=;
        b=Kl/dwA7J9l0gxrWs8kMoBqr+lcMx8XxtSxViisuumNbHcyG2PUWuPy3+a5v+k4wPxW
         Hv0eHcxH9z1uv+5779eWO9UV65SXJflq3eRoH531R/3kG35qboZIhDdFJhvGkg5hh+Rw
         oMYmH/tYn66ot8W98dH0/liRAWSshqbU7RjtWMIcg7vQDIB5zlDRsLYwJJpVSvE65WH2
         /BqanM+9joXU9QGK6FPHIIOBtuw2CqmFaWdT36d/R3FEt45+8uLFzltsKshoQ3ofxO+o
         sXAfLGSrU79VemMHEXTCZVyYq6CSWkZRQdUZtFY/pWonsuew09I1qG3gb5k8MD3rwUoa
         WYNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pebQAfXF6XweYjs0eGI3bFR9spMrRG1FqYYUkNhfn+E=;
        b=65RJyZyCbtVW61TgkZWoQgxKN7EllPusCnaKUGDQpPpIwKUplLr4ayD5B6jMH5DHcn
         QtKXCvWZw4BvuQqlJwUw+agfYZEhVXgv4SA5XRL3u4r6I1nTbzSFWSnlMmFOQRvaZkNd
         i+8srr7sVodwQVrmVCWwXlD+WnKwOQiUkC3B+OQ9J6Cz0eh19U1KK6oAy7/KqSCVXyPg
         nmRR3vPnfJsLSEHDcUYVlir7oQ2XT72TDoo1PaZzt2xdAn5UxE4XePBZSZYA1Fe/UDC/
         drVIuAVglpDeJWxGckBcJffXQ89+moShL7zjxtPWHLkjVqGaXRe4DITQ+HNYXOeeeZUu
         sbng==
X-Gm-Message-State: AOAM531cq3KkUEI6zAW2KufkPpw/Kig5FLflJ+g4sPWxYWBfhHDN4jEP
        hmMs3Skg77Q/k2l9CqrY2DSb
X-Google-Smtp-Source: ABdhPJysLEw5Fe2Qq+cY1LBZd0c6mBCnomaQ6NxvOIVAGyd6cEKU6O+Dheso6fSjReAysM8+HH2yIA==
X-Received: by 2002:a63:ba5e:0:b0:372:9bb2:c12d with SMTP id l30-20020a63ba5e000000b003729bb2c12dmr5253196pgu.380.1645775060237;
        Thu, 24 Feb 2022 23:44:20 -0800 (PST)
Received: from thinkpad ([220.158.159.240])
        by smtp.gmail.com with ESMTPSA id nn17-20020a17090b38d100b001bc5a705fb2sm1480029pjb.26.2022.02.24.23.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Feb 2022 23:44:19 -0800 (PST)
Date:   Fri, 25 Feb 2022 13:14:15 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Rohit Agarwal <quic_rohiagar@quicinc.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>, agross@kernel.org,
        robh+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: qcom: Add chosen node information for SDX65.
Message-ID: <20220225074415.GF274289@thinkpad>
References: <1644574845-23248-1-git-send-email-quic_rohiagar@quicinc.com>
 <YhfgAL8z6rO+zU3w@builder.lan>
 <b9205016-1f33-74fd-c314-c307412bfca3@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b9205016-1f33-74fd-c314-c307412bfca3@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Feb 25, 2022 at 12:46:26PM +0530, Rohit Agarwal wrote:
> 
> On 2/25/2022 1:14 AM, Bjorn Andersson wrote:
> > On Fri 11 Feb 04:20 CST 2022, Rohit Agarwal wrote:
> > 
> > > Add chosen node in the base dtsi file of SDX65.
> > > 
> > While this happens to be the same on most boards, it is still a
> > board-specific decision which UART is the debug uart, or if there is one
> > at all...
> > 
> > So this property should remain in the dts.
> > 
> > Thanks,
> > Bjorn
> 
> Without the chosen node in base dtsi, the device is not booting up.
> Can we have an empty chosen node in the base dtsi and the board-specific
> details
> updated in the respective dts file. The device boots up with this.
> 

I believe this is something to do with bootloader. But still I don't understand
how this matters at all since the bootloader finally parses the "dtb" only.

Is the bootloader picking up correct dtb?

Thanks,
Mani

> Thanks,
> Rohit
> 
> > > Signed-off-by: Rohit Agarwal <quic_rohiagar@quicinc.com>
> > > ---
> > >   arch/arm/boot/dts/qcom-sdx65-mtp.dts | 4 ----
> > >   arch/arm/boot/dts/qcom-sdx65.dtsi    | 4 ++++
> > >   2 files changed, 4 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/arch/arm/boot/dts/qcom-sdx65-mtp.dts b/arch/arm/boot/dts/qcom-sdx65-mtp.dts
> > > index 59457da..3a75c21 100644
> > > --- a/arch/arm/boot/dts/qcom-sdx65-mtp.dts
> > > +++ b/arch/arm/boot/dts/qcom-sdx65-mtp.dts
> > > @@ -14,10 +14,6 @@
> > >   	aliases {
> > >   		serial0 = &blsp1_uart3;
> > >   	};
> > > -
> > > -	chosen {
> > > -		stdout-path = "serial0:115200n8";
> > > -	};
> > >   };
> > >   &blsp1_uart3 {
> > > diff --git a/arch/arm/boot/dts/qcom-sdx65.dtsi b/arch/arm/boot/dts/qcom-sdx65.dtsi
> > > index 796641d..653df15 100644
> > > --- a/arch/arm/boot/dts/qcom-sdx65.dtsi
> > > +++ b/arch/arm/boot/dts/qcom-sdx65.dtsi
> > > @@ -17,6 +17,10 @@
> > >   	qcom,msm-id = <458 0x10000>, <483 0x10000>, <509 0x10000>;
> > >   	interrupt-parent = <&intc>;
> > > +	chosen {
> > > +		stdout-path = "serial0:115200n8";
> > > +	};
> > > +
> > >   	memory {
> > >   		device_type = "memory";
> > >   		reg = <0 0>;
> > > -- 
> > > 2.7.4
> > > 
