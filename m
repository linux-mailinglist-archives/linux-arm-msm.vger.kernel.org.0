Return-Path: <linux-arm-msm+bounces-111851-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LspzNxanJmp+agIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111851-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 13:27:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 40966655AF9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 13:27:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=IBsVzN3o;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111851-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111851-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EBE8A30E6228
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 11:19:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 183963655F1;
	Mon,  8 Jun 2026 11:19:43 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 113C23546FE
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 11:19:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780917583; cv=none; b=HnWcj6urYnai2/G7O3wq9qJBvm9+XzGOyffFW0MMNJtifnpIQfxJZoJVLq6/BTfQH/wmvmIxgwhdjNeMDps80S/EHpzRexzCUNDUBki5addtsho77tbI6GyVD0QphuroNdADhrsDeMh522jMCgdNWaUDeuZVvIuWCh1d4+Z1IZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780917583; c=relaxed/simple;
	bh=f5NAJHcxzb5iVdVk5j6K75Yy6lO9LRzQdplxfReb0dE=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=freFvEx9d5Mpu+ZwrL0SKq7JvW2eoh/CynFpVc3rfW8+V0bJ3goaNGzeXo2gsxF49Hur+Dr0dn8euNnRZGVXOIVaOoSyLv3qhN4g56zfSaoiGbtrdPvkzjGNJrAkBz4toGW0UactR0Rb/2z4VO/1t8dUG/UJXQdTaX//ZZipZd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IBsVzN3o; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D27541F00A00
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 11:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780917581;
	bh=f5NAJHcxzb5iVdVk5j6K75Yy6lO9LRzQdplxfReb0dE=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=IBsVzN3ogan36/89OV9DntGbgRlO4EaXnUSl9l4MdOfxxYGiF7wtHMJ/Vre/u0SPh
	 6LrQTxHcl/GimI+L88il4sYmFnvjJli3ro9qv4gcbWUAVdIu2VUru9+5iChQS6CNf0
	 KOmZtnyvu8OnqHxbc9gn5ZS/iqm1RYFnLXvzbgiyt4LafFAHIzykDtrfrc1igLJ8Vw
	 QlAMaOmQZnPR7o9OoVQKyTqFJ3ywv6pRPR18ji/sJftlYY7BHSWJ8CCqsT33hbU+tE
	 RwAB7znD0I9tXF5KTsW+Hgfc3DWr44iQYOYqZ0/oivzKPLv6P5hZc1SKl8GJgG8R2t
	 MhNqn2aBDsiSg==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5aa66893e9fso4692087e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 04:19:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/qMJSjV797hCgbJRJ12IJqAlLfWnnjwqJVmf7jrY6pfm0RjoDOoRAbs08/IVVaSYSgOlmuU00rs9vmnHNX@vger.kernel.org
X-Gm-Message-State: AOJu0YzLDNVc37SkIOfXElYCHO2e8s6JO7Uw5spve944JUgj2mIV2yep
	Yd2OJBaymHHtEq4gM4OqhOYF+cboyJvZQ4an1y5cVaErTq/q6I4wl/oGIGXP89ONmhpcqkAmnqo
	rU29n3lqeD/zROOc9Ut8ABg52QQC+FV+Eta1Qm2eExw==
X-Received: by 2002:a05:6512:33cc:b0:5aa:6aba:76f8 with SMTP id
 2adb3069b0e04-5aa87bc8d69mr3784333e87.30.1780917580513; Mon, 08 Jun 2026
 04:19:40 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 8 Jun 2026 04:19:38 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 8 Jun 2026 04:19:38 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260608-block-as-nvmem-v3-6-82681f50aa35@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260608-block-as-nvmem-v3-0-82681f50aa35@oss.qualcomm.com> <20260608-block-as-nvmem-v3-6-82681f50aa35@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 04:19:38 -0700
X-Gmail-Original-Message-ID: <CAMRc=MdRZ_7jzDErZOxeBYE+awL2fe1KcKqC=Yi1gDD28ra=zg@mail.gmail.com>
X-Gm-Features: AVVi8Cew2n-YmjEp_T_Fkca1TPT0Dv6DfUiL88X7yEcZLGkS30SEi9F-0nG9RjI
Message-ID: <CAMRc=MdRZ_7jzDErZOxeBYE+awL2fe1KcKqC=Yi1gDD28ra=zg@mail.gmail.com>
Subject: Re: [PATCH v3 6/7] Bluetooth: hci_sync: Add NVMEM-backed BD address retrieval
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-block@vger.kernel.org, linux-wireless@vger.kernel.org, 
	ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org, 
	netdev@vger.kernel.org, daniel@makrotopia.org, Ulf Hansson <ulfh@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Jens Axboe <axboe@kernel.dk>, Johannes Berg <johannes@sipsolutions.net>, 
	Jeff Johnson <jjohnson@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, Rocky Liao <quic_rjliao@quicinc.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Saravana Kannan <saravanak@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[35];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-111851-lists,linux-arm-msm=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:loic.poulain@oss.qualcomm.com,m:linux-mmc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-block@vger.kernel.org,m:linux-wireless@vger.kernel.org,m:ath10k@lists.infradead.org,m:linux-bluetooth@vger.kernel.org,m:netdev@vger.kernel.org,m:daniel@makrotopia.org,m:ulfh@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:axboe@kernel.dk,m:johannes@sipsolutions.net,m:jjohnson@kernel.org,m:brgl@kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:quic_bgodavar@quicinc.com,m:quic_rjliao@quicinc.com,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:horms@kernel.org,m:srini@kernel.org,m:andrew@lunn.ch,m:hkallweit1@gmail.com,m:linux@armlinux.org.uk,m:saravanak@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:luizdentz@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,makrotopia.org,kernel.org,kernel.dk,sipsolutions.net,holtmann.org,gmail.com,quicinc.com,davemloft.net,google.com,redhat.com,lunn.ch,armlinux.org.uk];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,mail.gmail.com:mid];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 40966655AF9

On Mon, 8 Jun 2026 12:50:43 +0200, Loic Poulain
<loic.poulain@oss.qualcomm.com> said:
> Some devices store the Bluetooth BD address in non-volatile
> memory, which can be accessed through the NVMEM framework.
> Similar to Ethernet or WiFi MAC addresses, add support for
> reading the BD address from a 'local-bd-address' NVMEM cell.
>
> As with the device-tree provided BD address, add a quirk to
> indicate whether a device or platform should attempt to read
> the address from NVMEM when no valid in-chip address is present.
> Also add a quirk to indicate if the address is stored in
> big-endian byte order.
>
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

