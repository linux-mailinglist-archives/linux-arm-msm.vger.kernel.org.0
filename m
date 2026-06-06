Return-Path: <linux-arm-msm+bounces-111469-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PS17GsDsI2ob0QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111469-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 11:47:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E529564D074
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 11:47:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=pKmKzDwN;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111469-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111469-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7B9903019F18
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Jun 2026 09:47:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F54C36DA0F;
	Sat,  6 Jun 2026 09:47:39 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8249632B10E
	for <linux-arm-msm@vger.kernel.org>; Sat,  6 Jun 2026 09:47:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780739259; cv=none; b=Wi6eqcxC/LqbM1LTTqRUF2cf+xYeekr4CwFsSHTyJ5q+PDY3OxSSMAy+UJU7B2ft+pnbAEytouUd/UePm4OpH1AX/nhgPd2SohvY+ofzr/ukctGARCKlBSyY3B+4raZsj7/vZ/1rZGhIQq4Z1+i+XdsYF1jF5RySx81KrVnsViI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780739259; c=relaxed/simple;
	bh=dfbJ+EWcu+qwX4wc1kVeJ9LjStQyA+kApQ1hLf4EzsM=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=rYBIckVKfZ3gXdEH4Y1D9H1SHuRHhjhYZ/UupZ/7zMq8XLBE1Sqv5WTpRqEC4bmbFN1BbJGfBW5Z7kgcbp+DA+eBuSqBL2I+INTKNOsdERAUUJqy227wcq5YBrb9lCWN/4xdX9sMh3tetbxX5cNODrxGc12hwUe1OSqvlngO9SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pKmKzDwN; arc=none smtp.client-ip=209.85.216.52
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-36bb3551f6eso2375162a91.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 06 Jun 2026 02:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780739258; x=1781344058; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5q7DKTHGkbe2VJFMOg9H6r7IIduPY9wGngpns0hKbcc=;
        b=pKmKzDwNbR2FHrwFxVz4M/mn8WVyZh/pqPimAIboo4buQc4d32hm1Q1qSbv9zIjDSu
         yepl4/tImwDB/cmfmxK1J64Kf5ZgZJsmw29Ut0+hmcyvY0Y8FfcTryq2gxTNyfQX/Lvy
         jw8Xg2fgl72dVKisL6mgYRnmObvU/of/U2vg6YcqOwsQ6UwsBpjrRZ2lZnLuP7MuoDxl
         oXTtGrFE9LeeoG0iG0IQRwnCuNh550KLgVeXv2KC9v/hYOfyN3d1PvcBcP1+1Jbxpr/h
         43SOLZKOKULI4ETeW1VUFxZt6x2vDoaBkVou/u7e65RajSoKYjv+Bqh1EeX4WEkqqLEH
         wIIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780739258; x=1781344058;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5q7DKTHGkbe2VJFMOg9H6r7IIduPY9wGngpns0hKbcc=;
        b=mfd3obqpCP8mEuMRbo/0mlzay9qfoqslbfMSDnfU05mzQN3940dXWnWwjjhQHiU4bP
         qqsLPvEAjI8k05O6AABJthcaiYRg6Isa1UMCWmSK64eRVCm8ieIH3MtTpw3h0ankAADY
         6fpdVNnPMwgGkficm4CFqKpoyD6+4N/RJe+LFVWPdfm422F+xNoYHQlKWyFD/72tRDv8
         aQSmwr/KiS8hTd9GvDedr4j+otHQSUx/LCcT0CtnvmC+If9hXa4QKe2jsyUes0cKVMqX
         1L3GfagN/XtzEsacnxwHyk7EMXolDS7Bj63yBbM1DvLjP3DOguIllFv+eTN8zR10nr60
         czrQ==
X-Forwarded-Encrypted: i=1; AFNElJ/3jUFJoZUJjqWAp1v5VvVqZT2+GGQWidbBcTl6YlBYVdyo3inyhoR+Qs9oAVO1JAg4D+VHuTLFdTgd/7sE@vger.kernel.org
X-Gm-Message-State: AOJu0YxtSdRS10jplhKbbG1TdDbRjvsAUXurklV28qih/8OKvQ80iQim
	/ThVmJugyLI6ZLaIPsAldikfnT6FXwx0TCLbdqXOeBUmwKF4jxBVo1zs
