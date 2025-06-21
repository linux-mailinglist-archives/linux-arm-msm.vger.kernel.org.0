Return-Path: <linux-arm-msm+bounces-61920-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CCF2AE2831
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Jun 2025 11:14:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C5F703BEB63
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Jun 2025 09:13:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72ECF1DEFC8;
	Sat, 21 Jun 2025 09:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SQbKvmyD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA6018DB26
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jun 2025 09:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750497237; cv=none; b=e/Irjo0aFpZfAJSpWSFt+Ya5SYzJisFDmF+Qu7LLkG6D+suUrs7mM3Fs2rSt2dkj/ExoVETJKA8ZlWor/j4MyV0wKwbe/wjKwMsmP/uaJZ2jsTuN1OzDyr0zKlo1EoBxI0jloSz3p01TCf9JUpIY/u9Ey0KE92Hj6zoo3Cegpf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750497237; c=relaxed/simple;
	bh=aNZPfi5MEjGvLVYSe6rsKjxWfVWTq3w5CLVh+Ha6H2c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cGkZ8EVJdygOrYTrtXrHa8chAJtz6VHYO+RVMpbasxZuqN7U8+Cp8rOi7PEuXPughLheEHTWoCpf6vU2ay1dBhYE+xPquEfR7jqnn0XeX6sDGYoVBKxMc6r6AKmgSMCifWcVdsWIqVU7ky7YuL2axBpBUKIZIaTaBZzfN3YAjsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SQbKvmyD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55L4Fng8014904
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jun 2025 09:13:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CdrgCuFyZGhrHzoOCbhVdJmers1s2mC3v5Ga2/l7EzQ=; b=SQbKvmyDx+aE++sV
	597nL58TAVp2oDiYX2t+tZdsqDGYK5MhIdE0i2goMfP4gVwE+uBkbGgCwclzD8Ia
	Gj2O5gmDaon4/qVdb2nLNb3DPDg4iVR23pkdeBdrCpImshyQd8u+0NBDrIEqEBBY
	l7UY0TbWEMqL/9N9h969wqes70RcwvlIB2M91XLiSos1EHPXLYs42X/Ocy9DCH2O
	uo/zlVQt/KbppTQd1mvN595B6lf1reqbfADckK/L+aQYoF2dTbYoEAwKgpa/y1s8
	tXoSZJ5bUT0xF13cfc3eTrlxb/dOJAMQW6nwZmfNuOpBYEzYCIVmFUwjZzoesk+j
	ppGm1g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47dn488cev-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jun 2025 09:13:49 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d094e04aa4so78490585a.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jun 2025 02:13:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750497228; x=1751102028;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CdrgCuFyZGhrHzoOCbhVdJmers1s2mC3v5Ga2/l7EzQ=;
        b=MD2AM3o550YaaJPSWJmV3egCgMDwJQu3/SksOofED9jptBKrOm1lyj5XEicgu3FKD5
         yTMEax+Hk3lxyiyuiCApk5qMn+n/xqhyIr+a7cqhAn1VJUBDTt/+1OJFX+KAtxvgt9rL
         bK40Vm5CcPq8XJDZCwTEHMfZErXlO6P6A+flj35aUjGwtoTY/ZHyXDc5bEA+xV0lon5W
         c2SnFvbaGccYrXG/ZkH+RavgdWiKy+/d2GzeRTZtko1xBJGGSIsK4oQ7GIeWQwlC7+9L
         FWTIM7nK7851EvzwhCeq3KfY/IUQuXnTKNnP7CoYnyao/bKwN9LkPvoYkhAjq/dlkFnj
         5Rqg==
X-Forwarded-Encrypted: i=1; AJvYcCU5y3VzeJP+kCMtPSARs1edgAy+YE97g5JozBq1F64tZSMXI3CmXhL480iiD9MlcgWBy9Kxw4xLrbYVNUga@vger.kernel.org
X-Gm-Message-State: AOJu0YwsalDX+TBJ7UVdjENXc0TA/VY6mibNlJ+Nru+r5naIx38EzUln
	mATjcxvGKW6u76GlKBxe27gb0Vqz30caFlw24Bod8EifvebAv7/7iDbD8OVMKmpCyaxQMKQc883
	a5WFENiE5TBzlzkwgI4JrZNGVPLcWpGiWodeX9BjUvj5Yfr/xfZlwnGMTciTDILvRId/o
X-Gm-Gg: ASbGncvI/es+Csopxx3b9hcwG1rUCldN/hEkris/q2T6Hqsc0PjWvLPjJJEmGgOTYBA
	U/MGWDBEjBheIFVC4u0G4rw/MxZ27j2atXUkHEJompYJdOyMEBQCTLJTc/i66/haI0NkaSLevtm
	IJrK4d1jqzo7M/dnyrVRA6Rt2g2ZnjBrQrFOpK5+xIjCMYeHE39q9KoQbEujmWkxFkQGVefPvma
	ipj6LERZlFL8A75nX19qW0v0k2wP1bx1HQXpk48URV1x95sBw/wraInsSulFS9VGSichvTxUfse
	qmRkY/JOFKxdv0pnK+G5xrBl0jQqWQzR0To+j9HgR5d9VLJTyOHPF8SVuyJZHlSgcxH6EjtKU+7
	I8Rg=
