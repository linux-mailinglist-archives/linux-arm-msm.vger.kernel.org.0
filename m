Return-Path: <linux-arm-msm+bounces-27201-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7473F93F18F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 11:48:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1ED401F238B9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 09:48:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E491913F42F;
	Mon, 29 Jul 2024 09:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XwgYUAlX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 765B513E8B6;
	Mon, 29 Jul 2024 09:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722246521; cv=none; b=tjK8oNShnubs4csj8JxoFSvEzNfyk3iAxuUENcFkza06K1mcL5XAk0ctEmYgwv7Fy73rt+YcY8Q3Ttat33H0o8WMD4O21ilWWR0a9NPZK5HWNLgKCUXTCr7N5/Rlm8L04unf2duxRoXadRZ02ttEpG0gOxu34dcwfnRUtG6Nxgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722246521; c=relaxed/simple;
	bh=qSPyotyVUhFqzMLYuSb8yd20opgR/58WglImplQRbIs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=r9npR0cF05D6TQJlPcL6yq963bUTJ+qcFH5WfwnWFtjcNmubNrEJMcWDu7Rbrg7z9V/BPx5KRNSjJk1brPVQBvglh1i/mskUIv5lEXSMRqhqFYECim/IoF+kf+CPTiw1kSWtFGzM1N35LJengpdSDaUpGr/N8fhlfR7Q1udveSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XwgYUAlX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46SMaD6m030534;
	Mon, 29 Jul 2024 09:48:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GMTwjppP8KE8bJ8k15SFfFSrauYBMpXxI/bn2QkeTbY=; b=XwgYUAlXe1ID+VP7
	NlWZ6zASZiycjFvTeDZIzyjkK4ypgFF7j4U9K+MczOAHmxLgy28gf84lCN7MjDjn
	hrSFHtHl2a+HY+iHrIi7MCm0iXuukCIrMpTRaOY6ZYo9V138hiDEOQNHeKj7UcEF
	lPwX3HQkDyxzBUa5NbCbnp7DpArnAOBd6pp6WVslirYMcnCoHgPS8Be0TBv9eLT3
	OJzWCKMKYdZseRQAmTwgxAoXFqhf/1e9p0z0Z7ZpcfiCD3JZBrq3p0p/r2KcKitq
	dAhOtOQotX4VIYGz7CLUcHTZ+vpTQEQlQ8ZTlF6zu2RSAQ+bQBsTK01O9OSS0qgC
	LxxT2Q==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40mt68kkma-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jul 2024 09:48:33 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46T9mWoh007642
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jul 2024 09:48:32 GMT
Received: from [10.239.132.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 29 Jul
 2024 02:48:27 -0700
Message-ID: <6e69b670-b228-4ed8-a2f5-6fa22ddb1552@quicinc.com>
Date: Mon, 29 Jul 2024 17:48:25 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] phy: qcom: add the SGMII SerDes PHY driver support
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
CC: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <kernel@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20240709-add_qcs9100_dwmac_sgmii_hpy_compatible-v2-0-5ffeb16252db@quicinc.com>
 <20240709-add_qcs9100_dwmac_sgmii_hpy_compatible-v2-2-5ffeb16252db@quicinc.com>
 <CACMJSet_FX85rwa2JNBCSfVKUQbZrNdi-ya4KnJjNOumrJaOfg@mail.gmail.com>
From: Tengfei Fan <quic_tengfan@quicinc.com>
In-Reply-To: <CACMJSet_FX85rwa2JNBCSfVKUQbZrNdi-ya4KnJjNOumrJaOfg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: lDELU6EuLUVCnFUxiU_Ix846arGKREcX
X-Proofpoint-GUID: lDELU6EuLUVCnFUxiU_Ix846arGKREcX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-29_07,2024-07-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 adultscore=0 bulkscore=0 mlxscore=0 lowpriorityscore=0
 impostorscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0
 clxscore=1015 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407290066



On 7/9/2024 11:42 PM, Bartosz Golaszewski wrote:
> On Tue, 9 Jul 2024 at 17:16, Tengfei Fan <quic_tengfan@quicinc.com> wrote:
>>
>> Add the SGMII SerDes PHY driver support for QCS9100 platform.
>> QCS9100 is drived from SA8775p. Currently, both the QCS9100 and SA8775p
>> platform use non-SCMI resource. In the future, the SA8775p platform will
>> move to use SCMI resources and it will have new sa8775p-related device
>> tree. Consequently, introduce "qcom,qcs9100-dwmac-sgmii-phy" to the
>> SGMII SerDes PHY device match table.
>>
>> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
>> ---
>>   drivers/phy/qualcomm/phy-qcom-sgmii-eth.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c b/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c
>> index 5b1c82459c12..0ea7140564a9 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c
>> @@ -353,6 +353,7 @@ static int qcom_dwmac_sgmii_phy_probe(struct platform_device *pdev)
>>   }
>>
>>   static const struct of_device_id qcom_dwmac_sgmii_phy_of_match[] = {
>> +       { .compatible = "qcom,qcs9100-dwmac-sgmii-phy" },
>>          { .compatible = "qcom,sa8775p-dwmac-sgmii-phy" },
>>          { },
>>   };
>>
>> --
>> 2.25.1
>>
> 
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org

After considering the feedback provided on the subject, We have decided
to keep current SA8775p compatible and ABI compatibility in drivers.
Let's close this session and ignore all the current patches here.
Thank you for your input.

-- 
Thx and BRs,
Tengfei Fan

