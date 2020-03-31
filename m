Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 414E8199E38
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2020 20:40:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727627AbgCaSk2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 31 Mar 2020 14:40:28 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:46461 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726209AbgCaSk2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 31 Mar 2020 14:40:28 -0400
Received: by mail-pf1-f193.google.com with SMTP id q3so10705958pff.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2020 11:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=BiFlrx2jci6UF/44wjMJRVvmGi3zYDtbTuZw76ofS9M=;
        b=vTD9J09LOf7YaKpipJJDrND2YBBqrJCrokT+YirTJiDmBCrXSEte4ecos/ucAha3yU
         Gg8STR6sCIRMljfMemjURNJ7wDHYDK6srFfQMLyVAoe7cH2R5XV25criDj6PpGB+DQDP
         gTFjnucSamy6DZk8q/6MJ/WNjs5N1oSqTdng6KM9E+GKLjrcb27i0CddZhEDygJVLS6H
         5LuChaiCe53Ho9X/DZtDglzHhPdz0aFauosokOuLsa941Xk659PoHyaMmNLUk7NRpzvy
         ZQ23pmTUl9qKF5NprxcAYwfyhaxDpAVjba1eucGXDIxg1HVnVXqa3uZ4moml+KHZ91iC
         ta8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BiFlrx2jci6UF/44wjMJRVvmGi3zYDtbTuZw76ofS9M=;
        b=m2AzgAMzoFylbYnRSNw+ZyX98Mpp4jwJ2JuXXTNw736oVnQQ70KayelYcIvAuLD4qu
         CvxjVBAbZMjCgHjBNNPZu8f5Rve3n5ljA1i1GO+cCFmxEcmwuhK39ONRAOhfNq0jhQMf
         DCstex0keZbTFQ3ocHEXr43YHZzZoVv80JBBJqpGbhmOjCWEkNR7jgM2v0YkWHeg2ipm
         kQF9ScGz+RZJwDtze3+W4+oR40iGaINgSrLnKmUaqDNG2GWp+FpkDjqSzJdddbfoZNTU
         v68lVTcdZfGX6i8vk+NufMAEDW4Egw6taZ/4toBpOLACh/j0+x9rIeb/dBziRugZwE0d
         Yusw==
X-Gm-Message-State: AGi0Pua+LXRjDemukBe1XY2TnWRfTRkW+wofGTFfZanbTbsluPkHEHcY
        87yNLlnuExVtI19l6wwDpYJpog==
X-Google-Smtp-Source: APiQypKUNpAzOq4pKgWQBvZIXbKQl122MMmvgDMFQ7moe2HCfS52TO3xMq7di1tLyj/TuRnpFvvq6A==
X-Received: by 2002:a62:ee15:: with SMTP id e21mr6219077pfi.90.1585680026497;
        Tue, 31 Mar 2020 11:40:26 -0700 (PDT)
Received: from minitux (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id g7sm5951509pfo.85.2020.03.31.11.40.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2020 11:40:25 -0700 (PDT)
Date:   Tue, 31 Mar 2020 11:40:23 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     pillair@codeaurora.org
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v7] arm64: dts: qcom: sc7180: Add WCN3990 WLAN module
 device node
Message-ID: <20200331184023.GB267644@minitux>
References: <1585219723-28323-1-git-send-email-pillair@codeaurora.org>
 <20200327230025.GJ5063@builder>
 <000101d604f8$afc48220$0f4d8660$@codeaurora.org>
 <20200328183055.GA663905@yoga>
 <000301d605ba$3d034a10$b709de30$@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <000301d605ba$3d034a10$b709de30$@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun 29 Mar 04:07 PDT 2020, pillair@codeaurora.org wrote:

> Hi Bjorn,
> 
> > -----Original Message-----
> > From: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Sent: Sunday, March 29, 2020 12:01 AM
> > To: pillair@codeaurora.org
> > Cc: devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> linux-
> > kernel@vger.kernel.org; linux-arm-msm@vger.kernel.org
> > Subject: Re: [PATCH v7] arm64: dts: qcom: sc7180: Add WCN3990 WLAN
> > module device node
> > 
> > On Sat 28 Mar 05:01 PDT 2020, pillair@codeaurora.org wrote:
> > 
> > > Hi Bjorn,
> > >  Comments inline.
> > >
> > >
> > > > -----Original Message-----
> > > > From: Bjorn Andersson <bjorn.andersson@linaro.org>
> > > > Sent: Saturday, March 28, 2020 4:30 AM
> > > > To: Rakesh Pillai <pillair@codeaurora.org>
> > > > Cc: devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> > > linux-
> > > > kernel@vger.kernel.org; linux-arm-msm@vger.kernel.org
> > > > Subject: Re: [PATCH v7] arm64: dts: qcom: sc7180: Add WCN3990 WLAN
> > > > module device node
> > > >
> > > > On Thu 26 Mar 03:48 PDT 2020, Rakesh Pillai wrote:
> > > >
> > > > > Add device node for the ath10k SNOC platform driver probe
> > > > > and add resources required for WCN3990 on sc7180 soc.
> > > > >
> > > > > Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
> > > > > ---
> > > > >
> > > > > Depends on https://patchwork.kernel.org/patch/11455345/
> > > > > The above patch adds the dt-bindings for wifi-firmware
> > > > > subnode
> > > > > ---
> > > > >  arch/arm64/boot/dts/qcom/sc7180-idp.dts |  8 ++++++++
> > > > >  arch/arm64/boot/dts/qcom/sc7180.dtsi    | 27
> > > > +++++++++++++++++++++++++++
> > > > >  2 files changed, 35 insertions(+)
> > > > >
> > > > > diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> > > > b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> > > > > index 043c9b9..a6168a4 100644
> > > > > --- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> > > > > +++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> > > > > @@ -327,6 +327,14 @@
> > > > >  	};
> > > > >  };
> > > > >
> > > > > +&wifi {
> > > > > +	status = "okay";
> > > > > +	qcom,msa-fixed-perm;
> > > > > +	wifi-firmware {
> > > > > +		iommus = <&apps_smmu 0xc2 0x1>;
> > > >
> > > > How is sc7180 different from sdm845, where the iommus property goes
> > > > directly in the &wifi node?
> > >
> > > Sc7180 IDP is a target without TrustZone support and also with S2 IOMMU
> > > enabled.
> > > Since in Trustzone based targets, the iommu SID configuration was done
> by
> > > TZ, there was nothing required to be done by driver.
> > > But in non-TZ based targets, the IOMMU mappings need to be done by the
> > > driver.
> > > Since this is the mapping of the firmware memory and to keep it
> different
> > > from the driver memory access, a different device has been created for
> > > firmware and these SIDs are configured.
> > >
> > 
> > I see, I missed the fact that 0xc0:1 is used in the &wifi node itself.
> > 
> > So to confirm, we have streams 0xc0 and 0xc1 for data pipes and 0xc2 and
> > 0xc3 for some form of firmware access? And in the normal Qualcomm design
> > implementation the 0c2/0xc3 stream mapping is setup by TZ, and hidden
> > from Linux using the SMMU virtualisation?
> > 
> > 
> > Would have been nice to have some better mechanism for describing
> > multi-connected hardware block, than to sprinkle dummy nodes all over
> > the DT...
> 
> Yes, this is the firmware memory. This method is followed in the venus video
> driver
> https://patchwork.kernel.org/patch/11315765/
> 
> Do you suggest following some other mechanism ?
> 

After considering this some more, and having a quick chat with Arnd
yesterday, I don't have any other suggestions.

So I will pick up your v8.

Thanks,
Bjorn
