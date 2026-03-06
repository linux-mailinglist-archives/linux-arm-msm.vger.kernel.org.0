Return-Path: <linux-arm-msm+bounces-95908-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cFm4HlEWq2nMZwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95908-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 19:00:49 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C7A22685C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 19:00:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 123743013261
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 18:00:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE46034E745;
	Fri,  6 Mar 2026 18:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JffKQ+6e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481E7352C22
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 18:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772820029; cv=none; b=Ww1cjvkF4UWMYy5LSz213CgHzNH5F4iip6FhtOi/uZsNNM1tomMv00vjN35kbXHrPqx9JpxQ1aclHTcCXyYPAewAnMzVCz9uAzfaeMpQkjUUJG42MtQyeGcHvkTAtUSh63EL7SRoxy2NuLTalgAtR2zBfVU4eJ+Z9i3mjuPdGMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772820029; c=relaxed/simple;
	bh=nFu/jPMO0Y+T7Fp90oKXBOnE6P1qus7goa3+wvgHzEA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nNRKiXfHOs2SdtFOTLslCFHBTJ7ugJU1tGGVPipwAGdImT3oCVVrYdWNNceF51x1WyE2+SBdULAIf5AkwJ96dfOWobkQ4+H78L6eL7ytXs/0n45BeqZj63gLvSfgU5l+/KAHmgsBkSZfaCFO43HXNV5EvAcKMV+gAT+Hto+Pi/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JffKQ+6e; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-439ac15f35fso6114914f8f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 10:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772820027; x=1773424827; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OQP/1gPedcx94rqwFZeBLzMOhFlSjadtYi29kmKkpXk=;
        b=JffKQ+6edSUUmE9ublqTc6uGF11Ew0rEPv/vaywK5WScCgbIvB/cafkUPza+Mz6qHP
         2aK1X4f3Ixll6oCyFYJfYPmXOeB/3RJU0WlpPZhbc6VUArHeBLYH3bNfZS/KwLDen4dy
         Wa87eprkmXDzRqd6O09kuCVhaX+pWzN4rTA7+ZK85iaxMW0MtY4KJnchiL5ZoQhJm8cB
         1Ed+uXyBo61rbI77HOAKbTzB3eepVJ++lPLf0qyeEmM1WgABNcmtzZHyHzW8bZPObsHj
         wlGPUdA1Pf62DCxf/i5ZX6CaZqeyESgzsRl+6VXtBc0QZbDUHbCYWfoVmfNygDDnVfZ5
         s75A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772820027; x=1773424827;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OQP/1gPedcx94rqwFZeBLzMOhFlSjadtYi29kmKkpXk=;
        b=DRvqq1dq6eepuclwbV01wduU7Jo4S2XVySQO8TxPnn+3dMKTponfDf7Q2ECLNkaKbq
         N5TaxBdDY7aSwnA0KQwxbD1O6eg+AUylcqH+Jgvcep6gSbvXy+gQrfGcnEASawGgh4VP
         aheApOAQ7wCq1bkKALcc9Bt7jGrJ3bH2aeZq8FR4t08JdY3FRapzaQsnMXnUy/bTSeBH
         U6Y0W4Zbg7Ng8KiLtB9p1CaRzqxQ4z2DZGQE+SnLhlyex5VpzyE/XrUFZNqLFKl6AW/X
         zldNXax/ZSG2PjifXmNnOqEVU0B7XA3o6tekxlqK9oWQAWGwBedS1dLjZNqYRidcBZlq
         /POA==
X-Forwarded-Encrypted: i=1; AJvYcCVrNjA8oz/2rxiSKqwJhWozJUFgYZDCBI+WD5/Tn0YEZjXi3N+eIqgHZcR+X1+14Fn+V2XE/uC/s+Ntf3Iy@vger.kernel.org
X-Gm-Message-State: AOJu0YzRAJkVxtbHlhH8BDm4N9WMqOmZs3Pqlvtj6f9sS0zYFtmPKKNk
	MNyYR7YWJLRbw0eNIPAy4BpA08oPO7Rl4pl4NxXJCq2ngS5SjOi3hR/wiokNooMfom8MR4et4Pt
	ahqzX
X-Gm-Gg: ATEYQzyqKJ3EIJ+fc6vQLhbDYavBuHkl0nIoto6ZorMDFMhPdj9CZ1G+Nwl5T8LvOos
	UjJ5Oln2W2JWJy4K7MhCOnE61u5OKjvGzi7hmpVfPdFumD23siPsqsyHfLOakVQvSV3t2kRnWu9
	2odxD74gxY0Mu+mqedir311trmQ8HjLe72benOkcEB4665vGukGnMJhMY/b+kL+jaAMf1smb9f2
	IuCC18l3uA2WaEFMFDVtADNPZ/5XV7jCJkOpoa0VVEBEcpTcF/x1OBnY/Rm0PT0UKnMCO3D2Klu
	6sIgCOSuj9Qj3IiYS3q35wYEhOy9WBCLyZGCvvPfxI8O4/CzFboGfVw2MbGkmk1TjPhv5zNiNRS
	1JqzboX8Y+kXwfr4PX7IJnaeqwF+SxesesuKxfR5LikcJANdvh237Sp1BwCSYlbKjcQI0zzqEq2
	DyhM9VDDCr7WB+/W/XBaFglhHhGzYb4O5jxRk=
X-Received: by 2002:a05:600c:4f0e:b0:477:73e9:dbe7 with SMTP id 5b1f17b1804b1-48526983becmr53304365e9.35.1772820026691;
        Fri, 06 Mar 2026 10:00:26 -0800 (PST)
Received: from [192.168.1.102] ([93.107.81.172])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851fae538bsm170036725e9.7.2026.03.06.10.00.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 10:00:26 -0800 (PST)
Message-ID: <273f0a36-599f-43f3-ae88-6c332fcec21c@linaro.org>
Date: Fri, 6 Mar 2026 18:00:23 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] media: camss: Add per-format BPL alignment helper
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 vladimir.zapolskiy@linaro.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 mchehab@kernel.org
References: <20260306160006.1513177-1-loic.poulain@oss.qualcomm.com>
 <20260306160006.1513177-2-loic.poulain@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260306160006.1513177-2-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: C8C7A22685C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-95908-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.955];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linaro.org:dkim,linaro.org:mid]
X-Rspamd-Action: no action

On 06/03/2026 16:00, Loic Poulain wrote:
> +	default:
> +		WARN(1, "Unsupported format/bpp (%u)", format->mbus_bpp);
> +	}
> +
> +	return 1;

An error should return an error not a default.

-ENONOTSUPP, -EINVAL, -ENOWAYDUDE something to indicate failure.

---
bod

