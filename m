Return-Path: <linux-arm-msm+bounces-99994-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MOXxL/yexGki1gQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99994-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 03:50:36 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 572B632E806
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 03:50:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 747013021EAE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 02:44:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6F8838CFFE;
	Thu, 26 Mar 2026 02:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oUiFW7Ac"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36AD1F2380;
	Thu, 26 Mar 2026 02:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774493092; cv=none; b=ZOvLYuuBvc75S1Uu8xA9URxD0HN0RWX1TffJIxlcaftpDs30tYvN5guCFkmcTiVws38I/PnFXQB1o++cHidsXpdw6fiksqkQR+Q2e4CntCis90839z27cCb7IO0FbTMUUpS34VuD3mIG2ciuxW6Mv/5mS0UZtNfJFUeQZ+BUUKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774493092; c=relaxed/simple;
	bh=s+eNbr+lm+m4MHGpBkjbvChpcR9/fX8xfo96opgR86I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZFlKEymdF5C29P05YjYyNzYpYaj+erA210MuCBIcoCuJe/ZnxyyfOG8FpOWbM/1XmQVdEW2qr19bV/zJjRRpKrpD/vFrctw+6wDqpoV7HKHFMxMAfjgAvJebPOmjfjyDuEeN88OGOx7gVnzp0dw3NPeXHGiJhDOZM91GMcqOL0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oUiFW7Ac; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8610C4CEF7;
	Thu, 26 Mar 2026 02:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774493092;
	bh=s+eNbr+lm+m4MHGpBkjbvChpcR9/fX8xfo96opgR86I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oUiFW7AcSThkuSAeELCg9eaEviclBk2SB7JWr1xnLo1EcVhpvfJF1nC/8V4xMf5CG
	 1I2WuqJ8/1gKBBlbsCqIemRPwMg7MKxLpYiC4zTXoAGs6HXlD7SZy/h6eclJIPbhWU
	 5v/j6Y0V5L/hSj6peyBPXeiso3O8ffTHE1ZtC6eiLofMKxnkh1LglbKYXQu3ndY45q
	 JKFW+j/2h85bGBGz++O/sQuB1ypz/NZzzZkksTzgiK/0cWBmfoxNWuz18oopdGy/Vq
	 Lwum5C2nL5mvlhiQBTbKj6BLAJFFNmuLBM1EzIRuqX67Ln38/i7UXwv2hl0vUuK95h
	 +2tXatroBafEg==
Date: Wed, 25 Mar 2026 21:44:48 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: purwa: deduplicate thermal sensors
 with Hamoa
Message-ID: <acSdYbGX0O2oeI6O@baldur>
References: <20260320-purwa-drop-thermals-v1-1-2c9fe046cd02@oss.qualcomm.com>
 <f25eb68c-3877-4ce7-b3cd-0910a00be30a@oss.qualcomm.com>
 <xy2jzlamtkpqfpcpegoysyh6u2cnfubkz5233yvuuzfutzpxkf@w3inytibm3sq>
 <7d13d449-17e5-4838-b4bf-f9ce14e1142e@oss.qualcomm.com>
 <ftdzj5zcxs44zm3yyhv6hfwejkmxyfqb3w3snfeey2epmfuafz@qjl6ooz2gyzc>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ftdzj5zcxs44zm3yyhv6hfwejkmxyfqb3w3snfeey2epmfuafz@qjl6ooz2gyzc>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99994-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 572B632E806
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 25, 2026 at 01:13:28AM +0200, Dmitry Baryshkov wrote:
> On Tue, Mar 24, 2026 at 10:25:30AM +0100, Konrad Dybcio wrote:
> > On 3/23/26 5:49 PM, Dmitry Baryshkov wrote:
> > > On Mon, Mar 23, 2026 at 04:21:00PM +0100, Konrad Dybcio wrote:
> > >> On 3/20/26 3:33 AM, Dmitry Baryshkov wrote:
> > >>> Hamoa and Purwa have pretty close thermal zones definitions. The major
> > >>> difference is that several zones are absent (because of the lack of the
> > >>> CPU cluster) and several zones use tsens2 instead of tsens3.
> > >>>
> > >>> Instead of completely duplicating thermal zones for Purwa, reuse themal
> > >>> zones from Hamoa, patching them where required.
> > >>>
> > >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > >>> ---
> > >>
> > >> Slightly reluctantly:
> > > 
> > > Why? I'd really interested here.
> > 
> > I suppose my reluctance comes from the decreased readability, but then
> > I suppose the silicon is not going to change if we get it right once, so
> > it's not a real concern..
> 
> I see. My usual concern is opposite: to make sure that we don't need to
> fix another DT if we fix something.
> 

Which means that if you make a change to that "something" you now have
the burden to validate the additional users.

Regards,
Bjorn

> -- 
> With best wishes
> Dmitry

