Return-Path: <linux-arm-msm+bounces-116044-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QIvpOB50RmrKVQsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116044-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 16:22:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D948D6F8D45
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 16:22:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=iEfaCn62;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116044-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116044-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2137D3040B5D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 14:17:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B60CE4DD6D9;
	Thu,  2 Jul 2026 14:17:07 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46FD24DD6CB
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 14:17:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783001826; cv=none; b=m8BRQGSt94/WWEOeygzD805cAe0BYDmxFezsVIHVVY7BN+pEbTM/5j0ZUH0BFxS4VjHq+/F5GQX9W0xrCMRmf6s5xERRklXCgA33dEQg+FcdOh3gzkX9uj/EbviIyLFVdfhi7LYxG5fjiP4lujGtI2NpuOBGGEqMvyWBT1MN4EA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783001826; c=relaxed/simple;
	bh=z/QCxWHRxRaxp+FLSgd4Mq/o8qVzePyKt3vk51sDvy0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g6X21BIVT1+Ze8TH4sot08SAdbQsd1y5ZBzMgCGSXYIcRx/8XfEA2AMr1jKuXwKqRHBCW2/9RFQQNGZcAJabSjQc27g3QDi4Ami/ZphyW1vz1CCqQgkHAQTgwYkJ8BiAemxjLcPTtplH5M3+SmR2kMgrNyNlNYo9vtIFQcwedzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iEfaCn62; arc=none smtp.client-ip=209.85.214.178
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ca265d6ca1so7170045ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 07:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783001820; x=1783606620; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y6e4pqP3mm87wGSrdo1SyRap6WnXTNDpkEgJ6z1bjhI=;
        b=iEfaCn62TKPq1cAksHpKNReejADMTXqwg+XqKXJxq/GXoK2wkBU6Hlkos5qswagTzG
         lwpA3pRt4I4Er1GGZvP8GlEAII93G9dG3Cywo9UWQXN3RLLDA4VerYy9gwWT72E/AszT
         RpFXCN/4SqrruzFIztDY6ViSZqAaliA8CMtkGx/SK5S9UDIOwX63T/UzoRZVLCAw6NoX
         i83bACQWfR9d4wCkKWzev23so6B/gZMP5IqUuHl+k0q1Rav78fznRrDROlgMvxYNi4XG
         6SCw4gG4yhz65acqm5odvlj7w75KXyOx9gBpNQFnUGZgh64rzafziM5klswFUVPKn2Dh
         eN7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783001820; x=1783606620;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=y6e4pqP3mm87wGSrdo1SyRap6WnXTNDpkEgJ6z1bjhI=;
        b=pVfRC7BJWiAYBH9g9KRodnYQvkQ45DMWPhmFz71bwsW4gIDyKFw6N4bnrV0LONr6lN
         oqDjpvc5yNzX3Um723R/wXXvTqZnWh46qyDX5LJOBfRfhaIXCNbCk+Yyy9oNUaMatDXb
         w3287bjya/HJQpASS3675R2+6ZeBex/G9ff2ZDsLV+DfW7CmLeO8QNnSSXK+RreCU2DL
         y0wB/StzD3CvnPthByYEU3gSq6EIKmXuGgmBYMy/prr2ubEMf4AKDjcDWwcnqnYfd/hU
         shrfIFP8WBCqYjBKp8LOu6W5niDzeIDf/5B2adu0JmZq34o0gor3YXhVFTZosZ244GQ3
         dGNw==
X-Forwarded-Encrypted: i=1; AHgh+RqQwvmcIB3JcbvZr9AI9g4OWr5y9p/vs2TuvbZTjwCKF/kVZw+aUXi1i9xPx6nORSR8vT9v97NXPFwFvq/C@vger.kernel.org
X-Gm-Message-State: AOJu0YzIIbiLT95VgbnngMB2Yre45F1Q6qi5d8ZxsLgOVIUTAAOE0Mlx
	AWYgaStlNTwV+nvxsNWq5+Y07bo1j+ex34XbuhAa+VM3X0I5OzKyHHtC
X-Gm-Gg: AfdE7cnkSHUvIpPmXlHID6eD8A5iOSNUsQpJGMVakU4QdWfMp7+UrOk453sTVV46IJJ
	qhshChtvUYOqEuj+tfI83YsS8JX/Fv4BSUVrQCM3jgVIn1ApmI8++63K4mNodO6VMGv4rWD1fM0
	cCfal1fE4swTl6KtVwbuI/4rYsbqvpejhJDtqofas9mr7euJ0xFUwwXi39Ypcx+40ctcz1uSUTC
	jLZEnrb5rTyQFlsx1cESupLA8nUcUn7TljM7/4s5T71AxAI419tizVf//5LTvOcDZN9GDddptzr
	65ViAwcQJ2mYdjFeMo1rEQ3lhMwJZolA1kEhq0p0C60o9eZdRBI4K7oMb2shxjmAmnaqdYZfIdM
	LMTTxy9fH9mvygCeCtGq9yRGsJwa40/I2bOhuBPe1LzC1JAiDON5VS8HiUoBJLtrDLq+cdMmV8O
	SUKNrUlTqUMb84mak5qZMGHSJYuA==
X-Received: by 2002:a17:902:ccc2:b0:2ca:12aa:a390 with SMTP id d9443c01a7336-2caca49abbdmr1430485ad.0.1783001819551;
        Thu, 02 Jul 2026 07:16:59 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca9aa009a4sm14177615ad.66.2026.07.02.07.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 07:16:57 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 2 Jul 2026 07:16:56 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
	trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: watchdog: Document Qualcomm Maili
 watchdog
Message-ID: <04954526-126a-4470-ba9d-501b943dabe1@roeck-us.net>
References: <20260629-maili-watchdog-v2-1-5cb9c83a581c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629-maili-watchdog-v2-1-5cb9c83a581c@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-116044-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:jingyi.wang@oss.qualcomm.com,m:wim@linux-watchdog.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_rjendra@quicinc.com,m:aiqun.yu@oss.qualcomm.com,m:tingwei.zhang@oss.qualcomm.com,m:trilok.soni@oss.qualcomm.com,m:yijie.yang@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-watchdog@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DMARC_NA(0.00)[roeck-us.net];
	FORGED_SENDER(0.00)[linux@roeck-us.net,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@roeck-us.net,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[104.64.211.4:from];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,roeck-us.net:mid,roeck-us.net:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D948D6F8D45

On Mon, Jun 29, 2026 at 12:09:05AM -0700, Jingyi Wang wrote:
> Add devicetree binding for watchdog present on Qualcomm Maili SoC.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>

Applied.

Thanks,
Guenter

