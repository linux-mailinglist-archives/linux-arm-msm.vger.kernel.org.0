Return-Path: <linux-arm-msm+bounces-77846-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 27988BEBF33
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Oct 2025 00:52:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A99251A65469
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 22:52:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 662F82DC322;
	Fri, 17 Oct 2025 22:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F8heZjg+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38110223710;
	Fri, 17 Oct 2025 22:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760741537; cv=none; b=UbX7SrNndSUqbbgBOgN/37sA3/IrCG2u+zmkzaDdCGDczi+c2GE6ps/OfsXlQeBrLvwrOPYyAIqsF/bS+OJV7lD5epCVJZL3naRfq7cam4QS/YhJK/Mjvbb2X/rlt8Q45/YbtSThI2Jf/j+MDd7tdbNHVls1kn4IpJAJT54CmRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760741537; c=relaxed/simple;
	bh=9m38dHlYeupV7BLbp372QPrZPXXhaYcQGUiETcqMnUQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AXnEJUV81/gSAwHcgs5swvK1U3NT28AC43Ezlcjy7LwFzDTYSItuRXubMlraBLvslmkAvIdujstgbvrRW6uYLI/6gDXCyqgb3oIet/DuuTqkLedB4t2Ul7qEIO1DyPpK8o5khFF+XWFrn2tcgFc2q8PRwgDmc+Dauo32Yuc3sRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F8heZjg+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D79DFC4CEF9;
	Fri, 17 Oct 2025 22:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760741536;
	bh=9m38dHlYeupV7BLbp372QPrZPXXhaYcQGUiETcqMnUQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F8heZjg+XtWVM2qiYjl6ePyBS21vW7t/MbPfOmYrFBHujmXx7gzV9fU6rkYdLxcls
	 Is6cBMugc1RqaSdCe1kvooFJdxJJ7qqWLyXj0S51AtJANSkZKdoQJd5T4Gcm/Y+RE2
	 DimtuErPoZsfIpg0sGWf3D4XBU/t8bK9YRNEBy9wuU7VXrsyD3616jloftiRdjypD7
	 ZgjsrvsN7AKwyGoFl5vDCj69w7egpKtQYP/PZvYBh9zAnN9djZzsSUiIkLH3NLS7pI
	 1KKlcEqH2JQTSwyB6Yhoflu7FdhJVLV2CHdyiKWPIbps+ZDnskeX+H/R1AGuHdZYxc
	 rOnm9HcswqTdg==
Date: Fri, 17 Oct 2025 15:54:09 -0700
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>, marijn.suijten@somainline.org, swboyd@chromium.org, 
	mripard@kernel.org, abel.vesa@linaro.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, robin.clark@oss.qualcomm.com, 
	jessica.zhang@oss.qualcomm.com, abhinav.kumar@linux.dev, sean@poorly.run, airlied@gmail.com, 
	simona@ffwll.ch, alex.vinarskis@gmail.com, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com, quic_riteshk@quicnic.com, 
	quic_amitsi@quicnic.com
Subject: Re: [PATCH 3/4] arm64: dts: qcom: lemans-ride: Enable dispcc1
Message-ID: <62nvkgq4f5hoew4lbvszizplkm67t67dbpskej3ha6m55jnblx@vajuvual7lng>
References: <20250926085956.2346179-1-quic_mkuntuma@quicinc.com>
 <20250926085956.2346179-4-quic_mkuntuma@quicinc.com>
 <v4b35cmwbkoosdgs3d6ftml4yvdkyh27q65ssqojplb7uyniwp@wuxbeof7cikr>
 <869d1f94-9d66-4045-abdb-6e88d504a884@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <869d1f94-9d66-4045-abdb-6e88d504a884@oss.qualcomm.com>

On Wed, Oct 01, 2025 at 11:43:44AM +0200, Konrad Dybcio wrote:
> On 9/26/25 3:53 PM, Dmitry Baryshkov wrote:
> > On Fri, Sep 26, 2025 at 02:29:55PM +0530, Mani Chandana Ballary Kuntumalla wrote:
> >> This change enables display1 clock controller.
> >>
> >> Signed-off-by: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
> >> ---
> >>  arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi | 4 ++++
> >>  1 file changed, 4 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
> >> index c69aa2f41ce2..d4436bc473ba 100644
> >> --- a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
> >> +++ b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
> >> @@ -436,6 +436,10 @@ vreg_l8e: ldo8 {
> >>  	};
> >>  };
> >>  
> >> +&dispcc1 {
> >> +	status = "okay";
> > 
> > I think this one should be enabled by default. Unless Konrad or Bjorn
> > disagrees, please fix lemans.dtsi.
> 
> Of course there is no reason for clock controllers to be disabled
> 

On SC8280XP we have the same setup (two MDSS), there the clock
controller was left disabled because not all SKUs had that IP-block
accessible.

Whether this is the case of not for Lemans I don't know, if it is then
the commit message should have stated that.

Regards,
Bjorn

> Konrad

