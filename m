Return-Path: <linux-arm-msm+bounces-109136-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id BFtJMphHD2r5IgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109136-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 19:57:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 656375AAAD7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 19:57:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BED843003825
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 17:57:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A67E3E5587;
	Thu, 21 May 2026 17:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p/xgWpQH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77659368D65
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 17:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779386260; cv=none; b=IPgttl7NLpqHGwsuxCZxwltFhGrhKNN09MOeF8MlDeUBDagHCFXkFQAnQvr0o83W8+EUbIyHo2x5MY+QzJGOCG/yUwe06FUZlDe8vfYQVdPuFlUuvLL1AxJ6XVDXE1sWKXlmPrGD8Ki7XI0RRhCDjtta6y4fug1fl1h1l2BznD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779386260; c=relaxed/simple;
	bh=xFmemDVgnr2azGMiC2daYpx3i+eCsGeDZTwp9hgqNlE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CgHXzj6IbrsjTa+1bwXomC92S8h/xkA3vRqJ9pIxYCXzCcz7of0+yx2qNFI7MZ34KGYRmQGulX55XndXTDPJyUjXiAVB288bxR465OVsPiGRpU/BwED8knLiZWsgxijjHKZWHaGIMN7XWJq3VR/ntd5T5h9Qjn3g5r7bURGbC6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p/xgWpQH; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48896199cbaso50390985e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 10:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779386258; x=1779991058; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gylbKCiCuocOK7umlWhz6aOgovCb2toi5YR+NyOexAY=;
        b=p/xgWpQHIJmFyFhjT/gSY+ScGe80MOkbw3CwlxtQVBRenMRqSLSzHDVgO9bVkf7FYq
         VmePIE8JtD8wrj4909vUt4jHw7s52XM4/U1Kp7CEXD6DzVHzYGyLeqFc3O8dX/JaD6Dl
         oyUIdrnsgHtGxOraMc9A5cFRA6bajygSdIX7gdjUeFD/a5kB45TTArT7aQuxrmq6TBVW
         vYjZGGgmhzR3YMkahF0kzf5du/PvTwOFqf/H/gZ7VIAOMlFkVd4ZcTFMl+lPtiosql3X
         yZbjgQgmK1mfVPL+LoRTzO5N94ivQrsq/q5/wNuRYOZXMHG7fFEUFnY3WexDbLqLN4gd
         a+FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779386258; x=1779991058;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gylbKCiCuocOK7umlWhz6aOgovCb2toi5YR+NyOexAY=;
        b=ldSexOC82uJAVdSh+qXLliZ4ffFN0XRXnl0xRIJ/0W/b7uYLXqfknced5W/RJsSc5+
         wx4lIzI/hKMkOYTPuv/fy3zHD8YQ0hggIhsfHrNUrZGuvqK8d8KiQ7xhKtWAfj1vi4x6
         Z89IBoJuuVrF/vp0r2CJUIcK+Viql6FaU87TZVYexTwd69iGwbJLvUid+lDiSLiAPeEb
         Mfavr11y5Lxbn4GNfjV++UKWv5rw4WZ5sZys4Qv2+WncvCVbTVHDLI2UYbA4PY/ocXvC
         nacUrtXLvy1fl4ac3Nm3E0GTDFaUQCh2X2JLzY2N8vyvlpGPx/piIDeY52nODw3dXHA2
         MxoA==
X-Forwarded-Encrypted: i=1; AFNElJ90ouMwb6XuYCTfxCvprLOOFEk+u3O376my0CbiV0LnJEP0bEq8IlEFUeUAmoKjq62vGGlgArJ8sAtUg/7F@vger.kernel.org
X-Gm-Message-State: AOJu0YzX4IuxC3WGmKLn7WheX3UqcNn7hz9WzOFRE1mszbRTRXxAvCfa
	NqNzh89BxcY3sxIxftctGjDBJjkr3Y3Gu0oDOgvCIxlT7K3uTUwwZ3c=
