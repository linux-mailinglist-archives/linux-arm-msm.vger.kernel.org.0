Return-Path: <linux-arm-msm+bounces-79170-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 488B9C144C3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 12:12:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ACF3A3ABC0C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 11:11:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 429132DA774;
	Tue, 28 Oct 2025 11:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RYXB6v26"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA402212575
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 11:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761649914; cv=none; b=UCNREFDyNqSpF3bLBTX1RxQDtcykJxLO4eI5JK5oYd912yriOv2WTVXy2hb1rOdlfnh9NQdbYqMamWnC7YJzxUexDwQQpAr7YdsBT49gkARMkcxtZhopjxHQ0jThm3EMWAziRpLEeiYR7uMWpHz7MGuwt3M+Q5o0CUipCQfSEvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761649914; c=relaxed/simple;
	bh=tluPsZgS0AbUxys4VSNz7xRC3nOxi4aNyCC+IC+2QeQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=reOzdN8ObGRm1G5yhgjoCKr0lU5KN2U/sVAACDTMjmPWnow5RaDyjbY9GgxSKTnfd/o5t/zYtMSIZU8SdD/O4aeuG5r7CAz+O+0VwrfnLVivuZewpOBB9FWKKW9V5czfMN6Q1zJXoWd86BCyLoyaQN1OPUs2ixalukISTNDNvoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RYXB6v26; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59S9xd2c353555
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 11:11:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	opUtdQf4QfMq9eW5ijzGVRszcOjE71sRMPdyYjws57U=; b=RYXB6v26+vYPhlCW
	KKF4VCCEITpKOLNrnI1gTw4AV5aIiQj+sirAXsZ6mD8RPXAPXPeQY4FOrCfaSD8h
	ICKkft255d0UpDS7qABN2w8koXf3skvpcuw6repqcQwO3Flc+ueYVJIwhp6O4/o2
	W2bdn2mWWlNQh/bQfAa6W3gj2NDNfLMN2jwYsJKwB+kVPXa7+HgMtjnUM/Cm3L3k
	WjHzTscfOSpnQUy9NvZIQDIzCcx7wniuBZZ0psIt8SBdmYNSkWCAq/ekd1fmUouW
	ucgzIp24JLig6RQeoy8gOK7zSChbzE9rHeIwxxOyL/ZY6PkqV1F+BlUM56/kdRUu
	NaDdVw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a2njrscuy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 11:11:51 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-78105c10afdso5238087b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 04:11:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761649911; x=1762254711;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=opUtdQf4QfMq9eW5ijzGVRszcOjE71sRMPdyYjws57U=;
        b=X77v5LxkARGI1Jhduo6t4Fxu+v8VdYN7I+qJRNo9Kd0vdSvSi327/BNAZwufq5GXIm
         AUyOH5/kKqCA9C3a2B9wKp6m9P+nLsez/LxbUzq3X3zFgawh2fM0b4l9GV9zLn9C5/qi
         oblXxP29Anped2cKmZgQLjvjA4wPumMbCC3Uzf/QjVwj1MVW45LZMVtHnZQguHZrjH4T
         aSEfJgwdH4r5X/W+SnBie0TNZ9Zn3oSspMFBdugMqUG5y6N3K/sLNa3S42J7MTSwmDaV
         NffP5Wdi9zvfek7uIbAMzvoVprT+vrBDDWHWzhjlo0Hzu3X0QkFrLxfnIEIytdkLZRJw
         x3KA==
X-Gm-Message-State: AOJu0Yzj4jdrROjxsCmJOHgLdy6EHUXyHijyJOAqs9X7Q8n0h+qm55gD
	XcCaXJvmGbeTf5NO54NkvdHJpFhuwf3bEGj7ai288PP1C87fpgHyZh/uHQ/6Aa0QqjX4cfM3y4W
	YA69wiyqulKmnZnnKwIcSX5m14S5P4nRSNyz89St8TlPc1VyHBH/W8DJ9+kAQrObD6Nwh
X-Gm-Gg: ASbGnctIoiRsRXmjn/tNDhJZBOwyhj3NGfuYs5U6LyiYngYOqCyMIXNNYjInoIBzRwj
	JEQCz0zggrB9ylS4bEAbYR6hVFduOlVCv8e5Txilygz6+1w4JF3YUDxvxSG1g7FoJUcWzA5B9Rl
	HY8/jtYbYNX4cMSVqwEoIeEQ+dbZ/hqQ91SG8nrjsLQpD2+wamRa6poKSLXZDDGQV1wGyRaA2AN
	dmI9yqkakkvvPEqYd3r/s1Fqx9P57BmXKTE3czg9TfCtzfpLbaduM9D7OIE4waf7e3XNRx5vj47
	JEL8BslRmdoIhs/1CABS2OpcDF9G+5QtybmJyIhqE6ZVjV3ndleLwtSi8585E8c/XIycR8jY+5t
	t0TKh3c5htl9KV2YgV2fKHspziC0=
