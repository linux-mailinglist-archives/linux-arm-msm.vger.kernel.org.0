Return-Path: <linux-arm-msm+bounces-79405-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E0472C19817
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 10:55:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 551B94E84E3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 09:48:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F4C12E22BE;
	Wed, 29 Oct 2025 09:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nO/CMfSu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bJOyBa7U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD8AB20C48A
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 09:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761731321; cv=none; b=RzUNugezRlq/t9QfTOmQ5KcwSAChMBRUDFucrxBCBBKFX+uqlAZdeIA9EI0Ozvkf20yN5gx+6tES5LzOuSNXNylyb7aRo0qnuoYW+cYkSmhhFB/IwKMl+lSIhWQfy4TRwrGLRIJgyH70AlOcDUcMuOSnhoJiiM4W67WXblmW8/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761731321; c=relaxed/simple;
	bh=mSRviZJT8nrfv6oBTvNwoSXnVUlvfTZTNBlekRcUmq4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lIK5I5qoe8b0Ngufbfe5ZJjFCzMA79oy3TKkDvjMK4+YfzF+TAi8N7RfuFGUMOBJZZoIGPp0jKt7fEzIa2w0ldp3pBa5U+k/MY1rnHgIWHxDcLdzPxI+TEigpmnJkTbZ2Y1vTj9iShYkwtlsdVHgS9LZQJfCji2VDEIxrn5xTVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nO/CMfSu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bJOyBa7U; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59T8TTad4135357
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 09:48:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NXDJ/8mR0gw8cqrsb4EfbpEgu/FMCndzU0gyJwlxJA0=; b=nO/CMfSuJgXwZrsB
	YE+XH/1kPNG8FZ5xCpIE6LmWig76BSInQpp0cgV5alWrfp/5Wuuw1FXPBSwadAcr
	STCYgJbM8MAze1N/XVAjYSHHZn72PgbHkKrX06XB1rZaB8vLC0kclkOq29RhH9jp
	bOoZM4CkvHPzZfJYJruybBCPvDOVh1Vq8V7jvsljdmjNnzr0WDrPV+Ua6uHJ5tgy
	iZMNKcDbX7RsbEgsrMI6Ub4nd1a8Uj4ovZ0GM6RLFYIUs+ekSi6euimzvRUsC4so
	VicIKSzmvDWl7awoLeGR4TOjw74n7GiVfxIv5BZ2LLcsWp/juN7uHyxY3ExWYdGR
	QPKF/A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3ff9r88m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 09:48:39 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4eb9cfa1b72so17420931cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 02:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761731318; x=1762336118; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NXDJ/8mR0gw8cqrsb4EfbpEgu/FMCndzU0gyJwlxJA0=;
        b=bJOyBa7UlumeEP2844E4+c9faKK7Edxe/2g4A9DE+sVuUaYW2pY/PTlL3Ycv36oO8z
         ubtQT6c5YpISvgvVYDDjcyqrYFCnlnEbeQ/EDfsi5PkG2CamMFxGuhaq6qVVjLGANThc
         DfHWQUlry0qHE5i3N2Q+6FHfbnPL9pnreKplaogj1JCLS3fE+ITUd/UI5dlx13cEHGhU
         /ws330l8V2Qi3Db3G9oISB9cumPYwK0PD2AIyQUWf41QzrjmDT7usEiXXSqNx51vz2qg
         8+VEdg7k22nUgGEK0ZcSycyZfMwzHfoIGI3TTLq5iXVWu4bAeFdiDZHM85hYoOAxoiw1
         Bv9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761731318; x=1762336118;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NXDJ/8mR0gw8cqrsb4EfbpEgu/FMCndzU0gyJwlxJA0=;
        b=VLQs8SYBQ8Ei4/Nm+ZLUHKA02N/ehrDzMC/d+FPMiIb4ghkCEpA6Fx+U3GVP5VGzqm
         MhQKlQqM/CArZcN/LfMCGL+68jhXvhTlxAQ/GztmVMmpngkmP4E5spqQD/CC75XID5IB
         b9od6SA+m4wCgEro7fY4z8lb4WpMbLKK3GGc3YVP3rliLqBq+g4+UTIRKR2fwqxQvfMk
         MPkrdDn5W8ziLk6e/D5uYLRYvQpoPeMwrwh53NqANNZTsrD8mywFqHk4jjIYvgjSHUd/
         hYLnXmOOCEy6yYLMQj5eg5sKfghAGYlQzHULDKQ0cLNKF5r3W8y7L0khItNBV9RrKA0g
         NVXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXq8cRaFmnog2brdsJ3slkVa8ow6ONV/jk//Q8RjZU+aH0FHEx94+AQc/as8zh70cBLDn/N2FxoBxoGScy@vger.kernel.org
