Return-Path: <linux-arm-msm+bounces-104898-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wOjCAm1n8GkITAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104898-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 09:53:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A720747F50E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 09:53:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A7F7C301A8C7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 07:52:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C1092EBBA4;
	Tue, 28 Apr 2026 07:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eoCIMMKy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCAAC2E719B
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 07:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777362742; cv=none; b=Egx2BD2iPm0NLpRjj4vTcPSERtcWg9CjnwxIZN8Qa83IU3VBtc1TSCHQgMLv0l1lXUaQ60EBfFuTkEb7P/hxwcSP4619b+t+o3CWwxALXMPtydndbTZnGj+kTYdE2mQnlw075umU/mv1Rdmrpnpp8RiJRyzgaG/BFZ9Es5/BnO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777362742; c=relaxed/simple;
	bh=+7A9hGMrCf5qj6wp/qYnO4QPp5VlOkW3o6k4/MWiEsk=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ftfJprk5m6rJ+OtHceK58Wgh5Kdl6XHzTuXybKDrx0iOyKgDeJb2AmLxlSo5iRMyWoVVZxuuGPuimNt9hXP3U9/uQXKKzhmK/VOi22O8/qeFgDlkxpkj0oOQ5HjOQNMJ/rb+OXqx3/qmqfoBqz3qMEAhjRTajXZfA+Rfs4Y4G00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eoCIMMKy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5B43C2BD01
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 07:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777362742;
	bh=+7A9hGMrCf5qj6wp/qYnO4QPp5VlOkW3o6k4/MWiEsk=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=eoCIMMKyYiSuRzdor/l71p2rAcsfpB1EMt2reKfrgJ37j66rMJrcHhumrZfx0cX9w
	 9daLWO4AojV60ZG0IjWFR+RpTaHOa620GJEG9R3HNc6NFS1KCLVSFLNWZvFXrwmxLL
	 Xxc5TZ4dv0HFeiO+Mpi5KADFwCz2RVuyVe35A+kPcMydsmj8NByQomBljV5WX+ddIh
	 Ep+r/wCH5NbNfs+I8YUEcYe/utYM0cF9p/7NToAXjvkrZTfe5wEydHPYFrab0P1EMt
	 EeYIlXo/lT6mYPxOstcplZg32cduJrX+1ZZvVI8t61SVylhJzMJ2JkE2tdPmq4hPdz
	 8buYBICbFrAvg==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5a40b2d268bso9019636e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 00:52:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/DyvYiofq7pO7Y2tITaWKz8vlsavbWuW+huyeEgWyneCIWFPrNUkoK97IzbTftn5AIMaK0f8vIPEIk+/Qg@vger.kernel.org
X-Gm-Message-State: AOJu0YxeObnuqgbgR8uPy+nXP5/yXG7kjGmDIuyd8vfrBfIdo7EtyxOF
	VCBEuny6zIIcwGan1lt1tOApQiBjKOx8TH3jXb27LxgJhjIYb0QwJSm5MbJO7b3iAFGryLD83tG
	rQeTuV3WMkwevHJGAvYKUDlAa/+DKV1HZCCtyLYM4IQ==
X-Received: by 2002:a05:6512:398c:b0:5a4:1145:ce6b with SMTP id
 2adb3069b0e04-5a746610247mr877281e87.28.1777362741261; Tue, 28 Apr 2026
 00:52:21 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 28 Apr 2026 00:52:18 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 28 Apr 2026 00:52:18 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260427-arm-psci-system_reset2-vendor-reboots-v21-6-dcf937775e73@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427-arm-psci-system_reset2-vendor-reboots-v21-0-dcf937775e73@oss.qualcomm.com>
 <20260427-arm-psci-system_reset2-vendor-reboots-v21-6-dcf937775e73@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 00:52:18 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mc-1CbmdkcpK+GO42zA91JD1bn4uty2Q67LCfdWZSjd6w@mail.gmail.com>
X-Gm-Features: AVHnY4IAeEz9DOJDqUcpSkV3z45GTKftIgb7vtFP5IquBk4MzrXKdkX87mZcNa0
Message-ID: <CAMRc=Mc-1CbmdkcpK+GO42zA91JD1bn4uty2Q67LCfdWZSjd6w@mail.gmail.com>
Subject: Re: [PATCH v21 06/13] dt-bindings: arm: Document reboot mode magic
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, Andre Draszik <andre.draszik@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>, 
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
X-Rspamd-Queue-Id: A720747F50E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104898-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,broadcom.com,kernel.org,oss.qualcomm.com,linaro.org,linuxfoundation.org,arm.com,arndb.de,rock-chips.com,gmail.com,ettus.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[35];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]

On Mon, 27 Apr 2026 19:34:46 +0200, Shivendra Pratap
<shivendra.pratap@oss.qualcomm.com> said:
> Add bindings to describe vendor-specific reboot modes. Values here
> correspond to valid parameters to vendor-specific reset types in PSCI
> SYSTEM_RESET2 call.
>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

