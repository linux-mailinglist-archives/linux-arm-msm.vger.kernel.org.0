Return-Path: <linux-arm-msm+bounces-110308-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sOMbD9yxGWrJyQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110308-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 17:33:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F911604CDE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 17:33:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 59A4E30B1334
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 15:17:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D98DF35C197;
	Fri, 29 May 2026 15:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="E/Y8OmFz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7572331AA8F;
	Fri, 29 May 2026 15:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780067869; cv=none; b=CMES3MSNZ6S6aGpctuuU8OxUOnphy2aB98jZOWqFN2MBpY6pp5XhULgF25AadOMb9KuuApmNu5wuotDEqzdHA8xN4+FlFysZmKYQh9G68cQzikx1ML34yayxcHhI1GAVyJ/8i5rE1my1QS+Aj7dWgIyVJc87Y+jVsQY4ZOkPzmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780067869; c=relaxed/simple;
	bh=i14utAyWVag4qxanxiMOSsLoacp5PlK9awjdPrY0Lt0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j0qPFaQadhbQ52HzB562wD6EykeqIsPmj0O2alnTMUjh+8PeGUoyGM6c63endgTdIOt+49f6kTZjeI0LN48q7OZB3DVhNOSAx/BGHkeZupxquGg0kco2IsQKcVaw4pduNLGxLtHNJb3pqvpu9VtudNmtzSS7A1h1OWujVirC3io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=E/Y8OmFz; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D29DD1C00;
	Fri, 29 May 2026 08:17:41 -0700 (PDT)
Received: from [10.57.26.238] (unknown [10.57.26.238])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8093B3F632;
	Fri, 29 May 2026 08:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780067866; bh=i14utAyWVag4qxanxiMOSsLoacp5PlK9awjdPrY0Lt0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=E/Y8OmFzjPPiFlVn4wlpigbZpVnBOLe/nvmQB9aWj85QNMT7/qwPvsbPCBXgoTSUY
	 ILoZRm/Zx+YVmLnnnjl6SbY9FgvOkUu3spSzSN72QzgqEzBR85lxu8q43Fz/aKK1vx
	 t17fO/GqqvBY0+f/5OA/Bl8CQBWaofzEEz9yntmI=
Message-ID: <c99085e5-cf1f-479d-bef0-b6a4161482e5@arm.com>
Date: Fri, 29 May 2026 16:17:33 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/10] thermal/of: Rename the
 devm_thermal_of_cooling_device_register() function
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>, rafael@kernel.org,
 daniel.lezcano@kernel.org
Cc: Zhang Rui <rui.zhang@intel.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Guenter Roeck <linux@roeck-us.net>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Benson Leung <bleung@chromium.org>, =?UTF-8?Q?Pali_Roh=C3=A1r?=
 <pali@kernel.org>, Avi Fishman <avifishman70@gmail.com>,
 Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>,
 Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
 Benjamin Fair <benjaminfair@google.com>, Heiko Stuebner <heiko@sntech.de>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Amit Daniel Kachhap <amit.kachhap@gmail.com>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Amit Kucheria
 <amitk@kernel.org>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Thierry Reding <thierry.reding@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 "Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>,
 "moderated list:ARM/NUVOTON NPCM ARCHITECTURE" <openbmc@lists.ozlabs.org>,
 "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
 "open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>,
 "open list:KHADAS MCU MFD DRIVER" <linux-amlogic@lists.infradead.org>,
 "open list:CLANG/LLVM BUILD SUPPORT" <llvm@lists.linux.dev>
References: <20260526140802.1059293-12-daniel.lezcano@oss.qualcomm.com>
 <20260526140802.1059293-18-daniel.lezcano@oss.qualcomm.com>
Content-Language: en-US
From: Lukasz Luba <lukasz.luba@arm.com>
In-Reply-To: <20260526140802.1059293-18-daniel.lezcano@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[intel.com,kernel.org,pengutronix.de,armlinux.org.uk,gmail.com,ffwll.ch,roeck-us.net,jms.id.au,codeconstruct.com.au,weissschuh.net,chromium.org,google.com,sntech.de,nvidia.com,linaro.org,vger.kernel.org,lists.infradead.org,lists.ozlabs.org,lists.linux.dev];
	DKIM_TRACE(0.00)[arm.com:+];
	TAGGED_FROM(0.00)[bounces-110308-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lukasz.luba@arm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_GT_50(0.00)[54];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,etnaviv,lkml];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,arm.com:mid,arm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 3F911604CDE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/26/26 15:08, Daniel Lezcano wrote:
> To clarify that the function operates on child nodes, rename:
> 
>            devm_thermal_of_cooling_device_register()
> 	                     |
> 			     v
>         devm_thermal_of_child_cooling_device_register()
> 
> Used the command:
> 
>       	 find . -type f -name '*.[ch]' -exec \
> 	 sed -i 's/devm_thermal_of_cooling_device_register/\
> 	 devm_thermal_of_child_cooling_device_register/g' {} \;
> 
> Did not used clang-format-diff because it does not indent correctly
> and checkpatch complained. Manually reindented to make checkpatch
> happy
> 
> This prepares for upcoming support of cooling devices identified by
> an ID rather than device tree child nodes.
> 
> No functional change.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> ---
>   drivers/hwmon/amc6821.c                  |  2 +-
>   drivers/hwmon/aspeed-pwm-tacho.c         |  5 +++--
>   drivers/hwmon/emc2305.c                  |  6 +++---
>   drivers/hwmon/gpio-fan.c                 |  6 ++++--
>   drivers/hwmon/max6650.c                  |  6 +++---
>   drivers/hwmon/npcm750-pwm-fan.c          |  6 ++++--
>   drivers/hwmon/pwm-fan.c                  |  5 +++--
>   drivers/hwmon/qnap-mcu-hwmon.c           |  6 +++---
>   drivers/hwmon/tc654.c                    |  5 +++--
>   drivers/memory/tegra/tegra210-emc-core.c |  4 ++--
>   drivers/soc/qcom/qcom_aoss.c             |  2 +-
>   drivers/thermal/khadas_mcu_fan.c         |  7 ++++---
>   drivers/thermal/tegra/soctherm.c         |  6 +++---
>   drivers/thermal/thermal_of.c             | 15 +++++++++------
>   include/linux/thermal.h                  | 16 ++++++++--------
>   15 files changed, 54 insertions(+), 43 deletions(-)
> 

Reviewed-by: Lukasz Luba <lukasz.luba@arm.com>


