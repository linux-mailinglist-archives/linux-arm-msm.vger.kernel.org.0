Return-Path: <linux-arm-msm+bounces-96382-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cCWjHCRAr2mYSwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96382-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 22:48:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C5E241D9F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 22:48:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C27B4302F7FC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 21:48:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B51336BCF5;
	Mon,  9 Mar 2026 21:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="JER//Vo2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7168733E35B
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 21:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773092898; cv=none; b=NF43CB4o0Yq04Oiv7O+228GDHwwrwg+I7Jp4V2YsepmTEx6O3/7t4TsdRQi4xepnEobb2hXp0aFGD4qTKuAlsv7Q0PnDCJ5CvjyKvaRMzJQIU4/MY9KG9qcizDPCWG+bhQs+t1ed/qWn8WA+f61JaWQexLKaNWmmWj9cCQ/aGWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773092898; c=relaxed/simple;
	bh=Z/bBxdgg4opJH+WEukzkydne8BK48a/y2MHhP40fG7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dciwWo2/dXRbdBJSkJ0I2zOGQuTwsZwbUKazMEAuadi645wFtdyWJrA/DCjtATk3+TSZfI+wWu7gOiAto5xXCAmkRLKPrfBsvCp3VKd7QRurzYij8IvKxZQcLuvZdtwL2/7mqL9eWCuzpqdWivgo6xYqBGUHP7VBS91weIxe3b8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=JER//Vo2; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 68AFE240029
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 22:48:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1773092893; bh=mtLdpYSnewA1ZtSxotqVlsMvB8VbpYPD7lzl0A/KmV0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:From;
	b=JER//Vo2ALlpu206cwsevOrDb7Ihn1/ws54UaFbGVlEvYCy9RdgNYAqWBnO6BNoD4
	 r6L749ozFTgEIHLU0yrunUfCyLJhh6AOD1yZlF0s1UVCQQKCPvGy8CtMWmQUNuHBC2
	 LasD+QubOleGp/qjRUzwTMTYZeT9yX6FSENWedxnAWu8GpHClOhItr+NNAB7ogrcbz
	 g41GXW4k+M+6+OSIE07eVDyx9lq3spcjzw0562XOscTxZ0GGygPI6UD9db9FQo9+C0
	 JqZo6uPV1nHzuUb4m94WEyCFgOM25T1jnIFJygHOtFCdZFA/GJN7DMYf9CMorcs2GA
	 Iullz/BOogQVA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4fV9cC66RBz9rxL;
	Mon,  9 Mar 2026 22:48:11 +0100 (CET)
Date: Mon, 09 Mar 2026 21:48:12 +0000
From: Paul Adam <adamp@posteo.de>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: msm8916-wiko-chuppito: add
 initial devicetree
Message-ID: <aa8__ofJBdMfavbq@MyryksLaptop>
References: <20260307-wiko-chuppito-v4-0-325ac66ae338@posteo.de>
 <20260307-wiko-chuppito-v4-3-325ac66ae338@posteo.de>
 <aa6P4rE7d2ftaeAw@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aa6P4rE7d2ftaeAw@linaro.org>
X-Rspamd-Queue-Id: D1C5E241D9F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[posteo.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[posteo.de:s=2017];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96382-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[posteo.de:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

On 26/03/09 10:16, Stephan Gerhold wrote:
> > diff --git a/arch/arm64/boot/dts/qcom/msm8916-wiko-chuppito.dts b/arch/arm64/boot/dts/qcom/msm8916-wiko-chuppito.dts
> > new file mode 100644
> > index 000000000000..d927bae2b208
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/msm8916-wiko-chuppito.dts
> > @@ -0,0 +1,315 @@
> > [...]
> > +&sound {
> > +	audio-routing = "AMIC1", "MIC BIAS Internal1",
> > +		"AMIC2", "MIC BIAS Internal2",
> > +		"AMIC3", "MIC BIAS Internal1";
> 
> Sorry, just noticed this now:
> 
> This seems a bit suspicious (I would expect "MIC BIAS Internal3"), have
> you tested if the secondary microphone works?
> 
> Thanks,
> Stephan

The secondary microphone does not work yet, neither with Internal1
nor Internal3.

In the downstream devicetree its Internal1 for AMIC3.

Is there a way for me to check which one is correct?

Paul

