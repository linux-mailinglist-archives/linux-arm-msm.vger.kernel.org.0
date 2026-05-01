Return-Path: <linux-arm-msm+bounces-105548-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2GQSFQLs9GkaFwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105548-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 20:08:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3961D4AEB99
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 20:08:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 99B973008C29
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 May 2026 18:08:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EAE13D171B;
	Fri,  1 May 2026 18:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="G7l+WI78"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08413F074F
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 May 2026 18:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777658876; cv=none; b=Qej93nH4MI/zpS1xHDGVQa7TM36q5iG59wJVCMqrZa6ogsVo16LicJU0zNB5Ke8LR2G1zCo915Aq6QuGnEjyZr5KieP7U7Pdn9nU1pXq89vb9aW4rmH7bK+JaDGZX3ky7BKtfPXoJ1fDLBgVQxd12FYKgYpzneWGl52V05fuQqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777658876; c=relaxed/simple;
	bh=eynylHZFBsXgEqVs+4fseQrXK93kdKB/9Os3we6Deik=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CkiAx+L+vYIz/mrcdGmMZ8rQ7nmd40lRDOUQWQTQbTPiYBRtIMvXZ74X4b4HwBXIETx17rUIofBPQat0+BqUJ8US2MDroMNGVjsmgq7sInWwkDnoBwTyf0chqCeOR+gIUy3jQWb/pSChtAhw1oig5Exz/iRFiizGFxGTsTQWD4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=G7l+WI78; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-50d6ab4476eso19801651cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 May 2026 11:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1777658871; x=1778263671; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a7l6FEvqkNwJ0g7Pn9F7zooR8PbKdP3FdX90Rm3Ztm8=;
        b=G7l+WI787dWOE2tuWa3pxOfVBIYDqnB2m5j6wtTcxdKJGenYim/0DQ7lc1rQAGN38R
         egZGidDVax5FzICC7e6oByuAVxtIc43hobHgPS6WF9qrrLDMcPiscPYRYItZAdR95oq/
         3F8mrn+s6cyh8RxBW2qKlMbk9rQzufBK2taQ4JyRAwVLRhWdNOMAaOjfeNiViFLqGwjH
         KoJUY3jNnKDwN7H7sNIRSGtV0okc2Lvj4rIyMJm7ht42K8oWrCz1ueaD6d5EWEqgOVxa
         QmZjJghsojHblT2joTbvV8bouomEpeQwLsAMHIzNap0chIQy8QEu5w+5oOtX4L0IrXhy
         1VZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777658871; x=1778263671;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a7l6FEvqkNwJ0g7Pn9F7zooR8PbKdP3FdX90Rm3Ztm8=;
        b=EIdze4qGawQuXRvEOF6fglh12oeOePQMM02mkmkFQxKP/JugKrjjD+kwPXTgAUNngm
         pMXtlC9dpO5/UgBOlvApZ7Lr+apancw3oJAS1KMvVCk8XsUKwdedLwedmmxtgdv30G/W
         UFoEbkhRDaEOtTPH4IBGV9Rp6pYNktoy/fbAJuVf8Vma5gH5uUU4n9F4RwTjmAIEpb3U
         x3mm13BKfoWvh4dmBzq0W99lXpefqiw+mGm/ZrUh09nB5YTWSIsCfsjxL/f5sPL21rC9
         9UvNaZldOEkcdCNBML3XnsIIix60KaN6f0DGu+3zyxlP6e/gXN8MfnD1KEF9EJiiYJ4v
         Uc+Q==
X-Forwarded-Encrypted: i=1; AFNElJ9TwQ3GhWiP8hmxBx5qPJcU7Tpc80HMzzmFpNtMt/EzC6mNYwfzVz/mxTZmJV9Pl9bv5mt3FZV8W0f9ptPN@vger.kernel.org
X-Gm-Message-State: AOJu0YzlrVBR0BoPn5qoq/lWoGfGct7s+BfycI6Hcr4GR8g+01KlWiCf
	6Bt/mXvaBuqSToqpJxnRkB08ESNGf8Jy/3fR8PumY2fGKtrn8aZF4JjBXvFH///LbAE=
