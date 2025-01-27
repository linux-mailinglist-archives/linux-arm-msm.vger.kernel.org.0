Return-Path: <linux-arm-msm+bounces-46276-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C2753A1D919
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 16:12:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D2E17165CCC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 15:12:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FD3313A88A;
	Mon, 27 Jan 2025 15:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KGG265+9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF66B139CF2
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2025 15:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737990732; cv=none; b=o0gpp01boxPmS/8o3BRsXahQfHOnvGrbuaoR9+X3VQXzyQORRskJpQkkNxE8Y82lAmyJt+xfLzT6OeFsfjmWha86HO+NY2Nn/jjSZyw3mlhhUxozjYyampUoJa/HboE8bMUlrGFOpF1DjZtIaj7/Lbe7FVDaiX6XDCZlK9IyoDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737990732; c=relaxed/simple;
	bh=0/2bJnEnDs8um6XYYODDkPZ2omRK56ST66i1OlyJEKA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=lXEeuQelt1XyPYdNZScAPJvyiYo+CMqE6mvCL45xUukFemSM2x7xCPuwK1v5HySxG2o2iWpmArieiKAOxHO1+06AeCJGLLNLAXSOI+VVzgJqSCjIsLksO0nUuhlBlrBZn3J+zoGsVaziPumwNhXSRh8ueRLKs5xpeLoEGdpxP0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KGG265+9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50RCTQ3u020960
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2025 15:12:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dQpvtI6u3lxTYx1xzlqCxqIm9uDJhDvieISDzIxyB3U=; b=KGG265+9kok1dsaT
	jn6yay7UsmHlM/Z8GeR6dq0lOj8NRdcbVnkCK9FjAgc3tAtygj884BfBU/Y4duZb
	mAXtAxfG1N2FPdjXGLFHUxV4wf1zWn1YDYibnQLOlvw7OayBOOgtyoNDv8dco2mk
	0F7Tmw0NOeJUz7SbgEXcBRbHfGi9GFQ/iNh+MbHy++Ghsr8jKLvRvUBVuqyVuXOV
	uBhYWn7rBrnJSv/tDYBYL27oRJXd7ixngJkN9WnhNZNKuTiWIKxAPLl2CVNmGde/
	evcctEhYbEKA64Y+lA/s5bonhY3+b58n5Vp1TPM6RkwN4gNpSks69TV10fbfc5DV
	VQwpKw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44ea6s0a2w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2025 15:12:09 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7b6f28dc247so85865685a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2025 07:12:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737990728; x=1738595528;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dQpvtI6u3lxTYx1xzlqCxqIm9uDJhDvieISDzIxyB3U=;
        b=XqtQ8GsDslO0YHQpmN2LHxPSbzqdQStSrAZtlEeuhypY4n675T87M78guyKmk0h7VP
         5tcbC4cFDju/kcLwMdYXg4dHq9gWRofuNnyM5bBNsWv6Moa4oy5ZuFAdL+MVme3ODKgD
         EN+l9mpb9w9UBgKM0gb66PYgBZWYNDXDJ+z+WZv5ipxFQRq1RCHFsXM7IHXcTX8lYaZV
         keBneny49skZwdQf9EkcnJQyWb/HyZaHz2EYUJ+eTlwimlwY4biBnRXG+dYpCfQd/6r6
         OpfCXrvgrUMhNRWhpcLqVbl4nIC8255my+bp6OEJnxmr0MF14xiu9fBBK4eMRlaOBKjP
         nXSg==
X-Forwarded-Encrypted: i=1; AJvYcCVxDAAlSjaNu+uelolabIMHqdK7h7pXhrvBYGQ/MBVPw4ySEVo3wlO70nBSYYOrznt6GvAP4WRIjBQsFFxx@vger.kernel.org
X-Gm-Message-State: AOJu0YzHbYN6E6KVL/jAtxUSMgACshedLOLa08M9JL2ugSJu8bDICiuD
	lykyKdEMZi9CkVGWRMmDCAdA4CMbBy/ctf4ZQifVFE8MGVOf3iipD6kPd8QMdHne7SWeaHcMIr2
	unfMG+WvZ81uf1eIYeJ60ctdeZUN1FT1Nx7cDU5qdRvrmg6n+PrGKqHT1huuUN3MM
X-Gm-Gg: ASbGncuMz+9ZXVRDo1fPlP4t+aqs0f/2GQQ6HYB15e1xUoMsBq99x3API+Vl5ssilmk
	60tOjkmA9ln8Mt0g6QVjuEgFE4BGYcKDGO6r9RC/9tzr4BrEJ/J2986/zdCTZX8TfGpDLF3VYE0
	u0UP0M5FtfzaGzNn6vP/EQWEBYvsYMlYu/DnaOc38YjDKrTsVhXZGHPm7aYyt87ThZ1C2+FVp8T
	/K7U7HCXx75b/Vu9mGXakg4iew2NwpbUejWVnW81zI2g89KBs+oDdb72FlV7iM1191HPvtDDZoK
	/ZaLNzASZBaHAKnNVQp8tfMhKOdd8y5JIWz0GCeh1j3HstLy9YHjmIvTYx8=
