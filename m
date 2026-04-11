Return-Path: <linux-arm-msm+bounces-102799-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qjI0CKd92mlM3AgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102799-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 18:58:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B4F93E0F37
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 18:58:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3D16230056ED
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 16:54:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B555D176ADE;
	Sat, 11 Apr 2026 16:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="O2P6DHpx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E961E98EF
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 16:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775926454; cv=none; b=YNmVt1US8yB2SftK3Qks7Rj/qKSsfNgiutzgeXpSuVyT3mC21cmeVXnlsOgOxG81nr/6+iW0e40sYMOjhBpHu2qTD5zBoD574rqcCqC9hIkU3fgtXhtKpAKcKfQmxy8t5ld2lLXzUoF3bHBTkMmksYaqodovaiCh7gs8zu+DOWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775926454; c=relaxed/simple;
	bh=Xy1i8/Vb4xb6aKipUIHhB8zyMf1+xp7IX2ZLwSpy02o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mv5YB3fM5uk7T6KZbwlyQ1dthQNUERUvrK7g3461KhnanutJsfdZe8Ifz7qWjOii0LNvV3vc+a8wqLTcLhtoBZIMY4ZQzHLzQ5VG4TXXmZXHyjJG0Ne6fWXORKOG1gUXK08Ath3EBKf4vt3hXDRJAhMQWCUSmEDJJXpbRoCXgB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=O2P6DHpx; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 8EAA5C5C1B6;
	Sat, 11 Apr 2026 16:54:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A7CF460410;
	Sat, 11 Apr 2026 16:54:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B20771045001C;
	Sat, 11 Apr 2026 18:54:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775926446; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=W5IQ24kdhXhWFFYvlmQCRDImAovTvZLPLnv6pYIeYaw=;
	b=O2P6DHpxDPhELF4ajyXzJ3baTB1Crkn9mpVScIXAJh1f1yER+6tM+qlAi/O6zbvkhq8ZE7
	MSD7AzrrFafxgfdscvfdd+DzWfAbsleaL7fw5HeZv7C7f2EffF8xxKE+y7DIoWNSza9cy5
	XpMsCSlLdPEurUcOESQ/1Bu4sxviuiMlv3z1RGDSNx+ePzEICBr86OJJNwMTOmDOi8zwl6
	7FUnckGuqk0E+0My5+hboi6MOIctauhJiN2oT9pkXIeV3XnEqHs01+whGp7EELaP0L/cQx
	zft+htkqeKaLgwJAQ5TWWLcuyCrMaNzkbzJzdTpFbNgVHuAvENBfltu8kkETMA==
Message-ID: <c37f182e-cbb4-4f0b-817a-759d39940212@bootlin.com>
Date: Sat, 11 Apr 2026 18:54:01 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: phy: qcom: at803x: Use the correct bit to
 disable extended next page
To: Andrew Lunn <andrew@lunn.ch>
Cc: Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Russell King <linux@armlinux.org.uk>,
 thomas.petazzoni@bootlin.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260410171021.1277138-1-maxime.chevallier@bootlin.com>
 <4b386a4a-9743-4e79-8d3d-3576bb9de492@lunn.ch>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <4b386a4a-9743-4e79-8d3d-3576bb9de492@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	TAGGED_FROM(0.00)[bounces-102799-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maxime.chevallier@bootlin.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:dkim,bootlin.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6B4F93E0F37
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Andrew,

On 11/04/2026 16:10, Andrew Lunn wrote:
> On Fri, Apr 10, 2026 at 07:10:20PM +0200, Maxime Chevallier wrote:
>> As noted in the blamed commit, the AR8035 and other PHYs from this
>> family advertise the Extended Next Page support by default, which may be
>> understood by some partners as this PHY being multi-gig capable.
>>
>> The fix is to disable XNP advertising, which is done by setting bit 12
>> of the Auto-Negotiation Advertisement Register (MII_ADVERTISE).
>>
>> The blamed commit incorrectly uses MDIO_AN_CTRL1_XNP, which is bit 13 as per
>> 802.3 : 45.2.7.1 AN control register (Register 7.0)
>>
>> BIT 12 in MII_ADVERTISE is wrapped by ADVERTISE_RESV, used by some
>> drivers such as the aquantia one. 802.3 Clause 28 defines bit 12 as
>> Extended Next Page ability, at least in recent versions of the standard.
> 
>> Let's add a define for it and use it in the at803x driver.
> 
> I agree with this, it defines the C22 4.12 bit. And this is what the
> at803x driver is using it for.
> 
>>  static void at803x_link_change_notify(struct phy_device *phydev)
>> diff --git a/include/uapi/linux/mii.h b/include/uapi/linux/mii.h
>> index 39f7c44baf53..61d6edad4b94 100644
>> --- a/include/uapi/linux/mii.h
>> +++ b/include/uapi/linux/mii.h
>> @@ -82,7 +82,8 @@
>>  #define ADVERTISE_100BASE4	0x0200	/* Try for 100mbps 4k packets  */
>>  #define ADVERTISE_PAUSE_CAP	0x0400	/* Try for pause               */
>>  #define ADVERTISE_PAUSE_ASYM	0x0800	/* Try for asymetric pause     */
>> -#define ADVERTISE_RESV		0x1000	/* Unused...                   */
>> +#define ADVERTISE_XNP		0x1000  /* Extended Next Page */
>> +#define ADVERTISE_RESV		ADVERTISE_XNP /* Used to be reserved */
> 
> Should we keep ADVERTISE_RESV?
> 
>   45.2.7.6 AN advertisement register
> 
>   If the Auto-Negotiation advertisement register (register 4) is
>   present, (see 28.2.4.1.3), then this register is a copy of the
>   Auto-Negotiation advertisement register (register 4). In this case,
>   reads to the AN advertisement register (7.16) report the value of
>   the Auto-Negotiation advertisement register (register 4); writes to
>   the AN advertisement register (7.16) cause a write to occur to the
>   Auto-Negotiation advertisement register.
> 
> So MDIO_MMD_AN:MDIO_AN_ADVERTISE is a straight copy of MII_ADVERTISE.
> 
>         ef4_mdio_write(efx, MDIO_MMD_AN, MDIO_AN_ADVERTISE, reg);
>         ret = phy_write_mmd(phydev, MDIO_MMD_AN, MDIO_AN_ADVERTISE, adv);
> 
> So ADVERTISE_XNP is just as valid in the other two drivers using
> ADVERTISE_RESV. I think we should change those as well to
> ADVERTISE_XNP and remove ADVERTISE_RESV?
> 
> 	Andrew

I agree with that yes and I've considered converting these drivers once
we have net merged into net-next should this patch be applied :)

That said, ADVERTISE_RESV is in uapi, is it even possible to remove it ?

I think the best we can hope for is to no longer have in-tree users of
ADVERTISE_RESV :(

Maxime


