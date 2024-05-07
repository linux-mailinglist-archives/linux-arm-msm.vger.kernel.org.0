Return-Path: <linux-arm-msm+bounces-19388-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EFCCF8BEC79
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2024 21:20:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 335AA1C23239
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2024 19:20:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D0F616D9B4;
	Tue,  7 May 2024 19:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bxSCVAql"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED0AB6CDC2;
	Tue,  7 May 2024 19:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715109644; cv=none; b=kJsruWWRsNYGPlWsIOAPXNOcZOiIyhdjNXrU4TJYdeYcbgTyGnzZLE0sjYA093c2RcZLi8EcEbl4gCVMZo29PbLsTG5ZvYWfSoFfS3LgsN6y9TRFVAqildairW3rF7bPjlHduPr9UYzXBtFe41jlRCfyiVJZSYBsD3RIlTbUyGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715109644; c=relaxed/simple;
	bh=UmOAYChyytc3d3vdcOolrFvQRAouAlbOgpsqjqTT7oA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=mfjtRgvMQmYLJL+59BrHealkpLaa/7YCvXVrZXsbhY8irnhzHHhkdnbc7LkwT+ZOqU3yyGzJ8oWoC5y0Sg6xREo+W5G4V/PSv//oSN6E3LBr/5DXHCMo18jjVB77P6S0dHQDpQ5qCci2IlaZez+6khUOse9nVrjeZJNmatLHc0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bxSCVAql; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 447IYJIF010716;
	Tue, 7 May 2024 19:20:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=IVCv6BtGrBA4/HwfnDs7C7sIdNBdWXCmiV58VQXdVdU=; b=bx
	SCVAqldnyxsZFsJXM5XYipVzvcbLDIwO+1cTwAXOG3sEVHLPJQuvBRgWmRtlLJBh
	IHD39mVJHqbav9FY4oXGHfo+wTKtyrSdSf2auTHNnZGIfAk+jmWiuROedIzU1qGv
	ILQ1WIFpxTR2b6RU5OVxR+p6unYGXL7xGzzP4WX/OvsUb9SAHfjAKcczbf09N5dy
	eYe5h4SDWhv1GVdEBg6MeERDkr4Ynl2xXbk7c9MXZZF63gVL6RerT3bBt+vTD7U6
	WPMxaHeqKo1VF1jLmT6wzps/wWjC6qv+0xvRBE70TlOSshOf64xwPQVqSNbkvKXw
	UZ7refpWFUGuYfLJgG8A==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xysprr2tf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 May 2024 19:20:39 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 447JKVYK002619
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 7 May 2024 19:20:31 GMT
Received: from [10.110.125.244] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 7 May 2024
 12:20:30 -0700
Message-ID: <9a48b0a8-d1d7-8e2d-dafa-47e136a46c99@quicinc.com>
Date: Tue, 7 May 2024 12:20:30 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3] arm64: dts: qcom: qcs6490-rb3gen2: enable hdmi bridge
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        "Venkata Prahlad
 Valluru" <quic_vvalluru@quicinc.com>,
        <andersson@kernel.org>
CC: <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <konrad.dybcio@linaro.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_nankam@quicinc.com>, <robh@kernel.org>
References: <jr3ble6sxr5mr6cvm6ldvpyk5j4rucj3xy6vbha6ttoecte3d7@llu6qf6oasuc>
 <20240507163045.28450-1-quic_vvalluru@quicinc.com>
 <a32fa81d-bd70-4dfa-b512-e2adce4f8c35@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <a32fa81d-bd70-4dfa-b512-e2adce4f8c35@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: vBUzsSskaw0WJRFND1PRC0GW27DIojLh
X-Proofpoint-ORIG-GUID: vBUzsSskaw0WJRFND1PRC0GW27DIojLh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-07_12,2024-05-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 suspectscore=0 spamscore=0 phishscore=0 mlxscore=0 mlxlogscore=816
 bulkscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405070135



On 5/7/2024 9:35 AM, Krzysztof Kozlowski wrote:
> On 07/05/2024 18:30, Venkata Prahlad Valluru wrote:
>> Rb3Gen2 has a lt9611uxc DSI-to-HDMI bridge on i2c0, with
>> reset gpio from pm7250b gpio2 and irq gpio from tlmm gpio24.
>> Bridge supplies are Vdd connected to input supply directly
>> and vcc to L11c. Enable HDMI output, bridge and corresponding
>> DSI output.
>>
>> Signed-off-by: Venkata Prahlad Valluru <quic_vvalluru@quicinc.com>
>> ---
>> v3: - Updated commit text
>>      - Arranged nodes in alphabetical order
>>      - Fixed signoff
>>      - Fixed drive strength for lt9611_irq_pin
>>      - Removed 'label' from hdmi-connector, which is optional
> 
> Please respond to each Bjorn comment and explain how did you implement it...
> 

Yes, agreed. Even though it seems like you mostly just agreed to mine 
and Bjorn's suggestions and decided to implement all those in v3 , it 
would have been better to explicitly ack them or tell why you agreed or 
what went wrong that you had not done it in v2 itself to close the loop.

> Best regards,
> Krzysztof
> 

