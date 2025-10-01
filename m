Return-Path: <linux-arm-msm+bounces-75639-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C61BAF982
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Oct 2025 10:24:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 82909189B01F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Oct 2025 08:24:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48E2A27B35D;
	Wed,  1 Oct 2025 08:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kk20w8N/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81DA0270553
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Oct 2025 08:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759307052; cv=none; b=CMOHtoUbOAnBfXMeJ601FuCRtPVrOXvcuO8kQp2/XqGntCWJuef71OXkUr0sZfJc/mKoVRklbhpu3r+CXjbu6RytapcHHC22W0xGFnoIaVB4N8vAWoe0fAY3fxgVvknX5Rp821FPskBGRsSUfdVhlWAqdIGW0svfOoYHHlzaCSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759307052; c=relaxed/simple;
	bh=+clJ7vL0rYP0PU+9eKAOYozUc2CoLqMkOXgjFChnTaA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b/JhZQ8wqlB5nYX9EF7uwSzdpZ5t2T3aig/rC0H5LfzzKZ9KKwOaEB/Ia5NjYD4BDGDH12TeDsrEkosDr0xQla86T23Pumi9Y1qBBPvkEfWkfMBg4sLh42AVCEh3wxFO+OujeJLPlSXhUVnSS/HaOm0a/Vu3iPZi6PuVWOvE5ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kk20w8N/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58UM6Gou020349
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Oct 2025 08:24:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9WeCZ8nODB+BE/0tMdVsmrnabswaxwFpBtLmdZ7Nur8=; b=kk20w8N/ftOiMHI2
	s+24PDgXUvUrdO5LF8zHRs4jQ0x056L8LAAkKL/4ZGuyiwdAs159BmPNicI4XeMi
	XAIhFiyB7/BnztmcA4VPvtJTOBZcTf7fj/uggYzAeEq9X9DH4kOiAL1lZxcm6rlD
	szhxRyyNqc27ixyGE1LqzORtIrnWYcRNxj+4aKzWLadRgOqMYhnxiFclIvNOXbEZ
	E3Rlv9QWvcmJk8WNzIlqIxOZhxju0YlRgfmSqCe/JRvIWjJoZCeMtY+9+tQ+cBqg
	iyXG/5l8Q7ADiUcfVxpmTIQGXEuuOlTFFjieVVXPi2WKdY8dPMZFm6hf4Vv9TjEJ
	QWHunQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e6x5v0ga-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 08:24:09 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-78105c10afdso6203833b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 01:24:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759307048; x=1759911848;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9WeCZ8nODB+BE/0tMdVsmrnabswaxwFpBtLmdZ7Nur8=;
        b=U7xCrUcEXmuME8dH6e4i/nQotIuiLuRnmXrpJL6ZqBwSQCcun1llrFJN6lM8tVPWu5
         PQ/kU5BkNxnWRgeXCi5Zm9QAo7bGu8hXG1QVVi6hsp/J1ICdb9liApvabQECTPNbKz0O
         22D+PPSLXJpEckIW/aNmSMC+yHz1s+2ye8zlPRGjA2S6fKniyuTbEpejELOImkt6FI5g
         cRLggoBpXkEcbyGZYWZOQb3GnXlCE1hfiaeilRP3PjOLXEUXuql3BFXXaNEisFnijkfm
         0D19Ua9sD8x6axebUkpjlGjKLmoOWcMYhJUdky03aMmNPCitY/pBbLY8pYPrkrEQpcdu
         XjqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwqoY3lbTmpLKX93aiE1ZE5CprOn1ByoQ2qNeuYSJ9Og03nmzy/NDznGC7Jqfqe8H3WNkv1ZWLB7fyY8/s@vger.kernel.org
