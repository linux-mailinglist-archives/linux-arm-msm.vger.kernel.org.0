Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C6C0914BCEA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2020 16:35:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726437AbgA1Pfc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Jan 2020 10:35:32 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:19102 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726694AbgA1Pfb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Jan 2020 10:35:31 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1580225730; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=OAcEYdNBjmrheJryVcIbMHDRSTe55eH2xPjNsqjLvVM=; b=Pw/BfUjPH8T1Q3KyARBtSpffhInjN20LkTbe08/RxpEbgJN9bOynNG8lbRw1wV42206AmGYp
 BkWDvNEWQFA9XiJ/mMw3kzVxHTIMZoMrmaHWow3dU1AAMgYrCMLcTsH6tqi20YB0VVb4t8Vb
 v7hExEdyj4xajHFeg0935lGKQeM=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e3054c0.7f93edef7a40-smtp-out-n02;
 Tue, 28 Jan 2020 15:35:28 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id DD647C4479C; Tue, 28 Jan 2020 15:35:27 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 592F1C43383;
        Tue, 28 Jan 2020 15:35:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 592F1C43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date:   Tue, 28 Jan 2020 08:35:24 -0700
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     Doug Anderson <dianders@chromium.org>
Cc:     Sharat Masetty <smasetty@codeaurora.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, dri-devel@freedesktop.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH v2] arm64: dts: qcom: sc7180: Add A618 gpu dt blob
Message-ID: <20200128153524.GA30489@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Doug Anderson <dianders@chromium.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
        dri-devel@freedesktop.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rob Clark <robdclark@chromium.org>
References: <1580117390-6057-1-git-send-email-smasetty@codeaurora.org>
 <CAD=FV=VFVC6XJ=OXJCSd2_oij5vggKnTedGP0Gj4KHC50QH0SQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD=FV=VFVC6XJ=OXJCSd2_oij5vggKnTedGP0Gj4KHC50QH0SQ@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jan 27, 2020 at 02:29:53PM -0800, Doug Anderson wrote:
> Hi,
> 
> On Mon, Jan 27, 2020 at 1:30 AM Sharat Masetty <smasetty@codeaurora.org> wrote:
> >
> > This patch adds the required dt nodes and properties
> > to enabled A618 GPU.
> >
> > Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
> > ---
> >  arch/arm64/boot/dts/qcom/sc7180.dtsi | 103 +++++++++++++++++++++++++++++++++++
> >  1 file changed, 103 insertions(+)
> 
> Note that +Matthias Kaehlcke commented on v1 your patch:
> 
> https://lore.kernel.org/r/20191204220033.GH228856@google.com/
> 
> ...so he should have been CCed on v2.  I would also note that some of
> the comments below are echos of what Matthias already said in the
> previous version but just weren't addressed.
> 
> 
> > diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > index b859431..277d84d 100644
> > --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > @@ -7,6 +7,7 @@
> >
> >  #include <dt-bindings/clock/qcom,gcc-sc7180.h>
> >  #include <dt-bindings/clock/qcom,rpmh.h>
> > +#include <dt-bindings/clock/qcom,gpucc-sc7180.h>
> 
> Header files should be sorted alphabetically.  ...or, even better,
> base your patch atop mine:
> 
> https://lore.kernel.org/r/20200124144154.v2.10.I1a4b93fb005791e29a9dcf288fc8bd459a555a59@changeid/
> 
> ...which adds the gpucc header file so you don't have to.  ...and when
> you do so, email out a Reviewed-by and/or Tested-by for my patch.  ;-)
> 
> 
> >  #include <dt-bindings/interrupt-controller/arm-gic.h>
> >  #include <dt-bindings/interconnect/qcom,sc7180.h>
> >  #include <dt-bindings/phy/phy-qcom-qusb2.h>
> > @@ -1619,6 +1620,108 @@
> >                         #interconnect-cells = <1>;
> >                         qcom,bcm-voters = <&apps_bcm_voter>;
> >                 };
> > +
> > +               gpu: gpu@5000000 {
> > +                       compatible = "qcom,adreno-618.0", "qcom,adreno";
> 
> Though it's not controversial, please send a patch to:
> 
> Documentation/devicetree/bindings/display/msm/gmu.txt
> 
> ...to add 'qcom,adreno-618.0', like:
> 
>     for example:
>       "qcom,adreno-gmu-618.0", "qcom,adreno-gmu"
>       "qcom,adreno-gmu-630.2", "qcom,adreno-gmu"
> 
> Probably as part of this you will be asked to convert this file to
> yaml.  IMO we don't need to block landing this patch on the effort to
> convert it to yaml, but you should still work on it.  ...or maybe
> Jordan wants to work on it?

I'll toss it on my to-do list. There always seems to be something more urgent
but I should just bite the bullet and get it done.

Jordan

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
