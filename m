Return-Path: <linux-arm-msm+bounces-105587-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YOyIDLex9mmgXgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105587-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 03 May 2026 04:23:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A31704B4240
	for <lists+linux-arm-msm@lfdr.de>; Sun, 03 May 2026 04:23:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 79F653008293
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 May 2026 02:23:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 818E9390219;
	Sun,  3 May 2026 02:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="ji7vaJUN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA5B346760
	for <linux-arm-msm@vger.kernel.org>; Sun,  3 May 2026 02:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777775026; cv=none; b=mhIomauUxth5Chr03IGaZC+U1t4K0uw36MwB07DVmPBBN/7C8r1fqH3f+eilJYgdsrlRAPcNMZqtd4KKi6xB5qVf5UWZ71ObnCgOiz+6gqm3NfQ03zIXhahHL3A4TuttAScY0VtxZpaTWSvZ0GEeXlihuvheVnHTGFKv5pG8FCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777775026; c=relaxed/simple;
	bh=Lg5HT63X6f+bfQfEb0j4Ta/UIv9kP8NkdsygInHEr8Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S3hP1Qajq/cHj+/wzn735zDRRyVWxQejXB6xEYYTuMds9tUGNA7m5meNcnKryr7hIJO6008vKcD7pQRgSJqyDdmi8dDzeTV2M03vRne3IooUTGquK2M3hVP+cx+r4CktO+trG6N6G0WGibHlOv7ukaKEq1De8ESmKhfuiAn8eoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=ji7vaJUN; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-8d7e7f48499so325397085a.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 02 May 2026 19:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1777775021; x=1778379821; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6zleKM47mpduavdnaP2aBKf2rkXt6X2UG0Frna4ddag=;
        b=ji7vaJUNx8YA6RVhs3aqpTb63SpMMMPLRla8X/V3s+XeLyYphjnM0adNDT4UxthXTp
         MkUCfvMy5fLLgih1UjEJIxq76rmjCuA9grdaqcDs7TQjRziaGIwlXlw9S3NYoW1JbYUN
         WboMLBGy2zgG//HYSPoxzK/g8ZtbiegETnLHiaSFBKmCoCV4coD+n1ZD90NmRy2m9YSD
         P3v4YAd9CLAK5Yh9Cev86ckiGQSc0Rih+vHaZADNpEFMBlVDNchsh9KUPTW9iXbY3ujy
         yUVjoFhENNpwjeUUvmdSbj2Pu/R5ZQYlR2PZCx61FNTyX2sydH+RkzppPyF01a4eWOmO
         F68Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777775021; x=1778379821;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6zleKM47mpduavdnaP2aBKf2rkXt6X2UG0Frna4ddag=;
        b=rNB2PYa7g6DlzDtA/ZPjKeymfke95KCNzlhOsW/7UbGuK1TbxVlfCBNm/ZPaSRpcPq
         Wy2afnxsuDwiODLUw9QjwBUOHQVckwWbUJqCeRErjFnzVdtJWXRxl0ocrEIX8kEzg0gs
         vjr5KXVNf5chLLp1z1kwmTyGJvDparit3pxAiX9To8CKlCzy66yzWCg8YcfSFia36pm3
         4P2FkB1stwY47XAV7fNyrL7YpxIUomTULO9ISiP3TWvNBmsbbNqyFgGhEH2zpLyS6oSm
         /r1U8BDQSeiXj03QkCWC6WGotFrLy/0B+D1c15jWNYdH/M2+UlsY/DIHFEzE/+RDZdcd
         szgQ==
X-Forwarded-Encrypted: i=1; AFNElJ+jFvYbuK7ecWHtlwgGKH+g4R3XH71CtRq0s8HByGGJwlzrr0DzxsiFl43404t7MgmbpJRYH1eoyjQQtGQ3@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+akjZlqR/2CAaLXn/vFFVdIRPbIVp+cWFuYu2Ov49Diu85sRb
	vd0nWnW+KTk6lz9lVKXKwTJeJpaZP0Q2it8HB/Zt3ljJfRHX5mEbjgdu1r30cRbK4bo=
