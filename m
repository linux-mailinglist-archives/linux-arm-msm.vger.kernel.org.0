Return-Path: <linux-arm-msm+bounces-95255-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UJrkK6O8p2nfjQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95255-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 06:01:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 173811FAD15
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 06:01:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 93AB0303FDDF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 05:01:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35C51375AD6;
	Wed,  4 Mar 2026 05:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="noVzN0gY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051B81D516C
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Mar 2026 05:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772600480; cv=none; b=J4Z5bKigPZzo8BKPOwYnvw+cGz04y0VBxNkBPxeBdAnv0IMuU9f+F2vqTpk9Zs2n5nr434HEbrkzzCDQ+G0epwA2KPgrJ+lYiM16oZYJ59ztR5oUWwbuGLsk3uXJgmXIK6w+n00XuiJD2rMkIaL26fzy62+HxLZ5oJf151ivPts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772600480; c=relaxed/simple;
	bh=q900SxARa7WkotcVHjlQh+90jJwX7uIhDq9gH9l/QfU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G+7vyjhp5mf8x61WW5ykE4B5Awf7/ItFNJG2rMH3zbk4PfDol4A5bqOSjBlraycXVR5YWw8cNtVitOUvEZUGXibILwoHu+Rx5vGAM744rDeUhzJqUoGx7Erv8Ck06obyjXDhUHXEgZDXTiul23w51WAwQJLBb8iC5AUM90CIYuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=noVzN0gY; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-12732e6a123so3943247c88.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 21:01:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772600478; x=1773205278; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l/nYbvJ2Ie/7AoV2hxQbNjt9CPBgI0NZpDJT+MhOo98=;
        b=noVzN0gY6eDOmqdIDzhqW7qhaHHSELHcvJObBWE3FYMEO/OLSyyhqgXb+Pu2XWdyAq
         LI7wT165K39bYeBeQxZE9Udgs5sijUrIh+t+s6aF2TyoYRsLi6pV3tbNoyerqGwIFUSo
         Qr4cym0LaZmn0aKkCdXz99pW7FlPrWk4pv4yLTG1S8MgOVtAW7GQeQ61nlIgc+HjDGCV
         pMmoZBG9RO5WHCegH5cDgy5EipYHDY43UJUwMTOSYbZYOqHCaNtPz5Gv3Dz13GmNCPeT
         rZCHThWX18UcDrkdEHrsnI94B48y60CtvMDdKHvIgEKvDn/gDGuALJmgOqFGk47pHqvw
         b0Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772600478; x=1773205278;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l/nYbvJ2Ie/7AoV2hxQbNjt9CPBgI0NZpDJT+MhOo98=;
        b=o8TYZcPxB1Cd/Lzqa07B1GovgDdO43x1ri/zxaPPoapMzX027lWGrLZepqHCm1TPbs
         onwGxnWwpGxrTwIFqOAXz9Kq8/xZSgYTTwgJoWUdpe2bNH8nte+oTWPf3dTbKWBR6OvN
         U0AsQWL4o0TPrR8K2eKtBf0zTu0e5yeojNKXICHt/mUa2xX+9rRBy4s7Nv3JS3vMWxbd
         5q6l+n20Yvdrm5pgd59sdhTI/ODv5WVNWiNRyiSd2CaAiBL/bH7iC26XLWJjMJ5c20+M
         GKzVH7mm+1O/7tv3b62DE7Tpuv5g7wzvXBt/W2xsDk5ArnhWQL98cuopHeG4Wnfpxx3L
         SBAg==
X-Forwarded-Encrypted: i=1; AJvYcCW7h68xXixxsuEdUioX2iySTKCrG0hNjOiqigmDlE+zUqTJm+tgM+K2y2o7JW0vcPh/TrZ8gU3qzCFJ0zo0@vger.kernel.org
X-Gm-Message-State: AOJu0YyQkpkNtL5Qiy12JBKzUDB3OXfKUyqXlDEYpd+Fr8xod8YtkDBs
	v0e/v3azmovXf9xpxw71Rx9EM2ueWZyJKsgGsnCbs/6UBnz8+alEbSdo
