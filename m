Return-Path: <linux-arm-msm+bounces-119070-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wHkpJEpoVmrt4wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119070-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 18:48:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 07FD97570EB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 18:48:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119070-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119070-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 907D43032F52
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 16:47:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBEB52C375A;
	Tue, 14 Jul 2026 16:47:57 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from air.basealt.ru (air.basealt.ru [193.43.8.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7005F28469A;
	Tue, 14 Jul 2026 16:47:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784047677; cv=none; b=CfBIvqBQPXiAkjmXfB4ihkuKLaB+ncBCn1SFvDTifuc7A6hs8Bgnv6tAmaxXKfgF1UUr1HocWeTjRP8XPskfq9jyIs73KlKBArFd3XsBnUXXGRzmkBiyn3r/OnLNtMbHy8bmo7+w+MEwqHloptChAD2ps3mJMoRJfOLNZxmGwU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784047677; c=relaxed/simple;
	bh=ubt4VVxn8y3DOKHUKqObxBTNY9Yv9liKtbacDOKpd9E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WuXhI5G3XYwdy8ZPME++nv//J76tIZ7YxmyjUdHZknRAQ5BNUp4JR17g+8qIEaP5ELqgZLrVDwzy89PRuvGiRJCLfujR7Q9vNGsdwzpGA3shfHpObLE0JFkoiNVpTLjpa7dydNx4TgyXk5lBa0TTWjLGs75wMReSKTyXApSsRK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org; spf=pass smtp.mailfrom=altlinux.org; arc=none smtp.client-ip=193.43.8.18
Received: from [10.88.16.7] (unknown [193.43.11.2])
	(Authenticated sender: kovalevvv)
	by air.basealt.ru (Postfix) with ESMTPSA id 1FFF323374;
	Tue, 14 Jul 2026 19:47:52 +0300 (MSK)
Message-ID: <c6f52685-dc01-7f56-a5d6-60257259eae2@basealt.ru>
Date: Tue, 14 Jul 2026 19:47:51 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v1] usb: typec: tcpm: qcom: initialize currsrc explicitly
To: Fedor Pchelkin <pchelkin@ispras.ru>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 lvc-project@linuxtesting.org, Casey Connolly <casey.connolly@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
 "Alexey V. Vissarionov" <gremlin@altlinux.org>
References: <20260713182500.GB22956@altlinux.org> <alY7G3egPqw1iaPR@fedora>
Content-Language: en-US
From: Vasiliy Kovalev <kovalev@altlinux.org>
In-Reply-To: <alY7G3egPqw1iaPR@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-119070-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[altlinux.org];
	FORGED_RECIPIENTS(0.00)[m:pchelkin@ispras.ru,m:bryan.odonoghue@linaro.org,m:heikki.krogerus@linux.intel.com,m:lvc-project@linuxtesting.org,m:casey.connolly@linaro.org,m:gregkh@linuxfoundation.org,m:linux-usb@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux@roeck-us.net,m:gremlin@altlinux.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[kovalev@altlinux.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kovalev@altlinux.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,altlinux.org:from_mime,basealt.ru:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 07FD97570EB

On 7/14/26 16:47, Fedor Pchelkin wrote:
> It's confusing a bit.  Maybe [1] should be respinned now with
> currsrc = 0xFF or whatever?

Thanks, agree. v2 sent: 
https://lore.kernel.org/all/20260714163913.151008-1-kovalev@altlinux.org/

> 
> [1]: https://lore.kernel.org/all/20260630120114.185169-1-kovalev@altlinux.org/


