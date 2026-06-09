Return-Path: <linux-arm-msm+bounces-112025-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id a/6tCV3BJ2py1gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112025-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 09:31:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A2465D3A6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 09:31:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=LJMuEry7;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112025-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112025-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F243A30607A9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 07:26:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D1613C455C;
	Tue,  9 Jun 2026 07:26:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7224F3B3C1A;
	Tue,  9 Jun 2026 07:26:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780989966; cv=none; b=cjgwuc7tRbMLlH7xKu0zwEb5/Q/FQ1+74c9SBLefsCCpVKkPh5ph52Ra+6f6svP7B8pHlz7SVYCdclwjXXdZUtLeKNFikKjyuq4aTsPSe6Df0DxMT0eycLp8+q7ffXKe7dkTFy93KA3XgbdA8KQJtX/lhnc1NrsNvFxTsg7NMCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780989966; c=relaxed/simple;
	bh=B6mzxBqMBBu46rokPliDs7H8bpDdu+oGc9pdopcEOQg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L39SQd81O/WUSBp9uaiplLfQV62ben9qJnGjeyyg69kTpVEAZBb7E64mHOXNFXHml7tEj+UKggbYRFx3zuFsgMOsPpX55LfuiIdLbWnkj6kiThFp5zMKgiuHbA3BSNxCBKZBnrdp279tg7BGeOxkXWLI0WHuIgDVBThjty0vQyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LJMuEry7; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B04D1F00898;
	Tue,  9 Jun 2026 07:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780989965;
	bh=YDTKrBYRK+11OpkAvD1LbVPGyycscURXPFUWF0HvLoo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LJMuEry7C3c5nyEDbn6WkDnaXLyv5h4LKqszEWft21kQPy8AtJgZB8/DRUzoxW86V
	 cL0CeP/ns8UB8MalnwDRocyXLO9l5FOy9E3hgM6uLrzR88dRlCvogbRWG3cIOr9tc1
	 SNzykucyNB7ZmD5AiQjUA5POfEwVUDsc1uVkeakSP+CAA4kYt7H6uswqSrcO8TAz9Z
	 wdWB2/9V+V8rpVdbowCKmc1HgBQpmklhrPpUteusKTczKBalsvnJLSpQvE76BeP9Ty
	 0IyqdAWeM9E4KJTB9gkSzp0MyWXSS1z5i5ymlIugRKnUOX1GTReuFHE3tMk7gYTNjg
	 FFyFGrK4i+xdA==
Date: Tue, 9 Jun 2026 09:26:01 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/3] ASoC: dt-bindings: qcom: Add Shikra rx and va
 macro codecs
Message-ID: <20260609-cheerful-translucent-carp-c44aff@quoll>
References: <20260608172023.2965292-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260608172023.2965292-2-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260608172023.2965292-2-mohammad.rafi.shaik@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112025-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:mohammad.rafi.shaik@oss.qualcomm.com,m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quoll:mid,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C3A2465D3A6

On Mon, Jun 08, 2026 at 10:50:21PM +0530, Mohammad Rafi Shaik wrote:
> Add bindings for Qualcomm shikra rx and va  macro codec.

Which are not compatible with older variants because?

Best regards,
Krzysztof


