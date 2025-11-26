Return-Path: <linux-arm-msm+bounces-83504-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 01564C8B51D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 18:48:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 0585135C4B7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 17:47:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94E19327219;
	Wed, 26 Nov 2025 17:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cT7W2fXq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AKmryIKf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A78A4306486
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 17:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764179004; cv=none; b=RzVu191x8Klvj1tj1/ODIkAUBee5kFOp4TTs4C0fnw0gZ6wD1p4T7bHLezwpYYzHgf2swWZ12yi1XQP3uJ7xej79F3pbBHXaNdXNSjki9Jku2XbyXESl/Qo2AhcFRMHCBQky8+HDFHwa2BwjnByfUghbVSdEh926xOYmDXKvAWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764179004; c=relaxed/simple;
	bh=Dbd+U+20t5jh3oo5fqXo2LWhcFGP1dtMaiMN1N4Ea2s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B9UWV5winf/QtaX3/vvsTvU2S50KPo3gdJB8WpuS6IdpXZKSpD7kmnHvFb+cTIxNHxYP1Db+hPtZ5KSi5evSXKHYDee+dffNIb6RXTnrj28Yw4oeD6ozUy0BX61K/jdz7a2z5ECEtkPMwGXoYjFfrQsaY5GVwsqhflb+J+Csa4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cT7W2fXq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AKmryIKf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQEW6uu2356554
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 17:43:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/4C1ziBJx+mjYUbjAmhSYYfbHlaOdGG35KslyrE3v6A=; b=cT7W2fXqRsVUJVhr
	soy3LpKx4+EudPDBbmHgPxQC658fh1GhRt3sz0AtOpj5oAlo2lsw/IvKlUlmMLvq
	9jpZi1PA4ZSz+vkCu7/euX6E9XelQAyIr1Qlmi5sbXlJTIAsPom3kppk35kT6D3o
	3JgSjtVyPxVE2bo9+QtsviFVMUc4FoWuvCz1BKFp0V/AiJERp+JR91wgboEHUTcz
	jthMGHIxQwe1BrkYD3b3W/9k3+7Yo839uA7u0IuA2VuEQ76xW2Jipsmyxo799EWY
	XFvjAoNOV3q8jymyoQAFrdRW8HkmiHMA6Xyow/IPuP95CwPfm3YJ306ePs/+NyQB
	RKkwnQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ap3d1gkp9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 17:43:21 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7be94e1a073so14879239b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 09:43:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764179000; x=1764783800; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/4C1ziBJx+mjYUbjAmhSYYfbHlaOdGG35KslyrE3v6A=;
        b=AKmryIKfYJhS9OvpL6hbeMV4J31DzUXobfcId8oDliPSsWlC4nQkKihcLQrrvYzxt7
         Mzo2l9Z/iKubnYASmfHOZFli3GrhNQRAr9ay5JEpfLFOCkFPoaGBCeAZ+JhxwVOrM1/A
         KNzplsVKiuVe3+bq2WNsNjqGp4s/0/fk6YqHfQGqoDhoWh/4ozxFun/trZMepk7Wlg4S
         K1TrD6vZqITNoiD3FgBgrzPJ1xoKh2AFxxMV8XIBCzdYIRndWHapDDGFaVMmxHTSNVQs
         D1glJX/JNMgxVhLZ1SkcZopgEjOzJv1zE+fa4mpadfNn94BVt8b2U2K7iy1xOxNNEGZW
         yFeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764179000; x=1764783800;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/4C1ziBJx+mjYUbjAmhSYYfbHlaOdGG35KslyrE3v6A=;
        b=RAnIHkw7NFY5UcM57r7bQSZGgwm0AwixCACx2g53REyQIIp725/n223wPioFiJQXzd
         HaisTuo23iXQ0HHtJ51/KzMPvsMQeR9V4YVlBeWGF6394vCb3+DHiuaUzOIc9ZaLSVtM
         bCd/UTC8TSumD199m8QdS7zyk9Fk1JYJEA/90vhudzK9PNGMmTEgISvsVSM6Q3DGLmnD
         UvYECJbWLwFki/JeBazsq4ulkU+DBJiqlHaHPyHg1EGf+NCR6IODQYPeF4B5aB227WOD
         52XSR671MmouG4+J+UWB1DPQPPetzS7Njds5SJUq77DCEWURi+xZYlNL9VdAiApnjKwg
         cVZw==
X-Forwarded-Encrypted: i=1; AJvYcCUc0L86MVT+He8xIzAu2kj9bdFJBTS5yJq+QVe0k20p6ipD442vYGn/T9hMx2uEt9sMwV4MYrUMGQ3eTWOj@vger.kernel.org
X-Gm-Message-State: AOJu0YyBfgN7M83Vpb0HWQJ6wHFKkAMCGLBDkD91zWqpjaLtd03Y1fz3
	qt4mMEbF9IVK0x+pw5gRaatoMl0geJGjPRd6qxWVXTsiLpbUCHYPvqW8pRu8rYyv23VGbt5n6R0
	Rk+4Cvtdo3QSP98qLkMC5FhX0Pvm4jkoqVdEVTk/3RDjKfQhYapSyKpq5O1dwHcGmM/5H
