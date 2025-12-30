Return-Path: <linux-arm-msm+bounces-86978-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C6931CE9C9D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 14:28:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5D5093016DF1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 13:28:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 678EA2309B9;
	Tue, 30 Dec 2025 13:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X5kob5xb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OvUU+Zw4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1DD41DE8A4
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 13:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767101333; cv=none; b=Np0BHqqzkvK8zg3QTAsmSMkx+mvi+UNlSHrTwVa39sC6dHZ4B+Atwx4OFOlbU/s55tNnSW0WEmRm8SRaGNgWR3MuYYbZHH5h0zXmIhz1+NAhhj700ha5gOafE1hR6mAprO5qP+O+zawHbgwDK3S788KhqGduEQOLfssv33F1DqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767101333; c=relaxed/simple;
	bh=gCE9g7o9NshJ8d3/8lbuNSi3lr3Q2YYPLKNEMOGnsSE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BfzZXZ3SzU623KLcNv/93WWsVhFILAl1WcJtS3Rw8FNWxJeRnVQMCumiFSXGaTgWe6M7dCIv5X3HVS+zKgC5Alkf//PEgF1EsHrT7DGFKm7WyqUh0qfVmyWybqEEDX0YpmIHfkt4nTejTV3VKqyT3SUGIIl1IueqWt1lmGYrZnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X5kob5xb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OvUU+Zw4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BU5SIFo900395
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 13:28:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SbPCrSTHdAIMNZfqnVN4Vn/bScRCYxDUiISVKD+AQEI=; b=X5kob5xb94UNZrZp
	SCqw6yb08ARzaMl3g4Yznm/uhr+bDna117Rh6Sg5kqHc8m+/+LXEo2/PIBAXQKj2
	NZkKO7EnRIDFGPDvfJiqojA8hEvWdLA5d3SpfX2Y2ufJKQVYcbgBfQDCGupZRVXg
	jwUW7xqmlRzWMX+8FZazdNxw2XICaZLH5K8TIuOt48FokmN3AIcgWHdhlXGF1pED
	2F3P6loAlKEdRUlvLOpy5Q/strGjTGMpuZGT8SxJZa9cuzd7DOftpLbN9F1Q9Exf
	FpAtg2qsub+b3gah2zquzpsvJh7/ZWT9KTSUqPdyehNyB/jugMGBeN2Safdoxhpb
	ebe8yw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc8ky11qv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 13:28:50 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4f357ab5757so45062741cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 05:28:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767101330; x=1767706130; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SbPCrSTHdAIMNZfqnVN4Vn/bScRCYxDUiISVKD+AQEI=;
        b=OvUU+Zw4ikJwU9S9lNRAnQQ8U2HiBGOyGhwZ3Zul0bKz0tVJof6oYw2ZXV3dNQKsZB
         V/aq478TR9mffTq0E8Gk++DTNV+6zgJsynIzVzz8CjJjQA6WbNqPiQPbUg/8t9TxhVhA
         B+nW6RDy3e/O4aX/QcAdFu49FQUaJDXPP5Bz4a4kVi/BtI4apqpnf3PT6K2JV1+FzBZv
         Zm+CoK1ka9Y6FlXIFuipRpNWorFmv0jmmfgRWCM++wHp1hG5HiGbsACQ5EoZvxGCoGy1
         m7N0mgFixX398RW8rxweX3U+dsQFTtXjKNCafYSsflnSKiOyHxbODBHcWxS/7Pe/6gMl
         5cLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767101330; x=1767706130;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SbPCrSTHdAIMNZfqnVN4Vn/bScRCYxDUiISVKD+AQEI=;
        b=Yte/eF70X74OJbiQ2YJTl+am0AKOGCH6jxq4NxlSBY9D14CHXjEABh30vw6+CdeK+r
         aThMUzYIFA6ibKNIGNfHDzq/sfXr3hj4va9EEERyrY9VmP6Le8a2jXWK/hIXFnJwHjIH
         dcoRMmsQGUM+2M4jeYjPJbkbG1cGCv8acEAcZqkSgDCnZmBVdUIzknBvPtMleSLmKIBf
         W6v9jSY1g7qEZ8MqRirfI7yO+DgTL8fQ/9sZm9IG2yxhhFFwJvJAEdeRz9ZM5e1ieuo0
         Li+1cyBUn5bS2/GWKx+DKTu+p+soWMn/QhdeJUseiU3ZChgstoKKKcAjIGxFeoxUFRbu
         pOKQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7pZ7gYkvvOJeqWQzlEmRT7605T1RbuaSAYjqCj+n+ayUzC2o33HUwywh4vaZ8C/q+Bf5IEM5000uhmqPj@vger.kernel.org
X-Gm-Message-State: AOJu0YxOQrURxvpb43S53fr3aEDTqxj8IOJba2vn1KfrMWIT5Qxp/5TT
	G/nUoOU11E2/uIxagoB3iCOGnYY5A+EBoxArNiTfOdQg9sfxPuVlaRKVcZsutSPqJLh80j3h70U
	YeWE1+emhwudXeYajhzLJ8VmZIt338Y7uKVjhEzPBImFIiS8tnTN7/tfiDNATZLIhEOM0
