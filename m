Return-Path: <linux-arm-msm+bounces-19922-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 568D18C7174
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 May 2024 07:52:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1984A2813DE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 May 2024 05:52:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83A991C6B9;
	Thu, 16 May 2024 05:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="TOTYgMIf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C4E20317;
	Thu, 16 May 2024 05:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715838758; cv=none; b=uQ/zeQf4eV3A2ct6mrl9DgDxLtow5hK77tIFVzCrGWC1X8Gz3Is42jl9cWxoAuLD9ZgGTNhe7y+kc5rREvHfcOntOOYn4DjvxAGnqx80iDFjm+3ET/ztcV3S3ILfinwz1VkVpHQywSQRv8+CuuLqm2fkWc7uL8ZRXylfWOof72U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715838758; c=relaxed/simple;
	bh=/+Ow78sUbpOddw6QMkRuc13wUjQlwvOjuOngn+eapoc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ciPTMD8frsE/pVuT1cwZeYtVUf36fNla6DIaBnTHzPDGqb75skgLleSLBtZlV7rHdMrRD+0JuJYPeD8Xl9w0e/2SRv9gw6I1VmErF4q7ANgKnbhEJ+JrnNGxEwNEw6Z7ofClRsnrQyovPKZiUhl8jlPqHqY8csuRRbXlupzpkzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=TOTYgMIf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44FKGVP8012294;
	Thu, 16 May 2024 05:52:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=Q1+UqqKqXZ+UrIGBtfXi/73W9Q+v3r9ONSYGA+nWMLY=; b=TO
	TYgMIfJsI1BwJBEbVpIxXXiwRZtzUUIPp2dkJkvUFS0UwULZuB/e+f4fsCFxsR8E
	RPMNEeabR6rF4wlbM9LAKjdyKBGGS+cetONu2Hdl1GPF8wPMuQ9ZJQnocQr+vANO
	HiC4TL1gIzT8p3zfzwLkSIEU/7UpI6LUk8VNGSqOZ/yTSy66agsheJFEcjGZ5GKY
	/067ext+Ws2r9PeQvmj8h5GCCeM/pyBazCj5O5+goqMpEa+jCu/+HImbnllMwWhQ
	vRqt7UpRKD3acFlQwSKeqbe4OXQ+HStP41XJDXfZODPmTPywFdOaMhfL83jWBreU
	C5qyIARLq65e4zE0kReQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y3j28qdqj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 05:52:30 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44G5qTPW030672
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 05:52:29 GMT
Received: from [10.214.67.128] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 15 May
 2024 22:52:25 -0700
Message-ID: <1c214d8b-9c59-7266-4c80-4b548ad6c7f9@quicinc.com>
Date: Thu, 16 May 2024 11:22:15 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] arm64: dts: qcom: qdu/qru1000-idp: Fix the voltage
 setting
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: Melody Olvera <quic_molvera@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20240514131038.28036-1-quic_kbajaj@quicinc.com>
 <45e0aee9-87d5-434f-8ffe-d3270def0f72@kernel.org>
Content-Language: en-US
From: Komal Bajaj <quic_kbajaj@quicinc.com>
In-Reply-To: <45e0aee9-87d5-434f-8ffe-d3270def0f72@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 5WAsNb2OR303Ri9Gh11NWI1ZjBV1Nocm
X-Proofpoint-GUID: 5WAsNb2OR303Ri9Gh11NWI1ZjBV1Nocm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-16_02,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 impostorscore=0 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0
 mlxscore=0 clxscore=1011 priorityscore=1501 mlxlogscore=689
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405160039



On 5/14/2024 6:57 PM, Krzysztof Kozlowski wrote:
> On 14/05/2024 15:10, Komal Bajaj wrote:
>> Fixing the regulator voltages for qdu/qru1000 idp boards.
>> In particular -
>> - smps4 is 1.574V min and 2.04V max
>> - smps5 is 1.2V min and 1.4V max
>> - smps6 is 0.382V min and 1.12V max
> 
> Wait, why? This looks, at least partially, you are changing from fixed
> voltage choice to full range, without clear explanation.
> 

When we started using one of these regulators for USB enablement as sent 
in the patch series [1], we saw a sudden reboot.
After adding more debug logs, came to know the configuration for smps5 
was incorrect.

Therefore, cross verified the configurations for all the regulators and 
got to know that these are incorrectly configured.
This fixes some manual errors introduced in the initial patch (mentioned 
in fixes tag).

[1] 
https://lore.kernel.org/linux-arm-msm/20240502090326.21489-1-quic_kbajaj@quicinc.com/

Thanks,
Komal.


>> - smps8 is fixed at 0.752V
> 
> 
>>
>> Fixes: d1f2cfe2f669 ("arm64: dts: qcom: Add base QDU1000/QRU1000 IDP DTs")
>> Signed-off-by: Komal Bajaj <quic_kbajaj@quicinc.com>
> 
> Best regards,
> Krzysztof
> 

