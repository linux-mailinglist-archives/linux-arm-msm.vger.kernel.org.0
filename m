Return-Path: <linux-arm-msm+bounces-36084-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D979B1FD1
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Oct 2024 20:02:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A3935280FD9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Oct 2024 19:02:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 018573A1DB;
	Sun, 27 Oct 2024 19:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JrZqvHDS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E9F1DFE8;
	Sun, 27 Oct 2024 19:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730055735; cv=none; b=LYq9r9tnb2kogQJ8iu/xg36uvq4DhYpwRE4fctSAQ9tPrlwrE+zBCY5PvHUKlgNgYrPlkCFILB4C6atmlhehOx9dAOGlBPArHRz+QSswvp0XWR7Ku7ciylU2+XJeC0LQ6/DW13YK5AFo1MlRxaD8ZbS42IJH3AhlPToaxbgsI0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730055735; c=relaxed/simple;
	bh=WvVdXnvaClZZhGy9E3SXD2zt0hOOkWPIob0/lnYVUlw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=GRxuWluf4rsF5eGb0CKESQUcpYtWOeq0cKcCo7RT1E1tqxAeDLe3vFpGV7mBye2WQrFr1aIJiSd58VVGI8Z9fngEfDIaI6CkbhUWjrJGhSimQlceSQ+NB8dFxnw7T2v1TL8nFaboUk++6Vmgo5eoaGN8SgH3lKXzjDtoLnOa5wM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JrZqvHDS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49REw7LE002830;
	Sun, 27 Oct 2024 19:02:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DB7k7FTPzcBwXcR8I+IAPfa2fMINv1VnibF6k3GaxKY=; b=JrZqvHDSfRZzPc99
	JysowDQNjnMn2JZTFtEOuZ9pz3RsyP8F4UP19blJryBfp7pSdvPq2JK+0Va9HdzM
	NAw/ncJX5da+DepDeP7DADGYydDFWuIvkVRh20KhqT9OHMOcwzWtzZYmYTL7PzOw
	nRby0vGaK/dFzr861gsI+BxAaSoB6j/sG7KBNAI9Ot5oJdBZNjRzjpCSUus5wipC
	L9v17XXo38XjbfA35y6BJ41U54QTauam3mw2ZOsWsDqm07XQ1TXD1LD9Mb7w1sI8
	WT9N8gC1jgVaSHkpWuSJMBLmC4W28PgMgDIaklHZ/6jBocEwwwlAsnq2tf5eAxhK
	ywkmCw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42gp4du2b9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 27 Oct 2024 19:02:09 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49RJ297n007664
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 27 Oct 2024 19:02:09 GMT
Received: from [10.216.2.255] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 27 Oct
 2024 12:02:05 -0700
Message-ID: <c87f96a7-f391-41d0-821b-cbd4e25b5831@quicinc.com>
Date: Mon, 28 Oct 2024 00:32:02 +0530
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
 <720aa372-a04b-4b0f-b2da-3be37a319ec9@quicinc.com>
 <fhgw2re45vn63lqox7vikg3hcak3wjf4wududebw7ow2enrqiq@inajq4l5qqir>
Content-Language: en-US
From: Krishna Kurapati <quic_kriskura@quicinc.com>
In-Reply-To: <fhgw2re45vn63lqox7vikg3hcak3wjf4wududebw7ow2enrqiq@inajq4l5qqir>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Kdkg1ZT5aT34BhSeT16UEsDfN-4oaqzm
X-Proofpoint-GUID: Kdkg1ZT5aT34BhSeT16UEsDfN-4oaqzm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 mlxlogscore=636 clxscore=1015 spamscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0
 mlxscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410270167



On 10/27/2024 11:14 PM, Dmitry Baryshkov wrote:
> On Sun, Oct 27, 2024 at 11:59:44AM +0530, Krishna Kurapati wrote:
>>
>>
>> On 10/26/2024 11:06 PM, Dmitry Baryshkov wrote:
>>> On Fri, Oct 11, 2024 at 01:16:19PM +0530, Krishna Kurapati wrote:
>>>> Enable primary USB controller on QCS8300 Ride platform. The primary USB
>>>> controller is made "peripheral", as this is intended to be connected to
>>>> a host for debugging use cases.
>>>>
>>>> Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
>>>> ---
>>>>    arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 23 +++++++++++++++++++++++
>>>>    1 file changed, 23 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
>>>> index 7eed19a694c3..3e925228379c 100644
>>>> --- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
>>>> +++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
>>>> @@ -265,3 +265,26 @@ &ufs_mem_phy {
>>>>    	vdda-pll-supply = <&vreg_l5a>;
>>>>    	status = "okay";
>>>>    };
>>>> +
>>>> +&usb_1_hsphy {
>>>> +	vdda-pll-supply = <&vreg_l7a>;
>>>> +	vdda18-supply = <&vreg_l7c>;
>>>> +	vdda33-supply = <&vreg_l9a>;
>>>> +
>>>> +	status = "okay";
>>>> +};
>>>> +
>>>> +&usb_qmpphy {
>>>> +	vdda-phy-supply = <&vreg_l7a>;
>>>> +	vdda-pll-supply = <&vreg_l5a>;
>>>> +
>>>> +	status = "okay";
>>>> +};
>>>> +
>>>> +&usb_1 {
>>>> +	status = "okay";
>>>> +};
>>>> +
>>>> +&usb_1_dwc3 {
>>>> +	dr_mode = "peripheral";
>>>> +};
>>>
>>> So, can it be used as a USB host controller / connector? What needs to
>>> be done in such a case?
>>>
>> Adding vbus boost pinctrl and changing dr_mode to host must be enough for
>> this case.
> 
> Could you please mention those either in the commie message or in the
> comment before the board DT file?
> 

Sure, I can update commit text to add something like the following:

"In case first controller needs to be configured in host mode, X-GPIO to 
be enabled and dr_mode to be changed accordingly."

But when we add second controller (which I will after SPMI node is 
done), this commit text would be redundant as the same file would show 
example for host mode as well.

Regards,
Krishna,

