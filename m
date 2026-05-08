Return-Path: <linux-arm-msm+bounces-106708-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mB/iJJUH/mkxmQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106708-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 17:56:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 13DFF4F90DF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 17:56:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7F1413013EF7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 15:55:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8694311954;
	Fri,  8 May 2026 15:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="r+qYdjAF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D21430C354
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 15:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778255700; cv=none; b=uSZ3o7gIkNPfL1Jj8cg+WPC751JX564fMJPTAPjRHts2aHp6Ao8QeZAFieynuD5VmknVcOlVmjIA5KIGM/7V+oHeyP06H6BErEcsngbkG8oW1I2lZBsZDYKwtzzUq/Qm++4C5I/6CMxAm4SyFHcLgONDVr84GUL3wHD4wB9PXc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778255700; c=relaxed/simple;
	bh=beGQbSohbqovdwuat6nKIVAFYzmFCR8PUrxcs94i44o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FGN25t4IyuBt2EZPlspRBfZk3/+FgBmH145ixqwfUC74hoeNEBqcFwrIuNY/ALIURlW4nI3zw1xLRTYg1uDyR/wF/OjDUPe901BLoC9t+oeGDhXvFGxJzmblPorT8HM7MvPnqYPFjipgwW1HR2hkt5yPmCADGBb7Kmzodvm38DI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=r+qYdjAF; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-449d6c68ed8so1777422f8f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 08:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1778255698; x=1778860498; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=beGQbSohbqovdwuat6nKIVAFYzmFCR8PUrxcs94i44o=;
        b=r+qYdjAFZkJSnq1CvRGaZ/LI0eK8QVoWEZ9b1iPl9bQ4fUagPkJ5pED9ioSpKvlsoO
         DrvL7Bh6e3tvTGaMBZXU0PYwKOPjbw7Sxw8y8vdeE77aWvjecDLGUuyegp7slaeFmOFc
         m8b3MlNirSpcUJr7Z89UYmFHcLpaWwjHk3JoHle6AcfeIevgB9PUjiGrTg/M1Lqj8hxx
         PjZvZhERjKUMRpg7w0l/re/UGKYWkC3uMKgNovGFMng5MGmX24mwGtoGrEHnwpwLAyrb
         /RbxexjnFUp6MOGJNDbI6hH+pNv1l2PtOczm5KPhE+ZYhNqqtd0WXLpNUXVKFjvbIaXe
         H2ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778255698; x=1778860498;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=beGQbSohbqovdwuat6nKIVAFYzmFCR8PUrxcs94i44o=;
        b=CWSald0y9fNB9cD8ZTSeu31xQY2ZmA8/S7yO14GLXKhXa3Uw3Woh0qR5IYPJYwT3MC
         gqP0JAhOTMLSqdbj6R6waQ1rk4K6mYUOFR9mLbp720wwbvI1w2xOlSvTcBlAo2FEtAf+
         GqaWTpepD2yUkE1p7XxPirMaXwjrC213fj5r6FkqQSnq4l6fe0RPQajetZbMHjOsRvgm
         1Zt+RiVs4VQBYCX87p7k3FPd+Jve0hKba5meaWnsFDEjeX3IUD5xtSMBqytIoB4gzu7D
         0rtroyYsNTrVhQOs5TSJ41IVwdJqEpMTZ+pZ7uxOzfXgENtUMoNiy0PQT61OWakGa6+8
         Oo2g==
X-Forwarded-Encrypted: i=1; AFNElJ+IWK98lYq66Wzdk+wegkQsgtQBYta7rA9CBv4AITV+zbILU53CHRV3p6jnCTDkYgzEHOkgMY6EXI3xNJq2@vger.kernel.org
X-Gm-Message-State: AOJu0YzNtLUTDwdMBV+hK6/NJX5Rjf/00LtBI+spXvBRwP4uOIcfLENa
	mIeopAgRZy4r9ccK23xekNSOt6afFQSavx54hMDtmtBOknG/GOmogmyHZdEzj4R55kQ=
X-Gm-Gg: Acq92OEF/moUTA2iRkJQeEu+ZV56LNp8VKCbRghTChkGMhVVc4tgTfzoYTRqWM1d/qD
	QEiaiCjLNbR3wrozYwMaiXvTjJoltmLaFCxbaOXyaUQFDighVqGZsA3vRwsNj/pi+pgv97zlDWX
	QSdk3SGp8vWtnYcVqRsvQS7Yo9djuN8+2N/5lTpL0V057Ck2mG7MP/jYfNnj58bcd4YlL/u9ArI
	PIZ0f+KCfmMzGsglxeO7LZfuUMvGSFVVwnimizzzNVHC/OjcJoFPKeTtXI//RlxMxBU3ezYHTCc
	awhDyxj7Ash679AeNSIOvT5RC0XWe/17YBTyKJ1b2n1Nx3i4n0HjEbQRLwZ6rJ6V2s8qyyRh4HN
	qc2w+hjzrcDN7cnZObNtCyagK8vSDd7/n9mnQa5xVLEE9XAsoKXNOXev9lk7CkMjNKCQ/6iVMmC
	pcesYHe0RDpULEUcyesyL8TD7j6M+cK+paDKObRy7x8afVMblfItqzOmfbX7ddmNC8Rh053pqwZ
	w3ApLMSjC0Im8ksn7JTzIvBowQJkCQ++nmgcLjDDEa65+XtRKLvjPbdK8jjLtiF9dilnwHAauK+
	KooWpyVZ
