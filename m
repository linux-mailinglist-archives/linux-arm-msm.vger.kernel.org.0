Return-Path: <linux-arm-msm+bounces-87630-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D8D4CF6CF6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 06:47:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3BB4630111BE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 05:47:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C53B1FE471;
	Tue,  6 Jan 2026 05:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XAP7eVlD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MKKIQDJ2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA2E1D8E10
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jan 2026 05:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767678455; cv=none; b=RTrXnzvk9grznGFQQehd+Dp77VwDsgraew5rsJJqGIY/hqOssdkS5LE4uzReTT9LEQN/swJ5KC8DaaMt4Gq+kLmt7obyhNygrcr0Gf2XFuIxugxZfXA/ajPgXf6Ght0sOk7eUcitSRMf+XhuQYuf9+MGxUx6XJkOF3MJER838CU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767678455; c=relaxed/simple;
	bh=i5vu8yGtk0HellFqwFion2Ak+BLdrYOZ3p+b7cA7O2s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Tv9NKuYJkpwupcZ81F0nJIhQWLn6UZHnko5YVVxUJkBuwD5/gjTEEwzu+C8gbsJhj0XeFvIxJmwUDZXtfoOsE3AADhVEoryXGBCN7o1uno/yuh2fb3S6Ujuj/J/b5gs/9YfH5jZvt5HIpQY3pjneBjd93PE7nQ2KANOLopXmYzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XAP7eVlD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MKKIQDJ2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6063QEpe3073079
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Jan 2026 05:47:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q/dwh0Ekn+897m4si2f6RlzqzuqYPVhIepPME2TiFas=; b=XAP7eVlDEBf3HO5X
	Z5kLltiIdRQEI4G+aYhLKrtj5JSS0y2LWx4TPeAsYGr82aTuAi+TLgdLxfCmfYyt
	doeMwIja2ciD1pe5eDMfMMWAwmP7SWkHEoenGCsIsr7MA9od+n/Iwosn5itj4FYL
	yyWTk5JwBsYGEtsjQ2NO8/GddyhmfImNX4m7DIX0KhH4vtb/7OZGPan+pr2scpxm
	g0a8rNmSLupsDy3MZfVMyWFCDbWiCWeoo+Y+Ac13RgcLThFZe/iXrJ33Z/99FcdF
	yYXDHNpflLLAgz4ClHDrbH7bxNShkXGqT/8bnnYtJsIIr5sq4+Hlw8kFJ49FLOL2
	yZRJWw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgrf7gmm6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 05:47:33 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8088be744afso1541461b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 21:47:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767678453; x=1768283253; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q/dwh0Ekn+897m4si2f6RlzqzuqYPVhIepPME2TiFas=;
        b=MKKIQDJ2ZxHG8XVcJEM0uyrsE5dycbYVJ8QrgwE0HyoiwManfOe6eqn5uamFkAtrwA
         AIQF4ptF168OWZNpv4FMbXGoOWx/nx7JJeYutEnX6vNEbb0fer+qeR0141Aj+X4DLkn1
         m+k7NZraOaWP2IjZN+tDF458+r2xNk/MpA1kntEm2mdFdofmS2mBq8UZPYBNOY07/nuC
         6K0RuObNc6w1UkXlXYIOLaZMHlbQmPb3m6/oWzTloxHei0BPQa0NtZbC0qa8ct6fkjjw
         khYZxJVPcNtE1WCqJQmJ4Xl634LeLHW/49T+gthZ9QjjyfQSPYrieJsf4Fv3f5oGFSOY
         YeMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767678453; x=1768283253;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q/dwh0Ekn+897m4si2f6RlzqzuqYPVhIepPME2TiFas=;
        b=PWMkvpiHSBXXenr3DUHoZY192F6JqCuMRER03BVqBxFk7M47N//MlnsXaKanRGo7xy
         +HrjimHjBf/vJ08HkHSpePc596nbvSRlCQ9fV1d+hJ3lY63pWnD2Fgqq0jW858jJ3pdz
         RAGltE/0srl+B/l1/zR48mN762/RaSiyUpGjXeL56HLx57pr3/QEteOT94V+4nfChJOy
         xtipGtpDJ9kMnbKfsoJs9kc6eqUCeOaf3iOZegjWsKUx3u0cpmPM3of8XTuqO6hx4TAl
         1lcF44+PFNbWNfRDOsOch/79xjE104EpxmtB2iEk3guD/cFFYR27eDGnLDDwKVuRmHhr
         5pmA==
X-Forwarded-Encrypted: i=1; AJvYcCWm93VYv+rEfE4oGWqMAOFJGsL4s0afiD0lvnUmYi3kbmHt7him7LoSrEz3NDDyUsoj7cJenYuLqvp4avL8@vger.kernel.org
X-Gm-Message-State: AOJu0YwGWoQJNqoQd6oGat6UEfbgHqQQII3Kyfla3flj0u5p414VIRzv
	t0tKM282ZmpK18feyxcES0Rdq9ZmAWBvNkjMSpHycXG7b0eGj/I9HYc5Jl1at1232iFI2fDqhl1
	cmm4rdlRqyTwOJQ3JUgBZduTpdKEPg1Jj6OEWrVdj1ezM0QsjjLLrOuTgbV9rJKKRCyBm
