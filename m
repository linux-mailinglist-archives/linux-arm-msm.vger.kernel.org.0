Return-Path: <linux-arm-msm+bounces-101522-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EDTRA6BCzmlQmQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101522-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 12:19:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9353879C3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 12:19:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2CA89302256E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2026 10:02:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 332F53DBD7E;
	Thu,  2 Apr 2026 10:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N8Yv2rmO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kWOMJLW0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937F33D9DB4
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Apr 2026 10:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775124174; cv=none; b=RrpwJf1AAAbJt93sfE8e3pronvDq87+EAZ4gDqIOXI3zNgdGZ/EzzRfuLxs7VIizpFCVGhNZbIXuy7Hf1CP1JXVFXFQ1G5iJw9iIRz940V99+7s8UkCyDS9whxgCXp0IlEkciRaKd7sURwz9iZ9J+c3/F2z99l2QE94G6grRBpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775124174; c=relaxed/simple;
	bh=GvTnsFElmwIh+OSG9v8rgpq9Y5sfAf11KTk5Yeq/Gd0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QnNKc1iJT6eCDypvixArxg/pt2sWxyzPiSwiPdjY06nB6x6u1X3cwlkLGrZUh+bwxH0nolK03pTE0iBGFEtwQgMxrB4dMc5p1s4OPsf749ZI3P1PyMvxazt6qqMfdIDZuvjP3lupIJMeC1mjj7WWY3vnLz//SaEQ0nPyhzWFGzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N8Yv2rmO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kWOMJLW0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 632764TA4009760
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Apr 2026 10:02:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m9IPPUPQv3jw5OO1P9dXF+EHN5oJqE82fBLDJkfRkCo=; b=N8Yv2rmOsEDL9Kj5
	yZpTFSwCTunZbPvXhIJ1gMIVEokpOU0LQ+HeccfPCs7hqJlJbX6lx7wecLzV06YR
	xCDITt/Viy+xzy0WVlGFfLUnd1Y6eeUtE4IgwWxoFDUeMoigCRnyMFgA0uwvO9Rv
	wxZLgQAJnMS9bE9jzCBnLXFjyH4e96x09ikMR5MS+kYjO71SSqQWTzLeTlzziMQl
	l5Y6QaiBwkHYI5RzBaehHJ9YWnFxyhDyC4Y+TGrpe3pFYxMeeLX1bMA4Q7PSdtJh
	QCSWiNW9+UCJdFT/Iyk4Zx5sxOfV/7ph8C8QNJCY48hUrJf0PXQD08CcYSd6OoGN
	QbXRSg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d97e03e0g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 10:02:51 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35daf3d3030so721767a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 03:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775124171; x=1775728971; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m9IPPUPQv3jw5OO1P9dXF+EHN5oJqE82fBLDJkfRkCo=;
        b=kWOMJLW0d0F/kagayl3hCLUNqDDWSSUqyq94ch71WbYZLkZVCiqpl+dirzpMM6RtiY
         qx2QV21eYLBxZ7PwcSSNI/H5KEUW1PzIuCWKHxkiVcUNUgF6esjmJKrKHTlaxNpO22JB
         Gjv8ilC1dkPwxbtjlXQJdw2NlOV7kk0KN/aH9OyInwJ7/cYmJglOj91QP+jQWQ210+lp
         QDJ72TUi1+JKNQkRd6Ii0secb1tXr0t8YmBa6455UC9b20VntPIhEKp0y2ijz/FP26yr
         42GmfN9Djc1kPJ9NQ8tKhndgLImZpedJOHDCzLJs8XPYs0Nlqzge7pEfG/JxglofO3S2
         XfYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775124171; x=1775728971;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m9IPPUPQv3jw5OO1P9dXF+EHN5oJqE82fBLDJkfRkCo=;
        b=bGyVo7CR198qAF6mRFb6HbeixpHnoNaGS15VFtbsoZTNAu6Ozu+g4EIZKBbx+XBp8I
         s9tHSk2ALgiVedyn4Yg65/Csk+wMef9Pis4Ofvjybe9EUzbhY243hZ+Eh2qBmkWvyCYv
         0wma97OV1jqjNBvn1mtIbzl1eOEt45yFgGskXRimhl9fiUmKj+OKIBML7IGeTu+9B0aX
         aAMaxVB2ArzdqtzqAbD99oeIlQ52s2bCSR+CHv4MPsHDCCvIZfpzMp0BT95ByUcmpm/s
         3B4Im5aSocZgYX+JXgsRzUTX6v94xQe9TckGBk2vs1eWBYcPPNDx3BeDrdkA+t0VOecV
         gE6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVhbf7OslV8+3042HFva49Xy3zk4Mq2qr9/ptDLiOvP7duxoUGQtrjatUgmjp1jkd4vaesqerML73F68RaV@vger.kernel.org
