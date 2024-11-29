Return-Path: <linux-arm-msm+bounces-39565-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA4D9DC295
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Nov 2024 12:14:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E163C2818EF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Nov 2024 11:14:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8AA11990C5;
	Fri, 29 Nov 2024 11:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N+ba56HH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D85143C40
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Nov 2024 11:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732878849; cv=none; b=ood+B17+eSd7Ocdxam5VvvA1eliudi8LhbYpPjJdsydAOCNbIczRcH0rmBOsBUEKVAw8fuWKOHMemm7YZprwdBFeRIMcmNg9w8groWvTY8kv1IwWEm4Q8PCmpuW7XsBKcxFRKBs/2Fh0TBZah5ao8uRtODwmSRmni2auv5iG0uM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732878849; c=relaxed/simple;
	bh=cstglfYBauIS3JdfffF2An7qCkZsMHY7Xxx+C8VW4Rw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fOyMgkgCiyN2dbhi2RjrHOPmyUt8x9oYoLPkws/RXMr7O+RW26okC7ebpG9FiwHsm94GDCfEHtuhc8bLaSY+G/7RhIQIzyQ0sFEiHDJKcQIrpRMlhx+TImc/khUq1raqR3U06MwL7cTfbs2SvIxUaMFocEBFEfaJ5JRrIJXyTMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N+ba56HH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ATAFtDs004149
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Nov 2024 11:14:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BAYSwvTyJwQulmVNF+wY/HlCJDdBfbXeIaNl/2czgb0=; b=N+ba56HHvusIT2IO
	kx1iz/q1ttMfI8igtIpnn+FC9YmsRsALtO0X0wpI+vUNE17dazNCxzIb0motQ2bK
	jmgxyfjq+oKfMiHKLjpF3bN2qzFYILfZBddz6bZjIDvBSGQX36Lc/6wvY7Ufnuou
	I/fjADxFrpOtnOIiUpXhwJoM438z1hb/THqOzNX9CDHM4pQiUEJr35S3lyJFK3xM
	mwIvVNAZFJ7oP4+0JNk39MHDtDrbQE7OACtW0jEF8+EJxbXAalQ77RyWwVgh3PCG
	OCe41oJUrsHL8wiHdPFftZMvSaWAj8YBZpQPgtZeyugQNwDgXUHcnX1se8D7GlDT
	R5kBQA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 437bpv84sc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Nov 2024 11:14:06 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-466c4b8cab2so1729741cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Nov 2024 03:14:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732878846; x=1733483646;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BAYSwvTyJwQulmVNF+wY/HlCJDdBfbXeIaNl/2czgb0=;
        b=L+PZRlgDdHtdmm1OHACTGzJnhzFADzbsiLD/tN6+/VLIwXD6NcRpqe00lhPFxOkQGy
         DAXmrYP1nj82JmipnbNh31/I7mClKgy2NltSItKjiXVlTyPcmQFIR1pD8WDKF3F22AIT
         u8+VgKC5/Cl21Kt57cIKBPG81XGtMC1fC4bDzyroYoPWXQqKlUCRdztQEfZ+EI0TgFfo
         3shWQFu437zlpFTeyqbwYNWscvpzl3vzSdmcR610EcOtcdfD7Z03insgDZO8Uwj82YO5
         M4wCg2jRVPAj58yk2mJv80l3vsLFko6PnVcoidp2qLiuHMB45TMd68SU7QYQ9JeEkp8e
         b79A==
X-Gm-Message-State: AOJu0YzSoOjz31cBaMCO7YJRczT2NaqQ+WGcFY1kp5NnjlNRO6B/7gAQ
	DB9k9do4Rwum0CG+fiN/gr4LJQTnEzXc4ucKVCQWgt/BIzaurkGusAVixPGe10Bn/TgcvtRKsdI
	mbBujfVlImTDMdsLgiLNYMh3ZSLvG1nrNyDCjmqLB8aguhlQLXpehAkYGheQx7BUt
