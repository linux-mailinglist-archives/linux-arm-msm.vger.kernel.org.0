Return-Path: <linux-arm-msm+bounces-78262-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39FDEBFA370
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 08:27:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E5EE3424DB6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 06:27:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFD0F220F5C;
	Wed, 22 Oct 2025 06:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DqQ5Sec0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A7F224225
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 06:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761114431; cv=none; b=j3kGvoQeypd1BweIH2PD7HfBxzTMxUoCZX6ibgyX3CM4FiUgJRMRw++GeYbKocUUHjdO0ti3yZkcAaHBa8+W+l0DoLG1PV+7/s9WrGzLSGT//6bP9yUVQE2lQYYr3FodvNFoyykK0BYx2swCN8IRpqOt8do1RF872GTUkNEUBnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761114431; c=relaxed/simple;
	bh=L8idftboLq4ECPCFI9BjvbwTy7qlKuFtgeOaQMzOYsA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qk+FbpOpS1ueDV68SqzhVSVVIRuzt1SugSRkjacA8m43M9UYQm31SCXD6L/gD3eDKUtLyvxJ4AMXodjKOtoWGEjpg7Lspao8wSpo5b8bFaCoMzlVScYwIQG7UbzmZ6HjJRLokk4VyEQ35R7fZsGzWHmO7soZwoD1FG3fzNvDnYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DqQ5Sec0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59M0UODU005518
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 06:27:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n6pGa1aVB5M+xSZsXPd+Cs8NwV0lpOi/PGczr4Jo3eM=; b=DqQ5Sec0RaifSbCl
	dFwRU9Edt4gZhBlU8xRGHwwXyw9Ghf5c6xoTjHYEbgopOxPIwxeVVVBKYchMVp8R
	IKx/VfMQWq4S+OYcv/0NMVL1oNFOc+xEQLHEnVpPzDKOTgoMaILGo7NH1P7HvjKL
	HT5n9YiiIlm7ZFf/r9obvBAhxDa8RpEoy93OZN4QRJL8V8vBdjpU9P775ArMEnQi
	ujwpOnQZAmE6LNqVjRzLx7JzKCjdzdwCU0gOL/hlOV1IUkafKZbmJlsTrP9DTXj5
	3tBpPbPZ9v98MA9pjTUW9OBAlVMGkHp4tmDO8bo2uDs1pfz+I5/VyHgZl0E4w0+d
	WI+9Sw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v469kecf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 06:27:08 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-79e43c51e6fso457230b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 23:27:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761114427; x=1761719227;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n6pGa1aVB5M+xSZsXPd+Cs8NwV0lpOi/PGczr4Jo3eM=;
        b=X9wBQVpgn9e79yBtRTzFldC1/0kmDgbaDcb1+J8Vyn4q8+FeLa1O3iCrDCsWEpye3u
         1muFQ3nLeDyIFr2MZC8SWupJjfDLfsFWIwFTB5n/MAQUtAEqg/f2D/NQ1AWVivU6hKGH
         AIqW7s5VAPgNWOdO90H4Y+q3dLyUTb+0Spd7QDfMeyvp0ajCmxbWX4gSEK85Un3Aes0a
         arp83GE7z4G7Guaanl1f65+Ocw/tZTSKzuLNZ8mqWRtYy0YA4dNbjFR56EndWrpC5KOe
         WkQuat5Kk2YHlKSFBGICTGdh8/u8haj5MFPvfAlg9+UuslSoLd3AMoQkHhXkLFb+tDj+
         Xlpg==
X-Forwarded-Encrypted: i=1; AJvYcCWEYOV/wvKf1o8gOBhDHny/SiF0h6OiQMHHD6u2Cyhe9NKIHP954np7yJZ/A10WcVv0sVnLRNrpzsBsYaB0@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7Spd2yGV1kQy9IhYNO6g4VA0+iiaUoDcQ+yL/p03Ky3mrX7iv
	Lf6Nf3ITkrYyIWr8V9mHHEMiyhaF+60Ly3QMmc4fD7WSsJxWYLOjVY/JEoognNwxitAZdcevrUQ
	KrR481PgZoY/BvVL88M1uMmB2BYyCAvINn3FQXiEFXy6jHslKxhND0pHJAXOrpcKgZHKk