X-Gm-Message-State: AOJu0YwBskZfJHlmQaNkcFY49ibP6Pywv0AJliOcf2FsQQqZmvADeSbc
	l/PxR2lbThwYCmnALeMt+yLdN+mcxAZ+tD1FVUE2wkIq20vHP6S81Wobe+hg8SIcb+0yAugXqMn
	av+nJ38wehjadCbnuFDuo0VpUsUazb09tJvXYUN7pb5JRpzXCvKxNUN44VO14V1mORpb2
X-Gm-Gg: AeBDieuHHUvKFW6btNK3oyrJZM3tSCL3viOtKjn0JfmmBOqWslU1dt+g0JZYYFNOGzR
	b2kZaXH0Ouq6QA3cvr5ejFYUWb5wRGmwAhvlZS/AftKnqo8J1oOZHROW8lcDECtJCSnySQ8jzYQ
	qRjhjlL2Ako5ae3fvv3Opzp+oWEWysfVS7dN8Ju4hxWZRED+KGa8D8Jv0mTom0ujUuhDOqkdg7M
	gr4klFTR4XNqevYJZG8o0p7LL+iajIBOA8QIm3RzqLpBibj22eIhz/3x+li2hq5B7d7V18wx8o7
	8B9Yjn7OGetgQcAV6MzF9uzOBuSyae6aVcnmD4CoKIRL4CMY1DGzJAhy9ZO4ngDYdHpZwWJA0Bu
	FXeYXHCuIR/JqV4/07cCta5yPOPEpp+Lf2J+Xx3cQqgPOa/b444xEoV5Pmr9AwWGvB//vMWGGZG
	NQDv6Lw4+6f2Y=
X-Received: by 2002:a17:90b:2887:b0:35d:8e4d:23a8 with SMTP id 98e67ed59e1d1-35dd40bd502mr2545602a91.15.1775124171016;
        Thu, 02 Apr 2026 03:02:51 -0700 (PDT)
X-Received: by 2002:a17:90b:2887:b0:35d:8e4d:23a8 with SMTP id 98e67ed59e1d1-35dd40bd502mr2545557a91.15.1775124170389;
        Thu, 02 Apr 2026 03:02:50 -0700 (PDT)
Received: from [10.133.33.180] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76c6491157sm2048651a12.9.2026.04.02.03.02.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 03:02:50 -0700 (PDT)
Message-ID: <e0680ed3-4529-4da6-bf62-fd5f460e1be7@oss.qualcomm.com>
Date: Thu, 2 Apr 2026 18:02:43 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 4/7] qcom-tgu: Add TGU decode support
To: Songwei Chai <songwei.chai@oss.qualcomm.com>, andersson@kernel.org,
        alexander.shishkin@linux.intel.com, mike.leach@linaro.org,
        konrad.dybcio@oss.qualcomm.com, suzuki.poulose@arm.com,
        james.clark@arm.com, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org, gregkh@linuxfoundation.org
References: <20260402092838.341295-1-songwei.chai@oss.qualcomm.com>
 <20260402092838.341295-5-songwei.chai@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260402092838.341295-5-songwei.chai@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=fdGgCkQF c=1 sm=1 tr=0 ts=69ce3ecb cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Zw-1Wp-visFawXo776gA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: 9b95UIrhfejDxwNxAI5Qyatkqqd66NYQ