X-Gm-Gg: AY/fxX7NPn2HyeCzwz7LmU8LhCwvp2NXT2rA2aU0iYN40u0LbbMjhixeTGy/uVaWVGZ
	txZdIbh5dyjSMAlNfGkBK4DDZafRKNZZzn+LVDLS15S788Vf9nS31lbHe4+07mgZbq5SAQuAxrI
	5l0w4nQCCZOX/QrE8PFoKS1MiE9zkb5XzJPTjQLXW2iCVTgOkQsqbOdh8cfTmKX07q/b9SPnoy7
	gnS/JtP70+G30LI7L52hV/ULgvl/RGFjnZ7kly0yufZrVjmZCoFTj+U8twxZFxyrqy1zfBq2mKR
	B2y47V/UNrmFYek6nCNtShsgvqrd/ChGaQTLnkUoOorhCvUneYMyQwrcgeThZRcl+AWk13oRYMs
	ZlDgLA3bMIpls4QMaHj3u2A1ks73ezHK7MvGlps8J
X-Received: by 2002:a05:6a00:1ca4:b0:77d:c625:f5d3 with SMTP id d2e1a72fcca58-81943604d69mr1437580b3a.1.1767678452187;
        Mon, 05 Jan 2026 21:47:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEue9Lvf8RRacycC5QXHlj4IZU+nH15hS6qZlJLf84LJckOP3lo8PGfHYG0pdCX00cFZmVHlA==
X-Received: by 2002:a05:6a00:1ca4:b0:77d:c625:f5d3 with SMTP id d2e1a72fcca58-81943604d69mr1437562b3a.1.1767678451654;
        Mon, 05 Jan 2026 21:47:31 -0800 (PST)
Received: from [10.0.0.3] ([106.222.235.29])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819c5edd921sm846505b3a.69.2026.01.05.21.47.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jan 2026 21:47:31 -0800 (PST)
Message-ID: <4a3b5af0-b9d0-c874-b788-92f406bd6eb9@oss.qualcomm.com>
Date: Tue, 6 Jan 2026 11:17:26 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 4/6] Revert "media: iris: Add sanity check for stop
 streaming"
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251229-iris-fixes-v2-0-6dce2063d782@oss.qualcomm.com>
 <20251229-iris-fixes-v2-4-6dce2063d782@oss.qualcomm.com>
 <859778df-4f46-4a32-93ff-dcdae7dacb0f@linaro.org>
 <a899436d-d14e-bd16-7727-e342fcd02de6@oss.qualcomm.com>
 <69aaa79f-27ce-4308-aecb-260b50bcd0d6@linaro.org>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <69aaa79f-27ce-4308-aecb-260b50bcd0d6@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: VNOhEKGVdxH3tcQJiDJ9Ju3E7y8ypvEN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA0NyBTYWx0ZWRfX+jzih/Tkb75s
 x6cyZYthQQpUbnAp9D3iQfB7xwo6Xt3PBCyzE/oGWVPwgm3JPvexcGXU/KtzpPF/J3VAHRctxfw
 lnGcI1sqBAzdQK4cTFe8ZXjgR9hMk++AFwzY5NROOH/CabMw6PaPsFJH4dqGo21DT+sDgw/T2cN
 ayokNQVl3tojOZwS2jpFvVGKf2NCfAWL/ekvcRnIPvSMgQEJJ6xydU6Fj8LMpmfr1LpSLM4aWyA
 MFOsap77kxn4pIeJp830iLEoHhTm5mLh45pp43BdTgXcO3SlcN06f2ApSS+fVTmaNX3mODvtEyL
 N+0tEFbPQolJam5/QN5EorQQEFOAV7OQUD0DxmMALd9MGjWYZwIzljqzXVtMG/BmGShykqMFFYS
 SaHt6NhF8XoEhz7uCWaql7xyEdyi8M1mtg0PQltQ5+y0pDsrtQijyo5rGeJXwOPA/Nqou4KgbWq
 tcdocm178VU2CBsP7Jg==
X-Proofpoint-GUID: VNOhEKGVdxH3tcQJiDJ9Ju3E7y8ypvEN
X-Authority-Analysis: v=2.4 cv=FK0WBuos c=1 sm=1 tr=0 ts=695ca1f5 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=uEWbcFbpE8I7qiizULz5VQ==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=kpyLQs8HHTFAnI9_2BMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060047



