Return-Path: <linux-arm-msm+bounces-113451-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id klvxKVx3MWoxkAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113451-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 18:18:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 29357691EB7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 18:18:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=JA+grj0K;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113451-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113451-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7D461317B209
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 16:01:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E747466B7B;
	Tue, 16 Jun 2026 15:59:39 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF7CF466B7C
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 15:59:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781625579; cv=none; b=bzvLaEEWA4R/hgw8LHpl2x9CkAf0Z2LyFxhLXoK6pvytGUvtL3fP1NKN85YRO+emny6YbfqwFXgoEXhQK30OmF3dnC64TnunN12FHswd6i+lOqmW/fy0ouA6KEdE8D5qDWBU7u5IKeouj/LE7WQIeMhb//d2EbqldXDuu2lgKCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781625579; c=relaxed/simple;
	bh=wfos8YW46l2Yhc+nFwbs7u+gPmq7+1EZsokr/nRJRBY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Iaqbv+rPSwi7JHIXS/UQxew99NUmeQdKBQ6uzaG2ODx6FMHjOT3o30gdA+97daRN78tvxWlDrPqqxOWcx0e6/lhib+ikoNCOlH7pVbBQzAjFSudJE+vkCim1TRbc0XBmEFr00Oz04gBZtp13xm0SzCLFKPWFi4pzyn/gJBxPMZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JA+grj0K; arc=none smtp.client-ip=209.85.215.175
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c858cc9870aso5642a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 08:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781625577; x=1782230377; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uSWVqVYBFNIaFXIOlsv9h9TEbEq9eBULKt8+LrdjY+M=;
        b=JA+grj0KsFOooI53z4jrpYsay0ElP3YHZbQfnSWlPpPoVCjBkFN/7Q+b3qo2aLrBOh
         bPlokCLdlmDXYdRNEcVLEw7W/cE5s86fR6PRjstY2LB132Zr/dqHEa4e04BwR+2ionsc
         sgwdaH4jX/ZiLaM+kll2CBQSluyIA1bzSMU7By7izMNgTSmfuYENRfP9i9wUsHdvFC8n
         OKvvwIf3asHzIyLl89Q4qW6uGpcU+drdZoZBQ6j4kQwBZNWCZlv8qlrCXg9bNAeTL6AT
         vvsIsrEs7dr4ftuogBgpTg9YXcVoh5vrsUWrJKyGiiwsn/6wc5oJrfA/ek8YePAbZ8Z2
         vNOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781625577; x=1782230377;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uSWVqVYBFNIaFXIOlsv9h9TEbEq9eBULKt8+LrdjY+M=;
        b=BVtiZ3/FjpXQ+UUxk7+9WxuHbks6g3FOSY6ACz9tfWFSPxEHuhow8uMjWBPWMJjMn1
         n+oLHy07YHVQSTQNxHabPXKGL9/PUbb5jgD2CsLxkAK1DSokMfPY5zHP0NouPPog9t4w
         kMPsJe71vwYtFrwCqXkBlKDxvbTl4gyY+hDMGnKdI6soKn2rffDwXnBXtFp3DSzQ7alg
         mcRy25b1G/evBcBeqOhy3c1hu87Bc5mhk+lQGrt5IH6Cdwr5jx9FjAqAhYjKgoT+B9sK
         TotyODPpM1lPWPCsa/qaZGIl2hQFrF0087D5GN2y0Cq8hw3puI1RA1Ms/v8Cw0WEoe7v
         p3yg==
X-Forwarded-Encrypted: i=1; AFNElJ9p4aEHUvKBL3sAVqgNZ6SPbxE9guaBcVaFhS6ICfxJLAoezDuO3rRijCBQCS1qGzScVTZYqgKC55G8+RAQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzDwBsNMhsnwecId1PFMny4eDlUlXX7Tx674n0m8xrfdYeci5Jt
	2xC7KqoagywWRg0AmmojNJHTb0ZJNXCIptNW6yea32uAKSaAuOJ4Q3s6wiMyuhF6
X-Gm-Gg: Acq92OHuGp1CAix+wHwbEPsPymsQm76+NVNFmBVPptlYPXbGTNNwWVPJiwydUGfF0gJ
	da6CcWhgj1NxSl1iHwaEOUExrYXUeN+zz9rF82X69kacp5d6ane5QT+TLAO45ecpHQzhA9sn3BS
	M8iznIGoxAYoEuEkbtxyN9EI9xaOeu0fXJ2Q4yVkVZXlGeIpVmIc4smeD78yTNQ2iPdJC0eKXxY
	Fhr/fvf4IX/UMubirEuUFMJD4SoLP49ZwCqHxOdldq44iq4EWSyohjTWFP8AatyPnRtvOtl98wE
	5qMq74iCUHVEzySf7NOcQrKQsi2MKzRvv8NQIdQ5z8CoRGi8K6aEdC1rVskSVA3ZKO6MVQIPxKs
	2WiJYaB3MC/LBPWUV5tqkMjk1MeEJiQbzG4U+24KXXAb1AkGwPrEbrtHSwKdi47XWAdna8Qgapk
	5m61lZ0BBWU2Xhr9uWnxJvoe1fwoCubbh+OyJO
X-Received: by 2002:a05:6a21:490d:b0:3b4:6921:5665 with SMTP id adf61e73a8af0-3b7e2242adamr3765102637.9.1781625577305;
        Tue, 16 Jun 2026 08:59:37 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8665186d98sm11759708a12.16.2026.06.16.08.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 08:59:36 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 16 Jun 2026 08:59:36 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Martino Facchin <m.facchin@arduino.cc>
Subject: Re: [PATCH v2 2/3] hwmon: ina2xx: support ina232
Message-ID: <8ca66c86-c8cb-4e92-abcb-c4d68eedf0e1@roeck-us.net>
References: <20260611-monza-ina232-v2-0-e4375ce652d0@oss.qualcomm.com>
 <20260611-monza-ina232-v2-2-e4375ce652d0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611-monza-ina232-v2-2-e4375ce652d0@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113451-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:loic.poulain@oss.qualcomm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:krzk@kernel.org,m:linux-hwmon@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:m.facchin@arduino.cc,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[linux@roeck-us.net,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	DMARC_NA(0.00)[roeck-us.net];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@roeck-us.net,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[roeck-us.net:mid,roeck-us.net:from_mime,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,arduino.cc:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 29357691EB7

On Thu, Jun 11, 2026 at 04:05:25PM +0200, Loic Poulain wrote:
> From: Martino Facchin <m.facchin@arduino.cc>
> 
> The INA232 is a current/power monitor. It shares the same register
> layout as the INA2xx and uses the INA226 default configuration, but
> differs in its electrical characteristics:
> 
> Signed-off-by: Martino Facchin <m.facchin@arduino.cc>
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Applied to hwmon-next.

Thanks,
Guenter