X-Gm-Gg: ASbGncsGT8y24XDadQGoKthI5b9S+iG16lqfvSDlq6KptJIXF29a9+/on1w+rNmoQzT
	W5O2JUixDf7+k9kQoEu1iE+vEK0tvxAR7N1zB0puZS9291FcJrtg/DBcVQRPRAmiG+6bdkSi9pq
	eZRemFnSA8YT2rZIXyDL9Dx9X0JHVCWhg78SY82R59wlVuiT6aXK04oPfn/CEYMHIrHRgu7Xopk
	QmwPSAhYoLnt9x0wdYrmRmx2hQwO4hr6S4agDB/Z+pUkrNUzhWxppLOc+eFXvk4CI2sKkz4x/Wy
	TSflbEA5pjRNrRtQpG1fC/Zlolx9bSINEf9wyJpb9EVPh0NV0UYjcvznGYyvrDU5Pok1cmjes6b
	23i8oeZOR3FODa4/MBntlloqy3aLdXw3sjZF0iiynRaE=
X-Received: by 2002:a05:6a00:2e28:b0:7b2:2d85:ae53 with SMTP id d2e1a72fcca58-7c58c999ebfmr24059809b3a.8.1764179000440;
        Wed, 26 Nov 2025 09:43:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFE9auC0BPVxJ4KxcFP48LwF0xTVOASw2feRr55RR8ZX+bZHEyVlBeSIXXDN1cl0ZFO26GaMg==
X-Received: by 2002:a05:6a00:2e28:b0:7b2:2d85:ae53 with SMTP id d2e1a72fcca58-7c58c999ebfmr24059760b3a.8.1764178999869;
        Wed, 26 Nov 2025 09:43:19 -0800 (PST)
Received: from [10.216.6.208] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3ed471022sm22183967b3a.21.2025.11.26.09.43.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Nov 2025 09:43:19 -0800 (PST)
Message-ID: <acd1b134-2c8f-af01-0de9-d9779dd2ebdc@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 23:13:05 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v17 07/12] firmware: psci: Implement vendor-specific
 resets as reboot-mode
Content-Language: en-US
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Vinod Koul <vkoul@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Moritz Fischer <moritz.fischer@ettus.com>,
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
        Xin Liu <xin.liu@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Umang Chheda <umang.chheda@oss.qualcomm.com>,
        Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
References: <20251109-arm-psci-system_reset2-vendor-reboots-v17-0-46e085bca4cc@oss.qualcomm.com>
 <20251109-arm-psci-system_reset2-vendor-reboots-v17-7-46e085bca4cc@oss.qualcomm.com>
 <aRIfc9iuC2b9DqI+@lpieralisi>
 <80e68e44-a8e0-464a-056e-9f087ad40d51@oss.qualcomm.com>
 <aRxmWrAkD0Vu4pF+@lpieralisi>
 <1da024e7-efb1-3a1c-cc13-0ae5212ed8bd@oss.qualcomm.com>
 <aR2P4CxQNebac6oU@lpieralisi>
 <682b1a0c-644f-2aff-1860-cbf9a53bc62b@oss.qualcomm.com>
 <aSc2Yh3AvLXOBvcz@lpieralisi>
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <aSc2Yh3AvLXOBvcz@lpieralisi>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: RQmVUXSBIn3Yw3hrOH8-Lvf5yR_0q84t
X-Authority-Analysis: v=2.4 cv=MIVtWcZl c=1 sm=1 tr=0 ts=69273c39 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=aq4WiCt_VBwjG6PfwrMA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: RQmVUXSBIn3Yw3hrOH8-Lvf5yR_0q84t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDE0NCBTYWx0ZWRfXyyuMETfYJ5f7
 wzjOG/DL3Qpe09humJBL6ZlZ6p4wxl0O8rrgvGHJyCu2moHMhHGbEDcCTJ/eFpxgquxINdRu8ts
 tzVTyn9GG6U5Kx24yy5rhRRVdfxAhNscYbERHfXULXjy7gXgPHcnRGjbiEykrXmaWmhsu0nXBir
 7zhbhkR7uFJ+mB//LlfgoBtrRrKMm53XBy9ifhRqi6oFct/mutt7koCVTGUDKOK6P/5hDTMuK0F
 BUDbUSvqALt/A+k9Z1yrTBVi5TaiiRod0+60bGlSjdbc3O/Ud4jjEtks5buoo0wgWrv5hNJ+vKD
 XGSvWCet/RMh1W5Nm4Apz0kt0FJIpUE7yRGuiSKMKp3ral6+rssvInBLqH9IOfCcaL2aszF17fz
 0N28JcaQbLbvLCAlXcWhXCurvUA0aA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 clxscore=1015
 adultscore=0 spamscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260144