On 1/5/2026 6:20 PM, Bryan O'Donoghue wrote:
> On 05/01/2026 09:51, Dikshita Agarwal wrote:
>>
>>
>> On 12/30/2025 3:55 PM, Bryan O'Donoghue wrote:
>>> On 29/12/2025 06:31, Dikshita Agarwal wrote:
>>>> Revert the check that skipped stop_streaming when the instance was in
>>>> IRIS_INST_ERROR, as it caused multiple regressions:
>>>>
>>>> 1. Buffers were not returned to vb2 when the instance was already in
>>>>      error state, triggering warnings in the vb2 core because buffer
>>>>      completion was skipped.
>>>>
>>>> 2. If a session failed early (e.g. unsupported configuration), the
>>>>      instance transitioned to IRIS_INST_ERROR. When userspace attempted
>>>>      to stop streaming for cleanup, stop_streaming was skipped due to the
>>>>      added check, preventing proper teardown and leaving the firmware
>>>>      in an inconsistent state.
>>>>
>>>> Fixes: ad699fa78b59 ("media: iris: Add sanity check for stop streaming")
>>>> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
>>>> ---
>>>>    drivers/media/platform/qcom/iris/iris_vb2.c | 8 +++-----
>>>>    1 file changed, 3 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c
>>>> b/drivers/media/platform/qcom/iris/iris_vb2.c
>>>> index
>>>> db8768d8a8f61c9ceb04e423d0a769d35114e20e..139b821f7952feb33b21a7045aef9e8a4782aa3c 100644
>>>> --- a/drivers/media/platform/qcom/iris/iris_vb2.c
>>>> +++ b/drivers/media/platform/qcom/iris/iris_vb2.c
>>>> @@ -231,8 +231,6 @@ void iris_vb2_stop_streaming(struct vb2_queue *q)
>>>>            return;
>>>>          mutex_lock(&inst->lock);
>>>> -    if (inst->state == IRIS_INST_ERROR)
>>>> -        goto exit;
>>>>          if (!V4L2_TYPE_IS_OUTPUT(q->type) &&
>>>>            !V4L2_TYPE_IS_CAPTURE(q->type))
>>>> @@ -243,10 +241,10 @@ void iris_vb2_stop_streaming(struct vb2_queue *q)
>>>>            goto exit;
>>>>      exit:
>>>> -    if (ret) {
>>>> -        iris_helper_buffers_done(inst, q->type, VB2_BUF_STATE_ERROR);
>>>> +    iris_helper_buffers_done(inst, q->type, VB2_BUF_STATE_ERROR);
>>>> +    if (ret)
>>>>            iris_inst_change_state(inst, IRIS_INST_ERROR);
>>>> -    }
>>>> +
>>>>        mutex_unlock(&inst->lock);
>>>>    }
>>>>   
>>>
>>> This revert looks strange, should be something like:
>>>
>>> commit 9b6b11d31918722b4522b8982141d7b9646c0e48 (HEAD ->
>>> next-6.19-camss-v2)
>>> Author: Bryan O'Donoghue <bod@kernel.org>
>>> Date:   Tue Dec 30 10:20:01 2025 +0000
>>>
>>>      Revert "media: iris: Add sanity check for stop streaming"
>>>
>>>      This reverts commit ad699fa78b59241c9d71a8cafb51525f3dab04d4.
>>>
>>>      Everything is broken I give up.
>>>
>>>      Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
>>>
>>> diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c
>>> b/drivers/media/platform/qcom/iris/iris_vb2.c
>>> index db8768d8a8f61..139b821f7952f 100644
>>> --- a/drivers/media/platform/qcom/iris/iris_vb2.c
>>> +++ b/drivers/media/platform/qcom/iris/iris_vb2.c
>>> @@ -231,8 +231,6 @@ void iris_vb2_stop_streaming(struct vb2_queue *q)
>>>                  return;
>>>
>>>          mutex_lock(&inst->lock);
>>> -       if (inst->state == IRIS_INST_ERROR)
>>> -               goto exit;
>>>
>>>          if (!V4L2_TYPE_IS_OUTPUT(q->type) &&
>>>              !V4L2_TYPE_IS_CAPTURE(q->type))
>>> @@ -243,10 +241,10 @@ void iris_vb2_stop_streaming(struct vb2_queue *q)
>>>                  goto exit;
>>>
>>>   exit:
>>> -       if (ret) {
>>> -               iris_helper_buffers_done(inst, q->type,
>>> VB2_BUF_STATE_ERROR);
>>> +       iris_helper_buffers_done(inst, q->type, VB2_BUF_STATE_ERROR);
>>> +       if (ret)
>>>                  iris_inst_change_state(inst, IRIS_INST_ERROR);
>>> -       }
>>> +
>>>          mutex_unlock(&inst->lock);
>>>   }
>>>
>>> Just `git revert ad699fa78b59241c9d71a8cafb51525f3dab04d4` and add your
>>> commit log ?!
>>
>> Yeah I did the same, revert and changed the commit message.
>>
>> BTW, I don't see any difference in my change and your commit, anything I am
>> missing here?
> 
> Take this example, I believe the "This reverts commit xxx" is added by the
> revert command and its best practice to include it.
> 
> commit afb9917d9b374ecb77d478c2a052e20875c6e232
> Author: Christian Brauner <brauner@kernel.org>
> Date:   Fri Dec 5 13:50:31 2025 +0100
> 
>     Revert "net/socket: convert sock_map_fd() to FD_ADD()"
> 
>     This reverts commit 245f0d1c622b0183ce4f44b3e39aeacf78fae594.
> 
> I can just add it back in with the PR though its NBD.

Ah ok, got it. Thanks!

> 
> ---
> bod

