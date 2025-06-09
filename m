Return-Path: <linux-arm-msm+bounces-60565-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 01ACDAD18ED
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 09:17:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BB22516632D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 07:17:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6D4217A2F5;
	Mon,  9 Jun 2025 07:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RKc3w8VC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F2D814EC73
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Jun 2025 07:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749453453; cv=none; b=mySPhpwLsWb7EQu9WeAVfrMA1VGP/rSVuLPN9mBxBxv5Li9ZuEVgUv5X+U0HlWw+mfvXMc8Okxh+4sudRGy8Nbo6SoMBZ18fqGCuq4yD+4vwEfJxMC3aQcXYUkwYQVQCXZUswoQLsljYalr1EPIflk7YZzyB2UkHH+RZcz4+3q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749453453; c=relaxed/simple;
	bh=dnOOCHxE/dICMo1ItkE+yCkFIQkdWx5eFZ5lfhxhpo0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RGIUKqXtWgPXHDbsaXq1m9ltm12uNROgh1TtBFl4QkxAFNP8pP7G6bIWvfW2CAuiG+ED1viaBBCLzwwfYizr9738NgyI8o4msrp9am/k50QNH6wTgEObsj+jIxCcBFfMlpGo+wZxfuaMcg+JrQmq5d43k4GqcWGaGx1eFS8GO8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RKc3w8VC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 558NIlSt022697
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Jun 2025 07:17:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ykt1m8wMBYY0GbBmpdFucNObSEG06qB6oOFyulI3RIQ=; b=RKc3w8VCApEr4HRZ
	h6eKGZSki85kIXwn45ia71nSMmmjQMWHUkgeWEwJ5dG+giLPXXeONpaEGC/eXRhT
	/m+IM5BcBHRvSnXdcDxA9ofAmQLV7Qe5HjDURXWkf90s3AC4/cJi7CxnrTUOSRM0
	msnaxK58N/RkpeWX19Yju7p3EFafHp/vK5HjxZnLRFj/+SShAqJ+t9ji9rd6sUCF
	VDbNgDOx53rrHl3uxtSmmAJczueEuVTEDXlVPF/5tiVeFvP+IgSO3fdJb1vXdAcP
	x5l6naKx2FFQpxq6e51VNULHB1uv7NqT7err8Q66vgKrMV2CwuRJl7XXHGtLfddj
	DI2XYQ==
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474b4j527j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jun 2025 07:17:31 +0000 (GMT)
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-86cff1087deso830092539f.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jun 2025 00:17:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749453450; x=1750058250;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ykt1m8wMBYY0GbBmpdFucNObSEG06qB6oOFyulI3RIQ=;
        b=HpNZupF3S38MyqMkcFHoCyCFyKi4LcnmK7xqdtQPTl9JYB9bucWh6ELTFD9wnyQJEj
         AoS0vj4C3Aytm4MoitmFo1iA0+VNRVpaJmgz+kGkrH/Dqhn5U7umK8ucFVlXJyDKhyQD
         MXpBrZlx32Q0UgN6ZsqVS8D0qLzpX6xy4M/4x826xv52wqQQ03IQ1rejsbzJChaM1Z7D
         031aAB1xC6gxHC5Egcb9u8teUBBzbaWiwa/O1dPRw7h4G/nhtqmHxC55IyqaFeWdbizN
         NreFJdOT1abCTsUMxmqGFBDk5M3+AET5E0CsXoK10xVeq0cqG/iXR5iZapvVwSr6ayuz
         jDng==
