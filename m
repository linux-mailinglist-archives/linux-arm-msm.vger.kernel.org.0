Return-Path: <linux-arm-msm+bounces-101270-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +J+aLEPhzGm0XAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101270-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 11:11:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 190B0377529
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 11:11:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CA49E30CAF14
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 09:03:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF7223CCA12;
	Wed,  1 Apr 2026 09:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y5iZzCMe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8A43CBE6B
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Apr 2026 09:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775034160; cv=none; b=jZXuSKiEEqK7Jlf7iKSVdCrTeMESKLkBs2v7RFAdkvwLLwjHM4XJFq0C9Slb7EIyqEUanYBKbqWtmgHdEoCgQEt+JfFqdOsVVFxeP/c9+jbGXVxF2PNdB5ABa1Qt+aUhx/0NS2RoaWkxQOrItNDQWpmpTVEqlwXs2+4SP6uicC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775034160; c=relaxed/simple;
	bh=O1HK0Jj/R3UIJ82LFS+5RhJz5avmTJzqUtVQIzkvhd0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LvfD/2xIixMIGyUNeAKTXy8IjyLkq3YdH2PIGz2c6tHdL27Ik7C0ALaR5noElGaF8Zs6BVlBrP1+cDp+0GHXpkqsIHNISC+rf2hWEoN+IAIOsR/mlvnHzTI94KhcT4+gMY64HT+rWvhrwFbEZ3lWSqmsi8vS+mgbBvkq3FkCWHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y5iZzCMe; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-66b2f6e983bso8433702a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 02:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775034156; x=1775638956; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1PukhdiG5D11EUZIE0UsizRPKVyY9ijY1qfZllXyoG0=;
        b=y5iZzCMeRP9y8rFvklIWpamvKlq1Yruap7z3lTHm1dlZgQLLuQrbKWlHPJJstn6rwT
         pGrgAID+3HhEVAVxeaLusfq+3KpaBMR6ed0ZO54MW+ryREw+bTbIxo41V9awxrV2o6b0
         P/Z73/7WIH25GhbvAHtCIfEIYIFnqdJaGaWkHqElI2C8W+8taE3sKMfSl8MHytc775K1
         VfO7yvOltR9hhkKAc8fPJcBiGOTC3Tizba9VdUQfsOZuKUJke4kCoyN0RhdZRQx+aRA5
         b9pgckwqN1Ruipu4JSNHO7kZFHfRw7Q4FfxRaPiJaQIEW/qOEF4hQBdneI2UBgPsjMgX
         mvnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775034156; x=1775638956;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1PukhdiG5D11EUZIE0UsizRPKVyY9ijY1qfZllXyoG0=;
        b=q3GREf2CzfZLerKhR4qUYEPqOO/QVKoEaKXnqgveufGlx44Hmlwxld3O8L9+6c6Gfy
         lHotVeAMvZUr/DDCXAK0SjJrLn8x2LSD7msQs5wnD3h0OMQNfIN1ld9yaprKJonavNHX
         7DGlAGu8qzQYsYldnrN2+vPXSRqQhagxf23mLmKX9ku7vNVlnfZ0xEhy/lYfr6Q5r9wP
         UTq1fQRaTbdKF04xYww9JJlwNaEjgHYhSuPPf9qoWFbdbYjoq53Z0kZ4xomakOCKgdLH
         4lyCYf6jXK8yAhb8cwGCfsmDrVmkbScjuzOH4b2vLPiuJ8n0/uOg/WC4FsIuAjt5efHn
         z9SQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzeUcNAvwVZQL8/oGM98IVHjUp91yVgALyxjw+iNIgniUFtM58D7fl9pHC3H4IRHMUEesQb+AN22D5XLpZ@vger.kernel.org
X-Gm-Message-State: AOJu0YyBGHSa7EKmEb0P+qQ9YuaRDochmZGXhFbG8j2GlGD9UoeFgg/G
	enm79p6i+IX7b4iaZdjCdCjimdu7FZd7GRMdegGukNlGoNHeChdtNLsc/RKk0Vhtm/s=
X-Gm-Gg: ATEYQzyfR9/cQFVFJXk4QyOS/vfucFaJGs0dj4dOkNODks5kHomx5v5PZOkj5mB0fWH
	uKYJe1LGZDh/mm5lIwr3OEDux0ThmapdrWK9IL5GW/5ugrH+EFkB04FiW4YaUzoKAVT22OcVsc7
	ILtFLUkJ75LpJKNX7fXH5xJUB3xKBVA34xlu2DXntqq7y5qgMws/X/FLnyS/W/qMl/uAn5ZNtGX
	2um6S2vEynKk1raNh4Ai8J8mvbRntnA8p9Y/sqvnmgYjkVah70h7vQgzWzEbZ4gACks8c9Wtcxk
	j0mOo5HgD/SBMp8LYxF6OAPkhZ+VokRiPgfNCpCys9KvTTUPJmeWrEK9yaePI+uB+uWQ5NN6C66
	s05+oGrwfdZJ5Gp6W+UR3sOsYR2/ZGslREEVY6827NpPyRVgV98tO7WJxbNUil7QdTcWxJw8B1Z
	qhdbznKX/8okV3uw8ue4ILfpf45MSsGnQMKPw=
X-Received: by 2002:aa7:ce0e:0:b0:66d:d05d:aab5 with SMTP id 4fb4d7f45d1cf-66dd05db070mr776807a12.19.1775034156409;
        Wed, 01 Apr 2026 02:02:36 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.235.19])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66beb2d044esm3047130a12.26.2026.04.01.02.02.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 02:02:34 -0700 (PDT)
Message-ID: <90c88cf7-8873-412f-b14b-cb0f94028194@linaro.org>
Date: Wed, 1 Apr 2026 10:02:33 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 0/3] media: qcom: camss: Add camss TPG support for
 multiple targets
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20260317-camss_tpg-v10-0-b4cfa85c2e1b@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260317-camss_tpg-v10-0-b4cfa85c2e1b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,linaro.org];
	TAGGED_FROM(0.00)[bounces-101270-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.997];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 190B0377529
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 17/03/2026 10:05, Wenmeng Liu wrote:
> Tested with following commands:
> - media-ctl --reset
> - media-ctl -V '"msm_tpg0":0[fmt:SRGGB10/4608x2592 field:none]'
> - media-ctl -V '"msm_csid0":0[fmt:SRGGB10/4608x2592 field:none]'
> - media-ctl -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4608x2592 field:none]'
> - media-ctl -l '"msm_tpg0":1->"msm_csid0":0[1]'
> - media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
> - v4l2-ctl -d /dev/v4l-subdev1 -c test_pattern=9
> - yavta -B capture-mplane -n 5 -f SRGGB10P -s 4608x2592 /dev/video2
>    --capture=7

I get this on Hamoa.

media-ctl --reset

media-ctl -V '"msm_tpg0":0[fmt:SRGGB10/4608x2592 field:none]'
media-ctl -V '"msm_csid0":0[fmt:SRGGB10/4608x2592 field:none]'
media-ctl -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4608x2592 field:none]'
media-ctl -l '"msm_tpg0":1->"msm_csid0":0[1]'
Unable to parse link: Invalid argument (22)

Failing to connect the TPG to the CSID.

Please resolve.

---
bod

