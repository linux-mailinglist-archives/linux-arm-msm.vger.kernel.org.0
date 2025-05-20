Return-Path: <linux-arm-msm+bounces-58688-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D12EAABD406
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 11:59:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CFFFC1B644BE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 09:59:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 088AC269B03;
	Tue, 20 May 2025 09:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VhBsdHFJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FCD3267F55
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 09:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747735173; cv=none; b=GzvXP3qjirskmpAoWLe7v3yOt69S6bbTMjJhL9HA1XGFTJ/FvdqMUG6lH5TO++6CfvpHK5oiV4xsne2eekWl45c96uDOIaHCPhQ26CiU5XhrkDyhAl8EvoL54YQ2mOSK86eOLmp4jrqoYD/fD9sCsrf2v+jnxAsHL27/T7MER6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747735173; c=relaxed/simple;
	bh=lH7x/Wo0CZ05NHk7+smtqoWoLqjABA8L5UWZE3AonbY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=iF5RMFNXaZXkosAQskR5Eb25wHQnKLTSQ+lGrwnqNngi1jSmuAyJI5TeINvG6R8nhJdQDz5OBpCqCz9KCopbedVf++Kjou/R+FNAEAZl9WGfbiXPqCQQuJEuUFhpRft5/ESOU1gaD7HBE271NUw5kOFH2+eV0DGdAEydEKC+XLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VhBsdHFJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54K4Koho021371
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 09:59:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jv3cua+BYR/31GrwxUJ8YoNbjglNl0IAz5i1xrlz600=; b=VhBsdHFJc68jk8CB
	S7abyPgti+NGobuuwFsxEsvmQm9ceXRyA36xP5ybK8FXjuo/jLTnunnuNWZNvVhK
	gdvLV91YEVUU960e+Z540NRzrcPP/E3GomdQuBqHWrDyN3P+KgZkO5EzDsB/fgT1
	7BHEkHcdkJMWEcq5Yc+mSS/ba6kJzCrfvpO2n0PMVahsmBij/xQ3g/BjredQx18f
	2UaHGjzZJfyHqsE6pAfdKSKp2M0ZUVDOAEiSRrIsVMOePP2z1+2/CKKgLVIKvkd9
	HDWCSyKfCMMozXC5W4EFqff++I1Wr72MJjfylYyFfEw/PLvdEyUJZh14I0XEgYgH
	p6geOg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46r6vytk9w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 09:59:31 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b26f30486f0so4711816a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 02:59:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747735170; x=1748339970;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jv3cua+BYR/31GrwxUJ8YoNbjglNl0IAz5i1xrlz600=;
        b=CbAxvjY2EosT/jKyL7Tt2CB1mDm4D28pbe92U5L7tfkEEFWsmKusF3jKiqlmdo2LFt
         4qu/zabk3T4hmc0t0z9HAqSFZFgI77r6ja8XDlUmfgNDxizPMO2Z3TyFrSUlNaYdqZIt
         7/Q7CJE2SpbAA3I43iZkXEl0lTFXb+omrd38HyYEhbkx1P33fbOIzkjiPhdM+frdatY9
         u01P2/zu/rq3rmGb7wN7vE8711g/Eq5bms7m0PG3AZHoSkuLG9Jk3f1W0lcLVsxdR4qJ
         lDCArkouKRj5dmA5tOrwPLcxDOIxsIvtKSLw3FbtAhOcnh67aBRAQoBC+Q67r9w5Ql6Y
         iU6g==
X-Gm-Message-State: AOJu0YxW3h31bgexUkxapOZoV1t4ADt+hms8+/I5RjwJcyAp1fSBokyb
	mJJnTJCDIUM5l+sxoPbqnZtgsACC7VoOFL1k6hiH1NMvmnjT16gi1/Thf2DA/wa3kWKgWRxRExH
	/OiJEU5ExStH1Y7y5y1fELd2wVfOD8Tc+rahs2Kb0qWAb2C+tjDNelmIQM0H9nIvycEo3
X-Gm-Gg: ASbGncsetSLAW7aE8RHtcQiMCq1ZQ9u/HesIB4HqYxeOokS0Z+TaeUpJ4awRjSl3vQ9
	mBwgUPLtJbU5j7c5nW+yOO6KP8czoDaDIRfiQDjX/Z0UHV6aDaorKEpFlJimmTz6B3uEExIIzAT
	sy0qmtOm+FnbcITuZSy17wQYZAtIYNwzQk3hjwaQsmKp3iFwroBRhTJEv7Aeyq93Vn5rK0CI7LN
	lHDOfsmGnX+nio/KDrmxexaP5g9y/82A03leO4tk4D9PKMN73zYA+6RIAXwWPWGdTvgu/CJyaGY
	ZJzVuY74nLypT4/ZvyT+aLmg8MTUm2gqSoLH
