Return-Path: <linux-arm-msm+bounces-100128-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CM2OGcxZxWkk9gQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100128-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 17:07:40 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C981F338237
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 17:07:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9A8FB304DCB6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 15:58:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63AC6405AA2;
	Thu, 26 Mar 2026 15:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BAcWM7ct"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5CD401A16;
	Thu, 26 Mar 2026 15:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774540729; cv=none; b=i6alan95lD4SV7aT8+9ekj/vrA2qoDWV7/EbVPfp30HNXSTk1mDxe5nVMB7EHi+WZqdQvEP4CKp+1J7LaHru0rx/y0JytaULzLN1S48aN+LJ9BWDewyVvCPLsvw4JaabNxkWVK2P+9A4v3pRMqgzU2Ru/mWyZqSNH9eDWgqOQEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774540729; c=relaxed/simple;
	bh=tTQxD9EHRYahV5vajLwoH5cOmwDwYqTZzE3aTrnmmRA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dwK9A8y2PZhmoVairrn+4Ep+O2rcfo3xQvrmvEq2/UrH4Nn3p5lDke76zzwkZo/7pzYUSJELgST40+qSt0jGzDbkbe34F9OVjZobRKYm8jg7Sgmdfn0Ke/x9ETllVq1wKDIyaPnzlaR1qm6Q3tc5gjwoi+D99vLAguZwR+0xP6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BAcWM7ct; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01FFDC116C6;
	Thu, 26 Mar 2026 15:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774540728;
	bh=tTQxD9EHRYahV5vajLwoH5cOmwDwYqTZzE3aTrnmmRA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BAcWM7ct+tSe96JXMXQjjuR+xRmsdakYqdUam7sAe1arIjeds+uoCtqwyQEcnIwRm
	 oddaBY8DCQZMFEmELY6vZXE18Hh4Hp/gHAEjydww9YpcK3OfHb7OQot5VlMtVUEQlj
	 yS5mxCVqf6t6luH62UWpXv2e3AP9Ro6DkJ7Fa+rw5/rDi0deE/gIE25empz+u2mTZT
	 77IMGTOkIvrEsbnJs7pQImnJiaEZAjkISToUzlxFFR1t3+2EqIprUULe3I39IQlDNL
	 KposIUGT64pgRYNa9w0hhwRwBl8ZnKwDoBdM51MZzhorgldWQWp+QuD+4ur1MOXKJ/
	 gLEJIvjbsTQQQ==
Date: Thu, 26 Mar 2026 10:58:45 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: konrad.dybcio@linaro.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, dmitry.baryshkov@linaro.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com
Subject: Re: [PATCH] arm64: dts: qcom: sm8750-mtp: Set sufficient voltage for
 panel nt37801
Message-ID: <acVWseivbxLQ_uDM@baldur>
References: <20260323102229.1546504-1-quic_amakhija@quicinc.com>
 <acHwvzjcvqNxUjm3@baldur>
 <ccb11c2a-4cf1-4486-be71-d4bcc983cee6@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ccb11c2a-4cf1-4486-be71-d4bcc983cee6@quicinc.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100128-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,quicinc.com:email,qualcomm.com:url]
X-Rspamd-Queue-Id: C981F338237
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 26, 2026 at 03:06:52PM +0530, Ayushi Makhija wrote:
> On 3/24/2026 7:34 AM, Bjorn Andersson wrote:
> > On Mon, Mar 23, 2026 at 03:52:29PM +0530, Ayushi Makhija wrote:
> >> The NT37801 Sepc V1.0 chapter "5.7.1 Power On Sequence" states
> >> VDDI=1.65V~1.95V, so set sufficient voltage for panel nt37801.
> >>
> > 
> > Please add Fixes: tag.
> > 
> 
> Hi Bjorn,
> 
> Sure, will add in new patchset.
> 
> >> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> > 
> > Please start using your oss.qualcomm.com address.
> > 
> >> ---
> >>  arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
> >> index 3837f6785320..6ba4e69bf377 100644
> >> --- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
> >> +++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
> >> @@ -462,7 +462,7 @@ vreg_l11b_1p0: ldo11 {
> >>  
> >>  		vreg_l12b_1p8: ldo12 {
> >>  			regulator-name = "vreg_l12b_1p8";
> >> -			regulator-min-microvolt = <1200000>;
> >> +			regulator-min-microvolt = <1650000>;
> > 
> > Are you sure it's not supposed to be 1.8V, given the name of the rail?
> > 
> > Regards,
> > Bjorn
> 
> There was already discussion regarding the minimum voltage for this regulator on sm8550 target
> on other upstream patch. 
> 
> Link: https://lore.kernel.org/all/aQQdQoCLeKhYtY7W@yuanjiey.ap.qualcomm.com/
> 
> This values is according to the NT37801 panel sec
> "The NT37801 Sepc V1.0 chapter "5.7.1 Power On Sequence" states 
> VDDI=1.65V~1.95V."
> 

Yes, so the panel requires 1.65V, so regulator-min-microvolt needs to be
at least that. But regulator-min-microvolt should account for all the
consumers of the rail, are there any others?

Which leads me to my question, the people designing the board named the
rail VREG_L12B_1P8 in the schematics, why didn't they name it
VREG_L12B_1P65?

Please check all the consumers and make the regulator-min-microvolt work
for all of them - if that's 1.65V, then your change is good.

Regards,
Bjorn

> Thanks,
> Ayushi
> 
> >>  			regulator-max-microvolt = <1800000>;
> >>  			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> >>  			regulator-allow-set-load;
> >> -- 
> >> 2.34.1
> >>
> 