On 11/26/2025 10:48 PM, Lorenzo Pieralisi wrote:
> On Wed, Nov 19, 2025 at 05:32:42PM +0530, Shivendra Pratap wrote:
>>
>>
>> On 11/19/2025 3:07 PM, Lorenzo Pieralisi wrote:
>>> On Tue, Nov 18, 2025 at 11:11:33PM +0530, Shivendra Pratap wrote:
>>>
>>> [...]
>>>
>>>>> Yes this could be a potential way forward but that's decoupled from the
>>>>> options below. If we take this route PSCI maintainers should be added
>>>>> as maintainers for this reboot mode driver.
>>>>
>>>> you mean the new psci_reset driver? yes. Maintainer would be PSCI maintainer,
>>>> if we create a new  psci_reset reboot mode driver.
>>>
>>> Yes.
>>>
>>>>>> - struct with pre-built psci reset_types - (warm, soft, cold). Currently
>>>>>>   only two modes supported, anything other than warm/soft defaults to cold.
>>>>>> - vendor resets to be added as per vendor choice, inside psci device tree(SOC specific).
>>>>>> - psci_reset registers with reboot-mode for registering  vendor resets. Here, we
>>>>>>   have a problem, the pre-built psci reset_types - (warm, soft, cold) cannot be added via
>>>>>>   reboot-mode framework.
>>>>>
>>>>> Why ?
>>>>
>>>> If we want the new psci_reset to take the reboot-mode framework route, is it ok to
>>>> add default modes (warm, cold) in the device tree?
>>>> If not, then the design of reboot-mode framework(power:reset:reboot-mode.c) needs to be
>>>> further changed to equip this new feature. 
>>>
>>> Well, yes, all it needs to do is allowing prepopulated reboot modes on top
>>> of which DT based ones are added.
>>
>> The mode-cold , adds a third variable to reboot-modes as the first parameter for 
>> invoke_psci_fn is different for cold vs warm/vendor.
>>
>> cold reset call       : invoke_psci_fn(PSCI_0_2_FN_SYSTEM_RESET, 0, 0, 0);
>> vendor/warm reset call: invoke_psci_fn(PSCI_FN_NATIVE(1_1, SYSTEM_RESET2), vendor, cookiee, 0);
>>
>> Each mode will have 3 argument - like:
>> _ _ _ _ _ _ _ _ _ _ _ _ _  _ _ _ _ _ _ 
>> MODE   , cold reset, reset_type, cookie
>> _ _ _ _ _ _ _ _ _ _ _ _ _  _ _ _ _ _ _ - 
>> COLD   ,   1       ,    0      ,     0
>> WARM   ,   0       ,    0      ,     0
>> vendor1,   0       ,0x80000000 ,     1
>> vendor2,   0       ,0x80000010 ,     0
>>
>> So reboot-mode framework will now define and support upto three 32 bit arguments for each mode?
> 
> The cookie value is unused for SYSTEM_WARM_RESET, you can encode there whether
> it is a cold (SYSTEM_RESET) or warm (SYSTEM_RESET2 - SYSTEM_WARM_RESET) architectural
> reset when the magic value(aka reset_type) == 0x0 ?

sure that should work. if reset_type is 0, cookie to decide warm vs cold.

> 
> The reboot mode parameters do not necessarily need to map to PSCI function
> calls parameters - provided we define that explicitly.

got it.

Sorry for out of inline question - 
So the psci_sys_reset() may be looking like below after the changes suggested?
Is this on track?

if( panic_in_progress() || !psci_reset_cmd.valid) {
        if ((reboot_mode == REBOOT_WARM || reboot_mode == REBOOT_SOFT) &&
            psci_system_reset2_supported) {
                /*
                 * reset_type[31] = 0 (architectural)
                 * reset_type[30:0] = 0 (SYSTEM_WARM_RESET)
                 * cookie = 0 (ignored by the implementation)
                 */
                invoke_psci_fn(PSCI_FN_NATIVE(1_1, SYSTEM_RESET2), 0, 0, 0);
        } else {
                invoke_psci_fn(PSCI_0_2_FN_SYSTEM_RESET, 0, 0, 0);
        }
} else {
        invoke_psci_fn(<psci_reset_cmd.system_reset>, <psci_reset_cmd.reset_type>, <psci_reset_cmd.cookie>, 0);
}

------
where psci_reset_cmd is defined like below?

struct psci_sysreset {
        u32 system_reset; // this will be set as PSCI_FN_NATIVE(1_1, SYSTEM_RESET2) or PSCI_0_2_FN_SYSTEM_RESET.
        u32 reset_type;
        u32 cookie;
        bool valid;
};

static struct psci_sysreset psci_reset_cmd;
--

thanks,
Shivendra

