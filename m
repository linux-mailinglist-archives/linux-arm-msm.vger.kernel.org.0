Return-Path: <linux-arm-msm+bounces-56516-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D3AAA743E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 15:54:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4C08117BF03
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 13:54:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70A4E255F36;
	Fri,  2 May 2025 13:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XFbdDlW2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E77CB255E54
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 May 2025 13:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746194069; cv=none; b=QEOrTIsbJY6dsmo4efGbjRW376Bu/gKY0S/tlsp2anW+C1qOsgPmNmp7wfwaSk7rcJPf4b/lcjH5KDZNQyUXn6RIfLIq/fOSpyCCO6c0Z1RqrYxBD49U2hA27k19sBeH+9TawZLTey13Qjo8P0GZarRs8/vavq8FLNG9aRhayM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746194069; c=relaxed/simple;
	bh=SbYvC/lGbKbVig/CuUnTBRTVK/wus5dwp1Hyif8wsEI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OCzW5tsDcJyXLxmO9ksmy0nMQnqAo0Ubq09h78KWXiwy62sYR1+zHrOUi7e76/qxyFLg/czhTkUQyM3g5syaT7abMG4epbq8FAmTozLBVtuwMbykTmZCoet/LaPWXgx0hqWJA52s/N2BUuEmfSIjhqfLYGV2f9eLTK2zC+M5NaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XFbdDlW2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 542Dd50C015323
	for <linux-arm-msm@vger.kernel.org>; Fri, 2 May 2025 13:54:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yL9EoiyJnIJjcu+Ek4UoLm4TG9MKg3HqDNyWMAzlopo=; b=XFbdDlW2SNdvnijb
	SwJirOH4EhzEbnVzh94ePCGcYcLocIt6Blc4KWIkBqpseH7PBGBoHs8VBXDA2sdQ
	4AzG67qLT2mERYPYG8VYctHIJQ7ImJ5ir98vClgJ5sE7UB+jhbeVkQykxS1tBvXa
	56YGcBqASyd5fKM3AT4wbP3UsXKWApBFVdkbiiTcypeDZdrWlY/DB2EN3dGijGPJ
	qOW2In0WlOzw9IwwitrSlU4KSvkEzj3fuDRqG/evdbkATXC7IeIMko+3MYd6Kqb/
	d4qWpfjzy8ZVfUZmwAFwnZP5xQ0cu1xNeBXccBevlGhpCBoRpGiSk2bOhCM5VLuW
	ErD+aw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u20h45-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 02 May 2025 13:54:26 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5ad42d6bcso48823385a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 May 2025 06:54:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746194066; x=1746798866;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yL9EoiyJnIJjcu+Ek4UoLm4TG9MKg3HqDNyWMAzlopo=;
        b=olmMqYJP95fwt4FtgCWgbviR8J2D25sBY7icdjSUpg4pUNVUtFmcgz6wuJ8CtNLC+i
         zNIGYcZGwimvQYA14TOkPBV99i3Pwq8Jw3U48jQla27+bTJ/Q2DDRoGZBdovD90B7XSK
         E8DokMB7wprIbJHW55dZu0Uqb8cM+oGwC+5UkgDv8yN/80dmCpLgiR/kOsYX45rrTK+a
         LXA/Ne0sofzv5vhg80xZlPEqk1qBwxT+VFCHyWx5Z9XpwMpJ7tTjS48L31YYgLINTd8b
         L054rtTSwbnQ4/hSxCRlzp9mMY3rU6n9cou0eo69W18KMTh8copl4WBe61nZcgGklHDG
         6Dbw==
X-Forwarded-Encrypted: i=1; AJvYcCVKBvs1j60ifXBGEKy3peat7XZzra+A3givjE0VSAnznupZfCm+e8AGhCVyLJWgujNAxkCdjTkPA+YF7YJd@vger.kernel.org
X-Gm-Message-State: AOJu0YxoKY9eRb5WATVmugMpIit/aVv5+PoI9crh2gIgHLVtiXcezEoT
	jfiE3VJxF2E12e9vbCvl3IYamqMCe4SHlNk/6BTUgYDeXnM/Khb6km/2rs4BofHVUJz/EpDuzCd
	RqgKBZ7G/56hMqkIM/Who4uQAOfAGPaB4S2S+5gVfKNnKCDzSvfW83NOQ+RgnR1LK
