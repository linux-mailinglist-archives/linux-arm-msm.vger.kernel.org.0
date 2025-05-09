Return-Path: <linux-arm-msm+bounces-57428-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF47AB1357
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 14:29:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F2E51168959
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 12:29:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB48E28FFE8;
	Fri,  9 May 2025 12:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d4YXDI9J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ACFC28ECEE
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 May 2025 12:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746793742; cv=none; b=CqSDGkRhgN/a2V+hx8mbhWTUBvC9phv8YO4thF/9EaarwCpIO4CeRHcFOs8abgBTvlSjHjqECc6MMqYyv1/XpPcIDnFOdKKDL/Hi5Xjc5xgje/2ns0pjtYEpNFfzA2t51pZbyaWPHwtL7oydRTVuz287+JVpAJDozM3UgWperr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746793742; c=relaxed/simple;
	bh=nb+VpaJq+SiYExLWTH9ohp3EXEsphmTirZX72v2mZ4w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B/xNf31w61l9KIixLdIZJhM0Zp5OUyz9P5LrNtHzoYBjvYx4OYTFAZ68BxnR8eDIF/YyFI+dUZdgHwCMJea+0haWu+sOWtjGYwAcgZm81ZbH3EY+e+cWIOb/qlm6io25qovK2lpxocwuM9v9Fs4FY+uBKUBJ07v+f6UL4tF4kuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d4YXDI9J; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5493HnL4016139
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 May 2025 12:29:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dzrex/88nnhuYbD7YROGz0GqdTFZd6rHcQ09znuzbo8=; b=d4YXDI9JVT/RdlR1
	GdJC0wS2u069Epw93BWciJUdMIKF3UNJ7Xwwp+e0iyfQJacs+XFNJpL7CH9rJO2j
	oFvLXzNuPJq2ov5je25KP4h2Y/GJS0ZLpSd7jcSq+zh1nOFpSX8113NNCllxYy37
	2Ry3ETq+cJxlP9igVJeqN355DpMucEY0C4iOGvfCKBPS9wmoiLHvPULecANXfHxa
	Om+VQYlM/ZtEyade92RrwGBOqCpgHhwwH4se8hgL8oFQT8VhYhfLQtWkH3nB6zAY
	7BPdecxDiL/ZuFaVNV9b0iyr5HipcNjTqOogpel2QAg/USc/Y3lO4FtjZxZdyLpO
	O9DJeg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp8vkjp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 May 2025 12:28:59 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-48f812db91aso5209981cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 May 2025 05:28:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746793739; x=1747398539;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dzrex/88nnhuYbD7YROGz0GqdTFZd6rHcQ09znuzbo8=;
        b=AnC3+R3mug0C4MoA1b+ZtwGhm16JWS5EkhxFjjekFyAGf2c6KOC/rW1EQ3rXaVh8/U
         QYN+FATTuRVsYlDol7jSOSNZF7g2nFSCkUUiWE16C2bgyctHVb4gZyCYqIqdFl7AfHL6
         DZdlMJ/gzJpGluY/SMcS7BuMnfURBwwAW3qGIwkdm4glrjcfFmXNYH1j8WZ1fqD9cEnt
         Ig7l8BXLGFYMw84ofN2QoRYBDrvu/oZOALMc6MWtyQ5URBok1fgjl4r2KVlBk2cxQ6uD
         M/Swjw1NP4Owc48mEK6S81OHK0cdDKYUYw4BkJ3l898MfQhPYZ0/XtN4XRezwmL/ZfyT
         Tm4A==
X-Forwarded-Encrypted: i=1; AJvYcCWsmzo/X5cg9Fw8JaIOcRDzssoEWYwfp4O2xSYpKF56/iStceTgS9gbniWiqyUBRkOUz10RBI4YTWDWHSXQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yz05Jndv+DFeMjnFu176Dh8C2uK/CKfeYHjGTziuA2RNnDIhVyH
	3KhcBf2JGRnUVFVgHlne0YBi4MKhm7vY/KVSMLwD6+G95g6Mvw0/+3AiDnrmt1fISlgLDJMu0bX
	hICPdGkxHh45iTVnJT5gFnuZHPfBmKkC44NHduUlzTrFpShn7JVTzN8PpS7UUyb+E
X-Gm-Gg: ASbGnctXsFQW5LUpRFiGMMd8PF633UDH0nJGJ3rUmMETI+rEsHp/o5QW4GBRh6Q5rmv
	lXZETMP3neYwpJpwXO9MAoNwr0LGf+W69r4Tz/Jd7Qhy4pbMJS3OxB56lm6XyWQbbHTXsVvus9W
	L9WgKU1dud1HShEJlYS4Jw7X9mzgCPABabWfvX4nYzliLXjQFKSX4QERfBWPRw902h9R2dAsDk/
	WYR7KJpF5y0i2yGc71vzhSKjExNl45I0nclzU4JelXPcYa01NHwhX60Usny520ok8dbLmbSBH0Y
	LISNeqsBXY21LUI5kqj7sEWJieO102hyaEruQ5P+0RkAjIA6oaG0JMfDx8TvYUv/Qag=
