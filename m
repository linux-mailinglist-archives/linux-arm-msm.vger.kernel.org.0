Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B5601125C3A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2019 08:47:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726599AbfLSHqz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Dec 2019 02:46:55 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:33827 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726536AbfLSHqz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Dec 2019 02:46:55 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1576741614; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: Message-ID: Date: Subject: In-Reply-To: References: Cc:
 To: From: Sender; bh=8YiI0foaaoHDCVG3pyS8rW20b8Igs060tW2Y+QH4tNc=; b=NVqq4U3lpfxSYwSq4LOfWsm810v9xS7XsfPveII/rOg946PAZM1+AdAmldfsnvnYzX4Zn944
 AQ0qUzoTICCky+G8JUt8QSIZy/NtY/yMGkvU08yfiBj65bh9L4iBuPKFxokmzYINyv9z/aKN
 6oE89QrOBSrwokizbl9kZ13CN+w=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5dfb2aed.7f6e508379d0-smtp-out-n01;
 Thu, 19 Dec 2019 07:46:53 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id ADCB2C494BB; Thu, 19 Dec 2019 07:46:53 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from Pillair (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: pillair)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 8DC98C63C50;
        Thu, 19 Dec 2019 07:46:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8DC98C63C50
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=pillair@codeaurora.org
From:   <pillair@codeaurora.org>
To:     "'Bjorn Andersson'" <bjorn.andersson@linaro.org>
Cc:     <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
References: <0101016ed035d185-20f04863-0f38-41b7-b88d-76bc36e4dcf9-000000@us-west-2.amazonses.com> <20191211075301.GI3143381@builder>
In-Reply-To: <20191211075301.GI3143381@builder>
Subject: RE: [PATCH] arm64: dts: qcom: sc7180: Make MSA memory fixed for wifi
Date:   Thu, 19 Dec 2019 13:16:47 +0530
Message-ID: <000f01d5b640$7a293220$6e7b9660$@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQG5QEUJ3PrdBpu9docuawAIGGG9XQL5bjGgp+I0uXA=
Content-Language: en-us
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Sure Bjorn.
I have sent v2 for the patch "arm64: dts: qcom: sc7180: Add WCN3990 WLAN
module device node", where I have squashed this change as well.

Thanks,
Rakesh.

> -----Original Message-----
> From: Bjorn Andersson <bjorn.andersson@linaro.org>
> Sent: Wednesday, December 11, 2019 1:23 PM
> To: Rakesh Pillai <pillair@codeaurora.org>
> Cc: devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
linux-
> kernel@vger.kernel.org; linux-arm-msm@vger.kernel.org
> Subject: Re: [PATCH] arm64: dts: qcom: sc7180: Make MSA memory fixed for
> wifi
> 
> On Wed 04 Dec 01:20 PST 2019, Rakesh Pillai wrote:
> 
> > The MSA memory is at a fixed offset, which will be
> > a part of reserved memory. Add this flag to indicate
> > that wifi in sc7180 will use a fixed memory for MSA.
> >
> > Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
> > ---
> > This patchet is dependent on the below changes
> > arm64: dts: qcom: sc7180: Add WCN3990 WLAN module device node
> (https://lore.kernel.org/patchwork/patch/1162434/)
> 
> As mentioned for that patch, squash this change into that patch please.
> 
> Regards,
> Bjorn
> 
> > dt: bindings: add dt entry flag to skip SCM call for msa region
> (https://patchwork.ozlabs.org/patch/1192725/)
> > ---
> >  arch/arm64/boot/dts/qcom/sc7180-idp.dts | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> > index 8a6a760..b2ca143f 100644
> > --- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> > +++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> > @@ -250,6 +250,7 @@
> >
> >  &wifi {
> >  	status = "okay";
> > +	qcom,msa_fixed_perm;
> >  };
> >
> >  /* PINCTRL - additions to nodes defined in sc7180.dtsi */
> > --
> > 2.7.4
> >
