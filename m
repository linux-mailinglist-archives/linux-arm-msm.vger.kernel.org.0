Return-Path: <linux-arm-msm+bounces-117643-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EFXHHxVTTmr0KgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117643-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 15:39:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A364726DE8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 15:39:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=V0dRptaz;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117643-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117643-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 338483020D35
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 13:39:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C55F37FF54;
	Wed,  8 Jul 2026 13:39:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F3937E307
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 13:39:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783517958; cv=none; b=U+ofrI0Mg7ViWDlAo5gwMdfoSOorc9IVhdMuSWzuGBTKiGIOSKz+r+3Anwi/NOfcqFcJB3yStTjaJPmom+aHekQ3nCucFWHvqUknext8iZHnerkxhhkJKpuwHAavk6BR/8ev2lAiSMfl9MGPKmcrVzxfiMFhQdJHmte5O6828qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783517958; c=relaxed/simple;
	bh=+wIyjNFCLq0HAVw6zdrhSIPqyF0LnbfBlJxSeKI/uoI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZLWVavDUTCT+SlNfHl79KOAi2JK4rzFYHQIQocmkAU+bNCsEispKUFZsxuu3eLOgHuv1DjVU52GCetcWHZsRNCvV9o2+L4at/VUknvOcPjtscDV+io4oPHGDsQZQh29idYtT3PB9FowMJyx6Jm1BBMV7d6kwFtnPA1AlqvnmEzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V0dRptaz; arc=none smtp.client-ip=209.85.128.42
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-490cf3000f0so4857415e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 06:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783517953; x=1784122753; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0ZLjRhxRDh9WQwquBHiNYeqR/5bcBu8OKvSo1Ykywm0=;
        b=V0dRptazFuOW3zX2z3iyTJam5Fz/6J0sM8Ul7G8I/wO+un8mIfAdbHY+voUeEllQVu
         Lv3zi9A8aupLSr+ts23MTAY0wqm5s8vKk45Rv+UPtGV/xOlt/dOV2zKqYobOaqdsype+
         vLLUsPxCq3YJPnlHQkL0wzdEy4gmAptFbcA907GwTee62rEsIYdtS8ZZ7Kio51VQwpwY
         tlycHTm7jBcNPYflav6iCoZOO9wynRK9CRCs8f7mEadSolEHj5xGsAzxP09FeQpkDooA
         T5YgJCvsowLd37KVCSdl0sXEfCW6QOoFtV7zDhsKIgOh+foRfQ33AF/DMXTYOuAtWQ2r
         1GLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783517953; x=1784122753;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0ZLjRhxRDh9WQwquBHiNYeqR/5bcBu8OKvSo1Ykywm0=;
        b=YjaeXgVaS5sbcgHv3Rw0/sKnpJfXc2OU7oLnTtZaRZ2p/NjTkNk4B/iCL81HoypnXv
         voNUUeYOe5DnYtwEuS4je9bEEB9qJqASCb8L4pNhe7I6D6Qh3x3AllcUPqJYDsZOuPlD
         /RyBwpCpd+g3NucRTwowUSSwkvTf5HwrnkYO5h/wpRoSSeXdhlSDSzybuXUbgMRCqchW
         MtSUwf7QoWlksehW6ifN52slMm0j/+zSh/uNI8fZZm+u65YkXhGlzq5umkg/4Eh2ZSIl
         3InJBPtOVuZP/POnbTE6DQq3qm02rrbhsUOe/MuqKSN4MsVhni2mYS63N6nhq8/q8c98
         Ty4w==
X-Forwarded-Encrypted: i=1; AHgh+RqKVNOeKQS1OL4842XtAu8FgScM29h+58VZH73t7ETCbunkk0bFWepO81Wgt/soiQ5biH2rNORYSnyM2HzS@vger.kernel.org
X-Gm-Message-State: AOJu0YwYwTZgaJ2UbyQ14SW9dZX5GUEnZPTXiiRU4k383huibJz6cVG9
	yo5oWxBla/0QEgigNDswULjTxctBFifnx1BOt7kK2m3RjNqfnt+LCIuo1X34NAGH1Kw=
