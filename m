Return-Path: <linux-arm-msm+bounces-78339-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 098A4BFC716
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 16:21:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D8E154EBC24
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 14:21:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31E1134C143;
	Wed, 22 Oct 2025 14:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kaij6nZO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE703431EA
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 14:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761142887; cv=none; b=T6OA4RmTnj0Fk3IGqXbywFjeH3RmAl2DsbyHKj2n206Rzq/asZ6m86BTCR/4eLy8N3odQdBQ3FM/myRFXtyRH2h+j/FnkE3EtHh3hlGdHg5bydbMnQAzbcg/B7VSPqQwqdTs8VeanwdmznDHFwV7Ub9QlucOrmmr5ue/sp2o8NU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761142887; c=relaxed/simple;
	bh=b3uPlBhFSJi9ZQ1fziRdHC+I8eyaclv1pA5efxRoemk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UPGN41x4QhlNXucyGEUFNICiHmXdNEmEOYYVYkNq3urOlZtSYH01yIjIdfad/t0SdCp7X0BggW8g/t2BoCoPM4FgGUWN+SnOi2RL9aScRhW7KIAP2Behr0NaFpFJCOo7siQpNDhZCozKh8a65GXa6/KFSVNMRM0DK9SWwuP7p9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kaij6nZO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59MBW0Vn027617
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 14:21:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q8F+X3+wN0oxbBadx3SHyMbf6X2kDJDWo7WkuZHB6Sg=; b=kaij6nZOfzi6M45l
	rhgTu4EBHYKUVMi+XsvzTeks8HDKCdaTj41W6LNOQgBKjPLBXSSeudVDtXbNK++v
	4vjI9RGnvS/ufFE5xkXZA6rvXob2k59mWy6xV9eGNdmBhtqmA5zRVtbEmz03nkZq
	Gg/dkP8QiiSlM9M4iRpdAmuw99sc4uVW8EFZTRzarudY4ZxFcvZXluNF2fnNFuMs
	jWQcsOJjD83U+RIWkYFLLS5IgDgKj0SdxcFZztcqJAKLiPgAu9fCQQok4btnteOb
	s7Z2X5cVu5TpPbq7EZsXLZlnt1edTKwPBdjw3Ed3aa34GWa3UsKA5kYG/UcgQT19
	GW8EZg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v27j4uvs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 14:21:23 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-780f82484faso4971281b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 07:21:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761142882; x=1761747682;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q8F+X3+wN0oxbBadx3SHyMbf6X2kDJDWo7WkuZHB6Sg=;
        b=FrC7SDp6nWFKrlPWjBupggTQ4ePfNSubPQT7cxOJqC9ec8PuQpz/HiNfV+ufziB1+D
         k628UA1Rsylkz9OqyAPp6zRtct0ZP+0czIMe/mcXR9eCzRkCD41atjJfbT1Zu90fy25c
         B8QaJwd16VRjYwo7hRvKaCPSpg17PB3XbjV0ylSmWSloAcjOMHRE8D/7eV46n+PCr/rj
         zGKH61vUW9cc5TQzYbxE4w3Wqgp9KRpW50iBI/gpNIJ7hfuLHHvunfqOAv+GirTf3yhL
         DbqvkrwQpGy7m3lqPUq/kyKZzlibQowekMQuOusOtrCXkCIFrZ7nJQPLM9RQp0xu0Vb1
         VxPA==
X-Forwarded-Encrypted: i=1; AJvYcCUkjZWGuASi54GRhu3RUFXRbEwhMqT69oYcMtKx/QsZHg2rL0abH/YYu7T63EV/gql28m7WYUi2l0qeUzdB@vger.kernel.org
X-Gm-Message-State: AOJu0YwW9gPsczP/M0SAl5fu5Ia/T6NDwlw9SSgPPpl4SMIO5uAGIz9P
	wo8Yv0cjfaA4vD1PlAOq7M0n7XghT7P0UXcSGWieBxDR3YrQwHIaOwgugPzLPRVpKSdO69s43ME
	4oTEtUfwjhRsnxaq6Rhu7a04bGoyyXMu3f0zvNexwSsfcdjT0jQpAekWGMPX9776A6pYF
X-Gm-Gg: ASbGncvuRQNcyjQ9JkDDTRg7pnjbu+dcgli2hS0+NiAkQsxdp3+xMxh0OAgRZ0J8a4M
	kvBV44awnUeAY3zD+B4nl+HBvqbgJewQXntt3MAljQGKMVRDVuculzM8K6NumtCatneLmAmj2gr
	/BrP3Hap2QnOho2VHXWXEz2u697DNfaQqrh/+ESQcFrqXd49kxj2/B9jllBHmRIcyTR6PfHSixQ
	/UhQqbfA45IGsvwMmkoXnUzSlz/kp3aTxbsqpS+GfjSARd3+iVyIUZQyQ4A6hst1/j/0tsF4BUv
	1XgCRSoIbPPhyfPAittn7IL6swmf9Wa1JkXGtTMMOjGensZ+ycpjUjiZItWWMTZFIKKXCrt12QF
	Cc0n2fT1WcqlA/RNtJaeQjT2VAhKEtNjypQ==
