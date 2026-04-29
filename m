Return-Path: <linux-arm-msm+bounces-105176-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0NH1F9/V8Wm3kgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105176-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 11:56:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EE365492678
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 11:56:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 58C41304409E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 09:51:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 995FD3B6368;
	Wed, 29 Apr 2026 09:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LcBn0mGB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73ABE39183C
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 09:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777456272; cv=none; b=lf0cIE5aeIkaFaPml73DStMQhx9nH63UDd69aEEKNYq9szRr5H5r9ymq5MiRBrZ10cVeJmwUkDLuFLT3zX7YJqDCQeRaFI11znyPyOVHyUZQ+DdYeWicrq6+yqZT66V3T9IVyv4z2UCatGhXs30Nkx4HmEQn+nEW8GxPyo2XUMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777456272; c=relaxed/simple;
	bh=xl75P3m2W4e1+CXN4v9hPNik1UQ7Md24Me8vwhtUHnI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TKI+97DqOJszImttWjMHxQGex2WSxsnYSDC5k7ivfZtPlaEspDcJQ6UWkZLiGML7ZduTA0H30vxZAzAlDcekWAuAKBlpwzHaS510X3ZxkiCNRKVmRNrMnGZY0Qkc1Ra/LDc6iF/4IdzdJXHa0paPdU5rlStMILU6JqBl8PFeZF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LcBn0mGB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56AFFC2BCF7
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 09:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777456272;
	bh=xl75P3m2W4e1+CXN4v9hPNik1UQ7Md24Me8vwhtUHnI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LcBn0mGB0AkVtEMj9jrv7LeAZPOb3o0WVtpCkcA8YUUpgqqu5YaW9cwe45jw6Hn9v
	 XRP0G7QuQXX04Mc35yvP0Q0Ux6AiN9av9IopvzVFxea0Zfb+Gobi71lWWZctzlxdda
	 c+QC7QK4PZH3/R0QZUWe9QuFu9ldriWdkXDG2kXFHOFjSt+WaypYdUH0gRKSknIhLw
	 o7ENkA/O+28yy8X5aMZlLDh+RUEdepHYi67UC5vQyGVKBdozKFEdAO+qYPXNGgXiv8
	 KSHtcbP8ufBNwfHhyUT9Oj2yrr5x5dpQA2fBuqqR9yUA/hplpa3siZWAbrXSgu1jTu
	 8uidrtuT1gzvg==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3922b35e69cso33303761fa.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 02:51:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9O2nukZMlRRfYCAdVrdCmjSjvpalKL0ofuBPfyODXtA0uM3Du7Hm3rJoTwtErz1oCzRf6IvVd0N85wp5Te@vger.kernel.org
X-Gm-Message-State: AOJu0YywcoaunuX3LGiSRljX8yWE4d2B+mGwZkILUf+Ni4cAPBFF0VG+
	UiSiGIN7GDZNYUJtpjIH8uMSkqoAVuHqz+I0mpIIrKw0VCaVuzK1IwqhJQiz/2uus7LvQS14JR9
	D22IFyMRXm2ut+uvgxWGadqBWKeoX9P3zzHcKOrT9Wg==
X-Received: by 2002:a05:6512:15a4:b0:5a2:c0d8:e634 with SMTP id
 2adb3069b0e04-5a746409fc9mr3018093e87.8.1777456270423; Wed, 29 Apr 2026
 02:51:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427-arm-psci-system_reset2-vendor-reboots-v21-0-dcf937775e73@oss.qualcomm.com>
 <20260427-arm-psci-system_reset2-vendor-reboots-v21-8-dcf937775e73@oss.qualcomm.com>
 <CAMRc=Mf+-04Zr7jjRoaxTzO3LKSMyQ7DzxJc=dHNSyThEUiq_Q@mail.gmail.com>
 <c0677503-8073-4940-8eb0-c06b34f843d2@oss.qualcomm.com> <CAMRc=MdxpSXiqAn-8Az4ig4N8TFVdE9psacPVG9J9KehuFnbwA@mail.gmail.com>
 <d6112b9c-01ea-483c-98fe-b480e78872e5@oss.qualcomm.com> <ce92a493-5016-41a2-8337-d2227cdf760a@oss.qualcomm.com>
In-Reply-To: <ce92a493-5016-41a2-8337-d2227cdf760a@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Wed, 29 Apr 2026 11:50:58 +0200
X-Gmail-Original-Message-ID: <CAMRc=Md_OON4cAGcJ=jDu=VY_mw0qa8HPz4VCDxYLpr7JMxLRw@mail.gmail.com>
X-Gm-Features: AVHnY4LjKEpG9nYw8-Iw2BW7MqAsGu51jz6EVLHSjBeVIe-JDK-BL3dxnn93Q4c
Message-ID: <CAMRc=Md_OON4cAGcJ=jDu=VY_mw0qa8HPz4VCDxYLpr7JMxLRw@mail.gmail.com>
Subject: Re: [PATCH v21 08/13] mfd: core: Add firmware-node support to MFD cells
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
	Sudeep Holla <sudeep.holla@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: EE365492678
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105176-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,broadcom.com,kernel.org,oss.qualcomm.com,linaro.org,linuxfoundation.org,arm.com,arndb.de,rock-chips.com,gmail.com,ettus.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[34];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,mail.gmail.com:mid]

On Wed, Apr 29, 2026 at 11:46=E2=80=AFAM Shivendra Pratap
<shivendra.pratap@oss.qualcomm.com> wrote:
>
> >>
> >> If set, it would be called from MFD core and would do the name lookup
> >> and return the fwnode which would then be assigned to the cell device?
> >
>
> Or should we just drop this patch for fwnode in mfd-core?
>
> Export a new call in reboot-mode framework as:
> reboot_mode_register_node(struct reboot_mode_driver *reboot,
>                    struct device_node *np / fwnode)
>
> Use the parent node in psci-reboot-mode and find reboot-mode and call
> reboot_mode_register_node?
>

No, I think the reboot-mode device (as pointed to by the dev field of
struct reboot_mode_driver) should be associated with the right fwnode
from the start so it should be handled in MFD core.

I'm of course open to other ideas on how to do it.

Bart