X-Gm-Gg: ATEYQzz5qgw2icEy3cUtdYz5cv/4MoN8X/a/rAjYfLkNL1s+LzgYcLtyLI4Im3eucxy
	M4bR02Tmqh8JgEFrviG00oATddOS+4WY3yZWPe6BSDuXSjffq9gVSmxOoRxXvOoKwSubcEOYJ1w
	+k2mgkrKXhCM8SsxDiq6Xy1OmAzIeFJPt4PVg64SK2vdNLRw//NmbB01OJszV0NpbNzupaP2ZgZ
	WDEXL/Tqcp3CFZhmWgERRSpYTXrdFf3dw9pDQmZU8FErQNOHGJlxdsaTyiu4bHsahwjAqzpbZQF
	kYkSlTzfLoUU0JC8FAG3XbNutkQPMtPE2+qy+LaI6NYwMwg3XcPBRQtnOywceqxGMYJ/s1dM0D8
	w1+5LJmQ39lRL3N6YhJcEeU4h7pMWRi3XY489flzBhoePY7PS69tpYI+QL8RWt8z3X67MC+Mi5p
	PwTVElgoh5fyYQhtkbnRmMGkOtfCrt53DHbhAkDid/MWRi6CIy/m4b1MbbGhn/7GYd
X-Received: by 2002:a05:7022:24aa:b0:119:e569:fbb2 with SMTP id a92af1059eb24-128b70df522mr302307c88.33.1772600477988;
        Tue, 03 Mar 2026 21:01:17 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:a048:d9ec:d217:7d59])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-127899dfc47sm21528620c88.6.2026.03.03.21.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 21:01:17 -0800 (PST)
Date: Tue, 3 Mar 2026 21:01:14 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: david@ixit.cz
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Henrik Rydberg <rydberg@bitmath.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Petr Hodina <petr.hodina@protonmail.com>, 
	linux-input@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	phone-devel@vger.kernel.org
Subject: Re: [PATCH 04/10] Input: stmfts - disable regulators when power on
 fails
Message-ID: <aae8OqFl5Aejv6YN@google.com>
References: <20260301-stmfts5-v1-0-22c458b9ac68@ixit.cz>
 <20260301-stmfts5-v1-4-22c458b9ac68@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260301-stmfts5-v1-4-22c458b9ac68@ixit.cz>
X-Rspamd-Queue-Id: 173811FAD15
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95255-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,foss.st.com,kernel.org,bitmath.org,protonmail.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ixit.cz:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Sun, Mar 01, 2026 at 06:51:18PM +0100, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> We must power off regulators after failing at power on phase.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  drivers/input/touchscreen/stmfts.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/stmfts.c b/drivers/input/touchscreen/stmfts.c
> index db2dd0bb59fcc..f4e5f1b3ce796 100644
> --- a/drivers/input/touchscreen/stmfts.c
> +++ b/drivers/input/touchscreen/stmfts.c
> @@ -558,7 +558,7 @@ static int stmfts_power_on(struct stmfts_data *sdata)
>  
>  	err = stmfts_read_system_info(sdata);
>  	if (err)
> -		return err;
> +		goto power_off;
>  
>  	enable_irq(sdata->client->irq);
>  
> @@ -566,11 +566,11 @@ static int stmfts_power_on(struct stmfts_data *sdata)
>  
>  	err = stmfts_command(sdata, STMFTS_SYSTEM_RESET);
>  	if (err)
> -		return err;
> +		goto power_off;
>  
>  	err = stmfts_command(sdata, STMFTS_SLEEP_OUT);
>  	if (err)
> -		return err;
> +		goto power_off;
>  
>  	/* optional tuning */
>  	err = stmfts_command(sdata, STMFTS_MS_CX_TUNING);
> @@ -586,7 +586,7 @@ static int stmfts_power_on(struct stmfts_data *sdata)
>  
>  	err = stmfts_command(sdata, STMFTS_FULL_FORCE_CALIBRATION);
>  	if (err)
> -		return err;
> +		goto power_off;
>  
>  	/*
>  	 * At this point no one is using the touchscreen
> @@ -595,6 +595,11 @@ static int stmfts_power_on(struct stmfts_data *sdata)
>  	(void) i2c_smbus_write_byte(sdata->client, STMFTS_SLEEP_IN);
>  
>  	return 0;
> +
> +power_off:
> +	regulator_bulk_disable(ARRAY_SIZE(stmfts_supplies),
> +			       sdata->supplies);
> +	return err;

Maybe wrap everything below enabling the supplies into
stmfts_configute() or something to avoid bunch of gotos to power off on
error?

Thanks.

-- 
Dmitry

