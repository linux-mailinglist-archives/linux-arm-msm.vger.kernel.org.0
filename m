Return-Path: <linux-arm-msm+bounces-71007-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9A8B381D9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Aug 2025 14:00:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 71759189F22E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Aug 2025 12:00:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB67E3002C7;
	Wed, 27 Aug 2025 12:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rqTUXbfr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D922FFDFB
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 12:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756296005; cv=none; b=IuRwwxVEjSlICckNqCndQNDxs8wbRi85hFv6I14Z5EVKlhjoOHw4f53pE/+gjV00u9SyTwHdwkljYaLGb//6dlLF39AcAs1p7OJ5VjtBQxCN6av2w4cZ2uVVMryDuDOghQ5i9oM6NWumm3UN6beJfqW5vChXRTYz24ZTDoQKZx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756296005; c=relaxed/simple;
	bh=8M5yUaYSricrxxS4VJ1bV8PKd7JgB+u6qJ1mUUmgcO0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bczDD5YrHam2ftJO+f541Dx1vLu6HxhHzUv2zAairCM7RsyNdJdYgtgvk4RddA5E/fpcf/oYBEa4VRrT9Bty5MtcBj5IdqjZp2QfSsuGwUUuYEMiZPbLSBZdQ3MQh3zutdCPxti8E9cbfPeH9aGxR/OftBziDIFUIN5dLBNmxmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rqTUXbfr; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45a1b0cbbbaso58909815e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 05:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756296002; x=1756900802; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5L5/xgq5B4PffNpG0CbmoeXuQony5EUxgiKJwLilCUc=;
        b=rqTUXbfrekmOduV2pdp3Rx4xIZF7XHfupKQI9irbr1XuJDN4KzH8t1kh/yk8oeSmn9
         swuBgyyiMAkXqgQCMNsnah+aczNthsDyl22xH3++zGSIWCAej4v9Esdes8PAVO80ACIl
         XV3qFhplmJ8DgX4ginPlZNQS7GBxtWPFRcc53/yp9h/euiVryRjd0PhNw6oi0m2F1KJG
         nDF/GGPZ4n/XoPdQinwx4Oj5uTucYPLBUDx6pfDK6aCO4Qd4MIPNZVa7itjKnq5B+Raq
         q0drTgM/DheRF0+AfCsP2A2jAsrM2EOHi4gYu9lU4RIaaFTFWyC5BomvFobqFSTQRy6F
         nLGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756296002; x=1756900802;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5L5/xgq5B4PffNpG0CbmoeXuQony5EUxgiKJwLilCUc=;
        b=bbQDWiM5947er9eAdNks3Kr3J9LRl6UF5tlBYiguv6cV4qBy7N1I0rufDkA3AT4hWW
         f5jsTeWVH4+ahXbSjPEEVbX4pjwQti7FgkxhOGsnDRN4VNijfApFVlUQqU8Te/1axx7K
         DIgZNKaKnc1wBOfL/3sZM0P6e17OVb9xVsaSjOO8uigs8LUmXxUV8Uigr32d0HL8/xD4
         8BNpCumPZdktj24rAqpIktBIXkejz+w+9WtPd296zcZaBG2CRg889pzn+i0d30sj57M5
         WjMP4S9GMeWiBQpCLmDhAtdRRXS1rnW1F3YxAmQGi5B2srSmFJgYEIxUMcmvZOBnLLuQ
         L3Ug==
X-Forwarded-Encrypted: i=1; AJvYcCWCf6JYIK1DqPF4ku5ER3EoKJ1k1PPhEiRvUtHYM4DXzS+49rVV8RCoPCLZVFajZr4mUhoR+BzHUr8qnf8i@vger.kernel.org
X-Gm-Message-State: AOJu0YwIrWZUo5JuUaWRzSRKqV8W11CKsdgMZB8B5FuIGhpPTXHkdU1/
	3YF7cwX7WVcpZQhJbsbdOiqwMBVQ8yi6besU8UGEHPanGJm+djGXo7L7TNNa7nHuwsI=