X-Forwarded-Encrypted: i=1; AJvYcCX3PyuJ+5/3CIZtcFfgTkRs1eiq7ACydzbn6zFE50jocfIEkDDO6lWdds3DYSuHDzNDSGES9qItAeYXAh1T@vger.kernel.org
X-Gm-Message-State: AOJu0Ywwh4qPpwio1Nynpb5ZovgWfZ8lfJywPdEH/4SPY4Fl7i7gU5WQ
	WhxXx5zOUFC5RbIq1seYriN6pVy0XUXW3ss69DtgSuzX2rmQf3G3TYe2LOJ/zAcnOnYL9hbJNRT
	yjPyKcdOR0n20W5s1s5Isdik10LnL2120S5888nDKIpGTcs++A/O8xA0/aSYsn4Q5I/esWrs7mo
	6v
X-Gm-Gg: ASbGnctuaHfhs9lSE2hXV9m97/ZIEgVDxQg2bHw0K3Uuuh5M42cgEQIB9Nm+fMojb7h
	FHfdxCJh/JKYT/nvN0WL4VmgzKE7bjRqgQudcYXaE88vllhoRmdxX4xgUr0WFcxiOzLmfhldCca
	59KdaJHha3RLUVjjrvCfyssjIlUuwRjyczQRCC9TctNag+e7F5Hm/eSUbO3I/mnH7r+ml4VwvMn
	7i/bXg0tfYVcIpZWulZDTE+y8+DGCLocIDLUyyd5DE7Ao8D39oHluTnV2gJZrI793CfmvNUZRsm
	SkQOHqPH8QDqJM4t3UBr/RiyemS4RGFQwRLqFDttSnR9JtvUK2rjEZXe4QTR42bcIqIlEBaj3ZF
	L+U8j0R/c+iAT6w==
X-Received: by 2002:a05:620a:191a:b0:7d0:a0bd:d7bb with SMTP id af79cd13be357-7d229902854mr1599978985a.58.1749453438832;
        Mon, 09 Jun 2025 00:17:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHdkd6CyJurG1kbBol7Erd8qyoJpOICpwacKz5TVDzmXLohtAPsAPvsf/9GyQC+BvRxwRlLJQ==
X-Received: by 2002:a05:620a:1787:b0:7c5:47c6:b886 with SMTP id af79cd13be357-7d2298ec4bbmr1913052985a.43.1749453422860;
        Mon, 09 Jun 2025 00:17:02 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0c3:3a00::4c9? (2001-14ba-a0c3-3a00--4c9.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::4c9])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32ae1b34742sm9904481fa.32.2025.06.09.00.17.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jun 2025 00:17:01 -0700 (PDT)
Message-ID: <b938b358-301a-4842-bdf6-93ec3c459d41@oss.qualcomm.com>
Date: Mon, 9 Jun 2025 10:17:00 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] power: supply: qcom_battmgr: Add charge control
 support
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: =?UTF-8?Q?Gy=C3=B6rgy_Kurucz?= <me@kuruczgy.com>,
        Sebastian Reichel <sre@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel@oss.qualcomm.com,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org
References: <20250530-qcom_battmgr_update-v2-0-9e377193a656@oss.qualcomm.com>
 <20250530-qcom_battmgr_update-v2-5-9e377193a656@oss.qualcomm.com>
 <f2e0f1da-c626-4cf0-8158-8a5805138871@kuruczgy.com>
 <8bb3a056-c00f-4ae0-a790-d742d31f229a@oss.qualcomm.com>
 <5knsdgk7o5zifkvzlrqiplmhztnsyhlxnqiuikqf4l7wkx2qvh@s3vzkiezw2bc>
 <219a46d0-446c-4eed-8809-4f2400de0ef9@oss.qualcomm.com>
 <cf3479b4-5f02-4d19-8164-306214966248@oss.qualcomm.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <cf3479b4-5f02-4d19-8164-306214966248@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDA1NiBTYWx0ZWRfX0UuYZ+XKDvUO
 LXLaFljcB0f60XFOJsk6HlSAaYsFFgOIrY3YCAsVlAVA/XH8mMAsFGOAMUux1bEe1MnyaOsu15Z
 w8CMcAMuLixi7W7Vdm2WS03YTIz4ShpAzAgatFQSTAfa4K+FbpmcMTRzrmn3/U7WImoq9k/QEJb
 88sP4z7utGkmi+fUemrjiN9nAYuY+WyORk7V9JB+ZCAroo2AbwjATRZrBCTE1MjVeGJTN0Czn+m
 NDQnmdcHQjhTl6c9jeTrwuejUhMxag6/A3933mtaReSsvcnuJbXOf8sOamzDdVyARYtKjduTi4N
 atwYDmcSVkePvk3C3G8LukZT8oRRRDHjfLOQvKvoY1xJ8T2vUf1FTaqhO41zi6MMByUogvuhsfk
 7dkkxNtMVcV3tuDb/CLu58k15a6TH+T8Iu4T2fhKfRmblcUB5qjtfuUMSYmK9dUQDXC5nB3J