X-Received: by 2002:a05:622a:406:b0:476:63e5:eb93 with SMTP id d75a77b69052e-494527627acmr19924151cf.7.1746793738935;
        Fri, 09 May 2025 05:28:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHh76kBlsHwWwCEVlS+S1ABlxGBvnfq9t4dYT6eIbKcDYDcf8Gdr8WUiN8ExkgtpWuH7XTO8w==
X-Received: by 2002:a05:622a:406:b0:476:63e5:eb93 with SMTP id d75a77b69052e-494527627acmr19923881cf.7.1746793738374;
        Fri, 09 May 2025 05:28:58 -0700 (PDT)
Received: from [192.168.65.105] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad21947a442sm142986366b.82.2025.05.09.05.28.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 05:28:57 -0700 (PDT)
Message-ID: <17431c94-7215-4e50-acc9-7df97558af16@oss.qualcomm.com>
Date: Fri, 9 May 2025 14:28:55 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT 01/14] soc: qcom: Add UBWC config provider
To: Connor Abbott <cwabbott0@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20250508-topic-ubwc_central-v1-0-035c4c5cbe50@oss.qualcomm.com>
 <20250508-topic-ubwc_central-v1-1-035c4c5cbe50@oss.qualcomm.com>
 <CACu1E7H6FGm0npQnG+M3Jzn9RSL9CYkkDg3rtH+=on4_caPTZQ@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CACu1E7H6FGm0npQnG+M3Jzn9RSL9CYkkDg3rtH+=on4_caPTZQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: uthZLx8fyKulBsjR5h85XyC8dN6e2eRN
X-Proofpoint-ORIG-GUID: uthZLx8fyKulBsjR5h85XyC8dN6e2eRN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDEyMCBTYWx0ZWRfX5t57ZFn7+r7x
 5AnEA6bCcB52TkgivphJyJxWoymg5ZQs38Bjhi131ntv5wpShkV20fx9+Dkq4mVTkSc8tO6mhjr
 t3Fs+v+TdxgBdN0OLItYLxJNd4TastHN2ui5iXkok1G8FquvTI1pDwnxbms6NsoFNZ9PlxMWGwj
 vZuapEXbU6eVWolIdvSuyyB23Jv9ig/lxiL+V1lY8KMEQNL6xaOBl0S4qkTvLT9yAFs+Lv6D9H2
 CbNz1bYnwXaissTrXnmtJkA7Zkk2tpBWtOpltkJJfRNPAnfc/66aBPppxEYAoHKFAg1p3gvPFgC
 YSIoKpjN0amLK6gneRvbPqpZEbUflEmTquKicpnA3kIK0j61+A/CNimhMlOVjGTO6c5hrg8ILuf
 mrGBIk28CRbKaoj6o1bluGJaKug4ryey44LKJVbnHsiaW9QQ2oNwBbsl8nuEZ7VLkXdHySvc
X-Authority-Analysis: v=2.4 cv=e/4GSbp/ c=1 sm=1 tr=0 ts=681df50b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=qJKz7-gl4_nKpslyRI8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_05,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 clxscore=1015
 mlxlogscore=999 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 mlxscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505090120

On 5/8/25 10:12 PM, Connor Abbott wrote:
> On Thu, May 8, 2025 at 2:13 PM Konrad Dybcio <konradybcio@kernel.org> wrote:
>>
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> Add a file that will serve as a single source of truth for UBWC
>> configuration data for various multimedia blocks.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> ---

[...]

>> +struct qcom_ubwc_cfg_data {
>> +       u32 ubwc_enc_version;
>> +       /* Can be read from MDSS_BASE + 0x58 */
>> +       u32 ubwc_dec_version;
>> +       u32 ubwc_swizzle;
>> +       int highest_bank_bit;
>> +       bool ubwc_bank_spread;
>> +       bool macrotile_mode;
>> +       u32 mdss_reg_bus_bw;
> 
> This doesn't really seem relevant to UBWC?

I'll admit I just took it with the rest of properties for a simpler transition.

Generally, we could ma-a-a-aybe just make up a common value and pray it doesn't
break anything, as we're taking numbers that translate to ANYTHING_ABOVE_OFF or
ANYTHING_ABOVE_OFF_PLUS_1 in most cases wrt a cpu-ipblock path.

> 
>> +};
> 
> The comments should be copied over from the Adreno struct. That was
> the main way the meaning of most of these was documented and you're
> deleting it here.

I'll do that.

Konrad

