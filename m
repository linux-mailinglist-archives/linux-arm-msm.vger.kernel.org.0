Return-Path: <linux-arm-msm+bounces-96388-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gOcuBb9Er2n3TAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96388-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 23:07:59 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id F0991242129
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 23:07:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 60F143024913
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 22:07:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 180D14266BC;
	Mon,  9 Mar 2026 22:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fQbai9Lc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 258B0425CF9
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 22:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773094074; cv=none; b=qbxU8y0sxkGLgFDMBZ5PuA0Cs9E/2JAlJzO27SPAXI41qIbPCnkwj/PwbvSpIj1fzKQLVkUfvGbGKmcAhvJwp0EOGrUOBlO0IWRZcLWNFNf0ySjRkIwgT7tqzMq+uq6rYS+fOIMki+en68gwG1Tn/1aB8e/vasnz3bdiwrywECo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773094074; c=relaxed/simple;
	bh=mXuEXkQj7Rg4dutsP6ny1KP87NvfEJ0+83zK4pvYZr4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JSFnijtPwLxs5Jos1Ywn68vAuvhEb6eG1JUEsTE1BrylGTbjOj9vKusum/majOFlsE5y1HrnJQf6KaySe6YEPKPmnllifn+iM8aCZ4RsDIfFe2mYFta4B3TTQoeCGRX1ucJwTrz5uv7veJPRvlLhGsyWJSBoNw1xjVawG9vou8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fQbai9Lc; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48538c5956bso17468935e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 15:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773094070; x=1773698870; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Dk5accODM7ezppgmsEo6ZlVd16xDcQunTBdBDruNkNk=;
        b=fQbai9LcJlrJp7LHta2PUOQaEWQBCKry7hgxgC9IDhjff1qTboyTCcCWWs7KeCC++5
         Lcz6nq+tcIvWdzdKPS5M+oQTIThkzVl9P16wFdMRlHXXOy635XGyDEi+k+PMVTK4ylnF
         6rmvMM2nbRPQORp5zJ61ElHchC9H5EPr1SSBAjemPyU1/urLFN33y1E/OuATk3DGh1oK
         Ak8wVblBAumy7Ek2VtdJNMp/uNa3vgXMjgd6+4oEfWyn8cc+5BFrMSDyfwxV4MvobP7o
         2QpeZnUQ3D6WHb0R+ZI4m+EsKm1osgcJyGMMY5sVM87DmOdvTTC/eaO8g/bwSIGMMYNv
         cQVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773094070; x=1773698870;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dk5accODM7ezppgmsEo6ZlVd16xDcQunTBdBDruNkNk=;
        b=t7gVtekiHk9LOc39Ngn/8Ohvq3hMErAXl2HCewIyqv6IHoyzZuZtaxS8/lRvm8B2f6
         E32vSb/oN2gAg+Rf4fFXj8x+t4IZ6cQbzAvsVHplq71TdixG9OWfWRGp10pfa7SFf2oJ
         2XvYmq1uugbHcryipMWeui4cdl93gkGy2lHxykX63FtYbHZ2baGTmc9Mcgjw/iAZqVia
         Ik+c1GfZaseLfbF5Bw0V7hDmEDPuYaoVqqvZAH99k3mcoBOHYACcOMMvAWZmZps2H3gi
         MoRpou/kZrCIDpt18EFhx3NHPc+t81AtnQjKRXuWnJiWhPYSHTIIYbI3p6JeQo9l9vjl
         8seg==
X-Forwarded-Encrypted: i=1; AJvYcCUIRjqU5cps+bDIBEQo92MC+2sWONscubo6qmzxWvGmqtyHaME16E8d4Dqyww0gPA0erUHuGBdY5/cRvCEx@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1PgmvJZQSuhqEUwmH+qcInJiw6+FBxG0QXZ46VhLbPjucwIRZ
	OWckrguWCklw3q1VkfqThADoAd+KtJTeTHn0YxmAFeWOfb+w7SBvTXlwHzCwBFnSzEc=
