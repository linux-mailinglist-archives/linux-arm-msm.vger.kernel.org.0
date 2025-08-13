Return-Path: <linux-arm-msm+bounces-69046-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C7EB25475
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 22:20:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0B56A7B6959
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 20:19:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A68E327FD5A;
	Wed, 13 Aug 2025 20:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pPr8ULQQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C05032AE90
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 20:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755116440; cv=none; b=MBxRDXGE/n67vz7HcwfmRxseLwdQXqGwcLF1J58tuBtgemMU7tze4M1f3/B8RMNXYTa0Tx26GLnW93CIDZsBkLSytAc7a/BJSSXDYz0HwaZTTfLYqx3hk3ATa/1lWz0KwYX5kZ5BjvrsLaJ09u0/mQYu/+uHSbMIWLvxMYdSVI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755116440; c=relaxed/simple;
	bh=rR+D3tBr5Y7TWuY2UOSpzkXUuslrs0FnyhVARRKHYQU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=quhwLKqv3uqpu+VvH0qG4foeeKkzoL/mx7L4g0hH4jApky5BaIZKa41dxe5nkuE9fHzsB53JKxaexHG+rzOJ+dfbO478oF8LzbkTU1z8sVTQAL0gLNTWYoEw6JFCKVhgWSgZZ023ix6h27dlOJShueUnq7+p2+Odlk1xa6OIKh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pPr8ULQQ; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-45a1ac7c066so1773485e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 13:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755116437; x=1755721237; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F/1t3EFEgXHUBAHB72RnZ06wSpjDj+54/Frk/ThDsww=;
        b=pPr8ULQQFQFl7vanrN6bHhHRWjrHy2Kga2slWZ+ikhD8zspOIiKIgD/6M8YEl29Tek
         yjBNHJU7GqDsfpPU7gE/mKP5oZM3IZNkjm2w6M/APudhBp4qp61Fy6tLiddDdltFrL0Z
         s2Z5z45BK0p2c3JYdv+CwwtAO8T3DO+VLVynnjUGI0trR0NvZvHDxymyfBrqjkS1nRhq
         S3AeOMSca7UsNMV532vvEWOYzZX7XWbLPBuynyPC18J4VHFWV84G2P4G1Y/q4xm4pmp+
         GKJSPFT9l9CsLwERm8+vsp6DVQmxVLU4RHy5eNTtJxBo1zNP3BmJJB1uhW1hm4gN6fAG
         GVdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755116437; x=1755721237;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F/1t3EFEgXHUBAHB72RnZ06wSpjDj+54/Frk/ThDsww=;
        b=us6qZzOB37/AQQVSiatiwbUkYSEbwh1kzyK710wcT47+iyZqzof3362Ga/Mlz/urXF
         5eVGgtzJ6iZynV7+vjbhRopjbLdQZecod6q4e5aMgzjVlGmFSIdWhq9l4uRyDlFpx5Lj
         Ratd+EgST3ZtUUEfZsg7LXK5G19c9FqfVY8Gn6pmV/lphACheetTGe+gGGR5aTAUprpL
         w/EgLtIRBeK5zvtl4vEGg8LXmxeJItvfie609VwMgq4Tog1lKxF3TFcNy/Gz/ENHhUvb
         lHqFKtfLN4b6zt5lgUnfEagoemviY0Urr8OSIOe7k26/8TmAFwacSUa66HBTYZaQCVez
         UdiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpl/loPeBtANQkI+oXiqQ8dGfdN+MkZWzBv0OeRL4nqRqKWkBPjs5e/vRIJkGSQU4K2TvW20bheUGLJP5U@vger.kernel.org
X-Gm-Message-State: AOJu0YxAqt/XozOxhPG2wFK4C0we3mhO//F6noJORyMpd7Ml6U4hpIO9
	DHBp1NmH7GpA5jGS1IA0ZlqXgsPbddGMR6J/foeIh7FTaldVxFvCNT47bs1B+iJlshY=
