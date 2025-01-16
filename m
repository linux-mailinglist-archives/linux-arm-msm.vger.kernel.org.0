Return-Path: <linux-arm-msm+bounces-45319-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23503A143E9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 22:18:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D32E3A9CEB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 21:18:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 182091ADC81;
	Thu, 16 Jan 2025 21:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eKiSr0OB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E98E26AE4
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jan 2025 21:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737062305; cv=none; b=aFxuoUo90pUeRdxxUvgFVSbzM87xX5KatYLAvlOGg06pVva21r0wt9jdw413084kGLo8wG3zf0IwmXF8zMZMtXg+iwh2C0bKVxGRmYPSyXSPZJJpxoi23uAJRZDtPOvLtsKXqTrLA1EP97X2xYPt16A/UXq7jw/WdxNUkPKbdUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737062305; c=relaxed/simple;
	bh=lGPE/siAy9MNUtanz/bONZNEOefFLJSE9/V8gLVyRFQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MruoAN+cIPhPyy5QNWsPPe1COO20kxztHXcgwzU/vNuk2yIqlFl6n+yu1P21PEct6pP7Zs9AwtagaF4cKvjoX3pGRc41yjMemxGQpfapfYA8y/2G0ymhVuwfPSOrVJF9V8JKwg8FC/N4sikX0+LOMpTWPx/pCohgwIcv7QlI5cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eKiSr0OB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50GEHh0O011659
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jan 2025 21:18:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V0DFQF6jf95eF1muG5nl9hA5YaKwuY5/TJsBMMOUBsw=; b=eKiSr0OBATnrSA78
	9DCzuA+IOJSafBylp6EaAz+U4G9nSXS0FHBG3k820iVaMheXDNRYHd6E4rN06rh5
	QGp81vj5ZfWB9KTqgvCvb1LKY3z0NteljNiv0gWlKTVKchUVU98JPreYF/vSToEg
	xQ6Ff3RBjxVZ6h1k17Z72rjL6RVgcTDTYMkRf7S4z64r2JV5IE+7mL2ObdZrQ5/z
	zsnMYz67iTsBg1LydPspGyIN1ZOz01s5PmOaZgJQOQsITH4gx5R4JawTm1vvL+bk
	yeistoHDtS66onEoeBDdRDcNl63xY7fkbf3AY0IHq2fjTktJq/sqDMGRH9yrXNQj
	IRWmKQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4473res0wb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jan 2025 21:18:22 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4678aa83043so3470701cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jan 2025 13:18:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737062301; x=1737667101;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V0DFQF6jf95eF1muG5nl9hA5YaKwuY5/TJsBMMOUBsw=;
        b=jVqUjSZjapqHBrsJZLOz+TgHSotexjHzQfZoRQ+rysEoCf1mfttheMxmYenruNfsUQ
         GHglv/TqZchSqYCAklj54PpqV9sa3VuF0pcIYU046wx5YxPQiJVRZA6mvhdgq10uRVNY
         +mhMDuGQFSZYlYDQhSLtVKbp1eyilBk4zscCNl/XpGX6AzkJfomJ6Z+ZK3v6epY/1mK+
         NqxJdXshAX5JdscEed4eGMYe9CFrkB1+IvIYZYcVi4DEYd1IEXt4fFAdquMBAW1g2vC8
         fva2/Nz9mzZOLubYCNsIebKyeUgwCEiU5hdy8wMVGaW94AZme2w54EZ9/zem5MbxpJHK
         +mdA==
X-Forwarded-Encrypted: i=1; AJvYcCWyNqEv+rSr/K8bRlpRT2Ay7nBx2SpgSfhgwSg3YNsw+gDXmsWcXi4NtKT4NMzG3CLEF5WhBJsckD/eahI2@vger.kernel.org
X-Gm-Message-State: AOJu0YzQStFsef5sGtj8DavJJUDGmgH/GE8cO/NtZ7I9byy/FZc1KNa8
	CkTfdltG8St98kiCUA501U/jkUAN8SKVwgdMidBh+78mpUgjQzeZsD8bvcyNA8hD7JHlNGTKRSI
	DYRXcP37XfmTq8Bdshb0cFvv2vBLyHjqe1E2hdpTj7eTrjI4UFBGlg4oByvIYFam/
