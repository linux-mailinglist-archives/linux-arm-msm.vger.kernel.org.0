Return-Path: <linux-arm-msm+bounces-17991-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DFDFF8AB632
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Apr 2024 22:59:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 186EF1C20956
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Apr 2024 20:59:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BACC811C94;
	Fri, 19 Apr 2024 20:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dM9Ob2Yk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04E8E11713
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Apr 2024 20:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713560385; cv=none; b=NIZqi1utcnx36dNo02i37JTILR188VvxFg4boRKRW9kG22cN/ddYliMGxS15loSmblcJk0Anh27Kw1ATJT/bzUlgELJOSdLJPhP1dhbWHIL3Zclwsm7b31tuSQ40DpVMEjCmpNLOLqgKor5iOdg5/5kEAVnOFRFqBqDM4hlCM04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713560385; c=relaxed/simple;
	bh=XZEjZoGO87I/SjLQqsiuwzfNC2wNLij05hhsdu3I0EE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=an8fBRprwXAONbRLkBMGCE5w5xjfawHyGI1VK+VXutb+RPmwvUrKmaSrVa3+dHJVySAoC3ND5RqjT8UJfoVSG33+ywcKilYHgYDPOOf+2ZUjqbnH8Cpk5whfBsyhIR7CT01c6V39Q3z9mwHHPFKAlUfQOKizuhM3GaKlNpap3Tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dM9Ob2Yk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43JKkdV1002066;
	Fri, 19 Apr 2024 20:59:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=6TjaU0uEodvAKMAF8xEL9q8RGEq5iJ4cmkVbLGO6X6w=; b=dM
	9Ob2YkuCt137+5ipqqbozZnBjCfnri47rXzY/UjQmnvvVgOO9tTiOWlgFn8yYHZB
	T6pq+5dVFGfhShmzpslmXk/umthY+f7BJd8QOL6RCnob0LrN+sBdTgbjdRnYHY/3
	Mk/Xe4nXP/4hRRQqWdfKo+rR/BBAN1UhWhfodPK/jZKUvgc343uMtx6RYzWlFTGI
	87KQPMLR9yTbutInNRvFNPp0ZQwakEZedEmNJBppAruE7KTkToxJiVsmFuwXwReH
	PiNesAnXtpI+4nGihvPLiEsXoG/43VLggvTdevJQ44oRCanUveAgGAU3l5eofRCG
	SpqXCOstKxDGejPAn/Gg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xkjy3hqfu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Apr 2024 20:59:32 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43JKxVKe025608
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Apr 2024 20:59:31 GMT
Received: from [10.110.104.191] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 19 Apr
 2024 13:59:31 -0700
Message-ID: <dbfc9b4d-1035-c98f-13c7-9d98aa18d41c@quicinc.com>
Date: Fri, 19 Apr 2024 13:59:23 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 03/12] drm/msm/dpu: use format-related definitions from
 mdp_common.xml.h
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn
 Suijten <marijn.suijten@somainline.org>,
        Stephen Boyd <swboyd@chromium.org>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn
 Andersson <andersson@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20231202214016.1257621-1-dmitry.baryshkov@linaro.org>
 <20231202214016.1257621-4-dmitry.baryshkov@linaro.org>
 <bb448864-b974-55ac-4709-ea89bbd2694f@quicinc.com>
 <CAA8EJpqnjY35RF52yJ8gFRKHoh1ArnnviacDtfntSYZdALD3bQ@mail.gmail.com>
 <83b45b20-fb7e-564b-4e32-2b6a12c4dc6d@quicinc.com>
 <uhyqwsevbgvayqf7ky2tasvutpqgvuaa5o7y7scqete3jueuhk@zgji4hgmh4lu>
 <c0274d67-ae15-8b08-a6af-bd1d77698ab9@quicinc.com>
 <CAA8EJppmyU246kFE3Xk7SLG9GDgfhfT4ONCu8ZzQg3ssx+njbQ@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJppmyU246kFE3Xk7SLG9GDgfhfT4ONCu8ZzQg3ssx+njbQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: PfAyoa3MzD0KdKBtuh0CsHVXftekaH8N
X-Proofpoint-ORIG-GUID: PfAyoa3MzD0KdKBtuh0CsHVXftekaH8N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-19_15,2024-04-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 mlxlogscore=999 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015
 impostorscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404190162



On 4/10/2024 7:38 PM, Dmitry Baryshkov wrote:
> On Thu, 11 Apr 2024 at 02:54, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>>
>>
>> On 4/10/2024 2:12 PM, Dmitry Baryshkov wrote:
>>> On Wed, Apr 10, 2024 at 01:18:42PM -0700, Abhinav Kumar wrote:
>>>>
>>>>
>>>> On 4/10/2024 1:16 PM, Dmitry Baryshkov wrote:
>>>>> On Wed, 10 Apr 2024 at 23:00, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>>>>>
>>>>>>
>>>>>>
>>>>>> On 12/2/2023 1:40 PM, Dmitry Baryshkov wrote:
>>>>>>> Instead of having DPU-specific defines, switch to the definitions from
>>>>>>> the mdp_common.xml.h file. This is the preparation for merged of DPU and
>>>>>>> MDP format tables.
>>>>>>>
>>>>>>
>>>>>> Adding MDP_***__ usages in DPU driver is quite confusing.
>>>>>>
>>>>>> Can we align to a common naming scheme such as DISP_***?
>>>>>
>>>>> No, it's not something display-generic. It is specific to MDP
>>>>> platforms. In the end DPU is a continuation of the MDP lineup, isn't
>>>>> it?
>>>>>
>>>>
>>>> No some aspects of the hw are completely different as you already know
>>>> between MDP4/MDP5 and DPU. Bringing back MDP usages into DPU does not seem
>>>> right.
>>>
>>> MDP4 is different, it's true. But there is a lot of common between MDP5
>>> and DPU. Frakly speaking, I don't see an issue with using the constant
>>> that was defined for MDP5 for DPU layer. Especially since we are also
>>> going to use mdp_ functions for format handling.
>>>
>>
>> All the HW naming etc in the doc has migrated to DPU and in fact it only
>> makes sense to start using DPU for MDP5 as we plan to move mdp5 targets
>> to DPU anyway. Not the other way around.
>>
>> MDP4 remains different.
>>
>> How about MSM_DISP then? I dont get why this is MDP platform specific.
>> Because the term MDP no longer holds true for DPU.
>>
>> I am even looking for future chipsets. We cannot live with MDP5 names.
>> Have to think of generic names for formats.
> 
> Another point: MDP_ is still frequently used in the DPU driver. See
> dpu_hwio.h, dpu_hw_catalog.h or dpu_hw_interrupts.c
> 

As I wrote in 
https://patchwork.freedesktop.org/patch/570148/?series=127230&rev=1, 
lets go ahead with the MDP naming which you have. If we see its not
working out later on, please be open to a mass renaming that time.

With that expectation set,


Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

