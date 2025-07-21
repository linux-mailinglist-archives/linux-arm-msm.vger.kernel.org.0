Return-Path: <linux-arm-msm+bounces-65882-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46294B0C24F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jul 2025 13:11:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 82D814E463D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jul 2025 11:10:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DC77295516;
	Mon, 21 Jul 2025 11:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EvppDEKe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C78329616D
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jul 2025 11:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753096247; cv=none; b=i1Rwvh761IEkXrkTuxjEI5ydRNKhFCS/GNQfTT5zbyJCNlmxDvcXPMnqovABycqSEz4is7lty1bxu6ZdI3MHK8v/C9ULlhmsJB6kM9uzVeh7Sg7xYx9tNT2tPHOMDGVN1pDN1+T2l8aJ53kp10QDpSGvNrKOVCOU4VQ9ATP7sZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753096247; c=relaxed/simple;
	bh=ayVnVg9eme40xDElnjkpZrNBmaTxXUTukfPtFjBG+MY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S7LuoP5rMCuHcUiR0bmM/dIsKDIeOzaW9xsddN9j59yTxJWC5kNVRZBBF66v0fxUVd4fcTQzZseGtEVTGnZSEcKk1UlqGXkkVTlNYvqqHdKSxeKEj4uwMo8GevouDQzRNDl8c9HoOU7TUgcP7fb/JvX/NxNmpsEozFmPzsC6rDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EvppDEKe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56LAH0qN000585
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jul 2025 11:10:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GMwMN9DSD/nnB6vD5iQlaXP8fE0DlL0JKkeqnocUKcI=; b=EvppDEKeILxJaBai
	yXsQH6Toq6ipyVJkIf3hxQPSA0+mUa7KmwBWf/JSRQguTNAklSiRFypwbRGzZxv3
	CVe3ahscsFPJDSfrhCs0vxCDvT4DF6TRklYKcfEYUOAP+xKujAk7fPp2zQLD9YEQ
	AvJXHh58ibrKz2x/9x0GcwkGXDVRmHx2wekLHjeteXlWamm+AyRE85xa+2LPwQfh
	XhgEto2Q0sCDC5q5jELTGIgYSdKBu2eH7Ofuqn6Kj0tByE0m/hHeSBAaND2kCAzs
	efB1ucCGNuYJWkXVNKT7MfBXHOq6ANWGt6uuF3CNooQK+Y4dBmYx1Dex1VMvszOU
	C3Desg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048v4q9c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jul 2025 11:10:39 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ab5e4f4600so13389861cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jul 2025 04:10:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753096238; x=1753701038;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GMwMN9DSD/nnB6vD5iQlaXP8fE0DlL0JKkeqnocUKcI=;
        b=p3DsQQkubnQLg6gzFGW3Ap92iUFvexNme5OmyuFBKG19LPdOsvvAWKG+ybK3VbvtOB
         i2zgMtTimsTMHTq1FMvbnEPRGksKpd+TVIImy3CQkaAnR9exFP/B6wxdWC85BVuzHiZ7
         xWvhGKqdWDJNX7OI49gUqAdPDF57+ZX3d6pBw/TknO5+18yJjpmiIy2zceARJA3q43rY
         ja9elbMwFkbcs5y+ojBKkwGx1sIqHJ7bhCUFCsm1ajypXH5L047hPGEao3LopbAl+nk5
         U09qCl39+mXKsjxdeAGR2yeGfEhmnBEBZGM1/DLIfpIg+AexsHZEgTNu4IJgXNDCakHH
         u5vQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMPZ4PeBBfK+27/2k7qoSFbyndRxXSmr+o/FdMvZbYd+EztojbZdRnuITkpeX3vhJJmcZRT9juTQWxIM2y@vger.kernel.org
X-Gm-Message-State: AOJu0Yw54jTeAEcCctDVy4rcLCRWB+nayykzWKLDx/JrbovB6sIksfoM
	ZLuQfi22GSIDlxSErXd+GtRuAdSZMYwiasdwhZzxWvJD1DXptHuDpw9DHhCU+ky4nzbsde/OSLr
	4oXfz0pUUjKxzT+WwSuNC8PJyYyWw3p1Yhn5Y4mxw1D6+TzASKxeaa/zqRaAcnI33GGn9
