Return-Path: <linux-arm-msm+bounces-85756-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0899DCCE318
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 02:52:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EE61F301B820
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 01:50:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CB68242D6C;
	Fri, 19 Dec 2025 01:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kXewOona";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c+AhjCe4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C76352417DE
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 01:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766109030; cv=none; b=asV3nTb4lpRKwH/VaNwyUTZ/KDcMPj3pQdohZtxEwJMBD3lK4U6OIeOf60b2BD1q7IYP0bwSlAzUOZbeSrfwJlqzpBzpApXjjzY28d4rx+C3mrV5cBVDhqqsLk8XBaA7lDTos4acXhvk/dn61QSsX3jnuYuzsX9KVS9cirKL9Ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766109030; c=relaxed/simple;
	bh=MNAphZ9trmx3sx5L/qPBZYe+qprYs1ZjhbXycfXJC38=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U9z184BYAHYU6aJYRdHs3Kuya5u4Z9P2XSfDNaOd1V3T4WekB9CgLdUYssejr7W5DkJpo+P8ZWlMmmbV4srt7jNo4pJV2UlPIXK0ruwSJGCglXGu/7zhjTngWYwmLZkhSdVjvl4L/FXeFQFZ6Rc+eivETuqQWAm+yyJ1eEa+XWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kXewOona; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c+AhjCe4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BILktkC2699976
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 01:50:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0HQgQjmle1DtbIymifpD7qH0zWYdMBbbPWC8FYwX124=; b=kXewOonaKO6yCrcr
	7gAhuwJrSPaEY5iHJXkG1uxEPquBbWWxtXF1+UhF2Wx/EBq5wabqNgiw7maTMruA
	TAqp9mmjgRNaZ9J/NK+B6wwxKBfLUAodVtRUalwmatBoEuicSF4X4+NPHs9H2Xc2
	ksJDPZmPxQDibhHMorJqREK8aXJTjsvAp/fm2oSks17O0bAr6mrsiVT7HgYTtE+J
	2oXCiYohCH97MlJ2PXDcY16rcpUR7AomtTZih1+Lq0IrLsDo3f5QsDt3NRrcUM8G
	altotbF/7UEkUBdIuqHBYXO6FDwUSJsawsGgtKtQn8jAwtcLxM/8JYvGFvyM4BgR
	u/RvEA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2c8t95-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 01:50:27 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7b89c1ce9cfso1750118b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 17:50:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766109027; x=1766713827; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0HQgQjmle1DtbIymifpD7qH0zWYdMBbbPWC8FYwX124=;
        b=c+AhjCe4D0FWE9ZfPDXLESGT244G7JiffLM2CniikYnMRxaUQ4iw1o4voY8Wiaa7GH
         96mY19/T1HEjntBPMOf0OngAJ+0PDf7q/Aj+Kbw5oJvoJ9bc6ewQfIbfGtG/Z77eXvyC
         VvnEEDAsoi1pdUqEsv0hknPDCgZOxCRT92pYyHZ2r3u0JwJi/4dH/Da2wnIVIuUD4+Da
         rnnXBzr1KUO6/QUNOT2i7iJrM31aseybJf98WW9SgZDLhcqZ3FkfP+Zux/MuEJUhvRRO
         PScnPv7sKhvYLCK7Hco+imw1PKepg4szIP32q0CG/A8IwrvX9+G88hau31anzc9R8J/m
         J6sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766109027; x=1766713827;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0HQgQjmle1DtbIymifpD7qH0zWYdMBbbPWC8FYwX124=;
        b=Eab9wKHh7xEd8VETwnBYJ4Cu06q6h6LoGGhFmx2Y+KP3HohF9GPO+v7rYDu4QiCeAb
         yWrWUSmSU6ZtGFFXM/XThaC5sCWatz/rDZLEoVGNZJuHd8Si79HfbTsF56UaWYPQq/lU
         Ro0l6KwEookSVW6bCMfBOhbQBV3NKfk3N5waDHv+N4gZyHocsHTj0BoA+nXkT0z0R5xT
         jNBQIipazivkjhw04HKbRl/hre0eGSp8hha77if+g+TV26zqi0xX/n6NCia0iVsEwBqU
         3gFnFsab+QkyyT20aLix2YzLG/RUppFonU9WTryYF5/JoYZczlKCp+KhkNa0q+iyZWCt
         x7zw==
