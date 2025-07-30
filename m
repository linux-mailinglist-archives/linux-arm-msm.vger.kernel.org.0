Return-Path: <linux-arm-msm+bounces-67108-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C950B15DC0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 12:01:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 156335641C3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 10:01:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0688027A46E;
	Wed, 30 Jul 2025 10:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OE9t+lPD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4257D26C39D
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 10:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753869664; cv=none; b=eqBKe/HVx/Ag/V6cXZakvtm4u3AQxYP/W11qFB3pJjq7ZDK486fxlrDnrcLT/nvad5pHGJlfC6WrZqEYnuO9NVWmESakKdvHcFEZUUQBqbtUe90obPdNYtkSoxylBHdAnKSf3oh7Of0jggcfnFLFz69+bHZz4XZZAXTyPTvYYqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753869664; c=relaxed/simple;
	bh=/NbRkipP9VCM+Lc6lxFwKRTG405kRiihzDFyNsOsLMc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bb6lkMFTOAqzWtXq5cpbhuXR7qOUfUb8hMgr7uq0a3Xo4bgYSURO2IYLnh65CexWBC2sn/5/4RgB1zeITh1c5aL5VYVsfThxSJaDG2xoLI3mwpb9HVGP1d8s6qqxAfSYtKjGW6Dd6GkA/ZFwF45tjz4YxazHaBgwbkFEWwQIs9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OE9t+lPD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56U4vxGZ015048
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 10:01:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8qVYp0AZmQ8Y171B2X7YTOB0/ixgpTOlnQfewXcziPo=; b=OE9t+lPDtS4F0KFH
	BLAGtHen7/ksS9o5XXqVJZLcjjqWg+rh8AJ2TYIiYOy7mrhfjvqpTwc7/6AF0eck
	CYVvbW12dKXNl04dsYgRrzoQXMOER2xIN/ytB500jc51p1W1LoN5HCAHM0QiPvPu
	nZ2Hoy2uCON7PhNxpUzU1/Fvv7WAFpcZCWQQYTiNUDWW3pNfgxWggWNHok+2Pu4T
	C0tPKddpYMw+P9Q3PZGR3hySHs4/YhgnooZZ4yJyr6cudIKSZA0fKKB8d9V4OTpw
	FaCBWoB+ufuo8g+XqoW3CZVpvHrOZXxCvgkFaAz0pZv/a1dK2W8+ZIauTupX6eyF
	xN+fXw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484q3xu8yb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 10:01:02 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ab7077ad49so13752961cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 03:01:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753869661; x=1754474461;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8qVYp0AZmQ8Y171B2X7YTOB0/ixgpTOlnQfewXcziPo=;
        b=U1ycy3e+ovSW02DpVMxSCpyVucKSfJyrBQjJmzW6ADIVhNFPJW/nVwK6iFdb4DNwQz
         swZbb86zwB8K3hEVRNj6kRrCmyrnAUdwQsO5ruygqhsQv8SIei7b4J8erj6gguTMJSAM
         yNrl9pwMGhJIiqkh6QZQRBr6JVnhMk+n5e2imePnLs8CPR9LgShElay0TOQFrCTKKy9Z
         ZXxZemI5B1IEwQE6Ak6FURjMeXrvDnaC8xYw1ebNLI1tB7JWXmD1lQPyxKKCcYg2JReF
         oUJjBEWJ9eJFgXznImktJ4BkN/80bVXRLoJXhdfHo/rbEYQ8jqreQmTWzRvxndcyWAAW
         Ecvg==
X-Gm-Message-State: AOJu0YxUMK9C+Q/WKotQWoitnYXtfow+rEfWAlBpiNmRYYK2H9Brhf0n
	OIU609v+b+ctdt7KNEbFD9JxqWCHG9XXaW7q/FiJgUqpGxvJ0N+iYcqgOP8NQeg/TQyG7ZAVT6n
	w/ygZfOh/C0kvK02+eO0w4z6H1KBZHO7nZQgcSL3+kl9oTYlo8srutgshfpPDHv0VbYo+
X-Gm-Gg: ASbGncvTkvNIuxnlVGrPwPS7pj7lZBqDqkcu/2a1aMeL1VnVqU7FsoS1dH9sBSkxtXi
	mLxy1vb+xXnXwra6IayQUpepQRu+s3cj5fnm9kSCY/ig/PZLDEZ2n497y+YszdiTq1m6cGiK5Rx
	qMxIwl1jxSy6hsMofgc6WQMUaReZKV3kZRDg3kdUyLmJ6kpfb950HBkKWVcxWofJBJ6M3PaxEw2
	yiKUoa3SPUSf7oXDTYSBr+EbGL1XoEzrakh72je4MmekM2P8x2O/h9wnKjj4CjO+O2eHefvCwZ6
	a/mIQ8rtdjZNvUESw+PEDUiNdBMQzRkuQEi7lNlEYLz/Bul3O6ZZFJMvPm4WLcJmUf+nXtsEthp
	beR2K5REoHCaQH0qCYQ==
