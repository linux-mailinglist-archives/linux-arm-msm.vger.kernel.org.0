Return-Path: <linux-arm-msm+bounces-75112-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 751A9B9F6BA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 15:07:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4CFA54E37EF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 13:07:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B42C7212548;
	Thu, 25 Sep 2025 13:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HRed1ArJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 406751A5B9E
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 13:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758805657; cv=none; b=V2rm1neisNTzxHNjFSa/c2DuBHsVuLPoUupH1osPElFBMyGIdrQPPOI1QWTGRKhhUC4f3eEM8Fz2ck9bQWWOa3g5OOtJHcE3MnbP0rYtMf1T/w4grRsU5m4bNjsa1eIpcewRczWzlI0qbtKMzmLWHTW1+8JwzYsGsiKl0iqf2nM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758805657; c=relaxed/simple;
	bh=jvM4Y/vSWLOo/8nu3p9xhzhDJkuYRocYakloDKrO26M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hfne75uM6t5XF+TNFvkdPYqwhK6hZ5QPip51j4X5kmYpTq9tlUctf1tVg9790+wdPZ4uwvMcMhFk6+9zx85BBnxPWx14UPIBpylnX0U82bxsIi47J+55VfAbdlLyV/IJoHBSUDjjlBl9SJcCY9Unfk1yvWFkAW0/pkpng2TLyak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HRed1ArJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P9K2dY027848
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 13:07:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R2ug5vCmu4WsfGi1U6sbqHkqRHEzdXssT8nz/lt+jpw=; b=HRed1ArJhNkRJsbL
	VxOFnbOJ9YF7U6JMyKcVxwd/zLBGGhxL09Sj9mO4s6J4yRDy+dKxiP8Jv/gjvvNR
	NxRaARHHRZiU/dK5QeDDpXg7DYJR56qcAdMgwf1breqxhk6u/qsJ5WTYN9sjQ8VX
	jdw9TZfXuBOAL3DvNRrskzrbO0TDR9YQarXl2T6JS178Tq4feWbg1ClxCjpXPro0
	YCq82tkrnmBgAw35E8UfqC0dqQNTcrzngVh6oP6PeUlj3heZ8QfHznHQjCdU8nl0
	xiwvjsZ3J6p7l7phSkb25cJb02fCS0OT1BvX4wtM1Tc88M4D0slmqsLAIY3Qr11o
	t4yd6w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hmp0hp2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 13:07:35 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-85a8ff42553so28318185a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:07:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758805654; x=1759410454;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R2ug5vCmu4WsfGi1U6sbqHkqRHEzdXssT8nz/lt+jpw=;
        b=spo3uokTJ5dfrIr9mtk5BAFPbI+JYkIMCT2tt1LSj1TzRsObkIRo5kNr7qTmIO4GND
         naP9URStfeINYETlqSSYG2FO52FGyW2LmO+h33CUoMWXCmC1uP/YBuKyd16cyjz1YRJF
         yAo3Ds284X0RhLKh49sfIqP4Ap4E2NMo8tPHzXlTLU8CN6lHlz/9LWpJmpIFvL4z1M0G
         tnCkv/WipFMqd2Gy5pExOLtun3oXN3toIKeFQggiOZX7onlx4hkeAy4oiOwIUt599WEz
         3vP/mznuyp6CAy789QcN6SHtAMh5Kv4hPsjKLtU/9dyqBBXSXosdwCZp0/NC+6a4sz64
         o4ug==
X-Forwarded-Encrypted: i=1; AJvYcCVYpuGenTfm1C2QIc2YXDioUKWvwyU2/oG2slMhPioWHQmebu2WjILZdNbgJuWuHLZFki7vyb5IH6/nzR5Y@vger.kernel.org
X-Gm-Message-State: AOJu0YwjmqLHQ0yzCVJRqEz5PnltJ4VqyRmHO1Pb1t/OXZs1A5eLwLGf
	pBMDNDbgRzOaSAE0YkbiwrnwIr+/ODQZSP/jevdXabmsmZNvUtvxXQ2pf5iOKYjcExHqrVkL4z9
	i108LphFxLxdmN1QAfwHCdGH4Y5ZnuHY2Wv7X0VCRn5wUlfEUXPt/ROX16DxRXdM6DlOB