X-Gm-Gg: AfdE7ckIACcezERH52ZrtQCARPYruLzz1TtCgRhH8wBrz6X2xB2CIz5lMuStKUIy6Vj
	jybFuVQH2oSY9IdfOjLyTAvsY74VAULonIXH/Ok0MrJnTPANw8/BbnS0SJjfltDDHOuj1kLc7Jt
	5dovf3f1fubZhOPc2gD8KaHUopnpmYXxM5cVyzE6D2qWLrMVs0omhdm7thqm5ZIpcSLDXmmvJ4m
	NlKTuVfCyYmmM14+jYeA2e4cYRd3zo+DuMUNN6aKpVDpv0uSgH/2MXpNswjhLF/DF8ziucseE5l
	rpTcw3jpEemRg7KCQZyDUrF1A4OU3ki/1Ax0XCoq6A2CSwnNUJzJ/UTYr2l07azFxUekPkHmTeO
	SFo9MVsOMLRdw+66Xcl7Z/pTK8gCjHkJCWj1pzquQOPe2wj6O5STzzh0iM1QWKCZqF4TUDdPlBu
	dbJ7Qw462cUkpfkGi1p6P4TDuWju+spGbVWqk=
X-Received: by 2002:a05:600c:a44:b0:493:c35c:b4d1 with SMTP id 5b1f17b1804b1-493e6898b47mr29032615e9.7.1783517953057;
        Wed, 08 Jul 2026 06:39:13 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff24:7210:28ff:335b:63e2:fdd2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e5a58853sm48716645e9.1.2026.07.08.06.39.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 06:39:12 -0700 (PDT)
Date: Wed, 8 Jul 2026 15:39:00 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: sre@kernel.org, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
	linux@roeck-us.net, andersson@kernel.org, konradybcio@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	neil.armstrong@linaro.org, gaurav.kohli@oss.qualcomm.com,
	manaf.pallikunhi@oss.qualcomm.com, priyansh.jain@oss.qualcomm.com
Subject: Re: [PATCH v6 0/3] Lenovo ThinkPad T14s EC thermal monitoring and
 thermal zone integration
