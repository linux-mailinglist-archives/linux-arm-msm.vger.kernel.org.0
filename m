Return-Path: <linux-arm-msm+bounces-34896-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 950379A3790
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 09:48:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 23ECC2822F0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 07:48:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 975AD18C02D;
	Fri, 18 Oct 2024 07:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="i1Zp4HnA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8BF218BBAE;
	Fri, 18 Oct 2024 07:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729237723; cv=none; b=j4GsKFIRxaByJQlg+xqA9tUMSLFha/82A1so4GpEExln9mOO0tN/yXL3dxVYuoH0TbK1p2bpPbw5Y8rgl4ghmQC3et22OUkXH3fyq6/pNueSsi1fbRXatjqM0q7eIfxXiDrueyrAznCIW6L7fOoV0y9KXVvdt4CWQhc+YZp6PrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729237723; c=relaxed/simple;
	bh=WVylbjbYsnKi037x0sH/IGcZHyEhM4o6hbSPFJ3eWpk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=AGaVHBKrol+jFJnjbvIZapAcTss4kD3PH33HGuiymu2oEdNntFTwEIxEf/LM+hTeIH50BHmMFEX3fX6dW7HtEGhx17T3y1R9IlFhhSp25Z/Dzt1GhobAPDhOtEBoHkTTc7x4A2pUYBVPs5P9gs8HrcPM9yF4TPWW5+d4ZkRWOtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=i1Zp4HnA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49I4vEJf016598;
	Fri, 18 Oct 2024 07:48:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OzoaWvCEqfRjWD3bU1bsw3GKto7yOeJ28P0BvJsYBQE=; b=i1Zp4HnAQ1QTPLxd
	CMkVvPD9J8nRKUgLSfzslY2GUNKSy5P+QywV0qE1iwL5BdSjQr2XiZXUUGsq60C8
	/bDVBQmRQCrSjwOny9S77ItecdiPlvx0uI9q0gIh9qTC6jJBObblB1PQXwz+NKx2
	jf5/KDhWHRzSLq/+9SyMbylo0HKqfYPtRRJjaTr0F5AWKEyk5lyDVX+OY/T2wqPz
	+HFm3OZwmP9cbowszKO9MzwvOYAHtL16x0P4KSj7JtnNvnDrx9jQ6p3cO4KnJICB
	ONcpwx/ZBvZdYRcfqAvrlRapJUVK6Zna5yImrTsmUhEbulTB7wsZIux56pjHUrwT
	n4br0w==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42bh3p8eu2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 07:48:34 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49I7mXeL015257
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 07:48:33 GMT
Received: from [10.233.17.145] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 18 Oct
 2024 00:48:27 -0700
Message-ID: <aa68e5ab-86a6-430e-92d8-ed89b4eb37f7@quicinc.com>
Date: Fri, 18 Oct 2024 15:48:24 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] phy: qcom: qmp-usbc: Add qmp configuration for
 QCS615
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Krishna Kurapati
	<quic_kriskura@quicinc.com>
CC: Vinod Koul <vkoul@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Wesley Cheng
	<quic_wcheng@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>,
        Manivannan Sadhasivam
	<manivannan.sadhasivam@linaro.org>,
        <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <quic_ppratap@quicinc.com>,
        <quic_jackp@quicinc.com>
References: <20241017130701.3301785-1-quic_kriskura@quicinc.com>
 <20241017130701.3301785-6-quic_kriskura@quicinc.com>
 <CAA8EJprcOU6qeJvHH+MVoPnQ+mGcos=pDOVBSeSUfBGw-KR6tA@mail.gmail.com>
From: Tingwei Zhang <quic_tingweiz@quicinc.com>
In-Reply-To: <CAA8EJprcOU6qeJvHH+MVoPnQ+mGcos=pDOVBSeSUfBGw-KR6tA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Pvo3hA6bTlT-uZ_6lKCKZElyxBT6emfK
X-Proofpoint-ORIG-GUID: Pvo3hA6bTlT-uZ_6lKCKZElyxBT6emfK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 mlxscore=0 malwarescore=0
 clxscore=1011 phishscore=0 priorityscore=1501 spamscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410180048

On 10/18/2024 2:27 AM, Dmitry Baryshkov wrote:
> On Thu, 17 Oct 2024 at 16:07, Krishna Kurapati
> <quic_kriskura@quicinc.com> wrote:
>>
>> Provide PHY configuration for the USB QMP PHY for QCS615 Platform.
>>
>> Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> After checking platform details,
> 
> Unreviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Please perform global s/QCS615/SM6150/ and s/qcs615/sm6150/

QCS615 and SM6150 are different variants of the same SoC. QCS615 is an 
IoT variant, while SM6150 is a mobile variant. We are currently adding 
QCS615 SoC support to the upstream Kernel, as it is in an active 
development stage and we anticipate many products based on this SoC. On 
the other hand, the SM6150 is an older mobile platform that is unlikely 
to be used in new designs. For a product introduction of the QCS615, 
please refer to 
https://docs.qualcomm.com/bundle/publicresource/87-83838-1_REV_A_Qualcomm_IQ6_Series_Product_Brief.pdf

> 
>> ---
>>   drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
>> index d4fa1063ea61..c56ba8468538 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
>> @@ -1123,6 +1123,9 @@ static const struct of_device_id qmp_usbc_of_match_table[] = {
>>          }, {
>>                  .compatible = "qcom,qcm2290-qmp-usb3-phy",
>>                  .data = &qcm2290_usb3phy_cfg,
>> +       }, {
>> +               .compatible = "qcom,qcs615-qmp-usb3-phy",
>> +               .data = &qcm2290_usb3phy_cfg,
>>          }, {
>>                  .compatible = "qcom,sdm660-qmp-usb3-phy",
>>                  .data = &sdm660_usb3phy_cfg,
>> --
>> 2.34.1
>>
> 
> 


-- 
Thanks,
Tingwei

