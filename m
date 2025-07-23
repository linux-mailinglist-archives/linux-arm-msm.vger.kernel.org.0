Return-Path: <linux-arm-msm+bounces-66314-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C12AFB0F40B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 15:32:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8A16B1C24B88
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 13:33:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E14B2E7192;
	Wed, 23 Jul 2025 13:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BZZFAwk9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F3A2E7196
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 13:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753277572; cv=none; b=IKoC5/KqhB0ufzxqKZTlgqUbmC5FEUVXNtpxIcuIt7vFBkcI7B8It2dwoEptIUurdVsmVPBu7ZxNXTDA+Dw9KWx94HP2abB1mXrS5HYlsyK5DsZs1t/7VPAB4uxu/ufvilyRcZIpy93//M7RHjcYXNmcogzBi9vWvfWlFhDaoz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753277572; c=relaxed/simple;
	bh=2o+FXdT30xXgM0glTbZ0pQJ0LGMm8P3vxwge4l4APfc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=oDPo2LEVwwnbe/URomtdP7Z7/+tC+WIwph9+iKaYL35w2t6uRogfTXMpBrqfj4Y7JsimeUl3hxCdcYD6wnEtPrVpclxnYyzIRybD/KWrWAPeRu+IlxJoyQ76NFKRVeC0vXSW7Gulq4bw1rM2uqFfJgZJaFcQQ4KQnq6EK/xApTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BZZFAwk9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N9MPL7030783
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 13:32:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	912BbCs1duhO3s+V1a0ndyvsqj38sc4RhanjQ0G1f2o=; b=BZZFAwk9a+7H7qk1
	xMP0ZOEsX2ncf5QA3GkO+DoheS8p/Xon/reY1Da/eshXSFLWxcUt/OV/lizGLGeo
	E54qnYe6YTmsoqmyTu5fHAQeFGYATat9arSgBrxEuMQzNj2jmQCEjTuDyVQVtCJt
	BvsQmtgta2Tt9ZXnR2UDVPD5Cx0sNL/MPeTPNgMqXgF8RYKawsVzgK+WEdPeMVtY
	HTmy01R00AVhERjCW0mfCcZmvcRmTb7Naxakf7K3wuo7wsiLvun8nmZwHTkIBhOK
	FcQZMm3V2Vnwr4773TbGHi7R+xN99N1IhQOnpNvK6UHaCERkfgZfdwMxzX64F7vJ
	9AsqiA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048s5a0s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 13:32:49 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6fabbaa1937so14347406d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 06:32:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753277569; x=1753882369;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=912BbCs1duhO3s+V1a0ndyvsqj38sc4RhanjQ0G1f2o=;
        b=PLGYOmJnMK4oZGXOOHSWckCwLAyeNQA7jWZ/az7F4fw1OA8zSv6WSjt4DRi+/50r0i
         xLClFDSZgGKJAOEEHxB5y3UvdUfrxzW/vbY+YUIXjhGvk7jj+eb5ZxBbJJ5uNP87vyT0
         xFGAnQWqJrdh9eFYUAf7rDuR30JmynlAJ8tIYQiGGFiSGikaBAYb+vsHTmn/z3Ot9jH9
         huiahRIqUmch2w1PNgsPHLH8a86ruzVZMXhvpZlqS4kC4CoYS9xp8hHNruULD2cPgc4p
         Cs8mcuOTfGOvReuqLYVHBLbgiVR/XfGv2q4XJfpwKGFxv4wMXhGqFpJhIIFbJ2fZTwyD
         Dtdg==
X-Forwarded-Encrypted: i=1; AJvYcCX2ao4fCD62hL7TT/i7d/O517vit8ek5SPkCpG5/6ZQrntz7qVX8zSnx8zUvk2ktk8UHhCWQs4LtC/Fd+iu@vger.kernel.org
X-Gm-Message-State: AOJu0YxxXR3fWzM2pKIDAKTnLEhdk+sxwu8goGhh5f5/qEVJyYAoW5SK
	C4ZC/xCdtnvCs8W+p1v5zTVC+iy3Hh5GIUQgnYrUfBCqA28DLQZqORRoRJPUOyxYMu6XC+Gqt+p
	LOORduXNVP7C2ip+GnFm4TWBST8qTm3lv2RGj4wVSjeC6SQI9OeOof4bGy9UKm7gflNn7
X-Gm-Gg: ASbGncsCJcXz6OPPLY97bRyRpQQXlSgotW/qRwdBAZohDbSYjhn8YCaoTkeE5kDkpZd
	bvbN5FaZLgAUDxuI9ZWgdrVL2/KUL+DVs9+Ikr04+3Jfq+2gti0U5ka/LKpiuryHWdBUb8yxDL2
	Sv3xMV9REFicaJ93dls6t1iY6iV5nK0lp6YpWf4ZeYnDHc9oAWsGDwbNvI6jx9muRdjKIeZpNzZ
	37+26UsL0h//kSVASPw55doHY9N4bTXNOAJEeRg5e48AqLQjb0GgKgjnxOArhkFaBkQaQZgC8eO
	wJ0XcdC2m0d6kjmY+mgHT5SK4j0dz8LTJddZWwuAchqzfBHxXdGTqfmsoRmogCQ6h0GO7yVcGcU
	0Hbq9sccFoQxbnt/i/Q==
