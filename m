Return-Path: <linux-arm-msm+bounces-85503-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 21089CC79E9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 13:31:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 915C4301B399
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 12:31:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F84E33B963;
	Wed, 17 Dec 2025 12:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H1A/aMKO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RSVgiqoR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88809218AA0
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 12:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765974689; cv=none; b=ItbMzGELwHPofSOoOystPnBqG9MsT1dItmz0Vpic+uvc0H/FmZOsO7AkL6912twKpwV6sTCAmreGwEEz5yMcTxelrMtOu+YgnZ2PMUt67LXS2rfFDV46LqstGR2KB9bLJYVGXbVqvUYQMHb3FdNzLMIiD5bnE4LRuvuAWBWtr7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765974689; c=relaxed/simple;
	bh=Og1vTzxo1VEPryszPDx7NB7ozDjtL+rd6kkeIknOlzA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vor/XDtqeZLNDjtA/RAJpNiwGb+7lV5Pwnr4U9rZIOnVoX/2H5vD7RlxJK2Br2A8QNSQQXntpSwI9tbXa7FqzQTY2w/WS245Ea2B+h61piyeX8anlWNoKDKVK3O4S8/xvWCETNXJBCXCMz6/G3zls9Aq6MJJNBqgZWrlKsHk9XE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H1A/aMKO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RSVgiqoR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHCKwsB2684181
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 12:31:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nxVppHwCu+8rzGZFO+lxpcmtmdfr8y4QCMH3zpU7R4s=; b=H1A/aMKOhk/+gM5V
	mdApKa3vGivdomtYsqENHApdIbqjY7Tuy/zC6Vl9TqwQNDkpmrdRW/HgVnaMNqRJ
	5vB5KXP2X3D/HtzMTavuPd9BWDda9qAfH4VbJzv3zqKomr0XwOqReMQK43TSJvdp
	gMtHjyv/LmFlN8ua1ASvfTXDgsACSV04uCauTgSV+nPLkXPnBmABMkVh97mzCaL+
	bCHi65VwY2PYWBzUsa0oGwR5KYP5SFW9fREAZqEkddqspy9f7hu+9npIV+stBNed
	AuiQUadRg1SfGv+6E1jlFobUacL4uUOkOBumYa7GkuYR91e6L1AtkK4SUywddCzO
	f7HgFg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3kkessmt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 12:31:27 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-888881a1cf7so10293526d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 04:31:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765974687; x=1766579487; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nxVppHwCu+8rzGZFO+lxpcmtmdfr8y4QCMH3zpU7R4s=;
        b=RSVgiqoRa3Mz7ZBHjBVzeG2Zsnzjg6R+VCNx0qpwNcCX3FlNySarUl9xicFlwjUhZt
         XVkSybDqxmv9Z9L1NGlVMoNjsIM4Z6oxD0U4ZjkFOFc2N+/aQcJVdyf/mVNY3uNx/ENw
         cp2xDqSf6MuWiRBGwfXtp19SxhmllbZ7eIDO2V1C7xnURqdaJ6IndLO5i/XzKB+V5CkM
         yqL5qwRn4L1kBnW7nIYxac7py2jMBsc2YSbZSFldlh00ZrkUHAp/Lg38O9Hb/AF3vxGq
         a0tHaCj7NU1hExXyi3Ljh4sy7g1JLpdLkfFo5wE1hHiptVbLN0ntbFL+2OPRlpXX7pJF
         9/jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765974687; x=1766579487;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nxVppHwCu+8rzGZFO+lxpcmtmdfr8y4QCMH3zpU7R4s=;
        b=uEiLmwrL1uJJOkaTxuMsQ/49K49+gRYlJdATPus0uLDCEtwK26L9GUL52NuGtxklC4
         yGJ8op23QICefTqdaBbJsh9gykWDwgC5R4oc8A/nw3uhVpM4GPhWfH8gHEVwDXEkqTWs
         xHs/t3tu0cN+89bxkOxUjqhE6QeiZOOzVc8UcFfdeDfxLuVB2T8gvwXF1cDKTUaHp2EJ
         WAaVELk/07vjy2eiZtP6WybmqKthciPOaAPw92sbED+8TXAwIW2vtxeN5/2sM8tJpqbl
         07DYBuzKsGLWrlP4JYgNZTI0VCYk2B+LGHQW/QAf/k+pJp/ztbRhFwHlgpZsMVSDPqHM
         mvjg==
