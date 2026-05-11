Return-Path: <linux-arm-msm+bounces-106965-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YBKTLIr6AWrjmwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106965-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 17:49:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 32FA85118A0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 17:49:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 672373082B19
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 15:42:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EAE4407578;
	Mon, 11 May 2026 15:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="Heko3cGu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65BEF406290
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 15:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778514096; cv=none; b=I2IT1YMQ2KMp8i83CMW0WcFPaAfz3AYgV6odFuRWlINTXOuAXcjhN4a7d/IOikzB46Gp0vtVwsMtdqGFwqjcWF/NocyKD8Zsz19Vn2nRGj0UbvieGTMbOj1qgbJni60Vm53IEam8arsrQft3yeacW63WGGMS4NB19tHm58Wbgsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778514096; c=relaxed/simple;
	bh=QYUz8b5kzsmvQFipBJ/YClQFCzx8AI1CLI1nrVUTxv0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bzQbQlm7EbNNIXj4ujRYcTg1QD9ErR9XLJRNdo9qiZkHcOguN+lYQ8mUPtxlAibXsUY33stk70Jgv0nUAh/nFHsV9OQW4wOfOYm+lOGOIZAxgDO930FLhWI4Q6EOAEfxhIQTI2hwYnYCpBm/D2ZHCOgZXmaWNYx5HGHYkv6JrYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=Heko3cGu; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48984d29fe3so48042355e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 08:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1778514093; x=1779118893; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QYUz8b5kzsmvQFipBJ/YClQFCzx8AI1CLI1nrVUTxv0=;
        b=Heko3cGu0Pyebt5bmYaWD5pTPrs+ZlplJer06F5Q3e9Ipc3Hi+pgI51EIhUU1T0ncf
         c4gO5Em2u4wlHWzDpeHA3DKtgyvG/TC2z3IoMk96Ekl6HoiCL7TdKph+bb5n4SXJ6g0P
         /opjNxoxU4YepoTNEddD9i5yfspCTDqhwkCPHZpy6MP6pQHszoGnw+I0gAqxHglOk1td
         UX/nAq9/M1jppHUduHWyQFPlGUWPQZt2oBTccyRjSok+olkdvR+SLawsm+GtGJ7SjoMO
         4yUg9H0xC3yWKaHycUvgIdVK4SRQpAQg89Z1D43EhU1IglbucyJojJXkmJkcQcz9YkR4
         gd1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778514093; x=1779118893;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QYUz8b5kzsmvQFipBJ/YClQFCzx8AI1CLI1nrVUTxv0=;
        b=QtVBhP4QuS/33hTcujcpaOJDSTxK/sBN2zwGd+Gq7xz164bFbPh5kkEin930hs38Ex
         IwBxyXS/vLi9yeapCqQ0yarGLOnBG+o+h4iTZqLLtkGOEbsZxcopT7qF9FuN2ns2wS0W
         xLiNb/KYmzMvnPUp0+4jTRmH2yDud/Uh3bH5H6P4cNjgExHYnMKvXz0MtO4zMU1c9TDp
         b2idTTACcE5V8KiofivNkQjZAYzqDYwggQdGmoxAy6autUtaYb/ufnSLe3tNqoSUOWLA
         Z+ygZPzQAXxYJO616EXbm/earOSUafBkTr+ug3MZWipXRA36qf6I0VHjaCYeM20Ahb52
         y/wA==
X-Forwarded-Encrypted: i=1; AFNElJ+F90JhY6T9iRkMGG/B/AkOfHKCL9OzYpiM+uX/POZ9gCTNsFDH5NFwuDvKMwDULAUj1LdS/ytGo0FigyJI@vger.kernel.org
X-Gm-Message-State: AOJu0YyTRZQF5uXfhdeivfOPyGej3kkNCDxwxPJtdBBe5uaPhUglH34H
	cAyJZ3dUKIiB4JyBHJJLBrImoEGoIMxeHrVnMca6AWoiTY7ijY73gpf2dAp2hgsj280=
