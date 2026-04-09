Return-Path: <linux-arm-msm+bounces-102494-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OCl4IbKs12kMRQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102494-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 15:42:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD353CB6DE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 15:42:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9CBB8304C634
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 13:35:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE2722DFF04;
	Thu,  9 Apr 2026 13:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ir/bjUW9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D302D839C;
	Thu,  9 Apr 2026 13:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775741752; cv=none; b=IWMJbtXskyJcD6aoKdeiYrM/u6DVoFbM5WEK3X0Asac7zWY7qZ1Y+mielIalLFz3bYcJjjIL1PXDV5+1VLKVnOcJQO5rzC49vOmhSrLWRUcJ2G25wZvWq/D8Pdr1V2FpzYTc0JyoC3NvSjmKWJkwlGG2aukQyQV3yFlCZJMBYdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775741752; c=relaxed/simple;
	bh=MWnfDUX5Bn1amz9RWj+IvqpmjxnGH9WloQN74pV7aos=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jyv9cUv73nfTQTJ0LbFV8h4eQ/PbTITi10C2xZH/THPzgg12pDYjBaaHjNNbO9IoRAEeB7WJYXA1Dd01LQ9pY+UsYbacKzWp6KN7Ylb3WqD/xTOmHnabJwv5SrvmRETBSsC+ZP4QRi/3o4yXlvQnWFa45w11ZjP/aaHTYtjDQj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ir/bjUW9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24461C4CEF7;
	Thu,  9 Apr 2026 13:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775741752;
	bh=MWnfDUX5Bn1amz9RWj+IvqpmjxnGH9WloQN74pV7aos=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ir/bjUW9ThRhaZ203luNRVUsqGSeIUoUU8tPBLVV5ANuPqk/k7JlZVBb/Ns8U9dMB
	 HJGs52+D01DoLh7gVyZTGuF4Ru1SNXfCPC3SMyXPx5vAMLF7qNJNEvQVI20VF6MglW
	 iudkSFtfG4LeyqvRYqyLTYcaAL1KcvxJElPrmwsOg803b6DOdXu4CIs022WwhP0ytJ
	 lBvCwRfx89GEbfJAJ6bsIHoWZUcdA8huRgoy9r7P4uJM7upGKGrMcu+dJs0UB3mRWN
	 GQ3RPgwmWuSzJFx7RE91wPxdYcsd8LWR0JlQktEOlDoVSCT6mAHEiCIr8de//yssjs
	 Vc+nGmeI0QGEQ==
Date: Thu, 9 Apr 2026 08:35:48 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: konrad.dybcio@linaro.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, dmitry.baryshkov@linaro.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com
Subject: Re: [PATCH] arm64: dts: qcom: sm8750-mtp: Set sufficient voltage for
 panel nt37801
Message-ID: <adeq_lGG0x3sekUU@baldur>
References: <20260323102229.1546504-1-quic_amakhija@quicinc.com>
 <acHwvzjcvqNxUjm3@baldur>
 <ccb11c2a-4cf1-4486-be71-d4bcc983cee6@quicinc.com>
 <acVWseivbxLQ_uDM@baldur>
 <75d22f54-eb55-4e55-9582-5b407f41ee81@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <75d22f54-eb55-4e55-9582-5b407f41ee81@quicinc.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102494-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:url]
X-Rspamd-Queue-Id: 2CD353CB6DE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 09, 2026 at 11:14:10AM +0530, Ayushi Makhija wrote:
> On 3/26/2026 9:28 PM, Bjorn Andersson wrote:
> > On Thu, Mar 26, 2026 at 03:06:52PM +0530, Ayushi Makhija wrote:
> >> On 3/24/2026 7:34 AM, Bjorn Andersson wrote:
> >>> On Mon, Mar 23, 2026 at 03:52:29PM +0530, Ayushi Makhija wrote:
> >>>> The NT37801 Sepc V1.0 chapter "5.7.1 Power On Sequence" states
> >>>> VDDI=1.65V~1.95V, so set sufficient voltage for panel nt37801.
> >>>>
> >>>
> >>> Please add Fixes: tag.
> >>>
> >>
> >> Hi Bjorn,
> >>
> >> Sure, will add in new patchset.
> >>
> >>>> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> >>>
> >>> Please start using your oss.qualcomm.com address.
> >>>
> >>>> ---
> >>>>  arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 2 +-
> >>>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
> >>>> index 3837f6785320..6ba4e69bf377 100644
> >>>> --- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
> >>>> +++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
> >>>> @@ -462,7 +462,7 @@ vreg_l11b_1p0: ldo11 {
> >>>>  
> >>>>  		vreg_l12b_1p8: ldo12 {
> >>>>  			regulator-name = "vreg_l12b_1p8";
> >>>> -			regulator-min-microvolt = <1200000>;
> >>>> +			regulator-min-microvolt = <1650000>;
> >>>
> >>> Are you sure it's not supposed to be 1.8V, given the name of the rail?
> >>>
> >>> Regards,
> >>> Bjorn
> >>
> >> There was already discussion regarding the minimum voltage for this regulator on sm8550 target
> >> on other upstream patch. 
> >>
> >> Link: https://lore.kernel.org/all/aQQdQoCLeKhYtY7W@yuanjiey.ap.qualcomm.com/
> >>
> >> This values is according to the NT37801 panel sec
> >> "The NT37801 Sepc V1.0 chapter "5.7.1 Power On Sequence" states 
> >> VDDI=1.65V~1.95V."
> >>
> > 
> > Yes, so the panel requires 1.65V, so regulator-min-microvolt needs to be
> > at least that. But regulator-min-microvolt should account for all the
> > consumers of the rail, are there any others?
> > 
> > Which leads me to my question, the people designing the board named the
> > rail VREG_L12B_1P8 in the schematics, why didn't they name it
> > VREG_L12B_1P65?
> > 
> > Please check all the consumers and make the regulator-min-microvolt work
> > for all of them - if that's 1.65V, then your change is good.
> > 
> > Regards,
> > Bjorn
> 
> Hi Bjorn,
> 
> There is only one consumer of VREG_L12B_1P8 rail, i.e. NT37801 panel.
> So regulator-min-microvolt as 1.65V should be fine for VREG_L12B_1P8 rail.
> 

Had to look it up myself. MTP power grid says it should be 1.8V.

Thank you,
Bjorn

> Thanks,
> Ayushi
> 

