Return-Path: <linux-arm-msm+bounces-21303-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 861938D64AF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 16:41:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 272081F23CF0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 14:41:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C674452F71;
	Fri, 31 May 2024 14:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="eqyfjQPg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D1C44C6C;
	Fri, 31 May 2024 14:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717166472; cv=none; b=D99t+k/iy+LAhfTliJUgDLCPaV/h4WSNPf+gNRg/j16yGHFSNz3deIFG3kADjo+XzZ/z0LiDQWYukBfmMf+3PO42ejZDcfKKp2Cw6sUg+8wR6HiF90QvCXeNJ8xzX7Kw5qH3rwQ+mrx+vBQWLpNR6m9ex2rRgjX+/cLXiUNtUhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717166472; c=relaxed/simple;
	bh=XnkgVy3603HPWP0vMy1lQxcPJjTpvm0TwtXUVgFM/js=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=aMNU3CzSxFq0l5HIZLqkA0BpFIdEy4CbndkNtSDsYJ4CsnHGke2u8wLMlejmUN5QhWrbia4qWk+F9tBtjZEw2ZGppAn7lClqkXnkiJbkvEOvqi6moy9OwXs/t0iC/+AtjtWslioQMU4gCnxQs5Kb6shE1PKUI64nMXUU6J9+mkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=eqyfjQPg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44VAk0Eh003481;
	Fri, 31 May 2024 14:41:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PT9bb99hvJrXgxJG3sYKoYt8xXSBlx3kETEDEPuDMOs=; b=eqyfjQPgwPUIwNgS
	jIH57vlyN3xQVdyTnlpyF/ngwq7IhAs9tSUicVDOA7l+038fNZCvuxfekxChBdYv
	nMfuLwv0tKs4tT8L3/lcIY0nMtn5pxMUckOK4RdN6ejjjpqRcMbg910A2FZXFAQP
	ERhqqzRCJf4Qi/1SZGuxWjxgq7+zob+67R4bt7SH1HiGGWME7oF4BAt0q2lBDfNh
	vgdoKOB4ilJ8CvCZ9szPUhfx055Zfbgutvrh8YXztqt1VZz6XoKOjUjR+dPjtSuJ
	hUqpMCSz4vDrxwjNQyfumjSkGDajr16fDjZZ8/RIDwUnR5p8AEnmlmIx2jW37v78
	rEpbEw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yesw5k5d2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 14:41:03 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44VEf2D2018253
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 14:41:02 GMT
Received: from [10.216.43.130] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 31 May
 2024 07:40:55 -0700
Message-ID: <1e06ec86-8dff-41ea-f35c-3cf765ce54a2@quicinc.com>
Date: Fri, 31 May 2024 20:10:48 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sa8775p: Add IMEM and PIL info
 region
Content-Language: en-US
To: Tengfei Fan <quic_tengfan@quicinc.com>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_kbajaj@quicinc.com>,
        <kernel@quicinc.com>
References: <20240531093531.238075-1-quic_tengfan@quicinc.com>
 <20240531093531.238075-3-quic_tengfan@quicinc.com>
From: Mukesh Ojha <quic_mojha@quicinc.com>
In-Reply-To: <20240531093531.238075-3-quic_tengfan@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: HqktrI6Lq3HJvZLOVk6jeuiC8Uhs0DUs
X-Proofpoint-GUID: HqktrI6Lq3HJvZLOVk6jeuiC8Uhs0DUs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-31_10,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=677 phishscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 spamscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405310109



On 5/31/2024 3:05 PM, Tengfei Fan wrote:
> Add a simple-mfd representing IMEM on SA8775p and define the PIL
> relocation info region, so that post mortem tools will be able
> to locate the loaded remoteprocs.
> 
> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
> ---
>   arch/arm64/boot/dts/qcom/sa8775p.dtsi | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> index eae0de9720b5..89496728d840 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> @@ -3044,6 +3044,20 @@ tlmm: pinctrl@f000000 {
>   			wakeup-parent = <&pdc>;
>   		};
>   
> +		sram: sram@146d8000 {
> +			compatible = "qcom,sa8775p-imem", "syscon", "simple-mfd";
> +			reg = <0x0 0x146d8000 0x0 0x1000>;
> +			ranges = <0x0 0x0 0x146d8000 0x1000>;
> +
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +
> +			pil-reloc@94c {
> +				compatible = "qcom,pil-reloc-info";
> +				reg = <0x94c 0xc8>;
> +			};
> +		};
> +

Reviewed-by: Mukesh Ojha <quic_mojha@quicinc.com>

-Mukesh


