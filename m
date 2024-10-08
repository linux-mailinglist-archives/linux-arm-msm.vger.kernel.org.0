Return-Path: <linux-arm-msm+bounces-33556-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52BE29949BC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 14:26:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 10E5E2822D6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 12:26:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDE811DF24D;
	Tue,  8 Oct 2024 12:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="PKbzeZZt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28EEB4C97;
	Tue,  8 Oct 2024 12:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728390338; cv=none; b=anBu8h8+ZHPOCNGg+M8RWU/nnU3hii6UmokTPf64RKV9WPj8TaFvf0GzAJY5CiJ40+wcX4zmdURmVFC/26STXjEhrzynHKir0Jtp8w2P7kQPSLHaMCG4rLYOUtLJZCWgBAWl1iqkLYxc8aNLgBQteH1VVwxLTzIoQRwSPg3bjv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728390338; c=relaxed/simple;
	bh=YfIu97ocnJkzq+weij9l4JKl/8R6QAvuCB0Apc/BR9s=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=mf/s49lRSO7FJ6tiggZ/clv9HXx26eh1Y2KEWK423wssXQV+wdhfWPnRBO1F8Gy00hbMjVvYsxY80XV1mfIY+mNP2Wqla3dxiLUHISeRdp3HK/jjlgx5fiY+FCfNEDegP8lq7seaYb2jG9/2g4QddKnXA3yke4CleMtf3TnUEb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=PKbzeZZt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4984ScNg008706;
	Tue, 8 Oct 2024 12:25:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4jxF7w+K3McN6/KIutBaKbsS8CYGYF4IWYgmCMS+nDg=; b=PKbzeZZtnhjW85Dl
	818lm96L67daXTHEiAz7gYyYjVuNixUoxyFxRNW6JaIbS365TUYiuISvpLcN4fkV
	XwZbarzepa5sl4UjtWOl7XaslUwL058meOgo7uepFtUlB7IJpdwX7ioIfOASmeud
	t7JIKyMTsryEXlMFbSSVNolvHuCkRyEnTEV+yJP8elKwJzIWUMEz9hu1Jt/kre//
	b09akcqvsbKyrMDEL1Lzmo/3u/d0RKTto5GdxE7Kwwc2Bn50OlNX1FbY3lnxkXHu
	4zy+5IgBgx9yKmn2N2BJLdJ1XViSRglhEypPJAt2/cIlv4wd4sPi4H6mjIkp7nTc
	drfBhQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 424wrc17h5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Oct 2024 12:25:34 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 498CPXQM014990
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 8 Oct 2024 12:25:33 GMT
Received: from [10.217.218.111] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 8 Oct 2024
 05:25:30 -0700
Message-ID: <70c2e4c0-aa5a-4d61-9b12-ee7cc5106ead@quicinc.com>
Date: Tue, 8 Oct 2024 17:55:27 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: sa8775p: Update iommu-map entry
To: <andersson@kernel.org>, <krzk+dt@kernel.org>
CC: <quic_krichai@quicinc.com>, <quic_vbadigan@quicinc.com>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        "open list:ARM/QUALCOMM SUPPORT"
	<linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED
 DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
        open list
	<linux-kernel@vger.kernel.org>
References: <20241008121755.1174730-1-quic_skananth@quicinc.com>
Content-Language: en-US
From: Subramanian Ananthanarayanan <quic_skananth@quicinc.com>
In-Reply-To: <20241008121755.1174730-1-quic_skananth@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: XU7-8HFb-IgBIPylIobZS4N0LMiX-mSA
X-Proofpoint-ORIG-GUID: XU7-8HFb-IgBIPylIobZS4N0LMiX-mSA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 impostorscore=0 suspectscore=0 mlxscore=0 clxscore=1015 spamscore=0
 adultscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410080078


On 10/8/2024 5:47 PM, Subramanian Ananthanarayanan wrote:
> SA8775P has only support for SMMU v2, due to this PCIe has limited
> SID entries to enable dynamic IOMMU mapping in the driver, hence
> we are updating static entries.
>
> iommu-map entries are added to support more PCIe device like switch
> attach, SRIOV capable devices. These entries are specific to this
> board as topology of PCIe devices can vary based on the end usecase
> connected via PCIe. For other board files, these entries may
> not be directly applicable.
>
> Signed-off-by: Subramanian Ananthanarayanan <quic_skananth@quicinc.com>
> ---
> Changes in V2:
> 	- Updated commit message.

forgot to add link to v1 : 
https://lore.kernel.org/lkml/20241001114601.1097618-1-quic_skananth@quicinc.com/

-Subramanian

