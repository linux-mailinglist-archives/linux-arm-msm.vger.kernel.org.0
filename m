Return-Path: <linux-arm-msm+bounces-78626-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D65C02425
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 17:54:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B497C4E00EE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 15:54:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4089E24A079;
	Thu, 23 Oct 2025 15:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W7/7ZX0k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5743245006
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 15:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761234859; cv=none; b=fZgElcF8lnne47TzwdDX2IK+wjpLXrmAPKYeggsKvdLjQO1cWw5sIRJ1wZwWAAmW1o0xMXv6X011Dap5zahQiX7f/HhGo8V2iGewxtchbLXHhDIPS66UzlTmffRzKSDozcDxGJcurI90wdFj+X4zWVgmBQBacM9+wIX6UpaOsbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761234859; c=relaxed/simple;
	bh=L6ZUAf2g56f0pbLijFNIC533CJWAt9IDFeMaFeWyyhU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iISyudVbAtnrjqrQs9DkunwWTIGN8h4skzfdue2FYnXGvEhuaZmSE57yzC4hV/LqsE/SaNRkXD0J2TrDfGITJp12jtXMs6SlNvZeSlbCMnDpGKTxr+CZQpSHnGecAy3iziGWB10oKPuWuRAadjc83OQcepFSrYSoX8VkkwE8czs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W7/7ZX0k; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59NFUfpf026145
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 15:54:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OIzxKAenz0uP2vnqlUCHL0UbaGItN6WBFXym1N/6m4k=; b=W7/7ZX0k6LVGb9pB
	LqR4H1OtSyiHJV3mKcQQBzX26/ZWmosBILOrtFI4XViImHT0v4bPwI7DePKHlM7a
	Iywgt3+/tnQzmvheeGLE0ygsjSemUxtPM8o1wh/Avk8TzLzM9YJ/l0oWJy2fL8nc
	C8hamxjPe4QUlaq/SVbFPmX7oLuVsDz6gTcLSKqle1pRA6PCnG/C9kRcDqabUaZ/
	Aibr/eWJaEw0Fpe0A1gGfka4zxmo76a++DgnUs/MT2DlvBVyrimbl5k01VQ8WZJY
	y+3k3ZCkBukTY7TI5vLT27pp3pT2hM0ljjw34JF2025ydv4hBl2DJMBQee7Oo+QW
	JgBpLQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49y5x8k532-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 15:54:16 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7a27ec82624so280831b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 08:54:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761234855; x=1761839655;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OIzxKAenz0uP2vnqlUCHL0UbaGItN6WBFXym1N/6m4k=;
        b=mgZee2Xr9xJetImAmo+sQxW9a6O6fevoEVmDwC0GoCIXNDFLP79U7SmTewVijU0I8v
         wrkBLyAsPgsTYIZcsHcs3GxJFOUeaR7AiwhpNa1QWLE2fqTRUlunjldRcsM0AqkDtCfx
         oHXoOC1Sxf1MI2DFODsYmSmCHH48WrTPLuawxNYAnpM+tvu3u1qsGEvJyPy1XFpnZ/b2
         ZrtQeHwUzkbn0WpNUOYEtgiof7gSUrE3Aqmzdyqd74/BvgDqmcJrrwvkeIvSfM0fia9U
         fdJb6I+evCeTQWa27lC+o6esB1C7RemzHZ4g2FeLr+e2synY/E9VRQPaoXR6F1e9JYtw
         z6Kg==
X-Forwarded-Encrypted: i=1; AJvYcCUaoNvSBzv7tmxYct5y8Sl8V6+9Ro6kCEtoe91xPplrC3QlkbEWRYMlqGM2bmkj0IpqJztORpWYXPsero2O@vger.kernel.org
X-Gm-Message-State: AOJu0YxXjSolCNpon7OU0zCKa+UFc/dGhaq5HSy/rgIm3s3WJzQz2XJ9
	WY6uNckGdXd9utkao4uFpor9MXyXZGKqyetjltyqY7/UVXZ3woELVX+WE00LefOcEZdqwDlUwo0
	gr4jeQrOyDqXFmL+YFPlfyLKDRRNQ4tAy3zj+PPU/IGVyG9Re+JcBSNmRzRb5OixZlSrtZP87K4
	Pf
