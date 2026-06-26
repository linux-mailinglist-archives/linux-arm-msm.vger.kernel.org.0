Return-Path: <linux-arm-msm+bounces-114602-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0de9DigQPmqR/QgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114602-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 07:37:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D716CA6BC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 07:37:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=K4OtvwYE;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114602-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114602-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6C94A3035B74
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 05:37:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B1FC3C2798;
	Fri, 26 Jun 2026 05:37:36 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 489583C5529
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 05:37:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782452256; cv=none; b=OzCWDYjJSBFmy5T2nEW/e3SlLC0zkId6jT3LsU4mVHiUULEnT+c4rb4xcBOK7g3GQO8GA6GbltCF2X+Fq200adZuUDCk/RByBNOaIv+hPwQ7ToWbcip8m7xicOpRDSFAZpg+EH+O6R3aKWmR/gUSC2/fkANXA8KEVIH9Z9cXmfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782452256; c=relaxed/simple;
	bh=DaIliwXZnq+xhC6xHv4wSGHImwOEOkUrH0LZfBOCFhQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Agcqe6y+EQLd02g2IhXh6BCuycwWf/3sW2w6XvHaOBTmU3WNDMTxbQKTt3CehyvCyqvz0pbkNw2cJfJAYZ2rJSJJ+g2WYScFJpEMnB/Y6sj9qIQR+wWFIwYkyMS/SOScBRzvEy8CKe6T4WiLWTc3eM2cAqzoT/+bi6A6ANPmNik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K4OtvwYE; arc=none smtp.client-ip=74.125.82.53
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-137dd4cc208so524532c88.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 22:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782452253; x=1783057053; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KO+dGl8JOZI5P4Y+BNYLE/H+0UT+mgOt+djr4eqcLp0=;
        b=K4OtvwYEUVHFNHV3ogyYU4n7Au2r/1gOwxi+1XO4J5y7mohBUggnsWyZPz0x8tMCAE
         iy1o4T+1IV+DfIGtnR+hv5R+OSJkdZlRb8Bz0nHWFenN868s2qcoD0WlIlKHa4Tni2WU
         ov1LonlYeXY+Kh0BOAZ75uRl/D+WN1sgFlAIFFJkDWZa0t5Y8gI8fhhi8rM1qerRchad
         prncmAUyWm032gKWJhrjEhGIJ6nTQft5iVm1hF1WO4dEWWg9sr71m4rh8jMlmWUhGrJw
         vHrVUbjwsmSnEiF3AAJQJPEZAYqFLOEfjXBuy4YT8ag5GOnqoFHKiR86N/qluum3QLzS
         /LKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782452253; x=1783057053;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KO+dGl8JOZI5P4Y+BNYLE/H+0UT+mgOt+djr4eqcLp0=;
        b=E6f3bqMdl47R9/ZsVGBXD+x7DNAquSeryQGhN4l6+md2C6WQgIhK+8bNRVCwG+ax95
         6vSm4PyP+NLka22g4f8Qg9jTgv14pRL3CqH6blJuvnnhMlAhVp6JLVh8XDkYJKifC1Mi
         G12s0/4wm7m2asrbJuELPGugP+pQu/CDv5ZevF5G/TVWNKZXKXGGYm9bSZm0Uo5pMw7h
         c0CzHEk/ef3+UYpOfdjYeb+DCgzvQGcFhddNLfoFRy32nJk0SrVB0aE6dUBkZaPVRIYK
         X/wHGd8OIEOkxaTVJZEYd3NcuDFuC6fxXET2OPy5aZ5hsVUXu9C2m3gFnegCWrqi6Rcl
         KdXg==
X-Forwarded-Encrypted: i=1; AFNElJ8Y/3Vsa+w3TpvZQ92E+cS49JWTDIaTu6yhR8k8/g1ot/eRSJymLTx/sUmpXzEEaVWnan2QfeIVrBZRJzgk@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/i9nxOJfHQt6f3eCP3ReXxdW6gK8uXy2aOGoQix/AyYeqU0RL
	9TJSNgJyxUMJwY2of8pPdTdFLhkmqb/R7aw6e66MKsfMoPpCbjwZ/CAT
X-Gm-Gg: AfdE7cmGCMy52m5nR46wvl7ABQBgf6URyRO7mTka1+LUo/lnVfg49OBjuO0aMngH3Pc
	HIE1wos3dj7rxHTd6wsM9XoKwhHI0Y3bQJjmv/619h2omd+sMCpymkKcFJaCh/4junhxQZoWH51
	EpE2pnMKKPV6xuTN27BRRCCrCjBwSmeyC1Hp4ePUxvxKgYshiPzhOihWh5hS6Os61xtJVM56usb
	Ppq84B2l031DK1cH5hKGZpX0it4naNHBQWl9EIZ2ZVmSmwKs7RJArx4F3Td0pyzUf7R+AyPNy6y
	pUYRc+uwb0kBV54RbyFvRczbfyf7lvWM+RY/lCHsqqPzfIj2Kk4hM9jqB1hxliUsHZ8xtbP0fet
	2dK5ZN+VTB4Jt51W9GVzE+BA2YLPTPBn5/sWu+UlTahNhxODIg//4+50RQq8vJLjC0Kk7xHDJgc
	VOviERZab++ruFC3D7XgLUVJy+E4+QBJyeHb12FYqrGiGnj8kJyVd/fw==
X-Received: by 2002:a05:7022:120:b0:137:edae:540e with SMTP id a92af1059eb24-139db95a6e7mr4536991c88.6.1782452253331;
        Thu, 25 Jun 2026 22:37:33 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:a474:bf4a:4966:8d97])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139d912197bsm22472462c88.15.2026.06.25.22.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 22:37:32 -0700 (PDT)
Date: Thu, 25 Jun 2026 22:37:29 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: david@ixit.cz
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"Jason A. Donenfeld" <Jason@zx2c4.com>, Matthias Schiffer <matthias.schiffer@ew.tq-group.com>, 
	Vincent Huang <vincent.huang@tw.synaptics.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: input: syna,rmi4: Document
 syna,rmi4-s3706b
Message-ID: <aj4QEL9o94PityxA@google.com>
References: <20260523-synaptics-rmi4-dt-v2-0-0645122babdc@ixit.cz>
 <20260523-synaptics-rmi4-dt-v2-1-0645122babdc@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260523-synaptics-rmi4-dt-v2-1-0645122babdc@ixit.cz>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-114602-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[dmitrytorokhov@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:david@ixit.cz,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:Jason@zx2c4.com,m:matthias.schiffer@ew.tq-group.com,m:vincent.huang@tw.synaptics.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-input@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:phone-devel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linaro.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B4D716CA6BC

On Sat, May 23, 2026 at 11:45:34AM +0200, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Mostly irrelevant for authentic Synaptics touchscreens, but very important
> for applying workarounds to cheap TS knockoffs.
> 
> These knockoffs work well with the downstream driver, and since the user
> has no way to distinguish them, later in this patch set, we introduce
> workarounds to ensure they function as well as possible.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: David Heidelberg <david@ixit.cz>

Applied, thank you.

-- 
Dmitry

