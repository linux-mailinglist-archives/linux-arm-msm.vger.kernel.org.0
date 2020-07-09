Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C13F219AF0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2020 10:36:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726245AbgGIIgR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Jul 2020 04:36:17 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:58502 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726247AbgGIIgQ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Jul 2020 04:36:16 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1594283775; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: Message-ID: Date: Subject: In-Reply-To: References: Cc:
 To: From: Sender; bh=VNqNnxgafwr7RYkJ1Yf6GjVmu/dHflZjtsDnh57E44U=; b=kWemX2P0VzP6o0ObSfWWDu+FBg4CgWM1lgAGPXan40BGQIsMKB0WiA7RVWnZ8iufAi9uSISz
 g2a5/BRHRc53rC1qeyRT4TKMPJyp56koWPkgu5gd7AcAg0jJOZGWiyKEN62/En2pzODkX+mm
 zgTwqZ0i5T1wes41/c7kLDtXgh8=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 5f06d6fc71d7ca1d3aa277ff (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 09 Jul 2020 08:36:12
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 7F494C43391; Thu,  9 Jul 2020 08:36:11 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from Pillair (unknown [183.83.71.149])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: pillair)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 04226C433C6;
        Thu,  9 Jul 2020 08:36:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 04226C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=pillair@codeaurora.org
From:   "Rakesh Pillai" <pillair@codeaurora.org>
To:     "'Douglas Anderson'" <dianders@chromium.org>,
        "'Andy Gross'" <agross@kernel.org>,
        "'Bjorn Andersson'" <bjorn.andersson@linaro.org>
Cc:     "'Evan Green'" <evgreen@chromium.org>,
        "'Sibi Sankar'" <sibis@codeaurora.org>,
        "'Rob Herring'" <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20200625131658.REPOST.1.I32960cd32bb84d6db4127c906d7e371fa29caebf@changeid> 
In-Reply-To: 
Subject: RE: [REPOST PATCH] arm64: dts: qcom: Fix WiFi supplies on sc7180-idp
Date:   Thu, 9 Jul 2020 14:06:04 +0530
Message-ID: <001501d655cb$ff5b8bc0$fe12a340$@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIJkvzNJ2GrKQD23Wa0Ucd2+v4DjgEVOFggqI++GJA=
Content-Language: en-us
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



> -----Original Message-----
> From: Rakesh Pillai <pillair@codeaurora.org>
> Sent: Friday, June 26, 2020 2:14 PM
> To: 'Douglas Anderson' <dianders@chromium.org>; 'Andy Gross'
> <agross@kernel.org>; 'Bjorn Andersson' <bjorn.andersson@linaro.org>
> Cc: 'Evan Green' <evgreen@chromium.org>; 'Sibi Sankar'
> <sibis@codeaurora.org>; 'Rob Herring' <robh+dt@kernel.org>;
> 'devicetree@vger.kernel.org' <devicetree@vger.kernel.org>; 'linux-arm-
> msm@vger.kernel.org' <linux-arm-msm@vger.kernel.org>; 'linux-
> kernel@vger.kernel.org' <linux-kernel@vger.kernel.org>
> Subject: RE: [REPOST PATCH] arm64: dts: qcom: Fix WiFi supplies on sc7180-
> idp
> 
> 
> 
> > -----Original Message-----
> > From: Douglas Anderson <dianders@chromium.org>
> > Sent: Friday, June 26, 2020 1:47 AM
> > To: Andy Gross <agross@kernel.org>; Bjorn Andersson
> > <bjorn.andersson@linaro.org>
> > Cc: Evan Green <evgreen@chromium.org>; Sibi Sankar
> > <sibis@codeaurora.org>; Rakesh Pillai <pillair@codeaurora.org>; Douglas
> > Anderson <dianders@chromium.org>; Rob Herring <robh+dt@kernel.org>;
> > devicetree@vger.kernel.org; linux-arm-msm@vger.kernel.org; linux-
> > kernel@vger.kernel.org
> > Subject: [REPOST PATCH] arm64: dts: qcom: Fix WiFi supplies on
sc7180-idp
> >
> > The WiFi supplies that were added recently can't have done anything
> > useful because they were missing the "-supply" suffix.  Booting
> > without the "-supply" suffix would give these messages:
> >
> > ath10k_snoc 18800000.wifi: 18800000.wifi supply vdd-0.8-cx-mx not found,
> > using dummy regulator
> > ath10k_snoc 18800000.wifi: 18800000.wifi supply vdd-1.8-xo not found,
> using
> > dummy regulator
> > ath10k_snoc 18800000.wifi: 18800000.wifi supply vdd-1.3-rfa not found,
> using
> > dummy regulator
> > ath10k_snoc 18800000.wifi: 18800000.wifi supply vdd-3.3-ch0 not found,
> > using dummy regulator
> >
> > Let's add the "-supply" suffix.
> >
> > Fixes: 1e7594a38f37 ("arm64: dts: qcom: sc7180: Add WCN3990 WLAN
> > module device node")
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> Reviewed-by: Rakesh Pillai <pillair@codeaurora.org>


Tested-by: Rakesh Pillai <pillair@codeaurora.org>

> 
> I missed this in the DTSI patch, while manually rebasing to the kernel
tip.
> 
> > I don't have an IDP setup but I have a similar board.  Testing on IDP
> > would, of course, be appreciated.
> >
> > Repost because I screwed up the "after-the-cut" notes on first post.
> >
> >  arch/arm64/boot/dts/qcom/sc7180-idp.dts | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> > b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> > index 39dbfc89689e..472f7f41cc93 100644
> > --- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> > +++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> > @@ -391,10 +391,10 @@ video-firmware {
> >
> >  &wifi {
> >  	status = "okay";
> > -	vdd-0.8-cx-mx = <&vreg_l9a_0p6>;
> > -	vdd-1.8-xo = <&vreg_l1c_1p8>;
> > -	vdd-1.3-rfa = <&vreg_l2c_1p3>;
> > -	vdd-3.3-ch0 = <&vreg_l10c_3p3>;
> > +	vdd-0.8-cx-mx-supply = <&vreg_l9a_0p6>;
> > +	vdd-1.8-xo-supply = <&vreg_l1c_1p8>;
> > +	vdd-1.3-rfa-supply = <&vreg_l2c_1p3>;
> > +	vdd-3.3-ch0-supply = <&vreg_l10c_3p3>;
> >  	wifi-firmware {
> >  		iommus = <&apps_smmu 0xc2 0x1>;
> >  	};
> > --
> > 2.27.0.212.ge8ba1cc988-goog