X-Received: by 2002:a05:620a:2b4d:b0:7d0:996f:9c41 with SMTP id af79cd13be357-7d3f98c09e7mr345903485a.1.1750497228309;
        Sat, 21 Jun 2025 02:13:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFyIiz3szvGbH2qSS693ex8SUlj+1QG0R07ppmiIPkiWKJZke6knT/gDKybEOK5kP/nw/KbKg==
X-Received: by 2002:a05:620a:2b4d:b0:7d0:996f:9c41 with SMTP id af79cd13be357-7d3f98c09e7mr345901685a.1.1750497227887;
        Sat, 21 Jun 2025 02:13:47 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60a1851450bsm2799894a12.12.2025.06.21.02.13.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Jun 2025 02:13:46 -0700 (PDT)
Message-ID: <29748d63-0166-425e-98b9-5cf52db583f9@oss.qualcomm.com>
Date: Sat, 21 Jun 2025 11:13:43 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/5] thermal: qcom-spmi-temp-alarm: enable stage 2
 shutdown when required
To: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>, amitk@kernel.org,
        thara.gopinath@gmail.com, rafael@kernel.org, daniel.lezcano@linaro.org
Cc: rui.zhang@intel.com, lukasz.luba@arm.com, david.collins@oss.qualcomm.com,
        stefan.schmidt@linaro.org, quic_tsoni@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dmitry.baryshkov@linaro.org,
        dmitry.baryshkov@oss.qualcomm.com
References: <20250620001918.4090853-1-anjelique.melendez@oss.qualcomm.com>
 <20250620001918.4090853-2-anjelique.melendez@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250620001918.4090853-2-anjelique.melendez@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ynGmfQOghMwpKB9i4n_bNn-S3eX77MIO
X-Proofpoint-ORIG-GUID: ynGmfQOghMwpKB9i4n_bNn-S3eX77MIO
X-Authority-Analysis: v=2.4 cv=OZGYDgTY c=1 sm=1 tr=0 ts=685677cd cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=buOH-We6NtgwU1KSyRcA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIxMDA1MyBTYWx0ZWRfXzl5WcdU8E5Pj
 fH69ZRoAF+kN4fqHB1/mgZGOfBqIN6M5Yo1UTycOyxYwcRX29ajE+hhDJ/IPZyXMeerQLpDtmCY
 2LtT2d1uqrwaY+fvW1RXmqxVgGXPL8kZZYB8kOU2hYL8gsNh52mpNMIKHjH60a6RZ1qqU3OoIF9
 6mnPiCAOnjrMhdFANkN6QaZqetIVss7GKfLTzoNAqHhPg/TkP31sd6CO14u+IFF4tWtFuShWvv1
 Et9qeTEtjj/8mzj3fkvqdqCJfXqTnRmDkb+UWEXk39Lo8NfRANZajRwXi4a6j7XJ+wxRlefWVMg
 Y6dJjKZfh4/vsAHXs15lm7goEe5+WCwZs/6w6g7bUGOSPVxiQjlx5aN6nP6MDTkE1tLC7D1BKBu
 01M/sd2RFFpiGX7mhfLw3DCwYY1O4WWRxS4NkdMlLV9qIaJIdxvkJeX9a3Z9w0IIgnqddEgi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-21_02,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 mlxlogscore=999 bulkscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 spamscore=0 mlxscore=0
 malwarescore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506210053

On 6/20/25 2:19 AM, Anjelique Melendez wrote:
> From: David Collins <david.collins@oss.qualcomm.com>
> 
> Certain TEMP_ALARM GEN2 PMIC peripherals need over-temperature
> stage 2 automatic PMIC partial shutdown to be enabled in order to
> avoid repeated faults in the event of reaching over-temperature
> stage 3. Modify the stage 2 shutdown control logic to ensure that
> stage 2 shutdown is enabled on all affected PMICs. Read the
> digital major and minor revision registers to identify these
> PMICs.

Can stage 3 can be thought of as "hotter than s2, need to take
even more concrete action"?

> Signed-off-by: David Collins <david.collins@oss.qualcomm.com>
> Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
> ---

[...]

> +#define QPNP_TM_REG_DIG_MINOR		0x00
>  #define QPNP_TM_REG_DIG_MAJOR		0x01
>  #define QPNP_TM_REG_TYPE		0x04
>  #define QPNP_TM_REG_SUBTYPE		0x05
> @@ -78,6 +80,7 @@ struct qpnp_tm_chip {
>  	/* protects .thresh, .stage and chip registers */
>  	struct mutex			lock;
>  	bool				initialized;
> +	bool				require_s2_shutdown;

Let's turn 's2' into 'stage2', it's not obvious

[...]

> @@ -402,6 +405,12 @@ static int qpnp_tm_probe(struct platform_device *pdev)
>  		return dev_err_probe(&pdev->dev, ret,
>  				     "could not read dig_major\n");
>  
> +	ret = qpnp_tm_read(chip, QPNP_TM_REG_DIG_MINOR, &dig_minor);
> +	if (ret < 0) {
> +		dev_err(&pdev->dev, "could not read dig_minor\n");
> +		return ret;
"return dev_err_probe()" is preferred

Konrad

