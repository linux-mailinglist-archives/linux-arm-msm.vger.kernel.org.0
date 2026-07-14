Return-Path: <linux-arm-msm+bounces-119097-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6fxzKUSuVmpKAAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119097-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 23:46:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E84FA7590BE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 23:46:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Vin2UnpZ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119097-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119097-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A22D130B238A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 21:45:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16AC6429CF8;
	Tue, 14 Jul 2026 21:45:22 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 056943EDE59;
	Tue, 14 Jul 2026 21:45:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784065522; cv=none; b=gUtx/O7cHHO6ScclgTjjTzOndE6T38ks9yJ1oPTadSpl6DB/cswtZ0Wwl2gv7/QBlIhd5Rdl4SZrnDRh/T8F2zAFCZ/EPPG86BVc0U+b6239FgJi+PxBPutVd9ZxHtxG6RN/yWxcwyGrEkvB5fc9SSaRC03kXWEBfOKsglHSslc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784065522; c=relaxed/simple;
	bh=VzP6G29arfVHBzyobaaJmu18G5z9zE0CcRLfN9+MoJQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XTt7/MpgrwO4Qb2upYxQcTEmXkS0Vh7AJhbNkfimhhuPQpT096ETUaOZA7Duyo9Z9xCk9gVoX6QYtIkV8U3/4yfroG6RMy/KgI+1BqlB93MxDgOBBSZ1B9SOU3FPVPsDHa6jE70cqf5TSAGpWz4lY2TiYWQvr9FWJTtakW+rjrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vin2UnpZ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 856C01F000E9;
	Tue, 14 Jul 2026 21:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784065520;
	bh=6U0YUuRk6xW0tRmeT06lRlocuYSV9155/wLIZP3WcTg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Vin2UnpZpAhB84PLdnADBR1uHzDpPuT1nDSk3AiKEUWVAEt6yNSbJ/rw0nHny34/a
	 WMNa1gyOg5ZhY6uG2ASQ7mdwNVI3ctmU0SgeYdYQ/uF+16mABrnfYrmwUoxpk2u/cF
	 pN03rJuizEigAki8I8UW/OT02L4W+jEwR3qUm9r2O215SHHBdgI/MtIUGTBzotYur2
	 HCxGpHi6IApbDKE8lPzEbxjjGrPnzHzWiYZLL1Zmf3frMyOdRkwcBRGTAmzpIKQLCV
	 6ZIc491qD4VcOHc3JwHsYgIGXejgVLBeP/wYZs++6YnDwnoi5i9YnxC9R3u+50h9XL
	 YcPXEesE7r/pQ==
Date: Tue, 14 Jul 2026 16:45:19 -0500
From: Rob Herring <robh@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: krzk+dt@kernel.org, mturquette@baylibre.com,
	linux-remoteproc@vger.kernel.org,
	Alexandru Gagniuc <mr.nuke.me@gmail.com>,
	mathieu.poirier@linaro.org, conor+dt@kernel.org,
	konradybcio@kernel.org, sboyd@kernel.org, p.zabel@pengutronix.de,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: (subset) [PATCH v2 0/9] remoteproc: qcom_q6v5_wcss: add native
 ipq9574 support
Message-ID: <20260714214519.GA2851152-robh@kernel.org>
References: <20260109043352.3072933-1-mr.nuke.me@gmail.com>
 <178370682987.2572738.13491033810212556744.b4-ty@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178370682987.2572738.13491033810212556744.b4-ty@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-119097-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:krzk+dt@kernel.org,m:mturquette@baylibre.com,m:linux-remoteproc@vger.kernel.org,m:mr.nuke.me@gmail.com,m:mathieu.poirier@linaro.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:sboyd@kernel.org,m:p.zabel@pengutronix.de,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:krzk@kernel.org,m:mrnukeme@gmail.com,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,vger.kernel.org,gmail.com,linaro.org,pengutronix.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E84FA7590BE

On Fri, Jul 10, 2026 at 01:07:04PM -0500, Bjorn Andersson wrote:
> 
> On Thu, 08 Jan 2026 22:33:35 -0600, Alexandru Gagniuc wrote:
> > Support loading remoteproc firmware on IPQ9574 with the qcom_q6v5_wcss
> > driver. This firmware is usually used to run ath11k firmware and enable
> > wifi with chips such as QCN5024.
> > 
> > When submitting v1, I learned that the firmware can also be loaded by
> > the trustzone firmware. Since TZ is not shipped with the kernel, it
> > makes sense to have the option of a native init sequence, as not all
> > devices come with the latest TZ firmware.
> > 
> > [...]
> 
> Applied, thanks!
> 
> [1/9] remoteproc: qcom_q6v5_wcss: drop unused clocks from q6v5 struct
>       commit: 22afc6163c0c7a144d24a09352b87719d64d5f65
> [2/9] dt-bindings: remoteproc: qcom,ipq8074-wcss-pil: convert to DT schema
>       commit: 2a756ac4d98efc97503629fcaddb2e7c46255824
> [4/9] dt-bindings: remoteproc: qcom: add IPQ9574 image loader
>       commit: bc33b5b5e23a389e660c3d696cd2e043fdf33ef7

Why is a 6 month old patchset with reported errors being applied? 
Anyways, linux-next is now broken. Please fix.

Rob