X-Gm-Gg: ASbGncs3e4c+R93hDADGPGuazwhxYNLsayQLqqc/IXpRbK4ASM0bLwOM1sGmF+tr32Z
	XQrVZHmVlup71FM9e2VhHcABqrL72zHGyBW2KPJ5Yh6r8MMHAJ6VV/Ql+qIiEHktM6kdOJw28HT
	qDg5q/2U4eDVqsiF1H3AmwHSy6rSKmRFG5/rNo9Pn8IyuaDAixmd9WH6Q34v9pIRx1R0xvgmbwH
	KbNDgQwXfQR8rlv9PJKVBJsQwAv/HScHkjohyZX5vCy/SuFtGyWs6lBndh46j2iT3Y+znKpPimx
	LjIFPBxzVNWvDLfWhpO2ji4b+aZ/ON0oRiL3pI0sBYhvvXzfOq9gucXK8ej5izltD+Q=
X-Received: by 2002:a05:620a:4447:b0:7c3:d752:f256 with SMTP id af79cd13be357-7cad5b4f0f8mr152977785a.7.1746194065725;
        Fri, 02 May 2025 06:54:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGwqDIQDynRQ/WTGlGryiob37MpltRCrA//d1qVHrqR2ToFyr62qtJV46XmvMEp/ixzQsjp0w==
X-Received: by 2002:a05:620a:4447:b0:7c3:d752:f256 with SMTP id af79cd13be357-7cad5b4f0f8mr152974685a.7.1746194065289;
        Fri, 02 May 2025 06:54:25 -0700 (PDT)
Received: from [192.168.65.113] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fa777c8b1dsm1262238a12.18.2025.05.02.06.54.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 06:54:23 -0700 (PDT)
Message-ID: <afd7c1c7-dade-4343-8e2f-1eea0e403c9c@oss.qualcomm.com>
Date: Fri, 2 May 2025 15:54:21 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/23] media: iris: Prevent HFI queue writes when core
 is in deinit state
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil
 <hverkuil@xs4all.nl>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        20250417-topic-sm8x50-iris-v10-v7-0-f020cb1d0e98@linaro.org,
        20250424-qcs8300_iris-v5-0-f118f505c300@quicinc.com,
        stable@vger.kernel.org
References: <20250502-qcom-iris-hevc-vp9-v3-0-552158a10a7d@quicinc.com>
 <20250502-qcom-iris-hevc-vp9-v3-5-552158a10a7d@quicinc.com>
 <250cdec3-1437-4c45-aab1-0428218b9437@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <250cdec3-1437-4c45-aab1-0428218b9437@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=G5AcE8k5 c=1 sm=1 tr=0 ts=6814ce92 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=AWkmbyHJa9485OIXA2sA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDExMCBTYWx0ZWRfX3KVKkPn/GcXB +87epRMony4iHxyUHzgWmecescvfsGVaGzKVvPHpZFDrpTJKjfEQ4dYpmgZS0HyY7DRtFYwn8n+ owRZcDl9mAu8ex7hWkGSptTyC7E9xpHeEXLJq/+BYh6b8420CUjx44BciTn5mt593Zbla0emTwx
 j5gWI1vhUyhB/MoYchf66y5HQLqxm6rslm32mHAKE0dN/492KYYAN2eHSgxnWaqqY51EiW0CuA3 tOTSERHGtkJxoU7+Bh11OmEdBhuVAkTFK+i1xYjGbtvM5JVhI8T2UEehd2+Ke7/o3tCgb4Ibzyc C4XYsDHjrNDcqBDEwUJxOMsn2GLbI2dKT13LvDPwNciUxSlKQDvhTCQeJbhyX0byY00Rfx986Ps
 3ugMBms7PiZMF+90J28CDkIAY7vF4IqPultN17sE/16dXC4vZawtSOrb7q9jGLnZ2Splh9vu
X-Proofpoint-GUID: yqge53mvMTRASFtSFocyaydd6nVK9gDg
X-Proofpoint-ORIG-GUID: yqge53mvMTRASFtSFocyaydd6nVK9gDg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-02_02,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 impostorscore=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 adultscore=0 mlxscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020110

On 5/2/25 2:22 PM, Bryan O'Donoghue wrote:
> On 01/05/2025 20:13, Dikshita Agarwal wrote:
>> -    if (core->state == IRIS_CORE_ERROR)
>> +    if (core->state == IRIS_CORE_ERROR || core->state == IRIS_CORE_DEINIT)
>>           return -EINVAL;
> 
> Instead of checking for 2/3 of the states why not just check for the 1/3 ?
> 
> enum iris_core_state {
>         IRIS_CORE_DEINIT,
>         IRIS_CORE_INIT,
>         IRIS_CORE_ERROR,
> };
> 
> if (core->state != IRIS_CORE_INIT)
>     return -EINVAL;
> 
> Cleaner and more explicit - declaring the state you must be in, as opposed to a list of states you should not be in.

Being explicit in state machines helps maintainability - if we get
e.g. IRIS_CORE_LIGHT_SLEEP down the line, this could easily fail

Konrad