X-Gm-Gg: ASbGncs/m+2u16wAbEfielRmHNUQtYJrsHeGa7VJl+ZYqA06rDwGo3gLT/Md9fXbE23
	LH2MT6fBSda3+fOKVYSjbqkHeKWMxF1dhek4UYUfMUQPpr2uMuOqV7BA8C56K4Tom7xgYUplV0p
	Uqpi9CJwGF7/QT//6RDk5H86o0Te6bCaoEtcFq35CCL0XBnOwRH5MpzMZBt1m5sAyVXPxxC/KzO
	flJ/F3iG8d9IFdShAzhM5g0nf/aZfHZufHs1uCpFOgJ30EVGDFKeb8uAfq+pEom29zByRUKnbwg
	qgLIYQUVRc+/odnN2biOO3vyM1koig6JpO9uiYJMPEzUFQtU8y3hauomWghIhhKTz1SMu2Izek7
	nFJ8QU8Aw9zTsvJhNt/uH7Yqki+4=
X-Received: by 2002:a05:6a00:94c1:b0:781:1110:f175 with SMTP id d2e1a72fcca58-7a2647c8ebdmr2911169b3a.14.1761114427094;
        Tue, 21 Oct 2025 23:27:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEvz7+++3+6hxeYXhErn7l1xUx4bvm9OnOU5wKg0OC5fkELuKCSnb13RFcfm5yXDleOS+t/rA==
X-Received: by 2002:a05:6a00:94c1:b0:781:1110:f175 with SMTP id d2e1a72fcca58-7a2647c8ebdmr2911128b3a.14.1761114426577;
        Tue, 21 Oct 2025 23:27:06 -0700 (PDT)
Received: from [10.217.217.147] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a23010d818sm13427032b3a.53.2025.10.21.23.27.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 23:27:05 -0700 (PDT)
Message-ID: <9b96bf9d-6297-4b99-b9fa-e37db7ad5689@oss.qualcomm.com>
Date: Wed, 22 Oct 2025 11:57:00 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm8550: Additionally manage MXC
 power domain in camcc
To: Luca Weiss <luca.weiss@fairphone.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250303225521.1780611-1-vladimir.zapolskiy@linaro.org>
 <20250303225521.1780611-3-vladimir.zapolskiy@linaro.org>
 <dbxvzgqs5slrl5edqunal3wplg5jiszqv46dr4nzgowwlhkhxa@qwtfq7nfjwfo>
 <3210a484-b9c3-4399-bee1-9f5bbc90034c@linaro.org>
 <CAA8EJprP9Z181VDCT=xfyrBipzgiB0tfb8M_XZ4H=yOrvEnB0w@mail.gmail.com>
 <f41061a2-cf45-4588-8df7-22270c936ee2@quicinc.com>
 <D8EZ47Z557OX.37FDVYA5AHET0@fairphone.com>
 <d64c0776-0b12-42d3-aed3-4e6a13487f51@quicinc.com>
 <DDKNL43NWFMA.1S03T0SUYFVMY@fairphone.com>
 <3854e3a0-744c-4317-a6ed-e28edbabc4a3@linaro.org>
 <DDNWU7DVDGJJ.2K19P7FFZU272@fairphone.com>
 <dca13de5-b027-4938-a854-2538fce52b7c@oss.qualcomm.com>
 <DDO2HYG8H2XJ.1MZLPJH36PR85@fairphone.com>
 <DDO35V8IMUNE.2VXRN239GETSB@fairphone.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <DDO35V8IMUNE.2VXRN239GETSB@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Zp0_bTItcNywqmcEXgjX3oBoWANl2w2u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAzMiBTYWx0ZWRfX3wqoPf+wD1m8
 A1qZnCecC5Jg2OdsJ5Awi/HvjK9vUEzwtfp4DQ1b+P2m/Tf5BYexpq41E7DY+5Wo7yrzlyQmDnl
 0ZM172mWjeEwQN8DPNJpvhb+vqYW6vVihlRRNR+xjbm048L7pzaaQiEJpLL4L/INXlveYRkZ9dr
 VW9l79jk5Z6fzM7J82EgCwdno75LjiadVzmovnUYId4InGv+EXUFfzIJrY5PuCEKJoHY5fenmT4
 MzKlPYIQZFb5GwNvKgC8td54+zvXG47iOlrLOp9QBIQiL6OrmqTyPX7ChOqV/wN787McDIEqGQO
 3ymSb6uTBTuPaOSPcmtxSHQ/CsqEYl9z7IggeMtzQ70vmfpS/naK8R5ynAagZlADdccLpPtlqq+
 APeHyxhdt9dL1Vl1tTc8eGWUPmzIyw==
