Return-Path: <linux-arm-msm+bounces-105581-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oJ7xAdmo9mmgXQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105581-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 03 May 2026 03:46:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 332874B40A7
	for <lists+linux-arm-msm@lfdr.de>; Sun, 03 May 2026 03:46:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 33CCD3002514
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 May 2026 01:45:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07181255F2C;
	Sun,  3 May 2026 01:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="jiEwwJEI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666F0239E80
	for <linux-arm-msm@vger.kernel.org>; Sun,  3 May 2026 01:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777772755; cv=none; b=BE2QGrQ5z6rRTjRHV4/khgl52Onn98glVaKDjCM1SZGa7K/g+FCz1MvjGBdwZgxbTlViLRBSN7DQqm6JgsQLZjX85fhQJ+RgwLixw+yqTEh80OzcqqvWXYYnnZMrbW1PcYEKMAotHnUP5gln0FUdK9gmx2DKFZj9GgsHLReX1Ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777772755; c=relaxed/simple;
	bh=YKj28Q85niDGU70q6VNatHef1IVTl7zI9IJbJKkrDqg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hT1b4EUvHwdPb07xfCOOH6GNN5b+oRbCRCuO5yXOoYVm/wiL4kg7pfcabmkcZajIdZLsa1/Q8D7NHuaxwI9ZCRZvjYMbqmtWpcBRH6/4+hZeS9r7t8jg9g1y/7y1q/pbaM1wnHN2y06taXI96mwEj8skE6yV82N/qRZwF3JYLWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=jiEwwJEI; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-8cb20bcff5aso288061185a.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 02 May 2026 18:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1777772753; x=1778377553; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k2VDIdBulUU5TGbhBANhJGFN/QeEIFSIYNJHL/TT6dc=;
        b=jiEwwJEIidVBpn5VKvdaqyut0STQFn5mUin1j0c7CPH3JyqMyIemYiIdKm9lx22P81
         sv3BQST9ufNYY5RSEqNxV3ydmGcdP1P9DKRRfCF/5VLCbkV6KzJqtEfwrP7XxN7jBkVY
         3jU+aJxY9wP68cm09MacVfg8HbSfAvnFojocv4c4fv1kJ3r4vGRF693QpbgFbJZNZYHm
         J9+kpgPA04Up0whIt4myKwa9Jrr13USBrhogdKpVf+nKoicoHY/Mhr+9Yzv6lxXfccbY
         PLOCKahXZZEwa6PRj9NvYXtyz1209AcMuvvlNoRYrWPVFUrhTtGhdFrtL1ARQTGX/ijI
         b60w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777772753; x=1778377553;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k2VDIdBulUU5TGbhBANhJGFN/QeEIFSIYNJHL/TT6dc=;
        b=UIL3t8zGYYx7cJ0crCJPNtVLSnQsA4n+6/ihdHsi/PHM9SQq7yjvkopdt9nzlayY9v
         jxaS4faCuB8oSEjF0DAWHQi+xd3H9ckzHmBckcysu+1MIG62dWyqiPnaCgOHtWCqpZcN
         7aroowhZKhT6Skg0SGdAIvDDQZ3MH4e9a6ph3NMilOCQ8H+QfSgGAkreyJVDCuT9ZRG4
         Jy940f+bkKxlzh5sAJZiXN1IWPl1C7OmStyMKlsyscgRGPKPAj5NB/TveBqIG+7Wcnjc
         4DAHO8oqVbVCKfBZbrvxcG4ps8BZWFgu1euB6t70kya7H4tOCRF84b5XewJ1olpbI5Vw
         NxHw==
X-Forwarded-Encrypted: i=1; AFNElJ9qLCev8QDD0OMPE34UKHSsUDE2dsDU04kKUKKEnSES2KVlha9jMg0an0QeMb4nQEZ9aOCtKHQAyNf1RgJC@vger.kernel.org
X-Gm-Message-State: AOJu0Ywe3kFCKDFxJLQXpuCzMNA3CpmoXvc/GU7mxj7C/hDKlhWq/Pz5
	3NEOCpH9popP/5sm+QDtcT6Qo2xcRvaZZtYs4LZu+7oONu44JWrPDgOrh6s+2BOeyuk=
