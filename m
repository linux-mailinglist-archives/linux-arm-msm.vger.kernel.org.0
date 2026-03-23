Return-Path: <linux-arm-msm+bounces-99290-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gKiZKYdMwWlbSAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99290-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 15:21:59 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7FC2F44BA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 15:21:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 688D530B33F6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 14:07:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E24A3B893A;
	Mon, 23 Mar 2026 14:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aXyzB8hB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A3D03B8933;
	Mon, 23 Mar 2026 14:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774274596; cv=none; b=rUCIAFVUNAQsXWyIutnAGYr86ZhqAfhMNy/LBf8TN+eHNSy60A2QC8upfEuGLI5X3jPFlWBXg9k0IBDQzNthYcQgX5x4FxmMs+VWywLLPPe0tjYdKzafm/+KyY4gseuRBBYWWy53+nvPgk0yhc9ygN3Zzl5C6JXthE5blhqqE0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774274596; c=relaxed/simple;
	bh=qA/7Af9OLrXRXQW3iLR7Qv2MAkirMfzLk2jcaukagF8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ekcN8Y53K9JsTPSqSjGqiOLxGolgEj12kfDo6CNOMd4pnr0fpCchh+w2VcWAzGwB2x+qbncCacbyR4R1HbFKAmWj6n+2Ke0Ady3J3VQTfliWFIN0uWI2MqrgV1tvlaDd+DsUxHhMeFXjTmN/0GtkYXnWgbTqdw2iHG+ZvAE9rM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aXyzB8hB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E759AC4AF09;
	Mon, 23 Mar 2026 14:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774274595;
	bh=qA/7Af9OLrXRXQW3iLR7Qv2MAkirMfzLk2jcaukagF8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aXyzB8hBxufwqY7Ww1VMtnsojIih23nqrCAO1R5Ro1DhWc49UMTv1or0KaDy5qakh
	 iqb1erAgY1FD+AhcrURjYREbBCsqmHe/PsJR/e+S7gc2QXkdKO0v+PAZoKcXPL9K8s
	 ZauZAQeB0e4BtE9mNZF3o6R6qeQJKtG8QtTQP71+g/8NNSdBEtbkxoDIj9cSUq4zLm
	 JIHe0w5C8FxZ2c8Jz1+rFnXxVWERsXs389sYM6An5SFBbjA2Zkt5LTgmNe+zNoknyK
	 YxPKKcWmnQdWyKOR8pfPDgbK010cLiz4KE2GZrkGeDsjQT6i1AxOi6xnT5ZKDeMpp/
	 NJdUmBROGXN1A==
Date: Mon, 23 Mar 2026 09:03:11 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: glymur: add coresight nodes
Message-ID: <acFGhpVWaHZtiyTq@baldur>
References: <20260318-add-coresight-dt-nodes-for-glymur-v2-1-d76e08f21fa5@oss.qualcomm.com>
 <ef89e328-fda6-43f4-b40c-8834d16e2cfd@oss.qualcomm.com>
 <7972211e-d735-4401-ada9-b83c7b96b612@oss.qualcomm.com>
 <a73af369-b122-43d2-b28f-e97ab33352c9@oss.qualcomm.com>
 <f28fe058-d1b7-4d4f-8751-54117aba95f8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f28fe058-d1b7-4d4f-8751-54117aba95f8@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99290-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,11c4b000:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,11c42000:email]
X-Rspamd-Queue-Id: 0E7FC2F44BA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 09:27:41PM +0800, Jie Gan wrote:
> 
> 
> On 3/23/2026 9:02 PM, Konrad Dybcio wrote:
> > On 3/23/26 1:30 PM, Jie Gan wrote:
> > > 
> > > 
> > > On 3/23/2026 7:05 PM, Konrad Dybcio wrote:
> > > > On 3/18/26 12:42 PM, Jie Gan wrote:
> > > > > Add CoreSight nodes to enable trace paths like TPDM->ETF/STM->ETF.
> > > > > These devices are part of the AOSS, CDSP, QDSS, PCIe5, TraceNoc and
> > > > > some small subsystems, such as GCC, IPCC, PMU and so on.
> > > > > 
> > > > > Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> > > > > ---
> > > > > Changes in V2:
> > > > > 1. removed two cti devices due to GFX block is down
> > > > 
> > > > i.e. "because GPU is not yet enabled"?
> > > 
> > > Yeah, these CTI devices have clock issue for enabling due to the GPU block is not yet enabled.
> > 
> > Do they need the GPU to be online, or a clock from GPU_CC, or
> > maybe something else?
> 
> We need a specific debug clock inside the GPU block. The debug clock only
> can be enabled while GPU is online.

What happens once GPU has been delivered, but for some reason is
inactive and we try to use this CTI device?

> Also needs AOP to support enable/disable
> the debug clock.
> 

When you hit such dependencies, please write and contribute the patch
(in this case, you can do it in a separate patch/series).

Regards,
Bjorn

> > 
> > > > >      - cti@11c42000
> > > > >      - cti@11c4b000
> > > > > 2. changes two TPDM devices to static:
> > > > >      - tpdm-cdsp-cmsr
> > > > >      - tpdm-cdsp-cmsr2
> > > > 
> > > > They were TPDM instances in v1. What's the reason for the change?
> > > 
> > > These TPDMs havent clock source for accessing registers. We only need enable its ports to output trace data. So I have changed them to static-TPDM compatible.
> > 
> > The registers are clearly physically there. Are you saying that we
> > (currently?) can't enable the clock required to access them? Or is
> > there a design defect that's preventing us from doing so?
> 
> It's about hardware design. Some of the TPDM devices are designed as static,
> means we dont need access the register of the device for configuring. The
> trace data of the static TPDM is enabled by default, we only need enable the
> port of the connected TPDA device for receiving the data.
> 
> I have tested these devices with Jtag attached, so I didnt observe issue
> about these new devices in the CDSP block. (Jtag will provide debug
> capability for all debug devices) Also cross-checked with hardware team for
> confirming these devices are working as static.
> 
> Thanks,
> Jie
> 
> > 
> > Konrad
> > 
> 

