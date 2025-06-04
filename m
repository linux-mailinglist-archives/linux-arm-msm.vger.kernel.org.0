Return-Path: <linux-arm-msm+bounces-60237-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D516ACDEF8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 15:24:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 323D93A6DD3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 13:24:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C43E28FA9F;
	Wed,  4 Jun 2025 13:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E46Kh+a0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 118F9175A5
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Jun 2025 13:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749043472; cv=none; b=eybDRY0wyJqRPQCD0Dqws0All9d+B6ZlmQF5piYqv2Q3pWvjGYi8mEWVONuZ2tSEtUrW8Wjt1f2ODU2UxHGkOujIwWPxyn6Fzbie+LmY1GdUrhMHho+tQAtnF6EWm9yWyq8JoLQZAZjPLnA+ywAzD/uOuAdpuOJjFKLW+EPznmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749043472; c=relaxed/simple;
	bh=iKG8NBG/TNLTXbVo9TYujPcytItCDWMbZmRywdSOHNs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fVLY92hUj5c03ucVJapLYQ3y40LvFpQVgKvvoCaycrXP4YEc0wRZc0nNv1lI5y6DHMCzorCAgWPAhVcEAbimL8wD/8Vu4tmT3SGZkY9OWfWLNy1pD46LKOJlAOIcXZ5m42n41bpzMt/gcbu3u7cHXJdj4nnlz4ajPHLHTO7c9TA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E46Kh+a0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5548kAnP013495
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Jun 2025 13:24:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5tDhYT9ynoVsxUKkv2VPgtETqP2fOpfi938Os934qGQ=; b=E46Kh+a0iBI+mq5x
	F9GIx+ku+J5hK5LZhXVE/j0vWkDSaFM8G0VUdsbo57L3+o8ZLmWK3mQY71qm3IZM
	GjAgC+XizzFsQdqrlCcvvM+VoAlGE3cIPdLk0yi2wlX5mMORGQ9CjOpozZ62LOPU
	I6mIRpIemXqyH9JSpYn7xsg6MESeitvAlP5guTwq/NkEYDOnyObT9H0cY7cUX84V
	4ko1gkks84Eu+SFnINepU4kEC1pdxzc3VINaXVixIMcE8ZJdPAC6tQmavMy7iG0R
	yu0/8Q/95mcoYDMN10GiNmz020Vx5SZeFdH99NhC2M+XFdwNEWfNPVGfAM6A6TUG
	vPgc3w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8np4u6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Jun 2025 13:24:29 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d0979c176eso162836685a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Jun 2025 06:24:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749043468; x=1749648268;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5tDhYT9ynoVsxUKkv2VPgtETqP2fOpfi938Os934qGQ=;
        b=SzgAgeg2fWY0UJmJWgwFc4ntFm8G8+OGFC+Zc4re6ols5i+hwXvtONEUT+vQUlC+K2
         oSKN7R018QtGz87QIXEN13cAldPwTbBVsJme7sTMj4A3XfqVxbwF6HARZhllRSj1GvH7
         tTpTt8tzO/9yrGZQZdD1VWE7sJPIqcAlERDSruXSXe3fhirPMCEvV7JtmvplUc5U7jpd
         4mDhMm/hNZG5s9FHUhz3kcM+ehq5UjftMJtrlxWMbzub95An/MQifpe3PfNjjDgBovX0
         0UXncH4Fd980pwlx25aDFREqOjfykxlxaupcHU0zVaTk+npAbMTEKHO3xmp9c0px6Loh
         rbMg==
