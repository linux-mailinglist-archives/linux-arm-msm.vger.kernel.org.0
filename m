Return-Path: <linux-arm-msm+bounces-61060-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5E2AD6723
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 07:13:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4855D3AD6D7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 05:12:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 922543C1F;
	Thu, 12 Jun 2025 05:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aVCFa8JV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2FBD1DE3C0
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jun 2025 05:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749705200; cv=none; b=tIt9MQVjb3wUyaBeWzeC8uzfMMsRPbXEf4K2EVXFq6agciM84/eR30dPkQeGXQVUmKPErzl8UL4z1LoyzjG6f0FTnL1GlZSPGqL199c2j9QDTmYfmp6T+eCJ+0ufKFSHH+YCY1ivYqtAr/Wjs0+ri2aDKn5QOt1vMRm5SVXQeJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749705200; c=relaxed/simple;
	bh=1lC3cVEoQcxNvatUTeyjfk2aP6374UG+DUEkG65Q0kk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MvoyNY3UE7oEy/9ikFVc/21pnNxELBCcq6Am4sGxXc/1tJLq6j/50+hCyH2JvgqDGKuPoPJ2/RTPmgXw6b8r6OkxmjI0xoZLn0B6e6c5ci8A9Gg7Hxjz7+GnGBmhAaF3qtRFoWyXgAbtPcMKJX6rt1rLw8ZHJHfu/yEZxGEaFPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aVCFa8JV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55BJtCsb029603
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jun 2025 05:13:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1lC3cVEoQcxNvatUTeyjfk2aP6374UG+DUEkG65Q0kk=; b=aVCFa8JVo4vpIqjI
	+ptHGYONiPd8QWh/nrWC7WNEx7oWP86767iR0i5usJEb5FCgR77tpokOcjO5EZwc
	S528npqsHFrG9JyI+Gudgv8IaNwbyCGHlaWGU9yCVorfbCweWFJHJXcp9N/bAvLN
	AyiDaNi6fJNT3nESoed/5fic+oTaEpJfeYkt1gH/J1O/DL5uQbfTldgH7MiKqZvp
	go7GkPlBKwPfihZ98zcou0+xJnPqiif1HuEkkoPH/+raAl71mrIPRYF0Q2EklsNt
	pli0icYgvngoTnOiwIyQyRUP29YM/NCYo4h/aa0QtvM9aonyc4j4Useo1SCBLAmh
	91xEgA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474d127avc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jun 2025 05:13:17 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3138c50d2a0so825147a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 22:13:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749705196; x=1750309996;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1lC3cVEoQcxNvatUTeyjfk2aP6374UG+DUEkG65Q0kk=;
        b=EoTxaT9iOJm41LEpf4THlr4JAj5XHbCTGvjoWauozj9NTCtTa1ITh02pEVPJ1ePoyc
         jq0O/3j/19ADzpg9MwUzBGq6ZHRNRX0xXjUW+1FvbLc8s6qIYVuA0eKCdWGJmr7nqN5M
         cucglL0m6aNn/pFFUryNRk5jSIWn3t0kg4VrG873mfIbjL5EJ6+B20HXr2NOWgkkA9Po
         9Q970F1NiojDK2wguoyCuSQ1zH19yGjk3EhioyZOMtbW7xaIzuArDDFykyWAANGGocmL
         205Feuje/2IQ+WKD45hecQ3ppZHFly0AaGM3AMeV+d0x4VpYWKWG+SMo4GCOOD4zxbPk
         b1IQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfHMsCLrIB4YFnrXG6sv8H7JPKZrX5OrrytJBV46mldO3UFZJcMMHIXDaLkCVe/wIgE8AM3sC3C1CMASo8@vger.kernel.org
X-Gm-Message-State: AOJu0Yygssv0Cq5zDyYr3mX9dBLyOawtXjDcQCJB5N2qwQvIUR29CDoi
	hKllestiIdVf2g/I/QrOVfpvWroNYKz/j0EufSx6bJt6u0lzekkng3WcgrwzdxveGIaZ1Bd/d1p
	MNaaUHQTJqUjGJJzR5OkdL098FCIgqYSYH/k+MZFYNedODQEfjHC16Q1tcWjALSCgHjqW
