Return-Path: <linux-arm-msm+bounces-92574-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YDo5LAMnjGliiQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92574-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 07:51:47 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 50930121B3D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 07:51:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id ADCD130022EE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 06:51:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9043313540;
	Wed, 11 Feb 2026 06:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qcZtjG1h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A578729C338;
	Wed, 11 Feb 2026 06:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770792705; cv=none; b=oQqxsuBReA0I6YRl0DgS2eZFH1aTV+aw7DUBc4XNkqgYAok1WU/BV9486MMB8qmNYZaxc82Ble1QqfREV4HTEhK7Pm135IYEPqPprD2dXceou1E4yCf8L6ES54yovXeJoyzpJ74tHcMk3BDykHu7/XZxYD5pb97dpFv+kIXg+PE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770792705; c=relaxed/simple;
	bh=PO0Yb4rM2R1rp2phrnWJC2V35SZWCeVXeIfWE+OD98c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YNbK/i1XnUy4UVN37cPeDNCFy8RZiEZAozkyEoRmCPe5yKlq4lvimQ2CQAC1PHyOxleivnmzS0k3Y95lmrzAhsSLvjJmvkWCmAaXLpNQgDSM68K34178qEQixvBRU0pBEokN73vRlw/edWXYafblrsVoGiGbMsIeKzWQmifYR1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qcZtjG1h; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBFEAC4CEF7;
	Wed, 11 Feb 2026 06:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770792705;
	bh=PO0Yb4rM2R1rp2phrnWJC2V35SZWCeVXeIfWE+OD98c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qcZtjG1hcJDXtq7ZjHLlhYsbOxP0YzKaAfnCaBVCig97WJxZDL1tN4ast95KMcDxL
	 2GkEdDnSCjLs1eNty3lVC37u5+eCH4eG2zUbFONdH54p3n4IiEJ1KiOGCgQdhZH5bK
	 e2YTBmedcYBIHYwd+Fo3VSCN1OP4PTKUuSB/tO4DKK/tjlj7sjCx9IOx67Jg+9xsmo
	 CYBP/GwHeFecv7WydU7smqmGleKQ44+JCc84Dk3iV+ii72CsVWH7Ezc0LjUcGF2Pl6
	 XaNP9lIhprv1gMbDtRv2C7kUVdq7s9vFTU67iJ2FL6WydYCnMNqhsOhRyE+v2znRPR
	 q0TCTv1yFUWkQ==
Date: Wed, 11 Feb 2026 07:51:42 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Richard Acayan <mailingradian@gmail.com>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
	Johan Hovold <johan@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	Nickolay Goppen <setotau@mainlining.org>
Subject: Re: [PATCH 01/10] ASoC: dt-bindings: qcom,sm8250: add compatible for
 sdm660-internal
Message-ID: <20260211-skilled-transparent-moth-fac10f@quoll>
References: <20260211020302.2674-1-mailingradian@gmail.com>
 <20260211020302.2674-2-mailingradian@gmail.com>
 <yxrhmblavwkuhfrfgskujs7tz7cykojnqnl2mfrf365lhdem35@bgqwiaft67b3>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <yxrhmblavwkuhfrfgskujs7tz7cykojnqnl2mfrf365lhdem35@bgqwiaft67b3>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92574-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,perex.cz,suse.com,linuxfoundation.org,quicinc.com,vger.kernel.org,mainlining.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 50930121B3D
X-Rspamd-Action: no action

On Wed, Feb 11, 2026 at 04:11:24AM +0200, Dmitry Baryshkov wrote:
> On Tue, Feb 10, 2026 at 09:02:53PM -0500, Richard Acayan wrote:
> > From: Nickolay Goppen <setotau@mainlining.org>
> > 
> > Add compatibles for sdm660-internal based soundcards.
> 
> Why is it called "internal"?

Yeah... I am pretty sure there is no such sound card. You cannot have
sound card internal to the soc, because you need the external components
like codecs.

Best regards,
Krzysztof


