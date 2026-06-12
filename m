Return-Path: <linux-arm-msm+bounces-112895-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id B3TTNlDIK2q+EwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112895-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 10:50:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 56EAE677F5B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 10:50:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=imd-tec.com header.s=google header.b=NVIyMojn;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112895-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112895-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=imd-tec.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4E26331A8B34
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 08:47:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E6951A3172;
	Fri, 12 Jun 2026 08:47:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDAC330F938
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 08:47:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781254073; cv=none; b=H9G65tJ+yaNNwSBFLnVSj1NA2B5FlGzijctw2hBP9jYtZMt0Fp3lHN6uyuB4v47UArfosCe9FJ5k7GKGrfzfzO/1Ng/KRaO2n3bXVkmwrtE4ai9GLQmXfjc5JQROoS04FnsL+Pyc1ba+O+NMoHnbOhbpXUzNBDLFdGWedNfKkWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781254073; c=relaxed/simple;
	bh=s+bZ0I/wGrEui+NR2iQR7uLXLTlXHTEguWphMfWXwoI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Miuqx4mfEPA6n9aVKCATM0fhgn/SIWwdMLH0I05+mxqZQDDGQaXDMP9jwlRbPHvKfceDkl7KF6ZRWG1CaHhtHfZaRYtENGbPwLbqxX8IMfvdLm+Ns1zUvxedEHz9WPUQaakSr2u1U6XPmBbgk3FgeR99iK/UNqJ6Y9qwZQzz0Wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com; spf=pass smtp.mailfrom=imd-tec.com; dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b=NVIyMojn; arc=none smtp.client-ip=209.85.218.41
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-bebde89cfd3so89716566b.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 01:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=imd-tec.com; s=google; t=1781254070; x=1781858870; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZpxlstclOZZ3np0442RuOwgnhT0MaMwJQSqfqAFVDnk=;
        b=NVIyMojnddBHUwETcPFoKEAzeDMIM4DOXO6JjqH4xE7sdoyqW1M69bLtRj9OhRmrqw
         j38SiVCcRl3rIxW137hmcK7V1UFck2UDW+OsmWJ7/1JiFWi0FyCz9PsVn+krNk0h/hS8
         Re+Ou7EBAHkVJMKnlbnPSg2drG99+B+pXQpbf5OMQqbkWt5W0axsmeqb1SgR8iytWnvX
         P7LUDAsB1SqYkqK3Fb1H/uqLfnHDF/NV7BXDSqknL5Pc3BVXbYxIH1TauQ1etZ/wP1Yd
         vv9xm11Cy6MC9xTouHZ+GbHuqOjCTijggwAv5gWi90+2DA1aXR9VCicF/fGo0RQ3vLTx
         a7kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781254070; x=1781858870;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZpxlstclOZZ3np0442RuOwgnhT0MaMwJQSqfqAFVDnk=;
        b=MjbUr16J2rU3vd/k8XGc7IAzG1F0gFEVXadhG3YUuCz/G06yR1PFv37PyGZMnG3Qol
         04EGtNmd1wdk8pZfuWFQB3ybykJG8FpLt8j0ng7ZY3Kf4xJraiUrh57RXaVBoQa5uGqu
         kseITt3SLxIsbFbsekk84NPiOSeppaaeqOi9xXvkdjXEBeKWOXIlcCiSz+4vk0xLKwbf
         s5RaFHL2goAlQ9Nf3iW1rggOMdqXv3B16jQ+v5/MZ1CU3Zcu1YOwLOXx18xiUvqIVlSb
         /Fw/3TYK24WkvYN1maLZT4hxHMNQr0urLGE6EUUPs0fxw/ENZRqUpqd6j0/uPpmSjdxg
         UFMw==
X-Forwarded-Encrypted: i=1; AFNElJ9wXMyNJuKLg7ad2zTIklVWiAxI/VYy9yjUWKcXFr78QDk6nazSPwqYq+wEPaxTa34BYluQaUdckdkcZIgH@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+mg5WChl7pSoLsevxE5AJBl+bPepkNyxwP2spmpwqxrQT9zNp
	OflObSyi7qZT2X+G4+S32ZG7EV3I3QhXPO7rYG/iraHLc9fMa3LhpkmH9Aec6cSO1/4=
