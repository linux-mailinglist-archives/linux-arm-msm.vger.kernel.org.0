Return-Path: <linux-arm-msm+bounces-65716-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BD25BB0AC1C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Jul 2025 00:17:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 31838AA6FB7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 22:17:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 750FF221FBC;
	Fri, 18 Jul 2025 22:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BoIyU7b3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA814221733
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 22:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752877074; cv=none; b=SVdf/DmqXnY+TNeJcvkecS6hJovgr2SSSf5OYXAgTf6d8iJiDCw7Ar2B7/1f/wLptPNQ2zRsLC4ZorHp1z9CfOaJaQLVXFYeXUfd3Px9xAK1XZfVaOERHP7Pgh8WA0qkZL2R6vaBpuTcTpSPPlA6YLAxeOfQ6MbMEsur3y1AeM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752877074; c=relaxed/simple;
	bh=gYaUQ/510T9arEarBG/9EIkUrk4nlQseoKIqq2zvOu8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ML/7RTBxxhJNlabObLjd1zHLdDoRB8tt/9pcXBm6SsaoFe1PDzXjLRu6pzWL0uhebu4vn/pceAJmxYpW2sRMZOlkxvjT2MHoV7t8g80UuvLFLyrJlkrePsnlPqLCN9bYh0h5Wj2y/JO4GTby3csOBjCCfXMsfNoMjNDhRpQycVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BoIyU7b3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56IEFWsq032206
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 22:17:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0RQn3Hr+L8e3KUR0zmvMetsQjNiIYpQFjrWjwmHgudE=; b=BoIyU7b3i8+sBltK
	SQlaxEUoDNR/JlE+4IWz7MRYH1q71UfnViZMMVo+wa/SnXbrq4S5/SK9x47ofBkG
	eWdQex5WRVsxMW/sKd5cxYY4A4eXqoXmJsQ77Ab/9sbvl1RmJekEkJ7I8Civ1VPt
	7NFrElffpOEc32+JAyRzl89oA3jJALbMauXZX7u2jeyIUpP62pOa3m9LJ1l51uNU
	MgkIRbVUa61WrVuwIYy2c0b26xETu8meG1wW4csuffqAWMMtKFoFs6t5KRAuM3qT
	BVqZG4MD/DROULYjB4ml4k4R22/XjaSvmWWoGix+b881HqBNnSJryxVgIezi1Hbf
	jvxjAA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ug38d7wq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 22:17:51 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6fabbaa1937so7188976d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 15:17:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752877070; x=1753481870;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0RQn3Hr+L8e3KUR0zmvMetsQjNiIYpQFjrWjwmHgudE=;
        b=Ls74JS6KL0p6MhbWxcP4+DtY8cpScjMwNUrJbbn3sDQAv2FFlItzHIOZ5ANVGx22mg
         Bu8GeUuJTwmDwsRku7Bmul/Th6ARkkFkDZFKQxru5Bv9HoZ1ItxLd399V2O7lpGfqD69
         gA41SVFbeyiQfDO5FSENCj7YSxtrbYolrf7eCVM+9XEI3tf+adDFMAcp7tr4wWSNA4C/
         zOsbODgi0NCcTxfC4CvPpByTsdNtAE5QWHTSljldY1YL6lKzlzssXg+BQGFQMtXDHVmy
         CuyxG33+Ozi1D3vjLApzTvDyMw79TsEI9Lqyuhlc97boq+AWWnTtrS5IwrCVLju5fey4
         yRCw==
X-Forwarded-Encrypted: i=1; AJvYcCWjGS9ioQWs655tq6blk1MgNPAmVQQUf1dlO47NX3wVXG4zCUk4SJeNzTQ0RJj/1fZNdEIedx3WfdSnBQx8@vger.kernel.org
X-Gm-Message-State: AOJu0Yyspi5L+OZ611eKLB/I5ClU0G8RQHtIXpp9kxHpcd6qW8uCsTnS
	ObKEl2H9B4a3V/Ii+FnK5fZl9S+SnT6SU8JzmDQL78V/T2GrEEEZ44nY8KDBs41e6UIlcwx2A9P
	ZJL7/ZNeomFrOtE1etQC1ecGdVQRIZ1wqgjV9LLd1g0KY6r0VZkR1wTu6PNPHvcq6rRnQhRv551
	w4
