Return-Path: <linux-arm-msm+bounces-100201-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eGGEBjM4xmm7HgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100201-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 08:56:35 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 90722340ABB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 08:56:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3FF1D303351D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 07:55:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6D7739D6DB;
	Fri, 27 Mar 2026 07:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M099O1fu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A129A3CD8A3
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 07:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774598100; cv=none; b=XaMbe50qjyKF5IjdJKqxdxCO+lTmjpb0tUmAN177Pem2t2Z9Xp0QxXRSklwJnQ41Hq+0L+KrwBZgcjrMvNDa5185b8x90gtX+Ra2jkNLffl4rMrDRcbtT8cf5xhJdCwVu6nWwdAbNDvO48kihCBn4nOARkId/ww2c6TUS8QcISI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774598100; c=relaxed/simple;
	bh=9w0CvfSbxYpmQd2IBuerfNSYp9JcQPyM/Uw7Un6bK6A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aiXv2ezn9AnL+/1mfU9KVAhgomhnBn9ZIBAUbBRihZfitjYrpyMr/JKAnQmtZdmxhn6kqJTNxtAoGPPNS1f86xX+SX6XVzj4yuKB+8qOpol0uEn2yzR7I2LOfx1FDiK73hJstib1RNbzjk+bmThYX3uUXWRx3D2l3pdMBFydUkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M099O1fu; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-38be12cee51so1330561fa.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 00:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774598089; x=1775202889; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZwNU0jlR/sjw8L47J81Q9QJvOfehg7npczIpclyPeM8=;
        b=M099O1fuo351T7uqMur7R7kvoh/eg60pls01GO2jQ6hp7scvwtXAm/8FnwC6pXF5wG
         T1kJ4Eot4zLe5A8XKni3kIZXK0bICcWvQufqU6m9ZvNnVAHOYgOkvW/4HwgWcMFZ16kL
         SPteW4BrmfzqvBWByT0fkMTo+/A/GpYrR1f0VTbNq1tQVEqONcaFXzLA/Npp8Tjb8Jy5
         Gg1cdT4y4CmCMEPpfue3xM/XY30nzjNlPBeE2RLrrOZhuAZP8kjR4jQ6bQ7K8K4A5XXV
         MlmC1gou+xDv5SkCsPKkpp77/xoSdTa3hOVWZN7gC6Arndg2lrfR2wuLX0X9vtnqE5G/
         a4YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774598089; x=1775202889;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZwNU0jlR/sjw8L47J81Q9QJvOfehg7npczIpclyPeM8=;
        b=GkFis4o3yRgYEoGCUlx1HhjvJsj93jAbzajEK5pRMSuYMcV8xjizLFiwYJurRK0+wW
         g3aXbxF65cOmxsX8DQI54OgF26Jc0IZIy+8V6PDcjJoQP/V0uImRvhByviHHwxNokfkS
         BIfpUv6ddKiMHIKKQzHfmGoRAXDxRJzYHdyFC2pkk4GJOdOVamt7rk1XnxpMA5PiGBaj
         JgXNsAFSUom5/TlFvj2zPJjFIij6Ehdn0EUAYMWBPds6rdrC2TCu2L3oHn1NIry/iPoG
         neqrxPNh/lUfdD9RoNIAWpc48IbupvZXC5Xsoiu/8h1mMMkj+HXuUwM+Kv0qp9zctV+L
         7hMw==
X-Gm-Message-State: AOJu0YwRCqrWLbb/q7lJDiU40N54el3r8fnUz5ZAIGAQfaTKkKSQaBDn
	hazaKEEalg6+53ge5sIj1o1eUBi52WPLBYP5ioxqla0GxGUZMhvStvrTnFiLri669jg=
X-Gm-Gg: ATEYQzz1dXK1z0O7Sm8RG+zzUYqvUlEzZOhqI1gjTgHP3hCqUCyoGiFVfr6DVQeMoRX
	3Am3QJfyv0OCJqf5ErmJsiEMw0WF8BOda9zSd4FvePVF0RahzSVhuINuDxAPtK5eUd6nFP9s6BI
	bPr36YuU3u5ijfpSrZL1T0fnCgG9EAS/Ujn3sKqqTMmDFlCC9GV9OWpZ1sXADHLneUDfZqziGPD
	ZsYOOgczaPDice0joQ13U5ob3u5EXNiT9CGNFOigzvtWMDOWyeb13tpwTnbDur9F676fbLiSaCw
	qPMDl9ttlHLDGorpUxL2jLTR/aMmtU5pNaSEmcdIj30qrt/nG/6tLaknTeW01xZkUSK1txkzdE6
	2i+YTSvhizDL98lUEqlu77Nw++Qo/9AHcGZjek5V1FnSTwn2Bp5e8SSFvj0xCf1kQkcC202nDHs
	QNv6Nwtyu4oUwtgkFoZclmipw+chVEf47D17kSo6fw1A7uJSm8zZ7GMI/lEymsCzV6VFQukL8sU
	dhEzg==