X-Received: by 2002:a05:6a20:9389:b0:334:a681:389c with SMTP id adf61e73a8af0-344d1e9d6f7mr4082422637.15.1761649911252;
        Tue, 28 Oct 2025 04:11:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEir10gLmpuIQM7ApflZtUrLLZhaDCqOjyulYgaRdAjRBHf/P6MEgnu6ky/ldUcH5shRkkc9A==
X-Received: by 2002:a05:6a20:9389:b0:334:a681:389c with SMTP id adf61e73a8af0-344d1e9d6f7mr4082378637.15.1761649910755;
        Tue, 28 Oct 2025 04:11:50 -0700 (PDT)
Received: from [10.218.10.142] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b712791576dsm10053265a12.12.2025.10.28.04.11.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Oct 2025 04:11:49 -0700 (PDT)
Message-ID: <17995927-b7fb-458a-a863-b03bd15e6073@oss.qualcomm.com>
Date: Tue, 28 Oct 2025 16:41:45 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] phy: qualcomm: m31-eusb2: Add runtime pm ops
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20251027062458.1411096-1-prashanth.k@oss.qualcomm.com>
 <daf0055b-7caf-4ace-8a06-071468273a37@oss.qualcomm.com>
 <1c52e759-15fd-462b-a9fd-ad620da099f5@oss.qualcomm.com>
 <e4f33bf0-05d9-4aad-b00e-fb7cc2c2633b@oss.qualcomm.com>
Content-Language: en-US
From: Prashanth K <prashanth.k@oss.qualcomm.com>
In-Reply-To: <e4f33bf0-05d9-4aad-b00e-fb7cc2c2633b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dqvWylg4 c=1 sm=1 tr=0 ts=6900a4f7 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=_xMILRQ3MvDrwl_WGjgA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: TpgUJAUaWub3ZTQMDqT9oShT6KwUVhXq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDA5NCBTYWx0ZWRfX6FFFfNCtAICI
 afLMeFHbJUEgzANbGsibkte+9RY4Vp7qeoJ3VdM/jE55GvFpWkpotKfdG889xUw2FAE8rbFhB+d
 jYe9nTOu2vKOYQSf3o8TSi8czQltEN/49rVHf9z1fyzSB0kynhXN9UxPU7zR9wQVsOkKblDcLCD
 YCJByDX0s0Q1uq3ijWWqzJCDTy5cqte+9k1qP3m11nahBnTYYXWjiU+ckrBTsLPRUA4zbaKo08+
 MzABzFI1NtOfVPkBT3J5tXgccCOyhcRvEkPXG+ziNdx9i0Kcc2HUF9KFhBmnxpMqn3Lxstt9aST
 cLKjVcL70T6hzHchxocRyTutnJ8Mqi7cMhewQhlh5xdKyBOuXuOwpg+jqgN62H2Z9prpKIDGNI9
 Mg7VtbWKXaR3OJ3XJgvCu/5ZHKy0zA==
X-Proofpoint-ORIG-GUID: TpgUJAUaWub3ZTQMDqT9oShT6KwUVhXq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_04,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510280094



On 10/27/2025 4:41 PM, Konrad Dybcio wrote:
> On 10/27/25 12:09 PM, Prashanth K wrote:
>>
>>
>> On 10/27/2025 1:55 PM, Konrad Dybcio wrote:
>>> On 10/27/25 7:24 AM, Prashanth K wrote:
>>>> Add runtime power management operation callbacks for M31 EUSB2 PHY.
>>>> Enable/disable the clocks based on the runtime suspend/resume calls.
>>>>
>>>> Signed-off-by: Prashanth K <prashanth.k@oss.qualcomm.com>
>>>> ---
>>>
>>> [...]
>>>
>>>>  static int m31eusb2_phy_probe(struct platform_device *pdev)
>>>>  {
>>>>  	struct phy_provider *phy_provider;
>>>> @@ -270,6 +298,17 @@ static int m31eusb2_phy_probe(struct platform_device *pdev)
>>>>  		return dev_err_probe(dev, PTR_ERR(phy->clk),
>>>>  				     "failed to get clk\n");
>>>>  
>>>> +	dev_set_drvdata(dev, phy);
>>>> +	pm_runtime_set_active(dev);
>>>> +	pm_runtime_enable(dev);
>>>> +
>>>> +	/*
>>>> +	 * Prevent runtime pm from being ON by default. Users can enable
>>>> +	 * it using power/control in sysfs.
>>>> +	 */
>>>> +	pm_runtime_forbid(dev);
>>>
>>> This screams "this patch is broken" or "there are bad issues" which
>>> you did not describe at all.
>>>
>>> Konrad
>>
>> Hi Konrad, I was followed the same sequence from other phy drivers
>> containing pm_ops. I assume the runtime_forbid is added to control
>> runtime pm from userspace.
> 
> Other drivers call runtime_forbid() because the implementation doesn't
> work.. Or at least historically the usb3 part hasn't been able to sus/
> res properly
> 
> Konrad

Sure, I'll remove the runtime_forbid call and send v2. Let me know if
there's anything else.

Thanks in advance,
Prashanth K