X-Gm-Message-State: AOJu0YxVMJqxW5EgjAQfXA9qXddJv6M/HeJm14GmUHw9IbGMB+PeTcgb
	v999euyQTAJDOoC/CFwS+f6braFnDRan03hbHk4v1Bg4nhzNG0lRsaY+U1S8hl2WMg4INBrM+0l
	gQN79kqJY/0LgROM2LtDAfSLdiPaScGOQjZ/jqxORY9govMe+cXPdanSj1qq+DrLKU8nP
X-Gm-Gg: ASbGncuf4INloL/rMMBEJNU6QgdDwbygfcXE+hcHDZxc65nXVpHDFdA/mL8SkMSExPB
	c+MNc4p1CPhpYNYyrhMCm9Y6RaygQq89mz9zLWHLQESko8cxTJf0wumUx39ZkTaz+7ClJi8UUg7
	MIU3Uwqr4l6EFYkxggTwTiCXNxc9hsOrb6djBsXOLxsi0vYFwwu8TLQ54PAeSArKyl54Y8sDNC6
	C8Ld65wa1gaQO/vPPk6dATv2AHwUtq1YXbg9KPuK3FbnBKnTY+HTdxt88FXWX7Bmat2PN2edrOm
	CaGfUrjvhihI3NZlZu+bpBXCk2UiWHQH1hoWSllfkTm6L1CedYiIfc5/Y3mDSnlejdUru78oAye
	cjRo=
X-Received: by 2002:a05:6a00:a28:b0:772:2e00:831f with SMTP id d2e1a72fcca58-78af3fe8acamr3172153b3a.4.1759307047766;
        Wed, 01 Oct 2025 01:24:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+1vDkQo6+qHms4dPxWVBLyluPAupo+qgWQXu4cRIxAyzzN0qF87jp7WdFFUlrd4ofL8WQKw==
X-Received: by 2002:a05:6a00:a28:b0:772:2e00:831f with SMTP id d2e1a72fcca58-78af3fe8acamr3172120b3a.4.1759307047252;
        Wed, 01 Oct 2025 01:24:07 -0700 (PDT)
