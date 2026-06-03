Return-Path: <linux-arm-msm+bounces-111047-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Yv+6EuSRIGq05AAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111047-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 22:43:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2C463B2AC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 22:43:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=jo+wIgNB;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111047-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111047-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D95FF3018D58
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 20:42:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03590403EAC;
	Wed,  3 Jun 2026 20:42:17 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A148A400DF1
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2026 20:42:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780519336; cv=none; b=fgZWuZYEfzwY+3tsoTMzznVpa8ic6bQ8FHXBAZ45LbLE2HByyj5MwWN+qncYl/c8yP1J2oTUf6BTkUdI7y11HtMeT4mCq8aajHHLaY6uf4iytPCZEp3Ea9rEWufr/r0bZ2yUKg0wIudY/3t1RXaYWxsLslL/6JFthkM+p3LJYV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780519336; c=relaxed/simple;
	bh=NL5LlForqYlh+fcRsfduuGF8C586rzxAZDzcova+u04=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mblH72tdEcpnjM3dieBxm/qINdewJKZhZOvdJL7WhLKkZQkTVcMvVhsul51+75AT8SsCB9EYa/AZEGpIFGRhkzabBPEMCai896CQo3QyiubLhR+M7hUIWK64PqL6Bz9FfxhY1oPgGEijhkT2aqOi4YRyI+bilGhpeqafig36lrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jo+wIgNB; arc=none smtp.client-ip=209.85.208.176
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-396770d7f8fso5112701fa.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 13:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780519334; x=1781124134; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZKtbINASkuxxe/pYPg2E1h0L+MT79XjrtpjoA45kS4I=;
        b=jo+wIgNBbxyAecLYjcLmeKFAHMwp7tZugXinVwPPjFXlJ8ADVk/TA9UClregWIkD+F
         UFYuwert/plUxkp52MeC9UUvfOa1fzGvU95BNmqGSOTIa3j7WOlnliShjREdRmo3wlK6
         vIv7xqRrrFKp6ejK1HrqAVgEO8w4n0VE4X2Zmv0QaGj0FsvzHZkOmJv/ZPqOmzlTGcBY
         rb6CobN6fo63BYNNFzW244wTqdPZ/L3B0Vu1bhPLA5B4hNvcu52/05UXOn0O6rmAP/dQ
         QmJGg0Oe7f231yhvG29hdx2lPd1nROJSeb6uRnpW9NBnytK0o9SxtxpDm513mHCADfJE
         KAiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780519334; x=1781124134;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZKtbINASkuxxe/pYPg2E1h0L+MT79XjrtpjoA45kS4I=;
        b=fmrgFZo1xefxi8BCmjKC7DxYZTAQPj4RKBoofAZ2fh6xMERbEgN/Giz9xnrVEsz9Jq
         f/0WUO4p484beVox6xmJx6uT5czAXbwjwJQLB8ZoWDvpvVYgOw2Che2yjdAVimnhcICT
         WqCf0fHEDgTSSdV4okoF16yx1Dz8urTVeUGNWJ/SmS6mRM5Me5Uh6zehjhYW6/FX1pqQ
         NwSeikPYbMGOQYPjXUyCzMvUqBbZGnfHbwxFuFxAnUqjFTyFuhJeOyg8GM/Kuc+LdmLE
         gxDcUpKQMqmbCJDmDkT4JsRGhbQffxim3YzNw/KkVcM+czDig7QKXBbyk2R3hP9CwJ4n
         le1g==
X-Forwarded-Encrypted: i=1; AFNElJ8+LAzjC/P/BZ3DD0Z44A5HNw/Q7+XFr0A5Dz7b8O+UXBVID2+3yBO7Qyt98GEw16PcFVlDdg7hUXIXIVcj@vger.kernel.org
X-Gm-Message-State: AOJu0YxYe1TTGS4mtBBapGrFvHA/sR+U8twL8RtA57HeA+M1YQJcJReP
	UWB63wJqmoRGfL8e1isT/U6zGUmvLc4J0C23tioAQ3TO54vGOyr67gB3+4FT1eiEM4k=
