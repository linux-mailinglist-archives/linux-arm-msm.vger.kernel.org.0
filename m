Return-Path: <linux-arm-msm+bounces-98776-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sF4zJw0PvGkirwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98776-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 15:58:21 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4D62CD4B4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 15:58:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1BBC2302DF40
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 14:56:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19C233DC4C6;
	Thu, 19 Mar 2026 14:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OU+QOCS2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EDAF372672
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 14:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773932185; cv=none; b=tH3iRnCB3RzUhj+inbSntdCkyoz7RL1nMSz4nscZiOhThfQaGsWELHjFaCh2WQ+Q2O3KBaJecsLcQi7+oLaCdPSuAmpJXdrBPgg6cn99LQupGXn6ZFgiBhHg0hPz0IkGo0o4eGES0IdXY95nM/SLdrPfB3PQ4QreMyJrnmzGuXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773932185; c=relaxed/simple;
	bh=gd7SCs27uyPu79nVL6/LCI+yIXMU2kzESBFAMZUgfLI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lTH8QT/upIwwBdvVUzrJuWDS9ZZPcp6TWgCwkrNkfGJqlnSBhg5Wf/odzpjwjP41+Rk/4xpawt5g0HUI3WzaqGzyITc2tMhOn8hrfn8D1F9RmcCsQzTbK+3hd0Ru8pRH3mxiJloLFNYWbnp96Na0bTBLbdz/OVB6nSVi4W1c25o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OU+QOCS2; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-38a2fb8ad36so1680391fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 07:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773932182; x=1774536982; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nFE8LLUUKG9iTuvDaB93WvqlPoGXC9p6rn4PhnM6x18=;
        b=OU+QOCS22gmyJtPUxAd2+gZZf8fRVP81YY929OBTR1/7TmKG+QnvpvK5vx0f7hA9hv
         GOcXrJ3H02NqKoDfh6e6xKYCrvW75SSP6QfRJLtH62ZPwgDyzw2eoDg8ClOK4YW1P0Az
         hR3gm/65Q4xp0NPKN8HhshunAgoC6d9xzd/3sCjCCEs49A3MzX3kDsHYnn8dbq6UltDs
         HUTyZXPg2zMmLSGEM1+Esf4BaW89RTp6GcPgxM+GPSGAwVH9DkoOgUE5c5IunV75l0sr
         mTJWFuE5jfd0+j+YJmQ+zIjztR7WK2TbLLa+CTPWMhpv2sDAvfpn4GycDJfs7j6kQvzQ
         x/Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773932182; x=1774536982;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nFE8LLUUKG9iTuvDaB93WvqlPoGXC9p6rn4PhnM6x18=;
        b=iMNlP/DbxHgjydHrTdV/ukDhXjZyrkc2eXlSmvljtqQvSgeaCuy8owTY48FAdUJ5S+
         LKeNUyW+cYx8FemM6E/bBWwyrwkPCAzo8zjUZHPbrjve8hCYPIOgG6Py0shXoFhpM/Eu
         HZLxCSMzyARHlIrJl7KSzxs2bi7alUCVitOoW6IP+ftQlP+ofDjWb/OnM8HBx2+wo89z
         ikboAWq6iT7V9BTxSXFLgEeRYOZNhbzTL/EdawMQD6mMBQVwwZCXYZM+wTvKImSNufda
         qvTG/60+8/8txTe/Nsjs2vACUNWI9cpRvhoxsfys0xHHRDTEIgyIoTeKF/M0x+sxGRSW
         W89Q==
X-Forwarded-Encrypted: i=1; AJvYcCWqOiarI/F8y1ygOjYVfXAjwkd2+u0qn3xSC5u2kjhWC4CD1NnD1e5jxMfii1zxeX2lVqaUfekHuGtfqA6E@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2G4a4ivytVc5NriMBDdFkPlBUNwpaHOTky05OoLkEY3c25T7L
	/BI9QyiuLPHfQ9+nuWTN+czHsvCO2pzp3Yyw4f32s4Zxzt6jAdr08trdldpVIy7Z4Ts=
