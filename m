Return-Path: <linux-arm-msm+bounces-45501-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F2967A16131
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Jan 2025 11:27:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 448FA7A11D8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Jan 2025 10:27:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80FC91B042C;
	Sun, 19 Jan 2025 10:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GIxbE1c0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD5E1ACEA6;
	Sun, 19 Jan 2025 10:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737282448; cv=none; b=jN/b9Dt3I5OAnwcI787NYvJnroI7m7KRPxjrrTz+LdmsVOoXAoa+D4rJeakgo1iUvYXD2gw7vyD/lPj4FIKKiGrvwSJyfmT0P5r/8eqr+CZQyqr0nrEAc7j3HLFgWG7h/Kr/YmQUqDzeeIs+GlVGrxn30/M6dFjcvqOoVRqgBz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737282448; c=relaxed/simple;
	bh=aLgqa22Ei/Vey16JzzPttEweVxD6Aa2gbjPo0A9yDgA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Rwi/d+8e81FhAtJq/rpi62Zcn1ky/+SBec2N7hySLYEBHB7L9HKFBAA3D0lr6yF7luPcruzjBiCYriEsyhuCuH8TSoqSezrzo2r+q9/d8YbBdEMGbhRBaB6UmGUBgOrvumUuCT4ZGik1vqGexWGBe/pptL2UkbyuNL4iY0YYmYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GIxbE1c0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50J8K2l3000709;
	Sun, 19 Jan 2025 10:27:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VHlB8lsyxftXv539h9G4EDgKIH5xSAtqzfvrtrVHcps=; b=GIxbE1c0qdKnyJ5G
	hOBJ/HXAEjIcP7Pke2C+7TIrtbaaqX0Y2NjC6TMRk2QzTKd3XnTgBAD55KVDQfFL
	WlTSctvZI1BREHeV/e8b72WHgfTEZAY1JfQbKPzbisIasDrf573DvwePVlUbxbJi
	0tGmRGjmb0NcN3VR4bvoCQ3nQlYVp7Vk+q2CZiUc9mGDSmaPoqM828GJ3d88OwpE
	fINmuZXaxTJWKy2/6AsTtA7QrV6/JAqsFtzNGcE+tCsfxsXOWbjXr5X6tEPA8g3E
	Qm18ntdYUlOOWN5Tz5ElrfzwPf+w1nT6H6slxVOO4ZgZi/Dq/3f3N2kWCWtny4Z6
	GWiH2A==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 448w8b05dh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 19 Jan 2025 10:27:23 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50JARMii013764
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 19 Jan 2025 10:27:22 GMT
Received: from [10.216.35.245] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 19 Jan
 2025 02:27:18 -0800
Message-ID: <f2c638c0-a638-4c8c-aefa-ecfeee55dd24@quicinc.com>
Date: Sun, 19 Jan 2025 15:56:57 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: Add clock nodes for multimedia
 clock
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ajit Pandey
	<quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        "Jagadeesh Kona" <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20241108-qcs615-mm-dt-nodes-v1-0-b2669cac0624@quicinc.com>
 <20241108-qcs615-mm-dt-nodes-v1-1-b2669cac0624@quicinc.com>
 <7imdhfeq5tvjy43337xryqrhom2r5xezu2kx4jzasafsfsberj@c7zcab5scegv>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <7imdhfeq5tvjy43337xryqrhom2r5xezu2kx4jzasafsfsberj@c7zcab5scegv>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: PXt_HC_Yg72XcWB1lO43AixyJpH6K9v5
X-Proofpoint-ORIG-GUID: PXt_HC_Yg72XcWB1lO43AixyJpH6K9v5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-18_10,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 lowpriorityscore=0
 mlxlogscore=799 impostorscore=0 mlxscore=0 malwarescore=0 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501190086



On 11/9/2024 5:28 AM, Dmitry Baryshkov wrote:
>>   #include <dt-bindings/interconnect/qcom,qcs615-rpmh.h>
>> @@ -488,6 +492,18 @@ qup_uart0_rx: qup-uart0-rx-state {
>>   			};
>>   		};
>>   
>> +		gpucc: clock-controller@5090000 {
>> +			compatible = "qcom,qcs615-gpucc";
>> +			reg = <0 0x5090000 0 0x9000>;
> Please pad address field to 8 digits (just the address, not the size)
> 

Will fix in the next patch.

>> +

-- 
Thanks & Regards,
Taniya Das.


