Return-Path: <linux-arm-msm+bounces-94832-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iCrOHxVgpWmx+wUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94832-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 11:01:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 18DAE1D5F15
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 11:01:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 779723030992
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 10:00:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C54FF395272;
	Mon,  2 Mar 2026 10:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YM4kjIj6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08A8394470;
	Mon,  2 Mar 2026 10:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772445618; cv=none; b=fQWDxbR0beLrJPmpeqOW7xds5CRaEZSydXpMRjapRZQihkINih2XIexEFa8rqaN17pUtsZ3euBG24mc7WlzzOa7V7fJWf3H6wSbkPuIPqxGM70ZmaZBldR01D7FlwQ9phW3nYE8u7kH+3IiwhezhvmVHzlEQqLg2BYTv5up3FFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772445618; c=relaxed/simple;
	bh=e/TEh7ZqKfPuFm00gSswDeyldFcC48wopGgZH80C/Uk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=pQ5NGwTATRtgsb7OgVcahBZwIfuf/2u7K4wbkqH9NMN+0kzi4gudWekvuGzcDHGlLP3CBvF8iPiWsNBd5b+Olt7asDxnZfcrnGXJGKU5jz8fImmH+kVVnbqLtyHzzmig5eWz4TsbeyosbxZ0J2L6NrSDqjv/PBGY/q4aeebwPyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YM4kjIj6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7209C2BCB1;
	Mon,  2 Mar 2026 10:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772445618;
	bh=e/TEh7ZqKfPuFm00gSswDeyldFcC48wopGgZH80C/Uk=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=YM4kjIj6/R5dtJKjlcWSksIHH061WoO1JG2fUP448eMXnW1s1DJbGMmGWiZc2nhht
	 H/Z7ie+r6GJLVoGkzwWhZOxDhDEowtydyNcsxaI/tywRUrXAx3juDGI5JGx2waAC67
	 PYD0pLdzzIITBbff5LU7hVBySpj95fFZ8/BQ2oE6QPfdUTXaMftQEV5+PhVql+OqTN
	 DhaRshEweRxClQhsM1OLqVsiZ24Smi4uap0gecixpNmd7azL5EeIq6Mc+8WD1vYQur
	 PeIKzSIyPIsbGKe4U1FSlw0ofHMGjMqDLbSglERLm6AM3WJPmhOpQuaIfQuq4sgjH6
	 ksiliNUOwHvMQ==
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Mar 2026 11:00:13 +0100
Message-Id: <DGS7J5TC7WPA.17DR914PV3IJN@kernel.org>
Subject: Re: [PATCH 2/3] hwmon: axi-fan: don't use driver_override as IRQ
 name
Cc: <gregkh@linuxfoundation.org>, <rafael@kernel.org>,
 <hanguidong02@gmail.com>, <ysato@users.sourceforge.jp>, <dalias@libc.org>,
 <glaubitz@physik.fu-berlin.de>, <abelvesa@kernel.org>, <srini@kernel.org>,
 <s.nawrocki@samsung.com>, <nuno.sa@analog.com>,
 <driver-core@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <imx@lists.linux.dev>, <linux-hwmon@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-sound@vger.kernel.org>,
 <linux-sh@vger.kernel.org>, "Guenter Roeck" <groeck7@gmail.com>
To: "Guenter Roeck" <linux@roeck-us.net>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260302002729.19438-1-dakr@kernel.org>
 <20260302002729.19438-3-dakr@kernel.org>
 <6e1c57f6-ac82-4e64-a49a-8b3ddc782b54@roeck-us.net>
In-Reply-To: <6e1c57f6-ac82-4e64-a49a-8b3ddc782b54@roeck-us.net>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,gmail.com,users.sourceforge.jp,libc.org,physik.fu-berlin.de,samsung.com,analog.com,lists.linux.dev,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-94832-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 18DAE1D5F15
X-Rspamd-Action: no action

On Mon Mar 2, 2026 at 1:51 AM CET, Guenter Roeck wrote:
> On 3/1/26 16:25, Danilo Krummrich wrote:
>> Do not use driver_override as IRQ name, as it is not guaranteed to point
>> to a valid string; use dev_name() instead.
>>=20
>> Fixes: 8412b410fa5e ("hwmon: Support ADI Fan Control IP")
>> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
>> ---
>>   drivers/hwmon/axi-fan-control.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git a/drivers/hwmon/axi-fan-control.c b/drivers/hwmon/axi-fan-con=
trol.c
>> index b7bb325c3ad9..ec4bbb104449 100644
>> --- a/drivers/hwmon/axi-fan-control.c
>> +++ b/drivers/hwmon/axi-fan-control.c
>> @@ -507,7 +507,7 @@ static int axi_fan_control_probe(struct platform_dev=
ice *pdev)
>>   	ret =3D devm_request_threaded_irq(&pdev->dev, ctl->irq, NULL,
>>   					axi_fan_control_irq_handler,
>>   					IRQF_ONESHOT | IRQF_TRIGGER_HIGH,
>> -					pdev->driver_override, ctl);
>> +					dev_name(&pdev->dev), ctl);
>
> The devm_request_threaded_irq() API documentation says:
>
> @devname:    An ascii name for the claiming device, dev_name(dev) if NULL
>
> So NULL should be sufficient.

I usually prefer to be explicit, but I can change it to NULL.

Thanks,
Danilo

