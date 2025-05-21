Return-Path: <linux-arm-msm+bounces-58962-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E83ABFF2F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 23:53:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7FDE11BA79E5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 21:53:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20ED7239570;
	Wed, 21 May 2025 21:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kt2v5Unu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A8F22B9A9
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 21:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747864396; cv=none; b=twTB4p2lF+HW+O3eq1UNSMh3kh3ZLOiwOMfHzYt6jyKyWg4iLiplWSnNRVkAUyazaqR+6otXwKKY8zR4O5ZPLVA7WXXzWMuqxflt41wyCKwF9l7xeZlNH7DMuLvLNxJ/7kwnxF99x5OR++HCvPFFz6r1zD13CRLe+7xOP9F5TBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747864396; c=relaxed/simple;
	bh=BvIsBbwn0SKcvYkOO338WYpFgAmu5GvxT3H9FH1mRVc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rKqqHN005IvP9Z3dpxCOydtp90AjHH6ti5iuSc+7spuAyYJ7hiduSGNbpG6AptgVtRjSNkhZsRx11G/vWoS8ptywC6g+NrOHbQ9B8Mnm+Fdu70pHAzg2tZfQuEaTnF97mKvypT4Qe5bUjJNUn2nhyKr3C4Dsw9CQsiAwOfHrZvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kt2v5Unu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54LI4dPM006603
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 21:53:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r8+jvNPvz+gKJvrG+VMFVXzwjJgRjgR2KNGBsLzgH4E=; b=Kt2v5UnuN2VKv8Tp
	yOb9KGlmvOjkKdhjYysv7t1ruJO3/lFqMcDxC/kdU8dISYVRpSEIYR6P7fHJL29C
	qIM+sMJ3SucL+Se/S/kKhsYf6bKx4ApScSRvTrJG7FAZd4tWGrG/qOTMzlbiMVqY
	COCfsvfFcOlEIV1+x+kx2+hWaKXlSrJfsjYZQw2Owj/Y2FtSyIe++Zxrbui3dy2x
	W/QEOdJAJ1FjvMrz41edgr2IRGxsrxzrGa0m96wQLySkq2TroB6HA5NYoOAYjW6Q
	dCHkMsMxm0BqBilcY3xALjz+y8l+cA8yXgNBW5NI2jAS6VWtskKNuQxslxO8oJOR
	vykdZA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf0mbvg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 21:53:12 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5af539464so204697285a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 14:53:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747864391; x=1748469191;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r8+jvNPvz+gKJvrG+VMFVXzwjJgRjgR2KNGBsLzgH4E=;
        b=RyOvzXmTh5hCudDRfWGemNQs0qZGNmuGfTA1Kh99E0UcZeH3//6ggSZfI444fnMQr4
         tQjlpxyeBTGoZBarzzlhDZJmG8V0FstW8nLsk1WoTqrNrKCr3YdgQt121XuMj0ym4Egu
         Cxodkv++hKP6xScmJ68KXf0yOSSoUiXngqkiMCxH7S8V/F021cQWKpGo2cZoXCFOPsdH
         lZjzCzsJyKQG0mTPlrPESMA7ayWdgBdVVBvc4JnX4A2SL/qJ6sHK3Tr72mJb4O6pNpa0
         5UDb+CPi92papiAJt0TcgJlQiXv1zyYtYEETJ1kIODkxb3OW73L7oXmXeci8gIivdqlS
         k4qA==
X-Forwarded-Encrypted: i=1; AJvYcCVgAt7Lh8RXO7jKuUV4EcJ6yDCBpfzus+67pf4TMJ8Fh4WyuYOPEJJWlc+jAD3TgGpHcIfYtBAoh7+dL5jc@vger.kernel.org
X-Gm-Message-State: AOJu0YwXw3S4xGV+yBv0QQwTRO5Pb1T4jXqUZYMvJHDWCyAbTLuUAy4A
	Qkm7S/4nwxZxEo5Llrp4mdLljZyZY0bVxUf2kVghu39zKoOMIR7mabmQMFilkZuWiX07Hi0y2bc
	0avEur7UxeVZbr8exKdscKcuMYX73HgbdSPQmtqWzIxe5zqL/AGxIWaNN4pBByKCDGAc8
X-Gm-Gg: ASbGncti8lDoqkywCgWsAvbvpzeAkf+aGGQnr6yhtoVX4mx2xdN0Slp/mwdhvUpzdeZ
	WpODVX2Zd3h9QCv+xQpJ0LC3EqRJtfuBPeve/Psa+GHkYTSeho5e2L1afr/FrYS51IsAfhVlAQW
	pOtwuwuQ+n4usBUUnhru51p7p+i+RywZUEySOkS/jWu2UkWNp+GGwWRNCQLpSpT4Kg1TP951EUH
	AuOV+UwYaEjIg928o2la6dV8bnwpHeOE6npHkUSuP7ebpWs5wiQ8i6flU8CS+hlAfTP7J1KMhlF
	QJpWePF7Qm2HH3w0ohwcdea3WMeYOewN+p8AQ9HiGt//I/2s9QEHXIf+8Mt95kpCng==
