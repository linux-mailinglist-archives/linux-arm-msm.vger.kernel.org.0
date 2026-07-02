Return-Path: <linux-arm-msm+bounces-115810-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HVLiEzCsRWrpDgsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115810-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 02:09:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A219A6F2916
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 02:09:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b="o9LbZoJ/";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115810-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115810-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F0B1C3028B11
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 00:08:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60AF641754;
	Thu,  2 Jul 2026 00:08:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFE9222083
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 00:08:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782950932; cv=none; b=bLCl4erMfsI15F7u78cy/uIM6+AwfMuqju7fbbumNzAr0DJCmhu19d0U/S3rqxoky8LXx+Igt7qRL5PBoXMMIahgd5B5CGj9aUj3s5pK7q6TpdmwMMxwDHwGyT0ZoH62nnu1hF4ldip6/OrAGT4ISDQRDf/GLr3P4fU3UL5yRaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782950932; c=relaxed/simple;
	bh=vpK3lrRvtjtz1zpn4+fNk4iRculZWTOVXgTV2Q/9+EU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IM+BBL7z5fldx9HYQ5AolAf1m13nuYBcBgo03y+0A7cO/bcDbKYasOFJwRLYzlEY+5KoW9/VXjEsa6paHCkcPsXq51XyBht6nQ3VxxQ6s+Xd+vIRt1CmsE7cvtlhVzt5vNobEtV2Hm/O6b9EL2XswS4wdb3sA9oFePCqjebiDhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o9LbZoJ/; arc=none smtp.client-ip=209.85.128.53
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-493c4ce68fbso2572465e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 17:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782950929; x=1783555729; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PNsykQwqe+udfzbubaksG4wXVqyFa0ncqpop64TNBKw=;
        b=o9LbZoJ/XoY1XaRCsmwpSAqHflUxEAKDEvwGyoW+kZHPC3JePkWyK/BhveS5Pk0Agv
         g3ZuwZRg8wRMVb1T3M00kos7E3f80aUTcnY5BqIEOJqJUSf22edqeBISnaMTegz4QS78
         seDRc/oOJZx+ymVyd4zmXN3r1AFA3s6YDHqq0GCrab393aBuZeMdfWCt0BtnwzDJZAY4
         iUctKhYprEzq8xj/PEzPOdEXZM5yvdO4D5yxRPDF7LgSWgfzP6He+7y218ont+yosGD7
         TD34jI0xYmqR8kxnQmMVQv989xoF9xO3ADj2DgGepsE1SlK6R5QXuL4TQxLdzZ46SGGP
         sztA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782950929; x=1783555729;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PNsykQwqe+udfzbubaksG4wXVqyFa0ncqpop64TNBKw=;
        b=iigA64MCJ/K/P1D8AuhRtYXQyL0F5KUttEG14C3EJ525Y1RZvhfN+u1N5CLzENNR+8
         RmZh1PiMS8wf5PuCcVXYz9HI6uSiJfWm5O7iuqMTdhGFjfeYTD6TjgD4qf4nhy/6XJyO
         mxYuGZAv26xGCHqScJRc7oyFNhnrUy+EbLe52AO/6jDykqyOz4RGAhupEgV29Stm/PLw
         fjd4shSRN/GaTHAiQga6N+JUw+glhvaxhDezQ+C4MazDN9IsWGW50CGTMtsRXj0VIgXo
         70Vs6sRULegTwIOxzZS2ZPCEdn41cBtp1XffHddAi+CWy+cBzy5oBuX4aLXi/fxFrBwD
         Ddgg==
X-Gm-Message-State: AOJu0Yx+G0IQxSULsNwtdi+TYFrdMfP50JVQQEBoyTB0g0QGZfx8YdJ7
	pbz6G9FOQFcLOIkL6up0LByNQENrCfcKdHeYnb79kKf5/3nShtttOg1pHwYSajxp/no=
X-Gm-Gg: AfdE7cnbDSBygRcpQZT17EqmxqCcBAf1SVyaSTyVqwbQ+H8eJwH09hG28MbuPcTXKjW
	wNb9YdU9lq/bGgCHwc3UMJx9oYOaq3ohXIEhLeu7eRYJU90LJUmCUzQgDZ/hu4+xw2MtK3EN8Oq
	4AzCs7X3yNh2uc611XkmIfhZH+UmUOvQafdgxr2LYYF8EVxLqhGyNliUMNX+9DlAMboNaK9GzR9
	D9NATtxSQDiygtiLfSDpdxnNom0tthDenx86YRrbFihX4G/WmvuifgSHcT+ve77DQpaJCin6i0/
	NO68H+x70fGAEX+tWFz7HqLIUcoIRzN9IJCth4H6WDPkKBKNeLrknmGVXyAJH/dHV1LgFEc81Lj
	7WN/bWBBKmt4Sa/S4yExTJ27lU3Kr1TndCXX3pb0+vOXqdtigy7uJ8FS8Ep4gwp0V6NEPys/Pjz
	4TCl1xHmQHN0BZiE8KVoeYbyfR
X-Received: by 2002:a05:600c:8b75:b0:493:aa0a:45ad with SMTP id 5b1f17b1804b1-493c2b3ce9fmr53986115e9.2.1782950929104;
        Wed, 01 Jul 2026 17:08:49 -0700 (PDT)
Received: from [192.168.0.101] ([109.76.66.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c637bbcfsm1790375e9.6.2026.07.01.17.08.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 17:08:48 -0700 (PDT)
Message-ID: <6b6492a4-7610-4dce-a81c-8dc0387a4061@linaro.org>
Date: Thu, 2 Jul 2026 01:08:47 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260523-x1e-csi2-phy-v8-0-a85668459521@linaro.org>
 <20260523-x1e-csi2-phy-v8-1-a85668459521@linaro.org>
 <rpnNMsR9GY8gbynzeBO8Zm61JAOq3ubt6sp0x3WDPPwkMAJzlcofECD1kabN-IUoK6sSwP5P6l28UIZLFCOpjQ==@protonmail.internalid>
 <dda32577-04e0-4507-acaf-a5694f4f31b3@linaro.org>
 <7c564df8-5c5a-4b43-806e-5e017e5c51db@kernel.org>
 <ae3a381b-5697-43ee-bdfd-aaf2d22ceedf@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <ae3a381b-5697-43ee-bdfd-aaf2d22ceedf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115810-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vladimir.zapolskiy@linaro.org,m:bod@kernel.org,m:vkoul@kernel.org,m:kishon@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:mid,linaro.org:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A219A6F2916

On 02/07/2026 00:37, Vladimir Zapolskiy wrote:
>>
>> Inserting bus-type into the PHY layer is borrowing from one domain
>> linux-media and pushing the concept into PHYs.
> 
> It's the other way around, "bus-type" is an endpoint property of media
> devices, reference to video-interfaces.yaml to get more details about it.
> 
>> phy-cells = 1 with CPHY/DPHY specified in the consumer, as was Rob's
>> suggestion will specify the mode.
> 
> This cell is just not needed, and unneeded complexity should not be added.

I'm going to stick to Rob's initial guidance on this.

https://lore.kernel.org/linux-media/20250710230846.GA44483-robh@kernel.org/

Happy to revisit if the DT the Gods so command.

---
bod