X-Gm-Gg: ASbGncuGlI1XHET6PDX0AHpbe5I9/BG4ituh9Rsy/b5y58twNwKFJPzQuA/0YP8TXQ1
	uVpzL40CeoTO7qP/EbqUB7w+KIOoAMvl0qPxvZ8/UfFi5ANJFud25b+g3JRy6KcVt33YkrJf9is
	r9NWCiQE9kgKH7vWg7ITviQTKHArKY9WGL5ireUsZmbOr7jWLwNuxohr46+Wyf3kpHY+QyCc77T
	YrsNj6r/7nWX1rXNFh8fsACr9/gGKeUpGHvGByiA4d4n6PXreboRA40GTmFdpJy7wYEsroZMiDt
	kWC5UA+zi6w+czPOL4rMVH6TEPUMqdShDFHD43W5XxtOY7bhOCB09bULGo8pvtG/EcpoqofPbHl
	HY/R9pbkgH9DiXObkDKapdXywTOBemRJm
X-Received: by 2002:a05:6a00:22d4:b0:774:1f59:89de with SMTP id d2e1a72fcca58-7a274ba902amr3397205b3a.11.1761234854993;
        Thu, 23 Oct 2025 08:54:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+RNZjlAZ/HGhfeZvjXwH2L38Bx85+VCX5eW1fEPyVsXUTievo9QBpW0YYKx7Ywmq/s0eAjw==
X-Received: by 2002:a05:6a00:22d4:b0:774:1f59:89de with SMTP id d2e1a72fcca58-7a274ba902amr3397174b3a.11.1761234854497;
        Thu, 23 Oct 2025 08:54:14 -0700 (PDT)
Received: from [10.216.6.161] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a274dc33desm2913319b3a.71.2025.10.23.08.54.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 08:54:14 -0700 (PDT)
Message-ID: <0e49a6b0-276c-85b4-3ffa-39e5412db522@oss.qualcomm.com>
Date: Thu, 23 Oct 2025 21:24:01 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v16 05/14] power: reset: reboot-mode: Expose sysfs for
 registered reboot_modes
Content-Language: en-US
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel
 <sre@kernel.org>, Rob Herring <robh@kernel.org>,
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
        John Stultz <john.stultz@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Andre Draszik
 <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Srinivas Kandagatla <srini@kernel.org>
References: <20251015-arm-psci-system_reset2-vendor-reboots-v16-0-b98aedaa23ee@oss.qualcomm.com>
 <20251015-arm-psci-system_reset2-vendor-reboots-v16-5-b98aedaa23ee@oss.qualcomm.com>
 <CACMJSetWthCcJo8v7EuUK-aDKhf5KTNG5WQQ9aTQu62B+E=DMA@mail.gmail.com>
 <8fb6e8e0-cdca-0bd5-d0fe-56b5f6d27a5c@oss.qualcomm.com>
 <CACMJSetTrze028iXmH3i=JguJy=aNOMcnkLhO1ewYNiusvVmgA@mail.gmail.com>
 <efc84b92-43f9-ba25-1259-ae3907273af4@oss.qualcomm.com>
 <CACMJSetctEH4K58R9JvSYNzzYgE0NGMsAr5JxiZ4RH_3T08x-A@mail.gmail.com>
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <CACMJSetctEH4K58R9JvSYNzzYgE0NGMsAr5JxiZ4RH_3T08x-A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: PgjxWRUYqT-dMh1-LQWeIRGOciElSHuT
X-Proofpoint-GUID: PgjxWRUYqT-dMh1-LQWeIRGOciElSHuT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDE2NCBTYWx0ZWRfXzvYFz5X7kuIM
 +eNfVWJXoAbbigLeXBD/hg+mlXsZZkkG/MNdStYTfyXE5kJKVwBE/AOlgpU3fokK6LOh25QokaZ
 9G0Y2SnicYFshU2ar9Et6FLdoLyprg9JzbVdY3ARmAqFMFgvT+OmGPmkHAXl5mAmUvZNrUK00QW
 6wVj1Y2tXhQ068YSE+iUwjWnbpPfQOpwaTZA9dFLxrt5KeMuXQbAfTJFl8bDb/3IpRA4+H9vHmc
 yO6RDjGWRJlv+SBYxOpkLVdCSC17rkGBXC2vKZJw9pLPVYE8IlfRr8NW6ut5sThjjft9y0V84Bd
 k8E3pGpQJ1TRsNuyW1bPL9yXLB3Zb1+75BDgtkYH85yx3ozGC22g0elbWcxKBAfGGd35JK9OCmG
 z8X8tRI5rrRwlkxfyp8Onqb+e843Sg==
