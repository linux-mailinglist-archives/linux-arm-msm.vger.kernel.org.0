Return-Path: <linux-arm-msm+bounces-32990-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9D198E97D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 07:43:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B7F321C222C7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 05:43:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F1866EB4A;
	Thu,  3 Oct 2024 05:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="evgoOmHB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E9A2232A;
	Thu,  3 Oct 2024 05:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727934193; cv=none; b=iQlujvQO1Pfd7fvago4VOaffkvE5W28rzx8P3hLIESZEefHICqAKXYICo8DUqV87cunW1/o3AMWXPR8GjfcvNEPD9AmtbsDHz90S40KxWVSQ0E2mR/1E0VtTncdSd7Zjvh+VE8j1m4D4kW7Px8I0mBm1ZsI+zDLUMgewjuniST4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727934193; c=relaxed/simple;
	bh=T2aj2SuLoi5JOD1B4WKGxBQv8As0GXz+9P1Kdr3/6Ac=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=SfDqlrv5c2VMM7chskeIUfzvSflNUT5Qi5U5Ptf0d6Z4gwgxwjpo3yKD1Tta5U+V1rEULsyD1C4KnizS16XN2Xd0qmqC8cej6yxy73uA/FF+lVFK8Vdkao4VwGJLBOJTr1LcMRYK5nsiJCGR2bEb8JpX9UuDfJKIYwqAHlydmNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=evgoOmHB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4934W7UH000710;
	Thu, 3 Oct 2024 05:43:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o8VGzuX/8rUBjBNr9tC3zE8BeUNSdPjOp74nVHXruEI=; b=evgoOmHBwxVC0pJF
	iyPZvPi8n0ha3bBxmoc6x6eu4V9cygE/OpGUgSc2gaEt3WyOkqZ3Vy+IE5vecGKd
	CnwzL5KetHsJ965YnshIYTkfM/jnZWTagUxovhfnZSFvRmo59Z/QSmB8zJq3KUFd
	/Rvvu+7kqSKpM6a/mOpI19ZIho/VlJuK5qPcjlrkh88lRgeybtIZsxd7O5ycCcD5
	yrkbnHmxHnvEaO1d73zrafiRJw6H9/puFzfpZqDuWthG0PJDY7xd3xjerdz2Nuhw
	rYgHqvyNvOr8oCCZhKF+imAWJaaVJtQAIggQ8kgVuguVflHrfDK7+MQ33yd1Aylo
	ZuRXDA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41x7gedp1x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Oct 2024 05:43:08 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4935h6MQ014327
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 3 Oct 2024 05:43:06 GMT
Received: from [10.214.67.37] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 2 Oct 2024
 22:43:02 -0700
Message-ID: <2d4e47fd-0aaf-4533-a96f-95ada853d9a0@quicinc.com>
Date: Thu, 3 Oct 2024 11:13:02 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: mailbox: qcom,cpucp-mbox: Add sc7280
 cpucp mailbox instance
To: Rob Herring <robh@kernel.org>
CC: Sibi Sankar <quic_sibis@quicinc.com>,
        Jassi Brar
	<jassisinghbrar@gmail.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        <cros-qcom-dts-watchers@chromium.org>,
        "Bjorn
 Andersson" <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        Ramakrishna Gottimukkula
	<quic_rgottimu@quicinc.com>
References: <20240924050941.1251485-1-quic_kshivnan@quicinc.com>
 <20240924050941.1251485-2-quic_kshivnan@quicinc.com>
 <20240924232526.GA563039-robh@kernel.org>
Content-Language: en-US
From: Shivnandan Kumar <quic_kshivnan@quicinc.com>
In-Reply-To: <20240924232526.GA563039-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ckc6PATnCe_HXCnBKRRYq-fsA9yqpNen
X-Proofpoint-GUID: ckc6PATnCe_HXCnBKRRYq-fsA9yqpNen
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 bulkscore=0 mlxlogscore=999 lowpriorityscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2410030038

thanks Rob for reviewing this patch.


On 9/25/2024 4:55 AM, Rob Herring wrote:
> On Tue, Sep 24, 2024 at 10:39:39AM +0530, Shivnandan Kumar wrote:
>> sc7280 has a cpucp mailbox. Document them.
> 
> And is different from the existing device how?

It is different with respect to the register placement.

Thanks,
Shivnandan

> 
>>
>> Signed-off-by: Shivnandan Kumar <quic_kshivnan@quicinc.com>
>> ---
>>   .../devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml         | 5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml b/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml
>> index f7342d04beec..4a7ea072a3c1 100644
>> --- a/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml
>> +++ b/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml
>> @@ -15,8 +15,9 @@ description:
>>
>>   properties:
>>     compatible:
>> -    items:
>> -      - const: qcom,x1e80100-cpucp-mbox
>> +    enum:
>> +      - qcom,x1e80100-cpucp-mbox
>> +      - qcom,sc7280-cpucp-mbox
>>
>>     reg:
>>       items:
>> --
>> 2.25.1
>>

