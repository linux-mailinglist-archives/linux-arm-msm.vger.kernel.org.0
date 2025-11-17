Return-Path: <linux-arm-msm+bounces-82059-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 35405C62D1F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 08:59:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 48BFC4E9BC8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 07:59:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 885E731B113;
	Mon, 17 Nov 2025 07:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kX27KbTO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gkmtfajz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE40931AF18
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 07:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763366338; cv=none; b=AYdKDtMQMjYRHdVfDVvfbgps00T2zym+2rixNXAZnNnn9zKudsRomyprNszFiRvP4lOX0BOE89axuyuxsprLD5YiZp0jDHKeRZTmAL0GkhXek6IUyOzHsbMg8YWMxK0RUpupenMrD90fSnqHvGcrsRntQ8fedeGNhLDqUinUg2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763366338; c=relaxed/simple;
	bh=CZSk1JfKApBajWT9hnlXvxG/AULiiDR2G+MRi4Epazc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ryHxI4sFvEAalV7hV4UIxR876ae6+SfEDJAe6hiMeYOhD7PoxRmmO06BRlxBvAF99DufLv+nK9NRZnlUhkjeESy/XnhzNjSTS7c222bTj1CslGd///SygNkRk1BtWH22UBMbKZmyqz6Mw1W+0yp3/sz0G0CW0gPCE+LD1cjfBoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kX27KbTO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gkmtfajz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AH4o4892838107
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 07:58:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hIX7XK4sXi9lL1hMiIyriGqQXj7kot99pFkfdhsYWkw=; b=kX27KbTOkriuaVES
	0uClDOtYrH9pJmDWnpMZ5/evxF4ZfbNnZhzjVx8421HBwdU40HNKXfwjFlB66P1z
	jObPVP5O91sma0WzC86JdU9kjOjuabxbT2UA/s7LKQczjVT4Mub4190jVAcZH+My
	9W883NvF339vzjTkZb4Y8BtEWmeRsEQcoI9b97uDyH7CqErZjDjgGZvUio5YCqV/
	+k+B1TcvLBViHUJd6vY1a6rwnSlsLFSU2dqGWliJ5W98BvxTDKl2rOVVxqdTLfVM
	Cs1H+QWYXycz5cWQIq8TZ+meul6knF0lLOeVeoxtWyHW3JLACH2E79+ER1Mk8HVh
	hBtz0Q==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aejmyut55-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 07:58:55 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7be94e1a073so2115591b3a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Nov 2025 23:58:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763366335; x=1763971135; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hIX7XK4sXi9lL1hMiIyriGqQXj7kot99pFkfdhsYWkw=;
        b=Gkmtfajzmydp3WlnSo0D83sz1h/MR0kuoH93AxK9QKUEhnuqVa1ma3N1PenrEcVzgz
         JaJx4r9xg54WkA3tXjZfVOu4hurWRyZypl/T8x+J6SktDvN8JVL2tDfdexoxTwY8+GNh
         C8CMdjha9osgaMmAYWJh+qLTI9CFwSSWdzU2116HnEzSyrV8esQL0sDqtOOnss+OPvso
         6EpNPQL9fHAHQpgmZy6otxDIJpHb+XHSVx5HmK6IqWtfwaovAufsss21INCSNX0auNN0
         vtqhtqcv9M4Yg0EbMFPhJBOahCeU88imMcNjrmY5YJEELXIra1CesM5iDYRGKtv1TeZ6
         jGKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763366335; x=1763971135;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hIX7XK4sXi9lL1hMiIyriGqQXj7kot99pFkfdhsYWkw=;
        b=v4HYTJV+d8vXVXeroQz6WmagbU95/I1pry2yUMC/GjFBa+FYkrJWFQvJjYFG+NXgZi
         h+599aVF77F+6YIGZbQQWSFGAFVo8r9/vFs/wik/vJO3/RaeirGYLUveuu4Mkitl1WQV
         kDRqH2thqj9G03dlOUcGxwwGS8SBb2VoP9eB7biRSP2sujUvylrOWHeQn9GeDec6Rp+S
         rNwtHMu2X0XjZCLjUug81XzzW8Y4l7ILcO7T2OBjjGIJPJsaQ+0M6JdvYDuBckjCdCVr
         FTZU0CImbYeJYWmJB58kJ7M5WeBbeBqTJUiQe3X9ZFrDaoExAUbbfUPNgTNJZHSc1TG8
         HtKg==
