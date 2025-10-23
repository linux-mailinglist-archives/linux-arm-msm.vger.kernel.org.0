Return-Path: <linux-arm-msm+bounces-78489-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8FFBFFF73
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 10:39:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BADBE3A651D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 08:39:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E1C52FE566;
	Thu, 23 Oct 2025 08:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oVTexMTc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E97D62DAFB8
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 08:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761208761; cv=none; b=ocRG+6xQ10DOvpPP/GO9zM/bvUos/FXpY8gCZAEq0YuZyQFTNJPfx7Z3j7bmExyPhFp1pSaUmL/XoWEcm/a12tc4500CimIDos5kDVJXCLTl/lX5/tppa+TmrweY86yQMIQEHdLQuLzdWzf9ZaPHN73az1h11relNdvn1KcgKDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761208761; c=relaxed/simple;
	bh=nOax5hQLsN9PT1AWGz3YCtsa3xYATSOpBANd8fewLts=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QMRsohjXCBXGXNzWaGSPTUnNV4bTmOjn3AyTfp2fPsVAK2I0svdI4WCSAwMLYIuRwEngsmbEWJLfn/tvCG6hEfG2af50j5jv5cK+a3umC4wzy/qCv+Ue9RTIXxrqvsA57hD5kfgGcUFwPx5CHIv5EluRx1oYg88dgEOTOwQtuYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oVTexMTc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N6SuRf028870
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 08:39:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hWklso/dxpLXwGPGUP0msBHS9WT93suLvo0LKoUXLFo=; b=oVTexMTcIxNPHsts
	3bnBsHd2KLHjGUj/+aagPZ8UN9MxyGO5059ZiB6S6yOLeNRRRv2mR9BzIDZ1mfDu
	Z+5hoSXYYG5NnJYvo4EnP1sx8B+N8Pctq153qcDABqO9y/I+fTGaXbukTlaCGpDr
	ilo5L3gOthqSmEuhBBEkK2GM0+5e4ZMCoTY0JaYuL3lLlizhhzFWSoDap7vNTMhi
	/u0iiDU8abW1USS2gnCxXi9tT9T3tY+OxzKXBxKiohKtAxGIvKHYqFLfjF04nOVf
	y3BooNhgqIfkXhepQulUuI3OaxmIZF8RsJQ4IzoW53irK8Zq0zyA8ONxm5fIntWh
	6O/bww==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49w08wdavk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 08:39:19 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-87c103b902dso1509926d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 01:39:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761208758; x=1761813558;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hWklso/dxpLXwGPGUP0msBHS9WT93suLvo0LKoUXLFo=;
        b=EWM+46m7r3gSsfWKPa5HnLKpXTcUxNqpel5czFB0uvqytFoUgJ2rv1BbIJvR4w1eeo
         yBEuaWNtWJ9LsmScTEHzvOD6c3BR8FZGTZcnSWRsEWEmuInKyXeQZTZPjCf4TLqeZX2e
         1O9WKMi7iMSz4h/+HXeoW+BfxFrXUd5CoMqlg4OLyDliHZczP82uwaXV2T95YoxiLgk2
         FfluT/5H7vxuSNHs/TcRTWeGb5Co2I57Cyn7oL57IxOGoQW+yJobzKLz1OuvKyb6cW9d
         58aCsl/MEtJ0etBPXdHYcbEEJkGOuxq8QB5tnpoj9HSn7vA6p8wM+d6N3G2uIarkLaLn
         IPXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRbZuOXYE0l8Zu/ZBaPpmmuH3buslK7PWXsl3SiBaqC63hHU41CrM6brHOpbOI/JSfl8sPT0nz9OTggi9V@vger.kernel.org
X-Gm-Message-State: AOJu0YzOYN3GzvdFozkjdchAqxCctzcLuXzPbe5K5xhmM7kZsPwC+FHp
	G7/i5tdZo9dsiQVXTQMa4PinyyPPCK3K+6dOvy/19uRtGoOvKjwAo6kHa8DHJPSNLKkk6zGXtct
	jIXyOSI37VYlit3cm7W6IzMokAEgCrLgaWresFaQ0/Wx0cBOm8lbeT55zgYA1cLTQUtE4