X-Proofpoint-GUID: 9b95UIrhfejDxwNxAI5Qyatkqqd66NYQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA5MCBTYWx0ZWRfX7Yt98tSYx8E1
 wIF2VpKs1lwST4BIqkfR8n5UgpN6qn2Bpf2ZYoUQ94ZV7ERavYkVSLpEPeSXPqzHj/wjARImdXu
 KNPnc0us2fhFtmoYirWgk2Y7ISRYANiiPinHhb2i8+3J0yToLO6EEDkJh3uFPkK9skoUOUrpwEb
 oabvUs4BG/6WHcZHPfCrVRCKAZtv6pvVOXL/4+7MnbWBd9qqZH/Z12VVZ4rS9Vm39OIQuDd3aNi
 y3buldTGIsgScIAHfv7/zYt0DgED4iXbEjtcCyAam9x9CC5zYZLvze/inNbIyS9Q6OUuR/So9fa
 bAEvKMsGMyg0sakBRiBFieeTRyaV59OYVWqPMa3IoP0JTwREb75V/IdXQIeKWkG2/yLFcBCYne2
 Q7PCwL9B4bn3Nhl66CkzKJ6x0Rn/Kv45YO9OnZSLkAyriSEz4Jm5VSI1pizRkg6vx+U1zpzw86l
 /jPX89IgatMm2hRcptQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604020090
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101522-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0C9353879C3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/2/2026 5:28 PM, Songwei Chai wrote:
> Decoding is when all the potential pieces for creating a trigger
> are brought together for a given step. Example - there may be a
> counter keeping track of some occurrences and a priority-group that
> is being used to detect a pattern on the sense inputs. These 2
> inputs to condition_decode must be programmed, for a given step,
> to establish the condition for the trigger, or movement to another
> steps.
> 
> Reviewed-by: Jie Gan <jie.gan@oss.qualcomm.com>
> Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
> ---
>   .../ABI/testing/sysfs-bus-amba-devices-tgu    |   7 +
>   drivers/hwtracing/qcom/tgu.c                  | 157 +++++++++++++++---
>   drivers/hwtracing/qcom/tgu.h                  |  27 +++
>   3 files changed, 170 insertions(+), 21 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> index 223873789ca6..4ef0d696d3d0 100644
> --- a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> +++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
> @@ -14,3 +14,10 @@ KernelVersion:	7.1
>   Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
>   Description:
>   		(RW) Set/Get the sensed signal with specific step and priority for TGU.
> +
> +What:		/sys/bus/amba/devices/<tgu-name>/step[0:7]_condition_decode/reg[0:3]
> +Date:		April 2026
> +KernelVersion:	7.1
> +Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
> +Description:
> +		(RW) Set/Get the decode mode with specific step for TGU.
> diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
> index 7d69986c3e3d..5b37eb10f863 100644
> --- a/drivers/hwtracing/qcom/tgu.c
> +++ b/drivers/hwtracing/qcom/tgu.c
> @@ -18,8 +18,33 @@ static int calculate_array_location(struct tgu_drvdata *drvdata,
>   				    int step_index, int operation_index,
>   				    int reg_index)
>   {
> -	return operation_index * (drvdata->num_step) * (drvdata->num_reg) +
> -		step_index * (drvdata->num_reg) + reg_index;
> +	switch (operation_index) {
> +	case TGU_PRIORITY0:
> +	case TGU_PRIORITY1:
> +	case TGU_PRIORITY2:
> +	case TGU_PRIORITY3:
> +		return operation_index * (drvdata->num_step) *
> +			(drvdata->num_reg) +
> +			step_index * (drvdata->num_reg) + reg_index;
> +	case TGU_CONDITION_DECODE:
> +		return step_index * (drvdata->num_condition_decode) +
> +			reg_index;
> +	default:
> +		break;
> +	}
> +
> +	return -EINVAL;
> +}
> +
> +static int check_array_location(struct tgu_drvdata *drvdata, int step,
> +				int ops, int reg)
> +{
> +	int result = calculate_array_location(drvdata, step, ops, reg);
> +
> +	if (result == -EINVAL)
> +		dev_err(drvdata->dev, "check arrary location - Fail\n");

s/arrary/array

Thanks,
Jie

> +
> +	return result;
>   }
>   
>   static ssize_t tgu_dataset_show(struct device *dev,
> @@ -30,12 +55,26 @@ static ssize_t tgu_dataset_show(struct device *dev,
>   			container_of(attr, struct tgu_attribute, attr);
>   	int index;
>   
> -	index = calculate_array_location(drvdata, tgu_attr->step_index,
> -					 tgu_attr->operation_index,
> -					 tgu_attr->reg_num);
> -
> -	return sysfs_emit(buf, "0x%x\n",
> -			  drvdata->value_table->priority[index]);
> +	index = check_array_location(drvdata, tgu_attr->step_index,
> +			tgu_attr->operation_index, tgu_attr->reg_num);
> +
> +	if (index == -EINVAL)
> +		return index;
> +
> +	switch (tgu_attr->operation_index) {
> +	case TGU_PRIORITY0:
> +	case TGU_PRIORITY1:
> +	case TGU_PRIORITY2:
> +	case TGU_PRIORITY3:
> +		return sysfs_emit(buf, "0x%x\n",
> +				drvdata->value_table->priority[index]);
> +	case TGU_CONDITION_DECODE:
> +		return sysfs_emit(buf, "0x%x\n",
> +				drvdata->value_table->condition_decode[index]);
> +	default:
> +		break;
> +	}
> +	return -EINVAL;
>   }
>   
>   static ssize_t tgu_dataset_store(struct device *dev,
> @@ -54,13 +93,31 @@ static ssize_t tgu_dataset_store(struct device *dev,
>   		return ret;
>   
>   	guard(spinlock)(&tgu_drvdata->lock);
> -	index = calculate_array_location(tgu_drvdata, tgu_attr->step_index,
> +	index = check_array_location(tgu_drvdata, tgu_attr->step_index,
>   					 tgu_attr->operation_index,
>   					 tgu_attr->reg_num);
>   
> -	tgu_drvdata->value_table->priority[index] = val;
> +	if (index == -EINVAL)
> +		return index;
> +
> +	switch (tgu_attr->operation_index) {
> +	case TGU_PRIORITY0:
> +	case TGU_PRIORITY1:
> +	case TGU_PRIORITY2:
> +	case TGU_PRIORITY3:
> +		tgu_drvdata->value_table->priority[index] = val;
> +		ret = size;
> +		break;
> +	case TGU_CONDITION_DECODE:
> +		tgu_drvdata->value_table->condition_decode[index] = val;
> +		ret = size;
> +		break;
> +	default:
> +		ret = -EINVAL;
> +		break;
> +	}
>   
> -	return size;
> +	return ret;
>   }
>   
>   static umode_t tgu_node_visible(struct kobject *kobject,
> @@ -77,13 +134,26 @@ static umode_t tgu_node_visible(struct kobject *kobject,
>   	if (tgu_attr->step_index >= drvdata->num_step)
>   		return SYSFS_GROUP_INVISIBLE;
>   
> -	if (tgu_attr->reg_num >= drvdata->num_reg)
> -		return 0;
> +	switch (tgu_attr->operation_index) {
> +	case TGU_PRIORITY0:
> +	case TGU_PRIORITY1:
> +	case TGU_PRIORITY2:
> +	case TGU_PRIORITY3:
> +		if (tgu_attr->reg_num < drvdata->num_reg)
> +			return attr->mode;
> +		break;
> +	case TGU_CONDITION_DECODE:
> +		if (tgu_attr->reg_num < drvdata->num_condition_decode)
> +			return attr->mode;
> +		break;
> +	default:
> +		break;
> +	}
>   
> -	return attr->mode;
> +	return 0;
>   }
>   
> -static void tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
> +static ssize_t tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
>   {
>   	int i, j, k, index;
>   
> @@ -91,8 +161,10 @@ static void tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
>   	for (i = 0; i < drvdata->num_step; i++) {
>   		for (j = 0; j < MAX_PRIORITY; j++) {
>   			for (k = 0; k < drvdata->num_reg; k++) {
> -				index = calculate_array_location(
> +				index = check_array_location(
>   							drvdata, i, j, k);
> +				if (index == -EINVAL)
> +					goto exit;
>   
>   				writel(drvdata->value_table->priority[index],
>   					drvdata->base +
> @@ -100,9 +172,23 @@ static void tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
>   			}
>   		}
>   	}
> +
> +	for (i = 0; i < drvdata->num_step; i++) {
> +		for (j = 0; j < drvdata->num_condition_decode; j++) {
> +			index = check_array_location(drvdata, i,
> +						TGU_CONDITION_DECODE, j);
> +			if (index == -EINVAL)
> +				goto exit;
> +
> +			writel(drvdata->value_table->condition_decode[index],
> +				drvdata->base + CONDITION_DECODE_STEP(i, j));
> +		}
> +	}
>   	/* Enable TGU to program the triggers */
>   	writel(1, drvdata->base + TGU_CONTROL);
> +exit:
>   	TGU_LOCK(drvdata->base);
> +	return index >= 0 ? 0 : -EINVAL;
>   }
>   
>   static void tgu_set_reg_number(struct tgu_drvdata *drvdata)
> @@ -131,16 +217,26 @@ static void tgu_set_steps(struct tgu_drvdata *drvdata)
>   	drvdata->num_step = TGU_DEVID_STEPS(devid);
>   }
>   
> +static void tgu_set_conditions(struct tgu_drvdata *drvdata)
> +{
> +	u32 devid;
> +
> +	devid = readl(drvdata->base + TGU_DEVID);
> +	drvdata->num_condition_decode = TGU_DEVID_CONDITIONS(devid);
> +}
> +
>   static int tgu_enable(struct device *dev)
>   {
>   	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
> +	int ret;
>   
>   	guard(spinlock)(&drvdata->lock);
> -	drvdata->enabled = true;
>   
> -	tgu_write_all_hw_regs(drvdata);
> +	ret = tgu_write_all_hw_regs(drvdata);
> +	if (!ret)
> +		drvdata->enabled = true;
>   
> -	return 0;
> +	return ret;
>   }
>   
>   static void tgu_do_disable(struct tgu_drvdata *drvdata)
> @@ -262,6 +358,14 @@ static const struct attribute_group *tgu_attr_groups[] = {
>   	PRIORITY_ATTRIBUTE_GROUP_INIT(7, 1),
>   	PRIORITY_ATTRIBUTE_GROUP_INIT(7, 2),
>   	PRIORITY_ATTRIBUTE_GROUP_INIT(7, 3),
> +	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(0),
> +	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(1),
> +	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(2),
> +	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(3),
> +	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(4),
> +	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(5),
> +	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(6),
> +	CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(7),
>   	NULL,
>   };
>   
> @@ -269,8 +373,8 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
>   {
>   	struct device *dev = &adev->dev;
>   	struct tgu_drvdata *drvdata;
> -	unsigned int *priority;
> -	size_t priority_size;
> +	unsigned int *priority, *condition;
> +	size_t priority_size, condition_size;
>   	int ret;
>   
>   	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
> @@ -288,6 +392,7 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
>   
>   	tgu_set_reg_number(drvdata);
>   	tgu_set_steps(drvdata);
> +	tgu_set_conditions(drvdata);
>   
>   	ret = sysfs_create_groups(&dev->kobj, tgu_attr_groups);
>   	if (ret) {
> @@ -310,6 +415,16 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
>   
>   	drvdata->value_table->priority = priority;
>   
> +	condition_size = drvdata->num_condition_decode * drvdata->num_step;
> +
> +	condition = devm_kcalloc(dev, condition_size,
> +				sizeof(*(drvdata->value_table->condition_decode)),
> +				GFP_KERNEL);
> +	if (!condition)
> +		return -ENOMEM;
> +
> +	drvdata->value_table->condition_decode = condition;
> +
>   	drvdata->enabled = false;
>   
>   	pm_runtime_put(&adev->dev);
> diff --git a/drivers/hwtracing/qcom/tgu.h b/drivers/hwtracing/qcom/tgu.h
> index df570c89ffd7..987ea07bd618 100644
> --- a/drivers/hwtracing/qcom/tgu.h
> +++ b/drivers/hwtracing/qcom/tgu.h
> @@ -16,6 +16,8 @@
>   	((int)FIELD_GET(GENMASK(17, 10), devid_val))
>   #define TGU_DEVID_STEPS(devid_val) \
>   	((int)FIELD_GET(GENMASK(6, 3), devid_val))
> +#define TGU_DEVID_CONDITIONS(devid_val) \
> +	((int)FIELD_GET(GENMASK(2, 0), devid_val))
>   #define TGU_BITS_PER_SIGNAL 4
>   #define LENGTH_REGISTER 32
>   
> @@ -49,6 +51,7 @@
>    */
>   #define STEP_OFFSET 0x1D8
>   #define PRIORITY_START_OFFSET 0x0074
> +#define CONDITION_DECODE_OFFSET 0x0050
>   #define PRIORITY_OFFSET 0x60
>   #define REG_OFFSET 0x4
>   
> @@ -57,6 +60,9 @@
>   	(PRIORITY_START_OFFSET + PRIORITY_OFFSET * priority +\
>   	 REG_OFFSET * reg + STEP_OFFSET * step)
>   
> +#define CONDITION_DECODE_STEP(step, decode) \
> +	(CONDITION_DECODE_OFFSET + REG_OFFSET * decode + STEP_OFFSET * step)
> +
>   #define tgu_dataset_rw(name, step_index, type, reg_num)                  \
>   	(&((struct tgu_attribute[]){ {                                   \
>   		__ATTR(name, 0644, tgu_dataset_show, tgu_dataset_store), \
> @@ -68,6 +74,8 @@
>   #define STEP_PRIORITY(step_index, reg_num, priority)                     \
>   	tgu_dataset_rw(reg##reg_num, step_index, TGU_PRIORITY##priority, \
>   			reg_num)
> +#define STEP_DECODE(step_index, reg_num) \
> +	tgu_dataset_rw(reg##reg_num, step_index, TGU_CONDITION_DECODE, reg_num)
>   
>   #define STEP_PRIORITY_LIST(step_index, priority) \
>   	{STEP_PRIORITY(step_index, 0, priority), \
> @@ -91,6 +99,14 @@
>   	 NULL                   \
>   	}
>   
> +#define STEP_DECODE_LIST(n) \
> +	{STEP_DECODE(n, 0), \
> +	 STEP_DECODE(n, 1), \
> +	 STEP_DECODE(n, 2), \
> +	 STEP_DECODE(n, 3), \
> +	 NULL               \
> +	}
> +
>   #define PRIORITY_ATTRIBUTE_GROUP_INIT(step, priority)\
>   	(&(const struct attribute_group){\
>   		.attrs = (struct attribute*[])STEP_PRIORITY_LIST(step, priority),\
> @@ -98,11 +114,19 @@
>   		.name = "step" #step "_priority" #priority \
>   	})
>   
> +#define CONDITION_DECODE_ATTRIBUTE_GROUP_INIT(step)\
> +	(&(const struct attribute_group){\
> +		.attrs = (struct attribute*[])STEP_DECODE_LIST(step),\
> +		.is_visible = tgu_node_visible,\
> +		.name = "step" #step "_condition_decode" \
> +	})
> +
>   enum operation_index {
>   	TGU_PRIORITY0,
>   	TGU_PRIORITY1,
>   	TGU_PRIORITY2,
>   	TGU_PRIORITY3,
> +	TGU_CONDITION_DECODE,
>   };
>   
>   /* Maximum priority that TGU supports */
> @@ -117,6 +141,7 @@ struct tgu_attribute {
>   
>   struct value_table {
>   	unsigned int *priority;
> +	unsigned int *condition_decode;
>   };
>   
>   static inline void TGU_LOCK(void __iomem *addr)
> @@ -146,6 +171,7 @@ static inline void TGU_UNLOCK(void __iomem *addr)
>    * @value_table: Store given value based on relevant parameters
>    * @num_reg: Maximum number of registers
>    * @num_step: Maximum step size
> + * @num_condition_decode: Maximum number of condition_decode
>    *
>    * This structure defines the data associated with a TGU device,
>    * including its base address, device pointers, clock, spinlock for
> @@ -160,6 +186,7 @@ struct tgu_drvdata {
>   	struct value_table *value_table;
>   	int num_reg;
>   	int num_step;
> +	int num_condition_decode;
>   };
>   
>   #endif


