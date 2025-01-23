Return-Path: <linux-arm-msm+bounces-45975-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12242A1A410
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 13:19:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4C3BA160D09
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 12:19:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11C1B20E6F3;
	Thu, 23 Jan 2025 12:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d8SBvdIN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BC9720E329
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2025 12:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737634785; cv=none; b=vGt2c1lmozu7RLZTMDIFQvwJUeryfdKYv+6OjjsElRGAZWLGSSuK+Y188ETICsos2rUqBzsynPJosLMmXOzQf6f6bfAJKTTZ/62EXFCRzOOItg25Y3/jlJyb+e6CTtqkT1QUwntWs2/NOcDc9dL1a/tb+h8wiLY9EpEu8EkxO8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737634785; c=relaxed/simple;
	bh=k2NKAdYzXBEQPbHp1TZCEi86re+Y04PGu5jH/Pgq7Xg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BZxloVveL7Y2xVhw1KdETmgscPRzgEYM5oy93I5YmfmsXY3SqG5WMSK8dJFPPdF7fb0pnlbsSeJr1w15/BCshKy4pWsdZXprdZM6FrHm2OJAcquS96OrgNFYoddW2/CZtHeG31GFlVzrDinCMkyOKzBlWn3tUPuHKG2fMaJdn7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d8SBvdIN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50N6Vj7q008802
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2025 12:19:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J9CPG/hVBu7eJ/PuvKIffPx7v08z1gelltnc+QQ273Q=; b=d8SBvdINUqctG+Ap
	O3+KIQ77cXm7+n7FdgyW5oj77lj/B7kGynP3NA+TbnmdSC52psyDl3Gkdt8o/v/z
	/7YYXNL4VLw9JGMwLm1O6eC8EaMRMFtWUm98x8XmYq97oaOtku0+M/e1TSyLwY3v
	WpusiGx9nvkLoNAmNpvrdyIfuTNVxQYufEIoLsp/U8mqC2sj2Xah7h4t5k++tlGW
	cyIrX5/5y8Gw2lrF1oRowA/2DB6pR7oL5I1eerdP8mS5qsZyaBA7nvEGniw/We/l
	0tJzoNAP9Zyz8OAu/ZRlh0w76RxdvS13YnoJwcPVpGj9Bqz9kWwOpN+VZsNJiX6K
	jf8E6w==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44bgk1gsyf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2025 12:19:42 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6d88fe63f21so1948766d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2025 04:19:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737634781; x=1738239581;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J9CPG/hVBu7eJ/PuvKIffPx7v08z1gelltnc+QQ273Q=;
        b=r1BS5fmrGTCZQ3wu4Zh3+AnEoCUJQ44wQLYXxzq7a8Ke/n29sQr5UoYJcEqbM7Y+vZ
         HwqCCH9wWPCrgrdnpSVN2w/YF9qlo60Gn3ah8AecbUy8zOK2ipgQs9nD5YvEXSqHdTzv
         AmMbCkqSoyOC5/968A9+ox6gNVfyyo76+6BjohhL1hgt+gijnzg9NETGHNoM9VRuC7zr
         wYJ8cjgcD56ULQ3oHX2IrCarg8+fgEGPYXWJAiI0Bo8+6o1+EuM9pIekqrcVVHx1JFgq
         U3XKuaOaSU3faFiGtpe/QVow54TH3wZw8IJOXSUVzvSvHWLxOPSB2GEIT9ZtvAL9LxOQ
         9PSw==
X-Forwarded-Encrypted: i=1; AJvYcCUdf8zvpW3+eYynrcVs/UzATXoG9zdQJASheCtNr+PR9zI5Tmd8GhD0hNOtS9x4eMhIsaVt+EUC5zUkh94D@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3KnaapyJqOF3adgcChZy43hTmi/1zscrYUGz9RR6v7ZqVE+OB
	JZknv8nZNYvVHLw5U50F4ihCaKn+lPGpbzJqgvZTHa2NpTR4eKVH7CryBZ1frTy7Kqz6Pt179Zc
	W6mQKcgHQiReQupWEWYD6jiatALPDSd03jaqWbIbXhdX05BWm0cysNKJJcXePNA0b
X-Gm-Gg: ASbGncsVEVb38JYFgCIZ5HBdfvlYAyLI105h1+f4jlVjeebXyfq53KvZan6E5OgiYrV
	dZ4AL5Dn9dtCqJjf8lNhTC39O38N1JewYRQeKBjfivUVRpGCWT/xGiTYFRuRd0mV5cQwNL+R1Cd
	HRNwrXFTI/tvk9c6Gw5xc+bhqA7i76sr0KeXHeW+AhjXPADHlWG1e5i99NeAdKaPq/byEdsSeTf
	X17ZO3JP2D4np/5Ue+3ZgMsudVMGqxFdnbvw9HZ44+1nfXQqcMmCjnhYJD1ArcJgVT0Z66RcX3c
	juPgA8FlHSIMy38cosjKzI/9pVvS34w5lT14SOWYxgzM73Gz
X-Received: by 2002:a05:6214:2427:b0:6d8:99b2:63c7 with SMTP id 6a1803df08f44-6e1b21db9a7mr125795176d6.9.1737634781428;
        Thu, 23 Jan 2025 04:19:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFL9S3Cn6Xh1m8u1IJrR1ZW7VnorjrOrlsJRo8NPVU0jyMT1h/6dueqAdo7fGzvWSJ3efppQg==
X-Received: by 2002:a05:6214:2427:b0:6d8:99b2:63c7 with SMTP id 6a1803df08f44-6e1b21db9a7mr125794946d6.9.1737634781138;
        Thu, 23 Jan 2025 04:19:41 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384f87d70sm1079289066b.142.2025.01.23.04.19.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jan 2025 04:19:40 -0800 (PST)
Message-ID: <94ccb2c6-d68b-4bb6-8eaa-7ff72f575ab0@oss.qualcomm.com>
Date: Thu, 23 Jan 2025 13:19:38 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] arm64: dts: qcom: gaokun3: Add Embedded Controller
 node
To: Pengyu Luo <mitltlatltl@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-hwmon@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250117140348.180681-1-mitltlatltl@gmail.com>
 <20250117140348.180681-4-mitltlatltl@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250117140348.180681-4-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: cjkMR5EGsqoVuc2ZuqIihoZSAjUMfJ2G
X-Proofpoint-ORIG-GUID: cjkMR5EGsqoVuc2ZuqIihoZSAjUMfJ2G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-23_05,2025-01-22_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 phishscore=0 spamscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 suspectscore=0 adultscore=0 lowpriorityscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501230094

On 17.01.2025 3:03 PM, Pengyu Luo wrote:
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

