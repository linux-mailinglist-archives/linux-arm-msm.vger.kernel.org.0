Return-Path: <linux-arm-msm+bounces-66832-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9BCB138F4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 12:30:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B362317416E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 10:30:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1820A226520;
	Mon, 28 Jul 2025 10:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V4co8DeY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AA6E1C6BE
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 10:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753698620; cv=none; b=SOp6dXussYID0PrptYsWCoaRXRPhpWigG65AVRjFpXDJ03ork1bhqrjpuIVkn23MA/Sx5wN53NTOWbgOyFi344BmEE8LIDK9RuHYU6s6Z3nPFyTVbOAqCou+e23lDTmoH7ptMYx9Fa1CD4+QjdY/sbb5x3RKhVRwlYnfzC9LylY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753698620; c=relaxed/simple;
	bh=4vFJKZ20JoDYDpHzrACMlyjLsMA40zA9ZOzsUu/Pjoo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=thok1ISPVP/1mbSY8NhNldCBrOQq9l0oqCIEqivcvbTTu9IUPda3wVQ5vOnhc69nB2R+3PAntnRTo12NtdQN+fzHa6idqUcwoOnHOYA45opnMVWb228KkUjxuH/DKt6M0myRNwj4TRScWPsWzxKWZhfy3M44+hzA9rdFfMlUzik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V4co8DeY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56S4rOLG013209
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 10:30:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jd4jPTJZhxKDES4qsp1a4FtiRTBXAwjqIYn7iPQId2M=; b=V4co8DeYdVEjkfDT
	w9o+LpN/onk+X/VlV7UL6+xQJKRiiXyWikz5sFRU1L5QlSGdogmGCToqnWx4Px28
	RypxgSYISWTlqjqYdVlJv1c7fNtODyoFpITEi/C88p+H+C3CmdheKfIfe8/1d3Q6
	6D5tvzNUaTB4tA0RcJRL0gVhwBiK4TVJoWEHWPNS2FHGXCIh84CGKSIIZIJozoMS
	0EWsYWQ+nhuBFJevDsMjp26sDMNltXpNbvhu/Ubp2yH507a4nCOVsuzQBIWuLTbq
	GVAiFvHkPDwIGnVf0NGcTUJQirK1US71jJGzs5oVyqJkAKjbUkRgGPfFTIzr2Tgd
	gQp3LQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484q85v9xy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 10:30:16 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-7048088a6fdso70651666d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 03:30:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753698615; x=1754303415;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jd4jPTJZhxKDES4qsp1a4FtiRTBXAwjqIYn7iPQId2M=;
        b=WeOUQsBgDypgScX1KhucUe1hgdZgUZThMUIsLqEMZfTiY8IHpitNe2vPGwKLUMsqSv
         252PxXjRL6e2aerTm9cqfeLgLi9Pd29N3kpr7yMNBxVwzXD1v0OiWJJWihHjbrVmSZ4l
         +ZqHQm0n/A6NCxGjG0tztu6lsRpdfilEmIYB4sXH9P4/4U1kSd0TCde79Gzy6jUXAxJd
         jKISI3lF5da248VA1VPOQnvPnf23k/ligfTy2WW4eFLBTXbqVFw+ZZJLj49q9Zv9JhA6
         UWytOrlMAMuR6ZEMQSbOLsVywJhrFJTEWZ22NhECZSXe7ZyRwKEhNL2CuWFf2DKtSxU8
         r74g==
X-Forwarded-Encrypted: i=1; AJvYcCXCaWA/IhKEk4D76gHUTtTWuw7B2cwRcpkdd6Btj+xk2Lo95m2GZ11mmVsxTUfcYb2RpNfE0/wNr57yYW3l@vger.kernel.org
X-Gm-Message-State: AOJu0YyJNmIMApGFmCHOmmMKx7+/kRxl42gxOpSF6F3yuirybMhfUhl5
	BdaS6kG9DsRKjk5z3nPQaC2nqigsjW8P6rpveVWB0hmEaPrseRJCiumJW4M5ictlSbFz+K7TbLz
	ZCAIyCaOpIHv9NxbVRMj2CXrg+WVjhQX9lkMMcvKRDdl2wND25C6T33EQ1vInKP3lC1Nk
