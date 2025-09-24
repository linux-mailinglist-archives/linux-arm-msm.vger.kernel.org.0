Return-Path: <linux-arm-msm+bounces-74562-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 323FFB986BC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 08:42:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E11573A5F22
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 06:42:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 643CF248896;
	Wed, 24 Sep 2025 06:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="MCk6Ie5f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2172E2472A5;
	Wed, 24 Sep 2025 06:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758696168; cv=none; b=UyAz7NZDjgHOy8zwnvjg5zvbSqosJtedYlHBPrgL0idza2+BA9BfaKhErIFkjfWvd+kqOelEGZFMG0+VwwI96jnGz43lpg/YzoscOfFdsDJVs3NOuK8Edot2+EJV7/dIhZRQ/DPd6l3O8txuMMa0A91yPQLy0Nk3fVYqYhmtv90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758696168; c=relaxed/simple;
	bh=/c5dobudUiACi9wzx/OWVC4PwhAIu8eq1izmPG6ec8M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o1fCwf+XXpYrrpk3LUTKpa+bE2NEzarevSKoIGZo39DiZGCDXRM6RqsxWNrWP2hpcV2t98V+CArNg8nrfuXSz34JzCU21Qb82vAgc/SwaLbaOuArCRk6i08j1nU9sddQndqDC1dvE0DgjckzQFCWEfb6hUJo/A6ZfRL/4ZaOHek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=MCk6Ie5f; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2C5714E40CF6;
	Wed, 24 Sep 2025 06:42:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E9E65606B6;
	Wed, 24 Sep 2025 06:42:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 97DC7102F18B7;
	Wed, 24 Sep 2025 08:42:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1758696161; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=uwR8xkHqvdbsZ2Rwz4SDZ9pAbo90DWZtrHInkqgmHnQ=;
	b=MCk6Ie5fIp/ifqSr2rxOGjB+NZRwX5RSCC9pQZTecRrwyl7nFkRDlO0bMu0eBgcrC9QEq4
	ndxB/7lF3ckgivf534Gai2LrhJJlijdMd7RknPQQcOkfVSHzJAimW3UJAe7LsShaHVYWiR
	H2duYIbTF/HjadicIb1fMd3TvYMtcitIk5CWXHtphPBeu7x1WSx6PJVhGyL13e/EjSXBJz
	bSv9UJgIe4/3WikcNvVnUGYG9x2t+g5pPbLipKQ5euu9SEWgmn8/puZzajd0ryIiV22H0X
	Whe2t2MBgqQLUkTbXYuWlfEpG14NxmS9eRyo1VGfL7cX87ijz7yy36X9C/TCyg==
Message-ID: <b67b9041-71ac-4e60-86fc-9d59329719cf@bootlin.com>
Date: Wed, 24 Sep 2025 12:12:17 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 0/7] net: rework SFP capability parsing and
 quirks
To: "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 linux-arm-msm@vger.kernel.org, =?UTF-8?Q?Marek_Beh=C3=BAn?=
 <kabel@kernel.org>, netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>
References: <aMnaoPjIuzEAsESZ@shell.armlinux.org.uk>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <aMnaoPjIuzEAsESZ@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Russell,

On 17/09/2025 03:16, Russell King (Oracle) wrote:
> The original SPF module parsing was implemented prior to gaining any
> quirks, and was designed such that the upstream calls the parsing
> functions to get the translated capabilities of the module.
> 
> SFP quirks were then added to cope with modules that didn't correctly
> fill out their ID EEPROM. The quirk function was called from
> sfp_parse_support() to allow quirks to modify the ethtool link mode
> masks.
> 
> Using just ethtool link mode masks eventually lead to difficulties
> determining the correct phy_interface_t mode, so a bitmap of these
> modes were added - needing both the upstream API and quirks to be
> updated.
> 
> We have had significantly more SFP module quirks added since, some
> which are modifying the ID EEPROM as a way of influencing the data
> we provide to the upstream - for example, sfp_fixup_10gbaset_30m()
> changes id.base.connector so we report PORT_TP. This could be done
> more cleanly if the quirks had access to the parsed SFP port.
> 
> In order to improve flexibility, and to simplify some of the upstream
> code, we group all module capabilities into a single structure that
> the upstream can access via sfp_module_get_caps(). This will allow
> the module capabilities to be expanded if required without reworking
> all the infrastructure and upstreams again.
> 
> In this series, we rework the SFP code to use the capability structure
> and then rework all the upstream implementations, finally removing the
> old kernel internal APIs.
> 

That's some nice work !

I however would have like to be in CC for that, and to have gotten the
information that you were working on that.

You commented on the phy_port V10 that we were moving away from
sfp_select_interface() and at the time, I asked if the approach I was
considering for phy_port was correct or not [1].

Without any reply from you I move on and implemented some reworks in the
phy_port series, without comments from you on V11/12/13, only to find out
now that this whole thing I've added since v10 to come-up with generic
interface selection on PHY driver SFP is superseded by that work.

While your approach is definitely better, I'd have appreciated a heads-up
that you were working on that, or even be in CC: for that work, as I'm
having very limited availabilities to parse the full netdev list :(

In any case, this will make the phy_port series simpler, so thanks for
that work

[1] : https://lore.kernel.org/netdev/a30d00cd-9148-423b-a3e5-b11d6c5c270b@bootlin.com/

Maxime
> ---

