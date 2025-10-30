Return-Path: <linux-arm-msm+bounces-79592-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4354EC1EDB3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 08:52:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1B2DB19C23BB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 07:52:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32F2433506D;
	Thu, 30 Oct 2025 07:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cyx8e05W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PF5LHk3e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E7730C358
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 07:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761810717; cv=none; b=qMELDcsTpYjchULbXMw/8yYWjW1gqbILWscbH3MHA+Oqi7UXf7+bWqE4qfLCb6rdrrLa57Vloxu55UbhOE+7Lb3nUdws7/VWBEEqQqNHFJXM38WXlG1NAjid8LsBeMZhpE3JHxFG0kgHTT2Jv2qGitN30Vg9hXF1p0EOXrffWcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761810717; c=relaxed/simple;
	bh=FfnDB75K6otOIxPpYHozJdUXlGSkBVYM5hSC39+0SoM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hUT9fTFF9n/QwFQ+W0yuDkiQidX/sVrb7rj4SYizHf70S4dWv3pNEhTpw/KE8U68tBPOq07XVlL1sfFnDVrY6zAfXGIFgsx4wujP9Uu2AupDMSDk10HX40aBvTb+cEZQDFjbHfXVVq3wBusorkzapYNgfrTlmWkeX5rMMex8+0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cyx8e05W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PF5LHk3e; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59TNDOhd569432
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 07:51:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hcncODsbtT/7GjIUkjz2LRYFmMcQthooEGiM4DSrffA=; b=cyx8e05WnxRBwgfw
	exRBlP5QlJ1O6c9fi0iOiLb9tvTW2Mf324u44AQqJKols4lewipUG4fATOi9y6Gl
	4an5GeAmZoCVtib3H8aM7zsvVC79I0lYKjaM4JlOEMCjnq81vRVrEfr6jT9LoLig
	1CXEsRJlCE4sTdYUygslR3tQVrc4Dn6gK1SF309zmrw9vivZWiBh+kVrgiaJDOTP
	0mxOeGTgD2kQVFCUZSILqJBPP9pWTIdFcV5bJwqM1edOB9Cebd7m686nRrHG4HLD
	DRH+7uzrrRO7j9kLXi8lkPmLEyB5uf8xlAegTDNdy6OH+s8ACD9IsMYxx8ySd/qf
	L+OuLw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3m0bjxv0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 07:51:53 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-340562297b9so387591a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 00:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761810713; x=1762415513; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hcncODsbtT/7GjIUkjz2LRYFmMcQthooEGiM4DSrffA=;
        b=PF5LHk3eAMepH3nE+AVxZQLa0Nison4inUYTVVCXPWFbJsVhTnD7wMnnQcEsIyzLWl
         fCrn7r0w71BQUF9B+ccteqR+aR6l+ub+N7awgVbI9sbFfCEaOkxCGuNNgt5d++pgothF
         Owau+ruIqlvk+Ifx7+KQAeRTE8ux3IIAJ4qcrbZL2LRbq335q8c/W+8ejIdHlFLNGUDk
         oL5/vqxJlnLJaZeHn8silDv+6kWlsmf4L4TuoAbq0k97JsxbxqjFPaE+jIddkNDmUhUp
         yMWU7gsNesBaalQb/CWL0ehQSnbKP+duOAIcLVUI4ktURbg1tz+kFBrvicJPPk5qxcqQ
         37lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761810713; x=1762415513;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hcncODsbtT/7GjIUkjz2LRYFmMcQthooEGiM4DSrffA=;
        b=W0gZhnkzLkjxKhYzHSH3GNgnn/AeLhNcOrCwWbWENu2LmkdbrvLpr6sZXIumPzsZMr
         CVxC07Mu67dwdl26Wk9YJmWziF2aIL26iMGwcjMXoJfEKngdYJe1axNyu7yojS20f96S
         7sTKhLppjCO+1/lT7yM3cj5lxDcLO+L4bmbRHWzJxaylT+qEetYoXeK+IjRm/76vRlPa
         ++wzMII4wuL0eX3YcrFCH7h3hVmDvjE8QEG18EUfLjzQMDxWAn7QqUUt15k320a4Gof3
         Ggl8h2swgc1uJdTpnADUcvpVwRiCeXY4cb98MTU4CiYc5UzxtnY8ij3vidmTiOBVMeEo
         xpZA==