Message-ID: <ak5S9D85t6g3Nhfq@linaro.org>
References: <20260707192228.14647-1-daniel.lezcano@oss.qualcomm.com>
 <ak48gsxhVW492C7H@linaro.org>
 <76b55f79-010d-46a8-a7c6-a47d18ce2143@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <76b55f79-010d-46a8-a7c6-a47d18ce2143@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117643-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:daniel.lezcano@oss.qualcomm.com,m:sre@kernel.org,m:hansg@kernel.org,m:ilpo.jarvinen@linux.intel.com,m:linux@roeck-us.net,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:bryan.odonoghue@linaro.org,m:platform-driver-x86@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-hwmon@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:neil.armstrong@linaro.org,m:gaurav.kohli@oss.qualcomm.com,m:manaf.pallikunhi@oss.qualcomm.com,m:priyansh.jain@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[stephan.gerhold@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stephan.gerhold@linaro.org,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1A364726DE8

On Wed, Jul 08, 2026 at 03:16:20PM +0200, Daniel Lezcano wrote:
> On 7/8/26 14:03, Stephan Gerhold wrote:
> > On Tue, Jul 07, 2026 at 09:22:25PM +0200, Daniel Lezcano wrote:
> > > This series extends the Lenovo ThinkPad T14s embedded controller driver
> > > with environmental monitoring capabilities and integrates the exposed
> > > sensors into the Linux thermal framework.
> > > 
> > > The EC provides access to several platform temperature sensors
> > > covering the SoC, keyboard area, bottom cover, charging circuitry, QTM
> > > module and SSD. These sensors are currently used by the firmware for
> > > thermal management but are not exposed to Linux.
> > > 
> > > The first patch adds hwmon support for the EC temperature sensors.
> > > 
> > > The second patch exposes the EC as a thermal sensor provider in the
> > > device tree and defines thermal zones for the keyboard skin
> > > temperature and the charging circuitry temperature. This allows the
> > > generic thermal framework to react to EC-reported temperatures and
> > > apply standard Linux thermal mitigation policies.
> > > 
> > > As the EC protocol is not fully decoded, the passive trip points
> > > get/set actions are missing, so it is not possible to program a
> > > threshold and receive an interrupt when crossed the way up or
> > > down. Consequently, the thermal zone related to the charging circuitry
> > > is polled every two seconds until we can set the trip points in the
> > > EC.
> > > 
> > > This series fixes critical thermal issues happening on this platform
> > > where a kernel compilation, or heavy workloads, lead to a system
> > > reboot.
> > > 
> > 
> > Thanks for working on this! I have a few comments/questions about this:
> 
> Thanks for jumping in the discussion
> 
> > 1. EC vs PMIC temperature sensors
> > 
> > AFAIK, the T14s (and actually most X1E laptops) have two sets of
> > thermistors in each location: One is connected to the PMIC (called
> > SYS_THERMx), and the other set is connected to the EC.
> 
> From the schematics I have in my possession, the SYS_THERMx are connected to
> the EC, at least this is how they are named. May be it is the other set with
> different numbers.
> 
> I'm curious to know why this mirroring ?
> 

AFAICT the SYS_THERMx thermistors all go to the PMC838C PMIC on the
T14s. The EC thermistors are on a separate page, search for "RT8203" for
example.

I'm not sure why this mirroring exists, but even QC's Hamoa/X1E CRD has
that. IIRC it is not always there though, the Purwa/X1P CRD has the
sensors only connected to the EC (maybe for some minor cost savings?).

I believe on some devices the OS (Windows/Linux) even needs to send
temperatures (e.g. CPU/GPU temperature) to the EC for it to work
correctly. Not sure if the T14s needs/uses that though. I was mostly
looking at the CRD thermal setup a year ago...

> > The SYS_THERMx sensors connected to the PMIC have been enabled for the
> > T14s already over a year ago [1]. The reason this is not upstream is
> > that we now been waiting 3 years for the corresponding ADC/thermal code
> > to land upstream [2]. It seems pretty close now, the ADC part has landed
> > and there is only the thermal part left [3].
> 
> Right, I have to pick this one.
> 
> > The PMIC thermistor setup is likely going to be similar for most X1E
> > laptops, so I think it would be preferable to use that instead of the EC
> > sensors to implement additional temperature throttling. It also supports
> > interrupts/trip points already, so it doesn't need polling.
> 
> I definitively second that
> 
> > The most recent proposed patch actually adds the SYS_THERMx thermal
> > zones to all X1E-based devices [4], although I'm not sure if it would be
> > better to keep that device-specific...
> > 
> > [1]: https://github.com/stephan-gh/linux/commit/c0ddc9fa96667d6b32d690ce6a3dcfc76aaabad6
> > [2]: https://lore.kernel.org/linux-arm-msm/20230708072835.3035398-1-quic_jprakash@quicinc.com/
> > [3]: https://lore.kernel.org/linux-arm-msm/20260705-gen3_adc_tm-v3-0-ac62f387dbce@oss.qualcomm.com/
> > [4]: https://lore.kernel.org/linux-arm-msm/20260614-adc5_gen3_dt-v2-4-32ec576c5865@oss.qualcomm.com/
> > 
> > 2. EC sensor mapping vs PMIC sensor mapping
> > 
> > In PATCH 2/3 you define:
> > 
> > 	{ .label = "soc",	.reg = T14S_EC_SYS_THERM0 },
> > 	{ .label = "keyboard",	.reg = T14S_EC_SYS_THERM1 },
> > 	{ .label = "base",	.reg = T14S_EC_SYS_THERM2 },
> > 	{ .label = "charging",	.reg = T14S_EC_SYS_THERM3 },
> > 	{ .label = "qtm",	.reg = T14S_EC_SYS_THERM6 },
> > 	{ .label = "ssd",	.reg = T14S_EC_SYS_THERM7 },
> > 
> > I'm not sure if this is correct. When comparing this with the data read
> > from the sensors connected to the PMIC:
> > 
> > | Sensor          | PMIC Channel | EC (hwmon)   | PMIC (thermal)  | Delta    |
> > |-----------------|--------------|--------------|-----------------|----------|
> > | SOC             | SYS_THERM0   | 79.0°C       | 78.7°C          | +0.3°C   |
> > | Keyboard        | SYS_THERM1   | 68.0°C       | 70.1°C          | -2.1°C   |
> > | Base / Back     | SYS_THERM2   | 66.0°C       | 64.6°C          | +1.4°C   |
> > | Charging        | SYS_THERM3   | 73.0°C       | 73.8°C          | -0.8°C   |
> > | West / QTM      | SYS_THERM6   | 64.0°C       | 62.6°C          | +1.4°C   |
> > | SSD             | SYS_THERM7   | 31.0°C       | 67.1°C          | -36.1°C  |
> > | Modem           | SYS_THERM4   | N/A          | 31.6°C          | N/A      |
> > | East            | SYS_THERM5   | N/A          | 70.3°C          | N/A      |
> > 
> > The SSD delta of 36°C is definitely suspicious. I think
> > "ssd"/T14S_EC_SYS_THERM7 in your EC driver patch is actually the modem
> > sensor (SYS_THERM4).
> 
> Yes probably, it was unclear from the documentation. I may have mixed some
> info.
> 
> The SoC sensor seems to be hotter than the Charging sensor. I'm a bit
> surprised because I've always seen charging hotter than the rest.
> 

I captured the above while actively stressing the CPU, so presumably the
SoC was heating up more quickly than the charging in that situation.
Just a few minutes earlier it was like this in idle state with charging
indeed warmer than SoC:

| Sensor          | EC (hwmon)   | PMIC (thermal)  | Delta    |
|-----------------|--------------|-----------------|----------|
| SOC             | 35.0°C       | 35.8°C          | -0.8°C   |
| Keyboard        | 32.0°C       | 33.0°C          | -1.0°C   |
| Base / Back     | 33.0°C       | 31.9°C          | +1.1°C   |
| Charging        | 37.0°C       | 38.2°C          | -1.2°C   |
| West / QTM      | 31.0°C       | 35.7°C          | -4.7°C   |
| SSD             | 25.0°C       | 34.0°C          | -9.0°C   |
| Modem           | N/A          | 26.2°C          | N/A      |
| East            | N/A          | 33.1°C          | N/A      |

> 
> > If you look at a picture of the T14s mainboard
> > (https://www.notebookcheck.net/fileadmin/_processed_/d/c/csm_DSC_0003_aadae1ddd2.jpg)
> > and zoom in to the unpopulated modem sub-board left to the fan you can
> > see the two thermistors RT601 and RT301. The SSD on the other hand sits
> > almost directly next to the SoC on the right, so I wouldn't expect it to
> > stay > 30°C cooler than its surroundings.
> > 
> > However, there are also two thermistors next to the SSD, see e.g. this
> > close-up picture of the mainboard:
> > https://download.lenovo.com/Images/Parts/5B21P83385/5B21P83385_A.jpg
> > This means that the SSD is probably one of the other mappings. If the
> > thermistors are consecutively numbered in the EC firmware, the SSD
> > (RT8203) might be actually the third sensor ("base"/T14S_EC_SYS_THERM2).
> > I'm not sure how to figure out the proper mapping.
> > 
> > The back of the mainboard is completely covered with tape
> > (https://download.lenovo.com/Images/Parts/5B21P83377/5B21P83377_B.jpg)
> > so it's impossible to see anything there.
> > 
> > 3. Active vs passive throttling
> > 
> > Are you matching the Windows cooling/throttling setup here? If not, have
> > you considered how this interacts with the fan control applied by the
> > EC? I'm a bit worried that this might lead to unexpected performance
> > regressions if we start throttling before the EC runs the fan at full
> > speed.
> 
> For the moment, I would say fixing the critical issue is the highest
> priority. With the 'charging' sensor with a 55°C trip point, AFAICT the fan
> is at full speed before this trip is reached.

Agreed.

I'm not sure about the fan speed, I never checked properly but my gut
feeling is that the fan runs faster in Windows and never runs full speed
in Linux. (Are there fan profiles maybe? Not sure. Maybe I'm imagining
it. :-))

> 
> Then we may want to take control of the fan and add active trip and passive
> trip.
> 
> This autonomous EC / PMIC mix sounds a bit strange to me :/
> 

Right, it's all quite complicated. :/ Ideally, we would be able to
figure out the exact thresholds for the fan control in the EC firmware,
so that we can set the throttling temperature to be shortly above that..

Thanks,
Stephan

