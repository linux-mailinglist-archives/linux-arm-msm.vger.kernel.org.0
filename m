Return-Path: <linux-arm-msm+bounces-66312-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AB554B0F402
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 15:31:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C6411C24B04
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 13:31:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EFA02E6112;
	Wed, 23 Jul 2025 13:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UN7ohAC4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C6DD2E54A9
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 13:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753277462; cv=none; b=WWxJevtZLH5S2wzRKz9FRl0gv4AUMVnpaFqLkCiBLid4iBYJcRCmYkXr+gmPbjnotU9I7KpqTKF1Bil3Gwbg9n4ipXR2asnWiArtC/CQYpF8Kk86DSq3OlPw3IiyiN8BDkgXIHtVonXsO/qyoMQwfu8pwo70nvHB9s9X8dGMvUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753277462; c=relaxed/simple;
	bh=EsJ9Yttdjk/WRUeHjLMat6aruQsPF5v/ToVWKIRY9WA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M5k2Sh7iDfMag2U3340VMmZyH7MV4uXa1s+gOLlALB/QJxAvlxLwEUjyupS8zArNKsydtVJzCxtcpGlibUM9PfPFDGS2egs/7HPmkoLpg+0E0NTaRSx8n+Ososz7+3WXblMPdO+sDNxFKQhxeIZ9Ek0D/s+Oauhp+ybfp2XlSIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UN7ohAC4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N9PGuC001802
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 13:30:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pJyi0IIymzYW/6UhzSsrgJXNO2BmqOWGv65j5AI+HXk=; b=UN7ohAC4Vf5Bu3ct
	04dtla9DCHR9OhS0MxGr7e9arNJbWNlmmLUXkuCkC2XmQyfoRdV23gWvvz4f+FZW
	ErDoKo4xgEP9c0piRbPIrt5LX7r5dFonGWGKPIiRC8Zf2tv1S8jegaHp95//gNq7
	7T5qB17S6T/sK1UYCrQkqfMV/ZGnvRF130SX7JaalcJgoOB0VnrTQjBK+vmmQfin
	ru6N/eh/IAI1exsbS/8sWM+oKeSXX4+vMBFrxA4++2OQ5/1Ot3N3jWgB7VbPzHWO
	2B0bCwbEPjj6Ec88AoxD63Zls87U0GFqPsYTRHUwcft2BWxwi4kZXp/aF+3p1f/v
	pdPYLg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48045w3nm2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 13:30:59 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7e33e133f42so33519185a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 06:30:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753277458; x=1753882258;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pJyi0IIymzYW/6UhzSsrgJXNO2BmqOWGv65j5AI+HXk=;
        b=P5c1XuNvMK4FMSKArqqvIIGFxJlYEPgBaRYIPmwzpAYWvXtfV+0+/wEXZS2suFLO/v
         4kIKam0aiaWcs7iBxR2EIXJOPoSjKJWfUbcFgP/3oT0Kn4fy3X2aU2A1msps6DtcYTGU
         HAr53p4bnHtotyR8sRKOdIUHe1gXjKzBh7xsC6BW4R/ShGjy3WMyiFGV47NgtPB5wORA
         k+acx2ju/HIgcA3Bgx4dUwXxkvxnFJLmD3AHGxjpQO3oPA9ozpze+FglNWVutAvN9DoN
         F4Pz3ePSGNZ14uJdOTD/qBJU+WGD9gdaGX3rvp08ERYM7LcbeXX11XhAwcwxswfS6YLT
         X4JA==
X-Forwarded-Encrypted: i=1; AJvYcCUus3xsO0R8ey8ApXsygcDNKKndAWNK6kWg3tkDwi1/Ys4UVwTh7sJMZt1LnJKgOYHe3Flm2QXJ5iFcthN6@vger.kernel.org
X-Gm-Message-State: AOJu0YwtLs1dv/gBC0/SG0cd8JeEVJNjAQeLZ4+NnZvz6UqAdewiJ/Nt
	RvmqTxppcnRpleGZYpE7RKCRnTySrdrDJz2CASx+asW0MzYMKXXw1kMNGlSzVkBmhwGKdr/Fcqd
	KYB147/uhiqxaV8w/JqikyqY8SaaIOc5X06SlMKs0L+NC1qGiZ4q7AreuCiQpzgCNpfZ2