X-Forwarded-Encrypted: i=1; AJvYcCW+edpUWqui55MMbzABIM7c5HubwWXuWo0qjfpYblqJVB/wd+wJLkG6Vt2ISgSJUiOvwmau/JjPvGNJPQk6@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2E8XJFmCg+Z+DG64viqeIm/dr93IzyfPpFvoVCbYlopSESxu6
	GXO2UkOLCu7A8YTsa+RtAaBZ42pkyGGflPrU6Ogy0e9vLCys6eCo6rtOAca45DPP15KEhN8gTl7
	CcK1JopswjXIv3EYEsOE2NzRq3rvnotu0feNwjv4H8rc5jpCzyOSBifiwE1cBfQJes2MP
X-Gm-Gg: ASbGncvy74Qey5xWjXmfKfGZ7gTdgld4unWMVmJgXgPueCwiE87QCJX1jkd5ruO8CuW
	uJxA//uCMX88b9dMb/I1y5xpcUP1vIrw8hmNZSm39aSoSe+uDIccFv+0FMJJbuNS8BNFgeTsFnq
	YaE0ke5FJL1i53mBOaJ3abf7MUlVN7lHBm9Nb4+pxQ0197oQa33g57clUxc/Ga3KdNOu647t8uC
	/KJnEYjCBEz8jhq8VlrvGBLddhNYR17xcjyVU9mAG17bGvjSVM9+4GW1UYhsFldrUf7TjsGUAc/
	YbLVR4HiHQ23gyREuUMIf5LHqKaUNUmcLjNMQ1u8k7bm/we1louJ4u3jxeki1ijMeIc/fspNPhW
	0jbVU58NmM0Fw5EwtqBVzCeFBkj4t4pnH1YiBdzoat9WA/JXsEtpmhc8mNBKNvtKKYABTwsY1cA
	==
X-Received: by 2002:a17:90b:2d47:b0:32d:e027:9b26 with SMTP id 98e67ed59e1d1-3404ac69f33mr2679908a91.13.1761810712586;
        Thu, 30 Oct 2025 00:51:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFzKJe1UiPLX/c5XJWRrXE7vIIVW3HA3Z3R5jK4wS0osT1fw6s5ES3OfZ7Gi+U6xWT5LUGFvQ==
X-Received: by 2002:a17:90b:2d47:b0:32d:e027:9b26 with SMTP id 98e67ed59e1d1-3404ac69f33mr2679880a91.13.1761810711983;
        Thu, 30 Oct 2025 00:51:51 -0700 (PDT)
Received: from [10.133.33.133] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34050980cd2sm1614729a91.3.2025.10.30.00.51.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 00:51:51 -0700 (PDT)
Message-ID: <7451a3ae-2b3f-4e07-b93c-0507436d0f33@oss.qualcomm.com>
Date: Thu, 30 Oct 2025 15:51:46 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/12] coresight: Add CPU cluster funnel/replicator/tmc
 support
To: Mike Leach <mike.leach@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan <leo.yan@linux.dev>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, kernel@oss.qualcomm.com,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
References: <20251027-cpu_cluster_component_pm-v1-0-31355ac588c2@oss.qualcomm.com>
 <CAJ9a7VipQh=y0o+6k=fLMMK408E5eGD6vhY2TKBMm+q63NUiWA@mail.gmail.com>
Content-Language: en-US
From: yuanfang zhang <yuanfang.zhang@oss.qualcomm.com>
In-Reply-To: <CAJ9a7VipQh=y0o+6k=fLMMK408E5eGD6vhY2TKBMm+q63NUiWA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ENSxuhRkoAZ_ar7-PnL7Q4fVeWbS8vLS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDA2MyBTYWx0ZWRfX4aO4V/7bGAch
 /I9j9F8cjqukfdCmquZozSkDYcwjJdBKbsk8HUzXeurgICu9N5KbmLpE5GoSuT5e89dp2NQqoYf
 qCcCfocZPdXc+FTh0wKliLqKR2M3ZOakrNj6A83uHZ4Cb5BMwYYGckMCL2s8lw9gTC+0Cl3rSD1
 AwN7laCZu+nFTMVutUqxdatnIEb4/ZGZfZUCqWhcYU6g6WWix5Funxi5VQOV51ekTtBIpCgeTc7
 4dgPEmhyONZ+oFAuTva1a9qGA0aC+dKC9yXnmuER1misfG7Lfv3f9gcKkO1UlfL4dk/DL+0qk23
 sREnx8CRsq21rLZV2L+djk59VQQYA0iA6n5Gkw9CCJ2fSMkJ8h0UeF2A+QB9N9Zg8mvQZ45egOt
 +BVTr2AWIRI+jNsqbkJ2gxN8MwWe9g==