X-Gm-Gg: ASbGncsBQci4HvvwdUL9JIQ0PbyvblOUxSUAHuDA1P3MBYcKzEKRe9xsVvExic0QHuc
	+tbVhIMEUlbGPEjZJD0OoL3RQQX2RJkNKDWPbcLXeY5OCVA13Zk5u1Ojx/9TX/jUrPd4BWmayal
	yWzNCkPV2gaBhndJXhHCk/1nmPQP4/bMT2GxAbSLYsheC0CCsQuGHYnHka3bhuOHbAcZD/t3bGr
	clOaFwX5XoQ0lEDUhOLpC1rTb2vfldPJg0/AErtMJnXi0yAK3Kt3xRhKxKptrnIe8FpJVILbPhj
	Q0UHOxVVDBB3qHonWfjmQ6CDCN+FjtTgi0Jlw9l+g+22cIO9xsSNmte0vHvaavgmnGFPtVhLyO1
	JY+kPMUJH92ujhcKoAB7vcw==
X-Received: by 2002:a05:622a:1493:b0:4b5:e9b6:c96 with SMTP id d75a77b69052e-4da4962b8c5mr28928061cf.7.1758805654011;
        Thu, 25 Sep 2025 06:07:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFM/vHHsLiUN5+SkGsloYe2vX3oyOnlbGp28c4efv0ng3OalcK4Chwb/k5D3p9QMYk86mlSnA==
X-Received: by 2002:a05:622a:1493:b0:4b5:e9b6:c96 with SMTP id d75a77b69052e-4da4962b8c5mr28927661cf.7.1758805653358;
        Thu, 25 Sep 2025 06:07:33 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-634a3650969sm1186569a12.19.2025.09.25.06.07.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 06:07:32 -0700 (PDT)
Message-ID: <f032db60-d625-4814-a5c9-0610618b7351@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 15:07:31 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] arm64: dts: qcom: r0q: enable ufs storage
To: =?UTF-8?Q?Eric_Gon=C3=A7alves?= <ghatto404@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250920014637.38175-1-ghatto404@gmail.com>
 <20250920014637.38175-6-ghatto404@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250920014637.38175-6-ghatto404@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YPqfyQGx c=1 sm=1 tr=0 ts=68d53e97 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=pGLkceISAAAA:8 a=7eSFts1GM3vNJhxzD_4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: tzxdzijOMNYm4tnRggLE8HrAhdmHxltt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwMCBTYWx0ZWRfX02hhMIljuLCe
 1WwXB2MFVcY5MXeJSVjk4jLgnFB9CcYgO5lUe54SE0EQe+bO6upN4PCmGPI4CFP1uROClNhAcJN
 JKPIAx/ajPhFtEWIbava122UTjJAnJM6VB4XKB4nYdVrNbOngFuhTn1INjQz/nEJE53yAEJvcZx
 sRgWvP7C4wXccJS60qcp5cU1nP8to+ceynVCKA8OJAZsy/ou9AF2ST6MlL5WadidQXiWan7CdGt
 slGyXp85BXV0m8evsjj/Nwzyn84tC/h1IzgG0hR3G3k4ReB5wl7FUuj5YVwnbMkHB6hXLscuusB
 KIeiMHQ0xSc1Pp+RW+4TzDg0409rqFkcTR4DGhDdjQSDY9K9mgDbUjuoCIyomTS9/oGo/UKGndw
 4a++lVn0
X-Proofpoint-GUID: tzxdzijOMNYm4tnRggLE8HrAhdmHxltt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_01,2025-09-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200000

On 9/20/25 3:46 AM, Eric Gonçalves wrote:
> Enable UFS internal storage of the Samsung Galaxy S22.
> 
> Signed-off-by: Eric Gonçalves <ghatto404@gmail.com>
> ---
>  .../boot/dts/qcom/sm8450-samsung-r0q.dts      | 39 +++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dts b/arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dts
> index c088f1acf6ea..0a55ce952f93 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dts
> @@ -146,6 +146,24 @@ vreg_l5b_0p88: ldo5 {
>  			regulator-max-microvolt = <888000>;
>  			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>  		};
> +
> +		vreg_l6b_1p2: ldo6 {
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l7b_2p5: ldo7 {
> +			regulator-min-microvolt = <2504000>;
> +			regulator-max-microvolt = <2504000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l9b_1p2: ldo9 {
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
>  	};
>  
>  	regulators-1 {
> @@ -370,6 +388,27 @@ tsp_int_sleep: tsp_int_sleep_state {
>  	};
>  };
>  
> +&ufs_mem_hc {
> +	reset-gpios = <&tlmm 210 GPIO_ACTIVE_LOW>;
> +
> +	vcc-supply = <&vreg_l7b_2p5>;
> +	vcc-max-microamp = <1100000>;

because you set this, you should also set regulator-allow-set-mode and
regulator-allowed-modes

Konrad