X-Gm-Gg: ASbGncvtXta4zHoTrP+qNteeODr3MZWx3txspOHtzL6pItKqzrj2C3io6Ivk+Prst2M
	hQdnFXTtSJCw0NX7narXZcnMs4JfN5nXHnKrphpkFNC3TiNMT4DrFR8AAJ5YEwtAE4itsOwYRi1
	M7Bw151a2EuvMfuNau+053KpqOXrZMCtIoYe2U5ezyckSGBTbk6XuPks6Q1zcsflpTQ7LSjw0GO
	RBaeFNxXUzNfPxjx7LthOBurAZCuCFVmTeVEcd23IItdi6epuQhcPDSJvr9ibup+sxEFRrh4c/f
	QCg6GMHs0TbcK3EMOsunB4+tqlb7ZhxzQxO58eLpBR/h7XhKT1Z32wzuGy2DqPGlksKeEECVH5j
	YiCpOYhE0Pzscxn0yww==
X-Received: by 2002:a05:620a:9633:b0:7e3:3029:44c with SMTP id af79cd13be357-7e62a112c00mr131774885a.7.1753277458148;
        Wed, 23 Jul 2025 06:30:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEoN9KlCmUdoNJ5eN9OsT3DyPSLXqMvOlWulVwgaFKPCWWpNreyCerv7PTLgQDFAM+oBFUZTg==
X-Received: by 2002:a05:620a:9633:b0:7e3:3029:44c with SMTP id af79cd13be357-7e62a112c00mr131772785a.7.1753277457457;
        Wed, 23 Jul 2025 06:30:57 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6c7d55c1sm1056237866b.41.2025.07.23.06.30.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jul 2025 06:30:56 -0700 (PDT)
Message-ID: <ffac121b-ba15-4384-8961-2661f9748d2f@oss.qualcomm.com>
Date: Wed, 23 Jul 2025 15:30:54 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: venus: pm_helpers: add fallback for the opp-table
To: Renjiang Han <quic_renjiang@quicinc.com>, quic_qiweil@quicinc.com,
        quic_wangaow@quicinc.com, Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250723-fallback_of_opp_table-v1-1-20a6277fdded@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250723-fallback_of_opp_table-v1-1-20a6277fdded@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LL1mQIW9 c=1 sm=1 tr=0 ts=6880e413 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=iWKRvkjQqEvONqlByQsA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: y3Ppg0DRUmFNyMeaTlPreIktP91GH0yk
X-Proofpoint-ORIG-GUID: y3Ppg0DRUmFNyMeaTlPreIktP91GH0yk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDExNiBTYWx0ZWRfX4ck84MpwmDh/
 /2+CLDe56cQtKk6K/e5n3nVmSAGw8IsOUfnv1sNZe7VsDaDks51OzV3wnJFSRQGa8EGru0s0ObU
 EeiCaB4CpVMjsy3NZBO+S6MdJpgDt6v2MSi4ft8+kLcbk+V0u9Emh0wsbIc6YgKwQCHTlsuHXX1
 fNh3WcRhJIRvB7PuNv2Ff6QkbI0MFGx0kJwX9eVY/qXhjJ2VCKe7ow0wLlt/52f601s9y2aiVy6
 vYhWvTQoJPhR+rQ64zwZb//A53P3KKjMl6muLOztScooZ5jSphht3cyRMvm+3IyIM4AO9nmT1/O
 sJq+/3FflcuRSh6OOJJjGSKZ7aDbhDtJDuMqlJAY/0IHo/wGYeYuSasSV845C2JwO7oC+dCQJWx
 Ly5nw7D6J/53pBTYcNc7zGGLbO+GWj/BdCn8mh8SjpYm23NdJ+z6A+FE6dj6eRgamViXdIdJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_02,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxlogscore=999 clxscore=1015 mlxscore=0 adultscore=0
 suspectscore=0 spamscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507230116

On 7/23/25 2:56 PM, Renjiang Han wrote:
> Since the device trees for both HFI_VERSION_1XX and HFI_VERSION_3XX
> do not include an opp-table and have not configured opp-pmdomain, they
> still need to use the frequencies defined in the driver's freq_tbl.
> 
> Both core_power_v1 and core_power_v4 functions require core_clks_enable
> function during POWER_ON. Therefore, in the core_clks_enable function,
> if calling dev_pm_opp_find_freq_ceil to obtain the frequency fails,
> it needs to fall back to the freq_tbl to retrieve the frequency.
> 
> Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
> ---
> Since device trees for both HFI_VERSION_1XX and HFI_VERSION_3XX do not
> contain an opp-table and have not configured opp-pmdomain, they still
> need to use the frequencies defined in the driver's freq_tbl.
> 
> Therefore, if calling dev_pm_opp_find_freq_ceil to obtain the frequency
> fails in the core_clks_enable, it needs to fall back to the freq_tbl to
> retrieve the frequency.
> 
> Validated this series on QCS615 and msm8916.
> ---

This is not a proper fix, the logic you added in core_get_v4() should
be moved to a common handler

Konrad

