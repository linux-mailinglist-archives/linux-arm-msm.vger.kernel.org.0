Return-Path: <linux-arm-msm+bounces-79340-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 18675C18AB4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 08:23:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 552F44EC960
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 07:22:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8539A4C6D;
	Wed, 29 Oct 2025 07:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZZbVftEv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fWEUybXd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC9E30DD35
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 07:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761722450; cv=none; b=b/1OhYG60T6DCkLiDxjjyH/sYmX0ztkwYr+giWyUK5j3YQDhVrPO7TZVIxq8lf/eco44lcU32CT2vc9JT5+JOVV+SHiGeDvuGJ5KL5k36dFu8WqKqhLbKpJrgrTGxzhSdVwQfWY3t4J32F0U1trrcXm4nJThp+HkLirBvbiFFwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761722450; c=relaxed/simple;
	bh=N66Eu2MTSLX+DQ9Zs5DkmDvPkU3PMuJAmFe6mAPnt5w=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=dQ5Bg2SOryIbIh62Uv+N//Ko3CEcrVJU0cAeQpWeZnDzY6R/uPmZtdulMjkshJ4qRFhc/d9xHMiuHA2ijq60+ziwqSd6YZVes7sTPH3WLXEHhaNDlnIs48jpQZPSqCqWnpOQ4sA2NAHaexUrYsnaeq9noOWsmXnTWPaGqLYAAyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZZbVftEv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fWEUybXd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59T4uwmB3676845
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 07:20:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TQ2ob1Q25E+q3i1KkwW8M/itQjEOKbmijOezq34bQak=; b=ZZbVftEviMu2mgWY
	+mwHbkjjS7+8iQTtnJkLyKkkVx6dmLUFmV72u2PWtIekmHNbivgyM93MnIypnNfk
	MPm7oEYB+/bCZuoVPDXZTjmPxtz2RolhJeqieekYreAXpNPbudjmVHCtZ8UovkP4
	F9Q5RMM0qWvqMrZBAOfxXQHVKun7eUqllSRIJiLsp4GuEpwoKDOc2YwdaavrQO+Y
	TO02J/1n33cm0PjW0vrtYPYZjq4iFQbFHk29McGVQ/stPA0WBipRnhQVMp6FXLkL
	Df4T5FoLgyEJdyhvKn3sgGlN1RZa5yHHABKzdhM8C+oW920lUxxYjRPcMVgyiXC9
	Oij4ug==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a1hjda-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 07:20:47 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-290b13c5877so139241665ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 00:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761722446; x=1762327246; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TQ2ob1Q25E+q3i1KkwW8M/itQjEOKbmijOezq34bQak=;
        b=fWEUybXdX12L7rp3bU7TNK3eOJ237YA/FzkNnSKRqYBl+VSAHzQ2F6wcXznCMJxlw6
         uXcPxwZAOEPAKSvTqwQMip249+yxptomFvtlJbuK8q5oQXIzdthsUztqdAkeVMoTtjXj
         w0sXza0fysjoOEIzhtOYNd6SCs5UE3us0oe/lNfS0MoZw0KBbc1YVI3nwjoE2ZGx3zYA
         4KMBLp27hc3wNxhSathcZcgCt0WcGgyiLq8df++W7IiGL2TzA8UGdTe7FjKXOvfEbI21
         2bovH0JQekv6dYTYAgtO21vZai8i5d4o9JF2sCaVS5w3xHIMDOSeEUI4KlOUTVJOE9Rb
         SsuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761722446; x=1762327246;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TQ2ob1Q25E+q3i1KkwW8M/itQjEOKbmijOezq34bQak=;
        b=soItqfaSPMcp9tkPPsAjPVGUw7hg9drUJWQ0Kzi87Rk9atFLx3LoBlfu3KSv0M3gUi
         UbtmsS3u47UfcaqIx1x4cHovrFfvmTTblmQAckr/9U5oug01aVI1tM9/m75Pylw2AL4I
         I38QBwc/t1J4VLp3bZh31TCVzSPk4YNuopU1OzD9pdBZ0NVt0920pTxfrkw0pBoadDy7
         6Db43CpUXe+j5mdbL+6SG1WjTgOdSRXLhhedmEbqOvMT3GhWKeAxVUv8UQhCQ9sD3QC6
         uABbx4XgNqShnZnbegD/7jb/SsS5XzLI7+iTHMUx4QzMSv/YHXa96hAee3EYZp+iQq1k
         MOcA==
