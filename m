Return-Path: <linux-arm-msm+bounces-109262-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SHkhHfQ2EGoaVAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109262-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 12:59:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 151925B29CF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 12:59:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 746F1300616B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 10:57:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9143F3CC9FF;
	Fri, 22 May 2026 10:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kjm7fhHX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 697FC356756;
	Fri, 22 May 2026 10:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779447465; cv=none; b=P5O/2fZjPac5Je/9alodNl3I0B3KZkq9oepUwQ35MgMbetGqTo2XyWIpAyxHAKSTLIzpntq63VyfQFhNe6Ek1OFhEB3ieJfbGt+CbjoP9m6sdFZl96vZIinkBDh2hR6HL/jMBa6DshtTh6T4TRRRV4QNqG23kt8V/Yy+xZx8+MM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779447465; c=relaxed/simple;
	bh=9rIKsYfTFDdyRP5HlOH5qIGwdf3eIHfr9SbtB4Aabyg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dFJ4g+CmHjN6bRDASITOfU6GSfBrkkaidHNW3tHGgjKdyTN4dBIr+T+Di+Ua7Uz0zwglLV5/2cJUpXywUnTmBmNN+PYsH6gYGKCw5me/irYrMzc86ZjMbCQkmeFFo5NwzFzzkWpZC4+JFz7xrHuuYIV0rmZ3VKKcKOx4KRQaGyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kjm7fhHX; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F6471F000E9;
	Fri, 22 May 2026 10:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779447464;
	bh=x55ir9CbNnQ6s4TZzGXMmcUz/OBLZ2NJfrzb19xzIGg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kjm7fhHXvrxwOJGNlaCoiWsKNXxDj+zOtCx7U1Wcu5qSkfLiLLh25seajR0hDIHdp
	 TlIJgORblyqp1DJp03u0iv0e0aBK0XwzmP1NGyv7FdBqRdRb67iZcrpnWDS3h7pV0b
	 dQAtLaXJ/D/fMNKIeNhVAOGerJJsDT+0N1zkv5vQ75GTlqqZkCPgqmiPDB4oSd5c5j
	 fcilbWalrXtQHSRPqG/emQV7sN/fWP6OA8keRi+oG7hpwkUq1b/px6Q5p6o888eFsW
	 hCfC5nYYlsp7eXLtVt5y52z/IMCX0lBLkFGCVFadYrIvwcSDpuCSdBWHPlJIC8GoxU
	 I0W7gzafPob8w==
Date: Fri, 22 May 2026 16:27:35 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Qiang Yu <qiang.yu@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v4 5/9] phy: qcom: qmp-pcie: Refactor pipe clk
 register and parse_dt helpers
Message-ID: <fkcidw46hdsrrufxhhkk66mmitxnswmghpypyvtmax3x6vmnlp@2er6xgymxdf2>
References: <20260518-link_mode_0519-v4-0-269cd73cc5d1@oss.qualcomm.com>
 <20260518-link_mode_0519-v4-5-269cd73cc5d1@oss.qualcomm.com>
 <ipzncrxi3x45fc6tz5xb7frxt62zmg4gwr25xmvzghlbt5miio@7eavln3cydfa>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ipzncrxi3x45fc6tz5xb7frxt62zmg4gwr25xmvzghlbt5miio@7eavln3cydfa>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109262-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 151925B29CF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 20, 2026 at 07:25:01PM +0300, Dmitry Baryshkov wrote:
> On Mon, May 18, 2026 at 10:47:16PM -0700, Qiang Yu wrote:
> > Some QMP PCIe PHY hardware blocks can be split into multiple sub-PHYs
> > under a single DT node, each requiring its own pipe clock registration and
> > DT resource mapping. The current helpers are tightly coupled to a single
> > qmp_pcie instance, which prevents reuse across sub-PHY instances.
> > 
> > Refactor __phy_pipe_clk_register() as a generic helper and reduce
> > phy_pipe_clk_register() to a thin wrapper around it. Similarly, extract
> > qmp_pcie_parse_dt_common() from qmp_pcie_parse_dt() to hold the register-
> > mapping and pipe-clock setup that will be shared between sub-PHY instances,
> > with pipe clock names parameterised per instance.
> > 
> > This is a preparatory step before adding multi-PHY support. No functional
> > change for existing platforms.
> > 
> > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > ---
> >  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 76 ++++++++++++++++++--------------
> >  1 file changed, 44 insertions(+), 32 deletions(-)
> 
> I'd suggest splitting the Glymur PHY to a separate driver. Otherwise we
> end up having too many single-platform, single-device specifics which
> don't apply to other platforms.
> 

I don't think that's really needed. This shared PHY concept is going to be
applicable to upcoming SoCs as well. And moreover, the split won't be clean
either. We still need to reuse a lot of common logic in the 'phy-qcom-qmp-pcie'
driver and may only end up keeping very minimal code in
'phy-qcom-qmp-pcie-glymur'.

If you are concerned about the file size of 'phy-qcom-qmp-pcie', then we should
move the SoC specific 'cfg' structs into a separate file as that's what
occupying majority of the space.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