X-Received: by 2002:a05:620a:6202:b0:7cd:4a08:ea12 with SMTP id af79cd13be357-7cd4a08ee21mr955948685a.0.1747864391090;
        Wed, 21 May 2025 14:53:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZErIhRYY6jF+JvSB4t+dlNMKFZObvQZFGcRiUHU3xjKYKiQb8V70t/qYNriwOJKByWmXCFw==
X-Received: by 2002:a05:620a:6202:b0:7cd:4a08:ea12 with SMTP id af79cd13be357-7cd4a08ee21mr955947085a.0.1747864390697;
        Wed, 21 May 2025 14:53:10 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d438c10sm968332266b.101.2025.05.21.14.53.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 14:53:10 -0700 (PDT)
Message-ID: <fc6f2ac6-c6a5-4661-b5c5-e1cc75a7d955@oss.qualcomm.com>
Date: Wed, 21 May 2025 23:53:07 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] soc: qcom: qcom_stats: Add QMP support for syncing
 ddr stats
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Doug Anderson <dianders@chromium.org>
References: <20250521-ddr_stats_-v2-0-2c54ea4fc071@oss.qualcomm.com>
 <20250521-ddr_stats_-v2-2-2c54ea4fc071@oss.qualcomm.com>
 <jl4g7mutb65ifxuv3covropjntziv5enxyc3lgz2fi7ddu64bd@e726p6by3vfh>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <jl4g7mutb65ifxuv3covropjntziv5enxyc3lgz2fi7ddu64bd@e726p6by3vfh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 7Xt2kXHkkNCtSobM6Brk79y2xKDHIfdS
X-Authority-Analysis: v=2.4 cv=J/Sq7BnS c=1 sm=1 tr=0 ts=682e4b48 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=ARcffcqOct04O5k4gLUA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 7Xt2kXHkkNCtSobM6Brk79y2xKDHIfdS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDIxNyBTYWx0ZWRfX5IV2L9hmjIBq
 6VblDbszwtkzMbQiif+lIIjLzuMTnJOO0cwmMLE4LfMuIwV0nahUwMsTMnSWbu0djzoOBcR58po
 CUE1e5RwcaaqZajvUIdbibawyFOguxVEAAV2OOLr8C7rh1hUeztNgss3yOhrx9g63edzKUCA8lt
 Rl4QBnc5Yw5wxzpTRZ0TDpSJ24i2PoNSJOhdY/85I+mHxKx9LuMRX9fb3S25ICtHguDM/DEBSvc
 K4ZTUbhbCjCo3gL4dKtOxTbCuPeUhlf2ZQTHZmHLpWIVKaVoVljpbaOSz9lHt5NKYaHBK1XiQHM
 7NlLbagsWCEr0nA9RwD7a3MGJodw770JyNvW2nTXYz6Zu2cO/hiYcEYW6fu91NvQiXEuLJ9DTtR
 eRL7unFVhy6ewqfmvWamUquzWH5j7XlMk37qhSo+yciAzoS/w0OcN3JFUYjpRUFI6YpsIGzG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_07,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 mlxlogscore=999 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505210217

On 5/21/25 2:52 PM, Dmitry Baryshkov wrote:
> On Wed, May 21, 2025 at 02:02:11PM +0530, Maulik Shah wrote:
>> Recent SoCs (SM8450 onwards) require QMP command to be sent before reading
>> ddr stats. The duration field of ddr stats will get populated only if QMP
>> command is sent.
>>
>> Add support to send ddr stats freqsync QMP command.
>>
>> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
>> ---
>>  drivers/soc/qcom/qcom_stats.c | 29 ++++++++++++++++++++++++++++-
>>  1 file changed, 28 insertions(+), 1 deletion(-)
>>
>> @@ -310,6 +329,14 @@ static int qcom_stats_probe(struct platform_device *pdev)
>>  	qcom_create_subsystem_stat_files(root, config);
>>  	qcom_create_soc_sleep_stat_files(root, reg, d, config);
>>  	qcom_create_ddr_stat_files(root, reg, config);
>> +	/*
>> +	 * QMP is used for DDR stats syncing to MSG RAM for recent SoCs (SM8450 onwards).
>> +	 * The prior SoCs do not need QMP handle as the required stats are already present
>> +	 * in MSG RAM, provided the DDR_STATS_MAGIC_KEY matches.
>> +	 */
>> +	qcom_stats_qmp = qmp_get(&pdev->dev);
>> +	if (IS_ERR(qcom_stats_qmp))
>> +		qcom_stats_qmp = NULL;
> 
> Don't we need to handle QMP being not probed _yet_? In other words,
> there are several distinct cases:
> 
> - No QMP defined, proceed without it
> - QMP defined, not probed yet, return -EPROBE_DEFER here
> - QMP defined, qmp_get() returns an error, return that error code
> - QMP defined, qmp_get() returned valid pointer, proceed with using it.

I was thinking we could get rid of the qcom,qmp get-by-phandle mess
and replace it with a single static global instance.. But it's hard
to determine from the aossqmp driver whether we should ever expect
it to come up. A sufficient discriminator is "is_rpmh", but I'm not
sure we can rely on e.g. cmd_db_ready() to get an answer

Konrad

