Return-Path: <linux-arm-msm+bounces-60081-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D7CD1ACBEC0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jun 2025 05:17:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EE0311890718
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jun 2025 03:17:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 836A21547F2;
	Tue,  3 Jun 2025 03:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UE/K5hVb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DADAE79EA
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Jun 2025 03:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748920648; cv=none; b=J++pgN2eG5r3WIY1r/3LMn8UdDvsAUKXESdlDLrGm1jmZ8S/cjal6EGba+t1rQ+WfsrWGnzNaWc6lLf+yLP1bdMSs5Bt98rkE60zvk/AMThQnfTzWYasxJ/pWUhqpgsMpW8IP408nNEoSzQekIZRvrD09aqmM8jzJZlf5mTQd18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748920648; c=relaxed/simple;
	bh=mICnRsB30j+MKei8QViebI5du5rZTT4LMUwMAyhcGXw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j41WDHMO1ye4bPsGvlbqYhJubuRmyrbLx6lqRYPyzvG8kgwrOVu4k7RC/cVaMJmngi3ExzK+ioBDj5g6xtxK+fr2hcEWeKC/l8pnws2lsIk0Vlt2LQZZrJk/bmWABVTFDacriv9FFIbRoggQQgIF4eXSO0cwS7bTqMGF+etFHAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UE/K5hVb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 552HKI4N031342
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Jun 2025 03:17:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rMgCs9NrjesFQlLVNGJXrQW0yp9nGoo0WvBW9uMrt1g=; b=UE/K5hVbdmX5taoS
	AgDaFz3oxpZO9NeuOpgJcu9ZfPImD2rQspS9qYRe+eUVwa17RtoQ4I1uOvVCOFxn
	OW/Q9A+fylpF47XPz86JlxAS64mavK84xFX44pUhaCFxUeKYXOgva9kaNAN8cIaR
	WTc9DVOem/eBdFu5pr4OPkxfoIlJSyep1DlHIFGV9k7513Qt3uTTWMJhM2FL2cf+
	GxTlBY3l8230+vjjU+TGZF2du04mwgar25ADzy0IK6g/RgQxwPrpEOfx57BMlGRf
	VqIAC0TJgBRyFgxY3evP0EhbQ6xzkrXQoHJdsL84WJNfcTuz009VwlMxYgwH91lO
	WOsaoA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8ts4sx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Jun 2025 03:17:25 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-231e059b34dso45794525ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Jun 2025 20:17:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748920644; x=1749525444;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rMgCs9NrjesFQlLVNGJXrQW0yp9nGoo0WvBW9uMrt1g=;
        b=p1g5tgryJHXSoCW3VrxBmCWL4iNnnd1RWkH25yk0kDqFIf13RaaGmqQW2RMrkcvQR0
         m6aa6G6zjOuoTX+due1XsLVb1ltCD7mrItY9JIeqCCYcRju8MML6UiTuj3CGyQZDpT9J
         F5DTf51q/uZv7Tx598ua6fKKPrp6RkHg+w9+cx4jT8M8x7MnrjPpmlIGsEUWbbHQgEEN
         AzcrgPUadOaXOudq1zUA+z9YJEmEeVGjP26bNTUGUyJceCeIakTMzsd3U/DKP5gvMzf3
         PQHCD7fpWV33XIvhC4Ot/ak1oKdvOSwi17rDFEqR4H7UKAspcJRKDisKBOg4TJL8RmW+
         korQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+WsaL5ehFbei+jfJSbc6Bi5OyNzr+/kuwrmzo3tm7QbAXP++SNSam8+gW9zOyb+nai4pQjAOwJAgcg7sd@vger.kernel.org
X-Gm-Message-State: AOJu0Yzqdpe4lOHxm+cSNRIdi3FnmRczZiGdynEeqxWPETG6FD10gW6w
	iFiTpfQ7go0Vgfmiuu6nk2tJkruWq5xmMYKo/zPyBIib0ZtQJvnd6Nn/PO29KJfhF3jIg2CflRk
	cj26Eb1k7Lxd8fP0r+JG4DKCgB/5IExoB91tFikTrVEok426PFESy/NivP7D9GjITwSyk
X-Gm-Gg: ASbGncscOAzQHxVEmAAIm28RnMMqR6GtXmqqeFw6v90RztD2AVQYQ0fhclaye+BPrJ9
	+UeYlYnutbwttzhdL//zeESlZjNjwpWrKeXFJLVKmbLMng99vG2DglQVyqpK/ouE4fkuq/CtKSA
	XMRb5n5GWT9owLj05HGH4ZKVMsg8+W7JcysJhN92O+X4Qwa2m/qj5Qf9IIzO56SWtN9pekS0lnz
	kpTkzYn7SYs5B5b6wjaUMOqDnKjfNvZTm+okePwe6rWsoqKwY0SJF5UllMIttRlV+h22guvNLKn
	xe4R84Agksrun2NwQBFLqIv+J3i1/8fySoJULIvWcrh+Ff60J7Xld+i0xbn6r3BfPWfDEDJc
X-Received: by 2002:a17:902:d4ca:b0:235:2403:779f with SMTP id d9443c01a7336-235395b621fmr226631735ad.29.1748920644393;
        Mon, 02 Jun 2025 20:17:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHJAApKbsRRZnpYjpmXHMAeqRWvvuJ1p5ObFhKMNoXU0JlNmL/FtEvJRcGPJWs6NXL4fE5oyw==