X-Gm-Gg: ASbGncsO8Kuwkx3cw3LsH7uM7/Lf0NZmET1K0fU9sxZTOUJZkp3BAIJ6nq5y1CbYhV4
	beJn4v3HuWbjSw/j00gXA8mcsg7/S71ekOnXWHUCKGAU7JNn/5NQNr/f8H864C2tiT3O7Tu992I
	NR5l3omCnhfiFeXeEhGaZfX3r932q3DbuJPeOuIjzdjZVnapfGBJr0j4RHrNXeA50WFRSEjkWoE
	329VS0UDIKxun9mvuEyJ4Mj0vLUtmMOZa9ntb+VxOO73WQEhiGagwVajK2DrSd6hzGVyi9HuliD
	PSuNIKS/ea8FgCw4+0ABg6OG6RM8MkVkkuGnD8BoblOTy005TGqLgxgw/d8MMEH8xLZ00sKG9Jx
	LFIN4J8+JM50r4KOb3H3V
X-Received: by 2002:a05:620a:3907:b0:7e3:3357:3dc with SMTP id af79cd13be357-7e342b693dfmr818715385a.12.1752877070527;
        Fri, 18 Jul 2025 15:17:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExXb+GPDMiphUZIbB3RMlhp/AKQQZhzdoIKBhChXGFZUoa3SwiJ/PxCIpW/KcetK4sODN0wg==
X-Received: by 2002:a05:620a:3907:b0:7e3:3357:3dc with SMTP id af79cd13be357-7e342b693dfmr818713985a.12.1752877070041;
        Fri, 18 Jul 2025 15:17:50 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6ca7bc78sm192207666b.113.2025.07.18.15.17.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Jul 2025 15:17:49 -0700 (PDT)
Message-ID: <a2b837f8-eb34-4283-8d7c-17031a7a682b@oss.qualcomm.com>
Date: Sat, 19 Jul 2025 00:17:47 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/28] interconnect: qcom: rpmh: make nodes a
 NULL_terminated array
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250704-rework-icc-v2-0-875fac996ef5@oss.qualcomm.com>
 <20250704-rework-icc-v2-3-875fac996ef5@oss.qualcomm.com>
 <859be3e3-be14-411d-b5ef-07bdad91a878@kernel.org>
 <efvyk4ojddr3emsdavex4uqrl476sj5hz3ihd6kditdxd373jm@wu2av4fvqc4h>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <efvyk4ojddr3emsdavex4uqrl476sj5hz3ihd6kditdxd373jm@wu2av4fvqc4h>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDE4MiBTYWx0ZWRfX2FnsxDmt0P+I
 Fe4Te50zaRc8wItpikR2Vbgzwv4PJfCDGTehpcvHMt70AkkVw2zg7UynUmaLI4lOauq/GCmzGpb
 AX+LtFbA39l0++rMEfWOD5pXNnZu873onR466aL/LHvLTTrrEiIreQBj1RlE++dukIBkQbtanju
 wHkRcZWCtlHt/iMIpVYuinxvK5/TdnWP2y6ebdxFxt8ZhlR0ksUZ0wF0qZODKdOiimrfRRdRmCv
 o+7bhHYwrmCP1E6YQa4y8ADM2BUh4qD9DHqpbtcJRgyj1QfG0f9c7jXYnelv+2LiH04olvvPHpE
 u0B6fmV1oI6FaK11YEpJhosO3J5tBXMy/3nGMXwGiQj8Qvxa/RNyHeRLYLUxY7h1EkcLqzueaXe
 b+ECFznfFRxikzS8sgSMYxUA733x/rdpmFmPkkU+xb2INRN3w7mYTN+j/weiaaRorx+neo6L
X-Proofpoint-GUID: rZIzVsqkQTd4vYEM6lDtp1DmgghEkQmV
X-Authority-Analysis: v=2.4 cv=SZT3duRu c=1 sm=1 tr=0 ts=687ac80f cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=klZMuIcs0EXzT4WS5EkA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: rZIzVsqkQTd4vYEM6lDtp1DmgghEkQmV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_05,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=541 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507180182

On 7/18/25 7:26 PM, Dmitry Baryshkov wrote:
> On Fri, Jul 18, 2025 at 04:38:02PM +0300, Georgi Djakov wrote:
>> Hi Dmitry,
>>
>> On 7/4/25 7:35 PM, Dmitry Baryshkov wrote:
>>> Having the .num_nodes as a separate struct field can provoke errors as
>>> it is easy to omit it or to put an incorrect value into that field. Turn
>>> .nodes into a NULL-terminated array, removing a need for a separate
>>> .num_nodes field.
>>
>> I am not entirely convinced that an error in the termination is more
>> unlikely than an error in the num_nodes. Aren't we trading one kind of
>> error for another? Also if we omit the num_nodes i expect that just the
>> QoS of a specific path will fail, but if we miss the NULL - worse things
>> might happen.
> 
> Exactly, that's the point. It is easy to miss num_nodes, while omitting
> NULL will crash the driver. So the error will be noted during
> development.

I really don't wanna step on your development, but again, I don't think
this is a good solution.. maybe WARN_ON(!desc->num_nodes) would be better?
Some static checks?

Konrad

