Return-Path: <linux-arm-msm+bounces-38270-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA229D1F68
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 05:45:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 300A1B20E5E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 04:45:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10E111487E9;
	Tue, 19 Nov 2024 04:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DkzA2CFb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F65135A53
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Nov 2024 04:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731991512; cv=none; b=WI0t/Fxqmp+fEzFRfDK/aytbSFpQjb5bAwY5wvURIA8os2Rdfo1k/fFPi4PD066E/wCTnfSfGTiipoOe4nyfFkKOZ7YK2IEKBjZotlBDzpYRdF5DdOzfb2kg6nlsBEz4MqzBgPGwXvQCTCb5TETsbvHM67eEELm2PR2kpd56Tyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731991512; c=relaxed/simple;
	bh=aFh1fNXGD3W+bP7n5b/RvYbSLL1oLGJnlkhW4iUzYJo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=YADg7k13vGdK16cZmPM9MFQwqKqi3xV1aprlUsjF58GUo+Ox4G+MGoNWFtDc/d3UDQnQw1dLyaARKtGBht1MHay0YIDCTI3o/0ZcnRIrRuPxMYNeWvxWuJSkNfsZgnGlVZfdrMc9SKGerhIEAat7H7W9SiXAGMGQFygLznGFrL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=DkzA2CFb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AIGHR9R029880;
	Tue, 19 Nov 2024 04:45:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sse3YlhqBt+qQhNhDTIgqgeap8H+yTkAyIStzMKGsEQ=; b=DkzA2CFbIe4QwbGL
	7WqV39YBWBVcB+s5MTxRSzKYfPfY7Wn/4FmX4xIIqwmPHQxX4cFeHghbZp44TG/V
	N9eYzwqktxrREmQpYDVq3TXiysJKYqop8iQvcE3heznCeVFp/CyZTykYwQIuBrJ4
	ei/Ng0RolvsvWYKRQIQ4XqV8sUoSaXdRILFxSIP4s0ob2ahrMl6PPazTLEwq0VEU
	TitmiCuntwhaS2is41DNt2nxroibeZjTvHySiWOODvrU05+f92H+9ebplEoDrgkI
	ZEJMDnU/wDkOcceHhd1YZNiobs9kgqfWa/VELVN50C4XxLDTBoACrD2oMn9RvLXD
	xIM25A==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4308y81dha-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Nov 2024 04:45:08 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AJ4j82F024634
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Nov 2024 04:45:08 GMT
Received: from [10.64.16.151] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 18 Nov
 2024 20:45:03 -0800
Message-ID: <b313ce58-74b4-4f5c-af7d-3ce1c53a804e@quicinc.com>
Date: Tue, 19 Nov 2024 12:45:00 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] dt-bindings: display/msm: Add QCS615 DSI phy
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <kernel@quicinc.com>, <quic_lliu6@quicinc.com>,
        <quic_xiangxuy@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <quic_fangez@quicinc.com>
References: <20241014-add_display_support_for_qcs615-v1-0-4efa191dbdd4@quicinc.com>
 <20241014-add_display_support_for_qcs615-v1-4-4efa191dbdd4@quicinc.com>
 <34jwvxxycm2mi3tqndhuoapth4u5nbn4omsiaxxrh2iapwuky6@f7xttrmt7w2c>
Content-Language: en-US
From: fange zhang <quic_fangez@quicinc.com>
In-Reply-To: <34jwvxxycm2mi3tqndhuoapth4u5nbn4omsiaxxrh2iapwuky6@f7xttrmt7w2c>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: S9EEMDr5Cxvvn4zEN5sJFRBcegdcMhqK
X-Proofpoint-GUID: S9EEMDr5Cxvvn4zEN5sJFRBcegdcMhqK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 mlxscore=0 spamscore=0 adultscore=0 suspectscore=0 malwarescore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411190037



On 2024/10/14 18:30, Dmitry Baryshkov wrote:
> On Mon, Oct 14, 2024 at 05:47:30PM +0800, fangez via B4 Relay wrote:
>> From: lliu6 <quic_lliu6@quicinc.com>
>>
>> QCS615 platform uses the 14nm DSI PHY driver.
> 
> - bindings describe the hardware, not the drivers.
> - other platforms also have 14nm DSI PHY. Why do you need a separate
>    compatible?
We need to introduce a new regulator configuration for the PHY: 
dsi_phy_14nm_36mA_regulators. This configuration has not been used before.

> 
>>
>> Signed-off-by: lliu6 <quic_lliu6@quicinc.com>
>> ---
>>   Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
>> index 52bbe132e6dae57246200757767edcd1c8ec2d77..029606d9e87e3b184bd10bd4a5076d6923d60e9e 100644
>> --- a/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
>> @@ -20,6 +20,7 @@ properties:
>>         - qcom,dsi-phy-14nm-660
>>         - qcom,dsi-phy-14nm-8953
>>         - qcom,sm6125-dsi-phy-14nm
>> +      - qcom,qcs615-dsi-phy-14nm
sorry, still have some question about this yaml file.
it's necessary for b4 check

checkpatch.pl: drivers/gpu/drm/msm/dsi/phy/dsi_phy.c:564: WARNING: DT 
compatible string "qcom,dsi-phy-14nm-6150" appears un-doc
umented -- check ./Documentation/devicetree/bindings/

need to add this new 6150 node for dsi-phy-14nm.
shall i add it?

>>   
>>     reg:
>>       items:
>>
>> -- 
>> 2.25.1
>>
>>
> 

and could you please help to review the new version?
Author: Li Liu <quic_lliu6@quicinc.com>
Date:   Tue Nov 19 12:35:12 2024 +0800

     dt-bindings: display/msm: Add SM6150 DSI phy

     Add new compatible for SM6150 with dsi_phy_14nm_36mA_regulators

     Signed-off-by: Li Liu <quic_lliu6@quicinc.com>
     Signed-off-by: Fange Zhang <quic_fangez@quicinc.com>

diff --git 
a/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml 
b/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
index 52bbe132e6da..fd6eb3434450 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
@@ -17,6 +17,7 @@ properties:
      enum:
        - qcom,dsi-phy-14nm
        - qcom,dsi-phy-14nm-2290
+      - qcom,dsi-phy-14nm-6150
        - qcom,dsi-phy-14nm-660
        - qcom,dsi-phy-14nm-8953
        - qcom,sm6125-dsi-phy-14nm


