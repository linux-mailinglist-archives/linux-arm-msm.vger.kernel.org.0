Return-Path: <linux-arm-msm+bounces-112321-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CmSbF/8OKWpLPgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112321-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 09:15:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A24AC66687B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 09:15:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=cfGbqJQf;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112321-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112321-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A7DED301464A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 07:07:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE27235F16B;
	Wed, 10 Jun 2026 07:07:50 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB462BDC13
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 07:07:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781075270; cv=none; b=GE4NN55WlJorAPsHhA+ZGG0I7lD+HA/LDFlx6fkvE6a8QvpFyQWMmNGQf4PofJIrU6XGQzm+CFJaqUEzaMDl/onvGzApygjXRHA07/T6pf/5VRuOdwqCenBSn7WhG3HPunK6pvXZvDpBZShReUnAwbmoItOQkuJVb9gowcwzYTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781075270; c=relaxed/simple;
	bh=WC2HgiHNadMWKA/J2f1UCYRD5iXyrcokPN9kxjsuYBs=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fjgaSH6oJAI9hAuL2SQLfqRKr92U9ASqecklKY1+8GEl8ftyZcpR0NmNX8r3AKorJWRFFe6Nyp0ADDHeUkpNgblQUpAfoI68l/jeQng2wwU5qySkiZpdWUS0gccAyqj2Zo1TGKVHfnpr3kL3E1dIX+n4BYT631KjSOHJt2m5w5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cfGbqJQf; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B514D1F0089C
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 07:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781075269;
	bh=WC2HgiHNadMWKA/J2f1UCYRD5iXyrcokPN9kxjsuYBs=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=cfGbqJQfXrJX0bwtW1rRrmimrRyiye4GOQvvaW8EMKjl0zTIz1cG5EdmWnoZfC28J
	 bo1038NPzsUu6n1mRwf2fb3afmNDwyH1a5D29TYERYPNnk+wu8pch4lkbynWh9Qvuc
	 pe29Zsizen9Z4iV6M7VT8TWUq+msh7MF4JdkOkT9WAOQcSD0XGXNoVew8ls8OrSwte
	 fdaXQ7aa7r3XMhrIPuy+V2hd6HQySeG3ZHwdKPIaF1PtZ6eKVIr/YiySkDdl/guCME
	 IoK0n9oDycPWIeGiOX5/cgkvhnmiEKvHuBeC2dtmrOgAo1M7ovQAtx3nqCDH1jT35X
	 G8R5pXuZF9HkQ==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5aa66893e9fso7551518e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 00:07:49 -0700 (PDT)
X-Gm-Message-State: AOJu0YxtB/7lRznldhZHQMIyRuz74xeJgsEUk0dk21c+rbchHGKZhThg
	ErkB8ru+zK+gbjRxaUGMlMy6PIA76y3zW0tWF1dlWf81yFC8VsnZwIzdV3Rsg1yP5Lyn+sTrOTM
	ZXwCXiTtbghCTHA0rvYo2KqwgPqWTH1cJayjmPBDmEg==
X-Received: by 2002:a05:6512:1301:b0:5aa:6946:6e4d with SMTP id
 2adb3069b0e04-5aa87b7da75mr6052832e87.19.1781075268502; Wed, 10 Jun 2026
 00:07:48 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 10 Jun 2026 03:07:45 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 10 Jun 2026 03:07:44 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260610064232.2385866-1-xiuzhuo.shang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260609075417.1160702-1-xiuzhuo.shang@oss.qualcomm.com> <20260610064232.2385866-1-xiuzhuo.shang@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 03:07:44 -0400
X-Gmail-Original-Message-ID: <CAMRc=MdojC6T1RuqRNE-ssoRw1pKyUHyOS9AD0ROfCpPPOqw1A@mail.gmail.com>
X-Gm-Features: AVVi8CdfRsoE2VaH3ay6bwgsRO-cbYcktIwDeVADtoZ21l1bi7WcJc4IuV2d_-Q
Message-ID: <CAMRc=MdojC6T1RuqRNE-ssoRw1pKyUHyOS9AD0ROfCpPPOqw1A@mail.gmail.com>
Subject: Re: [PATCH v2] Bluetooth: qca: Add BT FW build version to kernel log
To: Xiuzhuo Shang <xiuzhuo.shang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org, cheng.jiang@oss.qualcomm.com, 
	quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com, 
	shuai.zhang@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com, 
	jinwang.li@oss.qualcomm.com, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>
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
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112321-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xiuzhuo.shang@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:cheng.jiang@oss.qualcomm.com,m:quic_chezhou@quicinc.com,m:wei.deng@oss.qualcomm.com,m:shuai.zhang@oss.qualcomm.com,m:mengshi.wu@oss.qualcomm.com,m:jinwang.li@oss.qualcomm.com,m:bartosz.golaszewski@oss.qualcomm.com,m:brgl@kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:luizdentz@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,oss.qualcomm.com,quicinc.com,kernel.org,holtmann.org,gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:email];
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
X-Rspamd-Queue-Id: A24AC66687B

On Wed, 10 Jun 2026 08:42:32 +0200, Xiuzhuo Shang
<xiuzhuo.shang@oss.qualcomm.com> said:
> Firmware version is critical for bug triage. Users reporting issues
> typically share dmesg output rather than debugfs contents, requiring
> extra communication rounds to collect this information. Log the FW
> build version directly to the kernel log so it is immediately
> available in bug reports.
>
> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Xiuzhuo Shang <xiuzhuo.shang@oss.qualcomm.com>
> ---

Please don't send a new version if all you did is collected a single tag.

Bart