X-Proofpoint-GUID: ENSxuhRkoAZ_ar7-PnL7Q4fVeWbS8vLS
X-Authority-Analysis: v=2.4 cv=YLySCBGx c=1 sm=1 tr=0 ts=6903191a cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=2kWKyKxqX19wIr5gW_MA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510300063



On 10/29/2025 7:01 PM, Mike Leach wrote:
> Hi,
> 
> This entire set seems to initially check the generic power domain for
> a list of associated CPUs, then check CPU state for all other
> operations.
> 
> Why not simply use the generic power domain state itself, along with
> the power up / down notifiers to determine if the registers are safe
> to access? If the genpd is powered up then the registers must be safe
> to access?
> 
> Regards
> 
> Mike
> 

Hi Mike,

Hi,

yes, when genpd is powered up then register can be accessed. but have blow problems:

1. pm_runtime_sync can trigger cluster power domian power up notifier but not really
power up the cluster, and not able to distinguish whether it is a real power up notifier
or triggered by pm_runtime_sync.
2. Using the power up/down notifier cannot actively wake up the cluster power,
which results in the components related to this cluster failing to be enabled when the cluster
power off.
3. Using the power up/down notifier for register access does not guarantee
the correct path enablement sequence.

thanks,
yuanfang

> On Tue, 28 Oct 2025 at 06:28, Yuanfang Zhang
> <yuanfang.zhang@oss.qualcomm.com> wrote:
>>
>> This patch series introduces support for CPU cluster local CoreSight components,
>> including funnel, replicator, and TMC, which reside inside CPU cluster
>> power domains. These components require special handling due to power
>> domain constraints.
>>
>> Unlike system-level CoreSight devices, CPU cluster local components share the
>> power domain of the CPU cluster. When the cluster enters low-power mode (LPM),
>> the registers of these components become inaccessible. Importantly, `pm_runtime_get`
>> calls alone are insufficient to bring the CPU cluster out of LPM, making
>> standard register access unreliable in such cases.
>>
>> To address this, the series introduces:
>> - Device tree bindings for CPU cluster local funnel, replicator, and TMC.
>> - Introduce a cpumask to record the CPUs belonging to the cluster where the
>>   cpu cluster local component resides.
>> - Safe register access via smp_call_function_single() on CPUs within the
>>   associated cpumask, ensuring the cluster is power-resident during access.
>> - Delayed probe support for CPU cluster local components when all CPUs of
>>   this CPU cluster are offline, re-probe the component when any CPU in the
>>   cluster comes online.
>> - Introduce `cs_mode` to link enable interfaces to avoid the use
>>   smp_call_function_single() under perf mode.
>>
>> Patch summary:
>> Patch 1: Adds device tree bindings for CPU cluster funnel/replicator/TMC devices.
>> Patches 2–3: Add support for CPU cluster funnel.
>> Patches 4-6: Add support for CPU cluster replicator.
>> Patches 7-10: Add support for CPU cluster TMC.
>> Patch 11: Add 'cs_mode' to link enable functions.
>> Patches 12-13: Add Coresight nodes for APSS debug block for x1e80100 and
>> fix build issue.
>>
>> Verification:
>>
>> This series has been verified on sm8750.
>>
>> Test steps for delay probe:
>>
>> 1. limit the system to enable at most 6 CPU cores during boot.
>> 2. echo 1 >/sys/bus/cpu/devices/cpu6/online.
>> 3. check whether ETM6 and ETM7 have been probed.
>>
>> Test steps for sysfs mode:
>>
>> echo 1 >/sys/bus/coresight/devices/tmc_etf0/enable_sink
>> echo 1 >/sys/bus/coresight/devices/etm0/enable_source
>> echo 1 >/sys/bus/coresight/devices/etm6/enable_source
>> echo 0 >/sys/bus/coresight/devices/etm0/enable_source
>> echo 0 >/sys/bus/coresight/devicse/etm6/enable_source
>> echo 0 >/sys/bus/coresight/devices/tmc_etf0/enable_sink
>>
>> echo 1 >/sys/bus/coresight/devices/tmc_etf1/enable_sink
>> echo 1 >/sys/bus/coresight/devcies/etm0/enable_source
>> cat /dev/tmc_etf1 >/tmp/etf1.bin
>> echo 0 >/sys/bus/coresight/devices/etm0/enable_source
>> echo 0 >/sys/bus/coresight/devices/tmc_etf1/enable_sink
>>
>> echo 1 >/sys/bus/coresight/devices/tmc_etf2/enable_sink
>> echo 1 >/sys/bus/coresight/devices/etm6/enable_source
>> cat /dev/tmc_etf2 >/tmp/etf2.bin
>> echo 0 >/sys/bus/coresight/devices/etm6/enable_source
>> echo 0 >/sys/bus/coresight/devices/tmc_etf2/enable_sink
>>
>> Test steps for sysfs node:
>>
>> cat /sys/bus/coresight/devices/tmc_etf*/mgmt/*
>>
>> cat /sys/bus/coresight/devices/funnel*/funnel_ctrl
>>
>> cat /sys/bus/coresight/devices/replicator*/mgmt/*
>>
>> Test steps for perf mode:
>>
>> perf record -a -e cs_etm//k -- sleep 5
>>
>> Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
>> ---
>> Yuanfang Zhang (12):
>>       dt-bindings: arm: coresight: Add cpu cluster tmc/funnel/replicator support
>>       coresight-funnel: Add support for CPU cluster funnel
>>       coresight-funnel: Handle delay probe for CPU cluster funnel
>>       coresight-replicator: Add support for CPU cluster replicator
>>       coresight-replicator: Handle delayed probe for CPU cluster replicator
>>       coresight-replicator: Update mgmt_attrs for CPU cluster replicator compatibility
>>       coresight-tmc: Add support for CPU cluster ETF and refactor probe flow
>>       coresight-tmc-etf: Refactor enable function for CPU cluster ETF support
>>       coresight-tmc: Update tmc_mgmt_attrs for CPU cluster TMC compatibility
>>       coresight-tmc: Handle delayed probe for CPU cluster TMC
>>       coresight: add 'cs_mode' to link enable functions
>>       arm64: dts: qcom: x1e80100: add Coresight nodes for APSS debug block
>>
>>  .../bindings/arm/arm,coresight-dynamic-funnel.yaml |  23 +-
>>  .../arm/arm,coresight-dynamic-replicator.yaml      |  22 +-
>>  .../devicetree/bindings/arm/arm,coresight-tmc.yaml |  22 +-
>>  arch/arm64/boot/dts/qcom/x1e80100.dtsi             | 885 +++++++++++++++++++++
>>  arch/arm64/boot/dts/qcom/x1p42100.dtsi             |  12 +
>>  drivers/hwtracing/coresight/coresight-core.c       |   7 +-
>>  drivers/hwtracing/coresight/coresight-funnel.c     | 260 +++++-
>>  drivers/hwtracing/coresight/coresight-replicator.c | 343 +++++++-
>>  drivers/hwtracing/coresight/coresight-tmc-core.c   | 396 +++++++--
>>  drivers/hwtracing/coresight/coresight-tmc-etf.c    | 105 ++-
>>  drivers/hwtracing/coresight/coresight-tmc.h        |  10 +
>>  drivers/hwtracing/coresight/coresight-tnoc.c       |   3 +-
>>  drivers/hwtracing/coresight/coresight-tpda.c       |   3 +-
>>  include/linux/coresight.h                          |   3 +-
>>  14 files changed, 1912 insertions(+), 182 deletions(-)
>> ---
>> base-commit: 01f96b812526a2c8dcd5c0e510dda37e09ec8bcd
>> change-id: 20251016-cpu_cluster_component_pm-ce518f510433
>>
>> Best regards,
>> --
>> Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
>>
> 
> 