> ---
> ---
>   arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 62 ++++++++++++++++++++++
>   1 file changed, 62 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> index 0c1b21def4b6..05c9f572ae42 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> @@ -675,6 +675,37 @@ &pcie0 {
>   	pinctrl-names = "default";
>   	pinctrl-0 = <&pcie0_default_state>;
>   
> +	iommu-map = <0x0 &pcie_smmu 0x0000 0x1>,
> +		    <0x100 &pcie_smmu 0x0001 0x1>,
> +		    <0x101 &pcie_smmu 0x0002 0x1>,
> +		    <0x208 &pcie_smmu 0x0003 0x1>,
> +		    <0x210 &pcie_smmu 0x0004 0x1>,
> +		    <0x218 &pcie_smmu 0x0005 0x1>,
> +		    <0x280 &pcie_smmu 0x0006 0x1>,
> +		    <0x281 &pcie_smmu 0x0007 0x1>,
> +		    <0x282 &pcie_smmu 0x0008 0x1>,
> +		    <0x283 &pcie_smmu 0x0009 0x1>,
> +		    <0x284 &pcie_smmu 0x000a 0x1>,
> +		    <0x285 &pcie_smmu 0x000b 0x1>,
> +		    <0x286 &pcie_smmu 0x000c 0x1>,
> +		    <0x287 &pcie_smmu 0x000d 0x1>,
> +		    <0x288 &pcie_smmu 0x000e 0x1>,
> +		    <0x289 &pcie_smmu 0x000f 0x1>,
> +		    <0x28a &pcie_smmu 0x0010 0x1>,
> +		    <0x28b &pcie_smmu 0x0011 0x1>,
> +		    <0x28c &pcie_smmu 0x0012 0x1>,
> +		    <0x28d &pcie_smmu 0x0013 0x1>,
> +		    <0x28e &pcie_smmu 0x0014 0x1>,
> +		    <0x28f &pcie_smmu 0x0015 0x1>,
> +		    <0x290 &pcie_smmu 0x0016 0x1>,
> +		    <0x291 &pcie_smmu 0x0017 0x1>,
> +		    <0x292 &pcie_smmu 0x0018 0x1>,
> +		    <0x293 &pcie_smmu 0x0019 0x1>,
> +		    <0x300 &pcie_smmu 0x001a 0x1>,
> +		    <0x400 &pcie_smmu 0x001b 0x1>,
> +		    <0x500 &pcie_smmu 0x001c 0x1>,
> +		    <0x501 &pcie_smmu 0x001d 0x1>;
> +
>   	status = "okay";
>   };
>   
> @@ -685,6 +716,37 @@ &pcie1 {
>   	pinctrl-names = "default";
>   	pinctrl-0 = <&pcie1_default_state>;
>   
> +	iommu-map = <0x0 &pcie_smmu 0x0080 0x1>,
> +		    <0x100 &pcie_smmu 0x0081 0x1>,
> +		    <0x101 &pcie_smmu 0x0082 0x1>,
> +		    <0x208 &pcie_smmu 0x0083 0x1>,
> +		    <0x210 &pcie_smmu 0x0084 0x1>,
> +		    <0x218 &pcie_smmu 0x0085 0x1>,
> +		    <0x280 &pcie_smmu 0x0086 0x1>,
> +		    <0x281 &pcie_smmu 0x0087 0x1>,
> +		    <0x282 &pcie_smmu 0x0088 0x1>,
> +		    <0x283 &pcie_smmu 0x0089 0x1>,
> +		    <0x284 &pcie_smmu 0x008a 0x1>,
> +		    <0x285 &pcie_smmu 0x008b 0x1>,
> +		    <0x286 &pcie_smmu 0x008c 0x1>,
> +		    <0x287 &pcie_smmu 0x008d 0x1>,
> +		    <0x288 &pcie_smmu 0x008e 0x1>,
> +		    <0x289 &pcie_smmu 0x008f 0x1>,
> +		    <0x28a &pcie_smmu 0x0090 0x1>,
> +		    <0x28b &pcie_smmu 0x0091 0x1>,
> +		    <0x28c &pcie_smmu 0x0092 0x1>,
> +		    <0x28d &pcie_smmu 0x0093 0x1>,
> +		    <0x28e &pcie_smmu 0x0094 0x1>,
> +		    <0x28f &pcie_smmu 0x0095 0x1>,
> +		    <0x290 &pcie_smmu 0x0096 0x1>,
> +		    <0x291 &pcie_smmu 0x0097 0x1>,
> +		    <0x292 &pcie_smmu 0x0098 0x1>,
> +		    <0x29d &pcie_smmu 0x0099 0x1>,
> +		    <0x300 &pcie_smmu 0x009a 0x1>,
> +		    <0x400 &pcie_smmu 0x009b 0x1>,
> +		    <0x500 &pcie_smmu 0x009c 0x1>,
> +		    <0x501 &pcie_smmu 0x009d 0x1>;
> +
>   	status = "okay";
>   };
>   