X-Gm-Gg: Acq92OGnrk52OdRx2lvrRBlQV8/kqrxZcbdncH/0SmISoKhNKqGPpFPJ5nUWs0SvXRZ
	lh3An2IhlANVCWXTXXJdvwVRy4qQI/r3Srlr67yNUHj575sAhE8BOW9kKevmo5Dmqdq71DLOac5
	bR6ALKlm3BNz2qrg0coUQh9X590JZlq79hAXqqIVOctawfGxmcvPtmS/f5F1HsCXuhAZVfsfkXT
	b9nriMSwsqklFsKtmZBXssuFWr8lVgQGAc2RTxql8NmekRYKErZWWzcjurIuk8R63FG9+zrJDZp
	MNplBuBN4q571X9RMIQDAOzS1giIHrayhWL2DnVo1lGnokkQ+lqxMRJ5p9MgqCapkgyAIDQ355R
	gtcRx55DeZezW9Rs8w8RYQ75x5LaMkB/HyiC0GreNu8MR7/Bh6kI1IVmRxr8an28TgKuD728Dry
	OgEUT3m2JI0Bg/gurkwX6J8RqYi9UWmEcBGt/FGuGM3JETlk/pamqLIbbSVoCdpQmFZhnb3FVTr
	7hbuUCrGvrBI9wA6Am75e92xkUuEK+ZpWmGTOUf5hkvRNCqtI1tyqu/pXOkIioWoNTPiG5J92ka
	yEoqT09R
X-Received: by 2002:a05:600c:1f89:b0:48e:8741:fd42 with SMTP id 5b1f17b1804b1-48e8741ff8cmr37216095e9.12.1778514092586;
        Mon, 11 May 2026 08:41:32 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e6d8e3247sm64622295e9.8.2026.05.11.08.41.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 08:41:31 -0700 (PDT)
Date: Mon, 11 May 2026 16:41:28 +0100
From: Daniel Thompson <daniel@riscstar.com>
To: Xilin Wu <sophon@radxa.com>
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
Message-ID: <agH4qC74A540koDl@aspen.lan>
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-11-elder@riscstar.com>
 <DD71CDEABC7C16D5+02d052ff-13bb-4712-a847-91416f76c578@radxa.com>
 <7f3a0f16-5159-4bbc-8b15-9b5841603bf6@riscstar.com>
 <3A5C0389E7C0D241+21a4f16b-1af8-46ac-8831-0c1b49694df0@radxa.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3A5C0389E7C0D241+21a4f16b-1af8-46ac-8831-0c1b49694df0@radxa.com>
X-Rspamd-Queue-Id: 32FA85118A0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.06 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[riscstar-com.20251104.gappssmtp.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[riscstar.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[riscstar.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,bootlin.com,armlinux.org.uk,arndb.de,linuxfoundation.org,oss.qualcomm.com,gmail.com,foss.st.com,altera.com,xiaomi.com,iogearbox.net,ziyao.cc,bp.renesas.com,fomichev.me,cqsoftware.com.cn,eswincomputing.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-106965-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[riscstar-com.20251104.gappssmtp.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel@riscstar.com,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_GT_50(0.00)[50];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev,kernel,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,aspen.lan:mid]
X-Rspamd-Action: no action

Hi Xilin

On Thu, May 07, 2026 at 09:57:26PM +0800, Xilin Wu wrote:
> Do you think if a shutdown callback like this is required? It looks like the
> driver sometimes does a MDIO MMIO read when the PCIe link is down, causing
> the board to reset due to SoC side PCIe NoC timeout.
>
> After this change, the board can always shutdown gracefully.

I've preferred controlled reboots to power cycles throughout development
and I hadn't spotted any major problems with graceful shutdown (which
isn't to say there have never crashes but generally I expect `reboot`
to provoke a reboot successfully).

Just to be sure configured my board with irq=POLL (to match your setup)
and still can't reproduce.

We mostly run Debian/systemd so there might be something happening in
userspace to sequence things nicely. However I have ruled out
NetworkManager.service and networking.service (stopped this services
does *not* tear down the network link).

Can you share a bit more about how to reproduce the problem (including
reliability of reproduction)?


Daniel.