X-Gm-Gg: ASbGncs3qgG6qtvjxx6RCe7PIf4HT+H3qKv8XG6T+ggMl/E/kmQhy/Ply46g4HsQ8tI
	IMV2cMMSYad5IRH0W/kToMQL8UfrJh4nHRXfT5LrHXIcieMjhuMGiN4Jb/pXUBMNq41J8iT7Tjv
	HRkyErDp2r7x7RJ7yWUNLpUby6dKifjvqS45vZDTbbrPbqt+mpYKYvPA7No58uVSNlrnIejcgyr
	xGCAqOAKVJsf8Xn4UkGrd0RPMzENyQT7zE2pR0hledWftKf5oQX58K8/Wqo6x8xeRY5SLdTBwf4
	OFIBbfg2glupEZRLUxaQZPVxfQ0PdUuVCeJIi4pXvxWHqpA3MuQjrq7f108k4TkCgMjIWj1cRSt
	zk5BcVi5iBkTXDJcIQeV7wA21g81p5n4Y3fpZ82U2hHgEGaHoQ3u/14zt
X-Received: by 2002:ad4:4eeb:0:b0:87c:1f68:60a7 with SMTP id 6a1803df08f44-87c20648934mr220471746d6.4.1761208757882;
        Thu, 23 Oct 2025 01:39:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1cj9oNKOdOhb82W7AZwyB/d6gcZ6DzbdGz722pp8OHNmq2vXVRfnz96SMP1l1gSm5txUD9g==
X-Received: by 2002:ad4:4eeb:0:b0:87c:1f68:60a7 with SMTP id 6a1803df08f44-87c20648934mr220471536d6.4.1761208757410;
        Thu, 23 Oct 2025 01:39:17 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63e3f3349a8sm1129107a12.36.2025.10.23.01.39.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 01:39:16 -0700 (PDT)
Message-ID: <1039aea3-47c6-4205-826a-636e595f127d@oss.qualcomm.com>
Date: Thu, 23 Oct 2025 10:39:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: dts: qcom: ipq5424: add cooling maps for CPU
 thermal zones
To: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: quic_srichara@quicinc.com, quic_varada@quicinc.com,
        kathiravan.thirumoorthy@oss.qualcomm.com
References: <20251023043838.1603673-1-quic_mmanikan@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251023043838.1603673-1-quic_mmanikan@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: WduuaOWDlQTzdw84RBBUccTwt6fy0Uok
X-Proofpoint-GUID: WduuaOWDlQTzdw84RBBUccTwt6fy0Uok
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE5MDA5MCBTYWx0ZWRfX8OCp9ZcYIE8H
 6TwwpcgljW+yXSOuV5M1DpArFRBl6YRW8IhQyKkF+xZqQ1svl88ygqnr4YuExVAGv/RIdM55Hbw
 OMcDJ0nkDylyWe36++UFvgoymXyt/6ERrCsMEB2MXgpbx9v40ucFVoRzh0lsKuGf2Wqbl5nddur
 nAn6vYEH067eq/QEpJ3cT5+JoOErU1BB0CFve2RGH7503np2v6DkaI50sblosy77rgtIDrfDiGQ
 7bIrMGyfPguZF5evyiA68wKGGlq/En+JtGDyN8XhoDXl43lCF8OPz6WMaB7bcB7nagUO9gEupFF
 /zr5SQwld1VlEXsSjmKqxzskyUl5ZIRxQb2+BIhdxMSRkVHlIYlZYKQ/3gzuK2PEIXceg/89LNq
 6rjh1pM/J8YXrWawzok5kr605YkekQ==
X-Authority-Analysis: v=2.4 cv=V5NwEOni c=1 sm=1 tr=0 ts=68f9e9b7 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=FqFNHRKa5SRjCxdZjAwA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 suspectscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510190090

On 10/23/25 6:38 AM, Manikanta Mylavarapu wrote:
> Add cooling-maps to the cpu1, cpu2, and cpu3 thermal zones to associate
> passive trip points with CPU cooling devices. This enables proper
> thermal mitigation by allowing the thermal framework to throttle CPUs
> based on temperature thresholds. Also, label the trip points to allow
> referencing them in the cooling maps.
> 
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> ---

[...]

>  		cpu1-thermal {
> @@ -1254,18 +1269,28 @@ cpu1-thermal {
>  			thermal-sensors = <&tsens 12>;
>  
>  			trips {
> -				cpu-critical {
> +				cpu1_crit: cpu-critical {
>  					temperature = <120000>;
>  					hysteresis = <9000>;
>  					type = "critical";
>  				};
>  
> -				cpu-passive {
> +				cpu1_alert: cpu-passive {
>  					temperature = <110000>;
>  					hysteresis = <9000>;
>  					type = "passive";
>  				};

This means "software will start throttling the cpufreq at 110C"

Is this what you want?

Also, is there nothing like LMH on this platform that throttles the
device way earlier, without OS intervention?

Konrad

