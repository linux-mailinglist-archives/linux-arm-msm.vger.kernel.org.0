Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D64BB1EEDEC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jun 2020 00:48:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726905AbgFDWrx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Jun 2020 18:47:53 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:25525 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726217AbgFDWrw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Jun 2020 18:47:52 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1591310871; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=vYicqcQtLpsFLKWIXbvT0Lj5cAG7ilgk3go40nubi1w=; b=e/xHp092Y3dKLvJDNaShdncdDglohVWFWnaDsE5j11XvnWufsbeXCJA2+X5nzPAwqAYPsLmv
 P2lWJBdYiro3928artZ/YiO/tA6nOrK4SGcBIdS836GcyL6drNgvrV6Wv/DPQKJr+snj9J3c
 Onia84E+Q9CXWQ7B94+OtZ1Hq4I=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n14.prod.us-east-1.postgun.com with SMTP id
 5ed97a0744a25e00525812ce (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 04 Jun 2020 22:47:35
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id CBC0DC43391; Thu,  4 Jun 2020 22:47:34 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6D628C433C6;
        Thu,  4 Jun 2020 22:47:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6D628C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date:   Thu, 4 Jun 2020 16:47:29 -0600
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>
Subject: Re: [Freedreno] [PATCH v7 6/6] arm6: dts: qcom: sm845: Set the
 compatible string for the GPU SMMU
Message-ID: <20200604224729.GB12322@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>
References: <20200604205710.3167-1-jcrouse@codeaurora.org>
 <20200604205710.3167-7-jcrouse@codeaurora.org>
 <CAF6AEGt4N5+0h0fkrO7m6KD3VMXkdoFyhN5Nz72DcMjoHX6XWA@mail.gmail.com>
 <20200604220216.GA12322@jcrouse1-lnx.qualcomm.com>
 <CAF6AEGssC5ZJKh3oMR6fFRJwZvWLy4YjE2anvq5sDmPB_ikv0Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAF6AEGssC5ZJKh3oMR6fFRJwZvWLy4YjE2anvq5sDmPB_ikv0Q@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jun 04, 2020 at 03:38:28PM -0700, Rob Clark wrote:
> On Thu, Jun 4, 2020 at 3:02 PM Jordan Crouse <jcrouse@codeaurora.org> wrote:
> >
> > On Thu, Jun 04, 2020 at 02:27:21PM -0700, Rob Clark wrote:
> > > On Thu, Jun 4, 2020 at 1:57 PM Jordan Crouse <jcrouse@codeaurora.org> wrote:
> > > >
> > > > Set the qcom,adreno-smmu compatible string for the GPU SMMU to enable
> > > > split pagetables.
> > > >
> > > > Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> > > > ---
> > > >
> > > >  arch/arm64/boot/dts/qcom/sdm845.dtsi | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > > > index 8eb5a31346d2..8b15cd74e9ba 100644
> > > > --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > > > +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > > > @@ -3556,7 +3556,7 @@
> > > >                 };
> > > >
> > > >                 adreno_smmu: iommu@5040000 {
> > > > -                       compatible = "qcom,sdm845-smmu-v2", "qcom,smmu-v2";
> > > > +                       compatible = "qcom,adreno-smmu", "qcom,smmu-v2";
> > >
> > > Should this be something like:
> > >
> > >    compatible = "qcom,adreno-smmu", "qcom,sdm845-smmu-v2", "qcom,smmu-v2";
> > >
> > > so that new dtb still works with old kernel?
> >
> > As far as I know qcom,sdm845-smmu-v2 never was actually used unless we were
> > doing the parsing trick somewhere.
> 
> I *think* it has a use queued up for v5.8 for the
> select-direct-mapping stuff?  I'm not 100% sure of the status of that
> off the top of my head.

That uses the compatible string of the consumer device.  I can add
it back in but I didn't think we needed to complicate the bindings any more if
we didn't have to.

Jordan

> BR,
> -R
> 
> > Jordan
> >
> > > >                         reg = <0 0x5040000 0 0x10000>;
> > > >                         #iommu-cells = <1>;
> > > >                         #global-interrupts = <2>;
> > > > --
> > > > 2.17.1
> > > >
> > > > _______________________________________________
> > > > Freedreno mailing list
> > > > Freedreno@lists.freedesktop.org
> > > > https://lists.freedesktop.org/mailman/listinfo/freedreno
> > > _______________________________________________
> > > Freedreno mailing list
> > > Freedreno@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/freedreno
> >
> > --
> > The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
> > a Linux Foundation Collaborative Project
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
