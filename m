Return-Path: <linux-arm-msm+bounces-104903-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oLEgC3Vr8GkITAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104903-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 10:10:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DF89547FA87
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 10:10:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0F60E30697D6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 08:04:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C8CA33859C;
	Tue, 28 Apr 2026 08:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YfFCV9k+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBCD933557D
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 08:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777363444; cv=none; b=KpX0wVfhAq5a7oEMuusSK7KIF3Ol4j29FeDLbKQavkf0ZGALog7Pj4MmyW1WHSvmLTeqsE8sBNnD5YeREOwsKiLjd/KH3zbbQ+3l7NaThvTvnBy3HCV1WtJw+RU9RVZJ7oWhJZb8cwLKcU/4Ofectedo1JlOus7Sh2/qdWoXUJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777363444; c=relaxed/simple;
	bh=IoirFoe03mX/ctRgHP5OpPVgaiIaPeHRPHwGzkpjrfs=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ITL7uX0WWWpmEIjx+7moXwR2khhCCdaEYutX2pTZpndzxAvs7UrPtFspOIFg2RW/vAvWGR2ITQL28a/bsF8cOOerWL1/QJCN/f9l9Eg2YBTqnkbMxqu4M8QMLcBlORMaJOxEY7irfzbBH0Quho5e5yf/6msS9rhOTa0HGGLRURY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YfFCV9k+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4587C4AF0C
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 08:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777363443;
	bh=IoirFoe03mX/ctRgHP5OpPVgaiIaPeHRPHwGzkpjrfs=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=YfFCV9k+BZYhWnN0htmAA7TEblQEBIOZMmkKLT9ppkoHP+EPaAHnRPo/usK+MnIDz
	 lKQ5X+bLGt5Ktn7rSdCg9HYrEBnuxq+38G00QcQZQqPSAfg3R1l7duUFV19f3S5WLU
	 6X1Lqe01mhvmvMgdK/uHRP3K1iP4rIMIvW8lc+3V1vWSqIDgluBehZ54fKgIjqDRAC
	 +gM4bSE+MTT5LXzGQ8F0TdNcfeatwIRde4vcgwPt9PRKC7OEAq00WFqvVdXEQxzgft
	 eplmJI8bhZRIDW3WHqfXy/KcHZvMnwvH9nzaiOiGfXC/xYDpwOSOPp19xPAOLOPCzC
	 hpPaYYQhQwxeA==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-38a01c80c34so108470301fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 01:04:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8/urIdrm8xDh4b/wmTap60krXhXsa75Zju/ehvvR2cakK7BGHUJEsdLWZ2O7v20s5pO/hG5MhyzowYMmyq@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8FIMVxQrWlx+hEmNVnhqEajzsU55i0aDOMVf0xNmo8d4x7yJ2
	bvVMcHTgVwS46e6H3kpp1uJ5ccsd9kA0rxCFHEBfxgEugLs4Vt4hUstEfrg1jhZQ9h3lfFWsnlX
	WLBO3Cds0+Za4VLjA3mAOUPFOlFRwO8EtPOQLQ1xuug==
X-Received: by 2002:a05:6512:3b11:b0:5a2:b903:3b43 with SMTP id
 2adb3069b0e04-5a74660485amr881966e87.7.1777363442347; Tue, 28 Apr 2026
 01:04:02 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 28 Apr 2026 01:04:01 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 28 Apr 2026 01:04:01 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260427-arm-psci-system_reset2-vendor-reboots-v21-11-dcf937775e73@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427-arm-psci-system_reset2-vendor-reboots-v21-0-dcf937775e73@oss.qualcomm.com>
 <20260427-arm-psci-system_reset2-vendor-reboots-v21-11-dcf937775e73@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 01:04:01 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mc0mjrzLv9qi87nr4TAW_LYn_Ndut=H8WfJPZeSZd6+TA@mail.gmail.com>
X-Gm-Features: AVHnY4LZVg57jPaWekGSSk4DejeTI2gwQWeR0zCi-FpgzjFW0MFsND6PRyA_w6Y
Message-ID: <CAMRc=Mc0mjrzLv9qi87nr4TAW_LYn_Ndut=H8WfJPZeSZd6+TA@mail.gmail.com>
Subject: Re: [PATCH v21 11/13] arm64: dts: qcom: Add psci reboot-modes for
 lemans boards
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
X-Rspamd-Queue-Id: DF89547FA87
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104903-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,broadcom.com,kernel.org,oss.qualcomm.com,linaro.org,linuxfoundation.org,arm.com,arndb.de,rock-chips.com,gmail.com,ettus.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]

On Mon, 27 Apr 2026 19:34:51 +0200, Shivendra Pratap
<shivendra.pratap@oss.qualcomm.com> said:
> Add PSCI SYSTEM_RESET2 reboot-modes for lemans-evk and
> lemans-ride-common(sa8775p-ride, sa8775p-ride-r3, qcs9100-ride,
> qcs9100-ride-r3) for use by the psci-reboot-mode driver.
>
> The following modes are defined:
> - bootloader: reboot into fastboot mode for fastboot flashing.
> - edl: reboot into emergency download mode for image loading via
>   the Firehose protocol.
>
> Support for these modes is firmware dependent.
>
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

