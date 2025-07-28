Return-Path: <linux-arm-msm+bounces-66887-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF43B13F92
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 18:09:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5D3223BB22A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 16:08:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F18C1EA7C4;
	Mon, 28 Jul 2025 16:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IefhWrKl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C92A71DA5F
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 16:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753718897; cv=none; b=l3OhLzfpdEtu2680YwkVKx1IfQvd10o5PTJIdE9V+NSwUnmDhE+au204zSp7obajzWNy1x90JQyFStqLUiuoCFraor7xlqfUhP3tGAcQYDWKe5I3oo8/0F7K42C8YPUYhsoo21ynHuwEy9ES6d5bB6SJpET4PWIVJgrzbpflUnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753718897; c=relaxed/simple;
	bh=Zzx5ymIWUOo8rnDAmxJ0+FyVd+R0IXJxbDDNfuUz5lA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NKlp2bbQnbPIpYVVU99J+hPC03DIOZGi2JaiOn1N9fjq58ND1i1E75xDga/D61KPc4+bs+LjPUD1vVOJgpqzjpTFCuQl42A75qYDM5gMZEcDsc9samI3EzXgIySQZLKs0YurnsLk4Z0wsPRIpPvBvUqVMkcAq3Y+wm9sgpLGthY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IefhWrKl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56SAlIcL027637
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 16:08:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nn6sa08jrce+SrXB4mT8Tl+55LBGQlikiUQGmI3nyYY=; b=IefhWrKlB6nwWDNl
	TYQrgeN8mN/bUA+p8NXEabI65ZA3nD0vYV21+12VQDKlTEBxEWfuNGyxbI8YK0Z9
	vUv95DIGylToYjexSMCeGWoR2NtcMbtxL5lIQ3+v2SO792To//malVkDSuEybKxm
	9B7jkDsx4usbVsC4Zr6YLKwCWAIsCoPiYfqRB01gummBqpnuJzzgaY/QGTJQdzu6
	gs23oKaFZTWZ4xeBIXk7cf19j6Zi/qQ5vkDe/xk86tP1HYzTAhmqGG0XHI0rArD+
	O3mC6ZQvKQDeqklhejlG5dWuhgqm5MSScxDIUF7CZqu+z7ksOgP0coO0rpLZ3Zdt
	Hpm2BQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4860entc72-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 16:08:14 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-31ec78f183eso2080153a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 09:08:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753718893; x=1754323693;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nn6sa08jrce+SrXB4mT8Tl+55LBGQlikiUQGmI3nyYY=;
        b=dV9m1yIMZLciwFgWaW/8tlh8NNroqAJizDRldi43Y0G2ueXZaiDfd4yGaHNCMbcnRu
         crvsJvasa907KsJAtsom17LoFfh4K+151jlzNx7BQwTULeNnWdE0/VK8uVx4m3M7Ay7W
         2a9pr5p5fi0mMOI6hdUCqn5jTPPkx8A6rRh6n4y5jgL8JXiqTjb9yf8qzmTYvlu1zG9K
         h6VQ6p6lJlY7JmQ1fXb65rwZGZ8W0DjdIN16kc70swUIeRCKMVek8C8YuIJ4JT2vYrOg
         g+jGhp0lZ2gidm6h5+gPoktLz8aifS5yOtajb8/02cw5v+8PfBl1nOxKx0YX8jy4F7jX
         zthQ==
X-Forwarded-Encrypted: i=1; AJvYcCXONSAEpd9x/KPGGlVUOJCNQqMC1JIIFx9AueqJSHNPEsUNM3b0/RfXnajlN8xSzhx52xATQLprjfLym2zB@vger.kernel.org
X-Gm-Message-State: AOJu0YzovOn1ndl7kcr2mexyMNzJ6KMR+y32ndWY7DrjfP39VO+h4dNO
	FhJMlsWqKj4xEREPGN263C+MGVhlxFKCqYeQSeNN58y7OjfJ6J6tmWiMtbsz9c43ydrnqmiu8AE
	XnomZpLLRfAj6/w909yWg04WLEPcPnhZv0L/EB07uY3Zk5H74YcXG58OHt58Gllw46qZE
X-Gm-Gg: ASbGncs6XPxd9TVQW6Jw1v08McPNwdyOHaRjAzuC+qqudbRIlScGD9EJMI/QZKhGd6h
	Dd0h1m96hq5Axb0FS0kVnbW5U7QYXWIpSVK1ZnJFGXsK7SNAZmijgXGNBpXOcyfmYGMJcTKa2vt
	6JGaUN+06LY6jvwOb2Wevce62+LowBoGPl3hWvM9LkIiW7inyHEJF+sR6yUUWQhSQo6su7f4jaB
	wfS6ss0bT++PhLINJCR5ypA48Nzd1nXyArYANdqNkKOBVHqgXALydaBKhlxtZi63E+hN8H/v/So
	oHaUYy8yPSoxPUXpmDo4IcMZcn9nmUUDGBz90H0cH34tOyYLlW7rcSdpLxKB3V8ohHw8DkIzx2K
	L
X-Received: by 2002:a17:90b:58ee:b0:31e:1311:2033 with SMTP id 98e67ed59e1d1-31e77a1a541mr16647257a91.29.1753718893359;
        Mon, 28 Jul 2025 09:08:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGdgFqQRwLc4WbeRsTRyBtIJODCU+0G/vz7UTUiQVGLbmbQjHXF2a2GFm/CzGuJHOKwTFW5Lw==