X-Gm-Gg: ASbGncsyo7eRt4ktVcG59V2Xir1W7UB+Pdquk6e6OX7K2vBZUYzzNrfoPs7a7Kmwm5k
	SnrTw67/6LHHMfcA1nMiMRwMm2p7q8gGA28HhmSVS+bVr72N5uUN+bSGPgPX51/BAJtEVZYXVqH
	E9PLs7mtQ9vuOFqPWnNSs4L2NesZrt7xHRglSv40B+SBkWHNzpgWhVfA2vIB8Yqm3b4chWALw5W
	iJhOeW86jsUY9YPjucT1bM8XGXPpxCM0a2sa4CRfCw3HerbaftFQLXqZzA/ljQIGtqog2NaVKkI
	kE5VWw+K+cBtLEzbCgeKhR7EwAbI7P7CPmS5TySIZp8aPl7O3MCHsDXmKQKYwH7gv8/OlfcNKx+
	7LO0T5F/0iKIvMpNhKZ7NIPOiMezry2vF+UsINn7LrWtXvfSH2vl9js46cYLhtlE=
X-Google-Smtp-Source: AGHT+IElNKXelLAOHt8GQdvDS1nqHvpRfu2/IblCpP/yU0lQ3cWvxbEeQ3xIecHM4pnAO9YWIbdQzQ==
X-Received: by 2002:a05:600c:8283:b0:459:d9d5:7f2b with SMTP id 5b1f17b1804b1-45a1b7bf687mr343085e9.16.1755116436947;
        Wed, 13 Aug 2025 13:20:36 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b915deec6bsm4945531f8f.7.2025.08.13.13.20.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 13:20:36 -0700 (PDT)
Message-ID: <bb919b4f-b51f-41c5-aed8-a3809316f7fb@linaro.org>
Date: Wed, 13 Aug 2025 21:20:35 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: iris: vpu3x: Add MNoC low power handshake
 during hardware power-off
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
References: <20250813-sm8650-power-sequence-fix-v2-1-9ed0fc2c45cb@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250813-sm8650-power-sequence-fix-v2-1-9ed0fc2c45cb@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/08/2025 08:53, Dikshita Agarwal wrote:
> +	/* set MNoC to low power */
> +	writel(REQ_POWER_DOWN_PREP, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
> +
> +	do {
> +		value = readl(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_STATUS);
> +
> +		handshake_done = value & NOC_LPI_STATUS_DONE;
> +		handshake_busy = value & (NOC_LPI_STATUS_DENY | NOC_LPI_STATUS_ACTIVE);
> +
> +		if (handshake_done || !handshake_busy)
> +			break;
> +
> +		writel(0, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
> +
> +		udelay(15);
> +
> +		writel(REQ_POWER_DOWN_PREP, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
> +	} while (++count < 1000);

So if this loop executes 999 times but succeeds on the 1000th try, your 
test would fail because your final write never gets evaluated in a 
subsequent loop.

Wouldn't this be more logical like this

do {
	/* issue command */
	writel(REQ_POWER_DOWN_PREP, core->reg_base +
	       AON_WRAPPER_MVP_NOC_LPI_CONTROL);

	/* wait for command to take effect */
	udelay(15);

	/* read back status */
	value = readl(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_STATUS);

	handshake_done = value & NOC_LPI_STATUS_DONE;
	handshake_busy = value & (NOC_LPI_STATUS_DENY |
				  NOC_LPI_STATUS_ACTIVE);

	if (handshake_done || !handshake_busy)
		break;

	/* power down? the mnoc */
	writel(0, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);

	/* Let that command take effect ? */
	udelay(15);

} while (++count < 1000);

That way you exit the loop with the mnoc state in a known state, instead 
of as your loop currently is perhaps having succeeded but incorrectly 
signalling failure.

Also why 1000 ? Thats 1000 x 1.5 microseconds - 1.5 milliseconds 
potentially in your submitted patch now nearly 3 milliseconds assuming 
the power-down command similarly requires a grace period.

Please at least fix the loop so that the last power-on command should it 
succeed at the termination of your loop can be captured.

> +	if (!handshake_done && handshake_busy)
> +		dev_err(core->dev, "LPI handshake timeout\n");

---
bod

