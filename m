Return-Path: <linux-arm-msm+bounces-119242-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rPTICjt9V2qySQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119242-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 14:29:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6BB75E21E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 14:29:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=QloyeeZA;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119242-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119242-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 96005309C05F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 12:28:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92485477E20;
	Wed, 15 Jul 2026 12:27:56 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40FE246AEF2
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 12:27:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784118476; cv=none; b=PCO/aRVMSKVHrXQI12ZEDPjyKpdJ+ghj5eGGBY5s5OmfiQxld6uRyUK5lEzhYKuSOZ+vT2775IaKxRFYfl7f3BUEoIhYq34MPdNjNOqszAcZZ87QSuTvsgUqWVnU1XrLUT8mT02U+pR3M+mQHrGgvufJA5TE/L/5uFHl80SgTpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784118476; c=relaxed/simple;
	bh=FyvVJli3cTKUMPT5HpsOpQIxQvLLkFu+nSooG+r5XBo=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XQkEdH4y1URrfOPwa84zRo0U/qIS2vMvGkQG5ypcXNU25EVySzdIvlwb46zgjiBFfzyY5LgJNUG/UfLFGHwqO2Cdg4s1zhKNP91XVQIVYcNwn/CHhcaauNbitIA2LEzKE7EJSIJ8vS4k2n/plQqN7XTe5Z1OkJlpTB72s6b3aM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QloyeeZA; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDAFC1F00A3A
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 12:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784118475;
	bh=j28hcJjQkZPaS3yZ4782JQxyz8Zd4wPyi3h2uE2kkXA=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=QloyeeZA+L0U0Nakkwr/lWVJ2epmV8vXIHzwlA6j94fp0HUd+UPMioZEIUHbjDN8W
	 iKIdi3aCx+rXYWbmwTIh1ICFS6PFQssNjQAquhZJqFjg0wA+njAN4N57PbyX7F9jNB
	 WUXt06OccYpYq0vonrNCnwKy5yOELeoBdgAtUg/Q36E0h9C2Ls8aJLO14r7o82lxGp
	 /FiDjbu1eD3n4ltGunskB6hppF21R6j9g5Zujnk0NI6TvUJOrZ4jy2IsFX0nUWRTwf
	 qsO7X2nTHn4u7dgR8dLHesPpOA7XOin9U5dPJEmjhmViRqSGvWZNPtZNbaLKb5KvK4
	 fP5r1UYPLKo9w==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5aeba09900bso1530531e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 05:27:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rp6q38dDqQfmnF8XFofySQfgioCHidURriumg4dRNQB92UZ3zYLZGcexSGgQB97K+FTMXEWtbS3KKw8bC5Q@vger.kernel.org
X-Gm-Message-State: AOJu0YxT8kTvIIqd1pEHMoV6cUHLXRnv19vuEGZvo18zToOtc0xs/jb0
	4ZSRKSAOidCDxYAhEViMfDFyPpK//BmhaIDcxXzUO3KxD1iuWl54/UMy03X52T1JZChVkSk4mB/
	X+bjPYn2zj+i7aGgXf9ghbrqIo+30BPt6frz23L2PGg==
X-Received: by 2002:a05:6512:250f:b0:5b1:544e:7185 with SMTP id
 2adb3069b0e04-5b1544e721amr2489500e87.40.1784118473678; Wed, 15 Jul 2026
 05:27:53 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 15 Jul 2026 05:27:51 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 15 Jul 2026 05:27:51 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260714-arm-psci-system_reset2-vendor-reboots-v23-0-e7453c548c21@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714-arm-psci-system_reset2-vendor-reboots-v23-0-e7453c548c21@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 05:27:51 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mc4e1Rso5Vr1ZoRTkAp4WYUz8H-dQWUjkyBg5sgXiDLOw@mail.gmail.com>
X-Gm-Features: AUfX_mxYq9w3t7suoGM2tbsXEv1g058iRFyDqupc6ScLWcGXZxK2WeoKHlbXNCk
Message-ID: <CAMRc=Mc4e1Rso5Vr1ZoRTkAp4WYUz8H-dQWUjkyBg5sgXiDLOw@mail.gmail.com>
Subject: Re: [PATCH v23 00/13] Implement PSCI reboot mode driver for PSCI resets
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, Andre Draszik <andre.draszik@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>, mfd@lists.linux.dev, 
	Srinivas Kandagatla <srini@kernel.org>, Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Song Xue <quic_songxue@quicinc.com>, 
	Sebastian Reichel <sre@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Christian Loehle <christian.loehle@arm.com>, 
	Ulf Hansson <ulfh@kernel.org>, Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Souvik Chakravarty <Souvik.Chakravarty@arm.com>, 
	Andy Yan <andy.yan@rock-chips.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	John Stultz <john.stultz@linaro.org>, Moritz Fischer <moritz.fischer@ettus.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Sudeep Holla <sudeep.holla@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-119242-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:shivendra.pratap@oss.qualcomm.com,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:florian.fainelli@broadcom.com,m:krzk@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:mukesh.ojha@oss.qualcomm.com,m:andre.draszik@linaro.org,m:gregkh@linuxfoundation.org,m:kathiravan.thirumoorthy@oss.qualcomm.com,m:mfd@lists.linux.dev,m:srini@kernel.org,m:sebastian.reichel@collabora.com,m:bartosz.golaszewski@oss.qualcomm.com,m:quic_songxue@quicinc.com,m:sre@kernel.org,m:mark.rutland@arm.com,m:lpieralisi@kernel.org,m:rafael@kernel.org,m:daniel.lezcano@kernel.org,m:christian.loehle@arm.com,m:ulfh@kernel.org,m:lee@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:arnd@arndb.de,m:Souvik.Chakravarty@arm.com,m:andy.yan@rock-chips.com,m:matthias.bgg@gmail.com,m:john.stultz@linaro.org,m:moritz.fischer@e
 ttus.com,m:brgl@kernel.org,m:sudeep.holla@kernel.org,m:conor@kernel.org,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[172.105.105.114:from];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[39];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,broadcom.com,kernel.org,oss.qualcomm.com,linaro.org,linuxfoundation.org,lists.linux.dev,collabora.com,quicinc.com,arm.com,arndb.de,rock-chips.com,gmail.com,ettus.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	DWL_DNSWL_BLOCKED(0.00)[kernel.org:dkim];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[100.90.174.1:received];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9C6BB75E21E
