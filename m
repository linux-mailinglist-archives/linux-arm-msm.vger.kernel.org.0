Return-Path: <linux-arm-msm+bounces-97458-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WJGFLC8BtGnCfAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97458-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 13:21:03 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5B7282DC5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 13:21:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 81CBD322D361
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 12:18:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EA88392802;
	Fri, 13 Mar 2026 12:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JrqUxBkD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451F8391821
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 12:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773404329; cv=none; b=DuzjrfTgW6H3t5VpR9/vYCxr7QPRaJWZcSseJB1W+vqtRZ+Nadj7Sppe4NTZOJ40Q1FHx7C28rnBab0vu8tNgpke6D8XhkwJ6UlIqv9d+0EzPEtQS0kSx3MZWrNU39+KWdEl57HOyETirC6NmAkr2ByVJGv04aypkJods6/asn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773404329; c=relaxed/simple;
	bh=V+lC6EjJY4lOyB1rR22LNtAT1Vlotp4LU45DmHO/UY8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qkLYdcgs70Sk0EMNBw9uJP+dk5IhW5FQI+6G/kOdy9+WQUmS6pyUKEYrjnfOp8HdtMAlon7lYG+4JA6lCD1fkexIUU1bWXM9D9KEbK4ib9QnM2cDzTt65BnzS3DuvO2KaaXU+gFB013Xr/y9gXpSzok9hjDdKtrtTf7IQw2QtXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JrqUxBkD; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-439f59dfda2so1722650f8f.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 05:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773404325; x=1774009125; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4vDJxFgdwUwROzjUq7xJrFddmidfBuen5YK8xbhB4mk=;
        b=JrqUxBkDQ1mGhDDPyP6dFy94qBy4M0i1jFwdzAEY4iIrU/r6QcFnAa1uYwD4yeIppj
         KYYtSR8EgZSoXk9ropGM4VI8AHt1i8rvRMXbIoCdS9CEi96ia8ZItgSjrCxzgFNSTYZw
         2kYZE7I+tXeg8Ubw+QvWdnaBNp9e+tKc4fshi72fLNe8SVTzZ6h+icIIvk71W85gs2dq
         L5sbGLj2gzUKqYPnxTVVcpbrYkLFsrDy2u+R7oyK6lEAxRQsPBQ5TlQ/gsk0rO7e70aQ
         JAyHSQy7O83ZhaIibtpKuTkQbvFhK1ffWet9vwLH7ajgiR/3Gl7A0XgZxjmRjz00wOLp
         PsFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773404325; x=1774009125;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4vDJxFgdwUwROzjUq7xJrFddmidfBuen5YK8xbhB4mk=;
        b=D/rpGL616AhBBbS3fWQNm74Yk4qOZOGByz73DaWbmKAw7fj4RjE9CJOn//+PysyiQe
         YlhrEplN38byWrxyJSnFSVFgbugzsxZlUECZIBe1zyaDpx39zepCa3yqgyw5c59alPIU
         IktWKeKwzvox/fRFr+5bxYCRNc5RYFzvNf+GXfDFShlb/uRtpaDJPULHWhRQF0/8sQ4U
         K1OrlLrf4RbxSCwb7zIqKRd4phDtiXFzYoKkMzRDw5NnbGaCuXeLJF9Yl/VbpC/YDxTN
         SpP/+A3Bd0Mp6b+Jz5Yk7tm9msIZ2bQ42EdUXTKJ5wNfNYBE/PwcjRkWHtcgD8b4kIZ7
         1MNA==
X-Gm-Message-State: AOJu0YxTqGx1E8k8Yh0IA5MIW9gInP0/HbkV63WVF9J10m0P8nT2PU02
	naNc68hf6C1+TAWYAVbGikavfKXE+2kujA7SvqAYtHRjQ9JjCi8tim2fjQh7Tv94eWk=
X-Gm-Gg: ATEYQzwM2kKHZN9T3UPcz854q6XPmYFaD6gr2rzfPMfdLKxUOtltyQCRMV8hwybmIMM
	dlw1+/cppCSIal1rikoJ8C8N+9ARgxJCFyU3A/v4gpkwCO+xjLxQ2h5Ry8Lc6N1Szq4tpzeuSZc
	HdxRF0vjs0Ow02vtExPgMGLjROk6gjgo0tHxNrLJwzys4XnofIaDm+NV6UHzIp8AcabFx6pvIlD
	hc4Z+c5Y1vnhduLNxOMqnE+3V+p1NK+2MpQuHR9AjTxy91Rl5VqoxIWuggW9FdNYwi0pFGVu251
	VcqxLVvFBs7vj/zlSyazXXjigS+iP131U5rq0p5JZwJ/Rfq4rm1t8PJvZIOauOhHKG7Fwc1S+U0
	P2jdJDQWbwLcXvzWSAKko6HHAvYwX55LR/HuXSjl+kWbR6z22XGdEkQjG+TsfxB1rzfISJ4DSdN
	KQCs82rjKGYhDvKZBaFUDeNN0Al5p1Fq5BDMA=