X-Gm-Gg: Acq92OGcxlxnDbN28Vb0ya16eblFAlhKE3awJeylEGVPY5l4uE+MBK86umcukzeSpIx
	FI3G4Fkep3eBQG+Y+Fjs468Y6KRCU2SjtJMX26pEpMN54k108h1VN+rdzDf5z4jaxNY3cuFt3pC
	PWrxT5bnh1dPCOhQqDzuLR9eMY4oNlqh23eDq64bMIRh/VQS306DOI/yy9Qk+/SZy8D+Mlfi+nH
	/9z40Nxq2KudCQy2wE1nfgv//hRVVuEkJCUIQBzAqPTr3fpsDC9eaKUKnv2MGcG6i/T+vP1Z1Gw
	e7GIYfw1QdhGu9Kwi3rson16jWJgzCV58CzX4qEvcVdwDg3ovzaOq7iJCB1gG2yEjeqqlZIaxUN
	HjYvk4OxQFVJfkpvQlYvov83W0Wv0RczbbS9C+c01yH/KaqpBwd5CqoXGkvFsuKkTaEO1B1huDI
	ZPyDzUyIZAw3xubddp7jcKxXCULJPZDrDXfGUyOzIwHsI=
X-Received: by 2002:a17:90b:3d01:b0:36b:b3f4:d578 with SMTP id 98e67ed59e1d1-370f0095c8emr8326135a91.15.1780739257767;
        Sat, 06 Jun 2026 02:47:37 -0700 (PDT)
Received: from [10.46.148.203] ([2001:19f0:8001:53c:5400:4ff:fe86:d241])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f6dba8521sm9146350a91.15.2026.06.06.02.47.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 02:47:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/6] arm64: dts: qcom: sc8280xp: set GPI DMA channels
 according to DSDT
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: Pengyu Luo <mitltlatltl@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <7ecda3d0f91b0d96bcec44ddf485ed5146788220.camel@iscas.ac.cn>
References: <20260602081451.3808833-1-zhengxingda@iscas.ac.cn>
 <178040480680.1778078.1165164069560552075.b4-review@b4>
 <bc4644a6c1e30a99f1ed5d967c64ba7f5da77fbc.camel@iscas.ac.cn>
 <178073773007.397244.9871455646149843167.b4-reply@b4>
 <7ecda3d0f91b0d96bcec44ddf485ed5146788220.camel@iscas.ac.cn>
Date: Sat, 06 Jun 2026 17:46:25 +0800
Message-Id: <178073918523.417326.15121723011916371966.b4-reply@b4>
X-Mailer: b4 0.15.2
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111469-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:zhengxingda@iscas.ac.cn,m:mitltlatltl@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mitltlatltl@gmail.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,pastebin.com:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E529564D074

On 2026-06-06 17:28:35+08:00, Icenowy Zheng wrote:
> 在 2026-06-06六的 17:22 +0800，Pengyu Luo写道：
> 
> > On 2026-06-02 21:21:27+08:00, Icenowy Zheng wrote:
> > 
> > The magnetic keyboard (USB HID) can't be connected somehow, others
> > are
> > fine, such as the spi touchscreen (not upstream yet), which utilizes
> > DMA definitely. My config is here https://pastebin.com/SdjuyJYk
> 
> Is this a defconfig?
> 

Yes.

> BTW it seems that CONFIG_ASYNC_TX_DMA needs to be selected too for
> exhibiting the problem (because there should be "public" GPI DMA
> consumers to trigger the stuck/reset).
> 

Is this still necessary? I checked the fedora discussion and your GPI
DMA fix. And GPI DMA is only for the QUP-supported peripherals as the
binding mentioned, devicetree/bindings/dma/qcom,gpi.yaml

> > Which device are you testing? Please attach more information if
> > possible.
> 
> My device is gaokun3 too, although I used the mainline device tree.



