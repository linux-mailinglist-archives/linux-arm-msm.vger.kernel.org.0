Return-Path: <linux-arm-msm+bounces-79816-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B0568C239B4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 08:49:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CF86C1A237D6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 07:49:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 651B127B32D;
	Fri, 31 Oct 2025 07:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hEZ7Ub+K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SgS5fi5v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C25D92868B0
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 07:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761896942; cv=none; b=mdbhHfL7/TM1mMUYGkr0JqxRnYXhN9NqX9nYjuf/gkBdZTphAgTn65iDrmiflpJsGGRIBlyI1CXkNxDNanT1K0e8ruS0HIYnWTJFHAJKbrHTwwoIoWtB+K+IT8MZjpY3QDp2N63mk58LeptKx15jPPfeLuqZk6OX5UrY9Zs0+D4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761896942; c=relaxed/simple;
	bh=WLK53698RWkUe7j/W5XhFQUqclIVw+fDPkYKh+/+kQs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XePwXQUb/Mh2a6v04pLw9wQW8oLITyPsnJmfDw0iWEUbKPT3SIx9MqXSgPmm4rEfir2lfG8mgC0DBdHS7bsrE6TqaJfDx6rpxlidv+KJ3W0RDkZtMc7I5/hH3Jb+VpZkr8gv6yQeaRvj1jBdS8xE4cfvGKjZSQYiDGc6zSjHqnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hEZ7Ub+K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SgS5fi5v; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59V4LnH61827332
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 07:48:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bkxZLmVqscAeCOrO5e8bzA9KVYKvBCS70DXfZ9a5INM=; b=hEZ7Ub+KiNJNjnqi
	KTqHrGvNz7Fw98MUy+xnTk8YC5LwhSLpdutV17TWMXz7E+hMZAcjPgz/g0BDPLXA
	lph6yOYk10HXTurJYepn3eK7YA6M+xoo7ETWw+mVuw9D1zmgb40mGRH6mLwQSBHc
	sOULQr5tTgXAuIhDYY6bjxgBXKO0MBgO4FD+oIAjzcH3aQOzst0lft3JNxAHg9jl
	KY/dfQa+krpqOXWrHUPtk4b2mwiT1lDbCAZG85e5zO+IGLfk5aP+l7VLTEcVz6YR
	gy7aWbRVAoriU7GE4wdGXUqEtyKZTVFCOx2OCTxAhJO88Jj6aujm7UPEcmxSe/UX
	Ahvllg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4p11rf3k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 07:48:59 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2951a6cf0d2so6364295ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 00:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761896938; x=1762501738; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bkxZLmVqscAeCOrO5e8bzA9KVYKvBCS70DXfZ9a5INM=;
        b=SgS5fi5vQwI90dPnFc3xobnj4DIUUqdRDMBnlkcid70sBiXWicMd/5EegayzbAmflb
         9mMJaaWnCnPYBknvLXErW61esFSk3SXa/oYdwcoTuCHXOoSoYt21XZfrbliNgtL2x4Tx
         aT3lSBxeDySN4ToQWtiozlTDs9Bdruo8Reual9lZsqI07lV9h+7QLtFJ2d3hVdGZdruP
         er/Adc3aUDUscGgyq+BavENFdabn/npDv3j6/Rg5eF1Qg7eDDgVCFSpCsk8ceRRv7dkH
         Ugh+ZaCPY4vzHJq5e5HW5WbYaj00I/a6vx/j0qAfuiVWDJzIiZiy3yfIHuOdVirUrAab
         FC3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761896938; x=1762501738;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bkxZLmVqscAeCOrO5e8bzA9KVYKvBCS70DXfZ9a5INM=;
        b=KIOIyIY3QJjedkJUCUanJeOWZo/qLnGtLTX8D3mhwe0oh2/zoj3suzQMzkV3EBvjzY
         XOoCvz0BF+9nMGrA8YuUi4ulxkRkExVgQnEP1ElbJ4pjeZjFVHg9roZ41aQQ56ocxAKC
         aeF49Y9ePk+IAbyhiMh+v+GzIvEReUTlMEXaoTwP5yH1iqhMrgTOaEtmM5uf9TzVdQyy
         ZnntL9e9YdbOyJfx9RXkmMlKcMmTADSaRlR46asfhe73wJ/Rd4qPqtpUWTznVSs/7af3
         CfeW88vtZFWgj3cJMiXV6Pz8XQHdjeb02lzradgnmY1rhRORGArY2IFCnPL6bZU62+iB
         +AaA==