X-Gm-Gg: ASbGncuijZ/Gr5BRInhGtNoGxmtoFGJL+iXhxx/MFrYaz4TRLVHk450JEg8YAMeVqCr
	UIcLKneIzsXQtj0qESOQytvW7kA76XKJV0sUyCa3/VfTh+pFe73cS6UNMDG1YeR/b3KCzjXtev/
	SR8KCQdr2nQpnII859lEASz+5ib/zYKSNV8Lj+GI5YvIUR+jvb7ld29ytozYLsUzcgtGCkS7jpZ
	CXJyGq57e3ygfKUclnSE01n2q7rDmIC1R7a651uypXSlRgV0qDFDXhQo0/+nDVTWzw9YGP/3Knm
	Hs5yeUa6mZNFHAsEtABrvBKVDRKcJ81oJNM=
X-Received: by 2002:ac8:7d13:0:b0:467:5eaf:7d23 with SMTP id d75a77b69052e-46e12a15fd7mr1316881cf.2.1737062300871;
        Thu, 16 Jan 2025 13:18:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF0ktFkGh+DnzAEzmtJNQCdOdkCJ8QnEy5QQmWqMAIAlas/Q26HM+/LY+1fKPjfS1SWYGhwPg==
X-Received: by 2002:ac8:7d13:0:b0:467:5eaf:7d23 with SMTP id d75a77b69052e-46e12a15fd7mr1316731cf.2.1737062300457;
        Thu, 16 Jan 2025 13:18:20 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5db73ee04c8sm436772a12.80.2025.01.16.13.18.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jan 2025 13:18:19 -0800 (PST)
Message-ID: <c6b4f933-f51b-42c4-8f80-c63fa832776b@oss.qualcomm.com>
Date: Thu, 16 Jan 2025 22:18:15 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 3/5] thermal: qcom: Add support for MBG thermal
 monitoring
To: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, quic_kamalw@quicinc.com,
        quic_jprakash@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org
References: <20241212-mbg-v2-support-v2-0-3249a4339b6e@quicinc.com>
 <20241212-mbg-v2-support-v2-3-3249a4339b6e@quicinc.com>
 <cf2f2510-9d27-4473-bf50-45b14725f4c5@oss.qualcomm.com>
 <c5079172-e127-4dfc-826a-b32489d852f8@quicinc.com>
 <ba764e00-2968-447f-99d1-5925e7782491@oss.qualcomm.com>
 <eef55e66-629a-46c4-822b-bce41cff51a2@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <eef55e66-629a-46c4-822b-bce41cff51a2@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ggyAgVOssugSJE8MGiXpSQh4YHAa-zFa
X-Proofpoint-GUID: ggyAgVOssugSJE8MGiXpSQh4YHAa-zFa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-16_09,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 mlxscore=0 bulkscore=0 mlxlogscore=999
 impostorscore=0 spamscore=0 clxscore=1015 adultscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501160157

On 16.01.2025 9:05 AM, Satya Priya Kakitapalli wrote:
> 
> On 12/30/2024 7:36 PM, Konrad Dybcio wrote:
>> On 30.12.2024 10:45 AM, Satya Priya Kakitapalli wrote:
>>> On 12/13/2024 9:18 PM, Konrad Dybcio wrote:
>>>> On 12.12.2024 5:11 PM, Satya Priya Kakitapalli wrote:
>>>>> Add driver for the MBG thermal monitoring device. It monitors
>>>>> the die temperature, and when there is a level 1 upper threshold
>>>>> violation, it receives an interrupt over spmi. The driver reads
>>>>> the fault status register and notifies thermal accordingly.
>>>>>
>>>>> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
>>>>> ---
>>>> [...]
>>>>
>>>>> +static const struct mbg_map_table map_table[] = {
>>>> Is this peripheral/pmic-specific?
>>>
>>> Yes, peripheral specific.
>> Okay, I asked a question that I don't recall what I meant by.
>>
>> To be clear, is this table specific to all instances of MBG on
>> different kinds of PMIC7, or does it only apply to PM8775
>> specifically?
> 
> 
> No it is not specific to PM8775 pmic, it is specific to MBG peripheral.

OK, that is good, thanks for confirming.

Konrad