X-Gm-Gg: ATEYQzzWo7KF1FP9zbjP1QjEgH0dPQK2GIeRWasq+Btpask6gwTc3AYgVOpCWxzNlEY
	ok+wyE+BfirAMmiaCY1xGQjEdiTZYvoKCLO/cGMxsNOZzppLoJw7LSNVlFixpSfd5+vRoBl7f+e
	HjMhmwxu6f0ANA1lKSPzxG8Ttkc8YFVzM41omev0jAf1mNsUj3/9SJ5YPhzM6Wj+NVSKW7fwQ0k
	mRytDoazvly5BoczL37dbku5HHlkWGgo9q5rtzbRsVSaToPWXDkmbnr7Xv4VyN07GQVUKv5NE73
	xkpfr8ioGuNROAvn0jfbM2uM7rM1UULeY1AaorommmzlatxSQWUE/fjUcDhWElXNWEkW6E0tRPm
	xbgybmq2Zm/fTesg6/HFl9zRlRRpAPPTw4A3cQamwlrkfeN8qjzuvlLEz8DRKXLggJcA7GFhvJj
	+nreQyYDjezII0WOc1vxCZBGDzBuvyhs2lzLTpiq3svC+aR0TCk5Glt8FmiHThDkbzkY1Tn7UZH
	IUptA==
X-Received: by 2002:a05:6512:3b82:b0:5a2:7c19:414f with SMTP id 2adb3069b0e04-5a27c1941bfmr1196514e87.3.1773932181770;
        Thu, 19 Mar 2026 07:56:21 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a279c2be56sm1230577e87.19.2026.03.19.07.56.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 07:56:21 -0700 (PDT)
Message-ID: <d6616fc0-75fb-47e2-96cd-ae81fa1a8e82@linaro.org>
Date: Thu, 19 Mar 2026 16:56:20 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
To: Bryan O'Donoghue <bod@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260315-x1e-csi2-phy-v4-0-90c09203888d@linaro.org>
 <20260315-x1e-csi2-phy-v4-2-90c09203888d@linaro.org>
 <3f11de22-b729-4d06-b6c8-18e649e1979c@linaro.org>
 <80ddc2b4-d6f8-4e8d-a45e-69c05d100aa2@linaro.org>
 <16b10f17-ecd3-4cdd-ac3f-f64127d60ace@linaro.org>
 <ulenfus552ggobis4gmi7eh27tikdaxbgm2oj63b5l2vemlfxc@ib5f2xaqurj6>
 <26XTdUyQTB41Oc4D5HnMtSm_QpZRjlkljQRJVw-u1Zp3Ltn9s4LVU-LQkP6drdl3Z3GGssLCCbsVYPFEqssHcQ==@protonmail.internalid>
 <65e06b2e-eeb9-45af-97ac-4ae60f652361@linaro.org>
 <9578400d-30ac-4d8c-9295-ee4ec8af3b2c@kernel.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <9578400d-30ac-4d8c-9295-ee4ec8af3b2c@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98776-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.994];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0D4D62CD4B4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/19/26 15:17, Bryan O'Donoghue wrote:
> On 19/03/2026 13:08, Vladimir Zapolskiy wrote:
>>> Why do you want a media driver? Isn't PHY driver enough?
>>>
>> As for today CAMSS CSIPHY are already media devices, and a user applies media
>> specific properties to them, for instance media bus format, resolution etc.
>> Technically this might be removed from CAMSS, but if so, then it should be
>> done before this new PHY driver model is applied.
>>
>> --
>> Best wishes,
> 
> There's no reason to remove that from CAMSS - it would be an ABI break
> in user-space anyway.

If technically CAMSS CSIPHY could be excluded from the list of CAMSS media
subdevices, then for the sake of simplification it should be done for all
supported platforms in advance, such a change will be independent from this
particular phy series, and vice versa, this CAMSS only driver change will
prepare a ground for media-less CAMSS CSIPHY device drivers, hence it shall
precede this particular CAMSS CSIPHY series.

For backward compatibility with userspace a noop stub will be good enough,
it's not an issue at all.

> The media entity in CAMSS msm_csiphyX handles format negotiation and
> pipeline routing. The PHY driver handles electrical configuration. They
> don't conflict and there multiple cited examples of this upstream already.
> 

-- 
Best wishes,
Vladimir

