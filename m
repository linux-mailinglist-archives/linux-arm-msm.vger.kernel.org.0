Return-Path: <linux-arm-msm+bounces-92343-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QH2JLFoVimlrGAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92343-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 18:11:54 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id CD487112EA8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 18:11:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 711473007286
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Feb 2026 17:11:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B5C237A496;
	Mon,  9 Feb 2026 17:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rB4t5dI9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 391A326B76A;
	Mon,  9 Feb 2026 17:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770657090; cv=none; b=T8XGtr61aI7k727H8b5M5v8ULuXEdDiLkI/aHjvGDSvFHXVohW6Da/kbtJpHj2Fy0N3gz5prtyNAEebYZD/0CrKcHlPgC51YpAb3EdWBR5r5tAvG6ooi6Y3SdUatihRypOr1xciJoscTXadlQuYERswVkWqpt0nORmgpUS10Cbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770657090; c=relaxed/simple;
	bh=Pux0lE1F1AhiwWUBuJ4TupnovoXkyaDnFGDLtlTmuic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ndyLqnmsurjsdYzPFHDCy4FNM87myUrbZnYqR79UVMlbR6HvaD1d7eOOZ6XOyiGrN+O1Kzkb4w1FS8nlVyFmuowaKm9QkDs0aDqnqYelNzWoh5SWO2EdBpB9cMiD0wlBSXsPpAwIKbzf9R1oL8fojmEeJmB+rkfP2xXCwrHtWhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rB4t5dI9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7AC1C116C6;
	Mon,  9 Feb 2026 17:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770657089;
	bh=Pux0lE1F1AhiwWUBuJ4TupnovoXkyaDnFGDLtlTmuic=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rB4t5dI9S3bIKB77Kk47oHmHwtZQmjuZv9lDNtRlH7YKiVgEnKviwTHHaYRN6L6ft
	 SA26HIf+kOf/ImwQ435Z7ERgpEqs6vFAD13tnEZfX/OaBt4BoEu4I4RHVdE9lpIp44
	 UXRY3vTQvtQUNSvYtMaxOccFqeLZ8PxC0HyqRtzldvNlsRM0TsrjBdeKTl/NvgDKtg
	 bYQJaD/UDSXWJI7kjtNZh8UhK3+glLC3Z2L0e9h456tTwTcTyUzF9qDSgutkh2yjcP
	 Z0z+yfLPrr2D2CIg84GkiB5438P8p7knP1fhHwIUbk3OEZGggLdSxW5h0IdVCp0Lxl
	 zHaz2nrx/CCrA==
Date: Mon, 9 Feb 2026 11:11:28 -0600
From: Rob Herring <robh@kernel.org>
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kumar Sharma <quic_vksharma@quicinc.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Lei Chen <quic_chenlei@quicinc.com>
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sm8550: Add tz-log node
Message-ID: <20260209171128.GC1401643-robh@kernel.org>
References: <20260129-sm8550-abl-dtbo-v1-0-abca3be14024@gmail.com>
 <20260129-sm8550-abl-dtbo-v1-2-abca3be14024@gmail.com>
 <eef70e37-3841-47f3-a436-13e18c157176@oss.qualcomm.com>
 <CALHNRZ-aj+rR0qFuiU+cPNsHWQgMJ2mMjzysJudY-TPN9tY3gg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALHNRZ-aj+rR0qFuiU+cPNsHWQgMJ2mMjzysJudY-TPN9tY3gg@mail.gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92343-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,qualcomm.com:email,quicinc.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,146aa720:email]
X-Rspamd-Queue-Id: CD487112EA8
X-Rspamd-Action: no action

On Mon, Feb 02, 2026 at 10:25:23PM -0600, Aaron Kling wrote:
> On Fri, Jan 30, 2026 at 4:59 AM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
> >
> > On 1/29/26 8:46 AM, Aaron Kling via B4 Relay wrote:
> > > From: Lei Chen <quic_chenlei@quicinc.com>
> > >
> > > Add DT node to enable tz-log driver.
> > >
> > > Signed-off-by: Lei Chen <quic_chenlei@quicinc.com>
> > > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > > ---
> >
> > It's nice that you preserved the original authorship.
> >
> > Please extend the rather lackluster commit message to explain the
> > "why", which is notably different from the original downstream
> > addition, since your goal here is to mainly appease a grumpy
> > bootloader.
> >
> > >  arch/arm64/boot/dts/qcom/sm8550.dtsi | 8 ++++++++
> > >  1 file changed, 8 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> > > index e3f93f4f412ded9583a6bc9215185a0daf5f1b57..740e3c238e8ed0f162dd168291f6e307ace66e80 100644
> > > --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> > > @@ -5136,6 +5136,14 @@ data-pins {
> > >                       };
> > >               };
> > >
> > > +             qcom_tzlog: tz-log@146aa720 {
> >
> > If we were to implement qcom,tz-log upstream, this would definitely
> > not be a node randomly in the middle of /soc, rather a child of
> > imem, most likely.
> >
> > Could you please check whether adding a qcom_tzlog label to *any*
> > node makes the BL happy enough? Does it need the properties that
> > this node has?
> 
> It does appear that ABL doesn't care about the path name, only the
> label. And given that the original change that worked had the label
> pointing at an empty node, it doesn't fail if all the properties are
> missing. I moved the node underneath an sram node and the bootloader
> loaded my dtbo just fine.
> 
> The imem/sram node, though... The numbers don't add up. Per the
> downstream dt, qcom,msm-imem@146aa000 has size 0x1000. Then
> tz-log@146AA720 has size 0x3000. Which... starts within the imem
> range, then blasts quite far outside of it. So... what should this end
> up looking like?
> 
> I should also note that an empty node at /soc@0/tz-log fails dt schema
> checks. I presume that adding any warnings would immediately get a
> patch nuked from orbit, which is why I fetched a real binding and node
> from CLO.

That's simply because tz-log has no addresss but is on a MMIO bus. Can't 
you just do:

/{
  qcom_tzlog: tz-log {};
};

With some note explaining the stupidity.

Rob

