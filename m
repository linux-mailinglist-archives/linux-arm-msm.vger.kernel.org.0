Return-Path: <linux-arm-msm+bounces-95530-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +E03IwU4qWlk3AAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95530-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 09:00:05 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A2ACF20D0FE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 09:00:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6183B302BB97
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 07:59:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 445ED346797;
	Thu,  5 Mar 2026 07:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ViOsm6ZL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D7A34678E;
	Thu,  5 Mar 2026 07:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772697575; cv=none; b=jAt2CoIeGRj4AdAASkfYJwsjjbmB3WYKJijXOR4CEYsRj1IZW1cjTItvHo1nEqWa45lSZp1NM7/bmKD69Fn583L7NheVwMXbNvC+XDFv7tTzltkY9gDEzci8jHxREUCRTXGC/SN/mzkvs4W3LzMpOESaGFAGkl36qsYIPtY6KTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772697575; c=relaxed/simple;
	bh=mtIMcctID1kG6nERXwpE2Bzb0pNOLJjHpwMn79E2ywY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fIpbmcLLtkb8sg+zcHzbKhLAo7mxS9vu2QTkb9ZNIDXIbNZsu3QERITpEX2nio8YXGDCEa2WWU/NEukocOt2lFywalEi1kkJqrcfa3TFYAX7xpxktACx/syVuVbr5R8Uhsws01Klr8sZYaCAtPgYv63209TExtHLDtwekJbN+IU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ViOsm6ZL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C396FC116C6;
	Thu,  5 Mar 2026 07:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772697574;
	bh=mtIMcctID1kG6nERXwpE2Bzb0pNOLJjHpwMn79E2ywY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ViOsm6ZLYi7ak85jiMC+qLsF0VtwwfCLIvL53A0ixOnWApfJVsPPTn8+G0O9PIRhx
	 jdFiRa3yo5A8xeuJloL70WLYIr6UJUCiLb7pXRe4z+f6vLVpKjNrInXMk5C5TEEbSK
	 1CvgitkDS2HarybQq6QmykIqJcD5SnGgVNt6gPhuBEOMyDYhUbRYxvQvNvrmiIaprX
	 yC5Jux4JJbpZgGgBSAdDP+zDYskg5Af8AuP2mIqOd5I4v2I/ASvRT23Djv2tjzZmAB
	 sdTWoPxGTupe6fl6qF6QXBUkBSRlCzQTnDDNDrLRQUdincStJOIxhaVRamQEYiAZiv
	 ylOPDtcB2dhNw==
Date: Thu, 5 Mar 2026 08:59:31 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Richard Acayan <mailingradian@gmail.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, Nickolay Goppen <setotau@mainlining.org>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Johan Hovold <johan@kernel.org>, Kees Cook <kees@kernel.org>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v2 05/11] ASoC: qdsp6: q6dsp-lpass-ports: add internal
 mi2s support
Message-ID: <20260305-gigantic-gay-boar-86db8a@quoll>
References: <20260304195815.52347-1-mailingradian@gmail.com>
 <20260304195815.52347-6-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260304195815.52347-6-mailingradian@gmail.com>
X-Rspamd-Queue-Id: A2ACF20D0FE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95530-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,vger.kernel.org,mainlining.org,quicinc.com,linuxfoundation.org,opensource.cirrus.com,renesas.com];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[googlesource.com:url,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 02:58:09PM -0500, Richard Acayan wrote:
> Add the internal MI2S stream capabilities as specified by the audio
> kernel modules and configure the ports as MI2S ports.
> 
> Link: https://android.googlesource.com/kernel/msm-extra/+/530cffa4cc977a348753831b163eb9d3302b954a/asoc/msm-dai-q6-v2.c#4597
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c | 200 +++++++++++++++++++++++
>  1 file changed, 200 insertions(+)
> 

This duplicates Srini's patches.

Best regards,
Krzysztof