X-Received: by 2002:a17:902:d4ca:b0:235:2403:779f with SMTP id d9443c01a7336-235395b621fmr226631465ad.29.1748920643986;
        Mon, 02 Jun 2025 20:17:23 -0700 (PDT)
Received: from [10.133.33.114] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506bc8842sm77825665ad.44.2025.06.02.20.17.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jun 2025 20:17:23 -0700 (PDT)
Message-ID: <405f0432-3f07-45be-8511-06235dcd84d0@oss.qualcomm.com>
Date: Tue, 3 Jun 2025 11:17:18 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: qcs615: disable the CTI device of the
 camera block
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Jie Gan <quic_jiegan@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Jinlong Mao <quic_jinlmao@quicinc.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250527015224.7343-1-jie.gan@oss.qualcomm.com>
 <5fbb515a-c3d0-4bbe-a689-41e730ecd952@oss.qualcomm.com>
 <9a156925-cf7b-4d2e-88a8-fdfed5528553@quicinc.com>
 <1fef810c-47fe-4f6d-95bc-0d72dbd63bf0@oss.qualcomm.com>
 <79f5e42f-f857-4247-abf9-d0f3f5c1a498@quicinc.com>
 <f3f8f446-4f0d-482d-952d-35c80d7d7881@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <f3f8f446-4f0d-482d-952d-35c80d7d7881@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: o9Z3SWtNlUhfbSfvCqwwUV5-VcYzxRr9
X-Authority-Analysis: v=2.4 cv=Qspe3Uyd c=1 sm=1 tr=0 ts=683e6945 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=P-IC7800AAAA:8 a=BXdiI9v_AKGlemzBL5QA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDAyNyBTYWx0ZWRfX8GQxDk3p94sA
 vzPRJEEGiIfBQfql2l09bc9TJ9lhuE+LJC0qwgRO/0+JrmsbqHvBc9wrJ4zU8pTloqgTViR4Ewt
 ielJIWNWHXuW79c0GfzfbKNojkTry4K6IqBLaCcnWRq/ZT/n4rAS+JosAdSEl7BAzW2x9I2cXwV
 cCn8CiwkXqgpSy26iixEn4u8nXBYUkrDqH0uWlVRLbuP9UX04K5yNCzoLsTv8YDyCzytkRhoWko
 Gd/C1oeOSwOkFhLERZ8U2e0YB+9WJl6o3OHofOYR52myB4ftiRktWSR1q+eAqrVrFfEh7EJTj+1
 RNAZA0lYtyJB+1UbBUXUISevLLaOEZcqb1qivB3oiGusHxEQWTVlwjZTsYq+oazmwh1332yVtYR
 PcrZyQRqPD5am9w+8CwOuJ+Q7OVDmrqJLylrr4Ime6MwlCd2YBA9mSCj0yImWhsgOZse01nf
X-Proofpoint-ORIG-GUID: o9Z3SWtNlUhfbSfvCqwwUV5-VcYzxRr9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-02_08,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 spamscore=0 priorityscore=1501 mlxlogscore=839
 lowpriorityscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 adultscore=0 phishscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506030027



On 5/31/2025 7:05 AM, Konrad Dybcio wrote:
> On 5/28/25 5:02 AM, Jie Gan wrote:
>>
>>
>> On 5/27/2025 6:41 PM, Konrad Dybcio wrote:
>>> On 5/27/25 12:32 PM, Jie Gan wrote:
>>>>
>>>>
>>>> On 5/27/2025 6:23 PM, Konrad Dybcio wrote:
>>>>> On 5/27/25 3:52 AM, Jie Gan wrote:
>>>>>> Disable the CTI device of the camera block to prevent potential NoC errors
>>>>>> during AMBA bus device matching.
>>>>>>
>>>>>> The clocks for the Qualcomm Debug Subsystem (QDSS) are managed by aoss_qmp
>>>>>> through a mailbox. However, the camera block resides outside the AP domain,
>>>>>> meaning its QDSS clock cannot be controlled via aoss_qmp.
>>>>>
>>>>> Which clock drives it then?
>>>>
>>>> It's qcom,aoss-qmp.
>>>>
>>>> clk_prepare->qmp_qdss_clk_prepare
>>>> https://elixir.bootlin.com/linux/v6.15-rc7/source/drivers/soc/qcom/qcom_aoss.c#L280
>>>
>>> I'm confused about this part:
>>>
>>>> However, the camera block resides outside the AP domain,
>>>> meaning its QDSS clock cannot be controlled via aoss_qmp.
>>>
>>> Do we need to poke the QMP of another DRV?
>>
>> The AOSS has a clock control register for all QDSS clocks. when we vote the qdss clock, the aoss_qmp driver will send a message to AOSS to enable the clock control register, then the clock control register will enable all QDSS clocks.
>>
>> The QDSS clock is not a single clock source, it is a term that representing all the clock sources utilized by the QDSS.
> 
> What I'm trying to ask is, is there any way we could enable that
> clock from Linux? Can the camera hw turn these on? Maybe we could
> trick it into enabling them?

There is a power issue if we keep the debug clock on with a long time.

We had a discussion with AOP to check if possible to add the debug clock 
of titan to the QDSS clock list, but they need time to evaluate it.

 From Coresight view, what we can do by now is disable it in DT to 
prevent the unexpected NoC error.

Thanks,
Jie

> 
> Konrad