X-Gm-Gg: Acq92OEl25R2Fv8rBGy32V8af+FuoWBmOF/wc6ourTM2lGD9id1GdJj8H6/YESB1Qrf
	lMbN4ChDF244fwbAXVOyOC20emuUXb72ebB1VDF2r86AD5D45zNLqmNPEwLjB1XicwRB3o12EUJ
	gPfYGa3ekB+O4liTo/msRB1NJkT025TmLKPrtYaKuzinYl9EcHfKcAQht210PMhRgTh8Sx0kGiS
	aDmX5pGkjn7457anyTP/f0wB8tiLKMTuvAOYyqVtpnyiA150aK1fE7nQuj9z/94dE3agYD99bSZ
	vserRTte2swjyyVIw35YY3xms8D6S0LOPO4JrwVbHK2TBz8ICcDBsN6+GFSuubGmgzMbiDvJoD5
	QuQXOxJN2BSuDVbkGAGi7EzKfVumM3Eak9iOra71Wxfzh1Rjn2ghi3LEZkjg2x2h5aLkmF4DGfE
	x8c4jYftnL6QMneEBMBF6ifiytRcdBikiUTgbazr89VyVHnztBOvyVO4i9iWGwAoGuexIUJn/yg
	Sm8+mpNkM5eJCPclWo5yDx5arXzpoXenbDzkWgGXQs=
X-Received: by 2002:a17:907:7285:b0:bee:aed6:9d50 with SMTP id a640c23a62f3a-bfe2bfa08a5mr76930866b.48.1781254070073;
        Fri, 12 Jun 2026 01:47:50 -0700 (PDT)
Received: from will-Legion-Slim-5-16APH8 ([2a00:23c6:2736:8e01:1873:ad4d:171f:1cab])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb83420e9sm76567166b.45.2026.06.12.01.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 01:47:49 -0700 (PDT)
Date: Fri, 12 Jun 2026 09:47:47 +0100
From: William Bright <william.bright@imd-tec.com>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ram Boukobza <ram@imd-tec.com>,
	Tendai Makumire <tendai.makumire@imd-tec.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: sm8550: add SDHC4 controller node
Message-ID: <aivHs6p28uN3d6TI@will-Legion-Slim-5-16APH8>
References: <20260427-sm8550-sdhc4-support-v2-1-a4241f43ecd5@imd-tec.com>
 <e0731edc-81da-429a-a12e-a1d1b75f9544@linaro.org>
 <aig9licCxhtZbHMq@will-Legion-Slim-5-16APH8>
 <5a5cbf8f-07ef-419a-8d30-c1b0b2786312@linaro.org>
 <aik1ZYUT-cnpfdQn@will-Legion-Slim-5-16APH8>
 <00643a25-040a-4bec-8324-f52b30d84f9f@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <00643a25-040a-4bec-8324-f52b30d84f9f@linaro.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[imd-tec.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[imd-tec.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[imd-tec.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-112895-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER(0.00)[william.bright@imd-tec.com,linux-arm-msm@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:vladimir.zapolskiy@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:ram@imd-tec.com,m:tendai.makumire@imd-tec.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[william.bright@imd-tec.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 56EAE677F5B

On Thu, Jun 11, 2026 at 10:48:34AM +0300, Vladimir Zapolskiy wrote:
> Looks like the SDHC driver behaves expectedly then. For me it's hard to say
> what may be the rootcause, I believe the lower bus frequency should be fine,
> so it sounds like a hardware issue, but could it be PCB/board specific one?
> 
> If you find a chance to copy the SDHC driver (and its small dependencies)
> from Android and test it on your board, and if it also fails, then it might
> be well concluded that something is wrong with hardware, still it won't be
> quite convincing that the SoC SDHC is to blame here.
> 
> Hope it helps.
> 
> -- 
> Best wishes,
> Vladimir
My colleague Tendai (<tendai.makumire@imd-tec.com>) had the same issue
with dll-tuning failing in SDR50 when working on the downstream 5.15 msm
kernel [1].
It does sound like a potential SI issue so I will try the following:
  - Sweeping the drive-strength values for the sdhc_4 lines to see if I
    can find a set of values that work
  - Scoping the lines to check SI when performing dll-tuning, our board
    is very dense so this is challenging.
I am guessing this patch is only acceptable to be upstreamed once we get
to the bottom of why dll-tuning is failing?

[1] https://github.com/imd-tec/meta-imdt-qcom/tree/kirkstone/patches/msm-kernel/files

Many thanks,
Will

