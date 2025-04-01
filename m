Return-Path: <linux-arm-msm+bounces-52929-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE74AA77535
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Apr 2025 09:29:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9D768168FFB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Apr 2025 07:29:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55B611E5B69;
	Tue,  1 Apr 2025 07:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LHjDyc1d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF4263C6BA;
	Tue,  1 Apr 2025 07:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743492572; cv=none; b=c7hwoM685vy/9S4AbTlbHj88UW/MXEJtgjUWzhfBVh7FeyIBvl5pNhHzSB/t029TOTPfwGzug3EqzNf9bBGrE/Ci6NsBGvmnSIqiTTz6nnlXV25smilP01COTtX+UhgFhVsSthA2zpaQ4nZCdLGSvtNXSURynjbrAnklMOetj5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743492572; c=relaxed/simple;
	bh=7Mi6frT1NeQj/XsSG8gQy+nMGEC170qMgEl5dCEfJsk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=BRmK9xJIf9HBHAhGxbAMqRS4krchLA92FB3Mz0ENXDuokoUCuQen/MMTlyHePbFa8pwwQ11JIC+mkVU6Q8CsghtNgT9drOj/7s1uRah3WaY9uVf6zwDJ/Fw3nIDDTzeyE6+oX59NRXxFBJyvX8gJUBhhNrpkk8gjfPOUl4Fz4gI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LHjDyc1d; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52VKGR2g008422;
	Tue, 1 Apr 2025 07:29:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bLZeSiGH6HliISV/KiBiadyU3Z+mg0WX0Yga632YDkw=; b=LHjDyc1dkXk9Vrtn
	881lWNL7LhoyG7s3IZdQ/ZiOC523Y7MCmv5HEZbMh0dy7lG3q4WaQyQr7vw/kftF
	7C64F59Tk664hbwLO+yGGgQZrixrNtZhqXEof9nIJPwFqgiJ2mZ0y+U+5jUz/A5L
	wfPVRHtIzD6Br3FP/jxnpaLCKwDjazPDkrDqbHk5DwJZiCXFKnQ09LRLpz0BwEGX
	TXVbp0f+hrYw2NM+jK59dNiFt5slt5ba3uJlVlMRm1ZFKfU2C1cmhseCreaJKiFC
	pf9R0JwA6Dqvy+7n1gtmXGUNxbKTJOc3Inp46gKK47uqRSAAfSnZ3QwZuNbs5wMm
	KVLiZQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45r1xnhcrt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Apr 2025 07:29:25 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5317TOnD024026
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 1 Apr 2025 07:29:24 GMT
Received: from [10.216.27.117] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 1 Apr 2025
 00:29:20 -0700
Message-ID: <321e1d4a-5aa3-49cb-8a85-e05dbaa08e78@quicinc.com>
Date: Tue, 1 Apr 2025 12:59:17 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 1/2] dt-bindings: mailbox: Document qcom,ipq5424-tmel
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: <jassisinghbrar@gmail.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <andersson@kernel.org>, <konradybcio@kernel.org>,
        <manivannan.sadhasivam@linaro.org>, <dmitry.baryshkov@linaro.org>
References: <20250327181750.3733881-1-quic_srichara@quicinc.com>
 <20250327181750.3733881-2-quic_srichara@quicinc.com>
 <20250328-lively-axiomatic-starfish-f9c0df@krzk-bin>
Content-Language: en-US
From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
In-Reply-To: <20250328-lively-axiomatic-starfish-f9c0df@krzk-bin>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: y23XF5kELf_Qn9BAg9alGUpzvetZ-8OK
X-Proofpoint-ORIG-GUID: y23XF5kELf_Qn9BAg9alGUpzvetZ-8OK
X-Authority-Analysis: v=2.4 cv=Qv1e3Uyd c=1 sm=1 tr=0 ts=67eb95d5 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=VkBhI5MTOIaAZJgvMfMA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-01_02,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 mlxscore=0 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 malwarescore=0 mlxlogscore=999 lowpriorityscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504010049



On 3/28/2025 1:32 PM, Krzysztof Kozlowski wrote:
> On Thu, Mar 27, 2025 at 11:47:49PM +0530, Sricharan R wrote:
>> +properties:
>> +  compatible:
>> +    items:
>> +      - enum:
>> +          - qcom,ipq5424-tmel
> 
> blank line
ok

> 
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  mboxes:
>> +    maxItems: 1
> 
> Why mbox is having an mbox? This does not look right and suggest the
> block is misrepresented. I read the diagram and description two times
> and still do not see how this fits there.
TMEL/QMP secure functionalities are exposed to clients (like rproc) by 
registering TMEL as mailbox controller. The IPC bit to communicate with 
the TMEL/QMP controller itself is handled by the apcs mailbox. Hence
it looks like a mbox inside mbox.

Alternatively, would it be fine to fold the IPC bit handling in this 
driver itself for doing the regmap_write (instead of connecting to
apcs mailbox separately) ?

Also, there are couple of other ways of designing this as well.
Earlier i mentioned this in the RFC post [1] for getting the design
sorted out.

[1] 
https://lore.kernel.org/lkml/20241205080633.2623142-1-quic_srichara@quicinc.com/T/

-------------------------------------------------------------
Had the below mentioned in the RFC earlier.

The intention of posting this is to get the design reviewed/corrected 
since there are also other possible ways of having this SS support like:

a) Make TMEL QMP as a 'rpmsg' driver and clients can connect using
    rmpsg_send

b) Keep TMEL APIs seperately in drivers/firmware which would export APIs
    and QMP mailbox seperately.
    Clients can then call the exported APIS.

c) Combine both TMEL and QMP as mailbox (this is the approach used here)

Regards,
  Sricharan