X-Gm-Gg: Acq92OFupjQpWcHsqrQI6tyNUvfRk9GR0Wz7rgBvUZJbzjaHBCgJmDLB00IBxNG6jcc
	cbp6WXfadNn6xWXtEnGHNHzwGj2LmzY7tgwHLcgOIAto4lIQHoPxuD/FI78jijCj2nWmHsN/vOH
	VfBg1pY0NBas6Ue0Whv/2PyGUXcr+9DxPOTAOSazepcJZv8X7PEL6LugK1JosQPdiY3TYyc5/UR
	8bjdhFpFKYQjhmaokeIAaTsVGzUZx+XqmU5WlWzRabz2XQCAxQAnDJ/ST24VexOZvd9LFFbHXA+
	WqM9Q+QC0S4T6kzxN1IFC/j1yTuWbKF5e63IireY8rmsK6ouAXVZs0BT014qoyVCH5Pjtbs7MiX
	duWg4PhnU36sQqr6eucSYNzGXzerpgYh2kXz0KilC+9Buwa4PaF0uzDfBBsOOeQBZjGBD4xyliN
	gW167wmAMr1Na9CJhMzrxoTJY1wsRyu2IxYMYAM9JsGFQkJOqXohxowPiHXUZKqbXSLW2ouBBJP
	rKbzmlcIQ3CRyui
X-Received: by 2002:a05:6512:6c4:b0:5a8:6f01:e1a0 with SMTP id 2adb3069b0e04-5aa81edc1c6mr4375e87.3.1780519333830;
        Wed, 03 Jun 2026 13:42:13 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b907269sm837408e87.34.2026.06.03.13.42.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 13:42:13 -0700 (PDT)
Message-ID: <6e962010-8097-4b52-9369-0727c0d5a31a@linaro.org>
Date: Wed, 3 Jun 2026 23:42:12 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Bryan O'Donoghue <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260523-x1e-csi2-phy-v8-0-a85668459521@linaro.org>
 <20260523-x1e-csi2-phy-v8-2-a85668459521@linaro.org>
 <54904b61-222d-4600-ad4c-c03a9952d337@linaro.org>
 <be3e1abe-5148-4247-930b-2e23164eea73@linaro.org>
 <c6aetoiz3dcedlxwjmt5cqh2mngswtmanf6p4s2molemnviwdc@btotpaqwcsoy>
 <f6c91099-0002-4580-a5e8-5611b089024b@linaro.org>
 <v4vz7cistjb2iuzha4oykglar7duw4y2uuyhumzs33yvpwrxcu@i5tsg4uzpuwc>
 <8eb709ce-3469-4303-9c3d-8d1a221cb8de@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <8eb709ce-3469-4303-9c3d-8d1a221cb8de@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111047-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:bryan.odonoghue@linaro.org,m:dmitry.baryshkov@oss.qualcomm.com,m:vkoul@kernel.org,m:kishon@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neil.armstrong@linaro.org,m:bod@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,linaro.org:mid,linaro.org:from_mime,linaro.org:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9A2C463B2AC

On 6/3/26 15:57, Bryan O'Donoghue wrote:
> On 03/06/2026 13:40, Dmitry Baryshkov wrote:
>>> Are you sure about that ?
>> Yes.
>>
>>> ipcat I thought designated lane 7 specifically as clk-lane i.e. named it
>>> CLK_LN of some description.
>> Split configurations explicitly use other lanes for clocks. E.g. check
>> the RB5 Navigation schematics, CAM0B connector.
> 
> Can you please check:
> 
> CSI_3PHASE_COMMON.CSI_COMMON_CTRL5
> 
> 0 LN0_PWRDN_B Lane 0
> ...
> 7 LNCK_PWRDN_B Clock Lane

Please note that media devices have a numeration scheme of lanes starting
from 1 (it'd be easy to check/confirm it), for instance today CAMSS has
lane numeration starting from 0 is out of the accepted scheme, and here
it'd be better to correct it and not enter the same pit.

I don't have access to the IP spec, anyway I do not grasp it, where are
8 lanes on the CSIPHY found? Each CSIPHY IP has 4+1 D-PHY lanes, not 8.

> 
> ... just a badly name field
> 
> CSI_2PHASE_CTRL10
> 
> Bit[2] = IS_CLKLANE
> 
> Right so CSI_2PHASE_CTRL10 controls lane mode, indeed. Thanks for checking.
> 

-- 
Best wishes,
Vladimir

