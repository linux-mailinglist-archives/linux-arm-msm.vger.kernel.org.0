Return-Path: <linux-arm-msm+bounces-104897-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eCYHGc1o8GkITAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104897-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 09:59:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E693747F704
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 09:59:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 55A1930938EA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 07:52:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED41B2EDD69;
	Tue, 28 Apr 2026 07:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nJ5bcMez"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD3A12ED84A
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 07:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777362729; cv=none; b=YzuTiuvyqyOg/oaGeALXRwETjZxwGidlaAmdmHrtxDMXdn08/fKLPtJtkz0toC9E6SM953fRE2m5Uddz0TvvcM6+hbnajVBtm6S9DGP/IY36bq3n5EaxxDkZ9FZFsPrvLYZkfMehjqmo6mgOnZckqYV49vKoz/f5lFrEioNODRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777362729; c=relaxed/simple;
	bh=vO5iuPARPBHlJ6G8aiSTUn1sOPHT2OcXMvj14NtRS+E=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jUALeECfSfDJPxJXftCMeqnyMmY/tSJ2qTpAZlGt0UFGGfE8XZaNGYZYlgums8hp493vaOf1aSKrBRftP0TcyATexMuyFx4kCDjXZR02mSbm4WDjWmdBKlY3K7G7YGFhHraVYmbZjnOhPGk1zrazlCALKIbu27V/SuKakaDiBAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nJ5bcMez; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CEC5C4AF14
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 07:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777362729;
	bh=vO5iuPARPBHlJ6G8aiSTUn1sOPHT2OcXMvj14NtRS+E=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=nJ5bcMezxpRhVdnOQ1ZIzVJCCAs4mT1gXO2e/96+wx00hBqqGbqF8oHUyKDqraJYn
	 uq9ZhihNeBjaI6arIcL6+iUSHyL8+M0R/WUAeeIwHfKk09lmDK8P7nmNERcU8ulC2Q
	 bLvO52Nr1jQ5vVbsN24WJPHMU4Cp4P7JlWmtirbNnIhjYHL4dQVpLHeCKYaAbLf/ou
	 lzJ9Yn1JZ5o23PNm1PoxKeTkCgHHdfowJjk4vCqqLyihUlO5e6usyu9hqkaCxYP0ze
	 EPtXO9l8q2W1U+PZ9yTwjkJWN0v2IgEWQrkaITQpXEOlI5OgDvbVy8YHJReIv6pg+o
	 LFlvlqjd8peKA==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5a2c7427ad9so10778405e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 00:52:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+bsnMSLGJPkrJps/jvCFD6ctNb3gxkPqzI4dDxgmcIepBvwCS2N7hHShDgQfXCxyqugBMrzjUYkrvGcCkW@vger.kernel.org
X-Gm-Message-State: AOJu0YzBACGnhTy7uXfWxmz4wT89mE4JEgVAadMI4mPa7Ld+YtovPckB
	pjtZM6GkJLUU0IWFBMKKjJY/RFusvnspotpxrOQ29RV//gFBhgW9wnvOA/8/7/ruS0n+x/1kgMK
	iSYkM7mjgEqw85cfNmbGFM9MUWJ5Bv5BX/qbYO6PPPg==
X-Received: by 2002:a05:6512:33c9:b0:5a2:a355:aa4e with SMTP id
 2adb3069b0e04-5a74662a809mr744576e87.31.1777362727843; Tue, 28 Apr 2026
 00:52:07 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 28 Apr 2026 00:52:05 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 28 Apr 2026 00:52:05 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260427-arm-psci-system_reset2-vendor-reboots-v21-5-dcf937775e73@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427-arm-psci-system_reset2-vendor-reboots-v21-0-dcf937775e73@oss.qualcomm.com>
 <20260427-arm-psci-system_reset2-vendor-reboots-v21-5-dcf937775e73@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 00:52:05 -0700
X-Gmail-Original-Message-ID: <CAMRc=MezLiWcFvY2Qr35p0k8DU1kwo40HmLnuYqCQz848m5ZBQ@mail.gmail.com>
X-Gm-Features: AVHnY4I9O30DLFnNY2LxEIaLNfI7TLSIX2zIHmZ9_yxAyEIE-ruCmhEnjgWZz0I
Message-ID: <CAMRc=MezLiWcFvY2Qr35p0k8DU1kwo40HmLnuYqCQz848m5ZBQ@mail.gmail.com>
Subject: Re: [PATCH v21 05/13] mfd: psci-mfd: Add PSCI MFD driver for
 cpuidle-psci-domain cell
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
X-Rspamd-Queue-Id: E693747F704
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
	TAGGED_FROM(0.00)[bounces-104897-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,broadcom.com,kernel.org,oss.qualcomm.com,linaro.org,linuxfoundation.org,arm.com,arndb.de,rock-chips.com,gmail.com,ettus.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
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

On Mon, 27 Apr 2026 19:34:45 +0200, Shivendra Pratap
<shivendra.pratap@oss.qualcomm.com> said:
> PSCI has multiple kernel consumers, such as cpuidle-psci-domain.
> Currently, both the PSCI core driver and cpuidle-psci-domain bind
> directly to the same PSCI node "arm,psci-1.0". Additional consumers, if
> introduced, would also need to bind in the same way, leading to several
> drivers attached to a single device node.
>
> Introduce a PSCI MFD driver that binds to "arm,psci-1.0" and registers
> PSCI child cells. As the first user, register cpuidle-psci-domain as a
> child cell.
>
> Update cpuidle-psci-domain to probe as an MFD child and use the parent
> PSCI node for power-domain traversal.
>
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>

Shamelessly taking credit for the idea. :) Looks short and sweet LGTM.

Suggested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

