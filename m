Return-Path: <linux-arm-msm+bounces-89774-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF52D3C139
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 08:59:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 683F84438DA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 07:56:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC88D3B5304;
	Tue, 20 Jan 2026 07:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YImfRyqT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NxyfG1+w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C893B8BAA
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 07:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768895732; cv=none; b=HjmNWi4/wcbhO8rRUXz45gbNmDmszLCoqCsycoObaEpZoBcFostFBCseWtYI9rsUCBawhPp2eB74lp9vL/L23D55+rZNiM1nCRiMMn3ABQHPuvJUS+HZOVDaSeorL97k7OmKI+bbe1OrZ2gtr8TsHGMAAYHedMIKix0teufJLoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768895732; c=relaxed/simple;
	bh=Uuz2EePIT+DpD+mPhanf4+PXyUz1hQT+PYg+laCMMDc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JEsLJUU1BezbjjTGHnMZZFFD9KM58OaYcVmySFHPZHFGC5JSfJQmdJ/dm1WEIN5OoAixetGqgOnjzEIXaxPz8NZ1uUVDiWLJpqleFm5UFFobHWOJ7RBf96wS9shTbyLE4S2UoDv9ooROZ3ta1/6LF5ivdybTxw2RW8apYbOkcOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YImfRyqT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NxyfG1+w; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60K61XQ43772433
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 07:55:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qGyWDxi8YJs/atydI2SKDl+yP3HXVr6nyPm+w4sHMKo=; b=YImfRyqTMT2fT0E2
	SmxaHJYP7PHfmfHVETbp2kTWuTVgwvZ0y49+g/OXwUOSTHVbFHF+vrjndvGZoyVQ
	Z/bCpEDeMQW0RtsPQ1HVF8tWlRmOihEQ6Kvob8z/L1AdhrWTOOClBpmnk6x+qrHG
	XCiZrRx78vEepccIZ+mYo+xy2z/XJMX1U5g8Dy4nwRklpyTApnggcl4l/WKYoOcw
	Fi7dLxZj42mqwIj8dtcd7gxNNVfaWmg+QtIi9C6QDZn5hDYdEmy/mW1Pkx62lUfC
	IuuPRdI/Ti9DCp4hJNN7Lt5xGFB1W3bc5EiM/dmUjO19BQtPnl54gh5C6gc607Ss
	hfCV8w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bt42wrb8k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 07:55:30 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a0f0c7a06eso47854845ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 23:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768895730; x=1769500530; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qGyWDxi8YJs/atydI2SKDl+yP3HXVr6nyPm+w4sHMKo=;
        b=NxyfG1+wjuGcJQVUH/rsTiR9RhHEj6KIEkg2Gik9aKajqyqXiz44XjQp2/wkT7aBQD
         M2pXeJj99zbcud6ll8TcbYtpuLsRIdB/XahduA60hh3hP04W2auB5Jx8FULQR74WZ7qi
         PMSIIXxIeGD5j26WkuQllQoaPVI3VwNwE5WrRYfVtyN+Nrs18HGHcjy6yx5MIREh1Alq
         zKb4akodOWFpcoCpGM5+9C/Q32arHMwEtjPbyLJxWQHDsGQGNfQRqo9NU4Rba7E308JU
         Of9hJecZJuUECj2T6putXN8/Ul+vEfc8uRVXWdhKVVKl9TEoEyCIWcUsbx0aO91GQU2S
         8Xjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768895730; x=1769500530;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qGyWDxi8YJs/atydI2SKDl+yP3HXVr6nyPm+w4sHMKo=;
        b=VrK7aBh5VySVTr+wkpOBSRHuHmy2NCh8Hv/5NSQxEnsDBTEzqsDZ1F9OVW2U+L2OjR
         mHcMWuPsuMwYAczYHzv+IyKaw4ZbkOCfmKBTn/GLJefIiWWCxn3O7KgWF2CYruEDxOLN
         0eC3d0yuqquEXBNpSQjaxnjfXQ6KZcv+BCdBXXn+trc/79zQOrJulBchMTouba8BaQvV
         LCl9TLmgayiNH3rfz+zzhIhit91UG9ZJFcs0wLaCKBvJ2+2sIkpzqoxP2ADRziua2pjR
         2quWlXXzZ+VycDP3iezpL8kasEBTxvNksBHnPfRKohhwKKrn2zIVPZkFz+K5UCguOFr2
         f7RQ==