X-Gm-Gg: AeBDiesupJiALm1YIRoDOkQ1yI+Z1TM1qoJ+26c7Hia/vOWbHANJKXjDwU+DHsUtk3F
	5Q9qFJ08dG1ZNJquIE54cyebaoIzL0sLtqm2DqiMbYoMAJyN5iyXXDOnIx/5NjIeVjKkdXSSNVB
	nRadWbw5UG7/ItdNuOFZ0+jcsH7uOrC/tYAyA4bstzYW+OU2veBeq861f2Ax+BHu5xKbUfmZ7VU
	PySUGF66E200iehI9cu9PwISrlacE36KPNa1m7Z7y7paiA87dB/SNZlNq7nlVDIuvTJ1eMTENmj
	KLHpxXG+GW1knS1hFmC/8JXKpf5R3UPWAEtWSWQQDmKqxXlgJnN9G9MzdTM3HRW/yTEd0LRw0rQ
	QwUH5pngtSu+7WI+Bxcgl3wHcGOVaYdGPmE7LFIBXHXP432NMVdvuAKdoABU9kp9QoeZml3Wpq7
	r+XPpH5/RE+mJxQ1TI0gL+PCe/SitWA3Ro7AEnsaqbU5YYKM8tT0mCdxLxMBGSB/KDPgvSUU4fn
	Q==
X-Received: by 2002:a05:620a:2a0f:b0:8cf:e946:bb56 with SMTP id af79cd13be357-8fd1833a52fmr796002985a.44.1777775021562;
        Sat, 02 May 2026 19:23:41 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fc2c349572sm652634685a.28.2026.05.02.19.23.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 May 2026 19:23:41 -0700 (PDT)
Message-ID: <5a8cde2d-2871-4f9a-be16-66c38005fd9e@riscstar.com>
Date: Sat, 2 May 2026 21:23:37 -0500
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 11/12] misc: tc956x_pci: add TC956x/QPS615
 support
To: Jakub Kicinski <kuba@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, maxime.chevallier@bootlin.com,
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
 <20260501155421.3329862-12-elder@riscstar.com>
 <20260502094559.15c3f479@kernel.org>
 <649428a4-9505-4a1a-bbbe-bd90be9b8155@riscstar.com>
 <20260502191427.34048082@kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260502191427.34048082@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: A31704B4240
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.06 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[riscstar-com.20251104.gappssmtp.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[riscstar.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105587-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lunn.ch,davemloft.net,google.com,redhat.com,bootlin.com,armlinux.org.uk,kernel.org,arndb.de,linuxfoundation.org,riscstar.com,oss.qualcomm.com,gmail.com,foss.st.com,altera.com,xiaomi.com,iogearbox.net,ziyao.cc,bp.renesas.com,fomichev.me,cqsoftware.com.cn,eswincomputing.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[49];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[riscstar-com.20251104.gappssmtp.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elder@riscstar.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev,kernel,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,riscstar.com:mid,riscstar-com.20251104.gappssmtp.com:dkim]

On 5/2/26 9:14 PM, Jakub Kicinski wrote:
> On Sat, 2 May 2026 21:06:33 -0500 Alex Elder wrote:
>>> drivers/misc/tc956x_pci.c:541:17: error: call to undeclared function 'u32_get_bits'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>>>     541 |         chip->rev_id = u32_get_bits(val, NCID_REV_ID_MASK);
>>>         |                        ^
>>
>> Yeah I think I noticed an error like that shows up with 32-bit builds?
>> In any case we didn't see it during development, and we'll make sure
>> <linux/bitfield.h> gets included.
> 
> on x86 it hits on all configs, I suspected you're building for ARM?

Yes.  I'll spend a little more time trying to build on other
architectures.  I normally like to add COMPILE_TEST.

					-Alex