X-Forwarded-Encrypted: i=1; AJvYcCV2PDtk5/vW2qmk3gFzOSQDBidicEg5AwJhk9fd8hdrgaYMypcOckWRjdHwNzJ2dWdxE8fwY2QUHkXPRz8U@vger.kernel.org
X-Gm-Message-State: AOJu0YxRWKwzfPIjAw0cUU9B0eL52tD4nouw9fnJ3tmyR9WNYK+hyR0n
	1Cknmg1fuu2yYxq4gue+QGatxUqJ7aHbBEiJRy2qugX8JVnmc8517pVNmMASDHyQrGwQii0p0Lq
	n7xaMr6jItuS64M7YCh2zkLVfu7YQ+0dnZzVTHmLmQ7vM31dpywj7bG0wf7W7wRA40b9D
X-Gm-Gg: AY/fxX57WvoIEsQq6Isv+K0DBrdWTk+Yy7eerVRLMymVDEdolCO1sFn96XfRfeAuecT
	p5kbCXXkhM9R4i6RPOVEZnrC2ZW3QZU08Hc06Bg0YIs6nxKNGJRMMuOlMhdaFgAWF2I/VXVrOGr
	RvviAL90Kh/xpPnH5TQMTesj/kDQjKFTH6RVf8XPIhTIAr8vUgQ4I/FTp4uuaPw2fURHwqC7Njo
	hWnZitpGwSPYm/9AHzUfYjokwTdNHTieR/zsazvXLPXT1VoU5snioLGCqaz6OZVo/4mVgpnx0Yj
	ncQZZEgfBys0nQj8SjqOENCqK49Z2uMaUp1/dlwp6LuiSEEXUJlyNH14JTDjD9BBTFaNeK0OYMU
	6OHM/hU+cGh2GKXOAZUjx6VmMkaZYw6YgJ0GKKB4NoSwZlWIkZvKH3hTXNjIUeX6Mym/MuNeffP
	TAXFRR9ph0
X-Received: by 2002:aa7:9301:0:b0:7e8:4587:e8b5 with SMTP id d2e1a72fcca58-7ff65f78aacmr1242184b3a.40.1766109027216;
        Thu, 18 Dec 2025 17:50:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH97khf7iYUM3NJRGaT7+S3mpVjpomkGCij9OOBYjEiHynxY+nzs5snhowicWJSLEzj+HtI2w==
X-Received: by 2002:aa7:9301:0:b0:7e8:4587:e8b5 with SMTP id d2e1a72fcca58-7ff65f78aacmr1242162b3a.40.1766109026671;
        Thu, 18 Dec 2025 17:50:26 -0800 (PST)
Received: from [10.133.33.101] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e0a19besm568706b3a.40.2025.12.18.17.50.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Dec 2025 17:50:26 -0800 (PST)
Message-ID: <927f15d5-da2a-4282-b80f-c1c7563a4367@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 09:50:18 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/12] coresight: Add CPU cluster funnel/replicator/tmc
 support
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan <leo.yan@linux.dev>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, kernel@oss.qualcomm.com,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, maulik.shah@oss.qualcomm.com,
        Jie Gan <jie.gan@oss.qualcomm.com>
References: <20251218-cpu_cluster_component_pm-v2-0-2335a6ae62a0@oss.qualcomm.com>
 <20251218104027.GA1790402@e132581.arm.com>
