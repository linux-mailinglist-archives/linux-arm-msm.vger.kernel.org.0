Return-Path: <linux-arm-msm+bounces-20932-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C841E8D3688
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 14:37:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 321AFB22452
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 12:37:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3182B181B94;
	Wed, 29 May 2024 12:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bkhT7CTg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C2A181335;
	Wed, 29 May 2024 12:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716986237; cv=none; b=jTPEZf7tvLzdUbyYwl9831A0IuQZ8rop4kjdvPFpxKr4yhq8WzWrtEei0WpjPxOROTIPpf/eZ7n7B5kQmjtKZKhuz2sFI06UvpizliUDxw96FHx/+naj7Q4dLgvF70+WQfSPCVkvXosr6z3x+oq7iLxB/cHmuKLgTfE9pQi5KA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716986237; c=relaxed/simple;
	bh=rlMTMekw3Ehq4273XEVr2djMOG2nxUGrOGMCVlLYDvQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=hXtnNlNPDY4e5QsR5n+cvfp2Sp44knH8g8CO4FjJvBcfoGcgDyNAOGhTXQFs34uijNxyTHmWpGVHT/iTX5VPSMVDO9fT8yWaBzSEg+r2be+s7VyxhJNrjgkQMjRcuyAlzKLAn7K+EIqNzkRFxRhnyJpHocZNhikUKCNNQPhRLwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bkhT7CTg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44T9xgF5013484;
	Wed, 29 May 2024 12:37:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SVcFj1tIJtvIRvjJ2upGm8GFXRpx09i0de9qvDHr50A=; b=bkhT7CTgVXiFZnIx
	vZXjqJ2jcVh0K8dDs1XZu8bqOqxNMQUzxVoggh0EdNb0gevPxpy18WpeYJomP5yp
	BRHZ/Cv3VlrhQ6fMxItujIMumDCqfiW8LMkH3W5ObiLQdqhmCEFD1SpjDbUenkC7
	sZlqE1RGPdZtqQo0dDBOVI3UcPDL0UVz+z3bcOApQgLJWDG1xcLIxzn2gQbQz8+5
	uEThaVVD25mn4yB53hTbFVrT6fP9Qi4WEmMFqdlh9odTQsZhiGHphfPQPOmHh25H
	atu2fU2dQa6yBzin4dYBpgBB5L0Ixn4WgxYxk769xHM6b9k8pZpodUON/Q4Gbbdc
	cXw/mA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yba2n0vn7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 May 2024 12:37:11 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44TCbAuD002717
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 May 2024 12:37:10 GMT
Received: from [10.216.41.231] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 29 May
 2024 05:37:00 -0700
Message-ID: <8c317b50-c6c0-95e4-7d85-76516a387f85@quicinc.com>
Date: Wed, 29 May 2024 18:06:55 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sa8775p: Add IMEM and PIL info
 region
Content-Language: en-US
To: Tengfei Fan <quic_tengfan@quicinc.com>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <andersson@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>
References: <20240529101929.3167610-1-quic_tengfan@quicinc.com>
 <20240529101929.3167610-3-quic_tengfan@quicinc.com>
From: Mukesh Ojha <quic_mojha@quicinc.com>
In-Reply-To: <20240529101929.3167610-3-quic_tengfan@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: qdxEmPyiVl7TKmt8PqEm8Hv-nVpxD7hE
X-Proofpoint-ORIG-GUID: qdxEmPyiVl7TKmt8PqEm8Hv-nVpxD7hE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-29_07,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0
 malwarescore=0 spamscore=0 bulkscore=0 mlxlogscore=633 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405290086



On 5/29/2024 3:49 PM, Tengfei Fan wrote:
> Add a simple-mfd representing IMEM on SA8775p and define the PIL
> relocation info region, so that post mortem tools will be able
> to locate the loaded remoteprocs.
> 
> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
> ---
>   arch/arm64/boot/dts/qcom/sa8775p.dtsi | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> index 5632fa896b93..eb33b1587802 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> @@ -3025,6 +3025,21 @@ tlmm: pinctrl@f000000 {
>   			wakeup-parent = <&pdc>;
>   		};
>   
> +		sram: sram@146d8000 {
> +			compatible = "qcom,sa8775p-imem", "syscon", "simple-mfd";
> +			reg = <0x0 0x146d8000 0x0 0x1000>;
> +
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +
> +			ranges = <0x0 0x0 0x146d8000 0x1000>;

This could be moved up along with reg region.

-Mukesh

> +
> +			pil-reloc@94c {
> +				compatible = "qcom,pil-reloc-info";
> +				reg = <0x94c 0xc8>;
> +			};
> +		};
> +
>   		apps_smmu: iommu@15000000 {
>   			compatible = "qcom,sa8775p-smmu-500", "qcom,smmu-500", "arm,mmu-500";
>   			reg = <0x0 0x15000000 0x0 0x100000>;