X-Gm-Gg: Acq92OEtWkdKqtkw0cPV01tNjNHCCLtcsmcDV9UUG6kzq2hJwRgv79fSi0JwgNA2x44
	yGfbUB08B0PBjGfQvPulAMIRxOSIW/LoV+6cskqupcHG5FssoDYq65LuhJz30LNXiPZCnnSuPFw
	0RnsLu5fQFEcgh5ETsZqPzZW0QyOE+JFm/NW96XMn/V5inkYC7OHnm+oMK1pCc9YYGJdLW6FTFp
	KG1gimG4P6XSqhxdLAu47i79+3Ky93v9LuO0QU/dZJC1EMcpvICJ+kGzaABG4yPpoCC6/x35Pdn
	Dm2g6zZptIJF/txBy2CijRVxQmhiQ0LCE/R6l8BwmFaVGvC9rPjRnC9MNsizL2Q89FOYNiOkz7V
	7qoyzR+FRL5xU/pwnPP5sMSbnrAYs5rRuyrLHIF4OBHuzK9HpEY2a2QxtvCDKWSy+SdXd1SYoev
	2ej83yqoX7tA3nnThTiq+ecOvQulgYKtA74jjZuj1zKZ079o6EH+k/pwds33OzISFxyhANGLdf+
	9yrJv64D7MPdX6uRrGYBayyzQ77FiUi4rXShsrFe8uzZkBnv8NDLjVyOJBCTZc3e2O+tA==
X-Received: by 2002:a05:600c:c084:b0:489:1a3a:9e45 with SMTP id 5b1f17b1804b1-490360d2970mr47342025e9.26.1779386257641;
        Thu, 21 May 2026 10:57:37 -0700 (PDT)
Received: from ?IPV6:2a01:cb08:52d:7400:bbd7:ca83:de4a:f625? (2a01cb08052d7400bbd7ca83de4af625.ipv6.abo.wanadoo.fr. [2a01:cb08:52d:7400:bbd7:ca83:de4a:f625])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49033dab0besm74323395e9.15.2026.05.21.10.57.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 10:57:37 -0700 (PDT)
Message-ID: <9eddfa15-ec2e-4d3c-8d55-2be5a974866f@gmail.com>
Date: Thu, 21 May 2026 19:57:36 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/11] arm64: dts: qcom: sc8280xp-arcata: Enable backlight
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Douglas Anderson <dianders@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>
References: <20260520-surface-sp9-5g-for-next-v1-0-9df52552bf87@gmail.com>
 <20260520-surface-sp9-5g-for-next-v1-2-9df52552bf87@gmail.com>
 <f5f70aa2-a1b8-40e0-838f-6709e6e08a5a@gmail.com>
 <624a780c-0b22-45e3-aec5-e61c319de901@oss.qualcomm.com>
Content-Language: en-US
From: =?UTF-8?Q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>
In-Reply-To: <624a780c-0b22-45e3-aec5-e61c319de901@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.01 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MIXED_CHARSET(0.67)[subject];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109136-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,chromium.org,linaro.org,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[jeromedebretagne@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 656375AAAD7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/21/26 10:48, Konrad Dybcio wrote:
> On 5/21/26 12:26 AM, Jérôme de Bretagne wrote:
>> On 5/20/26 18:40, Jérôme de Bretagne via B4 Relay wrote:
>>> From: Jérôme de Bretagne <jerome.debretagne@gmail.com>
>>>
>>> Add backlight nodes and enable backlight so that it can be controlled
>>> with the corresponding buttons found on Surface Pro Type Cover keyboards.
>>>
>>> The nodes are almost identical to the ones from the ThinkPad X13s with
>>> a different enable GPIO for the vreg_edp_bl node.
>>>
>>> The difference was found by looking at the output of /sys/kernel/debug/gpio
>>> on the ThinkPad X13s to see the properties of its enable gpio9:
> 
> [...]
> 
>> and ... backlight still works! It can also be enabled/disabled with:
>>    /sys/class/backlight/backlight/bl_power
>> as expected.
>>
>> I have no clue why both gpio6 on pmc8280_2 and gpio6 on pmc8280c can enable and disable the backlight. Is it a common scenario?
> 
> Could it be that one of them is an ENABLE_BL pin, while the other one
> enables the regulator?
> 
> Konrad

I've looked at more device trees and seen that quite a few of them
simply don't have a "power-supply = <&vreg_edp_bl>" property in their
backlight node. Trying a similar approach, the backlight still works
so the gpio6 I was adding wasn't used (or even useful).

I will send a simpler patch in v2, removing the power-supply property
and the vreg_edp_bl & edp_bl_reg_en nodes.

Jérôme


