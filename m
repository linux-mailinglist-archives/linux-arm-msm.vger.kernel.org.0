Return-Path: <linux-arm-msm+bounces-101828-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yNrcKjKr0WlUMQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101828-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Apr 2026 02:22:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F9D339CF24
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Apr 2026 02:22:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2EE673011592
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Apr 2026 00:21:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2ADC219A7A;
	Sun,  5 Apr 2026 00:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OMMg/Bb/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D7E923EA80
	for <linux-arm-msm@vger.kernel.org>; Sun,  5 Apr 2026 00:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775348516; cv=none; b=ZM65BxF292n36ZSAq8fRdQYs9MtE9IcieOCuZTdj3zU5uWJv5VWkMXAAQhgsDk//0Gix8VKQJaRmkIuXhbWBZsYyUijh8bjTZ1K9ofKsHYlI0Hpeqt11M9lfDmzqZ46ihulZdeQVzkM4dZu+2W0dFAVwCpnqYvSeJ+St5sk2LRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775348516; c=relaxed/simple;
	bh=tqWs+zzx709MgWZt3PmvYlKpoqqid78J2QNdrEuuRig=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NcrXKedppO7hexEaVvjSf5aRmgvPSHETOmKqcC/+w0cZegmIU25wjLu3iX/mzMPGVdIM/37HdTWFbK0fUpnJSNxQ6mV8fgqi31YC4rB+z6efLBZZ4V5JPwZMxtr2j21Rtcyriq0OTmAzNRivSiJCCFpUjXYeRjtIVGbIETnUXjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OMMg/Bb/; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-483487335c2so29379795e9.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 04 Apr 2026 17:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775348512; x=1775953312; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/bPmswsl0ZEMtXy2tMsgQsJ71tmyi4kiw2oOvZ6aYTA=;
        b=OMMg/Bb/Lwv/ZtLsRo4wcxuEpVNGKc5KTTL3DmJmxTr8IXVRrn0l6YLvJkBqeWtVSQ
         2ce0IMabicu2A4jPi0q6qNsb44MN1E5zLOs5TuOx83dmqie0/xWLHx3bme4CLmKALhDN
         CUKf98HnWAU3NmtM7GMP0LL/5oX3vs2dA2GFFNABIWLHsmHKw8qCQNo5SdlfwJnlFxzN
         1wDwhNwMmlDu5yeliyWzq8HFK+LU3J1TgvYZHoaP4Fon9cCEZwvplcfynv/q7zAjCtmI
         d+sqNPCi71Ao89IX0RTlZVzX7Qdecydv3ggiUEoAnOlaXqK/6O20JNH5N5xKO84txYej
         9JMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775348512; x=1775953312;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/bPmswsl0ZEMtXy2tMsgQsJ71tmyi4kiw2oOvZ6aYTA=;
        b=Fzx/P3chmVL3Xwnl/HP8MDWtqLfzwk6qb+oawnmTDcSaiIrrCpuooMYGH4vwo3P7//
         jJw6NjIp9YdRmgIZ0r96870KSJ41BNMAGCJZB+DZE2EDZPUr2O6MD3ogm4X6gzqojBUY
         0m3nwFdOkNgoPGci3GkbbjBapI0lE0UsjqhYw+BZ2Wp7H/Nl5qXoKlhe8Dx1wlf1/ejN
         +jraBqOP8oXJEw7LcMs1/hyJayyN+r6YAGfr4Yp5yvk89XDqdiX6oeMlKEu4AD1wsu/L
         VWUyJlkD4kA31dLxP3ZJws7+gMKc6pCOa0VvnVTfBXfkLbhXNjNj7saJ8ruhedy0bVTQ
         e2Rg==
X-Gm-Message-State: AOJu0Yzh4AVfd+1aI1QPweqozfNu+X3Z31WMDRGrL7pueFf9ZATMXh9j
	zomErc0u1lO0FkzthO2COKaDjwtVlzSBtfACbRQlaJO80bGcjp8J3lHLglgesY10IY0=