X-Forwarded-Encrypted: i=1; AJvYcCXuHk6+B+HmaTQfOF5hOEtAVlVIErVSbIkZo+PsoIRgyXP/kOnH4HdvkQU/Vle9eoOqLjQCuCZrGDzJ8OMV@vger.kernel.org
X-Gm-Message-State: AOJu0Yxb2jHabTHn85APdpTt9CkN194CywYhTjivO9TnyMbcMZjt2nVn
	5fy2SNy45bYDckLQKKWtFDR0RUkk2pT2HehDVhyIszb77jUac/dDjAaJTdGBK32oP958Tv0ILS8
	X5pI3VlD6yfAvJ1Ql609FEbEZcMJhZhNY5ZHZpVVz/rJe4IICAo+OxR7XVmKrT2kDDF3u
X-Gm-Gg: ASbGncuq1Rx8DGKwlKqIVxS67zq1I/kN2B8Bj0D1NgBX5AmLAHGfcujTtj6XCYYubG4
	T/91tyd4iaiJyT+C7eoWMnykgr2LTT9il5b9Ot/UP6HZBrlTOCnZWtz7VpFIc+4eI3s3N19fR8+
	R6BaT/sVIgAKZkQbXkR8P+XtCzbBNDVkxYU5qsSZFIhGfJdJwwZQkIPXBxt/oT/WZSCDn7RLmq9
	Wvpxs9SeKJf+yIjXfueAQivmWyasj9Im5mk4c9YM6T0hYhWGyIBzOr+oszeAX/BKSfcniQ8e0gp
	x6IWYXExB0JABSdT0NPazouZzU/VS1DZCSUM4SEwYYsETcKSwtxgppHm0T1egiPYtvSTQmzDzfR
	GbL32SXfF2Xf4eEmtfT9E0H/b+NZa3XpIzA==
X-Received: by 2002:a17:902:e5cf:b0:293:b97:c30b with SMTP id d9443c01a7336-2951a3a6519mr34263145ad.9.1761896938487;
        Fri, 31 Oct 2025 00:48:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWUdY+fpB177Qc3WIW6c5K/s8cZs2yiw2nxJ7R+yZ5EloOzojzhdxV2zptF/DJFbH/nAVyvA==
X-Received: by 2002:a17:902:e5cf:b0:293:b97:c30b with SMTP id d9443c01a7336-2951a3a6519mr34262775ad.9.1761896937935;
        Fri, 31 Oct 2025 00:48:57 -0700 (PDT)
Received: from [192.168.1.3] ([122.178.56.191])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-295268716d9sm13356245ad.16.2025.10.31.00.48.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Oct 2025 00:48:57 -0700 (PDT)
Message-ID: <4876cb9e-4b93-418e-963f-982fc7ba4a18@oss.qualcomm.com>
Date: Fri, 31 Oct 2025 13:18:51 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/3] arm64: dts: qcom: sm8750: Add USB support for
 SM8750 QRD platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
References: <20251024151521.2365845-1-krishna.kurapati@oss.qualcomm.com>
 <20251024151521.2365845-4-krishna.kurapati@oss.qualcomm.com>
 <a117b105-a734-4f67-9bb2-c06728e79083@kernel.org>
 <6297468b-77d0-4202-8ec1-3e731acc43de@oss.qualcomm.com>
 <6234e22a-c119-419c-83b7-2a53467951da@kernel.org>
 <a8046f0d-ee74-457a-aafa-6473c67c6ab8@oss.qualcomm.com>
 <bgnu7pvxxmcucip4ytfxii3f73vhc4zw3yxobpc6d4s5enc7lj@nrpmu3f3tgxh>