X-Forwarded-Encrypted: i=1; AJvYcCVe5QsIlmuHC86DnYIm16Ib8C96UYWBLnMMiRAybmnt4WTTV4AFDJ8IHCvyxvU7HJuAtBunJ6CMLe8fo87R@vger.kernel.org
X-Gm-Message-State: AOJu0YzaMhxazsr72EXg01WBoF/c6PXyb9EE8MLXRAy0Npl4EdHo/Ugw
	YWxXi9c9EnSIIDhqdQJx0x/Mjj9/QUIRW+aDIJWDB0s28hkJUUGZeMXnZHfAYqEzMK8DEVWo5Pw
	KGjXxi/T20IGv+YbtCNiwaai7ldJKkyyIbRWZuA2pVcb0VSeE2cQLfmqNgNaJFg6JOnYI
X-Gm-Gg: ASbGnctWuco9MU+AIA52ws20igQsltTO1SXnT7qx75AgldGcajYJQ85s5pClUN6Ezz3
	jhgySyICRQ/A0fyMqXAeN4E8YbC+qxdn4w/qV8pfyXnPYDjM08MDXNCzHe/na5plvs/WRrleFfh
	DlOOYixaar7zyue5WmdxVa+Fryf2d06iv79PupH7TLSqt7KGNuX3qsUMJvWqlai1yorERPKFCCS
	0n0ZQZyUsp1j8HvX26BcdlZNa0JQiZwznw9FPTFy2BDEEsZtFwSweLA8Bl9deHZ9GWZMpdiQ3Bt
	nZt3x/g8NEEm0oDQHK6KytetQJoD40OlPNkyn3a1inpmPDaMvNUgG2NS18LEIe8+0mib3vkSpRb
	rOqtPFgpzXRwel2P7jTOWahSvJBDL/h0=
X-Received: by 2002:a17:902:e88b:b0:290:55d5:41dd with SMTP id d9443c01a7336-294dedd4150mr26419365ad.5.1761722446387;
        Wed, 29 Oct 2025 00:20:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGu4F4skDWr434hRSD7TfTtLDsEjdVA7130uO8k1G3iUvZMYEIJ7UgUB9J+ouZB2JbLsyGZEQ==
X-Received: by 2002:a17:902:e88b:b0:290:55d5:41dd with SMTP id d9443c01a7336-294dedd4150mr26418955ad.5.1761722445769;
        Wed, 29 Oct 2025 00:20:45 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.229.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498e41132sm138212415ad.92.2025.10.29.00.20.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 00:20:44 -0700 (PDT)
Message-ID: <f6df068c-214a-bdbe-ecce-112e0afe9a9e@oss.qualcomm.com>
Date: Wed, 29 Oct 2025 12:50:40 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v6 3/6] media: iris: stop encoding PIPE value into fw_caps
Content-Language: en-US
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251028-iris-sc7280-v6-0-48b1ea9169f6@oss.qualcomm.com>
 <20251028-iris-sc7280-v6-3-48b1ea9169f6@oss.qualcomm.com>
 <87b3871d-88b3-2851-07ee-db8f2ca1d58f@oss.qualcomm.com>
In-Reply-To: <87b3871d-88b3-2851-07ee-db8f2ca1d58f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Nu/cssdJ c=1 sm=1 tr=0 ts=6901c04f cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=L4UNg9I9cQSOxNpRiiGXlA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=M8_A81qNnP5ImZZKVzgA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: 5jwmelEU8CgI9fgd0pMxT9i1FWh0zcI2
X-Proofpoint-ORIG-GUID: 5jwmelEU8CgI9fgd0pMxT9i1FWh0zcI2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDA1MiBTYWx0ZWRfXxxxcdu/MouI8
 RhlsI2bTNlSCugbw8AXcLnO9AY58Q4IXlM1s7IkzPS9HVfOiHWKp+7y7XMHgkUWirBTseJvhwCH
 l4QiQTCxiajyMgrVXQut7G2kjeFIbJssOggRrta0m09rtF763ijoiTO8wIAetZr7dMrfG/RHi++
 QvhqIx22eGd5X1HX56YFLJemsVlvlufRtyb07Jm8IWpJ/AFlPtuZtobD+2x5+Y8+xSBBIpD1zBw
 WTYrI3jVg8dbD4evkfYI1JgsUIjRSck10yv0Cj1pKFBmQ0z8tLh3fBqIvfkDFCJQ/GPzJ9gqeYG
 CXxfAhLTdLoitZNorVyPjszAyl1QHPXG36A10Va+m0HHrFlior58KoK3ykLTB44TciF3kd5Se50
 QXmQAC3yScEG7/8Kueo6orbj5wtSeA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-29_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290052



