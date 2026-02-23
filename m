Return-Path: <linux-arm-msm+bounces-93723-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eEVeG4J0nGmcGAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93723-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 16:38:42 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 102F2178D80
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 16:38:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 401983025E09
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 15:38:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1E642EDD62;
	Mon, 23 Feb 2026 15:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c5YdjTLc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA09285C88;
	Mon, 23 Feb 2026 15:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771861119; cv=none; b=uSMSB87Zk17UMJ0qFRKR7Tdmhu6ORxTRG4plcRD1eM1G61Kwn/nJRNZPMdsTxFQQytNKAVmcLZtvupl5NGYIsWOb+2SQ6wiY488Uzr2RC/ghywyQn2/XpPlpx2Cx2afME02oXw+iwP5D5c+bQZU79Vc3Z5eDirS6smqaaCbhNXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771861119; c=relaxed/simple;
	bh=SR5N+s5trZNvGm9faWX/wk0yJdYXSU3FOeiGfQGRrxw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C8/yWQvHY0g88fC3j2x50hPmnd8MianAZk38kELI9qCJti7Tlx3UrHuAeed9xPPg8hy9kN5t1/Jr/uypYaH+0X5cqh5uelc9UM+woe8KXvnHa9fCCO//zCJzv7g8ae4M9ErRefja8lPGAAU/bUVfQk7kp/vxiFciVoocRXmEuHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c5YdjTLc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E685C116C6;
	Mon, 23 Feb 2026 15:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771861119;
	bh=SR5N+s5trZNvGm9faWX/wk0yJdYXSU3FOeiGfQGRrxw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c5YdjTLcgT0m66EkJdWp7rZfvS5BmL4+6K2i8etW+yf1fq9VKgoq7erR35AgfL8v9
	 r/DEDADDho4HIwYv0QUqirOI9kpNEr8v1ZNsce4lst/jsenHARHpu+I4NxSSN9+AV0
	 cEFu/i3ZtitZIyIcxkvV3e6HmO7lv78/z6FuvGHT5ZM3QwRgr2Ma2pJ0472w2UMH0e
	 rXlABK07Ill9VW0rYg8D/h4QyNU+VuoTnNgcPidMf1JanfBq4f1qLnnXuYWZq6GHcI
	 RAX0OHNRP2O8WLsxqqCrdI72WnRHyYvm1Xnl5nf8TI5xAUesjCo1+NUcxNxegRlH+l
	 LF9w5/Ji0xvGg==
Date: Mon, 23 Feb 2026 09:38:36 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
Cc: Daniel J Blueman <daniel@quora.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: hamoa/x1: Fix TODO in system power
 domain node
Message-ID: <emh66tl7id5psuqkriswjizsz3gee54qj2id6dymildncrx66s@qzelmfgog35v>
References: <20260221105245.19328-1-daniel@quora.org>
 <9defac59-ae8a-4658-ab38-dcb0559d9708@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9defac59-ae8a-4658-ab38-dcb0559d9708@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93723-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 102F2178D80
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 09:41:04AM +0530, Maulik Shah (mkshah) wrote:
> 
> On 2/21/2026 4:21 PM, Daniel J Blueman wrote:
> > At present, designs based on the Qualcomm X1 Hamoa reference platform have an always-on system power domain since the OF node values aren't implement.
> 
> Implemented.
> 
> > 
> > Fix this by using the CPU C4, cluster CL5 and system DRIPS parameters from the ACPI DSDT Windows uses, together with the Low Power Idle _LPI minimum residency of 9000us and wake latency of 5000us as exit latency. Finally, assume the entry latency is the difference of these two values.
> 
> ACPI used 5000usec as total exit latency, with this change total exit latency will be 9000usec (sum of entry + exit).
> 
> > 
> > Tested on a Lenovo Yoga Slim 7x with Qualcomm X1E-80-100.
> > 
> > Fixes: f33767e3cfa5 ("arm64: dts: qcom: x1e80100: Add missing system-wide PSCI power domain")
> 
> Using this fixes tag, can make the change back ported to stable kernels without dependencies and may break the GPIO IRQs.
> 
> Background:
> 
> PDC monitors the wakeup capable IRQs during system wide low power state, hitting the system low power mode can break to wake via GPIO IRQs. 
> The system-wide idle state was not added since the wakeup capable GPIO IRQs were not configured at PDC with 602cb14e310a
> ("pinctrl: qcom: x1e80100: Bypass PDC wakeup parent for now").
> 
> So IMO this fixes tag should be used instead of above with the changes to configure PDC to monitor GPIO wake ups.
> I have these changes to configure GPIO IRQs at PDC and enable back domain_ss3 idle state in my local tree, which i plan to
> post this week or next.
> 

No, this patch does not fix 602cb14e310a ("pinctrl: qcom: x1e80100:
Bypass PDC wakeup parent for now"), please see
Documentation/process/stable-kernel-rules.rst on how to document
dependencies for fixes.

It could however be argued that this doesn't fix a bug with f33767e3cfa5
("arm64: dts: qcom: x1e80100: Add missing system-wide PSCI power
domain"), but instead just implements the missing domain-idle-state
(i.e. drop the Fixes).


PS. What I do expect is that 602cb14e310a ("pinctrl: qcom: x1e80100:
Bypass PDC wakeup parent for now") should have been reverted once the
PDC driver gained the necessary workarounds!

Regards,
Bjorn

> Thanks,
> Maulik
> 
> > Signed-off-by: Daniel J Blueman <daniel@quora.org>
> > ---
> >  arch/arm64/boot/dts/qcom/hamoa.dtsi | 10 +++++++++-
> >  1 file changed, 9 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> > index a17900eacb20..64338769bc85 100644
> > --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> > @@ -290,6 +290,14 @@ cluster_cl5: cluster-sleep-1 {
> >  				exit-latency-us = <4000>;
> >  				min-residency-us = <7000>;
> >  			};
> > +
> > +			domain_ss3: domain-sleep-0 {
> > +				compatible = "domain-idle-state";
> > +				arm,psci-suspend-param = <0x0200c354>;
> > +				entry-latency-us = <4000>;
> > +				exit-latency-us = <5000>;
> > +				min-residency-us = <9000>;
> > +			};
> >  		};
> >  	};
> >  
> > @@ -448,7 +456,7 @@ cluster_pd2: power-domain-cpu-cluster2 {
> >  
> >  		system_pd: power-domain-system {
> >  			#power-domain-cells = <0>;
> > -			/* TODO: system-wide idle states */
> > +			domain-idle-states = <&domain_ss3>;
> >  		};
> >  	};
> >  
> 

