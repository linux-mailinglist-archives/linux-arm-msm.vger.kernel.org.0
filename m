Return-Path: <linux-arm-msm+bounces-97964-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6FCmOawGuGkWYQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97964-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 14:33:32 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5D829A770
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 14:33:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 98700300C7E8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 13:31:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8A5E361663;
	Mon, 16 Mar 2026 13:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hT2xsFfY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE1D28BAB9
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 13:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773667901; cv=none; b=db2XuudcQf9wCN8BiZF7AeqYxq9jI0exHhiNyS3D62eJ7aEPmLfiEn6G8+7Zwj2WBtB464kzCFhWgkiwWI2CtIH7cf8LAHcuEUe1OiVhCVoptoalGvC4prSbvHlCGKDnRYJlg0Y/iYRvtcclmfFEFro563V8oEP/DhK9Iloo5cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773667901; c=relaxed/simple;
	bh=aJqQvVAQBWgcK77WFtfzdrvxuw8KdvubRhFHqAKTjKU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tNafZs2yVolWp8OFYDsLvZx0JsNBcMkFjSy3vy69/fT4s3/AdLQtAjmwDJcn6WdAvNTiY0iD+hjRAkLHdLIwxBp5IwsRfRoZs5rxFYPCuujqOyksDIk47JR/l6Gd3NzAqr0LabM1e0wfmflRMYTfhOIvCWzqP/qZH/E9Lw/X7FM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hT2xsFfY; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-66174cf4549so9018553a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 06:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773667899; x=1774272699; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AzHXsmeKQOaISuIJx9Az90TCO71/XOPX65E/uc2ZTBQ=;
        b=hT2xsFfY3JpE1z2IjVXFYF4vMux6kTgpLJj8fVubTIi/233mrpa07a7+mEmqQYsVSj
         yoTSrLDm7EWo1fhU+pwp0DbWrQY7sNPbTBMi+DFazOV58D8aPtHHzSDFQ6NshcU/bOOJ
         juz9rrDOfDz0Zqsp7TGYaie41fnDZIRmRSWVC7v/HH6QmgsAfQKn98vTOAFPXEFfw6kn
         bUZZSJax+7PH9LSFgJnlyLcmro195bkNshFEnXhJ3OlzC7N6JfVOBB1WSQpExbXRfnYD
         hhanmQV9LqR6aaSvHEmlQpVLfS+byw8xeJf+fkjhoYsEYBxUakwHZCouHctGDT9jjkRI
         fFHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773667899; x=1774272699;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AzHXsmeKQOaISuIJx9Az90TCO71/XOPX65E/uc2ZTBQ=;
        b=JERqZHm5hX+vhgyc7hPeJyEnSIifpewS9+xMjqHpUwnIWH9NzUhxrtWNVVZzxRJ0MJ
         0w1XYiU1LrDIJXb6AQroTWCXkFT4Rqa36StIn/gZvE4tJDDaaJEKTVuFsXPpKZP+8tqu
         0IacOEY5L1G4cQdIcUYfYE8xr1hFQNAC84GeDdRDmfKaiM5RZQ4fXBLv9HsOJdIfgSSr
         LMaQ9spx1lhYZTeesWWhinwGlE9i+iNAnDqEVf5OQVJC/RDHQWp7O1ELDn/nyJCxoAF6
         S0twJVn11owA/Of8ePLMPDoG4Xa8TTC4ZDKLkGFN3V+3NIQqGAIXlE5aZgvogQl1lwZ5
         Szkg==
X-Forwarded-Encrypted: i=1; AJvYcCU5d3Ol69KPAs3vbASuNCT607Iz7QjC7yDEE1D1Q16mR2+VFi8a5WdDfV4Sh/fdgdcEieYfKgdVx/z49pbS@vger.kernel.org
X-Gm-Message-State: AOJu0YyXJbbQMXQLmVQUBT+YcW0w/+m6obQKOEQozs4Vkt30VjC3HtwE
	LDQ+6lEP6YO/xbFb41cnEF2Ab1Zoq4QtWuBWY/ByOr3NVnJwMNa64pWQsKKFwFsrHWs=
X-Gm-Gg: ATEYQzz/yNh0ShbPcq29oHvM5WF40ZaiGai28jnNsXRYJO8BWAkwaMepM0w3Kc1q/cR
	tcdsqrSd2ewE8vfIO0gUEJdiOequCXgBTe+HIhHmYA71pVdsf9ykN08lVNAVynziv9T3ziDNgmq
	Y03S087QocLpCAh33gnoz5cxTruru00N1/q6FjZkTWWqGsbMz8vtqmHWZ2RbXC9EfWwwX4eMHTM
	RIAx8LRWYnKjhqnO12cjfeHfKwsyYUlAf9ArmY5m+WkMDAIjk1K7N9O8uD7/d3V8SduchyaxuH9
	sY7bzzAl2PU/ItDuDxvJxknIzhheuFhAHLsBIeBCGxVkJHtn2Aa+MgxeNo7xsm5ZdVNurFcmeGI
	uLvXTw5K868i4md1lCetulCqbmZVvb1k96BuBcsTey1aCuyWvxOFKsUQeGe1i4v4fuHHNcCSe78
	mTtaoAmBUP2sUOtfljxW2yxBhw/w3TqRZICYIw
X-Received: by 2002:a05:6402:2551:b0:664:3344:f9f6 with SMTP id 4fb4d7f45d1cf-66433450781mr6000166a12.8.1773667898857;
        Mon, 16 Mar 2026 06:31:38 -0700 (PDT)
Received: from [192.168.0.101] ([109.76.226.115])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6635088ffadsm5183190a12.21.2026.03.16.06.31.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 06:31:38 -0700 (PDT)
Message-ID: <f5d7a5e5-d21b-4be4-8fb9-25c108c1d805@linaro.org>
Date: Mon, 16 Mar 2026 13:31:36 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] Add driver for EC found on Qualcomm reference
 devices
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org,
 Maya Matuszczyk <maccraft123mc@gmail.com>
References: <20260313-v04-add-driver-for-ec-v4-0-ca9d0efd62aa@oss.qualcomm.com>
 <132116be-2964-4b98-be2b-1baae5bfb58e@linaro.org>
 <19e8837b-d711-4d0e-ba9c-e9b2c8330969@oss.qualcomm.com>
 <aabf9bfa-aa90-411c-b9f6-706f963a5ab0@linaro.org>
 <azoaku7s3lxgcccc2rrp2bljbvqeitax2bl47k7eemy6uhcr2g@kveqod2tstgk>
 <ca7d675d-139d-4fbd-b57e-5b233a0e2922@linaro.org>
 <bb38d7b7-859d-423a-9837-1b678975bd06@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <bb38d7b7-859d-423a-9837-1b678975bd06@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.intel.com,vger.kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	TAGGED_FROM(0.00)[bounces-97964-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 1A5D829A770
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 16/03/2026 10:22, Anvesh Jain P wrote:
> We need to keep the driver loaded even if zero fans are reported, as it
> is also responsible for sending suspend/resume notifications to the EC.
> Failing the probe would prevent these PM notifications from reaching the EC.
> 
> Instead, I will add a dev_warn message suggesting a firmware upgrade
> when zero fans are found. Let me know your thoughts.

Sure, say something, it seems very odd to just continue on as if 
everything is grand.

---
bod

