Return-Path: <linux-arm-msm+bounces-105963-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CHqaAe/s+WkLFQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105963-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 15:13:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 987F54CE38B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 15:13:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C3D78303C63C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2026 13:13:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA7D7439005;
	Tue,  5 May 2026 13:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nQPLcvWT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B682376FD
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 May 2026 13:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777986794; cv=none; b=fNTSqscraSXnFf1VHFKT2Cb5Zpodv/zhUhaNHBv6apbXuxtqqSF7PZQI0QLa9R8pazV5TTDaHuCDTJGgIg7HoqgxzRdayPLDuKSdTGrpNwz2OsLUUc5ybeEZmtKtzayJ1Ba7QSHqIxgJQXUuFjX6MDlNvcIjoMu5nQTqHruyu/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777986794; c=relaxed/simple;
	bh=cPpKhsX2UMrPQeRlYuGPuiw7pA6uSGlu1ci+oZalnEE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ceniTCHR1Buh9r41cXhzBMqh/K1umQewdsQO3RWfSWmEszw5GmKBkILatfxhSX49IVXmreccHAyogEWsrUBjAktRtzrcKvbINJXEHyy4ec/KWt6rN8zanL7lBBcxrnPAG2oX23esUrq2VkEZJ+enLswDEBzSdpK7nUdHQcUGJbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nQPLcvWT; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2f0ad52830cso3873022eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 06:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777986793; x=1778591593; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CbKzX+LHwufFR/q2Jodm0JTpS+wKmq0Ba1unQGm6lT8=;
        b=nQPLcvWTKEv9m6bU2gnbmL0Z5Xl+uN1PDyH7wgKPGjg8dtp6YZvRoUbCl/xdcBH4GS
         KV/OmMQHPUIddbLqvcmMpxZDrRd5ZBEyVBKdJeUuhGPN7p7gIn4yh1t9PIsk7aRwDO8m
         YIq7SUU2ue/bN1y7HI+BDF8Crl7ZF0rvwqSQrQ/vM1RT+DFBTIrqI0IZQzZh3LyuoApi
         r3hRt1tBbXOdMTg7+WdsnBSW+zjwXy1IkH6EQFtx91qVzEjLt4c2uc8pn8wf7x/47Q17
         FCmPW9I2kVLEIVvbk9AZG7kHMhTV3BZY9L+r52vMEY47cRhgutDEodoY21dCnBSGhgGh
         3iuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777986793; x=1778591593;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CbKzX+LHwufFR/q2Jodm0JTpS+wKmq0Ba1unQGm6lT8=;
        b=jQlAAl7LXoxSX7IoUcJCSzuGVExECt6CmHQ6yyexQCK2Av4Nrb5bW2PeVlmncyIbjP
         Zp2uAS33Qj2iONz1pbevPB+1D3Vu/c/C1OUoWQYzg0AhwS6OXweGpZA4skeMHKvDbEpl
         F+zECj5Mxa+dURZvzhfM5Vp6QieqiggUDO3EkMCq1kfLnE6L7LNBcGKBQ9Yx/8qDqCyG
         i8c/Jks7ps9mhIUd+5U9qpgMWmmH7Xb4RRc8f4EHq7evRG3TlJnoAEKvTprWtznXKPxq
         igKetK8so/Q2ZO4lqKqsKmQNiILFZVNiRbOoTKT1qng9tDfE+E6Y1ZikmwWlgMgII7Bj
         Zhfg==
X-Forwarded-Encrypted: i=1; AFNElJ+8PK7+/rhWJGq9KmagBP6fgpRKarbcgvYxiSpq20iuNmnf/75lwxhUMge3/kATnVUz5ce7tJFcmbLEbIdJ@vger.kernel.org
X-Gm-Message-State: AOJu0YyGPwKCbsFzv16rjjcvanLqjhUNt+Es/Ldx8S6X54ABk6DkPN6U
	piP4WzY0yNOPKAuFt4lPhKQ9VY3TCWP7HBwi+n+bLfwXWTJWQDe20diZ
X-Gm-Gg: AeBDies+JRZdCHdQqKOIWb2bL7ogxH4GUAg1UWblohYfAg7IRVOHf2NZD/ejFkj4iZP
	1XGXlo6Azae/nBjO5SsrmUbDTzHFcL0bziXKIth8Zm2tdM7oCQP8w0NT1uqucMEG0Wf2JPgU5ei
	ojis5vOVYAto9nzHatpBPg+XIjlX8YxIZQ53QBcXY2q+UoALsdsemNTQ7QKlqAnwns4L019g/pP
	6elGW1zSgeZ/WLMOpa9+jUZUbTZ1233mrO1UW850DMP+YP/rHNq97KCgkHxVCxuikw2E2GpChaA
	Fg26AedeSJFR29fvTaCqG7yjOBMvMqXjX+cdv3oNdLiOQLeOkA/N7lItw0c4H6QZ84EhTbsuqht
	kcgal210C1kTelkpTwtD6GISLL3xFByrnogptkDo4vikBVUHfqra/9axqEKGMkbYvBo2gSLjaOT
	6xX2trnJS8uFyMrLGCdm5DlzM61L7t5FuxLvQbEKS6lTr9zNg=
X-Received: by 2002:a05:7301:5789:b0:2c1:7afc:df06 with SMTP id 5a478bee46e88-2efb78d70c1mr6430271eec.5.1777986792552;
        Tue, 05 May 2026 06:13:12 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee3bf67a3dsm20289695eec.27.2026.05.05.06.13.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 06:13:12 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 5 May 2026 06:13:11 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: watchdog: qcom-wdt: Document Shikra watchdog
Message-ID: <bd44646d-a749-4014-9efc-9f6c0c13740e@roeck-us.net>
References: <20260501-shikra-wdog-binding-v1-1-fd8c14bc2d20@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260501-shikra-wdog-binding-v1-1-fd8c14bc2d20@oss.qualcomm.com>
X-Rspamd-Queue-Id: 987F54CE38B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105963-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[roeck-us.net];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@roeck-us.net,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,roeck-us.net:mid]

On Fri, May 01, 2026 at 11:35:49PM +0530, Komal Bajaj wrote:
> Add devicetree binding for watchdog present on Qualcomm's Shikra SoC
> 
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Applied to my watchdog-next branch.

Thanks,
Guenter

