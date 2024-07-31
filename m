Return-Path: <linux-arm-msm+bounces-27586-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A22AD94390A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 00:38:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5EB07285104
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 22:38:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB2CA16D4CD;
	Wed, 31 Jul 2024 22:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="i5v/+86I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E36135280;
	Wed, 31 Jul 2024 22:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722465508; cv=none; b=KIn0FtDJHtfQwId1VW7K6crGMFmBzYZTEU9lMzfxkIx6uAtHKYJZu3UjmoMjOil3NJD91FnobfYkMg8X5hfiUklUKl+SJeQAjn5dFTi/uMd4fO9vmwwTY6WxDqApQgi74e+vsnI/5ffOV4laSP57KzXDge+pSDfSI4ttgByXFU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722465508; c=relaxed/simple;
	bh=PldbjTm3myb40ZJfjU8jMnVIBncYA81UDAQXR+o+Mws=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Ozj1KLO3/9Xk75RUArYeIxvegFoOY4PpKsdvTweF968eVfDoqzPhdAPciYNKXmZ0nhVcpdhqsGpdMvXA2MlGNVwpZQ+L0kLk19xVLSKZ7KVWLjeKxiutetTg085u6/wbJ9Vl/2YKFYZud34Qikdknd55gwa0WXREL5gpAgln/QI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=i5v/+86I; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46VIkhKl005319;
	Wed, 31 Jul 2024 22:38:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	unPAnDAwhbhRPpFBmuuyf/vcTyTk5Q1IxUM/QINemDg=; b=i5v/+86IVL+2vGXN
	5cs1zLX85hPvm4Fwaadt+kVkUziJcNwE3/dov+gtdC5cp8d6010z9xjF1ln68VKY
	3HHOgT7g9RqXSkKuMi0iNMnELzId2xzj/OZBHRvBiER28IMElOsWPhzyHPwfUcbC
	L8VkqkT+s6dYijSQLBI/3zoAfwDhAaQ1Hi6oldQbIyPEBH7YAlf4okLbtemQbNQc
	npcYr4BMDES+Lja9FCp2D1kr8yQiHUWln/g8G4vCI2lD/EdvOIMIAjx2nTy8hJRZ
	uAR5l9SYpJ7sTpAboV3ItRq30jzSggSzQjgZAIDEGZJS4srU13CewLqN1bPlS/Ps
	wDcIKQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40qjpja4ac-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jul 2024 22:38:22 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46VMcLMe006103
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jul 2024 22:38:21 GMT
Received: from [10.110.31.235] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 31 Jul
 2024 15:38:20 -0700
Message-ID: <240305c2-54d3-4b75-a938-7b40abedddc9@quicinc.com>
Date: Wed, 31 Jul 2024 15:38:20 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] usb: misc: eud: Add High-Speed Phy control for EUD
 operations
To: Krzysztof Kozlowski <krzk@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <gregkh@linuxfoundation.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>
References: <20240730222439.3469-1-quic_eserrao@quicinc.com>
 <20240730222439.3469-7-quic_eserrao@quicinc.com>
 <a2460e27-697c-495f-9106-bdb9109d674b@kernel.org>
Content-Language: en-US
From: Elson Serrao <quic_eserrao@quicinc.com>
In-Reply-To: <a2460e27-697c-495f-9106-bdb9109d674b@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: CTDJsBCJNzVEjVpjnRinAeCeXtERbfxr
X-Proofpoint-ORIG-GUID: CTDJsBCJNzVEjVpjnRinAeCeXtERbfxr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-31_10,2024-07-31_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 mlxscore=0 mlxlogscore=999
 spamscore=0 malwarescore=0 bulkscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407310159



On 7/30/2024 10:39 PM, Krzysztof Kozlowski wrote:
> On 31/07/2024 00:24, Elson Roy Serrao wrote:
>> The Embedded USB Debugger(EUD) is a HS-USB on-chip hub to support the
>> debug and trace capabilities on Qualcomm devices. It is physically
>> present in between the usb connector and the usb controller. Being a
>> HS USB hub, it relies on HS Phy for its functionality. Add HS phy
>> support in the eud driver and control the phy during eud enable/disable
>> operations.
>>
> 
> ...
>>  static ssize_t enable_show(struct device *dev,
>> @@ -186,6 +216,11 @@ static int eud_probe(struct platform_device *pdev)
>>  
>>  	chip->dev = &pdev->dev;
>>  
>> +	chip->usb2_phy = devm_phy_get(chip->dev, "usb2-phy");
>> +	if (IS_ERR(chip->usb2_phy))
>> +		return dev_err_probe(chip->dev, PTR_ERR(chip->usb2_phy),
>> +				     "no usb2 phy configured\n");
> 
> This nicely breaks all users.
> 
> NAK
> 

As per my comment in [patch 1/8], phy would be a required property and hence I will first modify
and enable EUD on the existing user (sc7280 SoC) and then extend this to other users.

Thanks
Elson