X-Received: by 2002:a05:620a:3908:b0:7d4:5cdc:81e2 with SMTP id af79cd13be357-7e66f372189mr195218785a.13.1753869661080;
        Wed, 30 Jul 2025 03:01:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGK729sglyzfLvdcMWb65qyWQ1Lwoe8zYZPYieFqzmCOYEfteuWti2wa+QHRti968wjTGVNhg==
X-Received: by 2002:a05:620a:3908:b0:7d4:5cdc:81e2 with SMTP id af79cd13be357-7e66f372189mr195212785a.13.1753869660444;
        Wed, 30 Jul 2025 03:01:00 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af635aa4494sm717711666b.97.2025.07.30.03.00.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Jul 2025 03:00:59 -0700 (PDT)
Message-ID: <63da4872-2365-40eb-9b2e-d3393ddd9b68@oss.qualcomm.com>
Date: Wed, 30 Jul 2025 12:00:57 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8650: Add ACD levels for GPU
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250729-topic-sm8650-upstream-gpu-acd-level-v1-1-258090038a41@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250729-topic-sm8650-upstream-gpu-acd-level-v1-1-258090038a41@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=JovxrN4C c=1 sm=1 tr=0 ts=6889ed5e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=qC_FGOx9AAAA:8 a=KKAkSRfTAAAA:8
 a=uJl3NGG0jz6E0JRZAr4A:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=fsdK_YakeE02zTmptMdW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: VFH9BkPi_puiSdL76-qXAu6l2EhrrwyK
X-Proofpoint-GUID: VFH9BkPi_puiSdL76-qXAu6l2EhrrwyK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMwMDA2OCBTYWx0ZWRfX/b0akFaY9W4g
 cJPvnihF+VSvRkGjar5x3vIJRdBFdLVreG+jzSbpHp4IEqZTharxGjqTGOS7FUFTEkQ2jGIGk/g
 QLDJwBr6NGlJcosoVnCrAC6nSHvTcIOI1OPLylQt7KLllnKFKMFrbLtDVB2kcEbf3Le5yMOcefA
 EvzC5L1i/qpmgXp+SyCRJMScoxDtAPWwvPLFtWpEjLlhZWMByv090JTEjk6Z560O6WwJ2E8a5a3
 hpxj+j+7b80saVYnX11o2OBxKFv4eOtHu3Dy1UW8SIUliY6tbxTta2RYu4Peaf9Xy1NeYjE1Jio
 QY5UpSzrOVTJL7A+40Zfk9wmvBahMz9eipcF+Zk+QkclXrFVg44GaZEtbzJatGmCNNt6WPJEbsL
 GNBzrPd5dW9iJxt3qTuO7tJu13wpSddKVlV8SV3PSjgKYkISvnz/T5YRJEjzuZuKVIrnvY13
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-30_04,2025-07-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0 mlxlogscore=999
 mlxscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507300068

On 7/29/25 4:40 PM, Neil Armstrong wrote:
> Update GPU node to include acd level values.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8650.dtsi | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> index 495ea9bfd008500dd2c9f46ceca94cf5f972beca..4cd933219ce008bd1c603c87778e210b6332e29c 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> @@ -4127,72 +4127,84 @@ zap-shader {
>  
>  			/* Speedbin needs more work on A740+, keep only lower freqs */
>  			gpu_opp_table: opp-table {
> -				compatible = "operating-points-v2";
> +				compatible = "operating-points-v2-adreno",
> +					     "operating-points-v2";
>  
>  				opp-231000000 {
>  					opp-hz = /bits/ 64 <231000000>;
>  					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D2>;
>  					opp-peak-kBps = <2136718>;
> +					qcom,opp-acd-level = <0xc82f5ffd>;
>  				};
>  
>  				opp-310000000 {
>  					opp-hz = /bits/ 64 <310000000>;
>  					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1>;
>  					opp-peak-kBps = <2136718>;
> +					qcom,opp-acd-level = <0xc82c5ffd>;
>  				};

https://git.codelinaro.org/clo/la/platform/vendor/qcom/opensource/graphics-devicetree/-/blob/gfx-devicetree-oss.lnx.1.0.r1-rel/gpu/pineapple-v2-gpu-pwrlevels.dtsi?ref_type=heads

doesn't set ACD for D1/D2

>  
>  				opp-366000000 {
>  					opp-hz = /bits/ 64 <366000000>;
>  					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D0>;
>  					opp-peak-kBps = <6074218>;
> +					qcom,opp-acd-level = <0xc02e5ffd>;

And other values differ too

What release did you grab these from?

Konrad