X-Received: by 2002:a05:6000:22c4:b0:43d:1c21:ead5 with SMTP id ffacd0b85a97d-4515ce1c6bcmr21753628f8f.22.1778255697345;
        Fri, 08 May 2026 08:54:57 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548eb75c29sm5680163f8f.9.2026.05.08.08.54.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 08:54:56 -0700 (PDT)
Date: Fri, 8 May 2026 16:54:54 +0100
From: Daniel Thompson <daniel@riscstar.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alex Elder <elder@riscstar.com>, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, maxime.chevallier@bootlin.com,
	rmk+kernel@armlinux.org.uk, andersson@kernel.org,
	konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linusw@kernel.org, brgl@kernel.org,
	arnd@arndb.de, gregkh@linuxfoundation.org,
	mohd.anwar@oss.qualcomm.com, a0987203069@gmail.com,
	alexandre.torgue@foss.st.com, ast@kernel.org,
	boon.khai.ng@altera.com, chenchuangyu@xiaomi.com,
	chenhuacai@kernel.org, daniel@iogearbox.net, hawk@kernel.org,
	hkallweit1@gmail.com, inochiama@gmail.com, john.fastabend@gmail.com,
	julianbraha@gmail.com, livelycarpet87@gmail.com,
	matthew.gerlach@altera.com, mcoquelin.stm32@gmail.com, me@ziyao.cc,
	prabhakar.mahadev-lad.rj@bp.renesas.com, richardcochran@gmail.com,
	rohan.g.thomas@altera.com, sdf@fomichev.me,
	siyanteng@cqsoftware.com.cn, weishangjuan@eswincomputing.com,
	wens@kernel.org, netdev@vger.kernel.org, bpf@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 10/12] net: stmmac: tc956x: add TC956x/QPS615
 support
Message-ID: <af4HTg5P3j0GsNvt@aspen.lan>
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-11-elder@riscstar.com>
 <2ce5897d-5bbb-486a-b0f0-0e30e54b451a@lunn.ch>
 <afy34kj2hPxIlArO@aspen.lan>
 <ef6df85f-11ac-404d-958a-8cf69b3b6bb6@lunn.ch>
 <af3IKKkjl0jK8GGB@aspen.lan>
 <f15e2fe2-88c9-409d-b953-cdc94aee4e16@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f15e2fe2-88c9-409d-b953-cdc94aee4e16@lunn.ch>
X-Rspamd-Queue-Id: 13DFF4F90DF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.06 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[riscstar-com.20251104.gappssmtp.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[riscstar.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[riscstar.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,bootlin.com,armlinux.org.uk,arndb.de,linuxfoundation.org,oss.qualcomm.com,gmail.com,foss.st.com,altera.com,xiaomi.com,iogearbox.net,ziyao.cc,bp.renesas.com,fomichev.me,cqsoftware.com.cn,eswincomputing.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-106708-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[riscstar-com.20251104.gappssmtp.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel@riscstar.com,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_GT_50(0.00)[50];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev,kernel,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,riscstar-com.20251104.gappssmtp.com:dkim,aspen.lan:mid]
X-Rspamd-Action: no action

On Fri, May 08, 2026 at 03:34:42PM +0200, Andrew Lunn wrote:
> > BTW if you are bothered by SP_SEL_SGMII_2500M, that name comes directly
> > from the TRM and I'd prefer to keep it if I can. The enumerated value
> > we have to write into the SP_SEL for 2500base-X is "SGMII 2500M".
>
> We try to avoid anything to do with SGMII and 2500 because it is
> technically wrong. Cisco never defined SGMII for 2500, it is something
> silicon vendors have made up, without any foundation in any
> standardisation. We much prefer to refer to it as 2500BaseX with
> broken signalling, which is a much more accurate description.
>
> The TRM is also not a public document. If it was, i could see some
> value in keeping with the naming, but since ~0 developers have the
> document, this is less useful.

This is a pretty obscure register buried on some of the TC956x glue
logic (e.g. it's not part of the DWMAC's register set). I take the view
that if someone is debugging the hardware interactions deeply enough to
care what this is called then the odds of them having access to the TRM
are actually pretty good.

However having a different name would be only a minor irritant to the
poor soul trying to debug the thing! I'll rename to SP_SEL_2500BASEX
in the next rev of the patchset.


Daniel.

