Return-Path: <linux-arm-msm+bounces-61003-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 56954AD59F0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 17:12:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7D8BD3A8E94
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 15:11:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 775991C173F;
	Wed, 11 Jun 2025 15:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cromLVAR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 462CA1AAA11;
	Wed, 11 Jun 2025 15:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749654662; cv=none; b=tnKrTHaIbG+zf2Q4JUItCezoqUZeu+u9aPXxI/xIdM3dsLwqGWgFBQZreC1mhvmWNyB7y9IhF2nFKcINH9po4RU8GobrV9wGSAOcBhc+7ZiACEi81gSDzCzTdbtYKELoBowjDzVDl7jOC1r/6KOEIGamSHkbXLM+Tkdokvqa6ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749654662; c=relaxed/simple;
	bh=0eNt8o6GRVqaVnWen5UM1J8DZaaLXXFgahGl8ogtMRo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EHbbpxes2MGk/+dKTUhgdsVITAT702SLp+P3O9YMlXmzspw+5vqyUS0BgOhs42bPVWAKRRAHUce00bBXwGNuGk0jRwl5DL90rCSkvJNAtHgY/qV8zPdNSW7itSumaSQ7pZ4Gx+ta/yf24XkmpBmJpjq4g3QBPBcQeayNOsqY/+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cromLVAR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41F4FC4CEEA;
	Wed, 11 Jun 2025 15:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749654661;
	bh=0eNt8o6GRVqaVnWen5UM1J8DZaaLXXFgahGl8ogtMRo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cromLVAR1qxFyMoCOKE5oGSPqzKSaqGn+9NBMQA6qTg7T8pHuwQCCLno78vgsAVAh
	 QZ7M9OtKBrMG173XinNt65nBlYcCWJIyxPNaamu9jFAvKKIsNVjVLt08GylSjxE3Bx
	 q4ZCxABFuiq7xIMRr3m925QHFVjmL5/tQZoMxdFyTh9sCGyZcEuEGk9BQE0N+FKQqQ
	 avQMmF8k8JKWsZ0rhi7yKaNz/0H0qL7TlU0Xmbu8mVkzxdsP3pGaawrJJd3AfYbnvp
	 FYbBNPvqKutjrjG6nfa/mZ4jIeMi5hmfvIiYXd2G3aIYtmMjU9q/AnO94D1O+vRsIi
	 DXEZJj5pjwSNg==
Date: Wed, 11 Jun 2025 10:10:59 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: sm8450: Enable retention for usb controller
 gdsc
Message-ID: <ufhknluapvb24r7p6sykxmj34gtjp6s4mejitj7d67uf6hobdq@4braukg5loxr>
References: <20250610092253.2998351-1-krishna.kurapati@oss.qualcomm.com>
 <sy33khkakjxi66amjbuugnypjnegvd4z4dyfzvrp72qkuv3roh@dxaymdc6cfad>
 <9b8ad81f-28e1-471e-a8fc-9e64578aaf4f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9b8ad81f-28e1-471e-a8fc-9e64578aaf4f@oss.qualcomm.com>

On Wed, Jun 11, 2025 at 10:35:36AM +0530, Krishna Kurapati wrote:
> 
> 
> On 6/11/2025 9:12 AM, Bjorn Andersson wrote:
> > On Tue, Jun 10, 2025 at 02:52:53PM +0530, Krishna Kurapati wrote:
> > > When USB controller enters runtime suspend while operating in host
> > > mode, then wakeup because of cable disconnect or a button press of
> > > a headset causes the following kind of errors:
> > > 
> > > Error after button press on a connected headset :
> > > 
> > > [  355.309260] usb 1-1: reset full-speed USB device number 2 using xhci-hcd
> > > [  355.725844] usb 1-1: device not accepting address 2, error -108
> > > 
> > > Error on removal of headset device from usb port:
> > > 
> > > [  157.563136] arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402
> > > ,iova=0xd65504710, fsynr=0x100011, cbfrsynra=0x0, cb=6
> > > [  157.574842] arm-smmu 15000000.iommu: FSR    = 00000402 [Format=2 TF],
> > > SID=0x0
> > > [  157.582181] arm-smmu 15000000.iommu: FSYNR0 = 00100011 [S1CBNDX=16 WNR
> > > PLVL=1]
> > > [  157.589610] xhci-hcd xhci-hcd.0.auto: WARNING: Host Controller Error
> > > [  157.596197] xhci-hcd xhci-hcd.0.auto: WARNING: Host Controller Error
> > > 
> > > Enabling retention on usb controller GDSC fixes the above issues.
> > > 
> > > Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> > > ---
> > > 
> > > Note:
> > > The above mentioned issues pop up after I enabled runtime suspend after
> > > applying [1].
> > > [1]: https://lore.kernel.org/all/20250610091357.2983085-1-krishna.kurapati@oss.qualcomm.com/
> > > 
> > 
> > It makes sense that the BCR issue appears after the flattening of dwc3,
> > but why would the suspend issue pop up?
> > 
> > The change matches what we do on many other platforms, but I've been
> > hoping we either could drop the retention or clearly document why it's
> > needed - so that we know if this should be on all or none of the SoCs.
> > 
> 
> Sure, will try to root cause why we are seeing issues during suspend (on
> sm8450) and come up with another patch.
> 
> But I remember on sc7280-herobrine (and IIRC while testing multiport on
> sa8295), when gdsc was not in retention, after entering suspend, we would
> see a disconnect and reconnect of connected peripherals during resume
> (probably because controller was in off state during suspend). When I tested
> with RET_ON in sc7280, I see the re-enumeration after resume never popped
> up.
> 

Sounds very reasonable that we'd need to keep the IP block in retention
for such use case. But if that's the case, then it sounds like we need
this for every SoC that supports host mode (I presume host or OTG).

It would also likely imply that we ultimately would want a mechanism to
toggle this behavior from dwc3-qcom to limit it to the times when we're
in host mode, or perhaps even only when something is connected?

If there are any power savings of turning the GDSC off, that is...

Regards,
Bjorn

> Regards,
> Krishna,
> 
> > Regards,
> > Bjorn
> > 
> > >   drivers/clk/qcom/gcc-sm8450.c | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/clk/qcom/gcc-sm8450.c b/drivers/clk/qcom/gcc-sm8450.c
> > > index 65d7d52bce03..f94da4a1c921 100644
> > > --- a/drivers/clk/qcom/gcc-sm8450.c
> > > +++ b/drivers/clk/qcom/gcc-sm8450.c
> > > @@ -3141,7 +3141,7 @@ static struct gdsc usb30_prim_gdsc = {
> > >   	.pd = {
> > >   		.name = "usb30_prim_gdsc",
> > >   	},
> > > -	.pwrsts = PWRSTS_OFF_ON,
> > > +	.pwrsts = PWRSTS_RET_ON,
> > >   };
> > >   static struct clk_regmap *gcc_sm8450_clocks[] = {
> > > -- 
> > > 2.34.1
> > > 