X-Rspamd-Action: no action

On Tue, 14 Jul 2026 19:16:28 +0200, Shivendra Pratap
<shivendra.pratap@oss.qualcomm.com> said:
> Userspace should be able to initiate device reboots using the various
> PSCI SYSTEM_RESET and SYSTEM_RESET2 types defined by PSCI spec. This
> patch series introduces psci-reboot-mode driver that will induce
> command-based resets to psci driver for executing the device reset.
>
> The PSCI system reset calls takes two arguments: reset_type and cookie.
> It defines predefined reset types, such as warm and cold reset, and
> vendor-specific reset types which are SoC vendor specific. To support
> these requirements, the reboot-mode framework is enhanced in two key
> ways:
> 1. 64-bit magic support: Extend reboot-mode to handle two 32-bit
> arguments (reset_type and cookie) by encoding them into a single 64-bit
> magic value.
> 2. Predefined modes: Add support for predefined reboot modes in the
> framework.
>
> With these enhancements, the patch series enables:
>  - Arch Warm reset and system reset cold as predefined reboot modes.
>  - Vendor-specific resets, configurable via the SoC-specific device tree.
>
> Together, these changes allow userspace to trigger all above PSCI resets
> from userspace.
>
> Note on introducing PSCI-MFD:
> In v19/20, psci-reboot-mode was implemented as a faux-device. Review
> discussion suggested this may not be the best model for firmware-backed
> consumers, and that representing PSCI users as regular platform devices
> would be better. One suggestion was to add a PSCI-MFD driver, allowing
> multiple consumers tied to a single PSCI node "arm,psci-1.0" be probed
> as MFD cells.
>
> Following this, the series adds a PSCI-MFD driver and introduces
> cpuidle-psci-domain and psci-reboot-mode as child cells. To meet the
> psci-reboot-mode requirement, the MFD core is extended to support
> fwnode.
> Reference discussions on this:
> https://lore.kernel.org/all/20260306-faux-dev-with-fwnode-v1-1-792a86a62530@oss.qualcomm.com/
>
> ---
> The patch is tested on rb3Gen2, lemans-ride, lemans-evk, monaco-ride,
> qcs615-ride.
>
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>
> Changes in v23:
> mfd: core: Add firmware-node support to MFD cells
>  - Add named_fwnode-based firmware node support in MFD cells.(by Bart)
>  - Update the release path. (by Bart)
>  - Add checks for duplicate fwnodes.
>  - Update documentation for usage and limitations.
> mfd: psci-mfd: Add psci-reboot-mode child cell
>  - Update for a named_fwnode-based reboot-mode child cell. (By Bart)
>  - Split psci-reboot-mode and psci-cpuidle-domain into separate child
>    cells.
> power: reset: Add psci-reboot-mode driver
>  - Add COMPILE_TEST in Kconfig. (by Bart)
>  - Update to support up to three u32 arguments to accommodate a
>    32-bit reset_type and a 64-bit cookie. (By Sashiko, Lorenzo)
> dt-bindings: arm: Document reboot mode magic
>  - Update to support up to three u32 arguments to accommodate a
>    32-bit reset_type and a 64-bit cookie.
>  - Dropped reviewed by from Bart and Rob due to considerable changes.
> firmware: psci: Introduce command-based resets
>  - Update to support a 64-bit cookie. (By Sashiko, Lorenzo)
>  - Update the flow so unsupported reset commands and any failures during
>    reset command execution fall back to the
>    Linux reboot_mode path. (By Sashiko)
> power: reset: reboot-mode: Add support for predefined reboot modes
>  - Handle errors and free lists in devm_reboot_mode_register(). (by Sashiko)
>  - Update to support up to three u32 arguments.
> power: reset: reboot-mode: Support up to 3 magic values per mode
>  - Patch for 64 bit magic renamed.
>  - Update to support up to three u32 arguments to accommodate a 32-bit
>    reset_type and a 64-bit cookie.
>  - Dropped reviewed by from Bart and Sebastian due to considerable changes.
> - Link to v22: https://lore.kernel.org/r/20260514-arm-psci-system_reset2-vendor-reboots-v22-0-28a5bde07483@oss.qualcomm.com
>

Just wanted to say: thanks for being persistent, we'll get there eventually. :)

Bart

