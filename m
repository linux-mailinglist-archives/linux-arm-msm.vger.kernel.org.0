Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41D9D572074
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Jul 2022 18:12:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234256AbiGLQMI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Jul 2022 12:12:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234236AbiGLQMH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Jul 2022 12:12:07 -0400
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9480CBF57D
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Jul 2022 09:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1657642323; x=1689178323;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IfKbV/1wc1Bggg0ghgBITSyL9fQHlhguqoEcjHaVT+w=;
  b=mm27Djq3oy9fl/r0uj+C8Rzhc0yERgsNNFilob/Jrq3E040YprW9yv3u
   S8rB84wY8ITC7ZRg8xHHWBfuQ+0R7UUHV23siiYI+HXcEO0mFZUJdQksU
   ZYeBt943WkGgfRfN7RQ6tf7467CB2ReUTa49pOsmOP/bADdJYOt19EPKE
   E=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 12 Jul 2022 09:12:02 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2022 09:12:02 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 12 Jul 2022 09:12:01 -0700
Received: from hu-ppareek-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 12 Jul 2022 09:11:58 -0700
Date:   Tue, 12 Jul 2022 21:41:54 +0530
From:   Parikshit Pareek <quic_ppareek@quicinc.com>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
CC:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Prasanna Kumar <quic_kprasan@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH v2] arm64: dts: qcom: sc8280xp: fix apps_smmu irq
Message-ID: <20220712161154.GA9281@hu-ppareek-blr.qualcomm.com>
References: <20220712140009.20765-1-quic_ppareek@quicinc.com>
 <20220712144044.GD21746@workstation>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220712144044.GD21746@workstation>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jul 12, 2022 at 08:10:44PM +0530, Manivannan Sadhasivam wrote:
> On Tue, Jul 12, 2022 at 07:30:09PM +0530, Parikshit Pareek wrote:
> > Wrong values have been introduced for interrupts property. Fix those
> > ones, and correct the mapping of context banks to irq number.
> > 
> 
> And you ignored my comment about sorting the IRQs...
My bad, will take care.
> 
> Thanks,
> Mani
> 
> > Fixes: 152d1faf1e2f ("arm64: dts: qcom: add SC8280XP platform")
> > Signed-off-by: Parikshit Pareek <quic_ppareek@quicinc.com>
> > ---
> >  arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> > index 7945cbb57bb4..1276a833251e 100644
> > --- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> > @@ -1580,7 +1580,6 @@
> >  				     <GIC_SPI 412 IRQ_TYPE_LEVEL_HIGH>,
> >  				     <GIC_SPI 421 IRQ_TYPE_LEVEL_HIGH>,
> >  				     <GIC_SPI 706 IRQ_TYPE_LEVEL_HIGH>,
> > -				     <GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH>,
> >  				     <GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH>,
> >  				     <GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH>,
> >  				     <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH>,
> > @@ -1591,6 +1590,7 @@
> >  				     <GIC_SPI 693 IRQ_TYPE_LEVEL_HIGH>,
> >  				     <GIC_SPI 694 IRQ_TYPE_LEVEL_HIGH>,
> >  				     <GIC_SPI 695 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 696 IRQ_TYPE_LEVEL_HIGH>,
> >  				     <GIC_SPI 410 IRQ_TYPE_LEVEL_HIGH>,
> >  				     <GIC_SPI 411 IRQ_TYPE_LEVEL_HIGH>,
> >  				     <GIC_SPI 420 IRQ_TYPE_LEVEL_HIGH>,
> > -- 
> > 2.17.1
> > 
Regards,
Parikshit Pareek
