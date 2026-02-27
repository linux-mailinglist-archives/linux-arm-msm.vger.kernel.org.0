Return-Path: <linux-arm-msm+bounces-94418-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WIkWHA5doWmDsQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94418-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 09:59:58 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0D41B4D56
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 09:59:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3564B30AF854
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 08:59:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4648D3B52EB;
	Fri, 27 Feb 2026 08:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Bkt2ARzV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C363E3A0EA1
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 08:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772182740; cv=none; b=sMH/d1lPMbPtdVTa+YLIoJhLrhv6Unr5glWv+fWACQlYdd5GW6g0KT7FgfNieFikH4gi3jfBx4PJH0Wk1RPX5+sVAvi4UoxY8OELhu1QBN7sVEUwuvJ7mXCjBbmKxf4+SZFDWw9V91EDJXSgyp2Jfz3pq2+r5NOIr2xWwzlXrc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772182740; c=relaxed/simple;
	bh=Rab/Jz8s2Uc744fMnlW79JYdb4B3JVTjRt9ymGtF/MY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O9vkq3+3Pbjoa5tLMRM/UhYMy+j0PkHbQt+rjEWV+PMeXalgLlwDaP/8c7y15Y8ifv9uD859mdTHVVVVSAciHP8C0iEe/D+ZOb0DO9zeofNpQa+J5L004tmfp63IEtgHRgcvdmqNotCMdHLntlNdyUGYrpcAfTHg4zXQlUlFkoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Bkt2ARzV; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-483487335c2so15476775e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 00:58:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772182737; x=1772787537; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PZj4vcPqGU2PZNqfUYcmBKBz7k0/XrtLyYeVPXSafZ8=;
        b=Bkt2ARzVpwPQAh9XvhHSQP4SLu0YI3X8jswizkDhlpLhmqT9obhxg4tp7zf92Doi5M
         1uEX3eYeg0eChfjSfC1+O8FxxBjY04lTO4g7ajtfdXjtPcFaoB3xwPFVax00Mq7p4Fa6
         QM6P01q7+iiSKNrUMJ6s4/Rk8Em70E2JSI8hdOlJQVN6Sa1yQ/KA193IJrfmkZQpTZC3
         R6rwYv6RBKlLhUnZHRBapIiYhC08SxR+P8LHxTFyLEvPJSbPjiah28ig4PlNhy4shhBg
         czkD4W2d/zun7limMH5+l2GiO4cIfFn4bW78fZFauRAW2Ig2JWbEfmF6BWRcEF0105ah
         bMMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772182737; x=1772787537;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PZj4vcPqGU2PZNqfUYcmBKBz7k0/XrtLyYeVPXSafZ8=;
        b=jUAp0E3rdWboku7V0xc+kX8gBaTLN4PzG26Xi8Z1kubT8HSGg1fhBQsOhMVu52Wfdn
         sP9adCLnm+xQ8k0CM+VA3rnV3ZePJXJYShK1bnaCkEHDHjfs+QYUHGmkeXnAh3Ck3Awg
         duYpPU+izD9FaZZOPBR5N03zJPsOmRXqoIyf7Cm3/q1bgNIyzabMjcK0cUP28tUKDgCO
         otSFIInYAIx8BbftZO2w5ELV/eGzYjwxmm35SLJnOpsJsGJTW+TQKgmUY7nEZcPKnKwC
         1dJaHW3o5lei+T7cs1gH1emfa8cRHM2+Sgzzz5vbYqmfxUdgYpH2R2PTPnZ8qZmN9h9Z
         LE7w==
X-Forwarded-Encrypted: i=1; AJvYcCU3w29JRKzDnef5WBhNe24FXEqtVdtAtGX7LqBHvg4R4ntG5m8nmaagn2PpmWE0abfUgjk6tId7SwYBw6Xb@vger.kernel.org
X-Gm-Message-State: AOJu0Yzaqh1UM4WyZHYSniAqT2M/qeCIJbu+hvMy4GvJDc7uVmo+3SpT
	1jt+x1ts4CynHN5+jIooyOMgu8Xid+QLzreUP1Hy9P9zdiax8fVLhSy19NKrNV7SiA0=
X-Gm-Gg: ATEYQzwTir1sxP4ugZWzrUVF+LIr6gZK0tZsdxbASSefl4b5kmOhHglUhOCems0mf24
	KiXrG95RGtIcaxzQaStIlSQP5+iEdSvvvI347JEf6RG0Zqqc1AAHdHOu3WiPeHwkk/J3dwvuF73
	c8sFfltUOGv9+9QIgjybwXv6w9yivmz73l6ELD6aTQMxTHmwC1mhJXgI3N4EGNzEwnWzdyhcQA3
	bAU+9kwS0AO6UrttiEoMANRda40sBiv1bpTMAIEbgwWiX3Bn7rZnX6xr3NOa5CksvN4KjxFwMWm
	I/mI2bIKZzK7nHSzl3VLKxtLvqEf15HtLP9W6DsqCQ1WDUj22m6gi82+NWttavGzWdJ/zJ+t5US
	rXqlLeIqGY08eyWwlQOfZI7QpbRb1xCp8kpKxcgmOC11M8FbzzKF0K8ZZExnTmp3TSXfPMixMom
	IMpNhGKLS34wXR4LwL4wfgLc32BVQyezNWJIa53oDxX+rBw1JmWDXDcxSdngxmIqu2
X-Received: by 2002:a05:600c:3e16:b0:46e:32dd:1b1a with SMTP id 5b1f17b1804b1-483c9ba38damr29772325e9.7.1772182737123;
        Fri, 27 Feb 2026 00:58:57 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd750607sm201855375e9.10.2026.02.27.00.58.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Feb 2026 00:58:56 -0800 (PST)
Message-ID: <5d880b56-a3fe-4677-9751-feeeea8dc2b1@linaro.org>
Date: Fri, 27 Feb 2026 08:58:54 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/7] dt-bindings: media: qcom,x1e80100-camss: Add
 optional PHY handle definitions
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bryan O'Donoghue <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>
References: <20260226-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v9-0-a59c3f037d0b@linaro.org>
 <20260226-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v9-1-a59c3f037d0b@linaro.org>
 <lxkbmpzqgkxdnanetardqhqpyop64ri5sawu3wta7hzjibbgzm@zyrdsfac4wvq>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <lxkbmpzqgkxdnanetardqhqpyop64ri5sawu3wta7hzjibbgzm@zyrdsfac4wvq>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,gmail.com,linaro.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-94418-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.992];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:mid,linaro.org:dkim]
X-Rspamd-Queue-Id: DF0D41B4D56
X-Rspamd-Action: no action

On 27/02/2026 00:02, Dmitry Baryshkov wrote:
> - Add CSI PHY as an optional device node under the camss node.
> - If it is not present there, create it manually (by applying the
>    platform-specific overlay, by using OF_DYNAMIC or just by creating the
>    platform device manually)
> - Migrate existing platforms into using the CSI PHY driver (ideally, one
>    by one), while still retaining the backwards compatibility with the
>    current camss ABI.

Even though this is more work, I actually quite like this suggestion.

Provided the DT compiler doesn't complain, I think I'll take this feedback.

One reason for that is indeed as you say, we can reach back to older 
devices and give them some love.

> - For platforms starting with N+1 (the next platform to be submitted or
>    merged(?) into the kernel) make CSI PHY node mandatory, keeping
>    backwards compatibility code limited to the currently defined affected
>    platforms, which unfortunately means the following list (I'd leave the
>    question on how to handle the patches currently in flight to the
>    maintainer's discretion):

---
bod

