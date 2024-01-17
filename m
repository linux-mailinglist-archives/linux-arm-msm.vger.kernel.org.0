Return-Path: <linux-arm-msm+bounces-7514-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A53830DF6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jan 2024 21:28:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0F8741F21C13
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jan 2024 20:28:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C39324B34;
	Wed, 17 Jan 2024 20:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c4r6N18W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B8124B2A
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jan 2024 20:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705523304; cv=none; b=Z5kvPCBozkidwIbMB0+u47qeaV/5WaFb2Mi/rjnFlz/GozNIYn6R1tIOTcw0WxAXfpFVlfdXeyDLeEs7vssRZMaDko9rP1igwkhmcgTd9j+Gnbr1jH/zlnfXB2mLs2kJc2bDfUOgBMRvmlAuGGZAfijJn6wM3JtUhGKokhM/JlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705523304; c=relaxed/simple;
	bh=j6IwuGvjDuivPFpBvTy+hI+5ARRmCDLSvV9hRj9W8Kk=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:Content-Language:
	 To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding; b=NUpaIj2f5LgLxbE1L30Yu561cqbIaKYl6tAk55/cVTjnFVwFJiUsQVQy8Pah7eNr2UZRvVfNBhZtphQYwcPY/bk0UOqQQUtA/EheFTWSryWsEP5UxMFTNpW3a1XBSXUsqFu1hjyfGQq3q0bNyHfrOxqJEfRwS1X87N80GL770KM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c4r6N18W; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-50e7d6565b5so13811694e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jan 2024 12:28:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705523300; x=1706128100; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4XXEeOxFhTAf2CSHz0sawVtjrADZ1Ztr/8L/2FW/dDU=;
        b=c4r6N18WoZKVBmcCK64h0+mTG2kQElQvzD6810RmVUuhWEf8eGfQ8vyuJ4uAmztRx6
         eN+W0lQpl4zVf0his03dkKy1deEf7P97cIKM79to8CXVa8M7kEVFSNLBFjVB43gQRZQ8
         7AkxLAlGulnznO/raYwMkB5v1mIiyKOjbabM1kLcYNuUvrf3opsCw/7sUtVrmGiAwzBO
         Kpix8ygdkBpOYO/ok9x/lRHo8T/85Zw9EsrNDt0QSqcTiFuXrXo7emelpJDWE4Wg5WZ/
         RetgzgUmTBs+L52JDgt239Yya3f+xkWI+rMuMVSvdG4SL5mB4TGNCfIX+Z6evLRMVKKU
         PVYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705523300; x=1706128100;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4XXEeOxFhTAf2CSHz0sawVtjrADZ1Ztr/8L/2FW/dDU=;
        b=SyBbTksU2hlvkiC8hjhdK8emPM4chmlK437qW//m1YRxQ8NrvFWzSDL8QlVfNdIC9w
         /sFbHX6klwMMapjruiVSYatK8ZZ5gzmxjFMiLPiDT5eQ64WeWQTDfaoNBGF62F1p5lv3
         ehbsb55hWGmVBGOhPS7ZM26v8QbgWW4s7zJRYsgKAaEEPpDhWK7vR3AleKmEN8veleJ5
         2hOnHINRh/vaVWl1n91jAYB4unCh+XpdpaDMyvAtrAbFJLFMgECTDzxcI/8YNGm77aL8
         9tsHVwKSqZm7dbKcUerUIXVc7tAiQn05GKXb59Si5bEpMxNFZfmecTjG21mE73nhWW3F
         q4dA==
X-Gm-Message-State: AOJu0YxtF1Td98uKwigsKlXib4v8ws2vAjeJqZHJWxdBTx4WnkFH89DT
	hK633vVBwuJ3iyaSOoLc8+w1rw23RKb7pg==
X-Google-Smtp-Source: AGHT+IHInIpaQnmgeBjl7HU4+FsynSE8diK278pVPRTOCVbb7/4SjYUpQbyx5Y5RUbbYiGbj34LEYg==
X-Received: by 2002:a05:6512:3b92:b0:50e:5448:3316 with SMTP id g18-20020a0565123b9200b0050e54483316mr5113500lfv.137.1705523300436;
        Wed, 17 Jan 2024 12:28:20 -0800 (PST)
