Return-Path: <linux-arm-msm+bounces-115809-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dLVJBa2lRWq0DQsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115809-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 01:41:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C0BB56F266B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 01:41:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=au6dbQ19;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115809-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115809-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B31253074343
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 23:40:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32F272E54B6;
	Wed,  1 Jul 2026 23:38:03 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95BFA40D587
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 23:38:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782949083; cv=none; b=CtRf9W4uWy4FeUp+SG3edB6Avauvov7vW0ssLKub95mLqWgaxULx+kgftD5RlDLfISnW3ItxbOs1PXwADeMh3UhjFDtNtLVplpxMNQMTYLIIFFCHLIzAmCbSW1x53pNCi11M+LUJGYKVTWPgJ+R9DD5dmBjmML/KPt4ue1jMU7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782949083; c=relaxed/simple;
	bh=Ul+8pa7VUBwqQ9vUFj7cuT/cSE751FIa+VX8ioXeBlo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QqnNGNV5fdFs/Ro+3sUPf95pNOutXRDi4oPJ6AyQFYMMwXNuCmQpDAeb+5ZqcQlt3GBb9CcjapKLk/MSWRarlNRsA19h5zNDa6BrVtSCiMBrX98DvBV1uJH87pUBAcZTHDENa1lB9vr5iAtRyS4uVWQzq5IhwTDxnMXFISWv+BU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=au6dbQ19; arc=none smtp.client-ip=209.85.167.54
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5aebd7da975so147013e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 16:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782949080; x=1783553880; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OVCh6Lf8+nzzdAxzyPMuHDYAnEuNDpXn+opdGjJoaxg=;
        b=au6dbQ19ocDmFW8BHJn9lEOMKFQxa57yUbSs2zRJi99wQw+wZvrKCbkurmaCo1z6ba
         QqM2NXH4gWIXH+y1SspK8t40P1Q3TSZVDI/a69Lwf0KUdbQMnQBnZ9pkPaEQ0lCDYBrx
         14+O5E19dxpdNBt2Fi2znI4X9LzOa6UX6FgZKAO8B/l0GcqH+RzLAs6PGLJ9a6CTr9j5
         O11S5Bx7XBBec1iTqvBjlrAJHz4STwdd5cWuvF3505igPFahuo2K6LYpBaWIT8X0BQJU
         nDtmRGDQ+9IkksZVfVem2NBE23modaHpD8AmkTAi5DQcbyiypS/zQ1zp7dgHVK94vuo0
         Gxfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782949080; x=1783553880;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OVCh6Lf8+nzzdAxzyPMuHDYAnEuNDpXn+opdGjJoaxg=;
        b=sIY0YyqcbfUQ7xjBzBPbkGYCtUI6cmOW6e0wNY2xqj2V8Kh3zWtnea3gSG5ZF/+RO4
         mdm+W5K5x2QHbTXfXVpGS0+DK4Cork7MNXiFTdCGFlSF9whDfIV2epJjY2a5VYCPpBSn
         N+5ftrwlcVLQiTS0gn28KkXQigyvPsqiknngatHU/7eJIFNijeEUpEihn3fw3Z+BMWlU
         VY9lgJ4B7tkcl5A3GZ0kcLqYJKZUxpB8Nr4dtP3tI9C52hoHR4/GMcK44zDMqJCiDPq1
         7u1hb63kj1Ju93g3+HxDg61qNnGZjmeS9LB4GgYFOsNh/i7Iiu+lU03DhmocDdgoOy+e
         Q0sg==
X-Gm-Message-State: AOJu0YyAa5nkM7V2kvY8gg71K/o+VCL3vXrggW/JbBKQhZTmSCjJozXq
	JvjfnuX1BtrNyt/dYCrTAJYJUSndULUx8DpSn7uSBMz8YcWREEax+3lkYYpbsu7Ob4g=
