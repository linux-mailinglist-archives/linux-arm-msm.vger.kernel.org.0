Return-Path: <linux-arm-msm+bounces-95941-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MHAbDfwArGntiwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95941-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 07 Mar 2026 11:42:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A0B22B1DD
	for <lists+linux-arm-msm@lfdr.de>; Sat, 07 Mar 2026 11:42:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AE222301370D
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Mar 2026 10:41:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 774A738B7A4;
	Sat,  7 Mar 2026 10:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z467zIqt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 513A638A704;
	Sat,  7 Mar 2026 10:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772880118; cv=none; b=rJJq2NXDdoclpJ5rI7iTpHIpXOAv5uQkajVxRKh/bEac4DHoJkisI1bkE45y2IaS7Me7dBLUms0FQyn0juT/uhevTSY3KOQ7PYT6xlSTygZ2tg9uIG+rOr2QmTq6MkkHKuvtFW660LunL184pNSPRWDszj5ys/uJar9VIYvugm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772880118; c=relaxed/simple;
	bh=T/aHKlqAw6W/3+ANfeBg4MJKKh0JMcXp1rJg0bYcTlE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YjhFB9cDhyldaEe/UtinpiJ7vjxsRgGNNbbSCewAbyjAVKFuwLkcGsSuDQ4LfXf/YwuhncGyqknFpWK2hZM7O8uVPkHio+ii+2PrrDwlSSaZXNU6v0od+FAL3xmdXb11zM5ZTRdkZknHVQITtq29RQeaMEchkzABeInZD4m1Ask=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z467zIqt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 709A1C19422;
	Sat,  7 Mar 2026 10:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772880118;
	bh=T/aHKlqAw6W/3+ANfeBg4MJKKh0JMcXp1rJg0bYcTlE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z467zIqtRX0K+4NraWKNETgJoYfJ+VlJhtDtJ/4bAbd35EkboToLEJuShmU6t3gnI
	 ivqAW5EIjSSe0cvNKQVZ8mDiZu47DXJDigvCdeYPWBGQSiliBS0D9CViFJqjd1Jj8O
	 uy6M52k+RnUO1Shl7jzj+DUrGzvTTIXCYPYgF8nJFeizJVRS1IeUS4sjBHvFEXnTDx
	 It6cGbB0Cus3m83fwzJ3hCw52/RCHIwmm4ZJKzUtjdaPlHDFj87jFKIJNziF22D6at
	 lMZXJr33/JtTfVAUpIXwBEdcINsTzRGcJ61BwMqpq9kQwmKPxbznhrnktTsuk0+b1Z
	 TWXFxA0z4RXnA==
Date: Sat, 7 Mar 2026 11:41:55 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, mohammad.rafi.shaik@oss.qualcomm.com, 
	linux-sound@vger.kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
	johan@kernel.org, dmitry.baryshkov@oss.qualcomm.com, 
	konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mailingradian@gmail.com
Subject: Re: [PATCH v4 06/13] ASoC: dt-bindings: qcom: add LPASS LPI MI2S dai
 ids
Message-ID: <20260307-authentic-amphibian-stallion-9fafed@quoll>
References: <20260306122115.509705-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260306122115.509705-7-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260306122115.509705-7-srinivas.kandagatla@oss.qualcomm.com>
X-Rspamd-Queue-Id: 20A0B22B1DD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95941-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,vger.kernel.org,gmail.com,perex.cz,suse.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.987];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Fri, Mar 06, 2026 at 12:21:08PM +0000, Srinivas Kandagatla wrote:
> Add new dai ids entries for LPASS LPI MI2S and SENARY MI2S audio lines.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> Co-developed-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

Incorrect order of tags. You are sending the patch, you *must* sign the
last.

Best regards,
Krzysztof