X-Forwarded-Encrypted: i=1; AJvYcCUvoDW4KZqommJ0gxujc15S/QcqUF49jZaFHg9fYYjodE90KT6jaLkSo/vImoI0eHXO+Fr/pTAglZHICKxC@vger.kernel.org
X-Gm-Message-State: AOJu0YzCWZMMvGlEn7bUm7EkAlhvmJGeiin4g73PD3tGX4Uy2MtGKOiu
	1ZzoEq4dQKxXL3/EiswfCzAuBTKNwkZWILOkzC6IMr0cRlwrOvUqyfhI6a5f2E9nanCQgfPxZ++
	jHpCvj+pv68JhZ2MayufWDdCPvO8FNudhBTYTpu+kq21JzgOe34k00C5XH2oBA5Jg01jB
X-Gm-Gg: AY/fxX5idihqeP9t2plQHfhNZn9RH/mZMVjDEg8hSJl7BiJ/REIfgiXeIihl7XEJba0
	K0rT+8GgGSi57EAyMbBrYZXbkc1GQCMbHAJmdCE0mU3vxD17vgcrMv717XgJNDdaEauayKCo7MQ
	xbMFTwSj1ZsQFaeV0/nOctBsCu3nFgdyapPufapD4U2A2R0IsTtRQ0UJ/vc9ROj9uJHadC8z7Y6
	/O27dL7JEXxXerdY8biv8SPpVqhBxeP7ISP240jh166I74AJuf0cP82aRqNzurhUm94TGD3lXpz
	io2L4YmUVTKFoJoFOLIrZfQrpQqxx1i6ddJNHcfx9YyO/Z/BP+Uh4boB20oMI82M1qI8uRVh5uI
	fvpzjjJIAMZVeUpZ0qZ7pcgCPRUul8pB30YWvRWNpnGBzO6vFjERhcVK5ijj3tzW0IA==
X-Received: by 2002:ac8:584a:0:b0:4d0:3985:e425 with SMTP id d75a77b69052e-4f1d05c4201mr187452711cf.7.1765974686652;
        Wed, 17 Dec 2025 04:31:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHnU9DbqrhK2XEvuuPlNpfpmPEgKFxchCz9pi8QCpDey3PqjG8IsmXy18lP1a+VjNcjkHkDyw==
X-Received: by 2002:ac8:584a:0:b0:4d0:3985:e425 with SMTP id d75a77b69052e-4f1d05c4201mr187452261cf.7.1765974686190;
        Wed, 17 Dec 2025 04:31:26 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b80013c7ea0sm321246666b.65.2025.12.17.04.31.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Dec 2025 04:31:25 -0800 (PST)
Message-ID: <7e1b7b46-f4d6-4028-8518-80e954dbb7cf@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 13:31:22 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] arm64: dts: qcom: sm6150: Add gpu and rgmu nodes
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Zhang <quic_jiezh@quicinc.com>
References: <20251122-qcs615-spin-2-v3-0-9f4d4c87f51d@oss.qualcomm.com>
 <20251122-qcs615-spin-2-v3-5-9f4d4c87f51d@oss.qualcomm.com>
 <8560ad26-4756-4c2a-97c3-2c5c0695172c@oss.qualcomm.com>
 <z4gqro2bx6oq2ht75m2klogo5dsirb74tmc3u3shjyalxmaxil@5sy7ufmqhdgw>
 <6fa1da5d-9ea7-4d72-a03a-82edc4bef099@oss.qualcomm.com>
 <9141e67d-2837-4e73-bd3a-9a9c5b8f72f9@oss.qualcomm.com>
 <d087dfbc-fcd9-4f01-8cc4-b206c2e87f28@oss.qualcomm.com>
 <6dc39f3e-0a2f-42ca-a088-4b62a8153001@oss.qualcomm.com>
 <ed4b1e3c-bb30-42fd-a171-12121db2dbec@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ed4b1e3c-bb30-42fd-a171-12121db2dbec@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDA5NyBTYWx0ZWRfXyFEkbvmBlfsv
 klpvqCh15PzCN1Q7f0V1d4zpA7XFeuqZVGk2yBwEAzkHMEcMyBbuqb37SDrzSEGjWosye+gNCdx
 RW7+Nea7OUfUh/Gn/k5FNct2u+EJQnBhh0JFvSN8h4HO5sdwTZHWAQgWzwAGTkVjNX7QdIfIJr8
 11Ttx0t9JQLjAI47Mjulv5SFZp2lQoGqqsg62NT9pAhOGW+B8hWZZD6r32YwHosEt1qZ/Tj6G6/
 23OQGkPNdZG55266/P1z/ErGk4BnOsz+m1GfxotBjhxiH6mFirc6rf/B6vdpTvCJ6KLJWZO0tK4
 a7xC2qwYFPkZtbmJLK8BGOcO0EsvGPtOa799fTY6nydbK37MMFlGC37x7PBEpVIJ4JDC5qeYnhQ
 wL8240fDxxxlCF6IWPwRgI5pBAKfAA==