X-Gm-Message-State: AOJu0YyuyE9wf4fWCR9E3Cy+AUHv/u8rFE2Q01Uve/Lw3NrU0x/yD8Qv
	3mmmIHb+YYzGnwWv9Ej0ACAsczwifmBVC3Rr5z+tAbDSox2I+WAgRx+mm83WVdG5iMVpQgcZtFW
	4EmZ3qZ3NYrTSfM3T/HoV21biHoOgQQqljqHbmydw69ep8ZFtN3Xo5GP04juh+VUnIWsJNtUijl
	k2V9Q=
X-Gm-Gg: AZuq6aIqIdrehob+W7v1CUS0/zyWBYeVt4TcC8iC6At9KaXj7x7ycw7e8ZCFVclLLwx
	TYo8kyygXwTE59rrSOFvhujnVv/Gv+IORpDUNb1drQWIGo1e9BHX04TUHnvtS8rF+/ih7B9yhz2
	OHwTimdl7uFeyg0Q83IitkyMBvgJ4L4nVs8LRC7EJ6WTHYHd5jRHOW+orkIAxVMeoaQkqiC1Wym
	XYOJ1w7PBNMs2kzrkFrKMLUct48EFTKmR3SUbbDI56ZqGhYeJ8rmtImDTov++DmAP0mdtrT9JuN
	5NF4QlLm8EfBWFIwjM/ajPyESc/QdFmWlUkUBlbpdy2AIyxW5/GrtFGKw9t5lF6553tMtSp/OqH
	H5pZ8wgkcWuLEYyCU3gIv211aL2EtIa/P3dq/QNtX3S7ErC/guD2G2xLU7qN1i6sQwJk2u/Ab52
	0q3Mg=
X-Received: by 2002:a17:902:e80f:b0:2a7:682b:50af with SMTP id d9443c01a7336-2a7682b521bmr11262805ad.40.1768895729750;
        Mon, 19 Jan 2026 23:55:29 -0800 (PST)
X-Received: by 2002:a17:902:e80f:b0:2a7:682b:50af with SMTP id d9443c01a7336-2a7682b521bmr11262645ad.40.1768895729297;
        Mon, 19 Jan 2026 23:55:29 -0800 (PST)
Received: from [10.133.33.151] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7193fc880sm112797305ad.80.2026.01.19.23.55.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 23:55:29 -0800 (PST)
Message-ID: <908cb84f-328a-4aa8-b399-2e436c3413a8@oss.qualcomm.com>
Date: Tue, 20 Jan 2026 15:55:22 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] arm64: dts: qcom: Add base PURWA-IOT-EVK board
To: Krzysztof Kozlowski <krzk@kernel.org>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260116-purwa-v4-0-89b2adae9f09@oss.qualcomm.com>
 <20260116104136.2922032-4-yijie.yang@oss.qualcomm.com>
 <d15bbe2a-a88a-4a88-a685-ecd4f058c3af@kernel.org>
 <3404f2f4-7edb-4bff-925b-0a6a7a450f5c@oss.qualcomm.com>
 <0cb38b14-13bd-43e9-8dca-3d78afd62a28@kernel.org>
 <ba0f5539-011b-4778-8025-16950f5e5a62@oss.qualcomm.com>
 <a7ab2c3f-bbd0-435e-a707-44101428a39b@kernel.org>