Received: from [10.0.0.86] ([106.222.229.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78102c06981sm15689317b3a.72.2025.10.01.01.24.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Oct 2025 01:24:06 -0700 (PDT)
Message-ID: <63f593cd-9b57-0e23-e8ac-54f160cd5ed1@oss.qualcomm.com>
Date: Wed, 1 Oct 2025 13:54:02 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/2] media: iris: Add support for QC08C format for decoder
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250919-video-iris-ubwc-enable-v1-0-000d11edafd8@oss.qualcomm.com>
 <20250919-video-iris-ubwc-enable-v1-1-000d11edafd8@oss.qualcomm.com>
 <d2qkd3k7pv7cv3rf76nf3wxedqagg7egz7q2vipiddxzbac5oj@rva7gymbaof7>
 <81932285-b007-7cdf-a28d-21131a26eb85@oss.qualcomm.com>
 <n67nom6bo2hskdn5k2bhbbhna2ew3viccsvvxqddzkbhmr6xfb@sn5abn2vto3z>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <n67nom6bo2hskdn5k2bhbbhna2ew3viccsvvxqddzkbhmr6xfb@sn5abn2vto3z>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ikel5AeeTM_IL7aWN7M94qXpJNjfSLgv
X-Proofpoint-ORIG-GUID: ikel5AeeTM_IL7aWN7M94qXpJNjfSLgv
X-Authority-Analysis: v=2.4 cv=ZtPg6t7G c=1 sm=1 tr=0 ts=68dce529 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=L4UNg9I9cQSOxNpRiiGXlA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8
 a=M6TxIu9XhMF2Uok1x6sA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAxOCBTYWx0ZWRfX+I2vxnI6SYMj
 S6lMSwjWmCQe7yt0PzFQMQAdEzKYhoeisXdYPRgBIWjzciaxkSdKR4MeLoSkKHATv1F5h/tLvF7
 WqeOA2N9pNjPFobkLtDlk+K8+HIkPuxowblVKiU9nrKfEfiyHwxy+yhh1bgSPWdtOVdCEPuVHyb
 DXwRw2rrAy9IDV3SvBCPufuecEjZwRnLlS2lEtCY+Ew3NvxYilRHmI2NUDRAT30yYZ+S3QkgwP6
 Vgw2gJhuIbvDI6KP+lurVmxuqBzaCS4ezLK+nMe+rKlsKTdSlMSQ5Ychnxxsizj5Q41GiSC7pY0
 xHkBwwP23teW1zC6oDuwAqkSuWGMwtRx/3Us0BagVjN+ETla8Yehk/yKR9mpC+wudaSlUHjoGHk
 +BBRZqfYZWZ711KlypWTruUDrqaj4g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_02,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270018



On 9/24/2025 9:53 PM, Dmitry Baryshkov wrote:
> On Wed, Sep 24, 2025 at 04:24:07PM +0530, Dikshita Agarwal wrote:
>>
>>
>> On 9/19/2025 10:24 PM, Dmitry Baryshkov wrote:
>>> On Fri, Sep 19, 2025 at 09:17:16PM +0530, Dikshita Agarwal wrote:
>>>> Introduce handling for the QC08C format in the decoder.
>>>> Update format checks and configuration to enable decoding of QC08C
>>>> streams.
>>>
>>> What is QC08C? Is it supported on all devices?
>>
>> It's qualcomm specific compressed format, it's defined here
>> https://elixir.bootlin.com/linux/v6.17-rc2/source/include/uapi/linux/videodev2.h#L820
>>
>> And Yes, it's supported on all Qualcomm devices supported by iris driver.
> 
> Is it going to be supported by all platforms that are going to be
> migrated from Venus to Iris?

Yes, for all hardware which supports UBWC.

> 
> Is it just NV12 + UBWC or something else?

Yes it's NV12 + UBWC compression.

> 
>>
>>>
>>>>
>>>> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
>>>> ---
>>>>  drivers/media/platform/qcom/iris/iris_buffer.c     |  5 +-
>>>>  .../platform/qcom/iris/iris_hfi_gen1_command.c     | 12 +++--
>>>>  .../platform/qcom/iris/iris_hfi_gen2_command.c     | 18 ++++++-
>>>>  .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  1 +
>>>>  drivers/media/platform/qcom/iris/iris_instance.h   |  7 ++-
>>>>  .../media/platform/qcom/iris/iris_platform_gen2.c  |  1 +
>>>>  drivers/media/platform/qcom/iris/iris_utils.c      |  3 +-
>>>>  drivers/media/platform/qcom/iris/iris_vdec.c       | 61 ++++++++++++++++++----
>>>>  8 files changed, 89 insertions(+), 19 deletions(-)
>>>>
>>>> diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
>>>> index 5982d7adefeab80905478b32cddba7bd4651a691..11134f75c26dd1f6c92ba72fbf4e56e41a72de64 100644
>>>> --- a/drivers/media/platform/qcom/iris/iris_instance.h
>>>> +++ b/drivers/media/platform/qcom/iris/iris_instance.h
>>>> @@ -15,12 +15,17 @@
>>>>  #define DEFAULT_WIDTH 320
>>>>  #define DEFAULT_HEIGHT 240
>>>>  
>>>> -enum iris_fmt_type {
>>>> +enum iris_fmt_type_out {
>>>>  	IRIS_FMT_H264,
>>>>  	IRIS_FMT_HEVC,
>>>>  	IRIS_FMT_VP9,
>>>>  };
>>>>  
>>>> +enum iris_fmt_type_cap {
>>>> +	IRIS_FMT_NV12,
>>>> +	IRIS_FMT_UBWC,
>>>
>>> UBWC is not a format on its own, it's a modifier of the format. Please
>>> come up with a better naming.
>>
>> Sure, will rename this to IRIS_FMT_QC08C inline with v4l2 definition.
> 
> Ack.
> 
> 