X-Gm-Gg: ATEYQzwvmzjNup4Bn/BI5XcyQ3r/ftm2M6At4ZR1KYZ6vTjxDfBWhGIzyTMOyDlMYui
	Zen3PpSC40pT85FjafZKHecl5b6mNrPn61X05fUfdJNyBwEAZeK+t9ENnzgcgCysOd+sJ8kRmHz
	wolicCSeHqW56KigSboVNJfEMif8YdLNfP2fd3iJ0KCS3MhadB1aY34/KUKlZC9mgxbu/Jehkyd
	kaPCuzcEOFvmrDkmJLZ2LG1SZ1XZi6kMa0Qxj8cBXWGcW8CnAV3Klyqx+n9TGf+S1Y0HQXRFzmT
	SlSteWgdfWKs3Y/8RBFFuUWIoH1N5VRxadw/GOrdu84iwLMQjyMQa47IQ4+MTDyTw6+tihhMZJo
	VSq+8eyUynV5DBqUkP2uNp4yKAntR6zdCwiA5M20koB5NZqVZuOSmtncAxu+ASlZt89u+6GCBaj
	xTxjhwwqCj/EkilDZqCp76kpbcnnm8/LdAeO0=
X-Received: by 2002:a05:600d:848a:b0:485:3294:fff0 with SMTP id 5b1f17b1804b1-48541a2b9f4mr12097815e9.17.1773094070519;
        Mon, 09 Mar 2026 15:07:50 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff23:4441:1c2c:7aff:fe45:362e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485419c2930sm44011255e9.0.2026.03.09.15.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 15:07:50 -0700 (PDT)
Date: Mon, 9 Mar 2026 23:07:33 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Paul Adam <adamp@posteo.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: msm8916-wiko-chuppito: add
 initial devicetree
Message-ID: <aa9Epb7MQ0qVFWGO@linaro.org>
References: <20260307-wiko-chuppito-v4-0-325ac66ae338@posteo.de>
 <20260307-wiko-chuppito-v4-3-325ac66ae338@posteo.de>
 <aa6P4rE7d2ftaeAw@linaro.org>
 <aa8__ofJBdMfavbq@MyryksLaptop>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aa8__ofJBdMfavbq@MyryksLaptop>
X-Rspamd-Queue-Id: F0991242129
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96388-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stephan.gerhold@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Mon, Mar 09, 2026 at 09:48:12PM +0000, Paul Adam wrote:
> On 26/03/09 10:16, Stephan Gerhold wrote:
> > > diff --git a/arch/arm64/boot/dts/qcom/msm8916-wiko-chuppito.dts b/arch/arm64/boot/dts/qcom/msm8916-wiko-chuppito.dts
> > > new file mode 100644
> > > index 000000000000..d927bae2b208
> > > --- /dev/null
> > > +++ b/arch/arm64/boot/dts/qcom/msm8916-wiko-chuppito.dts
> > > @@ -0,0 +1,315 @@
> > > [...]
> > > +&sound {
> > > +	audio-routing = "AMIC1", "MIC BIAS Internal1",
> > > +		"AMIC2", "MIC BIAS Internal2",
> > > +		"AMIC3", "MIC BIAS Internal1";
> > 
> > Sorry, just noticed this now:
> > 
> > This seems a bit suspicious (I would expect "MIC BIAS Internal3"), have
> > you tested if the secondary microphone works?
> > 
> > Thanks,
> > Stephan
> 
> The secondary microphone does not work yet, neither with Internal1
> nor Internal3.
> 
> In the downstream devicetree its Internal1 for AMIC3.
> 
> Is there a way for me to check which one is correct?
> 

To be absolutely sure, only with the schematic diagram of the board...

Another option would be that the secondary microphone simply does not
exist at all (i.e. there is only one microphone). Any idea if it works
on Android?

If in doubt, it would be better to remove the line for AMIC3.

Thanks,
Stephan