X-Forwarded-Encrypted: i=1; AJvYcCV26gAbqsq7HFHYot5X+ukqfahkJs4CSvxON8pw9P9zhq/PTLfYxZU5jBKQ7hay5VfgnUSKwXTLNdaO1ZHS@vger.kernel.org
X-Gm-Message-State: AOJu0YzDQkflwNGGIpWRHdN8FF3vYdFi3w3rN4AOyoYb+v+SqYRSkbac
	L0HaXcOBQtAlN0xKhvR1mlel7vzH+C/fX4nhUfwttM5zB2OnLcsKWubCRIRrmSjHlhPRI5EBzsR
	Zt9WbFQdRlHubdrESUSZvatLY8rE8hFEEusOsBl1uSCnJZCDnDJQq4b4+fgN45BbYLvyA
X-Gm-Gg: ASbGncvfIG5LsgPrPPwOo328r76EQUwEMibAV+4ASLM1Ry2lVjAau7/+XKcBJgsGqz8
	ChngFgT2QPBasp6hvkmXIl0MtPf2CazPGbEDfe6r936WH/ADhfHTnOOp/2GbPPNn2WGVaLL3bFf
	B58FZe3JAInTGko7AGY1f0GK2+XGQb1hlsCY4OAvdYSGnhke8uqIPoBwuCRdpdOfmfzM4xVvqSl
	1wjAAs2fR3StHtlso9z4FyhxNpFNyRsvemn274NzT46uitnJMJL4FbLujM2d3N/y/06Cnv9K9/E
	yQMOp17iCK8bqTLYW9cvOaCSOd7gq+aCmwUtHU1OY9GSo7YuO79a7HUOTL1XYVVM3A==
X-Received: by 2002:a05:620a:284f:b0:7c0:c024:d5 with SMTP id af79cd13be357-7d2198a4bcamr182102685a.8.1749043468656;
        Wed, 04 Jun 2025 06:24:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHp4FAWQb08lT7tzFsZcGvaXN1AR/3mpBEQNehhZ0tFk6Uq8YusaA5kooOfzLi9N2bN1wu3MA==
X-Received: by 2002:a05:620a:284f:b0:7c0:c024:d5 with SMTP id af79cd13be357-7d2198a4bcamr182101485a.8.1749043468299;
        Wed, 04 Jun 2025 06:24:28 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adb390f09c8sm845637866b.45.2025.06.04.06.24.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 06:24:27 -0700 (PDT)
Message-ID: <77ea49c3-f042-4ba9-a0da-1d0e4e4088d3@oss.qualcomm.com>
Date: Wed, 4 Jun 2025 15:24:25 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/3] arm64: dts: qcom: qcs615: add venus node to
 devicetree
To: Renjiang Han <quic_renjiang@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20250527-add-venus-for-qcs615-v7-0-cca26e2768e3@quicinc.com>
 <20250527-add-venus-for-qcs615-v7-2-cca26e2768e3@quicinc.com>
 <429b4c99-b312-4015-8678-0371eac86de4@oss.qualcomm.com>
 <6a9e7daf-c0df-42db-b02d-96d9893afcde@quicinc.com>
 <idc4476ibh4geraklzpas5536jnwvbp6xhjjaajcdcwxicorrf@myh7kyz77rxy>
 <43e1f8db-5ab1-44ce-97c8-50910704788f@quicinc.com>
 <d6udpwmocodvlsm5ljqz7zbyonj2yahtlzmm2jjjveqrm2hmkz@andh5j4jgixr>
 <9faff664-9717-4259-8b23-bc44e64f6947@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <9faff664-9717-4259-8b23-bc44e64f6947@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: KGGwgFSk1_8j0psIj0ynzPkz4BtK0atn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDEwMiBTYWx0ZWRfXzQ6xKvsJXesU
 Kgu742isyo0nfZKy7B7eaOOFXdAE98ywFTzvtuXVif97dz47YA+ID78Vl7k5nBBLslGzn6E6PcH
 kWIgVFlSoRrkY5iihD1HQ0AFwLave4Wq7Xtlil40SoCl2P0GZ6dYw6uOI6G/e2FlPA2G4lgTSTZ
 nXkyboTlFxmyLPgwQk/8tsDe/Brs1zBA7zWFHlZ4BAnupNp9J11oLoNj2C/V0Vc2rIcG8OoMfTf
 4UAVIfGEaDuvY4Uai0mbf6t13OfCdI1at3VlQnP9sP+LDfYhNBCRLl1eild8PjX2G74ysetC/Oz
 +Gd++Itg5Tw3xwIWtDYOkyjVJ9m6fIfGQgILi+8g7IAilp6AoLdBiFVWasKCvHExptRDn6e3jNh
 Z491buLXLQpiH76/JE9izxje6XtUI3m/Hta9BMfozDvwFyYLaL1Qv6svOf6q0q9m//W6KhIv
