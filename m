Return-Path: <linux-arm-msm+bounces-27225-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6485593F27A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 12:21:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DE5E42812C5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 10:21:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76D33142E8D;
	Mon, 29 Jul 2024 10:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="k3kBKU/O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E48FB74055;
	Mon, 29 Jul 2024 10:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722248472; cv=none; b=Dmn6DT2k2rJ1R9VAzb/YZT/k+jWercketx+2JV8ZGhxixr/t975Ep1PgCYm1OhPqUsUUNM+KJ8Z1Rnp/JG6PfMkZr/outD+2UHtBHLZC8aNpqquqwfmAQtpLr8Sr7+eGVkbdN4osaPsj6tUnKulN3SRPxwonmkw2AstnNSGoSQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722248472; c=relaxed/simple;
	bh=T2o544SHJa6iTkhuU0TeGiE7Wxsecn7YT+72/whC6tg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ZQZZZcZl2Z9rY7D5zTlVTazPTiePGjRKBiYt111dCzNwlHy+itHrR8Ac/llClW0cie//ImnZXMvjI7B+97JTW5E7nXCI7aNWlLdJGxB6F0O2LtDqM+0nzWqtlSmp5yYAbWGZtHqPCrLWAsr27hsHJl6a25jyMCDF+CPurzFeSZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=k3kBKU/O; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46TABT0o001307;
	Mon, 29 Jul 2024 10:21:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hWJZhSHckbmUetzv12OqDqzKfSnL+FnvMe19vMsWBmc=; b=k3kBKU/OUKC0vtwO
	R2du+RhaG2PuWXlUgO6Y+l+bB2jk3KApAaTLoI5i+8VuWDLuoo7B/cuKXJ2DR4UK
	el/9Xva+iDNzVpy1CLtqLDMOmL673VLaq+SBJsVaHLFCsJpWAwZKRlznWl4WzmEU
	DGCwjteGONREG0PPaGPl5aPUL7sr+8GA1JEqawDqtnX9OF5gtrneUtNVi+uZen4y
	F1Nr2AibhokaO4oUne3hNYImDaVdfdR11kcb1bIIeDand4pVNdUE8S33Nfvn7Wk1
	vLBPU4OKJQQti5k1DAT8dDbsuM4QIN6dmHIpP1ZFyqHH6GGxkUwg8hqVoeqB1ON6
	sQbf5w==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40mp8mv6t6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jul 2024 10:21:06 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46TAL5Of015283
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jul 2024 10:21:05 GMT
Received: from [10.239.132.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 29 Jul
 2024 03:21:01 -0700
Message-ID: <52eb566b-f45b-4c6f-aee1-eda8486d6079@quicinc.com>
Date: Mon, 29 Jul 2024 18:20:59 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: mailbox: qcom-ipcc: Document the QCS9100
 IPCC
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
CC: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <kernel@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20240709-document_qcs9100_ipcc_compatible-v2-1-0fd67000e6b1@quicinc.com>
 <20240721085205.GM1908@thinkpad>
From: Tengfei Fan <quic_tengfan@quicinc.com>
In-Reply-To: <20240721085205.GM1908@thinkpad>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Sw0EJvapUw-o_zvxM-NlhdrUT9eWoLgy
X-Proofpoint-ORIG-GUID: Sw0EJvapUw-o_zvxM-NlhdrUT9eWoLgy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-29_08,2024-07-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 impostorscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 mlxscore=0 clxscore=1011 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407290070



On 7/21/2024 4:52 PM, Manivannan Sadhasivam wrote:
> On Tue, Jul 09, 2024 at 10:01:47PM +0800, Tengfei Fan wrote:
>> Document the Inter-Processor Communication Controller on the QCS9100
>> Platform.
>> QCS9100 is drived from SA8775p. Currently, both the QCS9100 and SA8775p
>> platform use non-SCMI resource. In the future, the SA8775p platform will
>> move to use SCMI resources and it will have new sa8775p-related device
>> tree. Consequently, introduce "qcom,qcs9100-ipcc" to describe non-SCMI
>> based IPCC.
>>
>> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
> 
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> 
> - Mani

After considering the feedback provided on the subject, We have decided
to keep current SA8775p compatible and ABI compatibility in drivers.
Let's close this session and ignore the current patche here.
Thank you for your input.

> 
>> ---
>> Introduce support for the QCS9100 SoC device tree (DTSI) and the
>> QCS9100 RIDE board DTS. The QCS9100 is a variant of the SA8775p.
>> While the QCS9100 platform is still in the early design stage, the
>> QCS9100 RIDE board is identical to the SA8775p RIDE board, except it
>> mounts the QCS9100 SoC instead of the SA8775p SoC.
>>
>> The QCS9100 SoC DTSI is directly renamed from the SA8775p SoC DTSI, and
>> all the compatible strings will be updated from "SA8775p" to "QCS9100".
>> The QCS9100 device tree patches will be pushed after all the device tree
>> bindings and device driver patches are reviewed.
>>
>> The final dtsi will like:
>> https://lore.kernel.org/linux-arm-msm/20240703025850.2172008-3-quic_tengfan@quicinc.com/
>>
>> The detailed cover letter reference:
>> https://lore.kernel.org/linux-arm-msm/20240703025850.2172008-1-quic_tengfan@quicinc.com/
>> ---
>> Changes in v2:
>>    - Split huge patch series into different patch series according to
>>      subsytems
>>    - Update patch commit message
>>
>> prevous disscussion here:
>> [1] v1: https://lore.kernel.org/linux-arm-msm/20240703025850.2172008-1-quic_tengfan@quicinc.com/
>> ---
>>   Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
>> index 05e4e1d51713..916c47fbc238 100644
>> --- a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
>> +++ b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
>> @@ -24,6 +24,7 @@ properties:
>>     compatible:
>>       items:
>>         - enum:
>> +          - qcom,qcs9100-ipcc
>>             - qcom,qdu1000-ipcc
>>             - qcom,sa8775p-ipcc
>>             - qcom,sc7280-ipcc
>>
>> ---
>> base-commit: 0b58e108042b0ed28a71cd7edf5175999955b233
>> change-id: 20240709-document_qcs9100_ipcc_compatible-f5f933d24098
>>
>> Best regards,
>> -- 
>> Tengfei Fan <quic_tengfan@quicinc.com>
>>
> 

-- 
Thx and BRs,
Tengfei Fan