X-Authority-Analysis: v=2.4 cv=UOTQ3Sfy c=1 sm=1 tr=0 ts=68fa4fa8 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=rypWqsooHcgQ8WysroIA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_01,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510220164



On 10/23/2025 8:32 PM, Bartosz Golaszewski wrote:
> On Wed, 22 Oct 2025 at 16:21, Shivendra Pratap
> <shivendra.pratap@oss.qualcomm.com> wrote:
>>
>>
>>
>> On 10/20/2025 1:10 PM, Bartosz Golaszewski wrote:
>>> On Fri, 17 Oct 2025 at 21:40, Shivendra Pratap
>>> <shivendra.pratap@oss.qualcomm.com> wrote:
>>>>
>>>>>
>>>>> If you're using devres here - at least make it obvious by adding the
>>>>> devm_ prefix to the function name and make it take an explicit struct
>>>>> device * parameter so that it's clear who owns the managed resource.
>>>>>
>>>>
>>>> sure. we can add devm_ prefix to the function name.
>>>> reboot->reboot_dev is an internal member of struct reboot_mode_driver *reboot.
>>>> The struct reboot_mode_driver *reboot is owned by the calling driver.
>>>> If we want to PASS reboot->reboot_dev to the devm_ prefixed function call, we
>>>> will need to kind of split create_reboot_mode_device into two calls - device_create
>>>> in a separate function and then call the devm_ prefix function where we add the devres_alloc.
>>>> Can you suggest a bit more on this?
>>>>
>>>
>>> Ah, ok I missed the broken logic here. Devres should only be used in
>>> devices already *attached* to a driver as all managed resources will
>>> get released on driver *detach*. What you have here may "work" by
>>> accident but that's not correct and is very fragile as soon as you
>>> have some non-standard behavior or error paths. Devres won't fly here,
>>> please just use regular allocation and free whatever you need in the
>>> corresponding release/free/whatever routine.
>>
>> Thanks, got the problem here. Was using devres to associate the reboot_mode struct
>> with the driver, so that it could be retrieved later when reboot_modes_show is called.
>>
>> When reboot_modes_show is invoked, there's no direct way to identify which reboot_mode
>> instance is tied to the current driver, as multiple drivers can register with the reboot-mode
>> framework at the same time. Without devres, will need to maintain a global list of mapping for
>> all device driver structs and their corresponding reboot_mode struct. Then reboot_modes_show
>> would have to look up the correct reboot_mode struct using the device driver's pointer.
>>
>> Hope its ok to maintain that separate logic here?
>>
> 
> Why can't you just do:
> 
> device_create(rb_class, NULL, 0, data reboot->driver_name);
> 
> Where data is whatever driver data you want to associate with the new
> class device? You can then retrieve it with dev_get_drvdata() in
> callbacks.

sure. thanks for the suggestion. That will make it much simpler.

thanks,
Shivendra

