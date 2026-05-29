Return-Path: <linux-arm-msm+bounces-110304-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AE/FGIOyGWrryQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110304-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 17:36:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A62604DE4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 17:36:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C7DC732EC473
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 15:03:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 977AF4028F4;
	Fri, 29 May 2026 14:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dEp8C/l4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7A13FB7DE
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 14:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780066701; cv=none; b=YjNAvQ/UDfTcLnv97RAyMdmlq8aN4vvgXV0oV9nf+TG7ZfXf+/2+S13s1dgqKNSIFBq40ABG5XdfV0IoEXCprr19s8A6lpBBtpQ5r8ErLwlTb8CtxNJCZHIfHnL5vMMFiqZMWCgGJ45eNBeiDQJ3raOER2E8qUTl/JB6kF/muG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780066701; c=relaxed/simple;
	bh=TvDNOUNE5esDjb0VJzWZLByvq8d6tWkBf2WKUMK9i1A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jbN6effKHoxwN4ZX/Ta6L4UBWZUpBqUCr7hxUzdJeSmaf9anaAjYtmn3loZL28EvoPU0WHViYqta1bC0EdloWgnTxSRGGHvwAglmlcl0PtEubqeLe9HWDDioNJ4hQvWpcd38fsM3RWsrzKU4l2NCa1cHaubd0t9DmxVu4gZ9dSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dEp8C/l4; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4903997fcb5so82983535e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 07:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780066698; x=1780671498; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GU2T/pZfXae23cHrpeloETVxMMttaLJWiMdOf7oLCD8=;
        b=dEp8C/l4kP6fTzCOB0TqE8BUSqt69CnDSmzsvE8WbH6NizrhkG8T147dC1PVYuxN73
         EBSHHiYf4uKHpwJ/MEqpT1p+f+gh+LdFJg0A15EnPfEF2bI0MOcRTd47AtAXi41i8eLo
         wF3z3yWSqSqivF8sXBaxvfz7PKAU6/sluHBvH+IbFhAApcX51hsPRttuquZqx78m0oLK
         IL48+/+6gsoD6zNsc66DMmRCSvWHPtS1ZjKbqJuOQ5NOfMr0KSt0oi4aR26Hzt/fpAIo
         ZmCvBEIb4tGWmrA/yakeGSk0z876HQaNoAClDgFu1v6jKWQShyddHXKnpUh/iqg0n7aF
         s6Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780066698; x=1780671498;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GU2T/pZfXae23cHrpeloETVxMMttaLJWiMdOf7oLCD8=;
        b=rAgMIe8Zt6YkO1OvCYL2YGxkqxv3efNIHwprJOzZw1druVvA6FpanA+Veq8WC44eaf
         s780qq5j8qHaBOF5swBCJLvdU1aHifK/nxYn9Mz6fzl9KQdXNFV3MJagZvbpTIZ8snKS
         NrlFhJNBbe2Aoc8liJuz9pnyu7d5owkQazM8vxUiRHQEfwGZUMggX4mn4DkkfVJq4Vjl
         ZlxNgLJTx2mfOqg0f/ygTCbGOAoNgHGOQaDhzROUNT6N9MkA0o3dbxvBNKMK6QQdROAw
         ys2i/WL2y7+pLIPUt0tQXDVZz93agwwc9FM8OV6k2rkA3ZpG8dcLi4ceS6Fhq3HGeFJ2
         EpWg==
X-Forwarded-Encrypted: i=1; AFNElJ/cDH8dewIjjAFNcodOQYRPGHzD3Z45IfcIQr5zNMylcIIOTKibnWUejRp9/AoJ1UWwhz4a4d29a1lcXZEB@vger.kernel.org
X-Gm-Message-State: AOJu0YxcZVxt3SKe0dtXlKAxBrlqS3oirZMaH3vViNi6+9gsbd0iSxdY
	nqTVjkp632wsOujK+34UxPku2pxCYY0fUyz/6QVCqHgBAXXGaUas4Pg3mxrbq+llIMM=
X-Gm-Gg: Acq92OEoa/bKP6nMwYXQBP79aXjX2BYtYht5vULa+6R3aITVVPExtLKegDE7PfiUCrk
	hILZub7yZbAUHugaGmtT3VbzuiytKDsc9FdqxneOUVXOCGoAZ+h9SB/85pju2GvehscVvj63HIg
	1iWeqvkMgSRgNUVvLeqyWzA3vCOq1ruCpNKIEyflq7N81X5tbuxmHWz7p2hgVukRq1eHOxnnNIu
	RihdCtVRupNNW/yhhixjdPc1q7A5//AvuYFCS515SDJU0fUjbjUKll7Iwu8xHC8XtYBuFxad/9x
	DNxlRD2hcMls65Di0Z7a+XU9dErx0uXPWFnnj2azx4puRWYlcIqboumhu0xHg6Ci5/Ve+GRDz2t
	REOIbCHbXsqQYGDPBK5KXdvfL9NcJglTPT0bXen+3enaTmzBNxW1dlCWh0E1LoPrYTFXbJEh1Dz
	8QerKRvZAPrei96yQKX1ERdaPAb2e6HlSU1bvnOKrRXaw=
X-Received: by 2002:a05:600c:1994:b0:490:48df:2793 with SMTP id 5b1f17b1804b1-4909c0e77d6mr57620855e9.26.1780066698120;
        Fri, 29 May 2026 07:58:18 -0700 (PDT)
Received: from [192.168.0.101] ([64.43.33.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909ca6e124sm49445275e9.7.2026.05.29.07.58.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 07:58:17 -0700 (PDT)
Message-ID: <23d2a824-e894-4c26-8bd1-02bbb8a7c6d1@linaro.org>
Date: Fri, 29 May 2026 15:58:16 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] arm64: dts: qcom: shikra: Add CAMSS node
To: Vikram Sharma <vikram.sharma@oss.qualcomm.com>, bod@kernel.org,
 Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Suresh Vankadara <quic_svankada@quicinc.com>
References: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com>
 <20260526-shikra-camss-review-v1-4-645d2c8c75a7@qti.qualcomm.com>
 <178000689150.4557.11759359941436928903.b4-reply@b4>
 <df00e8d8-21ab-415f-815e-608eb7ab0967@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <df00e8d8-21ab-415f-815e-608eb7ab0967@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linaro.org,oss.qualcomm.com,kernel.org,nxp.com,pengutronix.de,gmail.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,quicinc.com];
	TAGGED_FROM(0.00)[bounces-110304-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:mid,linaro.org:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Queue-Id: E3A62604DE4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 29/05/2026 15:52, Vikram Sharma wrote:
> Shikra and Agatti are not iommu compatible in terms of Stream ID. Only VFE SID is same
> for both. Agatti is documenting iommu for VFE, CDM and OPE. OPE is not yet enabled for
> Shikra and in my opinion it should be added as a separate yaml similar to Agatti.
> "https://lore.kernel.org/all/20260508-camss-isp-ope-v3-9- 
> bb1055274603@oss.qualcomm.com/"
> 
> Regarding cdm iommu we have excluded it as we do not use it to program registers as of now.

Which will be a problem as soon as CDM is attempted to be enabled and 
yaml changes are dropped upstream.

Hmm then it seems to me that five is too many for Agatti's IOMMU set.

I'd like a number list so that we are discussing facts instead of 
nebulous hypotheticals.

For both Agatti and Shikra.

---
bod

