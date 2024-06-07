Return-Path: <linux-arm-msm+bounces-22015-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C118FFCC2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jun 2024 09:10:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 98F3F292408
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jun 2024 07:10:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A94D15538A;
	Fri,  7 Jun 2024 07:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="URFvW2rS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB2BF15531D;
	Fri,  7 Jun 2024 07:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717744013; cv=none; b=OPsVLDDvEZGQdnwU23D1rzimLxbg5eUXNXZvAbjF2COfPzAMx7Rdt40pHkZyXbcD4H+A3VHE4W5V1nPfXVzZ9IqMUecbRd7H5r8vW0mnoQdd4wqNjdgD/fgb8blQcj26G20VPZhHnB57m8ysSaxmNbQhEvQkoXwIWnXtOsBvJE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717744013; c=relaxed/simple;
	bh=KgqoOJeSFNIyWCBpAOWyOJN4QooMZnuPEsdUrLFh01c=;
	h=Subject:To:CC:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=Qu/wEQhljfw0rVpA31+WzWF82lte+wZui4Drf92iGTOK8pfWKb7BBSMVwXaS/k+eh0jndXcN81Gx6xLsf5gp7op67aRnxt/8K1RG26+5/I9YT2X4xFMMi1HcbSu+24plem8WxviJOyBJx+L5gPpwCnjqey2+DNsrn1enVF4AHTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=URFvW2rS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 456MYhTW003946;
	Fri, 7 Jun 2024 07:06:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kzt/KIUz2qA8B7BByBmBPdsXSQdi7Zqbug/nL928Tiw=; b=URFvW2rSKyHzney4
	r6RpsyuAbjX+L6C8ZE/oxnZcM6y0JPP/KAAsTdyCAYGwX6LyGt8O3aIhROWCUUKR
	a0ka+H5wjxbJLCXgJc50xoOVwT1u1US3YcbNiwm36Nv14QJGZOEnuTEnJPtOn35i
	Q+/MCmWYN6k3if7UpGiQWHxEmeAwOnyZrsQ6ax4z7wTc0l5GzyvC9SbITC6hfXxp
	N9x5PYUKEU9sq+9g0fpq3xywcQ1MU7cbC76H3rUR00x8j0ILb0LF+cz2wl400xVe
	oYUyQF5aQ1IUVYydkW6pRuVdmKoM6TXJqRtDQwWrwwSHg71KPWlKppCm0g+fhkO4
	AVDMow==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yjxxaup1c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Jun 2024 07:06:48 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 45776lRf026669
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 7 Jun 2024 07:06:47 GMT
Received: from [10.214.66.219] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 7 Jun 2024
 00:06:44 -0700
Subject: Re: [PATCH 1/5] dt-bindings: remoteproc: qcom,sm8550-pas: document
 the SDX75 PAS
To: Krzysztof Kozlowski <krzk@kernel.org>, <andersson@kernel.org>,
        <mathieu.poirier@linaro.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <konrad.dybcio@linaro.org>,
        <manivannan.sadhasivam@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20240606143858.4026-1-quic_nainmeht@quicinc.com>
 <20240606143858.4026-2-quic_nainmeht@quicinc.com>
 <4ed45f6d-fcc7-45d7-8df0-5470f7f75d0e@kernel.org>
From: Naina Mehta <quic_nainmeht@quicinc.com>
Message-ID: <6176567c-dbfd-b752-1e17-d0a5eb8f1379@quicinc.com>
Date: Fri, 7 Jun 2024 12:36:41 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <4ed45f6d-fcc7-45d7-8df0-5470f7f75d0e@kernel.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: VuiD_dvzIC44Agy3-um7E9xH5u54F9Ur
X-Proofpoint-GUID: VuiD_dvzIC44Agy3-um7E9xH5u54F9Ur
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-07_02,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 adultscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 mlxscore=0 bulkscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406070049

On 6/6/2024 8:19 PM, Krzysztof Kozlowski wrote:
> On 06/06/2024 16:38, Naina Mehta wrote:
>> Document the MPSS Peripheral Authentication Service on SDX75 platform.
>>
>> Signed-off-by: Naina Mehta <quic_nainmeht@quicinc.com>
>> ---
>>   .../devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml          | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
>> index 73fda7565cd1..02e15b1f78ab 100644
>> --- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
>> @@ -16,6 +16,7 @@ description:
>>   properties:
>>     compatible:
>>       enum:
>> +      - qcom,sdx75-mpss-pas
>>         - qcom,sm8550-adsp-pas
>>         - qcom,sm8550-cdsp-pas
>>         - qcom,sm8550-mpss-pas
> 
> Missing updates to allOf constraints. Are you sure this is the binding
> for SDX75?
SDX75 diverged from SDX55 due to introduction of separate DTB firmware 
binary and addition of DSM and Qlink logging memory regions. Considering 
these additions, SM8550 PAS bindings seem closest.
Thanks for catching updates required for allOf constraints. I will add 
sdx75 compatible in-line with qcom,sm8650-mpss-pas.
Please let me know if you recommend creating new bindings for SDX75.

Regards,
Naina

> 
> Best regards,
> Krzysztof
> 

