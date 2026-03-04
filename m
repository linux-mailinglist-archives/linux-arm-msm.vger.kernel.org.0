Return-Path: <linux-arm-msm+bounces-95458-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yD66NOCuqGmfwQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95458-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 23:14:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5953320861F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 23:14:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7BC293025A5A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 22:14:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90F38388E7C;
	Wed,  4 Mar 2026 22:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="lQhArVQa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558FA37B02B
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Mar 2026 22:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772662489; cv=none; b=G/XIR5UWCVhCGeHnrdEahPWDQv6GQbFAXEMZLQekYVrrYeek5dA104+qOM/NdtlaN1Q2DNULAWbdIGt8qDBdRKLNgX9qvOCNRhPBDyPnuCqsWgJttMlgs/ttIKKJnt3V/wdFDPTmnHIcv7C2xf0Ww8XDty1NhZpMhY31kW5ueGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772662489; c=relaxed/simple;
	bh=JmMXkK+pLB2Bo1YGTHUwtHtIJTZMiA8prpH5Y/2aOjY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L65t+xrRqdhee3HSaXTSXA4HrdDgjW1nrXw1k5N7OQMvG7omVuRbNI5VQ4aviVAdpsa28HYTIac7niuFIdzN13JEEVqVH03HL5e6b9M3+WFQlF30hrMThAUsdeTptj9Mx4iz6aOEjQb5SgdZV03xZDe3M5i+WqT7fIcc+1k81vQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=lQhArVQa; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 76FD7240101
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Mar 2026 23:14:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1772662481; bh=AygycHmKMmUEErxEv++3db/RN2PgXbdgG0QAnKwV848=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:From;
	b=lQhArVQaT2AiSmCNtPaomel7gxESCcjL6XkZ8Cqa81dzQDRhl8+9/6iS/fxPtlYrB
	 e4DJkxUAZVD/PziEESlHwFPHRlxo+9RooLJUB/a/2xupxjbN3aL32T/WWs5scCRuVL
	 MEk7sC2LlUghXNywPANYWpT3y0S1Mj5uIJLN7ibn9pOa5zwhD/insimOtFoqfO77g3
	 Zfp14J7mn0/vLBOu0laOFSK+n1QdvP1nL2Xcvxz5JQwN+rU1XDm0TCJWkIEUUrgaKD
	 /jIOLmv/aovFXUW/+ME+MCO7e/hHwbjFPOpXGU9Z2eGovbDLS64KKfHGAjMLpC1x4s
	 N0TIGe35iamYg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4fR6R34wK6z6tsb;
	Wed,  4 Mar 2026 23:14:39 +0100 (CET)
Date: Wed, 04 Mar 2026 22:14:40 +0000
From: Paul Adam <adamp@posteo.de>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: msm8916-wiko-chuppito: add
 initial devicetree
Message-ID: <aaiuzCWHegpJMCVj@MyryksLaptop>
References: <20260301-wiko-chuppito-v3-0-9b36a2a7aed5@posteo.de>
 <20260301-wiko-chuppito-v3-3-9b36a2a7aed5@posteo.de>
 <9ffc0460-e394-4f18-aed2-ad8a0b3d1b8f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9ffc0460-e394-4f18-aed2-ad8a0b3d1b8f@oss.qualcomm.com>
X-Rspamd-Queue-Id: 5953320861F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[posteo.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[posteo.de:s=2017];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95458-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[posteo.de:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[adamp@posteo.de,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[posteo.de:dkim,posteo.de:email,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

On 26/03/02 12:08, Konrad Dybcio wrote:
> On 3/1/26 11:29 PM, Paul Adam via B4 Relay wrote:
> > From: Paul Adam <adamp@posteo.de>
> > 
> > Add an initial device tree for Wiko PULP 4G.
> > Includes support for:
> > - UART
> > - USB (no OTG)
> > - Internal storage
> > - MicroSD
> > - Volume keys + Power button
> > - Touchscreen
> > - Backlight
> > - Accelerometer: Invensense MPU6880
> > - Magnetometer: Asahi Kasei AK09911
> > - Hall sensor: Rohm BU52021HFV
> > - Proximity sensor
> > - Vibrator
> > - Earpiece
> > - Microphone 1
> > - Headphones
> > - Wifi
> > - Bluetooth
> > - GPU
> > 
> > Signed-off-by: Paul Adam <adamp@posteo.de>
> > ---
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad

Thanks for reviewing!

I assume I resend this once more with your tag added?
Also is there anything else I need to do, if I don't receive further
suggestions?

Paul

