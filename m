Return-Path: <linux-arm-msm+bounces-59063-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49802AC0F60
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 17:06:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 15DC3503295
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 15:05:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17B4028C865;
	Thu, 22 May 2025 15:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cNhPhkN2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C70028C5CA
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 15:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747926326; cv=none; b=SJh3UBXmYx/5tWkKCKhBtwb3xwOWqGKopbRKWyHYStBqTNXblm6VUlsxT26UxJ2sLd1RzaPOrDp8KEPX8HU2cp0WDbWfsotTG7+jjPbpbdIvjppyMo72HOff2E3SKsXu/8UfU3XYcvh1TAxId12xvpi0xiNmu60+DgDAt6fRSKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747926326; c=relaxed/simple;
	bh=h1MN7X84z+I0Z9lmQjsQT6TsWHF9Kda5k56edkB+wTc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cds1GQhavDQkKnBrVBX2AtmcZ8CkEMUvbbFgsoFX0O0oGz7mOU0vwjr6lCzCe5TuIR7lytgfC+ZgdneagH3rkTt+m9OIYeS46d6CiIIEhZisDuazAwQjND3YdFrEQ0fVIvp6uGcyWVcNi4ULNvw7gWIif1ygPkxtA0MrtlgJ1XQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cNhPhkN2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MEc9Yu031677
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 15:05:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h0FXMVGYcKvYPtW8IpaaJtCZ0Z+caHLuXoWIxuTjPfU=; b=cNhPhkN28djh6A3s
	hev+vBrs334t5fbREWPLgmtRExWNf1sSkj/TZ2uFx2ERyRla9w40aYzKmkOkpx4H
	LKBJv4Cz4sd6lk3uqZGIWlkav+bP0wny1GdeMe+OIueSLZBgjzxANBnv5pap1Dn+
	ispo85ejqCgJUv781eBkXy8dSwL5qiiJIyifPmEN8gQ/dlBVyU1pe0l3172lcRdt
	wglbwf1/pxRjB4V9nMo80vtxcY+NvT1G4B8URTJrP007TOw9g+2w0p7B81VVJtr9
	36ZLXiqWu+ufyouz2O5wlhOkjzbyZ6AhIutZGK8luAb0GlNEvfRSed9UQJjNm7DG
	h8IoNw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46s8c25chk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 15:05:23 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c545ac340aso76695685a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 08:05:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747926322; x=1748531122;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h0FXMVGYcKvYPtW8IpaaJtCZ0Z+caHLuXoWIxuTjPfU=;
        b=R1GqQ3zcUvJXWIorPJEe6rdphINbsQSCekxNvrK3h46e3O6RkkxoXgyAkxm4aSMKgg
         jb4HlGG4XPVqnitUzAWp/NbWvHuCVOQb18ve7zRdanSoYr0OOOS3kgClHLfVX5QeFOLL
         6yLKAKQffv36Eekn4h8vUXQtHXM9PlxGI7QH2paNU4A/HMMv+r5fB/ARRLl6esGZhWBj
         ujQwhPyzcO0nMV49EM+HY686WJv6kK4uhnkplh02Sj0IK4dRDRrK2q62lVKQO/oe9xLK
         rlotRct0ASBJ3yvVZJ8CZ0I2gk8/xsPS+UhSihJcwk1ite3vpDhdbgfXvbt+Z1LHVmey
         WfuA==
X-Forwarded-Encrypted: i=1; AJvYcCXGTHbh4Q6tjOIt1J5rhijeW0feLHm8G8iQpz6Nq6chTvsO30XPZG8UQ6ZkUjYkKZzIRsi5eD16e6RqjnoU@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4dnsyPSI0PPhFBoADQo0M14pFGj5fso7JOCfRUm+j+JgPp1FG
	8Oj0g3r0UxgH1HfIQxSzp5nR/WJQIOmm9X7o+S39IAu0CXIZjS9ybPJ4Smi55KL1tzskjZSKA4t
	ItXfgE6dVhjPmiAO+/KPxHTib+bK5yhFS7sxAZ5by3ef0ka2Gu1cRF40zQSrvX5BhKnvj