X-Gm-Gg: AeBDies/Nefsi3d1mhFY3CPy/Oj5I2QXSIyGhGlPHxSVOxlU+RAf85lQ1fABFYbQJM0
	m57kTx01hpTEXl84JZuppXVXdI4x6ofE+TSUZ/RTHqKrdwlhY7oM/GfNJD9VddJf5Lj16E4EC5c
	YcZfG6o/Y3/lGSBthpaduhW08ydKx8q+RPKmQ2u+1wYxoWJfnS5jOYbPe2EIsdEs4PUJKsglpbM
	QcpSXNzs+gWemhblz8uK+zrzr4SEFWxcJJXIQkAvnaQshMTY/KGKoRe701WS//o+S9wkMlEP5c9
	guuBa5TFKN88IsV+2YBXOqnO6LlP+gMBNdJqZQoijoGifDQ9B4eHLvJIiCgABnwKAs+I0Wxgxxz
	T0FtuZXxyzhsybOmTJNxVGb+vxpE8Sa40Th+YCnVdAkytKFTDZ84T0vzcXM/vHB51rpI/uk+TS3
	lwYkl/7OAMzxvK2sqRY6A6tThoqQY34HPVO8hYsoHRK9Ka9yn0Igv/DQqYrO0B4Y1ieXC3N/lGL
	l4uDJP4N99k
X-Received: by 2002:a05:622a:903:b0:50b:3f6a:1d88 with SMTP id d75a77b69052e-5104be231f4mr4182581cf.19.1777658871298;
        Fri, 01 May 2026 11:07:51 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51040b80a4dsm20498971cf.24.2026.05.01.11.07.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 May 2026 11:07:50 -0700 (PDT)
Message-ID: <f60cc448-99d1-4fcc-bdbe-436b0c29d5eb@riscstar.com>
Date: Fri, 1 May 2026 13:07:47 -0500
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 02/12] net: pcs: pcs-xpcs: select operating mode
 for 10G-baseR capable PCS
To: Andrew Lunn <andrew@lunn.ch>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, maxime.chevallier@bootlin.com,
 rmk+kernel@armlinux.org.uk, andersson@kernel.org, konradybcio@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, linusw@kernel.org,
 brgl@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org,
 Daniel Thompson <daniel@riscstar.com>, mohd.anwar@oss.qualcomm.com,
 a0987203069@gmail.com, alexandre.torgue@foss.st.com, ast@kernel.org,
 boon.khai.ng@altera.com, chenchuangyu@xiaomi.com, chenhuacai@kernel.org,
 daniel@iogearbox.net, hawk@kernel.org, hkallweit1@gmail.com,
 inochiama@gmail.com, john.fastabend@gmail.com, julianbraha@gmail.com,
 livelycarpet87@gmail.com, matthew.gerlach@altera.com,
 mcoquelin.stm32@gmail.com, me@ziyao.cc,
 prabhakar.mahadev-lad.rj@bp.renesas.com, richardcochran@gmail.com,
 rohan.g.thomas@altera.com, sdf@fomichev.me, siyanteng@cqsoftware.com.cn,
 weishangjuan@eswincomputing.com, wens@kernel.org, netdev@vger.kernel.org,
 bpf@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-3-elder@riscstar.com>
 <f9a581a2-02ea-4948-8c97-835cb7638b1d@lunn.ch>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <f9a581a2-02ea-4948-8c97-835cb7638b1d@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 3961D4AEB99
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.06 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[riscstar-com.20251104.gappssmtp.com:s=20251104];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[riscstar.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,bootlin.com,armlinux.org.uk,arndb.de,linuxfoundation.org,riscstar.com,oss.qualcomm.com,gmail.com,foss.st.com,altera.com,xiaomi.com,iogearbox.net,ziyao.cc,bp.renesas.com,fomichev.me,cqsoftware.com.cn,eswincomputing.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105548-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[riscstar-com.20251104.gappssmtp.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elder@riscstar.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_GT_50(0.00)[50];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev,kernel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[riscstar.com:mid,riscstar-com.20251104.gappssmtp.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

On 5/1/26 11:50 AM, Andrew Lunn wrote:
>> +static int xpcs_config_operating_mode(struct dw_xpcs *xpcs, int an_mode)
>> +{
>> +	int mdio_stat2, ret;
>> +
>> +	switch (an_mode) {
>> +	case DW_AN_C37_SGMII:
>> +	case DW_AN_C37_1000BASEX:
>> +	case DW_2500BASEX:
>> +		mdio_stat2 = xpcs_read(xpcs, MDIO_MMD_PCS, MDIO_STAT2);
>> +		if (mdio_stat2 < 0)
>> +			return mdio_stat2;
>> +
>> +		/*
>> +		 * If this XPCS supports 10Gbase-R then it will be the default
>> +		 * which prevents 1000base-X and slower from working correctly.
> 
> It would be interesting to know if Toshiba messed up the integration
> of the PCS, or there is an errata for the licensed IP.
> 
> Anybody got access to the databook and erratas?
> 
> 	Andrew

I have the same question.  We do not (currently/yet?) have access
to this information.

					-Alex