X-Gm-Gg: ASbGnculh7UQHLhfjrOnNWUk+9qdP7GvrrLjCAj0Y7Hu/mo5UwXaeEsp3MrBFqSEcQG
	64m6Z3cFHTv8VxTli8NT1j+EDoN6ckptVxrAFe4ltIxH2C3Wl2ZkY7vtfFSUe2UupOqxd85/6K1
	ADj7rhtVGFSY5CTgMnreyjKpKIrDZ2F9GXUcmJklno7WlvtiRo062dYyqQa7haXU1jGDeuq4Lx4
	pXlsq4Wm7LhQqgIidJtXsJ21dl/Tk8cqHZ2Fosu9DjCDTrvt3/V4HSX+18o92lB71j5uYR4KVLb
	91wx5HfIGek/MD53bTAE0DPJMBf8cm/NFkY8lO0CCKYdk+cV0QGmp8nzifHHz+T+NSCyTEC/r7J
	DorM9LMi6MRolzaQQwR3/JfddIXBaPqgH7MEli67UbS/70DsxP8sPL+SPO06UL79OyuAxxNuoUj
	bwMOl8MauTe7dHJPHUng==
X-Received: by 2002:ad4:5965:0:b0:702:d7ff:27f9 with SMTP id 6a1803df08f44-707205a9bdamr128692256d6.24.1753698614924;
        Mon, 28 Jul 2025 03:30:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGypUPlor8dmGzCs1Hb1KwVlQ5U63aDnG8xB7AQNMeXC1aEHwrW5Sk+cmb76e/+qaKsdRzhDg==
X-Received: by 2002:ad4:5965:0:b0:702:d7ff:27f9 with SMTP id 6a1803df08f44-707205a9bdamr128691766d6.24.1753698614326;
        Mon, 28 Jul 2025 03:30:14 -0700 (PDT)
Received: from ?IPV6:2001:14bb:cc:47df:318b:ca77:b793:45a5? (2001-14bb-cc-47df-318b-ca77-b793-45a5.rev.dnainternet.fi. [2001:14bb:cc:47df:318b:ca77:b793:45a5])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b63375ca4sm1203262e87.124.2025.07.28.03.30.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Jul 2025 03:30:13 -0700 (PDT)
Message-ID: <2ee9a4c7-f971-4b73-8c83-cbb26c7072fd@oss.qualcomm.com>
Date: Mon, 28 Jul 2025 13:30:12 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7] usb: misc: qcom_eud: Access EUD_MODE_MANAGER2 through
 secure calls
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Melody Olvera <quic_molvera@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250722-eud_mode_manager_secure_access-v7-1-40e9a4569895@oss.qualcomm.com>
 <2025072446-ensnare-hardhead-12f5@gregkh>
 <CAPHGfUMnaJ8HPX=CC_q6m2nbq-ODP=MY_NkcvHjXR8mD9b=tBQ@mail.gmail.com>
 <fo4hek5twtgl7fa5ncqefatowz5nw64iwifaibl3yyzonucpqz@uwwxf5jdke2x>
 <CAPHGfUOusGDDumM81ZwfWCT+4H6ku2rTgYw4Wuz3KduZ96KhXg@mail.gmail.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <CAPHGfUOusGDDumM81ZwfWCT+4H6ku2rTgYw4Wuz3KduZ96KhXg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI4MDA3NiBTYWx0ZWRfX86wo9JC6A4mW
 S3hBbDUVtfwKyChBjbQ6ULjB95LMnqrjI0Xrww3zbIQf8lbssEGiEeJiVlyev9FDih+j6eadcDv
 OAGZijXSOKijFoq1oDXq5G7Gov4b19vSrMd+UsGczLVMvFcvrhnCvwzUwRcQUahevxWJQQ8t5Jj
 If7Bojl9IZuTwASynBlRL6kxCCXzfYFb6tMj9QmmGFocxkRKa4uNIzTTXWAOlGlaRCENuQ4a8Ek
 fPAXfcASV3QmkcP5+9Ro+978QW3vuQKcXtVUuiyVgU32Vf3tGee8abxvXmbCsUmtr8LeqswmFc8
 c1qU/TyykkZ+cfuM3RBJ2RkXPMtwsQQUO72S2OSidYHY1QIX3T9DqtGpwNwxk9LeYh/+4yKdcVf
 xld9DJ68X5g3Iv4jl70+DzT3OquJAKEB9Tib9FXQYMDFiohVidYcD83ZS/pToYUx/Svy9Vdr
