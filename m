Return-Path: <linux-arm-msm+bounces-100181-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eAWpM+TXxWnQCAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100181-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 02:05:40 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 262F733DB60
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 02:05:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 02030300CE79
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 01:03:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D26F92EF64F;
	Fri, 27 Mar 2026 01:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Haf7dYA3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30EEB2BE04C
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 01:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774573419; cv=none; b=Z4Im13XCdlSxKjqDlsYvVluh+uKog4Q9WUwOf7uOGfbHefCRuqehxzxKmWHS9teY1kFOoy0TvljeGBNsRfqhTCffj245p7x31sTd9RcXAHr/C35LqMZD9o+PNFyrmdi+AZ1wPMn6qvZCwjt5nIBLdqMqyfX83saFH2wziLcthQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774573419; c=relaxed/simple;
	bh=xUevR4UCtU4Tr6vB3xIsFHyUaTubgjvQmZ6CneW4wLE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CtY3ifuVa8c1w3oYWQrlZCPjYfDZcHAGR8vjMnZYW8kT5GcJZzAZ4BggDipwvPZGk8+8BvswrrGGsPw2nObm6OyHmDlhKlkfFG2MnY16UXWedHFA5Wf7pL2/i6DDAUuQkLTciUgunvwmkez7+JSUhPA7ag1fAN2QctXWPZOQCkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Haf7dYA3; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48704db565eso22364735e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 18:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774573407; x=1775178207; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m9Niuzybzpc7ylc9yfsJfs0wdPfmTua5AraM+Dz5c0Q=;
        b=Haf7dYA34j6bw2yA2l+OXl/XmRygA9RnQfX7iKPLAjXk/WAvrHGMtOLWItyj1HZNh6
         oOC/9E6EaVDketlvfObk6W4/NtGFwIMGxY94duJXk2hqezOcmjKLu4dC0w0qNTXTXd5r
         FW6Z40F7ewgI7tttu4fi5oR7iXOatd75kMDtmTi0IjGfCW2wF5kgCCkl2uWp5lRrHpF/
         4bj4gv2ZLfnZBoX/dddysFcj8mavVdMucjEk1Gp5UAdiJ1RpEca4QRgzWqxOBYAfQKR7
         CZT8LhVcNY+Fe75lcMn2pVE4CHNvm5e8gfVc/mMR74262FmxDFCpe9czQZCFRBh3Lbjh
         Z8Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774573407; x=1775178207;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m9Niuzybzpc7ylc9yfsJfs0wdPfmTua5AraM+Dz5c0Q=;
        b=BlSnU4+5aelpsS7nzzSC3DbPAPsv+1orJamhGvTtxHr3OsJtVO0ijhCJUqf5lcjyVg
         NAw4Q08e9m4VHm7KEwC4C13DKAPDhQxC6RVaTNiNDA+3godOv/TcF9mfXRcTd0yuZPvb
         /UbgMI57ptxZE/64fLbyNjgkSfLCKRPZJAPYSi2GCZe5IKkv0m/jcXlr8U420RLHVYF3
         ZgpHDhix0jT05+dflb2oaBTeYyQSn4FDs9GFRVItsJT1/eCUoVGaEHEz32HlVSfmenBm
         7QrBU6hVN3iNlojI75qsr68tPTE2vO+XC/SJj8rq6ay4OsO4rXN1dBc+Y0mk7sHJzWkI
         F+cg==
X-Gm-Message-State: AOJu0YxY63QKBTGAdE8PkR5MT7nRNnPjJHKTGpHytNn77/eD05pokR9k
	ewY57AJzVOo6mNIsJ7jBkhU10wrxjNGk3AtAiIXFKvd+2eyoyXarX1t8fT/8wMqfMkQ=
X-Gm-Gg: ATEYQzxvK1H59RwpAbtwUMpVIWJR7hcRwFdK0qsCgop5IW+wFwWyrRBV24QbDdL/rHD
	R0sed6n9mc2TUcU+5n5eY9tVC7u+MjLqh2/olKK8B64w/psTo0Gbj5vitrOYB9rLB8DfIqCT3mP
	m4gIUamZqLh8b/dw6uQPsuknEF9DMAj6vVrIGELWLLaxFNWcqrgivDcIe4pQA1G5F4JAykxF2Ax
	vid32hvdiLfe17TZXpgBibj4ZPELMQNEApNzaWqI7BOjGgvXZrzdgyHRmIAEhM4L9nz23VuEAFH
	+/NKu76IZpaJ/pzfee09b/5XHDcMUhtw+PF/3XZaXwtRrpWavqY7LOxRNjr/XIhiPVQzMPvSTCp
	bwNGRm1odR8ET3R1chCuXFVpQ58sPIcbOEpTMZat3v5RnGmCEkqlGjtXJWndsOVfGOuL/9XK4Yr
	dV9CBps+Er4P0+hfH0g0EnS8Zx6coR31laaHxcNKBsHyaNmw==
