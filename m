Return-Path: <linux-arm-msm+bounces-47893-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8EEA33CD1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 11:35:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 540327A1EEE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 10:34:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61C39211476;
	Thu, 13 Feb 2025 10:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fTiOJD0Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 916922080D4;
	Thu, 13 Feb 2025 10:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739442930; cv=none; b=XeG8bQR7I3FNxwdovrN0UeYDfvm5OVzmhSDQMSMdmWhpinSvMdw5Ijle0hqVhuFKOaLXWAVFqAZOBru0ydzEh4nyqMu2iEWmVQ8LxdtfICz1qGFeS/cQhbVrIPrwqD+Yp1EYn3UgjKuB/N7G9acS/CGcSmq0EiLqyghywsu2cwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739442930; c=relaxed/simple;
	bh=iKv36wyBftopnQn1R7KeXZd6yqLH/bu5+0UtsjV6sCM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=iDfjfokdyZlkx83/YT/TDFogGQIOlZl3pCF2OQK/2zwgW5uk5X6TCgoo9bDPqBj024VDt/QwZR/QjOtWsENtf1uVdYGNL7BzwbvxZbMWPN1N5aogsAk9D6JcDV8wC5rvMoe4hv1cRwJojJ8RfJhqeUh8U6pmiTzXJvA3u+WLjy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fTiOJD0Q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51DA72kG032747;
	Thu, 13 Feb 2025 10:35:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	thaTTbC4cBiLguF9ah5xmscjMUoW45H5aqGsBgUzVBM=; b=fTiOJD0QBHfRsC7n
	rEOXeNDk+JHyU8vm7bh7ieRJ1SAxr1S9/WAtyeIeWt23iZaOOKzDiYU/D6hNIa9W
	hRFwmDM41+MW3EO42iTf1txAFKIaHAPZSNl6FLyd03s/RUSTE6aAk0UK0bfg0x//
	oPimVxL/+2rIfimZn1nMENDskcZ35C86KMzI3ZWXrbVuKhuuP6fOa+ZnmLgt4VDH
	68sYqv69dfQbAZ1jmRbAKTi1+GBmpKGO/F4c+rlY9f8JO9pYlSbKDxZZse6A628r
	9qvdkFsBgqtXD5F3Ql/SZqzYHwPjaWkLCZv1e0w/LW4jnrtMOCZmawSCAFmrrMbp
	8A8GRQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44seq002hw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Feb 2025 10:35:23 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51DAZDXT018709
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Feb 2025 10:35:13 GMT
Received: from [10.231.216.52] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 13 Feb
 2025 02:35:09 -0800
Message-ID: <1b2dfb74-3c4e-4739-a5eb-6aa07386a9be@quicinc.com>
Date: Thu, 13 Feb 2025 18:35:06 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] arm64: dts: qcom: qcs8300-ride: enable BT on
 qcs8300-ride
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_jiaymao@quicinc.com>,
        <quic_shuaz@quicinc.com>, <quic_zijuhu@quicinc.com>,
        <quic_mohamull@quicinc.com>
References: <20250211104421.1172892-1-quic_chejiang@quicinc.com>
 <20250211104421.1172892-2-quic_chejiang@quicinc.com>
 <eebcc0e7-4f87-45d5-8ad4-9d24145ef5b2@kernel.org>
 <6149d02f-21a2-459e-91f2-6c91b5093807@quicinc.com>
 <b9edb462-bf94-4c6f-a6dc-e22024a8bcb2@kernel.org>
Content-Language: en-US
From: Cheng Jiang <quic_chejiang@quicinc.com>
In-Reply-To: <b9edb462-bf94-4c6f-a6dc-e22024a8bcb2@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: fRu9y3zPdUvbAL_-5l5tRR6KjwfPPkRJ
X-Proofpoint-ORIG-GUID: fRu9y3zPdUvbAL_-5l5tRR6KjwfPPkRJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-13_04,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 mlxscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 mlxlogscore=770 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502130081

Hi Krzysztof,

On 2/13/2025 3:36 PM, Krzysztof Kozlowski wrote:
> On 13/02/2025 06:56, Cheng Jiang wrote:
>> Yes, label is not needed. 
>>>> +		compatible = "qcom,wcn6855-bt";
>>>> +		firmware-name = "QCA6698/hpnv21", "QCA6698/hpbtfw21.tlv";
>>>> +
>>>> +		pinctrl-names = "default";
>>>> +		pinctrl-0 = <&bt_en_state>;
>>>> +		enable-gpios = <&tlmm 55 GPIO_ACTIVE_HIGH>; /* BT_EN */
>>>> +
>>>> +		vddio-supply       = <&vreg_conn_pa>;         /* bt-vdd-ctrl1-supply */
>>>> +		vddbtcxmx-supply   = <&vreg_conn_1p8>;        /* bt-vdd-ctrl2-supply */
>>>
>>> Only one space before '='.
>>>
>>> I think this has multiple test failures.
>>>
>> Ack, Will change in next version. 
> 
> Are you going to test it as well?
> 
Yes, I will test it. Thanks! 

> Best regards,
> Krzysztof