X-Received: by 2002:a5d:64e7:0:b0:439:b59e:5e6a with SMTP id ffacd0b85a97d-43a04d816cemr6178617f8f.14.1773404324041;
        Fri, 13 Mar 2026 05:18:44 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.176.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe19ac5fsm17764848f8f.1.2026.03.13.05.18.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 05:18:43 -0700 (PDT)
Message-ID: <132116be-2964-4b98-be2b-1baae5bfb58e@linaro.org>
Date: Fri, 13 Mar 2026 12:18:47 +0000
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
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 Maya Matuszczyk <maccraft123mc@gmail.com>
References: <20260313-v04-add-driver-for-ec-v4-0-ca9d0efd62aa@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20260313-v04-add-driver-for-ec-v4-0-ca9d0efd62aa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-97458-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:dkim,linaro.org:mid,qualcomm.com:email]
X-Rspamd-Queue-Id: 5E5B7282DC5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 13/03/2026 10:29, Anvesh Jain P wrote:
> From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> 
> Add Embedded controller driver support for Hamoa/Purwa/Glymur Qualcomm
> reference boards. It handles fan control, temperature sensors, access
> to EC state changes and supports reporting suspend entry/exit to the EC.
> 
> ---
> Changes in v4:
>    - Fix fan count calculation to use min() instead of max() to correctly
>      cap fan_cnt at EC_MAX_FAN_CNT.
>    - Remove unnecessary mutex lock/unlock.
>    - Disable fan debug mode on ec module removal.
>    - Fix issue reported by kernel test robot.
>    - Consolidate hamoa-iot-evk specific changes into hamoa-iot-evk.dts.
>    - Add board-specific compatible strings as per review comments.
>    - Link to v3: https://lore.kernel.org/all/20260308233646.2318676-1-sibi.sankar@oss.qualcomm.com/
> 
> Changes in v3:
>    - Revamp the bindings and driver to support generic ec specification
>      that works across Qualcomm Hamoa/Purwa and Glymur reference devices.
>    - Add ec nodes to Hamoa/Purwa CRDs and IOT-EVKs.
>    - Add ec node to Glymur CRDs.
>    - Link to v2: https://lore.kernel.org/lkml/20241219200821.8328-1-maccraft123mc@gmail.com/
>    - Link to v1: https://lore.kernel.org/lkml/20240927185345.3680-1-maccraft123mc@gmail.com/
> 
> ---
> Maya Matuszczyk (1):
>        dt-bindings: embedded-controller: Add EC bindings for Qualcomm reference devices
> 
> Sibi Sankar (4):
>        platform: arm64: Add driver for EC found on Qualcomm reference devices
>        arm64: dts: qcom: glymur-crd: Add Embedded controller node
>        arm64: dts: qcom: x1-crd: Add Embedded controller node
>        arm64: dts: qcom: hamoa-iot-evk: Add Embedded controller node
> 
>   .../embedded-controller/qcom,hamoa-ec.yaml         |  56 +++
>   MAINTAINERS                                        |   8 +
>   arch/arm64/boot/dts/qcom/glymur-crd.dts            |  22 +
>   arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts         |  16 +
>   arch/arm64/boot/dts/qcom/x1-crd.dtsi               |  16 +
>   drivers/platform/arm64/Kconfig                     |  12 +
>   drivers/platform/arm64/Makefile                    |   1 +
>   drivers/platform/arm64/qcom-hamoa-ec.c             | 468 +++++++++++++++++++++
>   8 files changed, 599 insertions(+)
> ---
> base-commit: a0ae2a256046c0c5d3778d1a194ff2e171f16e5f
> change-id: 20260309-v04-add-driver-for-ec-3fa478f264d9
> 
> Best regards,


echo 'file qcom-hamoa-ec.c +p' > /sys/kernel/debug/dynamic_debug/control
echo 6-0076 > /sys/bus/i2c/drivers/qcom-hamoa-ec/unbind
echo 6-0076 > /sys/bus/i2c/drivers/qcom-hamoa-ec/bind
dmesg | tail -n 15

[   27.301126] qcom-hamoa-ec 6-0076: EC Version 0.35.0
[   27.311768] qcom-hamoa-ec 6-0076: Fan count: 0 Fan Type: 0 Thermistor 
Mask: 0

?

---
bod