X-Gm-Message-State: AOJu0YwA+VmQGVFyDMkx1IY+c3AFlMvW9+XlpNJGNvEHcO0P5V+ZIMjb
	DRBgTMxy4gqoxGrOGkZzVI7B3Sc8ejwMNP6J+OPQqOYT2axVkNwC00jMMDfJTiwZshFaFcLhirl
	TizmQpdX18e1riG1+ylkZW0j5s/Lm8X9RrjgHjC06fir0GED5/TsarzP9XvpiuA3G9HHN
X-Gm-Gg: ASbGncsFcGhEpSs6sZTsCp+VyjsehHA4DG9XaphYNgvmaIVTfB4cEv2Eq5RCUsD7SxS
	4/peGjLo60nQHd/l1F4Vvvqs7b5Xs00YZp5+qp5Gd2b4TjSPemVPmRin/zVXfD1pT084iS3d54r
	L1DFxwriM3vsTReSnas4P5iLTxFb87ormZVOi+xgEWSMnZ1CCnxcItP6IdyBmWGkf9kSd0m31mA
	FWyqsvpXmdncPZpomJNPqTYsQfyULOmit6D9zvgBLmlJYbcB7oeP6abIvMPvi/FCh6p1ohcda+K
	kWRNQkDfqUZoLkYo33e/S8juuk/exokRys4zbJbL4V7CCI4lZI7V4HGKqVf/MsgdYvSdsr2b8kq
	NNI77FiUop3hF6FlzxPRPPtSxzthvH9I0rh8ky2grGN33S2LwpBeSkx/1
X-Received: by 2002:a05:622a:24a:b0:4ed:7ce:8497 with SMTP id d75a77b69052e-4ed15b5b4admr21772661cf.3.1761731318131;
        Wed, 29 Oct 2025 02:48:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYOEqIUpR3rqvcOHQdFhJnl6mL7OfMUA6zGCTArqO2LmMgBKniIZv31BF5P5aE2+XJqdUc6w==
X-Received: by 2002:a05:622a:24a:b0:4ed:7ce:8497 with SMTP id d75a77b69052e-4ed15b5b4admr21772471cf.3.1761731317612;
        Wed, 29 Oct 2025 02:48:37 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6404de640fcsm757954a12.8.2025.10.29.02.48.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 02:48:37 -0700 (PDT)
Message-ID: <c7c26f26-4e18-4f54-8c88-69ce97345e86@oss.qualcomm.com>
Date: Wed, 29 Oct 2025 10:48:33 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/12] drm/msm/dsi/phy: Add support for Kaanapali
To: yuanjiey <yuanjie.yang@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
        simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
        quic_khsieh@quicinc.com, neil.armstrong@linaro.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023075401.1148-2-yuanjie.yang@oss.qualcomm.com>
 <omlhiywjr46ik6bj2aiutgcf4aifen4vsvtlut7b44ayu4g4vl@zn4u3zkf6cqx>
 <ad906eb5-c08f-4b66-9e37-aaba99889ad4@oss.qualcomm.com>
 <aPryORKIuSwtXpon@yuanjiey.ap.qualcomm.com>
 <einog245dsbqtx3by2cojyzmyctk2fffpwndwoe24puwqq4fta@cu6iiidxqgr4>
 <0291d0f2-483f-48d8-8c75-f1bbcd1ab18f@oss.qualcomm.com>
 <ehgdx7av3jewowkvtsqrbnsphgxm5hryl6n5otnapi4xneldze@gcwvpssisv2x>
 <aQGHyN19/a/tl0BH@yuanjiey.ap.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aQGHyN19/a/tl0BH@yuanjiey.ap.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: cZCbDzRH-5e2sAIFMEfpfnhU-UkVw_e_