X-Proofpoint-GUID: khuiVrGLoM2T4nbOePgigIrbF-MxKigZ
X-Authority-Analysis: v=2.4 cv=Te6WtQQh c=1 sm=1 tr=0 ts=68468a8b cx=c_pps
 a=uNfGY+tMOExK0qre0aeUgg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=NtchbJF2b19TUD_QsiUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=61Ooq9ZcVZHF1UnRMGoz:22
X-Proofpoint-ORIG-GUID: khuiVrGLoM2T4nbOePgigIrbF-MxKigZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_03,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 bulkscore=0 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0
 mlxlogscore=976 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506090056

On 09/06/2025 05:39, Fenglin Wu wrote:
> 
> On 6/7/2025 5:46 PM, Konrad Dybcio wrote:
>> On 6/3/25 12:37 PM, Dmitry Baryshkov wrote:
>>> On Tue, Jun 03, 2025 at 01:48:11PM +0800, Fenglin Wu wrote:
>>>> On 5/31/2025 6:36 PM, György Kurucz wrote:
>>>>>> Add charge control support for SM8550 and X1E80100.
>>>>> Thank you for this, tested on my Lenovo Yoga Slim 7x, the limiting 
>>>>> works
>>>>> well, I finally don't have to worry about leaving my laptop plugged in
>>>>> for too long.
>>>>>
>>>>> One small thing I noticed is that after setting the sysfs values and
>>>>> rebooting, they report 0 again. The limiting appears to stay in effect
>>>>> though, so it seems that the firmware does keep the values, but Linux
>>>>> does not read them back. Indeed, looking at the code, it seems that
>>>>> actually reading back the values is only implemented for the SM8550.
>>>> Right.
>>>>
>>>> Based on offline information, X1E80100 doesn't support reading back 
>>>> those
>>>> threshold values in battery management firmware, so I can only use the
>>>> cached values for sysfs read.
>>> Which limits usablity of the attribute, it is now impossible to identify
>>> whether it is enabled or disabled. Is there a chance of fixing that for
>>> the X1E80100 platform?
>> Is there a chance we store that value in SDAM and can read it back?
>>
>> Konrad
> 
> The thresholds are stored in PMIC SDAM registers by ADSP after receiving 
> the set requests, and ADSP reads them back during initialization. This 
> is why ADSP retains them upon device reboot.
> 
> I spoke with the battery management firmware team, and they have no 
> plans to update the battery management firmware for X1E80100 further. 
> Consequently, they cannot provide any interfaces to read these 
> thresholds through PMIC Glink.
> 
> Reading them from the existing SDAM registers requires adding "nvmem- 
> cells" DT properties to specify the SDAM registers. However, the 
> "pmic_glink.power-supply" device is an auxiliary device created by the 
> pmic_glink driver and does not have an associated DT node. Is there any 
> method to create a DT node and add DT properties for an auxiliary device?

Auxiliary-bus devices don't have their OF nodes. Instead they use the 
main device's of node thanks to the call to device_set_of_node_from_dev().

-- 
With best wishes
Dmitry

