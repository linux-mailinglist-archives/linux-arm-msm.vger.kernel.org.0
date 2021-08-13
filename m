Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09F963EBB74
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Aug 2021 19:27:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232544AbhHMR2Y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Aug 2021 13:28:24 -0400
Received: from mail-oi1-f173.google.com ([209.85.167.173]:43600 "EHLO
        mail-oi1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229554AbhHMR2X (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Aug 2021 13:28:23 -0400
Received: by mail-oi1-f173.google.com with SMTP id bf25so8154052oib.10;
        Fri, 13 Aug 2021 10:27:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=c76u1WXElgRxRcQhl6D43NoSzfQNaZCIjE+sTewowMM=;
        b=MGInzNufGT5KNHZc5Xh1ngSUS357WQCg7hATnbObYIJU/gVhAA/+pgwKepopAqiRGy
         BIP4ihAd4jO4gX7GpJZTcAhyVKD3T4NFSauU+cE3SB0vb9FN94x8xDZ/VJpJwHGAsPbR
         fT5gD5M4Mw/x9kl6bbKLdZVCrP8Vu6Ba8gauzFBrMfG8d7hep2VwauIG3LXZgsH2C3TN
         Y0M+7xTf71sdRu2FaCcRdw2/1dDKeWLeFLJolOV29sYpf2ryRiwhORpTBUbOkqE6DIqs
         z37qzO40mgEVI3A2Uhol8w06n3eyxaJ1EToBNCCt/eu8snfKEPFkY6PBONKOvEWv5oDd
         TH9Q==
X-Gm-Message-State: AOAM533OnIMiR1cv0JrQyHAUt7wPSFm64V3sdeoWis2zzEIwk2IZKUI4
        +FzXFlJn/ionuQwyLQpxQw==
X-Google-Smtp-Source: ABdhPJyJX8e0PqvBYgviZIQhJ5tFf72HUF/I6WzXXmCGSLWifq/a+D0Xu4XCts1pXdbno59mWS+N1g==
X-Received: by 2002:aca:1913:: with SMTP id l19mr1257653oii.92.1628875676085;
        Fri, 13 Aug 2021 10:27:56 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id f3sm439999otc.49.2021.08.13.10.27.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Aug 2021 10:27:55 -0700 (PDT)
Received: (nullmailer pid 3714764 invoked by uid 1000);
        Fri, 13 Aug 2021 17:27:54 -0000
Date:   Fri, 13 Aug 2021 12:27:54 -0500
From:   Rob Herring <robh@kernel.org>
To:     Baruch Siach <baruch@tkos.co.il>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Balaji Prakash J <bjagadee@codeaurora.org>,
        Kathiravan T <kathirav@codeaurora.org>,
        Jack Pham <jackp@codeaurora.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 4/6] usb: dwc3: reference clock period configuration
Message-ID: <YRarmizUtzIunV1P@robh.at.kernel.org>
References: <3d86f45004fe2fcbae0a2cd197df81a1fd076a1e.1628085910.git.baruch@tkos.co.il>
 <0e99e3d453547ad2a8f4541090a03f3c80b80332.1628085910.git.baruch@tkos.co.il>
 <87lf5h5mc2.fsf@kernel.org>
 <87v94lxpb0.fsf@tarshish>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87v94lxpb0.fsf@tarshish>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Aug 04, 2021 at 05:22:27PM +0300, Baruch Siach wrote:
> Hi Felipe,
> 
> On Wed, Aug 04 2021, Felipe Balbi wrote:
> > Baruch Siach <baruch@tkos.co.il> writes:
> >> @@ -1371,6 +1398,8 @@ static void dwc3_get_properties(struct dwc3 *dwc)
> >>  				    &dwc->hsphy_interface);
> >>  	device_property_read_u32(dev, "snps,quirk-frame-length-adjustment",
> >>  				 &dwc->fladj);
> >> +	device_property_read_u32(dev, "snps,ref-clock-period",
> >> +				 &dwc->ref_clk_per);
> >
> > I wonder if it would make more sense to pass an actual clock reference
> > here. If valid, then reconfigure the period to the value returned by
> > clk_get_rate(). It would avoid yet another DT binding. If we make the
> > clock optional, then we won't affect any other platforms. The clock
> > itself could be a regular fixed clock node.
> 
> Thinh Nguyen asked to add a dedicated DT property. He explained that
> clk_get_rate() does not work for PCI hosted dwc3. This is the most
> complete summary of the discussion:
> 
>   https://lore.kernel.org/r/c797e9cb-cae6-c0b6-5714-169c2ad79d32@synopsys.com

PCI devices can have DT nodes with clock properties too. Or use the 
VID/PID to infer the frequency. Or use 'clock-frequency' property.

It boils down to we have lots of standard properties for clocks and 
clock configuration, so custom properties are a NAK.

Rob