X-Proofpoint-GUID: cZCbDzRH-5e2sAIFMEfpfnhU-UkVw_e_
X-Authority-Analysis: v=2.4 cv=Cf4FJbrl c=1 sm=1 tr=0 ts=6901e2f7 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=fe0abWBLJpTHcFswpKQA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDA3MyBTYWx0ZWRfX/IHjeEiRzaiI
 P3gDykTQHaZpVemImxQh8ea1FhqMBw2bmwXIorEik3k2BN42ulJ4eikSwdIRcLjaqqjeu77Phbm
 5O/trIWgCMD0FdaK2z9zehEMS/pmzYwpNHyN7MiXXH03+YJXLRpDHqPgMug//HvVvSEAgk0HL9I
 JFPz8l87sbyXA/XU+6Gpf4YFDqLutW9K3JrxI035j/BI7U60mPVpplj1JhAxt0Kns5juqsoC5gX
 uJ2aXkyF8QLv/JOfHGgNa6QroTOuK421pHd1NiaqE5j94W7GJ3DPhFfgiIuP1MXEEE2QH6qlMt1
 PHlkjoi4offqG92dgtlXFGzi8AtkdPIGds0dw3cw0lHSoMABS8A94Dc7LOB9zmK9ehY723ogyVW
 4qfufRBlE2ZFmbEzL0mOTqgS5dXSAg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-29_04,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 phishscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290073

On 10/29/25 4:19 AM, yuanjiey wrote:
> On Mon, Oct 27, 2025 at 03:29:40PM +0200, Dmitry Baryshkov wrote:
>> On Mon, Oct 27, 2025 at 02:20:26PM +0100, Konrad Dybcio wrote:
>>> On 10/27/25 2:14 PM, Dmitry Baryshkov wrote:
>>>> On Fri, Oct 24, 2025 at 11:27:53AM +0800, yuanjiey wrote:
>>>>> On Thu, Oct 23, 2025 at 02:02:45PM +0200, Konrad Dybcio wrote:
>>>>>> On 10/23/25 1:48 PM, Dmitry Baryshkov wrote:
>>>>>>> On Thu, Oct 23, 2025 at 03:53:50PM +0800, yuanjie yang wrote:
>>>>>>>> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
>>>>>>>>
>>>>>>>> Add DSI PHY support for the Kaanapali platform.
>>>>>>>>
>>>>>>>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>>>>>>>> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
>>>>>>>> ---
>>>>>>
>>>>>> [...]
>>>>>>
>>>>>>>> +	.io_start = { 0x9ac1000, 0xae97000 },
>>>>>>>
>>>>>>> These two addresses are very strange. Would you care to explain? Other
>>>>>>> than that there is no difference from SM8750 entry.
>>>>>>
>>>>>> They're correct.
>>>>>> Although they correspond to DSI_0 and DSI_2..
>>>>>>
>>>>>> Yuanjie, none of the DSI patches mention that v2.10.0 is packed with
>>>>>> new features. Please provide some more context and how that impacts
>>>>>> the hw description.
>>>>>
>>>>> Thanks for your reminder.
>>>>>
>>>>> Correct here:
>>>>> io_start = { 0x9ac1000, 0x9ac4000 }  DSI_Phy0 DSI_phy1
>>>>>
>>>>> And v2.10.0 no clearly meaningful changes compared to v2.9.0.
>>>>> just some register address change.
>>>>
>>>> Addition of DSI2 is a meaningful change, which needs to be handled both
>>>> in the core and in the DSI / DSI PHY drivers.
>>>
>>> DSI2 was introduced in 8750 already, but it was done without any
>>> fanfare..
>>>
>>> I see a diagram that shows an XBAR with inputs from DSI0 and DSI2,
>>> and an output to DSI0_PHY (same thing on kaanapali - meaning this
>>> patch is potentially wrong and should ref DSI1_PHY instead?)
>>
> Yes, I check ipcata Doc, I see DSI0\DSI0_PHY DSI1\DSI1_PHY DSI2\DSI2_PHY in Kaanapali, 
> addition of DSI2\DSI2_PHY compared to SM8650.
> 
> look like I should add: config io_start = {DSI0_PHY, DSI1_PHY, DSI2_PHY},
> 
> Do you thinks this fix is OK?

The MDSS documentation says there are only two DSI PHYs, so perhaps one
is not exactly implemented. Let's get confirmation of which one that is
and keep the two functional ones.

Konrad

