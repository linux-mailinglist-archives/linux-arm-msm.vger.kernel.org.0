Return-Path: <linux-arm-msm+bounces-119249-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hRT7IVuHV2pcWQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119249-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 15:12:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4A275E865
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 15:12:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="UTM3Ff/X";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119249-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119249-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0E3E53010223
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 13:10:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C90942049A;
	Wed, 15 Jul 2026 13:10:24 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF86184524
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 13:10:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784121024; cv=none; b=ZqpjNZqVpfgPsUDNLBH6/rYy4Pl3RQKEE7eWL9gfZtP7VG5ZyYR86MpHXTJb8MHbHNFQooI//R1FHG/PIrQik1DmsTIba+CJgu/dT4jLBT7NB9h+9GKkM1wxh/Vbpa2lmA9o2C5WDEpbTGP5KAlWHqFMcflv1fG9lwSwcV9pE5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784121024; c=relaxed/simple;
	bh=HDpvp8vnAzoZQLx8FKACNiz9sLgSiXd+woO3izJE9Kg=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ejalf/pT5g+kOCzocUNTSped/F6Wun8s7LgdquW5LnBs/0UNUiiuHqQ+XC8o1taD6PyhJcdoN4tRh5w76c1OrEio3mqx1cGxptfyZbvSWa121JJi+8c9FDgX3KptvdZN5z2fhU2NCMgqJSXnAHl1eK0vYQlgywxA5UYflovOoX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UTM3Ff/X; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C757D1F00A3F
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 13:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784121022;
	bh=HDpvp8vnAzoZQLx8FKACNiz9sLgSiXd+woO3izJE9Kg=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=UTM3Ff/Xjfkc1w+y5Rc4E23kuZYtpT6J1qO39PbniNPQT1veAV/ch628jHHSoAc+H
	 UAoDbTsRGXLa40jN8Ur3skgvbIyziZGBxBvtZskuUwvhFYFFXK5HyAHrr+SoNyZbip
	 XEK9Yzh2X3pFzSek30zbJ8Ugq9u+8valytG86OO4Vbx3sUQRPBA491ZdgXcjcJ7Bmi
	 GEW31/+w7OC71rjSKOeMsvcT8Vpr50p9xQ9XyxGRHFOkv7F8umSXWPbwmI0AXXjJrF
	 aYNMEWXtCkwv1R+47Cxs+T/mjcGLt9Kp5EeHocbT2uzWtPwhNrl00Cqu7lKkr5gOLO
	 /Ghz4UbdRekfA==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-39c95395230so17039291fa.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 06:10:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqQ31TmbxdVINwHQqpZBoyDJCOyKSlmsfv0Wp/K4f+OY2uiKMhsmWVa7llxfdrw6LuvfdPJkITi1Bh9+daO@vger.kernel.org
X-Gm-Message-State: AOJu0Ywv8D4pzwY5+czipSLIR4pXpVKiBT03fKLoGDTXwvxN/YmD/0WE
	MgOvhUKpmXxwpJRdLVKT2K/5JvyJ+mC+WZQlE/W+Ayc+oNklouHtR3CgSFA+IUBi7zj28e/awOU
	Qbc1H3st/bhC/KnCGXhu9qVGZg9mwWBnzBtE4hbyfVQ==
X-Received: by 2002:a2e:a994:0:b0:39c:650c:454e with SMTP id
 38308e7fff4ca-39caa80368dmr38788201fa.13.1784121021501; Wed, 15 Jul 2026
 06:10:21 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 15 Jul 2026 13:10:18 +0000
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 15 Jul 2026 13:10:18 +0000
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260714-arm-psci-system_reset2-vendor-reboots-v23-7-e7453c548c21@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714-arm-psci-system_reset2-vendor-reboots-v23-0-e7453c548c21@oss.qualcomm.com>
 <20260714-arm-psci-system_reset2-vendor-reboots-v23-7-e7453c548c21@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 13:10:18 +0000
X-Gmail-Original-Message-ID: <CAMRc=MdBC98zwc3jQwXgxMTEp_yBvjtU9cNQeRaTSsbZody3Zg@mail.gmail.com>
X-Gm-Features: AUfX_mwKvQxfwhOc8sChG6IUYiOddNnheWaj2Ma61SgPXzcEOXNcrLK8YSHAqsk
Message-ID: <CAMRc=MdBC98zwc3jQwXgxMTEp_yBvjtU9cNQeRaTSsbZody3Zg@mail.gmail.com>
Subject: Re: [PATCH v23 07/13] power: reset: Add psci-reboot-mode driver
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, Andre Draszik <andre.draszik@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>, mfd@lists.linux.dev, 
	Srinivas Kandagatla <srini@kernel.org>, Sebastian Reichel <sre@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[36];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-119249-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:shivendra.pratap@oss.qualcomm.com,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:florian.fainelli@broadcom.com,m:krzk@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:mukesh.ojha@oss.qualcomm.com,m:andre.draszik@linaro.org,m:gregkh@linuxfoundation.org,m:kathiravan.thirumoorthy@oss.qualcomm.com,m:mfd@lists.linux.dev,m:srini@kernel.org,m:sre@kernel.org,m:mark.rutland@arm.com,m:lpieralisi@kernel.org,m:rafael@kernel.org,m:daniel.lezcano@kernel.org,m:christian.loehle@arm.com,m:ulfh@kernel.org,m:lee@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:arnd@arndb.de,m:Souvik.Chakravarty@arm.com,m:andy.yan@rock-chips.com,m:matthias.bgg@gmail.com,m:john.stultz@linaro.org,m:moritz.fischer@ettus.com,m:brgl@kernel.org,m:sudeep.holla@kernel.org,m:conor@kernel.org,m:matthiasbgg@gmail.com,s:li
 sts@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,broadcom.com,kernel.org,oss.qualcomm.com,linaro.org,linuxfoundation.org,lists.linux.dev,arm.com,arndb.de,rock-chips.com,gmail.com,ettus.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid,vger.kernel.org:from_smtp,qualcomm.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6C4A275E865
X-Rspamd-Action: no action

On Tue, 14 Jul 2026 19:16:35 +0200, Shivendra Pratap
<shivendra.pratap@oss.qualcomm.com> said:
> PSCI supports different types of resets like SYSTEM_RESET, SYSTEM_RESET2
> ARCH WARM reset and SYSTEM_RESET2 vendor-specific resets. Currently
> there is no common driver that handles all supported psci resets at one
> place. Additionally, there is no common mechanism to issue the supported
> psci resets from userspace.
>
> Add a psci-reboot-mode driver, and define two types of PSCI resets,
> predefined-resets and vendor-specific resets. Predefined-resets are
> defined by psci driver and vendor-specific resets are defined by SoC
> vendors, under the psci:reboot-mode node of SoC device tree.
>
> Register the driver with the reboot-mode framework to interface these
> resets to userspace. When userspace initiates a supported command, pass
> the reset arguments to the PSCI driver to enable command-based reset.
>
> This change allows userspace to issue supported PSCI reset commands
> using the standard reboot system calls while enabling SoC vendors to
> define their specific resets for PSCI.
>
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