X-Gm-Gg: AY/fxX4b2k1iRELE3e4ZATzWGrls6yH51TyvpUqHEM0nww01WVwwTbcz/vD4XH0uxtr
	MY0WDDueRQXB1BuMaNi7EXAtQKPt8RXi6JmAvs8C1G5/ozD+Ld3y8by4wP0YSpzhdKoaodO/m7z
	0fwDoKBww7cWhPIdD8FonOjRZGk6A67Pvn7NZSwAv7j+kWaZwH32//aoZMKGgyT9RZ5PujyJ4TU
	0RXOHrqTmZpSpklnghFIxErit5pF+ZEbXmoFCPFXQarpBpiDNbR3IICE79kjfx3VC0GojejNMWq
	D6MAZ0eElnPQHXXfR2geKkgOzQO7ifuvDWKx18ChMpCHK+qwCMeVrLOrfaq+szel+IdTVwZGTdo
	YvH5oNP78FMT6tImULLbCLWXqsTapP8VW/Zb1aFj4PuIbRWFQqSemV2WMkMRvVy0VNQ==
X-Received: by 2002:a05:622a:241:b0:4f3:6170:26f4 with SMTP id d75a77b69052e-4f4abbc06ddmr358865191cf.0.1767101329751;
        Tue, 30 Dec 2025 05:28:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGDF3yEn4U8C4OQp+pO5mkvPfTN8DijTooC3QyATKwQ9+kddc49uVi89CloOxfApcHCZh7uHQ==
X-Received: by 2002:a05:622a:241:b0:4f3:6170:26f4 with SMTP id d75a77b69052e-4f4abbc06ddmr358864901cf.0.1767101329256;
        Tue, 30 Dec 2025 05:28:49 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f512e3sm3630116366b.67.2025.12.30.05.28.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Dec 2025 05:28:48 -0800 (PST)
Message-ID: <027c3ba9-70bc-4c03-ac7c-07c7a8a865e7@oss.qualcomm.com>
Date: Tue, 30 Dec 2025 14:28:46 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/4] misc: fastrpc: Replace hardcoded ctxid mask with
 GENMASK
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, srini@kernel.org,
        linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de,
        dmitry.baryshkov@oss.qualcomm.com
References: <20251230062831.1195116-1-ekansh.gupta@oss.qualcomm.com>
 <20251230062831.1195116-3-ekansh.gupta@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251230062831.1195116-3-ekansh.gupta@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDEyMSBTYWx0ZWRfX7sK7zT59nRPr
 Aa9dQc4UNqIsndk8NT2H+yrGHBEqhsRKL1GF2BulHK7Zz0m9qAPbaBV+raT7VHVF98vDA7tJjvv
 ca9CR9F0jgXd062JsQImL+FMYWkI2AoFuoYL0wfPuXZuV/Xu70eTpQKciFnHnaRSNVV/q1tFPoj
 B1+bkfqDiBfHAvmgue+BzbsZw0fbF0oqb+lQytzMImM+9gDnU/A/78Tz+81AYF09ufFyi20AieC
 5nms8uRU0aso0RSU7MWtR1KAspOm2MfB42eIRtMkSzB147pb23FEqZSAioIXX20vuFPF3KfNnNK
 VFwJ8naDHfi+6uk4Kbt804Df4UyTCQ9mHAVarsX9YaytMuT3RkIK1dsXnYSvQCDkWNummlJEItd
 4J1ZEaNFxtOCIFs4094LqfkWUE73a55Jk1BHVngZR0Aa9Xs2eLuMX1CQSGihVF0asiwEvgrx5VW
 SQ24rA5REB9d/mg0xmw==
X-Proofpoint-ORIG-GUID: io9DeIdvt2AsNO-8OF7MKdhWU3UFAdfu
X-Authority-Analysis: v=2.4 cv=BuuQAIX5 c=1 sm=1 tr=0 ts=6953d392 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=WZKhdRBjRjmf9s70GbYA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: io9DeIdvt2AsNO-8OF7MKdhWU3UFAdfu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-30_01,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512300121

On 12/30/25 7:28 AM, Ekansh Gupta wrote:
> Replace the hardcoded context ID mask (0xFF0) with GENMASK(11, 4) to
> improve readability and follow kernel bitfield conventions. Use
> FIELD_PREP and FIELD_GET instead of manual shifts for setting and
> extracting ctxid values.
> 
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 679cd8997a00..f7fb44a8e9c0 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -22,6 +22,7 @@
>  #include <linux/firmware/qcom/qcom_scm.h>
>  #include <uapi/misc/fastrpc.h>
>  #include <linux/of_reserved_mem.h>
> +#include <linux/bitfield.h>

nit: these are best when sorted

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