X-Gm-Gg: AfdE7cn+SSuD8gMEJEAV8probVbVs083yaUud0G0QjDjl8lJvrsnpwmbCAW+emzD748
	hOZATUVBjbnhhiWZF64inXfB6XrsQXFwGsS+acHCdnL9zlMwhrTI4rPk9USNFQqZ5sYX4v6PPZz
	pf+mVvFJNUTZvFTbOIts0PQzz8DBox04VVbVuiCu4c+UPGGTfQ4eRMT9x40b+JVVoaFyN/1K7Hu
	Vas4vB1JUDaABaLQHsad7TNpA4V1U59VaewEA+RJLagcix1OjkRztY8snIo63bm+bs05CPHeh85
	5vcy+5lXyNn2chAw1YQOVoRL8BeE5J6CeblTiCPj7d1779ACoxIMPBiInmsHZP7mF+tCZcLeUoI
	vfq4fAxEGK4LKOoLCAeHmUJlu0mt2Fhna41SyS7yAxHfIjJjqrdbxph7sOD3LDmN8Arq2rHqA5/
	pd+VSFuKiDRKPx0UyWIvbVAFtxoMnZjMSB8jDWUnTZUX7OUQup4LySj384uhV3bnzgJlo=
X-Received: by 2002:a05:6512:4613:b0:5ae:b17a:2617 with SMTP id 2adb3069b0e04-5aec7435771mr533633e87.6.1782949079808;
        Wed, 01 Jul 2026 16:37:59 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aec89dc478sm300818e87.68.2026.07.01.16.37.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 16:37:58 -0700 (PDT)
Message-ID: <ae3a381b-5697-43ee-bdfd-aaf2d22ceedf@linaro.org>
Date: Thu, 2 Jul 2026 02:37:58 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: Bryan O'Donoghue <bod@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Vinod Koul
 <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260523-x1e-csi2-phy-v8-0-a85668459521@linaro.org>
 <20260523-x1e-csi2-phy-v8-1-a85668459521@linaro.org>
 <rpnNMsR9GY8gbynzeBO8Zm61JAOq3ubt6sp0x3WDPPwkMAJzlcofECD1kabN-IUoK6sSwP5P6l28UIZLFCOpjQ==@protonmail.internalid>
 <dda32577-04e0-4507-acaf-a5694f4f31b3@linaro.org>
 <7c564df8-5c5a-4b43-806e-5e017e5c51db@kernel.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <7c564df8-5c5a-4b43-806e-5e017e5c51db@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115809-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bod@kernel.org,m:vladimir.zapolskiy@linaro.org,m:bryan.odonoghue@linaro.org,m:vkoul@kernel.org,m:kishon@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:mid,linaro.org:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C0BB56F266B

On 7/2/26 01:54, Bryan O'Donoghue wrote:
> On 02/06/2026 22:59, Vladimir Zapolskiy wrote:
>>> +
>>> +  "#phy-cells":
>>> +    const: 1
>>> +    description:
>>> +      The single cell specifies the PHY operating mode.
>> #phy-cells should be 0, because the PHY operating mode is well defined
>> by 'bus-type' property of an endpoint on the sensor side, the opposite
>> side of CAMSS/CSID as a CSIPHY "consumer" should not dictate the PHY type.
> 
> So going through the list I don't believe this is correct.

Be specific what is incorrect.

> 
> Inserting bus-type into the PHY layer is borrowing from one domain
> linux-media and pushing the concept into PHYs.

It's the other way around, "bus-type" is an endpoint property of media
devices, reference to video-interfaces.yaml to get more details about it.

> phy-cells = 1 with CPHY/DPHY specified in the consumer, as was Rob's
> suggestion will specify the mode.

This cell is just not needed, and unneeded complexity should not be added.

> Then to understand if we are in regular or combo mode, we parse the
> ports/endspoints in the PHY node as we've agreed already.
> 

That's correct, and while it's unavoidable to parse endpoint properties,
a phy cell value will not bring any additional information, in the best
case it's useless, or it opens a door to a clash, if different phy types
are occasionally specified twice.

-- 
Best wishes,
Vladimir

