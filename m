Return-Path: <linux-arm-msm+bounces-98334-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WIjpJplTumm8UQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98334-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 08:26:17 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 511B12B6E95
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 08:26:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4401C30B6026
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 07:22:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5892C36A036;
	Wed, 18 Mar 2026 07:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aLSOB42H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1601036AB57;
	Wed, 18 Mar 2026 07:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773818527; cv=none; b=EBLi7fyDSG/35iEaQvfLl79eqcbtorOuZ6BZHW9FNa5+TTUnqkwJZysUs3M5c+VhOCNjyHTqU/W9AWJE6UwMI4Pe/rOyVJoF63m6dGkMvj20yQxAN9jLovd4HBtcjwdImSHtgV1XH9SVNBr024Zn2sGE1txv17iJhpmptzshCSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773818527; c=relaxed/simple;
	bh=97jkFTZ2QLTWWULqY9gy4tzeGCLUJK/ITKeY6ixTOcc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xacpkg1G1zCvQvOWzSLW9buz/Q8zBuPhv5fmArKz4PU1qHOX3nGb1n3TKAtW27D3r0EDFrrGmyFnVDf1/hxGTU4eWkH1W2GmGrA1vzzZ2KovBEGShn8sJAh0sbUUeg4zJ0ggliA/2+oXGg2szwWY6M9v79mLektPuYPCLyB0YeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aLSOB42H; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17EDCC19421;
	Wed, 18 Mar 2026 07:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773818526;
	bh=97jkFTZ2QLTWWULqY9gy4tzeGCLUJK/ITKeY6ixTOcc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aLSOB42H2HhgQk25sNC0Sq7chwqVyKs52OOCBptYSykaGt6SR/KKuoaWUC2H/ipgL
	 ySFLfxHN0V1OG1+Z8Fp2lcToaQsNUYHDmxLQStWgj73H+3QUDOBItrmN35w9xEn6RV
	 UFIiReECPWe+ZDR8CxzwhffmbKZrO99Zury458Wzm14khSvZkJrSbniwe3SbeSI9/e
	 vR7hFKLMB61MOTrv3D4uAYekuW0oz7IxX2LI1x+ABiTr2uG3v8S73Y/Gl3gvJbDwOB
	 2HITkjgkKkYIgrYKLIftp8IwA0Q+Qmo6wzkgEmqfqdvBjwelODy39a84dHarUgeuX/
	 yIs3w2lGs4WqQ==
Date: Wed, 18 Mar 2026 08:22:04 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Harshal Dev <harshal.dev@oss.qualcomm.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abel.vesa@oss.qualcomm.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, cros-qcom-dts-watchers@chromium.org, 
	Eric Biggers <ebiggers@google.com>, Jingyi Wang <jingyi.wang@oss.qualcomm.com>, 
	Tengfei Fan <tengfei.fan@oss.qualcomm.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	David Wronek <davidwronek@gmail.com>, Luca Weiss <luca.weiss@fairphone.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Melody Olvera <quic_molvera@quicinc.com>, 
	Alexander Koskovich <akoskovich@pm.me>, Brian Masney <bmasney@redhat.com>, 
	Neeraj Soni <neeraj.soni@oss.qualcomm.com>, Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Subject: Re: [PATCH v3 01/12] dt-bindings: crypto: qcom,ice: Allow
 power-domain and iface clk
Message-ID: <20260318-aboriginal-peach-bird-cacb8c@quoll>
References: <20260317-qcom_ice_power_and_clk_vote-v3-0-53371dbabd6a@oss.qualcomm.com>
 <20260317-qcom_ice_power_and_clk_vote-v3-1-53371dbabd6a@oss.qualcomm.com>
 <do62iaopjcahvn576gfcdbyo4yxudf4uit2sbifvjw3pwrlb7j@higm25fdesk3>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <do62iaopjcahvn576gfcdbyo4yxudf4uit2sbifvjw3pwrlb7j@higm25fdesk3>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98334-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[30];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,gondor.apana.org.au,davemloft.net,kernel.org,chromium.org,google.com,gmail.com,fairphone.com,linaro.org,quicinc.com,pm.me,redhat.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 511B12B6E95
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 17, 2026 at 05:12:36PM +0200, Dmitry Baryshkov wrote:
> On Tue, Mar 17, 2026 at 02:50:40PM +0530, Harshal Dev wrote:
> > Update the inline-crypto engine DT binding in a backward compatible manner
> > to allow specifying up to two clocks along with their names and associated
> > power-domain.
> 
> This should come after the "why" part.
> 
> > 
> > When the 'clk_ignore_unused' flag is not passed on the kernel command line
> > occasional unclocked ICE hardware register access are observed when the
> > kernel disables the unused 'iface' clock before ICE can probe. On the other
> > hand, when the 'pd_ignore_unused' flag is not passed on the command line,
> > clock 'stuck' issues are observed if the power-domain required by ICE
> > hardware is unused and thus disabled before ICE probe could happen.
> 
> You can simply say that ICE requires these clocks and these power
> domains to function. Accessing the hardware can fail if they are
> disabled by the kernel for whater reasons.

Yeah, mentioning clk_ignore_unused/pd is redundant here.

> 
> > 
> > To avoid these scenarios, the 'iface' clock and the associated power-domain
> > should be specified in the ICE device tree node and enabled by ICE.

And this repeats the first paragraph.

> > 
> > Fixes: f6ff91a47ac57 ("dt-bindings: crypto: Add Qualcomm Inline Crypto Engine")
> > Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
> > ---
> >  .../bindings/crypto/qcom,inline-crypto-engine.yaml       | 16 +++++++++++++++-
> >  1 file changed, 15 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
> > index 876bf90ed96e..99c541e7fa8c 100644
> > --- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
> > +++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
> > @@ -30,6 +30,16 @@ properties:
> >      maxItems: 1
> >  
> >    clocks:
> > +    minItems: 1
> > +    maxItems: 2
> > +
> > +  clock-names:
> > +    minItems: 1
> > +    items:
> > +      - const: core
> > +      - const: iface
> > +
> > +  power-domains:
> >      maxItems: 1

I do not see how you implemented my feedback, at all. Nothing from it.

I even provided you final clarifications. What is the point of asking me
for the third time, again, what should you do, if you just ignore it?

1. What the DTS is doing here?
2. How did you address "with explanation why this is a fix thus why this
should go to current cycle." - where is this part?
3. Where is Eliza and Milos?

I was repeating the last 2 points multiple times already.

Best regards,
Krzysztof