X-Authority-Analysis: v=2.4 cv=TqLmhCXh c=1 sm=1 tr=0 ts=68875138 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=ag1SF4gXAAAA:8 a=COk6AnOGAAAA:8
 a=SYl7J9Ou-g_foRn2Kr0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=Yupwre4RP9_Eg_Bd0iYG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: yB0ZPdLoLHDind6WkOTyzOFw7aPDYu5M
X-Proofpoint-GUID: yB0ZPdLoLHDind6WkOTyzOFw7aPDYu5M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_03,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 adultscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507280076

On 28/07/2025 13:19, Komal Bajaj wrote:
> On Fri, Jul 25, 2025 at 7:07 PM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
>>
>> On Fri, Jul 25, 2025 at 06:19:21PM +0530, Komal Bajaj wrote:
>>> On Thu, Jul 24, 2025 at 3:06 PM Greg Kroah-Hartman
>>> <gregkh@linuxfoundation.org> wrote:
>>>>
>>>> On Tue, Jul 22, 2025 at 05:01:53PM +0530, Komal Bajaj wrote:
>>>>> EUD_MODE_MANAGER2 register is mapped to a memory region that is marked
>>>>> as read-only for operating system running at EL1, enforcing access
>>>>> restrictions that prohibit direct memory-mapped writes via writel().
>>>>>
>>>>> Attempts to write to this region from HLOS can result in silent failures
>>>>> or memory access violations, particularly when toggling EUD (Embedded
>>>>> USB Debugger) state. To ensure secure register access, modify the driver
>>>>> to use qcom_scm_io_writel(), which routes the write operation to Qualcomm
>>>>> Secure Channel Monitor (SCM). SCM has the necessary permissions to access
>>>>> protected memory regions, enabling reliable control over EUD state.
>>>>>
>>>>> SC7280, the only user of EUD is also affected, indicating that this could
>>>>> never have worked on a properly fused device.
>>>>>
>>>>> Fixes: 9a1bf58ccd44 ("usb: misc: eud: Add driver support for Embedded USB Debugger(EUD)")
>>>>> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
>>>>> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
>>>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> [...]
>>
>>>>> diff --git a/drivers/usb/misc/Kconfig b/drivers/usb/misc/Kconfig
>>>>> index 6497c4e81e951a14201ad965dadc29f9888f8254..73ebd3257625e4567f33636cdfd756344b9ed4e7 100644
>>>>> --- a/drivers/usb/misc/Kconfig
>>>>> +++ b/drivers/usb/misc/Kconfig
>>>>> @@ -147,6 +147,7 @@ config USB_APPLEDISPLAY
>>>>>   config USB_QCOM_EUD
>>>>>        tristate "QCOM Embedded USB Debugger(EUD) Driver"
>>>>>        depends on ARCH_QCOM || COMPILE_TEST
>>>>> +     depends on QCOM_SCM
>>>>
>>>> You now are preventing this code from ever being able to be built in any
>>>> testing systems, including mine, so I don't even know if this patch
>>>> builds or not.
>>>>
>>>> You did not even document this in the changelog :(
>>>
>>> QCOM_SCM is essential for QCOM_EUD for its functionality.
>>> One option I'm considering is using select QCOM_SCM, which ensures
>>> dependency is enabled when QCOM_EUD is selected. QCOM_SCM facilitates
>>> communication with secure world, this approach should not cause issues even
>>> when COMPILE_TEST is enabled on non-ARCH_QCOM platforms.
>>
>> QCOM_SCM is not user-selectable, to it is not correct to depend on it.
>> Have you had used `git grep`, you'd have seen that absolute majority of
>> the drivers uses `select QCOM_SCM`.
> 
> I had initially used select QCOM_SCM in an earlier patch, but based on
> the concern
> raised about enabling it under COMPILE_TEST on non-ARCH_QCOM platforms,
> I revised it to use a depends on condition.

QCOM_SCM can be selected on non-QCOM platforms, so there should be no 
concerns for that.

> 
>>
>>> Alternatively, I could use a conditional depends expression like:
>>> depends on (ARCH_QCOM && QCOM_SCM) || COMPILE_TEST
>>>
>>> This would allow the driver to be built under COMPILE_TEST while ensuring
>>> QCOM_SCM is present on actual QCOM platforms. However, this would
>>> require proper stubbing in the qcom_scm driver to avoid build failures during
>>> compile testing.
>>
>> --
>> With best wishes
>> Dmitry


-- 
With best wishes
Dmitry