X-Gm-Gg: ASbGncvZrO0Ppm2iVVaGE+YbI4sdTM5E70lakPtaXPvCifVTSzVSZxAlbAV8gXuyJyq
	7B7iA6rdghy9tqT2DRiZKZKFpvnQG2wEw9uwPebOuOqkUu0XCyHrH2aFCMl2ZoAaxuMb9eHfYZj
	07vYXxwS8DCVangA/MNHs9MY3/i9O192FyHuczb3Gc2IV4tPoJeo/uuYQSEC9IzSchpP/cikHgx
	dZCdNuEKrvPgJhpAox3Emj/yYTLVu37gw1YVf3D7t0NX5v8mZf2PSIaeZtncPF3bKBjHnsD3wOt
	/HjcKWNxkwHgLcRbmZEOUvim3uDYvWhhoINRoPXTS12ox+6j2s+tZyN09jnVc4TCyA==
X-Received: by 2002:a05:620a:6011:b0:7c7:a574:c0ac with SMTP id af79cd13be357-7cd467068d8mr1686219185a.3.1747926322075;
        Thu, 22 May 2025 08:05:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH3db3rmTOKk1hXtFyyRXL3VA6Tyc42dGPU3KuPwTslgSfcNhG3bQxN2FLIoLZavERqIUis6w==
X-Received: by 2002:a05:620a:6011:b0:7c7:a574:c0ac with SMTP id af79cd13be357-7cd467068d8mr1686217385a.3.1747926321731;
        Thu, 22 May 2025 08:05:21 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad5b29fc7d0sm296353766b.94.2025.05.22.08.05.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 08:05:21 -0700 (PDT)
Message-ID: <53e1127d-77fb-4bb7-a125-18d7afc0d843@oss.qualcomm.com>
Date: Thu, 22 May 2025 17:05:19 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm8650: Add support for Oneplus Pad
 Pro (caihong)
To: Pengyu Luo <mitltlatltl@gmail.com>, konrad.dybcio@oss.qualcomm.com
Cc: andersson@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
        konradybcio@kernel.org, krzk+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        robh@kernel.org
References: <e4d65994-89dd-4068-a8db-050e698f9bb3@oss.qualcomm.com>
 <20250521083746.666228-1-mitltlatltl@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250521083746.666228-1-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE1MyBTYWx0ZWRfX16MMGa35RALm
 RLxaEfixnKYsSrKq7qPFDZkv9q9pOqjKlXJMoUl7K7TrhpTytvf1LdPrX1j2/EFo23WKaO9hk/Y
 xav736MkDS6lrtqis9RYk/gfMF5JCYAeTB4ccFyParzshCCD+xjda5daaGfgSbUHvDzr+KoYo8A
 yzVOaVSISMygY2t7zLyW2R0mr7wcTrLTnExw5Tsn/O17pNkRDI1Jl+aqixlGaLzS2OXYhAfbrdx
 6PxnWkdQt3B2kDh7zUCmAZ3zk6btpfj3wcSpfX0e6dgCwGEaMV7TgWXkq9roRvmAIGwHe0CfbUG
 gAQ4po9K0jypV5V7Ad3eI5YzyhUH1dFooF7AJlDpcdqjW5l/FjgeZVPUyRVRT00/Ljj3B6Bbq0L
 NyFmyRAOKhYcpj/EftAUMptuHuVhyzWo3Yq4Yeur944RGBRipXmVgzuLJl214gvVrOdJPVjd
X-Authority-Analysis: v=2.4 cv=RIuzH5i+ c=1 sm=1 tr=0 ts=682f3d33 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=vD8jgx0PVHbVM3FOW20A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: _z4rtiQXs5Lz-7Gyc6ohPtKwkNmRYnNp
X-Proofpoint-GUID: _z4rtiQXs5Lz-7Gyc6ohPtKwkNmRYnNp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_07,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 mlxlogscore=999 spamscore=0 lowpriorityscore=0 mlxscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505220153

On 5/21/25 10:37 AM, Pengyu Luo wrote:
> On Wed, May 21, 2025 at 5:54 AM Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
>> On 5/20/25 6:42 PM, Pengyu Luo wrote:
>>> The OnePlus Pad Pro is an Android tablet based on the Qualcomm SM8650
>>> platform. Its device codename is "caihong". This patch adds an initial
>>> devicetree for basic functionality.

[...]

>>> +&i2c2 {
>>> +     status = "okay";
>>> +
>>> +     /* secondary kinetic,ktz8866@11 */
>>
>> You can describe it, the driver sets some nonzero default brightness
>>
> 
> But the backlight framework won't index them, which causes sysfs
> collision when the second instance is registering.

Have you talked to the backlight maintainers? This shouldn't be too
complex to figure out

Konrad