X-Gm-Gg: ASbGncs/x/1NpY5ijmnnvyd6vt6Y2viV4EYroqU1P0OKs7Xzg7cgsF5a7ZWxBkT+UUx
	OOXfGvRvnWMX3mP3oIvEAgA6REjK0p2RSmqEMMNYlTHH8gPqyNkWbQc0uZNBFQc9uKYM3Z+MSFI
	k+vIGD9+oRIdR3iEhlv1cOu83B9vISGnZTqULJJOB47LePGJvtbemqURg8rH3Owes4f+hHhP7i9
	JLJ6HVIgGlB2TgLbbcWYIN3tnaj6RhKL+fn+up+rZ4Ws1SSGVtviRuX29ex78FYj9Xzo2XxKJq5
	QfMLwZjBzWtIaV7PSzy3SnPmblx734srMIVvlEMIo3pU0mZsZw==
X-Received: by 2002:a17:90b:2809:b0:311:fde5:e224 with SMTP id 98e67ed59e1d1-313af0fd089mr8091542a91.6.1749705195650;
        Wed, 11 Jun 2025 22:13:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1bK56y6k1szVtCGd+SXYPm0N0jNBv5QJB06pbBZ5EvZgyb11nn1NshdVMobYFtpZz060AhQ==
X-Received: by 2002:a17:90b:2809:b0:311:fde5:e224 with SMTP id 98e67ed59e1d1-313af0fd089mr8091513a91.6.1749705195117;
        Wed, 11 Jun 2025 22:13:15 -0700 (PDT)
Received: from [10.206.107.125] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c1c5fd94sm595529a91.36.2025.06.11.22.13.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 22:13:14 -0700 (PDT)
Message-ID: <bddf894f-1d79-40b4-9f80-355746c122da@oss.qualcomm.com>
Date: Thu, 12 Jun 2025 10:43:09 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/5] misc: fastrpc: Move all remote heap allocations to
 a new list
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: srinivas.kandagatla@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de, stable@kernel.org,
        Alexey Klimov <alexey.klimov@linaro.org>
References: <20250513042825.2147985-1-ekansh.gupta@oss.qualcomm.com>
 <20250513042825.2147985-3-ekansh.gupta@oss.qualcomm.com>
 <sgfcaujjpbvirwx7cwebgj46uwlcvgr4cgcnav5fmwmjsf4uku@iytanuqqiwxo>
 <71eb4b35-51a3-411c-838d-4af19631325a@oss.qualcomm.com>
 <tdae3jb7zbkbzvk546j5jnxnfkeux2bwrbz3i5gsehecj65n7v@2hseuptlk2a2>
 <999d2ca0-b3d3-4fa2-b131-092bef4951c8@oss.qualcomm.com>
 <CAO9ioeUW=v_CBUchJEt3PArbzBbUgznFO8TK-j=2yUkv8S1Baw@mail.gmail.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <CAO9ioeUW=v_CBUchJEt3PArbzBbUgznFO8TK-j=2yUkv8S1Baw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 2R7KEaAVrpdBI7YY6nOQ19aPM_-pEmGF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDAzNyBTYWx0ZWRfXzDmegXMXINbb
 r9qOUXjuxEZNlwvFftfGsSbBXkoFDwtS2+nZxZzdXbXxgsnWHpBx8loQdBZNOTA4g/PKzlCqvxc
 d+6dRAVyAc32F07MJds8OwulNmy5wECcEuhwvXrekYdtUL38GKVzbkRCqhhhY1QPbXB2omXMhkZ
 HNPx2AOnq67TxQdvgR2cFkwajWH7YdZw4Rfir4Pkvbb87Pnq3J7ggbZPL3GcYyCaH0A9pu+E13j
 WBb63xuN1+D+CaRV4JiZC7eE8xUozmVJd2XD93WNyXWwwa+euP91GKbGuA+BtoGOl45ugCANOsC
 AiUPHV7VpmRGCXjCY+gWK6h2OMwJhh+PWZutXq5Hq5F5gbD+Ij7S9QpvlxyGtKmcFL9iU49n09F
 mk+2dqJisAlcuzl7Op8Htf6aiBy5Jd1TT5AyBQqi5EHloT0nfbDIaTUPy1ZRM2wflyXqsPS9