X-Gm-Gg: ASbGnctGDmNHNN4EpKIHA4cbLNRj12B2fL6CvDi4ta/uKeA5hIw/lfxUVm2wukkxfts
	izyeV5EvG+LFKNMxgThklcjKgg2Ttaq6Csbh4UXSVIBjeXG6WZJKx6sKugsFsE/MMHk3d1yJHHo
	B7N0LRPQIP4VIYJwvzNIBJbXsEvh3IN5E6p/86HD3YblmAaSHH3gH2/+60QmEph0bhOQod89d3P
	5XNef6EIjJo8DpByXhiSihLJtnIkNVlbppZ9a67JStCNklQiHOuVXGKeZkS0T4v13+VjXL7NuSg
	NARRDx4ErhV32pNkKNFH/L7lJf7yxUg=
X-Received: by 2002:a05:622a:15c8:b0:463:5391:de49 with SMTP id d75a77b69052e-466b3687a32mr71373031cf.11.1732878846169;
        Fri, 29 Nov 2024 03:14:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE0IkMRxCz6HR49nl4DM/5oNGJ9HIJVwhr8KR8G6mkB7EYgbxMsXDp14lpVrXF+HS3SvrioVQ==
X-Received: by 2002:a05:622a:15c8:b0:463:5391:de49 with SMTP id d75a77b69052e-466b3687a32mr71372741cf.11.1732878845666;
        Fri, 29 Nov 2024 03:14:05 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d097eb1fe8sm1723809a12.74.2024.11.29.03.14.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Nov 2024 03:14:05 -0800 (PST)
Message-ID: <5ae55ca2-d9ef-49c0-8868-2c5bb665ddb1@oss.qualcomm.com>
Date: Fri, 29 Nov 2024 12:14:02 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: qcs8300-ride: Enable PMIC
 peripherals
To: Tingguo Cheng <quic_tingguoc@quicinc.com>, quic_fenglinw@quicinc.com,
        quic_tingweiz@quicinc.com, kernel@quicinc.com,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20241126-adds-spmi-pmic-peripherals-for-qcs8300-v1-0-28af84cb86f8@quicinc.com>
 <20241126-adds-spmi-pmic-peripherals-for-qcs8300-v1-2-28af84cb86f8@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241126-adds-spmi-pmic-peripherals-for-qcs8300-v1-2-28af84cb86f8@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: pJaNNCWBAbq_wY5QstL_65NjqxrLX6oH
X-Proofpoint-GUID: pJaNNCWBAbq_wY5QstL_65NjqxrLX6oH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 priorityscore=1501 impostorscore=0 spamscore=0 mlxlogscore=999 bulkscore=0
 adultscore=0 suspectscore=0 phishscore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2411290092

On 26.11.2024 10:35 AM, Tingguo Cheng wrote:
> Enable PMIC and PMIC peripherals for qcs8300-ride board. The qcs8
> 300-ride uses 2 pmics(pmm8620au:0,pmm8650au:1) on the board, which
> are variants of pmm8654au used on sa8775p/qcs9100 -ride(4x pmics).
> 
> Signed-off-by: Tingguo Cheng <quic_tingguoc@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> index 7eed19a694c39dbe791afb6a991db65acb37e597..9447efb9cd01654b74ec4c18dec58b1956ffe710 100644
> --- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> @@ -9,6 +9,7 @@
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>  
>  #include "qcs8300.dtsi"
> +#include "sa8775p-pmics.dtsi"
>  / {
>  	model = "Qualcomm Technologies, Inc. QCS8300 Ride";
>  	compatible = "qcom,qcs8300-ride", "qcom,qcs8300";
> @@ -223,6 +224,28 @@ &gcc {
>  		 <0>;
>  };
>  
> +&pmm8654au_0_pon_resin{
> +	linux,code = <KEY_VOLUMEDOWN>;
> +
> +	status = "okay";
> +};
> +
> +&pmm8654au_2{
> +	status = "disabled";
> +};
> +
> +&pmm8654au_2_thermal{
> +	status = "disabled";
> +};
> +
> +&pmm8654au_3{
> +	status = "disabled";
> +};
> +
> +&pmm8654au_3_thermal{
> +	status = "disabled";
> +};

Are all these PMICs absent?

Konrad