X-Received: by 2002:a2e:a889:0:b0:389:fd1a:4419 with SMTP id 38308e7fff4ca-38c74072654mr2395881fa.7.1774598089075;
        Fri, 27 Mar 2026 00:54:49 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c52f86970sm10376001fa.6.2026.03.27.00.54.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 00:54:48 -0700 (PDT)
Message-ID: <e37ce438-12c7-462d-b2bc-1351be62b806@linaro.org>
Date: Fri, 27 Mar 2026 09:54:48 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
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
 <fedd369d-a0fc-4dbd-9862-3b6e3a403764@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <fedd369d-a0fc-4dbd-9862-3b6e3a403764@linaro.org>
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
	TAGGED_FROM(0.00)[bounces-100201-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,lineageos.org:url,linaro.org:dkim,linaro.org:mid]
X-Rspamd-Queue-Id: 90722340ABB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/27/26 03:03, Bryan O'Donoghue wrote:
> On 26/03/2026 14:49, Vladimir Zapolskiy wrote:
>> Here the description of hardware is done, and my point is that the new
>> PHY_QCOM_CSI2_MODE_SPLIT_DPHY phy type is simply not needed, since it's
>> possible to give a proper description of hardware without this invention.
> 
> Perhaps I'm not understanding you.

You are welcome to ask questions, it may save time.

> If we use PHY_TYPE_DPHY
> 
> include/dt-bindings/phy/phy.h:#define PHY_TYPE_DPHY		10
> 
> We _must_ then add SPLIT_MODE to phy.h if/when we implement that
> support.

I don't think it is the must.

> Which means successfully arguing the toss of weather SPLIT_MODE
> is a Qualcommism - a vendor specific mode or not.
> 
> <&phy PHY_TYPE_DPHY> committed to an upstream dts will then need to be
> supported perpetually.
> 

First of all, nobody says/defines that the phy type is mandatory to be
present in the cell at all, for instance it could be provided over bus-type
property of media endpoints, and a connected sensor unavoidably postulates
the value of this property.

> So for example qrb5615 - kona/rb5 support split mode.
> 
> Pretend go with <&phy PHY_TYPE_DPHY>; and retrofit individual PHY
> support to this platform.
> 
> Grand so far.
> 
> The pretend we want to switch from one sensor to a split-mode sensor on
> the existing mezzanine.

You may think how it should be done, it's been asked for a while to provide
a complete valid example, it may help you to get a better understanding of
the whole picture.

> 
> Then we need a representation of split mode in phy.h to represent that
> in DT.

Some kind of split mode representation should be in DT, it does not
mean that it sticks to phy.h or whatever else. Lanes (and bus-type) are
described under endpoint device tree nodes, this is totally sufficient
to separate what you call "a split mode". So, it excludes phy.h.

> 
> <&phy PHY_TYPE_DPHY_SPLIT_MODE>;
> 
> Except split-mode is not an appropriate mode to define in phy.h since it
> is vendor specific - even if a few vendors support it, its not a generic
> PHY mode.
> 
> Hence we would have an enormously difficult time justifying adding that
> mode to phy.h and rightly so.

We still discuss a hardware description, it should not be problematic to
provide descriptions of regular DPHY and what you call 'split mode' DPHY
without any new extentions of the existing dt bindings.

>>> https://review.lineageos.org/c/LineageOS/
>>> android_kernel_motorola_sm6375/+/423960/1/drivers/cam_sensor_module/
>>> cam_csiphy/cam_csiphy_core.c#b285
>>>
>>> There is disjunction all over this file depending on the mode.
>>>
>>> https://review.lineageos.org/c/LineageOS/
>>> android_kernel_motorola_sm6375/+/423960/1/drivers/cam_sensor_module/
>>> cam_csiphy/cam_csiphy_core.c#b767
> 
> 
> OTOH
> 
> - SPLIT_MODE will certainly require _both_ separate init sequences
>     and specific logical disjunction for additional configuration steps
>     lane-assignment and masking, etc.
> 
> - That phy.h isn't the right location for SPLIT_MODE as its vendor
>     specific. Just look at the modes we have for the USB PHYs
>     same logic => include/dt-bindings/phy/phy-qcom-qmp.h same
>     raison d'être
> 
> - And that specifying PHY_TYPE_DPHY now binds us into an ABI that we
>     cannot subsequently change - it will not be possible to introduce
>     include/dt-bindings/phy/phy-qcom-mipi-csi2.h later on with our mode
> 
> So therefore include/dt-bindings/phy/phy-qcom-mipi-csi2.h + PHY modes is
> the logical outcome.
> 

Unnecessary extention of the dt bindings ABI is not needed to complete
the task.

-- 
Best wishes,
Vladimir