X-Authority-Analysis: v=2.4 cv=GYkXnRXL c=1 sm=1 tr=0 ts=684a61ed cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8
 a=K0J_JDHuODgj2xVFbuMA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: 2R7KEaAVrpdBI7YY6nOQ19aPM_-pEmGF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_03,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=999 bulkscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 mlxscore=0
 adultscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506120037



On 5/22/2025 5:39 PM, Dmitry Baryshkov wrote:
> On Thu, 22 May 2025 at 07:54, Ekansh Gupta
> <ekansh.gupta@oss.qualcomm.com> wrote:
>>
>>
>> On 5/19/2025 6:59 PM, Dmitry Baryshkov wrote:
>>> On Mon, May 19, 2025 at 04:36:13PM +0530, Ekansh Gupta wrote:
>>>> On 5/19/2025 3:46 PM, Dmitry Baryshkov wrote:
>>>>> On Tue, May 13, 2025 at 09:58:22AM +0530, Ekansh Gupta wrote:
>>>>>> Remote heap allocations are not organized in a maintainable manner,
>>>>>> leading to potential issues with memory management. As the remote
>>>>> Which issues? I think I have been asking this question previously.
>>>>> Please expand the commit message here.
>>>> This is mostly related to the memory clean-up and the other patch where
>>>> unmap request was added, I'll try to pull more details about the issue
>>>> scenario.
>>> Thanks.
>>>
>>>>>> heap allocations are maintained in fl mmaps list, the allocations
>>>>>> will go away if the audio daemon process is killed but there are
>>>>> What is audio daemon process?
>>>> As audio PD on DSP is static, there is HLOS process(audio daemon) required to
>>>> attach to audio PD to fulfill it's memory and file operation requirements.
>>>>
>>>> This daemon can be thought of to be somewhat similar to rootPD(adsprpcd) or
>>>> sensorsPD(sscrpcd) daemons. Although, there is a slight difference in case of audio
>>>> daemon as it is required to take additional information and resources to audio PD
>>>> while attaching.
>>> I find it a little bit strange to see 'required' here, while we have
>>> working audio setup on all up platforms up to and including SM8750
>>> without any additional daemons. This is the primary reason for my
>>> question: what is it, why is it necessary, when is it necessary, etc.
>> This daemon is critical to facilitate dynamic loading and memory
>> requirement for audio PD(running on DSP for audio processing). Even
>> for audio testing on SM8750, I believe Alexey was enabling this daemon.
> Could you please point out the daemon sources?
>
> As far as I remember, we didn't need it on any of the platforms up to
> and including SM8650, that's why I'm asking.
This source was used for testing audio use case on SM8750:
https://github.com/quic/fastrpc/blob/development/src/adsprpcd.c

The use case tried by Alexey as per my knowledge is audio playback where dynamic
loading was needed but he can give more details on the use case.

He was observing failures and panic which got resolved after picking this patch series.
>
>> What is it?
>> - HLOS process to attached to audio PD to fulfill the requirements that
>> cannot be met by DSP alone(like file operations, memory etc.)
>>
>> Why is it necessary?
>> - There are limitation on DSP for which the PD requirements needs to be
>> taken to HLOS. For example, DSP does not have it's own file system, so
>> any file operation request it PD(say for dynamic loading) needs to be
>> taken to HLOS(using listener/reverse calls) and is fulfilled there.
>> Similarly memory requirement is another example.
>>
>> When is it necessary?
>> - When audio PD needs to perform any task that requires HLOS relying
>> operations like dynamic loading etc.
> This doesn't exactly answer the question. I can play and capture audio
> on most of the platforms that I tested without using extra daemon. So,
> when is it necessary?
For use case details, I'll let Alexey comment here.

The daemons major requirement is to facilitate any dynamic loading or memory
requirements from DSP audio PD. The daemons are already supported for
different types of static PDs to facilitate these requirements(fops and memory).

>


