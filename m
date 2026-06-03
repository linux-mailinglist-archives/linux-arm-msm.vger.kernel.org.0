Return-Path: <linux-arm-msm+bounces-111064-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NUVSDGWjIGpc6AAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111064-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 23:57:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF0963B7B8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 23:57:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=IJx7vnNq;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111064-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111064-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3AC1A30242A1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 21:57:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68EA54C8FE5;
	Wed,  3 Jun 2026 21:57:50 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 759AC4C9543
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2026 21:57:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780523870; cv=none; b=rGaYgsBu8xbEFOpe7xQhI73Mxi3w+vgMuI1JKipBzmK6eCt0Rjg+Cz1tngDkEpZiyaKcvUIJg/zf6iibehK6jcFvCkjF1ip5prASIHg4ITx3BSvlXBXR5Tg2ORrlYLiD8uFsuv6Q27beK+85cSUR6OMcQzAnlM9kI9YVxcqaR/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780523870; c=relaxed/simple;
	bh=crzKQndIwLbEeYCTsWS+DnJshKb+4YhCxWRvghP+llM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bpEziKraP5y25boJgHa57o41b6TYTH62jzEQoF15gqFs1LsBeusIGjtlNcaAlEp7WX7ejC+exT9d8SFdnw+RaawZEw2GiwRnsUpwTs0c+6x55u5MtixxUd4TzQDdUFfCUxxJYG6QOttOLRFlDk/ZKJfvFm20D4u+KybTfPFn3Gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IJx7vnNq; arc=none smtp.client-ip=209.85.221.45
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-45eeea039ebso2836f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 14:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780523865; x=1781128665; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=crzKQndIwLbEeYCTsWS+DnJshKb+4YhCxWRvghP+llM=;
        b=IJx7vnNqQBzKZd/0rWN0eeOfdRyQZdvXWwHtEDISpCc6yxtYnAn9x7qbu7cgxpPPCt
         lTgP1PjeLCCMiy1NpAAL4arYtENDV7uGoSM20GN9LCGvSnMxzmOuzKT+YcPTCxfZynlZ
         YwdAVOKbGr4+e7XGrhCw68I/q4jFKyDE35ImjwPP2RCfKk1vKQtexfIao4JkAaIbBQN0
         i3OE1ST+rLg0Rieu0v0Dc6fjtqfuUf+FlIu9DSTs481297OPNWPfBZ58OChSYBgLCOti
         bWAHNZR3mhsAhu45X98Ds/HhGSnd5NilvN52MV0Nt2pqQ4ycCfZsOei94ccE5Al/rblg
         kEIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780523865; x=1781128665;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=crzKQndIwLbEeYCTsWS+DnJshKb+4YhCxWRvghP+llM=;
        b=WVX07c3sjvBkupVfPCAmtoHBu5rjeqJ3nvdfU3p9uYoNNJcKSg27my+reKLlq3XuS9
         4bDXydfIpc6EO5pHB8ZVsRqGMJeVoxWUUJQGHfZPaCQt0/60Irfydbaq8LtRAQjxZ9zx
         t9Dtloysk1+hh3fxP1DxeG/qXXsm01dfbT/OYkc/ViBBdpYeILbecj24ag4EtmqjBBZs
         rXZ0xHC5Tb/meb+dPE7aGuLiYOd21fI8n2AKR94USuXggJejXN1lB2MkBYEjrf6NPfob
         zA+y3RLRA/fJHXJWTxxZ8Uq9YDd48tfdR9rwmJw1l3ZmRYHOhTr02Aqf+HVhJaBN3BPb
         yG5Q==
X-Forwarded-Encrypted: i=1; AFNElJ+1uWOyvdYCBPa3dP/mPtmvcI5XPP5d3z4muEL+kwwnKD12Y937bUm7Wcj99ld5ZbomkBWBcXjH67TfsKOC@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0Km2MyMhLfta6AEWYHCIhXyCqYILFyBDj3DC6WGD8WAA0Dq3T
	oCXzjO8nAypcxD67hoDLh4Hr5x3xBjh9nGZU4qDdvxyR2jst85D3ANvI5r4STdG//pU=
