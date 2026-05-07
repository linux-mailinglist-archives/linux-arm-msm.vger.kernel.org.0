Return-Path: <linux-arm-msm+bounces-106498-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4DkpJl3c/GnqUgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106498-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 20:39:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB5F4ED898
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 20:39:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 503A9302A518
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 18:39:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C28C46AECC;
	Thu,  7 May 2026 18:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="sETjafTP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5CB4657DA
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 18:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778179160; cv=none; b=Zp+CPByjf+ChFzRBumsdSoW5VfDgybMaqtCL5I92v3xoVBbXBY5Z+ISJoVjrexJAuNpR6H8FU3bEu2Jc3LhfaUqEKtlNGBMB+uZfm8AT/rVl1Qmxsf43b/m/wbHJJANQd9kQOxTrJTSpRn7dwiqB7VpKaNacs+H1ejfVgfs/tDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778179160; c=relaxed/simple;
	bh=f/VYt86QfsV33lO5nWhjommtwvlcryeqI+nt7Vqb76c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ts/rMptovNoPkppczk2MbekEVbEiMyrgJF7FWa01fDAMJaN6BA9JEv3RiXM5x3bTh8HuG8Wu4TXJ0EG7PnsXKrRhRgevixLg77UIM57spHwMZ3Ftg6uPZnApET1iwq0Ovn+0ol90zho0qi1cnyXws98SWUd9aX6whIHDXpYDpDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=sETjafTP; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-8ed4dd182efso78498985a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 11:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1778179158; x=1778783958; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xAxf1DNF2nC8sz42taPRq/pgsGcKQpqrWaLh7UNAXF0=;
        b=sETjafTPdUg2ii93kH2SRdQpxIDwlHw++/Udnl0YvFhjKxo3mfpZymbm3zCbgKWwy1
         ZZTG/CwjDVG41bxom74SCHnJU+/7a9q6J2hC8o83bgco6Dr+7ETgR8oAhevz4ocMQDFX
         Ljcf7sSF83yMY1IdGcMdSDhhLa5F4ccPXRZr9o4kt7J8RlHc4eMCYebqQvQRTxtJPweY
         CbSHWFRgCs3jlhl7Ba3jBV+nkiOcv778l8CV5M7TCIdT8z5yhZMO1VXKgy2ghAU+ztSA
         rPjKoKJOaL9XsTVzUnI29jx+V0ofMTZcgeaBGW+QSjNrvNhH5sSNkCxFd4FPz2sDDIiR
         oyMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778179158; x=1778783958;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xAxf1DNF2nC8sz42taPRq/pgsGcKQpqrWaLh7UNAXF0=;
        b=o3N0KhK0oS3ABdRnJz2gXj5DBkMoFF1CdbjUkN35wVCmAqOORI8AxiK6cxyOHpKvI4
         V8OwoimmGTXOMcb541IJTZ2Q+zHaedUKwqaCQ03OC1rnw8VJ7nYpURCnsi4+NxuMrRPc
         k6RNez642xqPrbArAhdN/4LDVTcvsnS4yW/XqvLWwjD9obO9B94ZA6n+8NnT5dZFY8HK
         EhtJ1LFA44J765Xm9GH1WLeE7c2gKb4xVomr/zHrgXNFsTGjCMSk/hZZeWv2JclRfmI8
         5w/ag3Vw3562+EdYJA0gH+Uwj+vJGT+jZAe/anBuvHlXa8+i9GJmCqhiD4aPGwtcMHld
         dQQQ==
X-Forwarded-Encrypted: i=1; AFNElJ9lMTNw+s3UCHBJGb42b4b5orOqp/gIoHE25ueGdDMrRWuPXpMDEuWlaDk+E/ui9r/ZcX755xBo31lKpXQu@vger.kernel.org
X-Gm-Message-State: AOJu0Yygt7lgxBnm3iUif6EW3YxTkrH9HkEWNZ696K5xYMtU04wiP+D3
	bGpMZZ8Y6h0SUCfQbf9FfXQZudP7wnvmTvQu6Ad24jmLkc2kR7kMqOntgDiar49BpCA=
