Return-Path: <linux-arm-msm+bounces-63686-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7FD4AF9112
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 13:12:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 603E43B2F42
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 11:11:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 950CA2C08D2;
	Fri,  4 Jul 2025 11:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NGHUrMZt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E560E236A9F;
	Fri,  4 Jul 2025 11:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751627521; cv=none; b=A7y99MaKfbHfyaUvOEsXhPTQSDQvPgCYNEGjYeUNsKBKo7TncmCMG8ChdbDhe9w0BPfks7kDCxMj+SzienhxYyeaBOmxA2GarKvJM15JI5UN5BUfo3wO0tD7gwu2vtlA0fSTCdLqa8O+DTtgRjgeqiLtA7hnF5eyjlakVv856L4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751627521; c=relaxed/simple;
	bh=s6REyjnHSoFjza36o3YvH2nfVLx6i3GaLyx0PsMyNU8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=REHmOU+YntlUSaGL23er93G+homxTW4Cqt1qBFGTDyMjtI+UitQleZbr+GRP3Gdn7idCX07YoLYCn5ko1WyWmM6UYgaF5/3q3oUgG6/SU29iGQDMXpN0kZ/a4Mq4PlUbtcZM5oZ1beun5g2DisAlHvddf9dOG3p7eaofEqcJxgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NGHUrMZt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 564AQQcn009985;
	Fri, 4 Jul 2025 11:11:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tWfyMTnZH9175Nz+Ogd9ZMpUueR8EjLhKs8V1H9wxGM=; b=NGHUrMZtzcxGF0Qf
	NwPztYGWx/kJPGMfpit/0F562ZoNSSM/Nkvd4lhQ08x9/G1zxgJ4fYO1BvCW2IMY
	yknfMP1nYYvoz5/sZXZd/msHGlVeKcs2zeoaUKY8oufyif7renqWPTGWA+0iR7KB
	xveuyCMRUaZWtRXc1/uDiH13gt27SoQw7DKy05kYkHeLfbbFmosXC34wj2l2h0qC
	SLY1HDWU9kXgAMDz8RN/79DEyYwc7mmLBkzTlgUQ0NPLtDi3aBhiGb+incRiHbCc
	lsEaUFDM+xn7LwdHh8aD0ub8hQP6N2Neg9cDcQ8WR+OvlmFEK5SE5poUkeEzeoeW
	tki/tw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pd6w04ak-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Jul 2025 11:11:55 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 564BBtAl018724
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 4 Jul 2025 11:11:55 GMT
Received: from [10.218.23.250] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 4 Jul
 2025 04:11:49 -0700
Message-ID: <9c463005-3582-4bee-bd9f-cd0b415f5e65@quicinc.com>
Date: Fri, 4 Jul 2025 16:41:46 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: clock: qcom,videocc: Add sc8180x
 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Ajit Pandey
	<quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        "Taniya
 Das" <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>
References: <20250702-sc8180x-videocc-dt-v3-0-916d443d8a38@quicinc.com>
 <20250702-sc8180x-videocc-dt-v3-1-916d443d8a38@quicinc.com>
 <mzmer4g7df7xqhnstpfhyzcm2irpmsk4iwtx6esjksp34lpkk5@76lrsoyb5cp6>
 <20250703-robust-analytic-hummingbird-88eb3b@krzk-bin>
Content-Language: en-US
From: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
In-Reply-To: <20250703-robust-analytic-hummingbird-88eb3b@krzk-bin>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDA4NSBTYWx0ZWRfX0lIOWkEGI5YA
 OBDUQJOaExzKkwBcDItVopSQhCbC5QK1Vu83TzaSgWcHl7cXdNoZKl88ZYeRGkwH5IuLYfE5cPo
 lPYlfvr0BwbaoVdTng7s88jNs1XJc5VIcfzVyTVkzEkUaxz78e7zw39jP9b9PDctB/elKw9Uz6j
 BST6Et7bWR4dn8yPrEUQZ+PfzVtGPKhblxHrEKdjtqiTNi5mHyd/QKjfm2YoqTTHqrAF1sBGoww
 KmRdmZukVS93XAZFYKPSTRjvfGt+fj/+PCbc/MpEgrIi+ifWG528IyBPhMRL3iriEHUuXpT/EM/
 UuQYtAoK7nJ1mXvNgPdlMhYArmO9GndwafcLs4CN/RR3tsPP/SAUjfyFd0kYx99EXvOzuF2WK3w
 lWTjwS7PNV7zomj//PjFlrYYWEYmrNpcMunk7u6JMdwOJPqzBZNGykXe/j65cvIWLEG+qxHD
X-Proofpoint-GUID: qshePr32P3oQP_m0s8A6OWgZTDJ0lW8a
X-Authority-Analysis: v=2.4 cv=UPrdHDfy c=1 sm=1 tr=0 ts=6867b6fc cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=SMCFeqylH9x0VImpco4A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: qshePr32P3oQP_m0s8A6OWgZTDJ0lW8a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_04,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 mlxscore=0 phishscore=0
 mlxlogscore=999 bulkscore=0 adultscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507040085


On 7/3/2025 12:55 PM, Krzysztof Kozlowski wrote:
> On Thu, Jul 03, 2025 at 01:29:06AM +0300, Dmitry Baryshkov wrote:
>>> -      - qcom,sc7180-videocc
>>> -      - qcom,sc7280-videocc
>>> -      - qcom,sdm845-videocc
>>> -      - qcom,sm6350-videocc
>>> -      - qcom,sm8150-videocc
>>> -      - qcom,sm8250-videocc
>>> +    oneOf:
>>> +      - enum:
>>> +          - qcom,sc7180-videocc
>>> +          - qcom,sc7280-videocc
>>> +          - qcom,sdm845-videocc
>>> +          - qcom,sm6350-videocc
>>> +          - qcom,sm8150-videocc
>>> +          - qcom,sm8250-videocc
>>> +      - items:
>>> +          - const: qcom,sc8180x-videocc
>>> +          - const: qcom,sm8150-videocc
>>>   
>>>     clocks:
>>>       minItems: 1
>>> @@ -111,6 +115,7 @@ allOf:
>>>         properties:
>>>           compatible:
>>>             enum:
>>> +            - qcom,sc8180x-videocc
>> Is there a need for this? Isn't it already covered by the SM8150 entry?
> Yes and no. Yes - some change here is needed as I explained. No - this
> exact change does not work, so it is obviously redundant.


Yes, I agree. I'll add 'contains:' throughout the schema and remove this 
compatible since anyway it matches with sm8150 compatible.


Thanks,

Satya Priya


