Return-Path: <linux-arm-msm+bounces-58727-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F98ABDE34
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 17:05:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A85E45024AB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 14:42:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A1DB24A07A;
	Tue, 20 May 2025 14:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FFryM423"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA42024BBE1
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 14:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747752074; cv=none; b=VTjUPWJiKrIwnI5pCQz/fXtajqFBnnBKPCiuTx30wZOdFa5ljRJMJW3y2G3LTW4EQ8DTOqzfxWkG2DnEMWZTsxxcjgLCm+lQSYs4Ov4D6KBlaIlgNgrUlOBQy4wu3xFvAwJd5Nyts/LAGPrTNJV3EalUhflsP5XnNm0uPHy9ETY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747752074; c=relaxed/simple;
	bh=qFi0PJjY/GA1ckQYhEy9BBKu3FmQYIbZut6fOgyE9AM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sK4UCfaTH6L/mTlrm6qV+97PAIgojXFGFIlbXbH0YU3rvl0LG1dA9b7Kk3kRRe4A4oVwbQAi7Es3aq+gYCBUVvx/FrCupysn71heuj/GqV4eTcGKg150+9lzJqgVkJNk+xK4sQBd2hLKu3jLzvVavMRDJ1PO6QTOnHyWt1f0DA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FFryM423; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54K7RoWF013451
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 14:41:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5mlNLJPj3keKy5AFMk6a+E68XXmDj4hPUVAPocc0XyY=; b=FFryM423ca3nRm9G
	9EWVIkfKHYKFJf3qZI6nG6kJEqZwqnhOjG5ve7C+E3K9PEn2SjplGrhAtR883N0U
	T9rh2oHx/HQSR3Cbg3yd6nd8QXRHfd6mT/4J7C0sribVshIsoKtvXGMLpKO8Xt5o
	rhKZZuNM0xh7n8tdy5/T0T5/OhKIxJXIpUOAZCBt3Nshlv8/k9+TrIrh9ZuALrMF
	rLLscKbHuSIy9jpqRkCsupsOolox2rbRg+i8if/rN237QEKxqMlAYmSNMEBEE0zr
	op00AaGrC9jRtb28Z1w58E71RnP/K4nxHBaH+E7OiBdMHflSDKV9dNUjNU/uP98X
	F9BBPQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rbt22gmy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 14:41:12 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c552802e9fso143965385a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 07:41:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747752071; x=1748356871;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5mlNLJPj3keKy5AFMk6a+E68XXmDj4hPUVAPocc0XyY=;
        b=EuF/MzAJqt39+PfZSrm7vMRVU89GRNzoJ81tVTZkMCBndXhl1nqjmCHYtguR7U/Gpt
         5uzNChyWM1ZnI6xM8Q5oQcLkFMia2a/1mYehog1qZi3E0Xgiwd8v8xfQgI9TvPeqPHaY
         b7k2TqFwTxzPcGgsN9qxJSsRCY1pZzRrwjYmtdYykpA65N3W9rAE7LjAcrqXilrJyeJ5
         IAyDBbf6XO1F3EyX+5UgKOcvudnYHBHgPKF3SyobCqnd0Q7GDCR6JbdwPuGir3/2weVi
         wCc8hZx4bODKN2DPbySwt7b6SHMTOKiAeS+ii8qEf+t7VsIF/m3ki6ZlYVyNZ5Wf+Jaw
         2aMw==
X-Gm-Message-State: AOJu0YwjGX2KtWwu2ZD2KWz3y5+WLYCpy7vODW85x2k0/0nojo1rWYue
	G8YHb/jtd7/N1V9vDgMl7VB22RIUMZSJ/ceMQ+wspiG7z7pvzflb+jtUJKUEEWN5TjCZHC5SGPq
	RbL+tt5uW4WK9+UEwOwUIGlkWQfdbi2Sp+emdPcGgfd343uz3vIQ1K+s1VdJNywwpPzlA
X-Gm-Gg: ASbGncsX1duxIOSPR35/wkeXdjWOjG9bVQHVVz1TzrZe6eUBZo62tRYmeExyaCMSD9e
	xWh144S5fBbKKmvwyxpL2Q57AX7kMaQu0jv89v+p88wOcZxJr8TOPl+XxAfbQd6wilWYqZ8pznp
	/uLMyRwXFpkWA2Zwf334V54RZWJe0CwTeEC6A8ary9mW37TC860TM67MAU6ocCUHVITV6OH/pf8
	o4P0Vnt0iwv3/rpGk5L6BDG3Rfk+cNq36/ppzK34jZrUaIuVdLnDEGiir95L76Ki/5O1I/j3zD9
	4y6nkoxd7CGrvjbYV5DNxkTP55fZThUny2Uu40qKzKKXA3op7nCLGEmqPz6jMrlQHw==
