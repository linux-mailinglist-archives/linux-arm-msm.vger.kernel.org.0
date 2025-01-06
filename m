Return-Path: <linux-arm-msm+bounces-44023-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD2DA02E60
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 17:55:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 25247188610F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 16:55:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA7011DDA20;
	Mon,  6 Jan 2025 16:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NXp5E74j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 178C81DACBB
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jan 2025 16:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736182523; cv=none; b=g9iLFsrdJdL3e52fd3bfMDJinjDPkMF5zRPk86tGfkFEOHADjzvEzYsZEO7UBnQemnG3aydl3haa2sOOZ+G+v3XmKkh2IYMYU8Niv+xQKmoo5ErQnAZHX9R23h79MhHvm0nphFhhDKScReGTOihxeaHw0YRR627pFf4MT0JmF3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736182523; c=relaxed/simple;
	bh=BZKttsrsiWv5JkQfESPeIFAw/pUJecEu7sURrWKCKoc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rxK63UkDj0Hsd8/FUTJ2TQJfTJA9z70fGCjNAdfnGTFQHKilVX/BZO5cR1tpc23CAm3C7zSW2jp3+bfQ0XiJrPEZHC62ifOj8FvVTr2jbicJ6A0o9jR2oWyskJiq+rE1wRjsYoc4bLlogm2OdibrfiKnhdYTXFdgAtSc23YsVsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NXp5E74j; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-385de9f789cso10946587f8f.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jan 2025 08:55:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736182520; x=1736787320; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xX6thrDvcNDbJJ+XFOttLWUYB3ff08q7bOBIL7y2e5U=;
        b=NXp5E74jJZ+LIJlyLsBO8G4GY/9gBX/oxYjabAmV8Lq9BhB2RPEF/TLo3VSF/0YKlW
         nPe4/aqu9Wld9KAEfOcv159L2umPkdJHfabnWU2MPB7qENyyhdw3UyJBMv7art30SMfR
         EtBBteOIs65PLdBp40G3mjcfvvV6LwusMBPLmpixC4KzYTE+wlEyaAVHi/rIPgKFNXb3
         +0KmCVkefQhoCNCi15mi6fkVfvpqqm0OaSiGtfWtQ3YvkpjUQGzF/5ddrjyFgLy7u0I7
         GilTlzYp+KmSKpGzAj6VNUctybAGAVGQa2hnoZLtvWp0Auv5nv1zy9XDGMEXv2k29fbH
         I38A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736182520; x=1736787320;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xX6thrDvcNDbJJ+XFOttLWUYB3ff08q7bOBIL7y2e5U=;
        b=ExeEFqZrM855S9i8rB+LRksDX77orjNMjHRBuLxtQYvbOXPo2kPG3e5KDfImo0Mf8z
         nJ1CT7Fhy52PIo8NEsrahHeTyi41qD7MKxECgFzPyikvjbXD7uWpYMXl6JbyI7GGViGC
         VIgw9Ei1JxycjbYWVO72uHFmXIV/GmBP9VJUnsIXDzm3QdxS5VrmVpQRLKaa0gYDom16
         f3rekA7pbQLCpkUxYVxfLyO+8Dd9wqxAW2dTBnVHRh0GeRXzEFD/Brg8GhdqQNbdxPGa
         /tLA+/G2XZpGC+i9zZHI8tP5npvNKkzSpBYW7r6C9uOpgohb043v8D65X0HFVy2nEHnZ
         Lzvg==
X-Forwarded-Encrypted: i=1; AJvYcCXAI+B5LUI2hhlgf959Qi+ENJ3PY3LDoVGGLLJj/Nm82hWAwqgVfUDe4EHEMf29+hWWJ3SjkN/CCopsh7Dv@vger.kernel.org
X-Gm-Message-State: AOJu0YxKoNcP5SUZgL1cuWfa+4izrt0xJrVSfpOauRDIwhe08jW4IFPo
	NFeee357p7QAozHnQdxTtbNN91jUQSPus7NHFlL51OvgaZcuDQ/huSNzgFYKviw=
X-Gm-Gg: ASbGncvawftRWVdx76FLSxna125CKvkiG6my2MeRrdee/1E4qW0lyyqbQM0gLWth2Xw
	Oj6nIjf+uL5cbUKDaJTmVUqbiYDrd/4t/v9M085FeW8GqQlMaxkqkghE0lJDtzq0EowhK5FGgvY
	iX5GkzX8k/h+vgUO0yBWQ2LaJvZkVWxCTrzSa5upPNbYFRrSIIbSLA5A7JLL/sczVy14kN5M1UQ
	n6xzqCRgRiL5LAMDa5RJqYivTm5HLE14Dk9LDNFCe53AeCOl5ybKBMS9DM9ssZr4T6M6Q==
X-Google-Smtp-Source: AGHT+IFFySc7iKkHxeITf4fGLI5MwQQdm55MnSdPaNSW36sDOWHRxEhzUEd0Xql6oRv0ysUt3lo14w==
X-Received: by 2002:a5d:6c63:0:b0:386:3e0f:944b with SMTP id ffacd0b85a97d-38a223ffbfbmr43730638f8f.37.1736182520354;
        Mon, 06 Jan 2025 08:55:20 -0800 (PST)
Received: from [192.168.0.43] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c832e31sm47631023f8f.33.2025.01.06.08.55.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2025 08:55:19 -0800 (PST)
Message-ID: <c911b6e6-0af2-48f2-9445-0a05dcb1ab5e@linaro.org>
Date: Mon, 6 Jan 2025 16:55:18 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/4] clk: qcom: gdsc: Release pm subdomains in reverse
 add order
To: Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Rajendra Nayak <quic_rjendra@quicinc.com>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20241230-b4-linux-next-24-11-18-clock-multiple-power-domains-v9-0-f15fb405efa5@linaro.org>
 <20241230-b4-linux-next-24-11-18-clock-multiple-power-domains-v9-1-f15fb405efa5@linaro.org>
 <3nq6zehelawkkdsxuod32pyntxdgbijsjm5bwk5hu6l3nni7lo@5aeutzvdefku>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <3nq6zehelawkkdsxuod32pyntxdgbijsjm5bwk5hu6l3nni7lo@5aeutzvdefku>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/01/2025 16:53, Bjorn Andersson wrote:
> This sounds very reasonable to me, but what's the actual reason?
> 
>> Fixes: 1b771839de05 ("clk: qcom: gdsc: enable optional power domain support")
>> Cc:stable@vger.kernel.org
> Without a reason it's hard to see why this needs to be backported.
> 
> Regards,
> Bjorn

The reason is it makes the next patch much cleaner and makes backporting 
the Fixes in the next patch cleaner too.

I could squash the two patches together as another option..

