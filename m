Return-Path: <linux-arm-msm+bounces-100059-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kFjVCl30xGnv5AQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100059-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 09:54:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 117BE331AE4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 09:54:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B7B79301D24A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 08:54:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59C4037755D;
	Thu, 26 Mar 2026 08:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YagK5OW/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B53F374E76
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 08:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774515287; cv=none; b=ApqxP8TF6vdN0pN45+YMjGuXbJTF0MoNXyOtJD0YQ7R1alGvyH5sZy5AEJduxVyP3Ee8yFaeDuocc06CscK81hwn9jti93se+HetUoKsauxBPEeoIq9wDMAKBGBYlbypB49T2UYlmxIu6L2BPOG+wrUofsJulJk/PfZLANIg5z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774515287; c=relaxed/simple;
	bh=pVOvWW6/8RbPMOuNt3in1cuWQXC6AAst+EwzEiwLSEg=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KfCQoXS68Jb87C/NWKAhi/SoEJ0qxDXp8jZUBYt4Kee1IqP0tbJvRzgfTyJuxgOglfihAfZgE18V+IpqHgxQqc4Ebzisoei1uVvSKTnR5eDcqVFgHBv4XfdOLY7YSKQ1zymLs4CqHSoabXy4smN6LDDIoOgGOOpRJVNtNDIfy5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YagK5OW/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A803C2BCF4
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 08:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774515287;
	bh=pVOvWW6/8RbPMOuNt3in1cuWQXC6AAst+EwzEiwLSEg=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=YagK5OW/gMZ3YzCSyab/3HWPBs0Ini4PAPkopXeyQ6SM5R3LEUSxFGSUktMajiVqy
	 KqJY++sfDH8Ih/RVLcVSy7OGEa+sQjgjwbr8vDLKTASbXu4hxdX17K4oMxqGm68HwJ
	 wl/sBYugxwWjcgtfyABw66CY9Khm/SovttreMTNMHQK24dF2FeaSRZ6vAQuuC+3I91
	 XMOJYcOovODpqO4lnd1Ld++hzTYLOl0q0z7K86YUJLD1U1MeOiTlvlgpjX9TX2yiX9
	 tzJ5FHU6B4kwzyZ+5vS3KT7H2e0DV5AWcS4IMWwk3ve30ZlOKGSToBD8ZzcbSKs7dU
	 BGlbQ6ZeqCNIg==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5a27daa652fso933652e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 01:54:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXoKgIEJbilkUIe+B+zKRnLmDFpUYDEj8zQdoNp91rd1/djA2h/z3izARmVFwpPdD994PC3u5MJJtMmp8h/@vger.kernel.org
X-Gm-Message-State: AOJu0Yzh6o183skn9vxCpbAueF9WK8f/leybyENxOxJfq/4jammoPn2V
	ML3EkN3BFdgoL8gBvyXjzFtiFALZyrrKkRK5teRjzu8ccsgw/KWYEgWya6FaSi+GP507o8psgsM
	AEnsFU05UDjcvLCXwzFkd220bt81c+Y1rFK9V/YBbPg==
X-Received: by 2002:ac2:46f4:0:b0:5a2:a024:e6c2 with SMTP id
 2adb3069b0e04-5a2a024e734mr805672e87.44.1774515285384; Thu, 26 Mar 2026
 01:54:45 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 26 Mar 2026 01:54:44 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 26 Mar 2026 01:54:44 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260326-pci-m2-e-v7-0-43324a7866e6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326-pci-m2-e-v7-0-43324a7866e6@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 01:54:44 -0700
X-Gmail-Original-Message-ID: <CAMRc=MeFPpO77ew4pbPjqo0E3fjos_B=t1AgooB7xrF5CWPeJA@mail.gmail.com>
X-Gm-Features: AQROBzCb320XuFwbgeojakGVPIHtnFnx1cQ_VrqUrXaxSXRJoOgSnNC2mrU3j3w
Message-ID: <CAMRc=MeFPpO77ew4pbPjqo0E3fjos_B=t1AgooB7xrF5CWPeJA@mail.gmail.com>
Subject: Re: [PATCH v7 0/8] Add support for handling PCIe M.2 Key E connectors
 in devicetree
To: manivannan.sadhasivam@oss.qualcomm.com
Cc: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>, 
	linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
	linux-pm@vger.kernel.org, Stephan Gerhold <stephan.gerhold@linaro.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, linux-acpi@vger.kernel.org, 
	Hans de Goede <johannes.goede@oss.qualcomm.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Hans de Goede <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Mark Pearson <mpearson-lenovo@squebb.ca>, "Derek J. Clark" <derekjohn.clark@gmail.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100059-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,linaro.org,oss.qualcomm.com,linuxfoundation.org,linux.dev,linux.intel.com,squebb.ca,gmail.com,holtmann.org,bgdev.pl];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[33];
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
	TAGGED_RCPT(0.00)[linux-arm-msm,manivannan.sadhasivam.oss.qualcomm.com,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 117BE331AE4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 26 Mar 2026 09:06:28 +0100, Manivannan Sadhasivam via B4 Relay
<devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org> said:
> Hi,
>
> This series is the continuation of the series [1] that added the initial support
> for the PCIe M.2 connectors. This series extends it by adding support for Key E
> connectors. These connectors are used to connect the Wireless Connectivity
> devices such as WiFi, BT, NFC and GNSS devices to the host machine over
> interfaces such as PCIe/SDIO, USB/UART and NFC. This series adds support for
> connectors that expose PCIe interface for WiFi and UART interface for BT. Other
> interfaces are left for future improvements.
>
> Serdev device support for BT
> ============================
>
> Adding support for the PCIe interface was mostly straightforward and a lot
> similar to the previous Key M connector. But adding UART interface has proved to
> be tricky. This is mostly because of the fact UART is a non-discoverable bus,
> unlike PCIe which is discoverable. So this series relied on the PCI notifier to
> create the serdev device for UART/BT. This means the PCIe interface will be
> brought up first and after the PCIe device enumeration, the serdev device will
> be created by the pwrseq driver. This logic is necessary since the connector
> driver and DT node don't describe the device, but just the connector. So to make
> the connector interface Plug and Play, the connector driver uses the PCIe device
> ID to identify the card and creates the serdev device. This logic could be
> extended in the future to support more M.2 cards. Even if the M.2 card uses SDIO
> interface for connecting WLAN, a SDIO notifier could be added to create the
> serdev device.
>
> Testing
> =======
>
> This series, together with the devicetree changes [2] was tested on the
> Qualcomm X1e based Lenovo Thinkpad T14s Laptop which has the WCN7850 WLAN/BT
> 1620 LGA card connected over PCIe and UART.
>
> Merge Strategy
> ==============
>
> Due to the API dependency, both the serdev and pwrseq patches need to go through
> a single tree, maybe through pwrseq tree. So the serdev patches need Ack from
> Greg. But Bluetooth patch can be merged separately.

I think Rob Herring is the man in charge here. The power sequencing parts look
good to me now so with an Ack on the serdev changes I can queue them for v7.1.
I can also put it on an immutable branch if needed.

Bart