X-Received: by 2002:a05:6a00:1c8b:b0:7a2:6a86:c79e with SMTP id d2e1a72fcca58-7a26a86c860mr2191958b3a.24.1761142881554;
        Wed, 22 Oct 2025 07:21:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFD1if09QbpZ0dFtUilgWx94rYjTY53E2gZyd9bH58StesMW+afVzo8P4m1jCTS9rTSPWBDWg==
X-Received: by 2002:a05:6a00:1c8b:b0:7a2:6a86:c79e with SMTP id d2e1a72fcca58-7a26a86c860mr2191912b3a.24.1761142880900;
        Wed, 22 Oct 2025 07:21:20 -0700 (PDT)
Received: from [10.218.16.150] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a22ff39654sm14567575b3a.31.2025.10.22.07.21.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 07:21:20 -0700 (PDT)
Message-ID: <efc84b92-43f9-ba25-1259-ae3907273af4@oss.qualcomm.com>
Date: Wed, 22 Oct 2025 19:51:08 +0530
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
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <CACMJSetTrze028iXmH3i=JguJy=aNOMcnkLhO1ewYNiusvVmgA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxOCBTYWx0ZWRfX3GGzCEU7CPOT
 VQUAqXHgAEa1ez6AzbulFB1H1PPTbNMfHw+Du4V3Bt5qNVAlB2w/cQP6RVb06ribLC8fxzBF6Lc
 odjJdR1R9wMLMy8Yw891DELBVpEkulgdb8rEcNtBN1jbshsEtLjcZSFS2x0Xyc/cUWuqYd0NCe5
 nbZHqPDchj0uc3WG3nOCU9ExfEKy/DunX38ZqvSvlm+XxrKPJ0x9qRJHhFd4hXdOUj3tjYqGWAz
 38OrVj4t8iP0vk/bJA682AAFCYjRbLEa83B7B+vfq3KWJ7NHFNMoSoB6uSpmE+orKD3C3vid5dg
 TlY9AB48WSFq7DwSxbR/KyAwqsYjjz5ArtLQvrPBthie3itj6XJZbPFKdMf8grVaxHqKHlxj8Za
 oW9z28/cvJaANtWFTTTFs7ca6QBiWw==
X-Authority-Analysis: v=2.4 cv=G4UR0tk5 c=1 sm=1 tr=0 ts=68f8e863 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=vdIc-WJG1MBaYulAjwQA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: RQrWz6aODXMdF4YEXacjaNPehScBdN4w
X-Proofpoint-ORIG-GUID: RQrWz6aODXMdF4YEXacjaNPehScBdN4w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510180018



On 10/20/2025 1:10 PM, Bartosz Golaszewski wrote:
> On Fri, 17 Oct 2025 at 21:40, Shivendra Pratap
> <shivendra.pratap@oss.qualcomm.com> wrote:
>>
>>>
>>> If you're using devres here - at least make it obvious by adding the
>>> devm_ prefix to the function name and make it take an explicit struct
>>> device * parameter so that it's clear who owns the managed resource.
>>>
>>
>> sure. we can add devm_ prefix to the function name.
>> reboot->reboot_dev is an internal member of struct reboot_mode_driver *reboot.
>> The struct reboot_mode_driver *reboot is owned by the calling driver.
>> If we want to PASS reboot->reboot_dev to the devm_ prefixed function call, we
>> will need to kind of split create_reboot_mode_device into two calls - device_create
>> in a separate function and then call the devm_ prefix function where we add the devres_alloc.
>> Can you suggest a bit more on this?
>>
> 
> Ah, ok I missed the broken logic here. Devres should only be used in
> devices already *attached* to a driver as all managed resources will
> get released on driver *detach*. What you have here may "work" by
> accident but that's not correct and is very fragile as soon as you
> have some non-standard behavior or error paths. Devres won't fly here,
> please just use regular allocation and free whatever you need in the
> corresponding release/free/whatever routine.

Thanks, got the problem here. Was using devres to associate the reboot_mode struct
with the driver, so that it could be retrieved later when reboot_modes_show is called.

When reboot_modes_show is invoked, there's no direct way to identify which reboot_mode
instance is tied to the current driver, as multiple drivers can register with the reboot-mode
framework at the same time. Without devres, will need to maintain a global list of mapping for
all device driver structs and their corresponding reboot_mode struct. Then reboot_modes_show
would have to look up the correct reboot_mode struct using the device driver's pointer.

Hope its ok to maintain that separate logic here?

thanks,
Shivendra

