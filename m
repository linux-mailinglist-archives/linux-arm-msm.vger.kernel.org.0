Return-Path: <linux-arm-msm+bounces-38269-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69DC79D1F2B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 05:20:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 300EE282B19
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 04:20:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5026720E6;
	Tue, 19 Nov 2024 04:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Jh7dC74v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CDBA1459E0
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Nov 2024 04:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731990024; cv=none; b=W/RYbtkpHPW95jvO8p13MNe0xlp+dTjmmskzNkG7I/h/ewF3e3OINi6X/R3SUf6wI+m5Gg7RpuWmg2jBEGIRjGPh4QgKeE5DTLsxxIhhkLcfKhoaUWpTptmw/yLcpIb7pUPUcNcxWxHxqFcy4y6kWjZA7oLf4MaN6/bcdOrn00w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731990024; c=relaxed/simple;
	bh=9FnPkAfFoVLqUIsaLpvxmOJZGhpUraDZ36bn2vmlVU0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=UuaEPXHGEjvxkZzVAreaMou98UkNjnThzlRU2kkKmtRO1KBuIgLscdODUTANBygAOlsyHNezbcoLQxoSf35cZmez4bhs5s2GZyae9VPimedfM9T3LoQwTi+h8uBtl3lAHVLUyEq4dGKroFniRujqaXCV2IEMsC+PetPgkS6ywro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Jh7dC74v; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AIGGcZU028395;
	Tue, 19 Nov 2024 04:20:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	skWPkvQD3KPoz8X+dva7Rsz0ThrjwdCQAWuO0VQi/EI=; b=Jh7dC74vYnVYAfli
	LcP35uRiYpOqV8UahFCKzya9UU06/X0SjbxNy5pdyivZSgAfnp4ouRWWjessGvUk
	p1hyTFqXCFr2Ra98q5taPEq9NRWhWHet9Nme5opWcuGpnM4swv+Hp3Tc4z4l1qY2
	/PGr5vCB+Hbypzb9yB9rCYaFmvDLHUi45WPBs3pyFmnNOXpOOsE6zyqqF+W+1taj
	RVp+ekeYSG5QyqRpAa0foK9r+ELcT09NO+tt0wnE783Cf2GPVr9QkWApVHQDSBHA
	y0XqYD+ORNHm6+vnjKP4JttEFPPlL6QBn4+7z+zIkIZTDjW0Mby0HaFCxWeR32LX
	f2DAyw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4308y5scpn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Nov 2024 04:20:20 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AJ4KKVZ011086
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Nov 2024 04:20:20 GMT
Received: from [10.64.16.151] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 18 Nov
 2024 20:20:15 -0800
Message-ID: <75d19f93-3604-404c-95f0-c54852521ebf@quicinc.com>
Date: Tue, 19 Nov 2024 12:20:12 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] dt-bindings: display/msm: dsi-controller-main:
 Document QCS615
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <kernel@quicinc.com>, <quic_lliu6@quicinc.com>,
        <quic_xiangxuy@quicinc.com>, <linux-arm-msm@vger.kernel.org>
References: <20241014-add_display_support_for_qcs615-v1-0-4efa191dbdd4@quicinc.com>
 <20241014-add_display_support_for_qcs615-v1-6-4efa191dbdd4@quicinc.com>
 <gzumywikv2otvw2e6z3iffcu4z4jiptcn44scy6rzjivx6fr4y@busi5zidmpdt>
Content-Language: en-US
From: fange zhang <quic_fangez@quicinc.com>
In-Reply-To: <gzumywikv2otvw2e6z3iffcu4z4jiptcn44scy6rzjivx6fr4y@busi5zidmpdt>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ucHz9ltcZNkLwt8isSDu-pJRF4x3mdO1
X-Proofpoint-ORIG-GUID: ucHz9ltcZNkLwt8isSDu-pJRF4x3mdO1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 mlxscore=0 adultscore=0
 clxscore=1015 spamscore=0 impostorscore=0 priorityscore=1501
 mlxlogscore=999 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2411190034



On 2024/10/14 18:39, Dmitry Baryshkov wrote:
> On Mon, Oct 14, 2024 at 05:47:32PM +0800, fangez via B4 Relay wrote:
>> From: lliu6 <quic_lliu6@quicinc.com>
>>
>> Document general compatibility of the DSI controller on QCS615.
>>
>> Signed-off-by: lliu6 <quic_lliu6@quicinc.com>
>> ---
>>   Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
>> index b0fd96b76ed1376e429a6168df7e7aaa7aeff2d3..4142c753d1c4c4797e3a3f5317c02f8c863cdd12 100644
>> --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
>> @@ -39,6 +39,7 @@ properties:
>>                 - qcom,sm8450-dsi-ctrl
>>                 - qcom,sm8550-dsi-ctrl
>>                 - qcom,sm8650-dsi-ctrl
>> +              - qcom,qcs615-dsi-ctrl
> 
> Do you notice why the line you have added is not in the correct place?
> Please look around next time before just adding a string.
Sorry about that, will implement these actions in the next version
- change qcom,qcs615-dsi-ctrl to qcom,sm6150-dsi-ctrl
- move qcom,sm6150-dsi-ctrl behind qcom,sm6125-dsi-ctrl
> 
>>             - const: qcom,mdss-dsi-ctrl
>>         - enum:
>>             - qcom,dsi-ctrl-6g-qcm2290
>>
>> -- 
>> 2.25.1
>>
>>
> 