X-Gm-Gg: Acq92OGbBeM6ANlwmngEzOz7IXAYm8Bxql0tXLSjSe0Nv/v7w5K5cgKYvtLvMN9TDWh
	KUUid9pPiG8BnvVWZQW5lH/KbU3m3XA8SyfcD6wCwDrh28RHciCmHyusLvI2gKExvxoiOs060eS
	nO1GdO8ZLjIHtuPiYjd8Y7B1lZ0Lh/+zvWS/raV7woMLUGaSeL8XW/PIC5v8UXmsJIzzBzbJqGK
	vEQTpoiIIcQDL1YqknFy1qNYJVUro7TqJJ/jBQLnkfzLleX0VLYCcAsdi3y5/vdHDHN19vt7vtt
	RGMx224giJr/k3Xd+brldjBgMwOzqwEjtoEqdoVwKzK6KMk21XtNRy1ju9oq6U+2m8bg8aYJjIM
	cC9jv+1SnV24IdnY1RjeIEgUbYelexjWwyLEoTlKukvZ0LHd+3bxl0aNDP93chIEL9PCSRPvDev
	pOB/qKGsruZjAyhWVIt200tQaFsyJzGnye0UNlJNTxeHmsodtgQY2tIxg2
X-Received: by 2002:adf:f642:0:b0:43f:e990:2f5d with SMTP id ffacd0b85a97d-46021876fbfmr5427191f8f.35.1780523864910;
        Wed, 03 Jun 2026 14:57:44 -0700 (PDT)
Received: from [192.168.0.101] ([109.77.42.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2e4b18sm8068755f8f.10.2026.06.03.14.57.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 14:57:44 -0700 (PDT)
Message-ID: <958b2eda-8ab0-4eb5-9b43-d74c5872b160@linaro.org>
Date: Wed, 3 Jun 2026 22:57:43 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/8] media: qcom: camss: csiphy-3ph: Use odd bits for
 configuring C-PHY lanes
To: Frank Li <Frank.li@nxp.com>, David Heidelberg <david@ixit.cz>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Luca Weiss <luca.weiss@fairphone.com>, Petr Hodina <phodina@protonmail.com>,
 "Dr. Git" <drgitx@gmail.com>, Cory Keitz <ckeitz@amazon.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Kieran Bingham <kbingham@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20260603-qcom-cphy-v6-0-e50de0b557a8@ixit.cz>
 <20260603-qcom-cphy-v6-2-e50de0b557a8@ixit.cz>
 <aiCfzBAbEg27S85_@lizhi-Precision-Tower-5810>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <aiCfzBAbEg27S85_@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	URIBL_MULTI_FAIL(0.00)[vger.kernel.org:server fail,linaro.org:server fail,sin.lore.kernel.org:server fail];
	TAGGED_FROM(0.00)[bounces-111064-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Frank.li@nxp.com,m:david@ixit.cz,m:rfoss@kernel.org,m:todor.too@gmail.com,m:bod@kernel.org,m:vladimir.zapolskiy@linaro.org,m:mchehab@kernel.org,m:luca.weiss@fairphone.com,m:phodina@protonmail.com,m:drgitx@gmail.com,m:ckeitz@amazon.com,m:loic.poulain@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:kbingham@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:phone-devel@vger.kernel.org,m:todortoo@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linaro.org,fairphone.com,protonmail.com,amazon.com,oss.qualcomm.com,linux.intel.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:mid,linaro.org:dkim,linaro.org:from_mime,linaro.org:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1BF0963B7B8

On 03/06/2026 22:42, Frank Li wrote:
>> Reviewed-by: Bryan O'Donoghue<bryan.odonoghue@linaro.org>
>> Acked-by: Cory Keitz<ckeitz@amazon.com>
>> Reviewed-by: Bryan O'Donoghue<bod@kernel.org>
> Suppose two Bryan is the same person?

Like Dr Jekyll and Mr Hyde Frank ;)

---
bod

