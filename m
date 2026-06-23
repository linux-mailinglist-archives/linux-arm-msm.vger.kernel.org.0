Return-Path: <linux-arm-msm+bounces-114121-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nleBE5JLOmr65QcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114121-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 11:02:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7736B585C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 11:02:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=j5Fp66rP;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114121-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114121-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 22FBD30F4B85
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 08:56:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A7E43CF21A;
	Tue, 23 Jun 2026 08:56:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D4B3CEB8F
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 08:56:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782204965; cv=none; b=AbgOnfYw/52yglTC1I7uugXG68kJa9Di4iJJyCMIsibGKkFewM5EgI50wD3LaNSd5thIKdlKDtenu622pRAdJmtS3zteI0BIgYkeL++2YblyEls7Pvca4O89ku0YgHOgl1tmahOUrpJlx0VbTK1OZ4YfDwNAOafAbB4XFFs/HKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782204965; c=relaxed/simple;
	bh=tMqDaqvWgrY73DBDJIQvMJiYaoK45B0BM6Kqt85d2eM=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hI/UP+8cPdphjfSQ1WsJ8HTNm+vxYJHdGc8fAgQz2su0OMv20sg5oipOW69pcbIt3tzc5rWpA6FgRHzSuNAyochnefKfB/FN2pLQl3MMZeRmNIu+m3vrUs0Hzh3n/Evwnium/iWogugURvsfpbVTCqyDM04MVKAqJxbtcRq3vKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j5Fp66rP; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC98A1F00ADB
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 08:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782204964;
	bh=XCSDVLs1v5VL0YI6/K4DpzPCqnReN/qAG8qjL5AnhLY=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=j5Fp66rP77vX3M4T3UIKHebUpXYrnzxjMP2H0MCghzQ5Ak9tSpg0hIyNVc91Eg6YS
	 7LVahGe6AELEy+tFRpktai5DpUkQl4A7MBV4eXvTbGGY6Ke5E+Dh7xZzv7RUA+Bg7h
	 uZ7iVKmFYmTmZRF1BZtR8hvCquC8sKObxsJAeFw+Dyh7I+Ar4g5CJi7+vQ1SBlKLwb
	 Ntv0vhSWFpuXTnBNjn2H8tuI/Mf3VJaEBwZc6DyZLYk05Q9HjfqLViruL0LFQZG+9o
	 k7GnkDwVNxw7/Vk+RDrfKb8kyXOxCKNP3mHjcee8ph7qfT6IT9nAnRXqSJnmoXjAeg
	 bhk76TJ4floQA==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-396771119c4so48416971fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 01:56:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+A9sbgUpUoD6LRX6mgPRkSCtf7F0BAgxhFNqqnKts3t7jwvUF1NIDOqaemukmEvJBCc1UZZGcFlD78FGSI@vger.kernel.org
X-Gm-Message-State: AOJu0YxXLPviCAmIsgNqtr5XnxrAzqGmrWmF1/1lHaqA2q6dQYVR6+Wi
	n0wjw13DSZFSDWaqFSU1GuvqPGFMuz1AibvCif9AcHC9c0dA0iEWyuyLMyhAG3vDfc53t8NtfOk
	IuvNBjpL58OPcFn0i6fVRC6+kPy5TAApzsDT/5UyBMA==
X-Received: by 2002:a05:651c:1602:b0:396:a807:bde0 with SMTP id
 38308e7fff4ca-39a2073f5d7mr5324951fa.0.1782204963324; Tue, 23 Jun 2026
 01:56:03 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 23 Jun 2026 04:56:02 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 23 Jun 2026 04:56:02 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260622-bt_bugfix-v1-7-11f936d84e72@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260622-bt_bugfix-v1-0-11f936d84e72@oss.qualcomm.com> <20260622-bt_bugfix-v1-7-11f936d84e72@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 04:56:02 -0400
X-Gmail-Original-Message-ID: <CAMRc=MfiuK5kWX_Wof2CFr1Ct0jrc8XsUk6mKi_QAO5vFZzEsw@mail.gmail.com>
X-Gm-Features: AVVi8CdzJIdELBc5-o2D7cK9wimmgXdfGbi7xVd0KOZratMuVCYrA2SqxtTjgFo
Message-ID: <CAMRc=MfiuK5kWX_Wof2CFr1Ct0jrc8XsUk6mKi_QAO5vFZzEsw@mail.gmail.com>
Subject: Re: [PATCH 07/13] Bluetooth: hci_sync: Simplify hci_reset_sync()
To: Zijun Hu <zijun.hu@oss.qualcomm.com>
Cc: Zijun Hu <zijun_hu@icloud.com>, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>, linux-arm-msm@vger.kernel.org, 
	Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Rocky Liao <quic_rjliao@quicinc.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Ben Young Tae Kim <ytkim@qca.qualcomm.com>, Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, 
	Matthias Kaehlcke <mka@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114121-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:zijun.hu@oss.qualcomm.com,m:zijun_hu@icloud.com,m:linux-bluetooth@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:luiz.von.dentz@intel.com,m:linux-arm-msm@vger.kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:quic_rjliao@quicinc.com,m:brgl@kernel.org,m:ytkim@qca.qualcomm.com,m:quic_bgodavar@quicinc.com,m:mka@chromium.org,m:luizdentz@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[icloud.com,vger.kernel.org,intel.com,holtmann.org,gmail.com,quicinc.com,kernel.org,qca.qualcomm.com,chromium.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,mail.gmail.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CA7736B585C

On Mon, 22 Jun 2026 16:52:20 +0200, Zijun Hu <zijun.hu@oss.qualcomm.com> said:
> Return err directly instead of using an if/return pattern.
>
> Signed-off-by: Zijun Hu <zijun.hu@oss.qualcomm.com>
> ---
>  net/bluetooth/hci_sync.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/net/bluetooth/hci_sync.c b/net/bluetooth/hci_sync.c
> index 3be8c3581c6c..fce9f9526cb5 100644
> --- a/net/bluetooth/hci_sync.c
> +++ b/net/bluetooth/hci_sync.c
> @@ -3678,10 +3678,8 @@ int hci_reset_sync(struct hci_dev *hdev)
>
>  	err = __hci_cmd_sync_status(hdev, HCI_OP_RESET, 0, NULL,
>  				    HCI_CMD_TIMEOUT);
> -	if (err)
> -		return err;
>
> -	return 0;
> +	return err;
>  }
>
>  static int hci_init0_sync(struct hci_dev *hdev)
>
> --
> 2.34.1
>
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