X-Forwarded-Encrypted: i=1; AJvYcCVxyrgp2J6GpAHwGB+rTJCw3fNIKQEfWl81rUixI7e+EaOL0CjV3GL4l3+1r8AhW0OvxG9ZavkbVeOHgvRx@vger.kernel.org
X-Gm-Message-State: AOJu0YzdQbw7aeZwo8LScNot8lJABd5yn//kNgYvrSVEE/dIVaZPhPIQ
	vzDwa5PNpz/luUaCdy5ug59VZEVpd4Tc0qI5g/NOYZq+U2FnaJo1eMFXKWCAfW/4OykYXOWRkqi
	4oe0Q/QrDltIKM0nrTnazYnKNKboVLor8Qns1Sz1BLjhzjKApnCP4KKz8XIQfr+LJM/jR
X-Gm-Gg: ASbGnctQm/dDxUY43TmfviwpEgHMY1Kiq4bYYWo+6SeUrcJ8NyxWA38ixi94VApZrfS
	YLZO4JvVfkLp3nf8wn30TrQUM4Z4eDcUIhRri6UrLVr+VjQi/GffETbk/lS4S5fCEymr6LBXuP5
	VumWgn/RXMypcV4MeQNNKVm+zpJJ8+JBmjb86UeubKaxbWpHbYEmmmDuKMIX8D9qDb57gAB61oU
	IxpxgSYTsTKIvUfgJTMAtXeXT8a0H6gMvvFeRj+DhzjBqZEUjbJ6/AHKDKJnNuYgBQXeN/d76KF
	Mj7PudKxZdxtH/W6RxFgKUWyrArUQo3mBxbrAkLRnE2eeZ/MXDK1ftKv+vdkSho/VBkJndp/3rb
	ZC2v9rVjUB6Kpw8H7DVhqmFW/8ps=
X-Received: by 2002:a05:6a00:94fa:b0:7aa:2d04:ccf6 with SMTP id d2e1a72fcca58-7ba370d571amr12459319b3a.0.1763366334954;
        Sun, 16 Nov 2025 23:58:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHa5HY43f0xXhWqRBxr9D7V7qKB9dlPZ+SE1aimD589r0HzDlUebGGEPwDkElYHcJFuDnECQw==
X-Received: by 2002:a05:6a00:94fa:b0:7aa:2d04:ccf6 with SMTP id d2e1a72fcca58-7ba370d571amr12459288b3a.0.1763366334439;
        Sun, 16 Nov 2025 23:58:54 -0800 (PST)
Received: from [10.217.217.147] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b9250cda04sm12178521b3a.19.2025.11.16.23.58.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Nov 2025 23:58:53 -0800 (PST)
Message-ID: <cdbfe200-314b-4185-bb58-d528ed317610@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 13:28:46 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] clk: qcom: rpmh: Add support for Kaanapali rpmh
 clocks
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, jingyi.wang@oss.qualcomm.com,
        aiqun.yu@oss.qualcomm.com, Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251030-gcc_kaanapali-v2-v2-0-a774a587af6f@oss.qualcomm.com>
 <20251030-gcc_kaanapali-v2-v2-4-a774a587af6f@oss.qualcomm.com>
 <swma6lyjfmyhl5ookdzvpjn5qresgsze5wptg45jfgj7ub6a4t@bdgfstw6gzoq>
 <380aa79f-f334-44db-9527-85247f9735af@oss.qualcomm.com>
 <2jfvrt4r7ddagh2ztbad7qnjpcvulcrtr3ekul6i26qg6zcd44@dxfhl3265okx>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <2jfvrt4r7ddagh2ztbad7qnjpcvulcrtr3ekul6i26qg6zcd44@dxfhl3265okx>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDA2NiBTYWx0ZWRfXzA7Tk3XJ0W6Y
 WRr+e70A7XXufVvKQS444/Xo2Mv1rPkXbabrNrIeMwBBnU8geSzyPR60SzfWyt5rYPTjw5dR5wI
 jr6qiFVqeVVlNF9JaHVkzJH/p2t2cHINgzgeatXwWfaxy0jCKdG7bKg14o1+AgaUwYRcNfsptR6
 u5KzSR9ct8TyX9Cwiopax/6P9MarWppNKS+VRgYJmLowYKE7C4T5RKdK/yevDSK+A8uZOme5etn
 cBXDwGSfM3tvQ2fRbo81CZ4db9pDC2MVinHJr5QJPmnNNhMaP/+Q4G6vvUxu7kgfFmIhelhEct7
 71HpTOM6Kj/VbdDFuiCUBGwWusPYpszabER8Tldy1rPbOsrT2B1zcPJRCGykCCZg+mGC3qeuBw7
 uD4hAUnOAyUV/66yayrukDkyV/Qffw==