X-Received: by 2002:a17:90b:58ee:b0:31e:1311:2033 with SMTP id 98e67ed59e1d1-31e77a1a541mr16647145a91.29.1753718892672;
        Mon, 28 Jul 2025 09:08:12 -0700 (PDT)
Received: from [192.168.29.115] ([49.43.229.94])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31e66376377sm9863788a91.28.2025.07.28.09.08.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Jul 2025 09:08:12 -0700 (PDT)
Message-ID: <46261176-199b-4f6c-ceb4-14646087c814@oss.qualcomm.com>
Date: Mon, 28 Jul 2025 21:38:01 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v13 07/10] firmware: psci: Implement vendor-specific
 resets as reboot-mode
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Vinod Koul <vkoul@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Andre Draszik
 <andre.draszik@linaro.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Srinivas Kandagatla <srini@kernel.org>
References: <20250727-arm-psci-system_reset2-vendor-reboots-v13-0-6b8d23315898@oss.qualcomm.com>
 <20250727-arm-psci-system_reset2-vendor-reboots-v13-7-6b8d23315898@oss.qualcomm.com>
 <b81aa592-a66b-457b-9f42-df4505b28508@kernel.org>
 <3gtlf5txxtioa5bvo6o467jupyoam4hjhm2mdiw5izv5vbl3tz@drndgp3tcrgo>
 <bcef34c3-98b4-454c-8138-c73729e17081@kernel.org>
 <5e2caeb7-360a-4590-a36f-ff1ec4c20d31@oss.qualcomm.com>
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <5e2caeb7-360a-4590-a36f-ff1ec4c20d31@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 7Aed9Q7SIpXk2ka1h-gA9bLrCqiq-EHr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI4MDExNyBTYWx0ZWRfX4wf5WzewupUh
 k4pIf09K1XCyzgrlDkxTqwSMM9e8dNaXv2xYLmAE3gN007NYzWwRJG+Am3fl2aFq23gZ+DsjouF
 e6+3IGFznTZQYQ36c4ygr4aAJL6AAR9CYYKEzWW4z0zJE5cxIKtAUFY0pDUeduDYddroI7Hp9Hs
 O4UYDUWv049+QpSNWQtrs3S5mrugU4waDhog3JoMIkvi3qgeM84LgLanKubn8pY8hmTadGvr1aG
 EvZJAL5SNL6QZrtGINEgHMv2cKclQSA5BLkaV0GM/sgDJ5/xyc069vo2IzDg7LS+DdH/Bn9V3Z2
 oX7sCoIF6Hvf9D4OI4WDBwAQsqvyO5Lj6y27QvvpQpxdHs8mAOLHOETMTzyNIRsQTGghSDOPBdZ
 eK6UKnFeHiO8dXvuYPs5K2oEezqZzhrgzLJneACEqwslIRPU4TBHbkdIP9c+th66+l/ClTM9
X-Authority-Analysis: v=2.4 cv=DIWP4zNb c=1 sm=1 tr=0 ts=6887a06e cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=sFC1+cT0Mn4vjRNJ/HRkpQ==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=9xdhny6Toa8R1GZ1QJ8A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: 7Aed9Q7SIpXk2ka1h-gA9bLrCqiq-EHr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_03,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 mlxscore=0 mlxlogscore=999
 spamscore=0 impostorscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507280117



On 7/28/2025 5:33 PM, Dmitry Baryshkov wrote:
> On 28/07/2025 14:52, Krzysztof Kozlowski wrote:
>> On 28/07/2025 11:44, Dmitry Baryshkov wrote:
>>> On Mon, Jul 28, 2025 at 06:53:14AM +0200, Krzysztof Kozlowski wrote:
>>>> On 27/07/2025 18:24, Shivendra Pratap wrote:
>>>>> +
>>>>> +static int __init psci_init_vendor_reset(void)
>>>>> +{
>>>>> +    struct reboot_mode_driver *reboot;
>>>>> +    struct device_node *np;
>>>>> +    int ret;
>>>>> +
>>>>> +    np = of_find_node_by_path("/psci/reboot-mode");
>>>>
>>>>
>>>> Why are you looking by full path, not by compatible? Is the ABI - above
>>>> path - expressed anywhere?
>>>
>>> PSCI node is required to have a node name of psci, it doesn't have MMIO,
>>
>> This is true
>>
>>> so it resides in the root node
>>
>> This might be or not might be true. It is not defined by ABI. Anyway,
>> you answered where the ABI would be documented, even though as I said it
>> is not (/psci is not), but does not answer to first part: why you are
>> not using compatibles which is always the preferred method?
> 
> That's a good question, I've added one from my side: why do we need an extra late_init call.
"psci" registers with reboot-mode which creates a class and a device under it for exposing
the sysfs.
psci_dt_init is called very early around setup_kernel. At that stage the class creating fails,
so psci cannot register with reboot-mode at this stage.
At early_init, the class creation is success, but the created class and the sysfs does not
enumerates under /sys/class/.
So i added explicit late_init call for this where the sysfs creation seems to work fine.
> 
>>
>>
>>> and the reboot-mode is defined in the
>>> previous patch. So, I'd assume, the path is defined.
>>
>> As I said, path is not. only psci/reboot-mode is.
> 
> Do we have an _actual_ use case where PSCI node is not at at root node? If not, it's obviously a deficiency of the schema. Could you please provide suggestions on how to describe that in DT schema?
> 
> 