X-Received: by 2002:a17:903:46c6:b0:224:10a2:cad5 with SMTP id d9443c01a7336-231d43dcae5mr251622905ad.10.1747735169818;
        Tue, 20 May 2025 02:59:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1zNkmIzglmpHCldY51C3CQJv11RUYjL8aNcrJibJIP0RRhYEje06LWOqz1EVMX0ZVKwW1ug==
X-Received: by 2002:a17:903:46c6:b0:224:10a2:cad5 with SMTP id d9443c01a7336-231d43dcae5mr251622685ad.10.1747735169435;
        Tue, 20 May 2025 02:59:29 -0700 (PDT)
Received: from [10.218.34.181] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4afe887sm73495865ad.88.2025.05.20.02.59.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 02:59:29 -0700 (PDT)
Message-ID: <890b9e41-d5a2-4df3-bb21-71642b4e6410@oss.qualcomm.com>
Date: Tue, 20 May 2025 15:29:24 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
Subject: Re: [PATCH 1/3] soc: qcom: qcom_stats: Add support to read DDR
 statistic
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
Content-Language: en-US
In-Reply-To: <b3119bef-d045-467b-91cf-37fe6832ff63@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=NfHm13D4 c=1 sm=1 tr=0 ts=682c5283 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=cm27Pg_UAAAA:8
 a=gI0cpxkbm6pSp9-x3_4A:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDA4MiBTYWx0ZWRfXyYSXAtx1gFsT
 I+OeMFizv+blqOxGD4x4C1CrRCoBxQG0H3WX3HybQoOsDDTnzKmLARznw0ohwj1gsVBx08oytGT
 YdrHxk20QQz7XluKgwaTQg5Z/QlYY9nOccu1JdMawNNkh/xYanFCxyOfFafqG/L/lEVXz64Ri5S
 Q6vVs9TcMbUDal+nbfXHg8CHiJK0VSAWDhVPLL3WjIQUzFfFmh2QN7ON/5oPCwbOOxF4eUf0n7S
 T7oeyeR2GXgj/QE614NtbgntW532+EXO1DHPShT3D6qPd3TBf8TCC3pLmblbTDbeYBws7kthcLj
 v+/B3WG9rZGGDlDxvX6wUxK9yv/tJS1fuOasFulC7FdHkLsVzG+8fKnRtfo/+WBgkERzKwGqS59
 3pDJwqm921g8uJM/IAmomhciecJMAA7W56FAoJTQ7LDcOdCBoQsRzaWeYlv1H0iH3/wlN4Gc
X-Proofpoint-ORIG-GUID: 1_3vU7nH2txZZFhiVeNDDxxdEpj4TRCc
X-Proofpoint-GUID: 1_3vU7nH2txZZFhiVeNDDxxdEpj4TRCc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 spamscore=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=999 impostorscore=0 malwarescore=0 mlxscore=0
 suspectscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505200082


On 4/29/2025 4:04 PM, Konrad Dybcio wrote:
> On 4/29/25 5:52 AM, Maulik Shah wrote:
>> DDR statistic provide different DDR LPM and DDR frequency statistic.
>> +#define DDR_STATS_MAGIC_KEY		0xA1157A75
>> +#define DDR_STATS_MAX_NUM_MODES		0x14
> 
> Numbers (count) make more sense in decimal
> 

I will change to decimal.

>> +#define DDR_STATS_MAGIC_KEY_ADDR	0x0
>> +#define DDR_STATS_NUM_MODES_ADDR	0x4
>> +#define DDR_STATS_ENTRY_START_ADDR	0x8
> 
> [...]
> 

>> +	 */
>> +	name = DDR_STATS_TYPE(data->name);
>> +	if (name == 0x0) {
>> +		name = DDR_STATS_LPM_NAME(data->name);
> 
> I'm not super keen on reusing the 'name' variable, maybe turn the
> outer if-condition to switch(DDR_STATS_TYPE(data->name))

Okay. I will use switch-case.

> 

> 
>> +}
>> +
>> +static int qcom_ddr_stats_show(struct seq_file *s, void *d)
>> +{
>> +	struct ddr_stats_entry data[DDR_STATS_MAX_NUM_MODES];
>> +	void __iomem *reg = (void __iomem *)s->private;
>> +	u32 entry_count;
>> +	int i;
>> +
>> +	entry_count = readl_relaxed(reg + DDR_STATS_NUM_MODES_ADDR);
>> +	if (entry_count > DDR_STATS_MAX_NUM_MODES)
>> +		return 0;
> 
> -EINVAL
> 
> Konrad

I kept this return as success from details given in commit message of [1] 
which made the qcom_subsystem_sleep_stats_show() function return 0
in order to run command like below to collect the stats without interspersed errors
grep ^ /sys/kernel/debug/qcom_stats/*

The same may break if return error from ddr stats too.

[1] https://lore.kernel.org/r/20230119032329.2909383-1-swboyd@chromium.org 

Thanks,
Maulik