X-Proofpoint-GUID: VE0JeghCFqjYCo9zfj55VN9_deo0c_Wj
X-Authority-Analysis: v=2.4 cv=Fcw6BZ+6 c=1 sm=1 tr=0 ts=6942a29f cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=trE_h3K6eqWXygPE4hIA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: VE0JeghCFqjYCo9zfj55VN9_deo0c_Wj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170097

On 12/5/25 3:05 PM, Akhil P Oommen wrote:
> On 12/5/2025 7:22 PM, Konrad Dybcio wrote:
>> On 12/5/25 2:41 PM, Akhil P Oommen wrote:
>>> On 12/4/2025 7:01 PM, Konrad Dybcio wrote:
>>>> On 12/4/25 11:13 AM, Akhil P Oommen wrote:
>>>>> On 11/26/2025 6:12 AM, Dmitry Baryshkov wrote:
>>>>>> On Sat, Nov 22, 2025 at 03:03:10PM +0100, Konrad Dybcio wrote:
>>>>>>> On 11/21/25 10:52 PM, Akhil P Oommen wrote:
>>>>>>>> From: Jie Zhang <quic_jiezh@quicinc.com>
>>>>>>>>
>>>>>>>> Add gpu and rgmu nodes for qcs615 chipset.
>>>>>>>>
>>>>>>>> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
>>>>>>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>>>>>>> ---
>>>>>>>
>>>>>>> [...]
>>>>>>>
>>>>>>>> +			gpu_opp_table: opp-table {
>>>>>>>> +				compatible = "operating-points-v2";
>>>>>>>> +
>>>>>>>> +				opp-845000000 {
>>>>>>>> +					opp-hz = /bits/ 64 <845000000>;
>>>>>>>> +					required-opps = <&rpmhpd_opp_turbo>;
>>>>>>>> +					opp-peak-kBps = <7050000>;
>>>>>>>> +				};
>>>>>>>
>>>>>>> I see another speed of 895 @ turbo_l1, perhaps that's for speedbins
>>>>>>> or mobile parts specifically?
>>>>>>
>>>>>> msm-4.14 defines 7 speedbins for SM6150. Akhil, I don't see any of them
>>>>>> here.
>>>>>
>>>>> The IoT/Auto variants have a different frequency plan compared to the
>>>>> mobile variant. I reviewed the downstream code and this aligns with that
>>>>> except the 290Mhz corner. We can remove that one.
>>>>>
>>>>> Here we are describing the IoT variant of Talos. So we can ignore the
>>>>> speedbins from the mobile variant until that is supported.
>>>>
>>>> Writing this reply took probably only slightly less time than fixing
>>>> the issue.. I really see no point in kicking the can down the road
>>>
>>> We don't know the speedbin fuse register and the values applicable for
>>> this IoT chipset. Currently, there is only a single variant and no SKUs
>>> for this chipset. We can add them when those decisions are taken by the
>>> relevant folks from Product team.
>>
>> If there's only a single variant right now, could you simply read back
>> the value and report it where necessary to make sure the internal teams
>> are aware?
>>
>> There's surely *some* value fused into the cell..
> 
> We don't know which register to read at the moment. It could be the hard
> fuse register or some soft fuse register at an arbitrary location.
> 
> It is better to leave it as it is for now. Who knows, maybe there won't
> any SKUs at all.

Please don't take it the wrong way, but who else would know that? :/

Konrad