Content-Language: en-US
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <a7ab2c3f-bbd0-435e-a707-44101428a39b@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: --Iu_O2LEXnFX7A7cpUieTrN6c3kEeB-
X-Authority-Analysis: v=2.4 cv=eJMeTXp1 c=1 sm=1 tr=0 ts=696f34f2 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=C50igqWIdSMoUx98drYA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: --Iu_O2LEXnFX7A7cpUieTrN6c3kEeB-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDA2NSBTYWx0ZWRfXzD8G0CGizTgK
 WG5vhm3Af7iYBlIF6HNqpyIUUxf0GHRK3PVzz//KeyGiu/WXcFZYciWz2pwyHBDcAhpjKiNwQF9
 uY+rKL1xiYhcnwWEKqm+ATod60LNgniYCtU1zWIEhvJfBOeiSsWMZSUz4bXlMMwXra26wQjfZdU
 s7VhbqC6JyCVCLDj0INMZpUt8t+DfGV188ctf9l/YKPY+055sBN6Rnvhw5GNRUMLmrnoq3hZaS1
 lFX9UKgPAIJGixhxmC/JUkzmRElVBMKcTiwlLd0rr2FaDsQ6zOY6sSIct+BBstTWQFwsrmQe0LK
 3fHUxn/eckrhfBOnxu/ACTDJlSZ/2NUxTSBNY9GRb2IfH9cmjAdquyJftcZhzVqjPn+MAHBivuj
 sc65coXG41G/XnCQvO2ktf5NtownOhPwSeljeYJimdj4M5cy7H3qghZq3bYWcFxhurXmTI8bkNU
 OpUDfCWPA382s2CKRqQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-20_02,2026-01-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 spamscore=0
 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601200065



On 1/20/2026 3:17 PM, Krzysztof Kozlowski wrote:
> On 20/01/2026 07:49, Yijie Yang wrote:
>>
>>
>> On 1/19/2026 3:05 PM, Krzysztof Kozlowski wrote:
>>> On 19/01/2026 04:13, Yijie Yang wrote:
>>>>
>>>>
>>>> On 1/17/2026 12:19 AM, Krzysztof Kozlowski wrote:
>>>>> On 16/01/2026 11:41, YijieYang wrote:
>>>>>> From: Yijie Yang <yijie.yang@oss.qualcomm.com>
>>>>>>
>>>>>> The PURWA-IOT-EVK is an evaluation platform for IoT products, composed of
>>>>>> the Purwa IoT SoM and a carrier board. Together, they form a complete
>>>>>> embedded system capable of booting to UART.
>>>>>>
>>>>>> PURWA-IOT-EVK uses the PS8833 as a retimer for USB0, unlike HAMOA-IOT-EVK.
>>>>>> Meanwhile, USB0 bypasses the SBU selector FSUSB42.
>>>>>>
>>>>>
>>>>> NAK.
>>>>>
>>>>> Warnings were reported at v3. Did you address them? No, you completely
>>>>> ignored them, so warnings are reported again at v4.
>>>>>
>>>>> What do you think these emails are for?
>>>>
>>>> This warning is caused by the pcie3_phy node in purwa.dtsi, which is not
>>>> introduced by this patch set. Since it does not impact functionality,
>>>
>>> Your patchset introduces that warning. There was no such warning before.
>>>
>>> My NAK still stays, such patchset must not be merged.
>>
>> This patch series can continue to be reviewed with the dependency noted,
>> right?
>> https://lore.kernel.org/linux-arm-msm/20260119-topic-purwa_phy_shutup_warning-v1-1-997a692b31c6@oss.qualcomm.com/T/#u
> 
> It's not a dependency. You only need to mention where the bindings are
> addressing the issue, preferably in patch changelog.

Sure, will update.

> 
> Best regards,
> Krzysztof

-- 
Best Regards,
Yijie