X-Gm-Gg: ASbGncvWz4irwzQfETdkzUNsSCuXxvHkP8l3uN15BQQC6CfLOe4N8pz9SqHgq38E5MO
	Ys9rj0BXg/tzmpovTQ5IWO5YZMh0rejJxxSIuEl7Cw2clJ2cJJNhZbLVfHy4ahcCvSggsxMV4Yu
	PyJKieAbV7J4ZfPO291+AeUU5ZjZwBJ0IYbFYY4pNsL5SEguoBAuGr1FCZ+samA2Q58ZwJLTSP6
	nbyDpSB4t6cKTL4/xhaPH+e7nmQ1vYZa+i8rdSuSA5QjuE5UfxksyTy2UtBsSKEczEp5rVK3m1I
	2zEFJUykZHBs0aVlG2L2pDj8I1SXotzBZG+/wRwCeYGvvDni/gdPaz7G/694oX4pmPZg+NA//ef
	dymXKKVU/uVzLjAlLvQHv
X-Received: by 2002:a05:620a:2850:b0:7e3:3c61:564a with SMTP id af79cd13be357-7e342b69642mr1175957985a.13.1753096237827;
        Mon, 21 Jul 2025 04:10:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+usxYJ0rcx0aY5PomFcpe95e/guIMzZOIesQD8S5mJPCtrTQdxUcKX9zEaBa9XZtr7TlJTA==
X-Received: by 2002:a05:620a:2850:b0:7e3:3c61:564a with SMTP id af79cd13be357-7e342b69642mr1175955585a.13.1753096237196;
        Mon, 21 Jul 2025 04:10:37 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-612c8f09d99sm5298795a12.3.2025.07.21.04.10.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Jul 2025 04:10:36 -0700 (PDT)
Message-ID: <4d7aa1c4-9dd9-424c-bce1-fd000ba2a56c@oss.qualcomm.com>
Date: Mon, 21 Jul 2025 13:10:33 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] arm64: dts: qcom: sc7280: Flatten primary usb
 controller node
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250720072125.1514823-1-krishna.kurapati@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250720072125.1514823-1-krishna.kurapati@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: aPMlljAE29XGmgcDxxuhmZFucslaDlWz
X-Authority-Analysis: v=2.4 cv=SYL3duRu c=1 sm=1 tr=0 ts=687e202f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=3thKaPtOxDKtY4w2F4IA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIxMDA5OSBTYWx0ZWRfX7UKxQqcDXvhZ
 gJEuwGgvkvHgHN5WCGwEHJbwTWtWPWeOBbzqALjUNrQ4wk4gjWZk9ZwPi40hLUenFPGqo+p+EfV
 X5ugQEdRYpK3OgiDDtVVDXdhzVyJ36i/9cyeER37AYqr47a41arguNdPC4PrMLd5zfhhwGz1evp
 CJ+xLoVcISTTaKV2/7tyOOPuFZ9o7qt3aly2JVQwmUiRLxVYpILJ+zNz2kcIgXqbypjtwr4b6f9
 KZKiIEQRcs5fqbolX32F5/Vi2h5yWc5sATvGL3P0Tg15jnx+1bRsA1foWnn/zTluQMFg84DG4NK
 3zauF7igf4qaul3YQrbi/F7t3dQGEPYNm8nvNTiVNaNIwbqEyJca9BHyijVlkrl60mMsYjw3W7s
 xPbI1d0JwX1v5AOPvhbvboMIRdlj1Ta0Nnd/9FTA0BceDXrZ/OgcjZkve4B9KXsEoff5ctyD
X-Proofpoint-ORIG-GUID: aPMlljAE29XGmgcDxxuhmZFucslaDlWz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_03,2025-07-21_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 mlxscore=0 bulkscore=0 mlxlogscore=875
 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507210099

On 7/20/25 9:21 AM, Krishna Kurapati wrote:
> Flatten primary usb controller node and update to using latest
> bindings and flattened driver approach.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---

[...]

> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index b1cc3bc1aec8..e94e21301bdd 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -4245,13 +4245,9 @@ compute-cb@14 {
>  		};
>  
>  		usb_1: usb@a6f8800 {
> -			compatible = "qcom,sc7280-dwc3", "qcom,dwc3";
> -			reg = <0 0x0a6f8800 0 0x400>;
> +			compatible = "qcom,sc7280-dwc3", "qcom,snps-dwc3";
> +			reg = <0 0x0a6f8800 0 0xfc100>;

You forgot to change the base address

Konrad