X-Gm-Gg: AeBDietcRcmcaqFpAvxXjAaipeU3dmPm5bj/s+jKF/qTAT/A5MhuAmdA0oo3n2ddp1W
	HfMYDxtCMv4C1bfNmPMCx6pXGrXHl0UZPU762v9dFQvvOoxx6H9hwdItpaB6l5nHRPVMLuUaeuv
	zobqMNyHlmm+paa8tVYbiaWX+TlltFxPhl3EEFi8uhEA/sjS6DIUGe1V1p7EF+lp5kkXcy5JkS0
	PNLu0mMa94VWEYKH4RNdEpe5dtXdKCx3D9aQ11tpMfvwB001lidomo+q3QvqIlOY+qE56a+Ggif
	0HGXkeXNDVo+5GCcRIOWfHj+Y+pTdS99Xj3vexb/XnZF+XNkok0zQn6BvWxzIrOOc9Zj68D6F7O
	uJSXmuYAuoepBGV/Sr54I4rXtUQoswSNwAGWqxYdFWvUm2Uqcmi8GeHV0sTE0N7A5aPTofRBcT6
	sbMSsXapTJp2OK1PFlV6pibh1R8ClqMsw3sNrXpNg3BxLa8g==
X-Received: by 2002:a05:6000:2482:b0:43b:851c:4483 with SMTP id ffacd0b85a97d-43d29276b96mr11673051f8f.4.1775348512511;
        Sat, 04 Apr 2026 17:21:52 -0700 (PDT)
Received: from [192.168.0.35] ([109.77.125.194])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4e221bsm26296263f8f.29.2026.04.04.17.21.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Apr 2026 17:21:51 -0700 (PDT)
Message-ID: <b5a7063b-23f6-4b9f-a427-b82a6afad353@linaro.org>
Date: Sun, 5 Apr 2026 01:21:49 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: x1e80100-dell-xps13-9345:
 introduce EC
To: Aleksandrs Vinarskis <alex@vinarskis.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 laurentiu.tudor1@dell.com, Abel Vesa <abel.vesa@oss.qualcomm.com>,
 Tobias Heider <tobias.heider@canonical.com>, Val Packett <val@packett.cool>
References: <20260404-dell-xps-9345-ec-v2-0-c977c3caa81f@vinarskis.com>
 <20260404-dell-xps-9345-ec-v2-4-c977c3caa81f@vinarskis.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20260404-dell-xps-9345-ec-v2-4-c977c3caa81f@vinarskis.com>
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
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101828-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,14c:email,linaro.org:dkim,linaro.org:mid]
X-Rspamd-Queue-Id: 0F9D339CF24
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 04/04/2026 13:55, Aleksandrs Vinarskis wrote:
> +		io-channel-names = "sys_therm0",
> +				   "sys_therm1",
> +				   "sys_therm2",
> +				   "sys_therm3",
> +				   "sys_therm4",
> +				   "sys_therm5",
> +				   "sys_therm6";

io-channels-names = "lpddr5x-therm", "charger-left-therm", 
"charger-right-therm", "ssd-therm", "keyboard-therm"

> +	};
>   };
>   
>   &i2c7 {
> @@ -1025,6 +1050,64 @@ rtmr0_1p8_reg_en: rtmr0-1p8-reg-en-state {
>   	};
>   };
>   
> +&pmk8550_vadc {
> +	/* Around DRAM */
> +	channel@14c {
> +		reg = <PM8350_ADC7_GPIO3_100K_PU(1)>;
> +		qcom,hw-settle-time = <200>;
> +		qcom,ratiometric;
> +		label = "sys_therm0";

You might as well use the same name for the label "lpddr5-therm"

> +	};

On thena the list is:

- "OPT temp"
- "CPU VR"
- "GPU VR"
- "Charging-1"
- "Charging-2"
- "WLAN"
- "WLAN (EE)"

So I think both the source and the sink should describe and be allowed 
to describe what it is io-channel-names = "fixed list" is too restrictive.

Much more useful to userspace to see a string "lpddr5-therm" than 
"sys_therm0".

---
bod

