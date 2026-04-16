Return-Path: <linux-arm-msm+bounces-103452-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GHv3OAQW4WnoogAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103452-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 19:01:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DFE3412407
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 19:01:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1148C3015871
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 17:01:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40BB02D73A0;
	Thu, 16 Apr 2026 17:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mbhw+e6Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D077126056A
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 17:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776358858; cv=none; b=a2FK/FvB0OdDNSLtSdWbDOuJnyo1mDC+Mcyw7GBlgbGmmvR+P8Pbmyhjoryd4DGLDJMF/qkDTBtwWOcZh2PATWb4UytEDOow87KeYN/fRS0NQlr632vpVpQTxRNot6UablzrZciymaSgv06YP/jDUVrhTiGUEoK1+LwacxZdGgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776358858; c=relaxed/simple;
	bh=1CZuCyQ4F7gIhJWlCZS7gOU94W9dFudind/rqbdZLnA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m6+wDkubF74E1JW6pMp+l7GSHzke1Pangb8XJxajQ/mlQhR6TXwy1ACy2oIP5oY/Joino8nzmSpcEKhblHuTZT6WHnFrguBi+E81XvUBGYgAsdoCDffY9poie7D8GXArHLmTevwJHU0vwNkVEfhFqVwaGs8DxpPyQviMDlTD/K8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mbhw+e6Y; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-38ddeb0f5abso67307431fa.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 10:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776358855; x=1776963655; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2VpkNf2axxZW2MI3QuLeduQYZrK6zUSn2neT924zAFg=;
        b=mbhw+e6YOzTXs0axvtFDK2+Shs5RZqoVEKCp4AiAgq+9DwRWx/afofi2IMKkEHUZCt
         /v8DyZQ0NndvOt7baJCgUpaykGAuB7kSdhZ1em53Xy3V9QL1HrIjJz4VtQ3NksC87EkX
         +k8GJ/l9vB9wD/9PVjyIxaONFjDDNBWg98iLXqHMRHZjF5FXAARbcwn1fCfj7Jpc5zGo
         oK0REA0bewgZPuWYwIGYuA1msjcWuilTOCxj/F7TRN4jYV5mJwosrU+LnIloky3GzBSu
         ZvbfgfFAfo8BTJ6UQag0K3iJQnhEwEjpiqFrE0WEoTYVztEZLi8tnTgoF2IqZw+bJH2d
         Bc8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776358855; x=1776963655;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2VpkNf2axxZW2MI3QuLeduQYZrK6zUSn2neT924zAFg=;
        b=g6C0nrRaynxnr0bByoFUG2scoRi3Lte/Tphsp+y25fUUXmdBwFAaB+7SBXDKGhtkxC
         6b49E9h5/3sZPDsoxVl2mwB1shGzX5ZkmjENffg8JTILW8c/8Nx4uUKqDiqyIoffQIhl
         D4uJaG0/i2rqIHEyBWuGsULsERa95YzEJwdl2X1S9T/79dEAzvVEQ/f0qJTMx5EtP2y7
         1PWEHUHEmCNBtr97lXZNHHNR5WmlbLyo4BATDaQznaww6CNlN1YtCZR15PU7wgSp2qVd
         JVuZE0b6mkOvyqNui5JnSfO5LigbelV2UpzsE4gWm4t7aya9nuTrfVWaJOV/Zy+qgFsQ
         Edhw==
X-Forwarded-Encrypted: i=1; AFNElJ8bVth2acm8cwMMCAPKvkMT2rNIvDP+Vu5xqud0qclSyK/kjygVxvx2C4t04DYnem3GjSLX4IwwuEmopf4R@vger.kernel.org
X-Gm-Message-State: AOJu0YxknZrvhYwaogkosW2GQCMjNId2DmD8GPlZ6/lpJdaFKUB556sU
	/8r0h7xLAqLAop6bhkD5QhBw2cSvaN9MrhcjkNpWux2l1l/Mj1SwO4Qb
X-Gm-Gg: AeBDieuloSZmQoUZQDVIBLV/V+X7ZHhiYhAyf+E89O5ffvLJg2QCyE6Dz7XJ/udMTpl
	zZklnBpV954MYsf69zaYujVQLW1Gusts6qk2ISRa4+NiZzoOC7hPDLEPR0tTqdmwvASkH0p7Hqg
	Kz5qyWe5Ptpwccphkj+elpo2lf56ayoGvap8a5ihtzFkeXAH2TL6x+Kpfy0H1EYqROfjLl44NhH
	XJal4lUiqhIP5UGQcvjd4bdJbzhIvJpC8ShT/+pjHbOL24KVQ+/U0tH0OQ8k1Et6oDYTFpPWniP
	zY+3vM+M62u0cHMXjIqLsMjvgyj0RS5EkpysRls9l7uJRQoNaHT+T0SNJHD34qN6syrg5COa5ON
	3ENhXg0ALRDbXTt5Uqz5AmXz7J4pom3CWh5WT7GiUEBW8sPxB0NDXcauWFz7L0Qy5JG2nq7J8k8
	hISMeUAU0wSLl3mls8MLsHaaBl6dl8GRUg53sURtCaD4wQO29AroN9/FNwzKeVVg8skboxMv+QR
	8M=
X-Received: by 2002:a05:6512:3405:b0:5a3:fe5e:3d5f with SMTP id 2adb3069b0e04-5a415540f62mr51697e87.20.1776358854697;
        Thu, 16 Apr 2026 10:00:54 -0700 (PDT)
Received: from [10.29.244.82] (m-37-0-167-201.cust.tele2.lt. [37.0.167.201])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a40a272e14sm1416433e87.3.2026.04.16.10.00.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 10:00:53 -0700 (PDT)
Message-ID: <6b8f767b-98c3-4e31-beb3-20988f764359@gmail.com>
Date: Thu, 16 Apr 2026 20:00:49 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 00/10] media: qcom: venus: add MSM8939 support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org
References: <20260416-msm8939-venus-rfc-v1-0-a09fcf2c23df@gmail.com>
 <b7b6c3e7-f8e6-4b73-b17a-e5e1691a54f8@oss.qualcomm.com>
Content-Language: en-US
From: Erikas Bitovtas <xerikasxx@gmail.com>
In-Reply-To: <b7b6c3e7-f8e6-4b73-b17a-e5e1691a54f8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103452-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xerikasxx@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8DFE3412407
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

>> 3. MSM8939 supports HEVC decoding, however, as the patchset is written
>>    now, it does not work. It can be enabled, however, it will result in
>>    breakage of Venus for faulty MSM8916 firmwares, because the code
>>    disabling HEVC for HFI v1 needs to be removed, and as per commit
>>    c50cc6dc6c48 ("media: venus: hfi_parser: Ignore HEVC encoding for V1"),
>>    this would break support for some MSM8916 devices. What could be the
>>    best way to work around this?
> 
> if (!device_is_compatible(core->dev, "qcom,msm8939-venus"))?
> 
> Also, you mentioned HEVC *de*coding, while the commit you pointed to
> disables *en*coding (decoding had been already disabled prior to that
> commit)
> 
> Konrad

From the commit message I assumed HEVC decoding had already been
disabled for the same reasons encoding was - faulty firmware reporting
codecs it doesn't actually support.

