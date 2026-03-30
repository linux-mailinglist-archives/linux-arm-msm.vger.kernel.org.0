Return-Path: <linux-arm-msm+bounces-100816-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mKC3MjeKymn09gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100816-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 16:35:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B873D35CF81
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 16:35:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 827F130225C8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 14:28:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C5553A1A27;
	Mon, 30 Mar 2026 14:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O7cMcjwe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56EF91AF0BB;
	Mon, 30 Mar 2026 14:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774880926; cv=none; b=AVrm6uR9YEEmi3BkX7Q2Zz/IE5g+yea4eVVudZjFx4bl+99igcGCzPFgLz+UVvlKfB7K6quwXcj0Y8M6/dDZiTC96qBGfk+5ghl2FjAaYQdUqCDLofnJnqbCZzhxV1/bDwBwmho7pTSqTl2fBIQX8NoGoQqpcKIqVRs7NFXbfBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774880926; c=relaxed/simple;
	bh=OoPe8AbkdWCfK+Bx27MFyVex52ff4rXkE2+CiqmLJxQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nSh8M0fZk+Q9dJ/SsQYK7z6DcRgomn2HdLXCmDnmp6fUP5IAypQsNvrX72pYNrXMv5+VCK91YMJOChQu1xV+opN5iL1+0Hr2Wq9w927cL3JoQScVj3P9P5s+7cDsIM3YP7HDNXauyR1pYSblDQNf8164OdH0hmbTfPE5FXla6Es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O7cMcjwe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DDA1C4CEF7;
	Mon, 30 Mar 2026 14:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774880926;
	bh=OoPe8AbkdWCfK+Bx27MFyVex52ff4rXkE2+CiqmLJxQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O7cMcjweWItBG0J6SJKa9mc/r180E1Am1NLMtsywGPX9btnU1BI/+27tGNPrm4hzZ
	 lC1m3oNFs8IYaL1OP0GjP/t5HKMvCEs4ZreLTTipC5Y1ncnzo743uasRJVDgW+Vkb2
	 Yy63n8cR+iXT/Jo06u9K4FGmRktSiHQ9JrmPbz7MWBD9CeMFTwMtS1KMMtLt8R/yXL
	 MR20oqGh8asm7DkO4clBY0xHThVMbeD6AZFFgVBj1Ga+YcB4CFZXHL0HadzEOzlx+D
	 j1nkodPY2C+EKgDwL30i5CQXLp7c1jtTwxVD+iApBCgrSLfaGSszPxsseR29sPG/U4
	 mWp2ILgmY+h7g==
Date: Mon, 30 Mar 2026 09:28:40 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Ritesh Kumar <quic_riteshk@quicinc.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, 
	abhinav.kumar@linux.dev, sean@poorly.run, marijn.suijten@somainline.org, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, 
	simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	quic_mahap@quicinc.com, konradybcio@kernel.org, mani@kernel.org, 
	James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com, vkoul@kernel.org, kishon@kernel.org, 
	cros-qcom-dts-watchers@chromium.org, linux-phy@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org, quic_vproddut@quicinc.com
Subject: Re: [PATCH v4 1/2] dt-bindings: phy: qcom-edp: Add reference clock
 for sa8775p eDP PHY
Message-ID: <acqGFwaVFQ3ZNmlR@baldur>
References: <20260128114853.2543416-1-quic_riteshk@quicinc.com>
 <20260128114853.2543416-2-quic_riteshk@quicinc.com>
 <gurq34svc5p52bqx5qwkgjmschzcbklmssjzmu2tg5wzgppkft@c6nrw2ageyp2>
 <c77ff64f-57d1-4495-bfbd-986644aad71d@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c77ff64f-57d1-4495-bfbd-986644aad71d@quicinc.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100816-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[30];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,linux.intel.com,suse.de,gmail.com,ffwll.ch,quicinc.com,hansenpartnership.com,oracle.com,chromium.org,lists.infradead.org,vger.kernel.org,lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B873D35CF81
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 06:37:31PM +0530, Ritesh Kumar wrote:
> 
> On 3/5/2026 12:27 AM, Bjorn Andersson wrote:
> > On Wed, Jan 28, 2026 at 05:18:49PM +0530, Ritesh Kumar wrote:
> > > The initial sa8775p eDP PHY binding contribution missed adding support for
> > > voting on the eDP reference clock. This went unnoticed because the UFS PHY
> > > driver happened to enable the same clock.
> > > > After commit 77d2fa54a945 ("scsi: ufs: qcom : Refactor
> > phy_power_on/off
> > > calls"), the eDP reference clock is no longer kept enabled, which results
> > > in the following PHY power-on failure:
> > > > phy phy-aec2a00.phy.10: phy poweron failed --> -110
> > > > To fix this, explicit voting for the eDP reference clock is
> > required.
> > > This patch adds the eDP reference clock for sa8775p eDP PHY and updates
> > > the corresponding example node.
> > > > Signed-off-by: Ritesh Kumar <quic_riteshk@quicinc.com>
> > 
> > Is there any reason why you didn't follow up on this patch Ritesh?
> > Looks like it's ready to be merged.
> 
> I was waiting for patch to merge as there is no pending comments.
> 

It's been two months now, if you want your patches to be merged please
show that - ask the maintainer for a status update, ask a colleague to
send a reviewed-by...

Perhaps the maintainer lost track of your change?

Perhaps it's not clear that the change "need" an Ack from e.g. Dmitry
and then it should be merged by Vinod? Because you're changing two
different subsystems but leave it up to the maintainers to figure out
how to deal with this...


Either way, show that you want this to be merged, don't just wait until
the situation resolves itself.

Regards,
Bjorn

> > Reviewed-by: Bjorn Andersson <andersson@kernel.org>
> > 
> > Regards,
> > Bjorn
> > 
> > > ---
> > >  .../devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml  | 6 ++++--
> > >  Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml     | 1 +
> > >  2 files changed, 5 insertions(+), 2 deletions(-)
> > > > diff --git
> > a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
> > b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
> > > index e2730a2f25cf..6c827cf9692b 100644
> > > --- a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
> > > +++ b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
> > > @@ -200,9 +200,11 @@ examples:
> > >                    <0x0aec2000 0x1c8>;
> > >  >              clocks = <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_AUX_CLK>,
> > > -                     <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>;
> > > +                     <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
> > > +                     <&gcc GCC_EDP_REF_CLKREF_EN>;
> > >              clock-names = "aux",
> > > -                          "cfg_ahb";
> > > +                          "cfg_ahb",
> > > +                          "ref";
> > >  >              #clock-cells = <1>;
> > >              #phy-cells = <0>;
> > > diff --git a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
> > > index 4a1daae3d8d4..0bf8bf4f66ac 100644
> > > --- a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
> > > +++ b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
> > > @@ -74,6 +74,7 @@ allOf:
> > >          compatible:
> > >            enum:
> > >              - qcom,glymur-dp-phy
> > > +            - qcom,sa8775p-edp-phy
> > >              - qcom,x1e80100-dp-phy
> > >      then:
> > >        properties:
> > > -- > 2.34.1
> > >