X-Proofpoint-ORIG-GUID: KGGwgFSk1_8j0psIj0ynzPkz4BtK0atn
X-Authority-Analysis: v=2.4 cv=UphjN/wB c=1 sm=1 tr=0 ts=6840490e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=ONiuQb8ssYXyuzXnhScA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_03,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=999 clxscore=1015 malwarescore=0 adultscore=0
 bulkscore=0 mlxscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506040102

On 6/4/25 2:05 PM, Renjiang Han wrote:
> 
> On 6/3/2025 9:21 PM, Dmitry Baryshkov wrote:
>> On Thu, May 29, 2025 at 10:29:46AM +0800, Renjiang Han wrote:
>>> On 5/28/2025 7:04 PM, Dmitry Baryshkov wrote:
>>>> On Wed, May 28, 2025 at 05:13:06PM +0800, Renjiang Han wrote:
>>>>> On 5/27/2025 9:57 PM, Konrad Dybcio wrote:
>>>>>> On 5/27/25 5:32 AM, Renjiang Han wrote:
>>>>>>> Add the venus node to the devicetree for the qcs615 platform to enable
>>>>>>> video functionality. The qcs615 platform currently lacks video
>>>>>>> functionality due to the absence of the venus node. Fallback to sc7180 due
>>>>>>> to the same video core.
>>>>>>>
>>>>>>> Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
>>>>>>> ---
>>>>>> [...]
>>>>>>
>>>>>>> +            interconnect-names = "video-mem",
>>>>>>> +                         "cpu-cfg";
>>>>>>> +
>>>>>>> +            iommus = <&apps_smmu 0xe40 0x20>;
>>>>>> fwiw docs mention 0xe60 0x20 (which result in the exact same resulting sid)
>>>>> OK. Will update it with next version.
>>>> How would you update this?
>>> Thanks for your comments. I'll update it like this.
>>> iommus = <&apps_smmu 0xe60 0x20>;
>>>
>>> This 0xe40 SID was based on a previous project. However, after rechecking
>>> the documentation yesterday and confirming with colleagues, the correct
>>> SID value should be 0xe60. I’ve also validated it on local device, it
>>> works as expected. The reason 0xe40 seemed to work earlier is due to the
>>> mask value being 0x20, which causes the effective SID derived from 0xe40
>>> to be the same as 0xe60.
>> Using 0xe60 would be counterintuitive, as we have a non-zero masked bits
>> in the base value. It should be either <0xe60 0x0> or <0xe40 0x20>.
> 
> Hi Dmitry
> 
> Thank you for your comment.
> 
> I’ve followed up on this sid with a colleague from the kernel team,
> and based on our discussion, it seems that the sid in this case should
> be the result sid. The actual sid is 0xe60, and with a mask of 0x20,
> the resulting sid would be 0xe40. Therefore, it should be <0xe40 0x20>.
> 
> @Konrad, I’d appreciate any thoughts or suggestions you might have on it.

What our docs describe as 'result sid' is literally 'base ~& mask', so if
we used that, setting the mask would be useless..

Now, some old NHLOS builds are known to cause issues if the values aren't
exactly what they expect (some whitelisting must be going on there).

I don't think this should be an issue on this platform, but let's just
use 0xe60 0x20 here to reflect the real values

Konrad

