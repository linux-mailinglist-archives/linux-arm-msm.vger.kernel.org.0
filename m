Return-Path: <linux-arm-msm+bounces-106903-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8A7qFoi/AWq7jQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106903-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 13:37:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B81DE50CE13
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 13:37:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CBCAD3044605
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 11:30:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76E35372EDE;
	Mon, 11 May 2026 11:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UQCdmNsA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5338737757F
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 11:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778499006; cv=none; b=pEhpNH4uk509er3BQmNJozh4gd1N9nHIoHIQyU2cEgG5Xa1AbJaabf0QHoKEaWPW6GMUp8vsLIDIaDBM3+CT4zABigRxdW9Pn3bytfIJBiazRphT5PC1MnUVETluf4R26sMPsBE4jNfY8BfYr1qeeMAhu/v68UorF3mzNA+JcLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778499006; c=relaxed/simple;
	bh=IqeusD7M1GeDYISR0gEebUtKpnVGG12mdh36BE5ONCI=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GTTXtaGuVhPo5tox22S7oSOAfYG4lOGWv+xJ/zPfkF0uJ7dtZM01wZCnzgKFenUUeCaOOQiWBXgjlafSFhAigV+ulH4SeH+HBIT2Ip5BB1iB5EC5b3kVwzNGP9SSQDTrQNR8DyVD1lp2LH8wNR8902NqgwBI0tsqKvYsKOUt9So=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UQCdmNsA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3CB0C4AF09
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 11:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778499006;
	bh=IqeusD7M1GeDYISR0gEebUtKpnVGG12mdh36BE5ONCI=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=UQCdmNsA2HNRZi618Ti6Qgj7Eu2mu+CjUBP6v8fQlfk0MiE639MxL8eWXPHwelqmg
	 9s8fwULbVpjE1SEqsNZ+1yE4RTDr+DPLjtlChVqZoRyMcRrjgnHr0K95KzeidjVFwo
	 w/faNuiTciWBxTuAz3FiBcOsfbXOa9oYRzb5QLzhlV8ek504pFwt6ksLN6OJCC/N2J
	 CAq+9d9Zv2jkQFfX5RXz5/NCue3ECTlzZLKbdQ2PqxWLhsk5fKPSz+SBFR918eIGyN
	 CjsRmLQ+Kwaipq2MHQ7oPADPMBGKHgSAhkHEimGMc+1kpphIuC4IkzsVT5zFB+2voP
	 kjP61TSkHblcA==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-38e7b0903cdso39693261fa.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 04:30:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8UmJsco5Fehefk+nylY/m8QmB0c94DtmEEUYit2zSwnO8HGv3BOK5rrN5yJWnlUC5fU5k/83XXViSXEDnp@vger.kernel.org
X-Gm-Message-State: AOJu0YzmL4grQGsWYmD0f4cHHjxlKKNb0lAGRtk+/wbNLnDSPSi9986+
	DohFpmsL3aKH1VRMTrq/dWf1Cy1HgB/IOGvUhh41JBFD7K9kwKfCBk1sdgPZBP+if8O08HeXgM6
	3c8vKKfxawoM+vlMU7mC/TOpEreFx+kjDNoXM+AQVhw==
X-Received: by 2002:a05:651c:897:b0:394:5b8:485a with SMTP id
 38308e7fff4ca-39405b84da4mr33981821fa.14.1778499004642; Mon, 11 May 2026
 04:30:04 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 11 May 2026 04:30:02 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 11 May 2026 04:30:02 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260507-block-as-nvmem-v2-8-bf17edd5134e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260507-block-as-nvmem-v2-0-bf17edd5134e@oss.qualcomm.com> <20260507-block-as-nvmem-v2-8-bf17edd5134e@oss.qualcomm.com>
Date: Mon, 11 May 2026 04:30:02 -0700
X-Gmail-Original-Message-ID: <CAMRc=MfM7cTRA7fMG_ej2v1e=6aQDMz3t9TxvwXeJ0mR1VY2dw@mail.gmail.com>
X-Gm-Features: AVHnY4J57m614VXHB1gG4Q2Qt_nwp6rzOp-nMalUaxmsHemzFoQ6bUJPlO5KxfQ
Message-ID: <CAMRc=MfM7cTRA7fMG_ej2v1e=6aQDMz3t9TxvwXeJ0mR1VY2dw@mail.gmail.com>
Subject: Re: [PATCH v2 8/8] arm64: dts: qcom: arduino-imola: Describe NVMEM
 layout for WiFi/BT addresses
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-block@vger.kernel.org, linux-wireless@vger.kernel.org, 
	ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org, 
	netdev@vger.kernel.org, daniel@makrotopia.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Ulf Hansson <ulfh@kernel.org>, 
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
X-Rspamd-Queue-Id: B81DE50CE13
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106903-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,makrotopia.org,oss.qualcomm.com,kernel.org,kernel.dk,sipsolutions.net,holtmann.org,gmail.com,quicinc.com,davemloft.net,google.com,redhat.com,lunn.ch,armlinux.org.uk];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,qualcomm.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[36];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Thu, 7 May 2026 17:24:43 +0200, Loic Poulain
<loic.poulain@oss.qualcomm.com> said:
> On Arduino Uno-Q, the eMMC boot1 partition is factory provisioned
> with device-specific information such as the WiFi MAC address
> and the Bluetooth BD address. This partition can serve as an
> alternative to additional non-volatile memory, such as a
> dedicated EEPROM.
>
> The eMMC boot partitions are typically good candidates, as they
> are relatively small, read-only by default (and can be enforced
> as hardware read-only), and are not affected by board reflashing
> procedures, which generally target the eMMC user or GP partitions.
>
> Describe the corresponding nvmem-layout for the WiFi and Bluetooth
> addresses, and point the WiFi and Bluetooth nodes to the appropriate
> NVMEM cells to retrieve them.
>
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