Content-Language: en-US
From: yuanfang zhang <yuanfang.zhang@oss.qualcomm.com>
In-Reply-To: <20251218104027.GA1790402@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=cpSWUl4i c=1 sm=1 tr=0 ts=6944af63 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=CT3mT5stn3mpJVhV_EcA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDAxMyBTYWx0ZWRfX+qjPcL+D/BzM
 M/qKku2oEb6QQZD3XhdAO3k2gHnyMIEIds2CyteETTBQmmxk80qlXrA4gKZaiVCfMPuT25zjKck
 jokHhIxqZlA4znTM4DbLaKPm+LZPwAjhv7ga8OCzz5iz5qPEnrHRT22d3PojMOje5uXPhf4GfhH
 fdMM8G3OtPZNv8Od8wC8rn4bZiYDWGMAqmT9pd2jEmK5dGJe0E1Q6aFySd5Nwjushg8VpLJqIWr
 UcxHDDpMSMJjdGNdQlt5hozlRX4F0TvzQ1k83gWncB/RaA5nkLWoZqmuF92M/jTNBvaOXux01X2
 f4aG60w9i3LAIPDRxxUjkr158Hs6hYxPa048SfvA6gz2HzZ03KSHkOgwk6wAs8AqCWtM733S8zc
 DLwBf57rWNUMm0FZ6OAdT2+Ldc09LlYt7E8kKgrRCwWVJnpmFOAwfNLK+C48Qs4Mo1MjrT4QPta
 v9WNVV4dEU3c6ORLS+w==
X-Proofpoint-GUID: _kJOBajp1mUZ-SII_GgqrX3uAA_oUQOY
X-Proofpoint-ORIG-GUID: _kJOBajp1mUZ-SII_GgqrX3uAA_oUQOY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 bulkscore=0 phishscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190013



On 12/18/2025 6:40 PM, Leo Yan wrote:
> Hi,
> 
> On Thu, Dec 18, 2025 at 12:09:40AM -0800, Coresight ML wrote:
> 
> [...]
> 
>> - Utilizing `smp_call_function_single()` to ensure register accesses
>>   (initialization, enablement, sysfs reads) are always executed on a
>>   powered CPU within the target cluster.
> 
> This is concerned as Mike suggested earlier.
> 
> Let me convert to a common question: how does the Linux kernel manage
> a power domain shared by multiple hardware modules?
> 
> A general solution is to bind a power domain (let's say PD1) to both
> module A (MOD_A) and module B (MOD_B).  Each time before accessing MOD_A
> or MOD_B, PD1 must be powered on first via the pm_runtime APIs, with
> its refcount increased accordingly.
> 
> My understanding is the problem in your case is that the driver fails to
> create a relationship between the funnel/replicator modules and the
> cluster power domain.  Instead, you are trying to use the CPUs in the
> same cluster as a delegate for power operations - when you want to
> access MOD_B, your wake up MOD_A which sharing the same power domain,
> only to turn on the PD_A in order to access MOD_B.
> 
> Have you discussed with the firmware and hardware engineers whether it
> is feasible to provide explicit power and clock control interfaces for
> the funnel and replicator modules?  I can imagine the cluster power
> domain's design might differ from other device power domains, but
> should not the hardware provide a sane design that allows software to
> control power for the access logic within it?
> 

It is due to the particular characteristics of the CPU cluster power domain.
Runtime PM for CPU devices works little different, it is mostly used to manage hierarchical
CPU topology (PSCI OSI mode) to talk with genpd framework to manage the last CPU handling in
cluster.
It doesn’t really send IPI to wakeup CPU device (It don’t have .power_on/.power_off) callback
implemented which gets invoked from .runtime_resume callback. This behavior is aligned with
the upstream Kernel.


> General speaking, using smp_call_function_single() makes sense if only
> when accessing logics within the CPU boundary.
> 
> P.s., currently you can use "taskset" as a temporary solution without
> any code change, something like:
> 
>   taskset -c 0 echo 1 > /sys/bus/coresight/devices/etm0/enable_source


This can address the runtime issue, but it does not resolve the problem during the probe phase.

thanks,
Yuanfang> 
> Thanks,
> Leo


