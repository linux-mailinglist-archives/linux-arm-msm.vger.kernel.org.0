Return-Path: <linux-arm-msm+bounces-46228-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE59EA1D4D2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 11:51:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EC79F7A254F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 10:51:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B69471FE44E;
	Mon, 27 Jan 2025 10:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xdg1V7eu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8001FDE08
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2025 10:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737975109; cv=none; b=b5BDS9+JNmO6ZNLOMNVfJufaYRUgpPqqx4hZ3hjBRaswYd4UC0MiOL7h93F5TdPEI3BsVIZIa6+5f2yAVVyfyTQqFIfoXVZnoaiGGjvhrEiUXJCuvMksw+nva58Pz/AJsPe/sHyKDS4PTaeXo1hGd7hTY/cXFgumRzgdbcrcsDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737975109; c=relaxed/simple;
	bh=mWS+9+694GSsQoByy20+8LEEtkIWdin+mmWpimRNntI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qaEQ57SeCYH8ixRIO6SupOPrIeR2aMnEvt9KSgV8xBjA+7r3tIiwo6cknBgwODjVmjlujnNXPVm+kCKq1+VJcv8m7DLZehDp0EHQzLSqGThxN8o8BEhVCANaEnuwU49r1lBNxaFHOeo4qD9ARZtTlKTPW4MONhIWjvA5c4j7cEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xdg1V7eu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50R111GT012411
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2025 10:51:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5TAo3NLH3Ad8L2mbH6/7KB9BjVRiKtULeosoRVXBiIE=; b=Xdg1V7eu3kjoDsZ2
	v8jTYEEVt/L1SFFHuWUTtLm+s+zSgCMCaoqjzUs3xsh5y/39fK7ph7BPFC1y/br5
	IKf904vgSs7WtG4HZPvf1F1n+yL/r17jYNfFCU53mZ+wt9umSpPxsB5ofWsIVoxN
	/nzm9Zzb4qprA5Iy/cbAIJky/sioCdBlIKB7p5Q4v/konZ+hzbQunUa/uTi9DB9/
	q8tuVzkZWJbFHqpGW/RqJ49pzuXoKNbFfPl22vdWPm3bg59HiK6iJd0czKG3l2IX
	M51MGi0Q9P2yx4In3OfrY8pNg4gggTZtyRk0ORLZFlhIHWpJHa80x4BPqv6X7AzG
	pCdz6w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44dh6q9w18-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2025 10:51:47 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4679d6f9587so6563371cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2025 02:51:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737975106; x=1738579906;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5TAo3NLH3Ad8L2mbH6/7KB9BjVRiKtULeosoRVXBiIE=;
        b=T7xqDQfNpHjAFWxogPlzCWxv2jAd+gTxtKpy6EShdSQ/KVhFryxp0vREmsbnSKDKgE
         alBI8F+5xjNS5MKZ3ICfkV/rV8dvSqQDJxuWf8ODLOUXIUvFy3RDkAat7gL01PsqH6Wa
         KbCQO7xvYV2x+Iu4CdXzjs6DgaWKyB1NTXYjSjDOqC9tkr1Jql8yT7cr9rzDjUnbls5g
         +tA5GmbnmLiOrABNbhoMQPZ6qmEEHvccDRDB3zJ7Giu9bpw2KJMiNchWj9wbH7fyerja
         zm63bhb184+fXqd52hTobBgMFOEn632D1BhGiVtaD5i5hMNowWncSkua2FJMWnF7rVLt
         oSKA==
X-Forwarded-Encrypted: i=1; AJvYcCUoxaLVCulZsmse96F8TB2Dos9lLbYSQXxEwCfBmCk1eZuvPq6KxhbO407N6e3W6oDkREwF0DXdE5CztNiP@vger.kernel.org
X-Gm-Message-State: AOJu0YwTOYz8Ck5fU5yIRR21HJqPWvOERptq//yldrPrmbVkNG/FOeEd
	6anCvBaxfieVC5xvrAFUkKXeZ384A1Gzp4vZu2BEfVs101yBQw6dAbdO/6EjJmUI/2I6WC2T5Ar
	+jlVlWhl/AxbpqNLXY0Gklkkw7MnPbBXH1QqzlIjdZ5KobD200ijAT5yD92wbv6dK
X-Gm-Gg: ASbGncudsybwEwNqCg2fPiwxVIwBy8ou7lBZjZpWhEyzbsal5L/S/zLUThWf8OQrHH8
	8sFRhYqgWXfP+mbgbswpdS18siZIn8DEyNeeJSVNhyATCZd6TKx65GsLpNcwC0pJsfEXxxAVI31
	Fj3ZoHbUR79kJfC11f28ZLS0QtP5VzIepLaJ8IQK5FCsDCzGFHtlpqVTgOeu/7C2W5dA7Ti/nMI
	8llLiA6E7kLoQwfFBeBtiXBQHLG/i0GUCo2vZJnhkOJcsK395MA5NwhXIopem8Ggch0PbDul0h7
	9EPfw3hO5Vc8wbSCROKw20SC1+4JkzwDsx7TmO7OX5lND+j+24sTRxRn+NQ=
X-Received: by 2002:a05:620a:2710:b0:7b6:c6f8:1d28 with SMTP id af79cd13be357-7be8b1ce456mr1339609585a.0.1737975106229;
        Mon, 27 Jan 2025 02:51:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGmipgG8GM4vQcl4ErqneekUMA+TqdfGQ/TRnU6ORUmcoAw+5fZFYtsSEdXIZ+Fkyyih/giyA==
X-Received: by 2002:a05:620a:2710:b0:7b6:c6f8:1d28 with SMTP id af79cd13be357-7be8b1ce456mr1339608585a.0.1737975105928;
        Mon, 27 Jan 2025 02:51:45 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6760ab31dsm558813966b.89.2025.01.27.02.51.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jan 2025 02:51:45 -0800 (PST)
Message-ID: <89351850-b7ec-40b8-ba6e-a69e682f245d@oss.qualcomm.com>
Date: Mon, 27 Jan 2025 11:51:42 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v5 3/3] arm64: dts: qcom: gaokun3: Add Embedded
 Controller node
To: Pengyu Luo <mitltlatltl@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        =?UTF-8?Q?Ilpo_J=C3=83=C2=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-hwmon@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250120164701.7918-1-mitltlatltl@gmail.com>
 <20250120164701.7918-4-mitltlatltl@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250120164701.7918-4-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: BWnAC4DZRawf6L2A_Mx5Ce0_b6a5GvOP
X-Proofpoint-GUID: BWnAC4DZRawf6L2A_Mx5Ce0_b6a5GvOP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-27_04,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501270087

On 20.01.2025 5:47 PM, Pengyu Luo wrote:
> The Embedded Controller in the Huawei Matebook E Go is accessible on &i2c15
> and provides battery and adapter status, port orientation status, as well
> as HPD event notifications for two USB Type-C port, etc.
> 
> Add the EC to the device tree and describe the relationship among
> the type-c connectors, role switches, orientation switches and the QMP
> combo PHY.
> 
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