X-Authority-Analysis: v=2.4 cv=BPK+bVQG c=1 sm=1 tr=0 ts=691ad5bf cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=YR7zc-dTq-77wRUxLGwA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: _PCx1v6RXyBnQlIFJWXRS3pB7XoBrv3Z
X-Proofpoint-GUID: _PCx1v6RXyBnQlIFJWXRS3pB7XoBrv3Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_02,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 suspectscore=0 phishscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170066



On 11/14/2025 4:38 PM, Dmitry Baryshkov wrote:
> On Fri, Nov 14, 2025 at 02:13:49PM +0530, Taniya Das wrote:
>>
>>
>> On 11/11/2025 4:16 PM, Dmitry Baryshkov wrote:
>>> On Thu, Oct 30, 2025 at 04:39:07PM +0530, Taniya Das wrote:
>>>> Add the RPMH clocks present in Kaanapali SoC.
>>>>
>>>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>>>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>>>> ---
>>>>  drivers/clk/qcom/clk-rpmh.c | 42 ++++++++++++++++++++++++++++++++++++++++++
>>>>  1 file changed, 42 insertions(+)
>>>>
>>>> diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
>>>> index 1a98b3a0c528c24b600326e6b951b2edb6dcadd7..fd0fe312a7f2830a27e6effc0c0bd905d9d5ebed 100644
>>>> --- a/drivers/clk/qcom/clk-rpmh.c
>>>> +++ b/drivers/clk/qcom/clk-rpmh.c
>>>> @@ -395,6 +395,19 @@ DEFINE_CLK_RPMH_VRM(clk4, _a, "C4A_E0", 1);
>>>>  DEFINE_CLK_RPMH_VRM(clk5, _a, "C5A_E0", 1);
>>>>  DEFINE_CLK_RPMH_VRM(clk8, _a, "C8A_E0", 1);
>>>>  
>>>> +DEFINE_CLK_RPMH_VRM(ln_bb_clk1, _a2_e0, "C6A_E0", 2);
>>>> +DEFINE_CLK_RPMH_VRM(ln_bb_clk2, _a2_e0, "C7A_E0", 2);
>>>> +DEFINE_CLK_RPMH_VRM(ln_bb_clk3, _a2_e0, "C8A_E0", 2);
>>>> +
>>>> +DEFINE_CLK_RPMH_VRM(rf_clk1, _a_e0, "C1A_E0", 1);
>>>> +DEFINE_CLK_RPMH_VRM(rf_clk2, _a_e0, "C2A_E0", 1);
>>>
>>> What is the difference between these clocks and clk[3458] defined few
>>> lines above? Why are they named differently? If the other name is
>>> incorrect, please fix it.
>>>
>>
>> Dmitry, my intention was to make a clear distinction between the ‘rf’
>> clocks and the ‘ln’ clocks. Since there could be overlap in the
>> numbering, I added prefixes for clarity. I should have applied the same
>> approach to clk[3458] as well. I will add the fix-up for the same.
> 
> Why do we need to distinguish between them here? The resources in CMD-DB
> don't have such a difference. You'll select whether the clock is RF or
> LN when describing the platform data.
> 

It is more for readibility and maintain a direct mapping with the PMIC
clock grid. This way we can immediately identify the clock type without
cross-referencing desc as the clock mapping here would indicate the type
of clock. Yes, the CMD-DB name does not reflect anything with the names
here. Please do let me know your suggestion.