X-Authority-Analysis: v=2.4 cv=U8qfzOru c=1 sm=1 tr=0 ts=68f8793c cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=qC_FGOx9AAAA:8 a=bzike6VFin6Z7d9KIP8A:9
 a=93bzvrPoB/MOLOjVLaw53YuoC0c=:19 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
 a=cvBusfyB2V15izCimMoJ:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: Zp0_bTItcNywqmcEXgjX3oBoWANl2w2u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 spamscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180032



On 10/21/2025 8:26 PM, Luca Weiss wrote:
> On Tue Oct 21, 2025 at 4:24 PM CEST, Luca Weiss wrote:
>> Hi Taniya,
>>
>> On Tue Oct 21, 2025 at 1:12 PM CEST, Taniya Das wrote:
>>>
>>>
>>> On 10/21/2025 3:28 PM, Luca Weiss wrote:
>>>> Hi Vladimir,
>>>>
>>>> On Tue Oct 21, 2025 at 11:48 AM CEST, Vladimir Zapolskiy wrote:
>>>>> Hi Luca.
>>>>>
>>>>> On 10/17/25 17:05, Luca Weiss wrote:
>>>>>> Hi Taniya,
>>>>>>
>>>>>> On Thu Mar 13, 2025 at 12:57 PM CET, Taniya Das wrote:
>>>>>>>
>>>>>>>
>>>>>>> On 3/13/2025 1:22 PM, Luca Weiss wrote:
>>>>>>>> Hi Taniya,
>>>>>>>>
>>>>>>>> On Thu Mar 13, 2025 at 5:39 AM CET, Taniya Das wrote:
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> On 3/4/2025 2:10 PM, Dmitry Baryshkov wrote:
>>>>>>>>>> On Tue, 4 Mar 2025 at 09:37, Vladimir Zapolskiy
>>>>>>>>>> <vladimir.zapolskiy@linaro.org> wrote:
>>>>>>>>>>>
>>>>>>>>>>> On 3/4/25 01:53, Dmitry Baryshkov wrote:
>>>>>>>>>>>> On Tue, Mar 04, 2025 at 12:55:21AM +0200, Vladimir Zapolskiy wrote:
>>>>>>>>>>>>> SM8550 Camera Clock Controller shall enable both MXC and MMCX power
>>>>>>>>>>>>> domains.
>>>>>>>>>>>>
>>>>>>>>>>>> Are those really required to access the registers of the cammcc? Or is
>>>>>>>>>>>> one of those (MXC?) required to setup PLLs? Also, is this applicable
>>>>>>>>>>>> only to sm8550 or to other similar clock controllers?
>>>>>>>>>>>
>>>>>>>>>>> Due to the described problem I experience a fatal CPU stall on SM8550-QRD,
>>>>>>>>>>> not on any SM8450 or SM8650 powered board for instance, however it does
>>>>>>>>>>> not exclude an option that the problem has to be fixed for other clock
>>>>>>>>>>> controllers, but it's Qualcomm to confirm any other touched platforms,
>>>>>>>>>>
>>>>>>>>>> Please work with Taniya to identify used power domains.
>>>>>>>>>>
>>>>>>>>>
>>>>>>>>> CAMCC requires both MMCX and MXC to be functional.
>>>>>>>>
>>>>>>>> Could you check whether any clock controllers on SM6350/SM7225 (Bitra)
>>>>>>>> need multiple power domains, or in general which clock controller uses
>>>>>>>> which power domain.
>>>>>>>>
>>>>>>>> That SoC has camcc, dispcc, gcc, gpucc, npucc and videocc.
>>>>>>>>
>>>>>>>> That'd be highly appreciated since I've been hitting weird issues there
>>>>>>>> that could be explained by some missing power domains.
>>>>>>>>
>>>>>>>
>>>>>>> Hi Luca,
>>>>>>>
>>>>>>> The targets you mentioned does not have any have multiple rail
>>>>>>> dependency, but could you share the weird issues with respect to clock
>>>>>>> controller I can take a look.
>>>>>>
>>>>>> Coming back to this, I've taken a shot at camera on SM6350 (Fairphone 4)
>>>>>> again, but again hitting some clock issues.
>>>>>>
>>>>>> For reference, I am testing with following change:
>>>>>> https://lore.kernel.org/linux-arm-msm/20250911011218.861322-3-vladimir.zapolskiy@linaro.org/
>>>>>>
>>>>>> Trying to enable CAMCC_MCLK1_CLK - wired up to the IMX576 camera sensor
>>>>>> on this phone - results in following error.
>>>>>>
>>>>>> [    3.140232] ------------[ cut here ]------------
>>>>>> [    3.141264] camcc_mclk1_clk status stuck at 'off'
>>>>>> [    3.141276] WARNING: CPU: 6 PID: 12 at drivers/clk/qcom/clk-branch.c:87 clk_branch_toggle+0x170/0x190
>>>>>>
>>>>>> Checking the driver against downstream driver, it looks like the RCGs
>>>>>> should be using clk_rcg2_shared_ops because of enable_safe_config in
>>>>>> downstream, but changing that doesn't really improve the situation, but
>>>>>> it does change the error message to this:
>>>>>>
>>>>>> [    2.933254] ------------[ cut here ]------------
>>>>>> [    2.933961] camcc_mclk1_clk_src: rcg didn't update its configuration.
>>>>>> [    2.933970] WARNING: CPU: 7 PID: 12 at drivers/clk/qcom/clk-rcg2.c:136 update_config+0xd4/0xe4
>>>>>>
>>>>>> I've also noticed that some camcc drivers take in GCC_CAMERA_AHB_CLK as
>>>>>> iface clk, could something like this be missing on sm6350?
>>>>>>
>>>>>> I'd appreciate any help or tips for resolving this.
>>>>>>
>>>>>
>>>>> Recently one particular problem related to MCLK was identified by me on
>>>>> QRB5165/RB5, and it was reported to Bjorn over IRC, namely it's not possible
>>>>> to toggle MCLK clock enable/disable state, when TITAN GDSC power domain is
>>>>> set off. I'm working on fixing the issue (a change under clk/qcom), since
>>>>> it's of an importance for a customer as well.
>>>>>
>>>>> I can't be totally sure that it's right the same problem as the one reported
>>>>> by you above, but it looks very similar, as a fast workaround please consider
>>>>> to set an ALWAYS_ON flag of TITAN GDSC, and at least a report from you that
>>>>> this actually helps would be nice to get.
>>>>
>>>> Unfortunately that doesn't seem to help on sm6350.
>>>>
>>>> diff --git a/drivers/clk/qcom/camcc-sm6350.c b/drivers/clk/qcom/camcc-sm6350.c
>>>> index 12a469ce7e2f..cf87ad55d318 100644
>>>> --- a/drivers/clk/qcom/camcc-sm6350.c
>>>> +++ b/drivers/clk/qcom/camcc-sm6350.c
>>>> @@ -1767,6 +1767,7 @@ static struct gdsc titan_top_gdsc = {
>>>>  		.name = "titan_top_gdsc",
>>>>  	},
>>>>  	.pwrsts = PWRSTS_OFF_ON,
>>>> +	.flags = ALWAYS_ON,
>>>>  };
>>>>  
>>>>  static struct clk_hw *camcc_sm6350_hws[] = {
>>>>
>>>>
>>>> $ cat /sys/kernel/debug/pm_genpd/pm_genpd_summary
>>>> [...]
>>>> titan_top_gdsc                  on                              0
>>>>                                                 bps_gdsc, ipe_0_gdsc, ife_0_gdsc, ife_1_gdsc, ife_2_gdsc
>>>>     ac4a000.cci                     suspended                   0           SW
>>>>     ac4b000.cci                     suspended                   0           SW
>>>>     genpd:3:acb3000.camss           suspended                   0           SW
>>>> [...]
>>>>
>>>> but still the same clock stuck warning...
>>>>
>>>> [    3.093431] ------------[ cut here ]------------
>>>> [    3.094614] camcc_mclk1_clk status stuck at 'off'
>>>> [    3.094629] WARNING: CPU: 6 PID: 65 at drivers/clk/qcom/clk-branch.c:87 clk_branch_toggle+0x170/0x190
>>>>
>>>> Thanks for the suggestion though.
>>>>
>>>
>>> Hi Luca,
>>>
>>> Seems like the CAMCC_PLL2_OUT_EARLY output could be OFF here, which is
>>> sourcing the mclk RCG's.
>>>
>>> The user_ctl is not properly configured to enable the PLL early output.
>>> Can you please try below change and check if it helps?
>>>
>>> diff --git a/drivers/clk/qcom/camcc-sm6350.c
>>> b/drivers/clk/qcom/camcc-sm6350.c
>>> index 8aac97d29ce3..d33db530b7c9 100644
>>> --- a/drivers/clk/qcom/camcc-sm6350.c
>>> +++ b/drivers/clk/qcom/camcc-sm6350.c
>>> @@ -154,6 +154,7 @@ static const struct alpha_pll_config
>>> camcc_pll2_config = {
>>>         .config_ctl_hi_val = 0x400003d2,
>>>         .test_ctl_val = 0x04000400,
>>>         .test_ctl_hi_val = 0x00004000,
>>> +       .user_ctl_val = 0x0000030F,
>>> };
>>
>> Yes! Indeed that makes the clock not be stuck, and debugcc is also
>> correctly reporting ~24MHz from that clock when it's enabled!
>>
>>   cam_cc_mclk1_clk: 23.999592MHz (23999592Hz)
>>
>> Is this PLL also missing a value for .user_ctl_hi_val? The other PLLs
>> have that set as well.
>>
>> Out of curiousity, where's this magic value from? Only some sort of HPG
>> doc, or is this also somewhere referenced in downstream? Curious why
>> this is not set there for this PLL.
> 

These are part of recommended PLL settings from design.

> Ah, just saw this part in downstream
> https://git.codelinaro.org/clo/la/kernel/msm-4.19/-/blob/LA.UM.9.12.c25-02800-SMxx50.QSSI13c28.0/drivers/clk/qcom/clk-alpha-pll.c#L2443-2463
> 
> That's quite different to the simple
> 
> 	clk_alpha_pll_write_config(regmap, PLL_USER_CTL(pll),
> 							config->user_ctl_val);
> 
> that's in upstream.
> 

yes, we can set all the required configs in the user_ctl_val.

> Also explains makes it clear that .user_ctl_hi_val is not applicable to
> this agera PLL.
> 

Yes you are correct.

> From looking at camcc-sm7150, I guess they have the same problem over
> there. A bunch of post_div and _mask's set, but no .user_ctl_val set for
> PLL2. But camcc-sc7180 is fine though.
> 

In SC7180, we agreed to take care of all configurations as part of the
user_ctl_val.

>>
>> This is one major step toward camss & camera support for this phone!
>>
>> Regards
>> Luca
> 

-- 
Thanks,
Taniya Das


