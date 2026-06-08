Return-Path: <linux-arm-msm+bounces-111849-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id x1G1NXemJmpDagIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111849-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 13:24:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D202655A7A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 13:24:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="h/erb8Xt";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111849-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111849-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 31BD430B4E23
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 11:18:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 320603655CB;
	Mon,  8 Jun 2026 11:18:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36534357D10
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 11:18:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780917524; cv=none; b=WQqll5+P5WFGo0+aySGMW9dhqWUKdP2R8yCxnY2RNQDlT0AwcwP/6SygjkqsI5UpeBXNXBbrWFv4hSHlj7XCX2dCTAsqGDWffKPRWCDVUmyk4qfFEjenS+ALUKtU359bhcolP9w/ur5pCALdwTdye24jQGd2nj5OTfo3BcxoO2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780917524; c=relaxed/simple;
	bh=pFMAGQPvDoEOfbv6xk4LPNtyK0BZmw1e8x0Y/MFQuBY=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W9Hle2I+2PZlNBGahEDAtfdmK7bJPlpzMTOEiPp1/LwxHMkz2dhhSt6M6Ng9Pvaj+AwAv7B31DQuT/4vITdwHteeParMn30nJaHv4Xylkh8h8JqYHpCzHBGupy0KsDPCndMh/C4HCQHEk/vqsFtljGA9XYbHdorx08LPitQ/o2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h/erb8Xt; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F09C21F008A1
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 11:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780917523;
	bh=pFMAGQPvDoEOfbv6xk4LPNtyK0BZmw1e8x0Y/MFQuBY=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=h/erb8Xt0IiBnt5uzTjO6qSZh/4cdyjspm9xTnppXWhOAYs1EE8YVBvDK+ldNqakT
	 c6uSakP62TFkAIRhg9NlSBU9w3g2xjLlmUL0t/TXf3ov7jpxrQkM0AoB82zgoh7idT
	 RFA+u9DWZQ7q13474f4nFuQJBqaH/zXaBzXb1c/cLISKlPynpMiHeRuLG2nSOI3SH6
	 LwGh4JQuLLPjJ5zc0jAFOwzsU1jyGtdNRoj7ZnlNNEBj55GfJWqGrXuwRqyCOeadYE
	 7IJYVGMvtyEaWVlwKzc2Gl8axhPa/I0ioRnKxM/mnoqOORek77220U7fvRzlmDSiKj
	 ci7eNvKgI7zGg==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-396bed274b9so34538331fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 04:18:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/tkJOJoPA82TIstXIFF6r0NsFV3j1Y7or+7ME2zGKvJFBpIBCu3c3EkKIa9pWThGFvga6U5LznXZU9jPO4@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm0z0skGH3wUW2FEC4+T0bVtvMfAoBfvv2+DNIOXjO+ROpXtTP
	5epBOeg6LduAK5TKOgjlleig9XHmCSTPlRGKC7/HysoQ+aHcot7fV9+vCLVv0BBMX7coMQTIC8x
	hfqTJrTCv0CikF0ciY2fwLdiP92DctEWJXUrNWZ50xQ==
X-Received: by 2002:a05:651c:1583:b0:396:9dde:b5e6 with SMTP id
 38308e7fff4ca-396d0752a58mr36949311fa.5.1780917521671; Mon, 08 Jun 2026
 04:18:41 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 8 Jun 2026 04:18:40 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 8 Jun 2026 04:18:40 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260608-block-as-nvmem-v3-1-82681f50aa35@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260608-block-as-nvmem-v3-0-82681f50aa35@oss.qualcomm.com> <20260608-block-as-nvmem-v3-1-82681f50aa35@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 04:18:40 -0700
X-Gmail-Original-Message-ID: <CAMRc=MeHJMKuEm-aAqwoaq_vGcQm-oOX+9dFrp1kijZYWFnX5A@mail.gmail.com>
X-Gm-Features: AVVi8CektcE6gMbY10cEVnuX6KgxnarlC2iBfMp83fSayBsh06aH5Rgenq9H1t4
Message-ID: <CAMRc=MeHJMKuEm-aAqwoaq_vGcQm-oOX+9dFrp1kijZYWFnX5A@mail.gmail.com>
Subject: Re: [PATCH v3 1/7] dt-bindings: mmc: Document support for nvmem-layout
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
	TAGGED_FROM(0.00)[bounces-111849-lists,linux-arm-msm=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:loic.poulain@oss.qualcomm.com,m:linux-mmc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-block@vger.kernel.org,m:linux-wireless@vger.kernel.org,m:ath10k@lists.infradead.org,m:linux-bluetooth@vger.kernel.org,m:netdev@vger.kernel.org,m:daniel@makrotopia.org,m:ulfh@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:axboe@kernel.dk,m:johannes@sipsolutions.net,m:jjohnson@kernel.org,m:brgl@kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:quic_bgodavar@quicinc.com,m:quic_rjliao@quicinc.com,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:horms@kernel.org,m:srini@kernel.org,m:andrew@lunn.ch,m:hkallweit1@gmail.com,m:linux@armlinux.org.uk,m:saravanak@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:luizdentz@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,makrotopia.org,kernel.org,kernel.dk,sipsolutions.net,holtmann.org,gmail.com,quicinc.com,davemloft.net,google.com,redhat.com,lunn.ch,armlinux.org.uk];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,vger.kernel.org:from_smtp,qualcomm.com:email];
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
X-Rspamd-Queue-Id: 3D202655A7A

On Mon, 8 Jun 2026 12:50:38 +0200, Loic Poulain
<loic.poulain@oss.qualcomm.com> said:
> Add support for an nvmem-layout subnode under an eMMC hardware
> partition. This allows the partition to be exposed as an NVMEM
> provider and its internal layout to be described. For example,
> an eMMC boot partition can be used to store device-specific
> information such as a WiFi MAC address.
>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