X-Gm-Gg: AeBDievrwhqRIsu2uIEZ0XPsNr/9t3+CH6UvUPJM8AwpDkEFszQnLqNd4hykGu8lw19
	CK5Trimy4KtKxCtlkYd59tDbTcf/efLdSMa9MBVyqCZiA6x5eP3XR0ozPoIZ888viQpNMpHJ/70
	afBWq91iz7jg8IDX7/GWjhJCvwqjVS7ghCKkXKWr2cws/6QjnM0NHL4IPU1wnPswg+w3NKqNf/5
	GYNYuvEcGG3H6ORH/CwKUMPTS0QQSAfiQD76Di+KEc2eIn6fK+Jtmx5rHx/qNno33e187dDIaKv
	BG4E9hcCvdM8z0EOFE6rqiVhl+OA8v/jSuxEUnfFpo3fPaZNSXgepGtbm4qCCMZnqNfFLldg6jL
	PtD4uDjsJxXN25xN4bsXsouXKdR8nX6vEQ0Jg4FzLWg35aU6DjdQVX+ioM4b/HRqy7fXdJ74N4k
	Qeke/tY2syWeFoGpsNlPEwHceM+DhSEA2v2nVVp5s9w8qD9Qr5OV8/+3/ZivQQ5eZNguSakiGEh
	w==
X-Received: by 2002:a05:620a:284a:b0:8eb:10d4:a471 with SMTP id af79cd13be357-8fd17e4b6c1mr769719785a.43.1777772753243;
        Sat, 02 May 2026 18:45:53 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fc2c9229c8sm680230385a.36.2026.05.02.18.45.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 May 2026 18:45:52 -0700 (PDT)
Message-ID: <30cec7dd-ac3c-47ab-896a-c29992bd5ba5@riscstar.com>
Date: Sat, 2 May 2026 20:45:48 -0500
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 09/12] gpio: tc956x: add TC956x/QPS615 support
To: Andrew Lunn <andrew@lunn.ch>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, maxime.chevallier@bootlin.com,
 rmk+kernel@armlinux.org.uk, andersson@kernel.org, konradybcio@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, linusw@kernel.org,
 brgl@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org,
 daniel@riscstar.com, mohd.anwar@oss.qualcomm.com, a0987203069@gmail.com,
 alexandre.torgue@foss.st.com, ast@kernel.org, boon.khai.ng@altera.com,
 chenchuangyu@xiaomi.com, chenhuacai@kernel.org, daniel@iogearbox.net,
 hawk@kernel.org, hkallweit1@gmail.com, inochiama@gmail.com,
 john.fastabend@gmail.com, julianbraha@gmail.com, livelycarpet87@gmail.com,
 matthew.gerlach@altera.com, mcoquelin.stm32@gmail.com, me@ziyao.cc,
 prabhakar.mahadev-lad.rj@bp.renesas.com, richardcochran@gmail.com,
 rohan.g.thomas@altera.com, sdf@fomichev.me, siyanteng@cqsoftware.com.cn,
 weishangjuan@eswincomputing.com, wens@kernel.org, netdev@vger.kernel.org,
 bpf@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-10-elder@riscstar.com>
 <736fb3b7-c88a-4ec4-96ad-d1b79cc48d30@lunn.ch>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <736fb3b7-c88a-4ec4-96ad-d1b79cc48d30@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 332874B40A7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.06 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[riscstar-com.20251104.gappssmtp.com:s=20251104];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[riscstar.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,bootlin.com,armlinux.org.uk,arndb.de,linuxfoundation.org,riscstar.com,oss.qualcomm.com,gmail.com,foss.st.com,altera.com,xiaomi.com,iogearbox.net,ziyao.cc,bp.renesas.com,fomichev.me,cqsoftware.com.cn,eswincomputing.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105581-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[riscstar-com.20251104.gappssmtp.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elder@riscstar.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_GT_50(0.00)[50];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev,kernel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[riscstar.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

On 5/1/26 1:36 PM, Andrew Lunn wrote:
>> + * There is a TC956X PCI power controller driver that accesses the
>> + * direction and output value registers for GPIOs 2 and 3.  These
>> + * GPIOs control the reset signal for the two downstream PCIe ports.
>> + * Their values will never change during operation of this driver, and
>> + * this driver reserves these two GPIOS.
> 
> Why doesn't this power controller driver actually use this driver to
> control the GPIOs? Chicken/egg?

I am not the one with authority on this, but yes, that's my
understanding.  *Something* about this chip requires that the
PCIe ports need to have some configuration done on them *before*
PCIe is powered up.  So that driver uses the I2C interface to
apply these settings.  Meanwhile this driver uses the PCIe-mapped
memory to manage the GPIO registers.

> Maybe add a comment why gpio-regmap.c cannot be used. You probably
> need to instantiate it twice, but i still think you will end up with
> less code.

It's possible gpio-regmap.c *could* be used.  We started with
vendor code and this code got separated at some point along
the way.  It was working, and I don't think I pursued other
options at that point.  I'll look at this possibility before we
send out the next version.

What do you mean instantiate it twice?

					-Alex

> 
> 	Andrew


