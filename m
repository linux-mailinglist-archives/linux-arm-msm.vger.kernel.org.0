Return-Path: <linux-arm-msm+bounces-97059-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kPAsG++3sWmTEwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97059-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 19:43:59 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C3557268C90
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 19:43:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BD9DE31E2DC6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 18:41:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC91F3EB806;
	Wed, 11 Mar 2026 18:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="BzjvIJtW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 658FE3559C0
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 18:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773254440; cv=none; b=EP1otaSdr/50A9/t7ja3J1pAxLivTMvQSUhWyB4IMwxaFeVYUKEsAk4m5lCaIatpX18C22MG5M7H++OuZ4yPO4J1EsmQhWPkMOACvCKxftCy58oMF5tFPpmYLNHcYbCgfsudot2t0Jcf6Rykodzp9JEtHCJ1RL2OPjGZE2tDdqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773254440; c=relaxed/simple;
	bh=HcVMetrvvL3zERXXTCW96tAJJzhjC7tNn3P3hKyDTJg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t/CSqWJIapdi8O2cCcRCFP5k61GDNT7hCrQ/aSaOlu9ZRXQvcPXBBOLinZKfZ7jsuB6M3EVj8wa9EuQUIMa85Z7IaEBe5+8X/x9Nr7Qm60l5hz7xWYeiT1fDer4eW2KvJ4r/WGTyyQ+QMvda2tZaVIh4+KnPHXBaeDXiEP+pFA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=BzjvIJtW; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 455FF240103
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 19:40:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1773254430; bh=pyxqsBy+r2XZ/+SecKDN7NQWIq2m6SNbdVMKtFtT8oA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:From;
	b=BzjvIJtWIoaYOdVfcpn8ttb/ly8w6JRxQNEKffooTj3bhvSPRqfdSF7su/4kT88Q7
	 SoDvzXv4YB9ssEpLRjVUaln/oYNkmr0rI1UXNypZrHzMRMF0B/TX/8Omx697TDGZKR
	 mIHwIsGvkZPMWp9zvyOlqniY3Gs3kO4gmI6XE497fmARG9+SGQyKwxCrFAs4DvlS+i
	 m1bM+zRgUe8fVxrhMFkwtXSyEupYTW8LmD3F2zRJt+T6uXz8kNuX3E+4H76FAMDkcd
	 Md5pRX+SNVcZVcUsE0SAjORJbFVSBzPU7qaFLl21HnD60pbkzlgkWFwUELbfjFpUH5
	 lAXslKB7EBZ0w==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4fWKLh5cZDz6tvm;
	Wed, 11 Mar 2026 19:40:28 +0100 (CET)
Date: Wed, 11 Mar 2026 18:40:29 +0000
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
Message-ID: <abG3G3MQeKd3UAaL@MyryksLaptop>
References: <20260307-wiko-chuppito-v4-0-325ac66ae338@posteo.de>
 <20260307-wiko-chuppito-v4-3-325ac66ae338@posteo.de>
 <aa6P4rE7d2ftaeAw@linaro.org>
 <aa8__ofJBdMfavbq@MyryksLaptop>
 <aa9Epb7MQ0qVFWGO@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aa9Epb7MQ0qVFWGO@linaro.org>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[posteo.de,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[posteo.de:s=2017];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97059-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[posteo.de:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[adamp@posteo.de,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,posteo.de:dkim]
X-Rspamd-Queue-Id: C3557268C90
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26/03/09 11:07, Stephan Gerhold wrote:
> On Mon, Mar 09, 2026 at 09:48:12PM +0000, Paul Adam wrote:
> > On 26/03/09 10:16, Stephan Gerhold wrote:
> > > > diff --git a/arch/arm64/boot/dts/qcom/msm8916-wiko-chuppito.dts b/arch/arm64/boot/dts/qcom/msm8916-wiko-chuppito.dts
> > > > new file mode 100644
> > > > index 000000000000..d927bae2b208
> > > > --- /dev/null
> > > > +++ b/arch/arm64/boot/dts/qcom/msm8916-wiko-chuppito.dts
> > > > @@ -0,0 +1,315 @@
> > > > [...]
> > > > +&sound {
> > > > +	audio-routing = "AMIC1", "MIC BIAS Internal1",
> > > > +		"AMIC2", "MIC BIAS Internal2",
> > > > +		"AMIC3", "MIC BIAS Internal1";
> > > 
> > > Sorry, just noticed this now:
> > > 
> > > This seems a bit suspicious (I would expect "MIC BIAS Internal3"), have
> > > you tested if the secondary microphone works?
> > > 
> > > Thanks,
> > > Stephan
> > 
> > The secondary microphone does not work yet, neither with Internal1
> > nor Internal3.
> > 
> > In the downstream devicetree its Internal1 for AMIC3.
> > 
> > Is there a way for me to check which one is correct?
> > 
> 
> To be absolutely sure, only with the schematic diagram of the board...
> 
> Another option would be that the secondary microphone simply does not
> exist at all (i.e. there is only one microphone). Any idea if it works
> on Android?
> 
> If in doubt, it would be better to remove the line for AMIC3.
> 
> Thanks,
> Stephan

Tried around some more and got the secondary microphone to record something,
even without the third line. Will take the line out.

Paul