X-Received: by 2002:a05:620a:240c:b0:7cd:4bd2:6d5a with SMTP id af79cd13be357-7cd4bd26e5cmr922855685a.5.1747752070704;
        Tue, 20 May 2025 07:41:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFPo77pYRE2NGo3yezIOzCTbQgbl0QAy276sr1Zd5knvtytt7Q4ECIBHJ/yj8osKF+sAF/G1w==
X-Received: by 2002:a05:620a:240c:b0:7cd:4bd2:6d5a with SMTP id af79cd13be357-7cd4bd26e5cmr922854185a.5.1747752070132;
        Tue, 20 May 2025 07:41:10 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d04aed7sm742444866b.9.2025.05.20.07.41.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 07:41:09 -0700 (PDT)
Message-ID: <c9b1422d-46f4-467a-b6c4-27eecae95897@oss.qualcomm.com>
Date: Tue, 20 May 2025 16:41:08 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] soc: qcom: qcom_stats: Add support to read DDR
 statistic
To: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Doug Anderson <dianders@chromium.org>
References: <20250429-ddr_stats_-v1-0-4fc818aab7bb@oss.qualcomm.com>
 <20250429-ddr_stats_-v1-1-4fc818aab7bb@oss.qualcomm.com>
 <b3119bef-d045-467b-91cf-37fe6832ff63@oss.qualcomm.com>
 <890b9e41-d5a2-4df3-bb21-71642b4e6410@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <890b9e41-d5a2-4df3-bb21-71642b4e6410@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDExOCBTYWx0ZWRfX7fL4zRPCoeSi
 UOxF7Kd4YSQXXiwLVX6gRZyordubQ8Ft0jld+3ercg2lc5AYNt8+YDyxIUVuz070vmCARMhZMgU
 Lq0ytyEvbhI5KZbHkLu3uR1wdeqALl/de7tKfQHQ64FSfO7lJ4LuW7Nzq4jYoDvc2lmaT1652RH
 W21tkK+zqehImSnKjxd10qeZT7c9WVwz/x93TdTg/Oe5UUuxa9xlhjdZcaj7Nf5eV9POtWmU3uM
 pJTYRuLpMGqeUqPe84SbmscqS+oSNaASlcQ43MMPXvgJ0FPVUXlfPj+S2J5IgY2fVnWOTkmY8b5
 Q/cRbkI0Wos9nikDcBK2L5eLbrEWP3Fmz/NMA4MrZKTSvVj49nqcOlaw2kSVqjAckZidnfvyF2I
 cqaRohUuA00Gk2e9s8kRQecP0AoEYownoeHMeOJY14UG33ji2GFOK46vpxJYf8TQ12y09Vjq
X-Proofpoint-GUID: 8ioPmIE2plyyzWYGZ1n6tLP9ed9SRDwf
X-Proofpoint-ORIG-GUID: 8ioPmIE2plyyzWYGZ1n6tLP9ed9SRDwf
X-Authority-Analysis: v=2.4 cv=dISmmPZb c=1 sm=1 tr=0 ts=682c9488 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=1C6ALYQBLxPpYy_y2mUA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0 mlxscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 mlxlogscore=999
 lowpriorityscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505200118

On 5/20/25 11:59 AM, Maulik Shah (mkshah) wrote:
> 

[...]

>>> +static int qcom_ddr_stats_show(struct seq_file *s, void *d)
>>> +{
>>> +	struct ddr_stats_entry data[DDR_STATS_MAX_NUM_MODES];
>>> +	void __iomem *reg = (void __iomem *)s->private;
>>> +	u32 entry_count;
>>> +	int i;
>>> +
>>> +	entry_count = readl_relaxed(reg + DDR_STATS_NUM_MODES_ADDR);
>>> +	if (entry_count > DDR_STATS_MAX_NUM_MODES)
>>> +		return 0;
>>
>> -EINVAL
>>
>> Konrad
> 
> I kept this return as success from details given in commit message of [1] 
> which made the qcom_subsystem_sleep_stats_show() function return 0
> in order to run command like below to collect the stats without interspersed errors
> grep ^ /sys/kernel/debug/qcom_stats/*
> 
> The same may break if return error from ddr stats too.

Stephen mentioned that the errors may have appeared because the subsystems
may only populate data after the probe of the stats driver.

I would assume and hope the DDR stats aren't affected by this..

Konrad