X-Received: by 2002:a05:622a:1b92:b0:467:692b:754f with SMTP id d75a77b69052e-46e12ba7bbcmr222256441cf.13.1737990728548;
        Mon, 27 Jan 2025 07:12:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGAXSyKsvfmhX3h/ssch181jhsbqIKNv4LNE3vkPaU53NS6RVkISKb6uv5OLWtSlIdF4nr7xQ==
X-Received: by 2002:a05:622a:1b92:b0:467:692b:754f with SMTP id d75a77b69052e-46e12ba7bbcmr222256191cf.13.1737990727978;
        Mon, 27 Jan 2025 07:12:07 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6760ab363sm598975666b.114.2025.01.27.07.12.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jan 2025 07:12:07 -0800 (PST)
Message-ID: <7e118726-b22b-4c7b-9966-07c3b1ff709c@oss.qualcomm.com>
Date: Mon, 27 Jan 2025 16:12:05 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] cpufreq: qcom-nvmem: Enable cpufreq for ipq5424
To: Sricharan R <quic_srichara@quicinc.com>, andersson@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        rafael@kernel.org, viresh.kumar@linaro.org, ilia.lin@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20250127093128.2611247-1-quic_srichara@quicinc.com>
 <20250127093128.2611247-4-quic_srichara@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250127093128.2611247-4-quic_srichara@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ba0__87Ur2DQr_e3NIfdyM0Pucs5cj5v
X-Proofpoint-ORIG-GUID: ba0__87Ur2DQr_e3NIfdyM0Pucs5cj5v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-27_07,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 bulkscore=0
 phishscore=0 suspectscore=0 mlxscore=0 impostorscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501270121

On 27.01.2025 10:31 AM, Sricharan R wrote:
> From: Md Sadre Alam <quic_mdalam@quicinc.com>
> 
> IPQ5424 have different OPPs available for the CPU based on
> SoC variant. This can be determined through use of an eFuse
> register present in the silicon.
> 
> Added support for ipq5424 on nvmem driver which helps to
> determine OPPs at runtime based on the eFuse register which
> has the CPU frequency limits. opp-supported-hw dt binding
> can be used to indicate the available OPPs for each limit.
> 
> nvmem driver also creates the "cpufreq-dt" platform_device after
> passing the version matching data to the OPP framework so that the
> cpufreq-dt handles the actual cpufreq implementation.
> 
> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> ---
>  drivers/cpufreq/cpufreq-dt-platdev.c | 1 +
>  drivers/cpufreq/qcom-cpufreq-nvmem.c | 5 +++++
>  2 files changed, 6 insertions(+)
> 
> diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c b/drivers/cpufreq/cpufreq-dt-platdev.c
> index 9c198bd4f7e9..4045bc3ce805 100644
> --- a/drivers/cpufreq/cpufreq-dt-platdev.c
> +++ b/drivers/cpufreq/cpufreq-dt-platdev.c
> @@ -187,6 +187,7 @@ static const struct of_device_id blocklist[] __initconst = {
>  	{ .compatible = "ti,am62p5", },
>  
>  	{ .compatible = "qcom,ipq5332", },
> +	{ .compatible = "qcom,ipq5424", },
>  	{ .compatible = "qcom,ipq6018", },
>  	{ .compatible = "qcom,ipq8064", },
>  	{ .compatible = "qcom,ipq8074", },
> diff --git a/drivers/cpufreq/qcom-cpufreq-nvmem.c b/drivers/cpufreq/qcom-cpufreq-nvmem.c
> index 3a8ed723a23e..102f7f1b031c 100644
> --- a/drivers/cpufreq/qcom-cpufreq-nvmem.c
> +++ b/drivers/cpufreq/qcom-cpufreq-nvmem.c
> @@ -200,6 +200,10 @@ static int qcom_cpufreq_kryo_name_version(struct device *cpu_dev,
>  	case QCOM_ID_IPQ9574:
>  		drv->versions = 1 << (unsigned int)(*speedbin);
>  		break;
> +	case QCOM_ID_IPQ5424:
> +	case QCOM_ID_IPQ5404:
> +		drv->versions =  (*speedbin != 0x3b) ? BIT(0) : BIT(1);

Perhaps:

drv->versions =  (*speedbin == 0x3b) ? BIT(1) : BIT(0);

But ultimately both work:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