X-Received: by 2002:a05:620a:48e:b0:7e3:3c61:564a with SMTP id af79cd13be357-7e62a1da96amr124515685a.13.1753277568631;
        Wed, 23 Jul 2025 06:32:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExUeU5pu5DYMS+wgbInyCg7rQVUxQG2KcGpfh8b1CBhLL7zRzD/MTKzrABkk8bm84AzEwg6A==
X-Received: by 2002:a05:620a:48e:b0:7e3:3c61:564a with SMTP id af79cd13be357-7e62a1da96amr124513785a.13.1753277567973;
        Wed, 23 Jul 2025 06:32:47 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6cad64f0sm1048517666b.148.2025.07.23.06.32.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jul 2025 06:32:47 -0700 (PDT)
Message-ID: <4b8e0bd3-612a-4ef9-a844-08791ed1b8d0@oss.qualcomm.com>
Date: Wed, 23 Jul 2025 15:32:45 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: venus: pm_helpers: add fallback for the opp-table
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
To: Renjiang Han <quic_renjiang@quicinc.com>, quic_qiweil@quicinc.com,
        quic_wangaow@quicinc.com, Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250723-fallback_of_opp_table-v1-1-20a6277fdded@quicinc.com>
 <ffac121b-ba15-4384-8961-2661f9748d2f@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <ffac121b-ba15-4384-8961-2661f9748d2f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDExNiBTYWx0ZWRfXwiY4uwXoxt2N
 fbN3ZbAUpdw31ViC96b29Z4cKg3TdEGlZCp6Kwy/qOmADoQ6mwMGTc0x7pdYTAM2CD17LA04Z9k
 34TIJS8PdoI7QRAu5gkL1vQCvP9MmkPn6r9eiVWotQ8K4FtaUnjf/xDRRKGqRkDLmG+qF98v4Fp
 JoutfsfyUU7Hz7TnqTpN/LGBpTY8a11FOG7aAknDPjKA8CBUdUSJvXbSOQdWN+1yy6e50AMQGIS
 EyxzMhxR3+wkYVpe22pFZ/+R9Zmon1zt2Fio8QHxE8nqs2NiaR6DtmCGzgO2gyk+Sc72qhO23mL
 TnftR5MDOTCRetI3fD7aUsjXG4mhqs08aW4uuXiv+y8rb2B2ErRpBnpGkufQCpO9bRMbWAedfAi
 +Om2uQuOQRFEf8f12fl5ZTXCZOmxd+MeFLz5MGRKYPnS6tpYTu46wNv4w+NG4rcTyGPqNohL
X-Proofpoint-ORIG-GUID: NcxrAGxnMO2Rtx4BXdD_eoPNw30RIr5Q
X-Proofpoint-GUID: NcxrAGxnMO2Rtx4BXdD_eoPNw30RIr5Q
X-Authority-Analysis: v=2.4 cv=OPUn3TaB c=1 sm=1 tr=0 ts=6880e481 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=Gq9SLu5374Em_OP27MgA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_02,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 mlxlogscore=999 lowpriorityscore=0 suspectscore=0
 spamscore=0 mlxscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230116

On 7/23/25 3:30 PM, Konrad Dybcio wrote:
> On 7/23/25 2:56 PM, Renjiang Han wrote:
>> Since the device trees for both HFI_VERSION_1XX and HFI_VERSION_3XX
>> do not include an opp-table and have not configured opp-pmdomain, they
>> still need to use the frequencies defined in the driver's freq_tbl.
>>
>> Both core_power_v1 and core_power_v4 functions require core_clks_enable
>> function during POWER_ON. Therefore, in the core_clks_enable function,
>> if calling dev_pm_opp_find_freq_ceil to obtain the frequency fails,
>> it needs to fall back to the freq_tbl to retrieve the frequency.
>>
>> Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
>> ---
>> Since device trees for both HFI_VERSION_1XX and HFI_VERSION_3XX do not
>> contain an opp-table and have not configured opp-pmdomain, they still
>> need to use the frequencies defined in the driver's freq_tbl.
>>
>> Therefore, if calling dev_pm_opp_find_freq_ceil to obtain the frequency
>> fails in the core_clks_enable, it needs to fall back to the freq_tbl to
>> retrieve the frequency.
>>
>> Validated this series on QCS615 and msm8916.
>> ---
> 
> This is not a proper fix, the logic you added in core_get_v4() should
> be moved to a common handler

Well, it is a proper fix in the sense that it makes things work, but
you're expanding the delta between the power handling across generations,
even though it's almost the same.. I submitted a series to clean it up
once, but it didn't go anywhere

https://lore.kernel.org/linux-arm-msm/20230911-topic-mars-v3-0-79f23b81c261@linaro.org/

Konrad