X-Gm-Gg: ASbGncuqmX9FGydc5+UbU05XFdKY2uoZ9CxQ7HKd/xqc4kEfAXshTRb9blmaRmoZvRE
	s5iaISwqhAeyLQBSkFWeVuIJ63MJy8N7VKmzU6o+X0dMA/KPk4vmVMWINlb+yOeDGpaQtee47Aa
	pdVDOs0boXBdgPzxMAtodGznYAXAiCIN0Xy7v7O9UG0M59fsQjH0Z5W41V5sEGZC/wwKYP2yQ0p
	M8ylxzz97q1LffSDuNisjYHRoXFTFMuoVXMhhEdcVy8JmUjUxZF1ZC0mqP6titPYrwOEEdiYg5j
	5Qu8xi1wkSNGdG1f/b+hU21jDCcqlxG7s2ALsY752sRYgQer+ZaRb6HSJ7VwqZR0ok1YA1P8hHF
	vSAqxG0QRSqLfsESI2P9ujJQBv0CvliN0HUfeDVDkcYBbbub5
X-Google-Smtp-Source: AGHT+IEkh4jsVY8FwY3eWA0V4VXsqlJwb5m65Kq4NVKaZSscJWUEE+v9BFNSpCicdnp78oKhJqCv0Q==
X-Received: by 2002:a05:600c:190e:b0:459:e3f8:9308 with SMTP id 5b1f17b1804b1-45b517ad4bbmr175430125e9.11.1756296001599;
        Wed, 27 Aug 2025 05:00:01 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b6f306c22sm27847355e9.13.2025.08.27.05.00.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Aug 2025 05:00:00 -0700 (PDT)
Message-ID: <49bf23dc-705e-45ab-a2e3-fbb798cd8e34@linaro.org>
Date: Wed, 27 Aug 2025 12:59:59 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] add sysfs nodes to configure TPDA's registers
To: Jie Gan <jie.gan@oss.qualcomm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Mike Leach <mike.leach@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
References: <20250827105545.7140-1-jie.gan@oss.qualcomm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250827105545.7140-1-jie.gan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 27/08/2025 11:55 am, Jie Gan wrote:
> Patchset 1 introduces configuration of the cross-trigger registers with
> appropriate values to enable proper generation of cross-trigger packets.
> 
> Patchset 2 introduces a logic to configure the TPDA_SYNCR register,
> which determines the frequency of ASYNC packet generation. These packets
> assist userspace tools in accurately identifying each valid packet.
> 
> Patchset 3 introduces a sysfs node to initiate a flush request for the
> specific port, forcing the data to synchronize and be transmitted to the
> sink device.
> 
> Changes in V3:
> 1. Optimizing codes according to James's comment.
> Link to V2 - https://lore.kernel.org/all/20250827042042.6786-1-jie.gan@oss.qualcomm.com/
> 
> Changes in V2:
> 1. Refactoring the code based on James's comment for optimization.
> Link to V1 - https://lore.kernel.org/all/20250826070150.5603-1-jie.gan@oss.qualcomm.com/
> 
> Tao Zhang (3):
>    coresight: tpda: add sysfs nodes for tpda cross-trigger configuration
>    coresight: tpda: add logic to configure TPDA_SYNCR register
>    coresight: tpda: add sysfs node to flush specific port
> 
>   .../testing/sysfs-bus-coresight-devices-tpda  |  50 ++++
>   drivers/hwtracing/coresight/coresight-tpda.c  | 278 ++++++++++++++++++
>   drivers/hwtracing/coresight/coresight-tpda.h  |  33 ++-
>   3 files changed, 360 insertions(+), 1 deletion(-)
>   create mode 100644 Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
> 

Reviewed-by: James Clark <james.clark@linaro.org>