X-Gm-Gg: AeBDieuDN3i4CDCxSpLQtiUMy8tX70/yfDqV0jL9xWP45YX8ht+i2TYE5xyZ/yB8h28
	Z3xnrAD7uigJ2HC/V1pm+Al4AI0gj+RZa4ZBVD0WwmqbCcZExfZCXj7wnNETCn2mAuZjBZrTuyO
	RWxTGxJPQ4wLfVSxaWmAmU/0jfRedXYUMxsy8Jo6/A+S2jGC+9TC8VtA1D7fVuKwhPymwtNH4xU
	olju6DWbJ6PpevLCtee4k0aWFXL547eSMUsYtHdpZNTrAaWeYWrTGXjxvzDl6RCCxMQPWSHxiaw
	Dj0DGgN+HcPWo3Pvazk5KE4wxEy7zxgRoCCmXn3qnbV6EovGQBjperwH9XeZ1MoO86wfDWl3ToJ
	UDbP3ib2rqopeYCsFDqIVLy/fuywYlgY2aiZrD5e+aAxUfEJ7w/TQwC3HoGxeyywDlcDv/1LgnC
	G8evc9mwmVukEJHNYaJ7SwW/o31h1dBseZXDJtadBRmUFOsyg9ACNLe3hDE1z64fNU
X-Received: by 2002:a05:620a:40c9:b0:8e9:13ea:a0e1 with SMTP id af79cd13be357-904d496d4abmr1387402085a.18.1778179157638;
        Thu, 07 May 2026 11:39:17 -0700 (PDT)
Received: from [172.22.22.234] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fc2c25324esm2298627185a.23.2026.05.07.11.39.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 11:39:17 -0700 (PDT)
Message-ID: <20903580-85af-4e7b-b3dc-b8de49bd32c1@riscstar.com>
Date: Thu, 7 May 2026 13:39:13 -0500
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
 <30cec7dd-ac3c-47ab-896a-c29992bd5ba5@riscstar.com>
 <3e5a42cc-53b8-4065-a32a-d754be40b4c7@lunn.ch>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <3e5a42cc-53b8-4065-a32a-d754be40b4c7@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 2CB5F4ED898
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.06 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[riscstar-com.20251104.gappssmtp.com:s=20251104];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[riscstar.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,bootlin.com,armlinux.org.uk,arndb.de,linuxfoundation.org,riscstar.com,oss.qualcomm.com,gmail.com,foss.st.com,altera.com,xiaomi.com,iogearbox.net,ziyao.cc,bp.renesas.com,fomichev.me,cqsoftware.com.cn,eswincomputing.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106498-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[riscstar-com.20251104.gappssmtp.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elder@riscstar.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_GT_50(0.00)[50];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev,kernel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,riscstar.com:mid,riscstar-com.20251104.gappssmtp.com:dkim]
X-Rspamd-Action: no action

On 5/2/26 9:48 PM, Andrew Lunn wrote:
>> It's possible gpio-regmap.c *could* be used.  We started with
>> vendor code and this code got separated at some point along
>> the way.  It was working, and I don't think I pursued other
>> options at that point.  I'll look at this possibility before we
>> send out the next version.
> 
> The GPIO subsystem has made a big effort to provide generic code,
> since GPIOs are pretty simple things with a lot in common. So if the
> generic code works, or can be made to work with minor changes, you
> should use it.

Yes, I can confirm this is what I will use.  As mentioned
elsewhere, LinusW provided a patch that support the one
unusual thing this does (input-only GPIO lines).

>> What do you mean instantiate it twice?
> 
> I _think_ you need one instance for the first 32 GPIOs, and a second
> one for the remaining GPIOs. But maybe config->reg_stride might allow
> it to work with a single instance?

Oh I see.  Looking at it now, I presume the reg_stride will work here.

Thanks.

					-Alex


>     Andrew