On 10/29/2025 12:42 PM, Dikshita Agarwal wrote:
> 
> 
> On 10/28/2025 5:16 PM, Dmitry Baryshkov wrote:
>> The value of the PIPE property depends on the number of pipes available
>> on the platform and is frequently the only difference between several
>> fw_caps. In order to reduce duplciation, use num_vpp_pipe from the
>> iris_platform_data rather than hardcoding the value into the fw_cap.
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>> Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> ---
>>  drivers/media/platform/qcom/iris/iris_ctrls.c            | 16 +++++++++++++---
>>  drivers/media/platform/qcom/iris/iris_platform_gen2.c    |  4 +---
>>  drivers/media/platform/qcom/iris/iris_platform_qcs8300.h |  4 +---
>>  drivers/media/platform/qcom/iris/iris_platform_sm8250.c  |  4 +---
>>  4 files changed, 16 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
>> index 9da050aa1f7ce8152dfa46a706e2c27adfb5d6ce..c0b3a09ad3e3dfb0a47e3603a8089cf61390fda8 100644
>> --- a/drivers/media/platform/qcom/iris/iris_ctrls.c
>> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
>> @@ -313,13 +313,23 @@ void iris_session_init_caps(struct iris_core *core)
>>  			continue;
>>  
>>  		core->inst_fw_caps_dec[cap_id].cap_id = caps[i].cap_id;
>> -		core->inst_fw_caps_dec[cap_id].min = caps[i].min;
>> -		core->inst_fw_caps_dec[cap_id].max = caps[i].max;
>>  		core->inst_fw_caps_dec[cap_id].step_or_mask = caps[i].step_or_mask;
>> -		core->inst_fw_caps_dec[cap_id].value = caps[i].value;
>>  		core->inst_fw_caps_dec[cap_id].flags = caps[i].flags;
>>  		core->inst_fw_caps_dec[cap_id].hfi_id = caps[i].hfi_id;
>>  		core->inst_fw_caps_dec[cap_id].set = caps[i].set;
>> +
>> +		if (cap_id == PIPE) {
>> +			core->inst_fw_caps_dec[cap_id].value =
>> +				core->iris_platform_data->num_vpp_pipe;
>> +			core->inst_fw_caps_dec[cap_id].min =
>> +				core->iris_platform_data->num_vpp_pipe;
>> +			core->inst_fw_caps_dec[cap_id].max =
>> +				core->iris_platform_data->num_vpp_pipe;
>> +		} else {
>> +			core->inst_fw_caps_dec[cap_id].min = caps[i].min;
>> +			core->inst_fw_caps_dec[cap_id].max = caps[i].max;
>> +			core->inst_fw_caps_dec[cap_id].value = caps[i].value;
>> +		}
> 
> The same change would be needed for encoder as well.
> Pls fix this.
> 

Pls ignore, PIPE is not added as a CAP for encoder.

> Thanks,
> Dikshita
>>  	}
>>  
>>  	caps = core->iris_platform_data->inst_fw_caps_enc;
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
>> index b444e816355624bca8248cce9da7adcd7caf6c5b..fb3fa1665c523fbe01df590f14d8012da3a8dd09 100644
>> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
>> @@ -160,10 +160,8 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_dec[] = {
>>  	},
>>  	{
>>  		.cap_id = PIPE,
>> -		.min = PIPE_1,
>> -		.max = PIPE_4,
>> +		/* .max, .min and .value are set via platform data */
>>  		.step_or_mask = 1,
>> -		.value = PIPE_4,
>>  		.hfi_id = HFI_PROP_PIPE,
>>  		.set = iris_set_pipe,
>>  	},
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h b/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
>> index 87517361a1cf4b6fe53b8a1483188670df52c7e7..7ae50ab22f8c577675a10b767e1d5f3cfe16d439 100644
>> --- a/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
>> @@ -146,10 +146,8 @@ static const struct platform_inst_fw_cap inst_fw_cap_qcs8300_dec[] = {
>>  	},
>>  	{
>>  		.cap_id = PIPE,
>> -		.min = PIPE_1,
>> -		.max = PIPE_2,
>> +		/* .max, .min and .value are set via platform data */
>>  		.step_or_mask = 1,
>> -		.value = PIPE_2,
>>  		.hfi_id = HFI_PROP_PIPE,
>>  		.set = iris_set_pipe,
>>  	},
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
>> index 66a5bdd24d8a0e98b0554a019438bf4caa1dc43c..805179fba0c41bd7c9e3e5de365912de2b56c182 100644
>> --- a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
>> @@ -20,10 +20,8 @@
>>  static const struct platform_inst_fw_cap inst_fw_cap_sm8250_dec[] = {
>>  	{
>>  		.cap_id = PIPE,
>> -		.min = PIPE_1,
>> -		.max = PIPE_4,
>> +		/* .max, .min and .value are set via platform data */
>>  		.step_or_mask = 1,
>> -		.value = PIPE_4,
>>  		.hfi_id = HFI_PROPERTY_PARAM_WORK_ROUTE,
>>  		.set = iris_set_pipe,
>>  	},
>>