Content-Language: en-US
From: Krishna Kurapati PSSNV <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <bgnu7pvxxmcucip4ytfxii3f73vhc4zw3yxobpc6d4s5enc7lj@nrpmu3f3tgxh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: XZQ_qDODr3aP9CzZOSTgTh_2LZMSZDBs
X-Authority-Analysis: v=2.4 cv=RbCdyltv c=1 sm=1 tr=0 ts=690469eb cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nBTQbq2h+7tEuhtSPO5ERQ==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=v7ZzXi2vkUtTpdPo9KEA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: XZQ_qDODr3aP9CzZOSTgTh_2LZMSZDBs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDA3MCBTYWx0ZWRfX6HN3IWrsOOT6
 9ttDhC/wBB4bU43uy+DFLtwXy8+d2eSrL7YlQgX85JYq5m8sMzziw+ajjCcDYEn8HkfCzdMM2Nv
 WDC9NlyXUXi6k67j+1+5CqKPbM3KTTBuFWrxtkKFpURV+3CvLt4FCofdRzEw53XXPkpy5GpOsv4
 /RHeDruIPzp6j20KBsghFgtqjAX0tS82nSQrJNPZ0Nruxrce82YTEWcwo1RNvHFIvJxiqMRRVIp
 lVPKmnA2hlevBu+5tCEPJipKs4u07sLhVJykl3C1vjUpIchyWDZJqE/Oux6QQeoADd3q9o8SuJA
 /cSogPIfGlzZmB/7JykFbHLxWC6Qst67NSUUveo/Lun1JgvB+jKNWyuAAf1GRiXZb3leoW5nYfc
 0cubPm/QgwCC3VQSyZWE9fwNMi6BGQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_01,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510310070



On 10/29/2025 6:36 PM, Dmitry Baryshkov wrote:
> On Wed, Oct 29, 2025 at 06:00:02PM +0530, Krishna Kurapati PSSNV wrote:
>>
>>
>> On 10/29/2025 5:35 PM, Krzysztof Kozlowski wrote:
>>> On 29/10/2025 12:42, Krishna Kurapati PSSNV wrote:
>>>>
>>>>
>>>> On 10/29/2025 1:37 PM, Krzysztof Kozlowski wrote:
>>>>> On 24/10/2025 17:15, Krishna Kurapati wrote:
>>>>>> From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
>>>>>>
>>>>>> Enable USB support on SM8750 QRD variant.  The current definition
>>>>>> will start the USB controller in peripheral mode by default until
>>>>>> dependencies are added, such as USB role detection.
>>>>>>
>>>>>> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
>>>>>> [Krishna: Flattened usb node QRD DTS]
>>>>>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>>>>>
>>>>> NAK.
>>>>>
>>>>> You ignored every previous tag - multiple reviews and tests, and then...
>>>>>
>>>>>> ---
>>>>>>     arch/arm64/boot/dts/qcom/sm8750-qrd.dts | 22 ++++++++++++++++++++++
>>>>>>     1 file changed, 22 insertions(+)
>>>>>>
>>>>>> diff --git a/arch/arm64/boot/dts/qcom/sm8750-qrd.dts b/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
>>>>>> index 13c7b9664c89..fc5d12bb41a5 100644
>>>>>> --- a/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
>>>>>> +++ b/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
>>>>>> @@ -1054,3 +1054,25 @@ &ufs_mem_hc {
>>>>>>     	status = "okay";
>>>>>>     };
>>>>>> +
>>>>>> +&usb_1 {
>>>>>> +	dr_mode = "peripheral";
>>>>>
>>>>> You sent something different with issues.
>>>>>
>>>>> Really, this was a correct patch. Was reviewed. Why you decided to drop
>>>>> all this, drop everything which was correct?
>>>>>
>>>>> Your explanation:
>>>>> "- Removed obtained RB tags since the code has changed significantly."
>>>>> is just wrong. Almost NOTHING changed, except completely unimportant two
>>>>> node merging.
>>>>>
>>>>> NAK
>>>>>
>>>>
>>>>
>>>> Apologies Krzysztof,
>>>>
>>>> On first patch that adds changes to base DTSI, there were changes moving
>>>> to newer bindings and merging child node and parent node. I should've
>>>> removed RB tags received on that patch only. But I was over cautious and
>>>> misinterpreted the rules and removed them on the other patches as well.
>>>> Will be careful the next time.
>>>>
>>>> Also is there any issue with marking dr_mode as peripheral here in usb_1
>>>> node ?
>>>
>>> No, I think I looked at your other patch. Tthis was reviewed at v4 and
>>> v5, which then it was changed breaking sorting order. This one looks
>>> correct.
>>>
>>
>> Ok.
>>
>> I will send v10 tomorrow. Can I add yours and Dmitry's RB tag on the MTP and
>> QRD patches and then send it ? I will implement feedback from Dmitry on SOC
>> dtsi patch in v10.
> 
> Could you please answer the questions that I asked for this series?
> 

Replied to the questions and will update in v10, mentioned dependencies.
Also will add qmp pipe clock in gcc properties.

> Also, why is there no link to v8 in your cover letter?
> 

My bad. Missed adding it.

Will fix it up in next version.

Regards,
Krishna,


