Return-Path: <linux-arm-msm+bounces-92625-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wLPwIlTxjGmSvgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92625-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 22:15:00 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DF15A127AC5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 22:14:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0F0663201FBB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 21:09:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7D4D35B625;
	Wed, 11 Feb 2026 21:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RuU2dc9H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90537352C22
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 21:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770844142; cv=none; b=SYNXQPz/TN6Am5oRn9E1p1TFRv9OMuMpBjmGyeYEyC5MRXN5qU420E37REidi5FBcEe/bc0W357WD5mNwwWAyfPBY227yEa2VKpR6y9DIREvig1KafFN3QFf1HLY4dI8RfFXL3gB6fU/+H5gv2b8TS6rCxrFY58k6Xhc5O3KSTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770844142; c=relaxed/simple;
	bh=33X+7c51EAcJiWLg9z3hvYsrew62Mmu6d6pFOcq/T+8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oFDOngAAA3sv+XD0uJ8V1WLdJ0DZNlSO5VhNkj8K6cwoOxZTSwS+JWydZc4C9oXMiq3EvabTrzzG7Sgm1KvrnuWIHP7kzFjeBptxaIQm0PL1O/HAt1rDSpVBgXRjqPJEdDEJjmTR1eoM/0S3iR8uTqxyGfPWcF2BhcHWuih6WOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RuU2dc9H; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-503347dea84so67893751cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 13:09:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770844140; x=1771448940; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PU9zPPZ6q/jlj/hCesIMdYrjem+AOCzJA8bXmrZmXNY=;
        b=RuU2dc9HRgPDOLViZEor37l0/7+TPDLWESmE0OmewTNIStQlwvT1hacVkQUd3Jr4OF
         8D7ofF62uLvGOAUFbqs/GuyON3g+ZY4QFX/XuHZUFvY69yTCYitQG2PRK0NWAyPlU8Eh
         2MHn3S+5W2h1Se6GlPPZLq3mTrxkZwq0SAaMJc0UJiGNLBUYSXaLaCynmw/JNvqBMDXa
         3BjvlSB+yQMjH3gPIEGt/O60nsVvMzsyHvt1by11wZJDkD+SrwyQdhnMI9aGkq8GZJU/
         tlL+FDq/2Juqfg+cXYTuk1w8SPC5mU7zQGYxsb9zLKQCGLa/vTGSGJCqN2Sammv4aKlV
         ok2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770844140; x=1771448940;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PU9zPPZ6q/jlj/hCesIMdYrjem+AOCzJA8bXmrZmXNY=;
        b=IXSz8josOYItNoIC+OOvJWebXOTmTikB8+hLHOpuLWaKmjru5jgwoJy/TZwSJV3Um2
         G5bugDpQDc0IikGhXCz8PHpIqGgtWC63xS6hEMO5A5Q1mvWaUpPQ2DjyBYMiTCX8rlB6
         GQdd6dmYHlsU1Wc4INLtTLFsQqij2NTnrbqlKBGOioAsU0T9/4CzJ/UfIYCyQIyVlvb8
         rtwy8E24NTxoNZ6hMEnhtG+vnBINOJAWKVkDIV75XDOVrhNJeiSsufigrL7geRURJIvZ
         5AWvcE7ELNQFmoqeMfvVeVPsFNTPBtDqpBhfcrLiau481hWVvO/hPaewyCX5b+u2RzZT
         gyAg==
X-Forwarded-Encrypted: i=1; AJvYcCXVUdTjOzAe1Uw2hyH0WJgOgPUC9F96bnD2OexnZ537pXX6k9E6xd8yjqiaXlsLajYdTBOhxKBlKgLcGvgD@vger.kernel.org
X-Gm-Message-State: AOJu0YyhGEMVlCBXnTfNHusNr3sGLFy126JkoNfhyuUX3wiZSzLldnZq
	adPwuLG9VxMFS7MELYFqy66VUafw41lFDekc9LOwDkEKH3Vvp3ldeI4SxYZD1A==
X-Gm-Gg: AZuq6aL6z0pTxD61vBmgnqYE+mY+/o28TNFD3xMRu8tu0hhB4z+rOLvtwgxVCWSLVVm
	KGXtMzj5Nhlcy0dfEA03CQ8TE+1IHNwmF+MWTIzTpx6CMV0wHvOMj51mo7dFMs1J6n0NqO+0bF1
	CpI7YmUKmkt2LrK8QRB6KbhnSCDrS1gTsHLJjIvAJbfBCd1MyTrVmjQiUe0yM20o2ydsITc22v9
	5U7/98W2qz+pnamkrFGOw3zL/GGc6E1bxxcI25/fV9660NaxZuSMw2tOe3nn2oYqJKhokhdyOYD
	+f+GoyHgIAjR7XvDxigJIZB1P88TAGl1Ifr0EYC+RqREQcK3cuMYB90nMF06JXPtZsiZXwRdIdz
	2vY82oqMmF2CCCqOeLTQZn4NOV4dW9GeSxNZoSa6PV9ypT+NZaNGGg1oU8yY6HexmQxZEfry7/L
	lSQLPWLOcD8Ynj7ky7iWaGP2Xfaw==
X-Received: by 2002:a05:6214:212a:b0:894:68f7:40f2 with SMTP id 6a1803df08f44-89727868cfbmr10595546d6.2.1770838373169;
        Wed, 11 Feb 2026 11:32:53 -0800 (PST)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8971cc91eccsm20103146d6.13.2026.02.11.11.32.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 11:32:52 -0800 (PST)
Date: Wed, 11 Feb 2026 14:33:19 -0500
From: Richard Acayan <mailingradian@gmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
	yifei@zhan.science
Subject: Re: [PATCH 6/6] arm64: dts: qcom: add support for pixel 3a xl with
 the tianma panel
Message-ID: <aYzZf-9rqqBikpNA@rdacayan>
References: <20260210023300.15785-1-mailingradian@gmail.com>
 <20260210023300.15785-7-mailingradian@gmail.com>
 <037d0771-a802-4ca4-86be-5b032635395a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <037d0771-a802-4ca4-86be-5b032635395a@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92625-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,gmail.com,linux.intel.com,suse.de,ffwll.ch,ravnborg.org,vger.kernel.org,lists.freedesktop.org,zhan.science];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,postmarketos.org:url]
X-Rspamd-Queue-Id: DF15A127AC5
X-Rspamd-Action: no action

On Tue, Feb 10, 2026 at 10:10:46AM +0100, Konrad Dybcio wrote:
> On 2/10/26 3:33 AM, Richard Acayan wrote:
> > Some Pixel 3a XL devices have a Tianma panel. Add the separate device
> > tree for this to support these other devices.
> 
> There's not a device upstream for any kind of Pixel 3a XL - should
> we anticipate a non-Tianma-panel one too (i.e. are you sure those
> are out in the wild)?

Yes, some postmarketOS community members self-declared as owning the
variant with the SDC (Samsung) panel[1].

[1] https://wiki.postmarketos.org/index.php?title=Google_Pixel_3a_XL_(google-bonito)&oldid=89946#Users_owning_this_device