Received: from [172.30.204.151] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id p3-20020a056512312300b0050e7fe17591sm366610lfd.137.2024.01.17.12.28.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jan 2024 12:28:20 -0800 (PST)
Message-ID: <7e48e51e-e16a-41b9-800d-960c627b8da6@linaro.org>
Date: Wed, 17 Jan 2024 21:28:18 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 4/7] soc: qcom: Utilize qcom scmi vendor protocol for bus
 dvfs
Content-Language: en-US
To: Sibi Sankar <quic_sibis@quicinc.com>, sudeep.holla@arm.com,
 cristian.marussi@arm.com, andersson@kernel.org, jassisinghbrar@gmail.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, quic_rgottimu@quicinc.com,
 quic_kshivnan@quicinc.com, conor+dt@kernel.org,
 Amir Vajid <avajid@quicinc.com>
References: <20240117173458.2312669-1-quic_sibis@quicinc.com>
 <20240117173458.2312669-5-quic_sibis@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240117173458.2312669-5-quic_sibis@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/17/24 18:34, Sibi Sankar wrote:
> From: Shivnandan Kumar <quic_kshivnan@quicinc.com>
> 
> This patch introduces a client driver that interacts with the SCMI QCOM
> vendor protocol and passes on the required tuneables to start various
> features running on the SCMI controller.
> 
> Signed-off-by: Shivnandan Kumar <quic_kshivnan@quicinc.com>
> Co-developed-by: Ramakrishna Gottimukkula <quic_rgottimu@quicinc.com>
> Signed-off-by: Ramakrishna Gottimukkula <quic_rgottimu@quicinc.com>
> Co-developed-by: Amir Vajid <avajid@quicinc.com>
> Signed-off-by: Amir Vajid <avajid@quicinc.com>
> Co-developed-by: Sibi Sankar <quic_sibis@quicinc.com>
> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
> ---

[...]


> +
> +struct cpufreq_memfreq_map {
> +	unsigned int			cpufreq_mhz;
> +	unsigned int			memfreq_khz;
> +};

Weird use of tabs

[...]

> +static int get_mask(struct device_node *np, u32 *mask)
> +{
> +	struct device_node *dev_phandle;
> +	struct device *cpu_dev;
> +	int cpu, i = 0;
> +	int ret = -ENODEV;

Don't initialize ret here, return 0 instead of breaking and return
enodev otherwise.

> +
> +	dev_phandle = of_parse_phandle(np, "qcom,cpulist", i++);
> +	while (dev_phandle) {
> +		for_each_possible_cpu(cpu) {
> +			cpu_dev = get_cpu_device(cpu);
> +			if (cpu_dev && cpu_dev->of_node == dev_phandle) {
> +				*mask |= BIT(cpu);
> +				ret = 0;
> +				break;
> +			}
> +		}

of_cpu_node_to_id()

> +		dev_phandle = of_parse_phandle(np, "qcom,cpulist", i++);
> +	}
> +
> +	return ret;
> +}


> +
> +static struct cpufreq_memfreq_map *init_cpufreq_memfreq_map(struct device *dev,
> +							    struct device_node *of_node,
> +							    u32 *cnt)

I really feel like this is trying to reinvent OPP..

if you structure your entries like so:

opp-0 {
	opp-hz = /bits/ 64 <12341234 43214321>;
};

you'll be able to use all the fantastic APIs that have been
created over the years!

[...]

> +			monitor->mon_type = (of_property_read_bool(monitor_np, "qcom,compute-mon")) ? 1 : 0;
> +			monitor->ipm_ceil = (of_property_read_bool(monitor_np, "qcom,compute-mon")) ? 0 : 20000000;

What does it even mean for a monitor to be a compute mon?

There seem to be no dt-bindings for properties referenced in this
driver, neither in the series nor in the dependencies. This is
strictly required.

Konrad