X-Received: by 2002:a05:600c:1d1f:b0:486:d76c:fa57 with SMTP id 5b1f17b1804b1-48727eb81bbmr11253345e9.17.1774573407044;
        Thu, 26 Mar 2026 18:03:27 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.111.26])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b9179b212sm12084513f8f.0.2026.03.26.18.03.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 18:03:26 -0700 (PDT)
Message-ID: <fedd369d-a0fc-4dbd-9862-3b6e3a403764@linaro.org>
Date: Fri, 27 Mar 2026 01:03:24 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260326-x1e-csi2-phy-v5-0-0c0fc7f5c01b@linaro.org>
 <20260326-x1e-csi2-phy-v5-1-0c0fc7f5c01b@linaro.org>
 <72ef6c9e-feb6-4e57-b8cc-7801bd748698@linaro.org>
 <f1c8c412-1d27-4c83-8c5e-76b9369ea6e9@linaro.org>
 <VwCtoebjwHqLTucsrGruvBpedA4k-Melt7C0DA0aHSVld3PeotwZdtMUm3EFpvQyScrl6yejmLaK7bY1avT1zQ==@protonmail.internalid>
 <8ac55e5f-72ed-4331-bf42-92ccf97507dd@linaro.org>
 <5d7d5bf8-4420-4d75-b928-820bb9233e52@kernel.org>
 <99287afe-90cb-44d5-91db-14c6b0f729fd@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <99287afe-90cb-44d5-91db-14c6b0f729fd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-100181-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:dkim,linaro.org:mid,lineageos.org:url]
X-Rspamd-Queue-Id: 262F733DB60
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26/03/2026 14:49, Vladimir Zapolskiy wrote:
> Here the description of hardware is done, and my point is that the new
> PHY_QCOM_CSI2_MODE_SPLIT_DPHY phy type is simply not needed, since it's
> possible to give a proper description of hardware without this invention.

Perhaps I'm not understanding you.

If we use PHY_TYPE_DPHY

include/dt-bindings/phy/phy.h:#define PHY_TYPE_DPHY		10

We _must_ then add SPLIT_MODE to phy.h if/when we implement that 
support. Which means successfully arguing the toss of weather SPLIT_MODE 
is a Qualcommism - a vendor specific mode or not.

<&phy PHY_TYPE_DPHY> committed to an upstream dts will then need to be 
supported perpetually.

So for example qrb5615 - kona/rb5 support split mode.

Pretend go with <&phy PHY_TYPE_DPHY>; and retrofit individual PHY 
support to this platform.

Grand so far.

The pretend we want to switch from one sensor to a split-mode sensor on 
the existing mezzanine.

Then we need a representation of split mode in phy.h to represent that 
in DT.

<&phy PHY_TYPE_DPHY_SPLIT_MODE>;

Except split-mode is not an appropriate mode to define in phy.h since it 
is vendor specific - even if a few vendors support it, its not a generic 
PHY mode.

Hence we would have an enormously difficult time justifying adding that 
mode to phy.h and rightly so.

>> https://review.lineageos.org/c/LineageOS/ 
>> android_kernel_motorola_sm6375/+/423960/1/drivers/cam_sensor_module/ 
>> cam_csiphy/cam_csiphy_core.c#b285
>>
>> There is disjunction all over this file depending on the mode.
>>
>> https://review.lineageos.org/c/LineageOS/ 
>> android_kernel_motorola_sm6375/+/423960/1/drivers/cam_sensor_module/ 
>> cam_csiphy/cam_csiphy_core.c#b767


OTOH

- SPLIT_MODE will certainly require _both_ separate init sequences
   and specific logical disjunction for additional configuration steps
   lane-assignment and masking, etc.

- That phy.h isn't the right location for SPLIT_MODE as its vendor
   specific. Just look at the modes we have for the USB PHYs
   same logic => include/dt-bindings/phy/phy-qcom-qmp.h same
   raison d'être

- And that specifying PHY_TYPE_DPHY now binds us into an ABI that we
   cannot subsequently change - it will not be possible to introduce
   include/dt-bindings/phy/phy-qcom-mipi-csi2.h later on with our mode

So therefore include/dt-bindings/phy/phy-qcom-mipi-csi2.h + PHY modes is 
the logical outcome.

---
bod