>>
>>>> +
>>>> +DEFINE_CLK_RPMH_VRM(rf_clk3, _a2_e0, "C3A_E0", 2);
>>>> +DEFINE_CLK_RPMH_VRM(rf_clk4, _a2_e0, "C4A_E0", 2);
>>>> +DEFINE_CLK_RPMH_VRM(rf_clk5, _a2_e0, "C5A_E0", 2);
>>>> +
>>>> +DEFINE_CLK_RPMH_VRM(div_clk1, _a4_e0, "C11A_E0", 4);
>>>> +
>>>>  DEFINE_CLK_RPMH_BCM(ce, "CE0");
>>>>  DEFINE_CLK_RPMH_BCM(hwkm, "HK0");
>>>>  DEFINE_CLK_RPMH_BCM(ipa, "IP0");
>>>> @@ -901,6 +914,34 @@ static const struct clk_rpmh_desc clk_rpmh_glymur = {
>>>>  	.num_clks = ARRAY_SIZE(glymur_rpmh_clocks),
>>>>  };
>>>>  
>>>> +static struct clk_hw *kaanapali_rpmh_clocks[] = {
>>>> +	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
>>>> +	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div2_ao.hw,
>>>> +	[RPMH_DIV_CLK1]		= &clk_rpmh_div_clk1_a4_e0.hw,
>>>> +	[RPMH_LN_BB_CLK1]	= &clk_rpmh_ln_bb_clk1_a2_e0.hw,
>>>> +	[RPMH_LN_BB_CLK1_A]	= &clk_rpmh_ln_bb_clk1_a2_e0_ao.hw,
>>>> +	[RPMH_LN_BB_CLK2]	= &clk_rpmh_ln_bb_clk2_a2_e0.hw,
>>>> +	[RPMH_LN_BB_CLK2_A]	= &clk_rpmh_ln_bb_clk2_a2_e0_ao.hw,
>>>> +	[RPMH_LN_BB_CLK3]	= &clk_rpmh_ln_bb_clk3_a2_e0.hw,
>>>> +	[RPMH_LN_BB_CLK3_A]	= &clk_rpmh_ln_bb_clk3_a2_e0_ao.hw,
>>>> +	[RPMH_RF_CLK1]		= &clk_rpmh_rf_clk1_a_e0.hw,
>>>> +	[RPMH_RF_CLK1_A]	= &clk_rpmh_rf_clk1_a_e0_ao.hw,
>>>> +	[RPMH_RF_CLK2]		= &clk_rpmh_rf_clk2_a_e0.hw,
>>>> +	[RPMH_RF_CLK2_A]	= &clk_rpmh_rf_clk2_a_e0_ao.hw,
>>>> +	[RPMH_RF_CLK3]		= &clk_rpmh_rf_clk3_a2_e0.hw,
>>>> +	[RPMH_RF_CLK3_A]	= &clk_rpmh_rf_clk3_a2_e0_ao.hw,
>>>> +	[RPMH_RF_CLK4]		= &clk_rpmh_rf_clk4_a2_e0.hw,
>>>> +	[RPMH_RF_CLK4]		= &clk_rpmh_rf_clk4_a2_e0_ao.hw,
>>>> +	[RPMH_RF_CLK5_A]	= &clk_rpmh_rf_clk5_a2_e0.hw,
>>>> +	[RPMH_RF_CLK5_A]	= &clk_rpmh_rf_clk5_a2_e0_ao.hw,
>>>> +	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
>>>> +};
>>>> +
>>>> +static const struct clk_rpmh_desc clk_rpmh_kaanapali = {
>>>> +	.clks = kaanapali_rpmh_clocks,
>>>> +	.num_clks = ARRAY_SIZE(kaanapali_rpmh_clocks),
>>>> +};
>>>> +
>>>>  static struct clk_hw *of_clk_rpmh_hw_get(struct of_phandle_args *clkspec,
>>>>  					 void *data)
>>>>  {
>>>> @@ -991,6 +1032,7 @@ static int clk_rpmh_probe(struct platform_device *pdev)
>>>>  
>>>>  static const struct of_device_id clk_rpmh_match_table[] = {
>>>>  	{ .compatible = "qcom,glymur-rpmh-clk", .data = &clk_rpmh_glymur},
>>>> +	{ .compatible = "qcom,kaanapali-rpmh-clk", .data = &clk_rpmh_kaanapali},
>>>>  	{ .compatible = "qcom,milos-rpmh-clk", .data = &clk_rpmh_milos},
>>>>  	{ .compatible = "qcom,qcs615-rpmh-clk", .data = &clk_rpmh_qcs615},
>>>>  	{ .compatible = "qcom,qdu1000-rpmh-clk", .data = &clk_rpmh_qdu1000},
>>>>
>>>> -- 
>>>> 2.34.1
>>>>
>>>
>>
>> -- 
>> Thanks,
>> Taniya Das
>>
> 

-- 
Thanks,
Taniya Das


