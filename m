Return-Path: <linux-arm-msm+bounces-36073-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E854D9B1C4C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Oct 2024 07:30:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 39B06282142
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Oct 2024 06:30:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C0973FBB3;
	Sun, 27 Oct 2024 06:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Yc052Aw2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E4C638DD6;
	Sun, 27 Oct 2024 06:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730010604; cv=none; b=QhrgHyN8hwZiqWuR+kUuMscXvGIzEskjeFmFtYIgFaAh0mOJf/Gw9Q+zqBqcrXvVrzDJetNXeAh/btM4N6FX3s587yCBP+51lYDVyD6l+cfuuT4q4u+n8qwzDgvZxDqP1mhG/eDL0btDpWm/BrKm+DWXvIHuI+gDtVVGxoiZa24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730010604; c=relaxed/simple;
	bh=avM9bscmw2QHta7ureWBTBRL7m0i0B+GsDNeOYpZfe8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=pL3Ehj4LKhkG6NUqmqam137/mhrt/PUAZAAMmZpUw6U6CgeGg9YX4gaN7i1mQekGnSR0vxHIJ4lO55srGiE7PzoKpKMvpMYxLZ01cHkEiZVK7kl0r/VYr7AUPKAMlVhjrg1Myu19bu36BCCN4Snt+IUF9/TxCkWKhv7NIpOGQfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Yc052Aw2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49R4UWkd031630;
	Sun, 27 Oct 2024 06:29:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4BXh3w3Mm2KlrSXeKfbmMC+DB3Hn+2Pd69z2tlEq8K4=; b=Yc052Aw2chRppGg+
	8PfH2JgfbOPtV3XL+lq/H9BPcB0EpT+dzJkVjFVQkQPiKGd+5VqswSxYirkhc1Ak
	uVjJJ9U468VgjQ0U3yACJAp3NVswDF4KeTihd2XOGo3XXxD1A9Xyl8Kmg3Na5+Uk
	oXs/BSyLbZt05KoyARLu3RelaBFiIQCunNMc7EuLKRZilI3CCdunpQx6yldY98mI
	PQy8rN+yLfw5nABh9AFh20dcIFwryyRkZ9iwuqd0WhV3cvAaN1Eujl/s2lDNg/i6
	qIaPw/4TnLWJto1wOZdegV7JkcfVrGqmynHSIoMbl0yJd4f6G43aeGM4unWQj5L5
	Zp7UZQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42gqe5t2at-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 27 Oct 2024 06:29:55 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49R6Tsth002445
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 27 Oct 2024 06:29:54 GMT
Received: from [10.216.2.255] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sat, 26 Oct
 2024 23:29:50 -0700
Message-ID: <720aa372-a04b-4b0f-b2da-3be37a319ec9@quicinc.com>
Date: Sun, 27 Oct 2024 11:59:44 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: Enable USB controllers for
 QCS8300
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <quic_ppratap@quicinc.com>, <quic_jackp@quicinc.com>
References: <20241011074619.796580-1-quic_kriskura@quicinc.com>
 <20241011074619.796580-3-quic_kriskura@quicinc.com>
 <xijjs445fzeuzbj2bg3ziwlzenrk4wo5zlyze4j5mldb444oj7@73ynic4xqfdj>
Content-Language: en-US
From: Krishna Kurapati <quic_kriskura@quicinc.com>
In-Reply-To: <xijjs445fzeuzbj2bg3ziwlzenrk4wo5zlyze4j5mldb444oj7@73ynic4xqfdj>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: KdrcJsoaEaZ41LBVmnzrdu8n7UJ4DWqU
X-Proofpoint-ORIG-GUID: KdrcJsoaEaZ41LBVmnzrdu8n7UJ4DWqU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 phishscore=0 bulkscore=0 mlxlogscore=459 malwarescore=0 adultscore=0
 priorityscore=1501 impostorscore=0 mlxscore=0 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410270055



On 10/26/2024 11:06 PM, Dmitry Baryshkov wrote:
> On Fri, Oct 11, 2024 at 01:16:19PM +0530, Krishna Kurapati wrote:
>> Enable primary USB controller on QCS8300 Ride platform. The primary USB
>> controller is made "peripheral", as this is intended to be connected to
>> a host for debugging use cases.
>>
>> Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 23 +++++++++++++++++++++++
>>   1 file changed, 23 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
>> index 7eed19a694c3..3e925228379c 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
>> @@ -265,3 +265,26 @@ &ufs_mem_phy {
>>   	vdda-pll-supply = <&vreg_l5a>;
>>   	status = "okay";
>>   };
>> +
>> +&usb_1_hsphy {
>> +	vdda-pll-supply = <&vreg_l7a>;
>> +	vdda18-supply = <&vreg_l7c>;
>> +	vdda33-supply = <&vreg_l9a>;
>> +
>> +	status = "okay";
>> +};
>> +
>> +&usb_qmpphy {
>> +	vdda-phy-supply = <&vreg_l7a>;
>> +	vdda-pll-supply = <&vreg_l5a>;
>> +
>> +	status = "okay";
>> +};
>> +
>> +&usb_1 {
>> +	status = "okay";
>> +};
>> +
>> +&usb_1_dwc3 {
>> +	dr_mode = "peripheral";
>> +};
> 
> So, can it be used as a USB host controller / connector? What needs to
> be done in such a case?
> 
Adding vbus boost pinctrl and changing dr_mode to host must be enough 
for this case.

Regards,
Krishna,

