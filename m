Return-Path: <linux-arm-msm+bounces-40705-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DECD69E66D4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 06:27:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 99F9B284DBA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 05:27:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EE40199392;
	Fri,  6 Dec 2024 05:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LWVYgCwf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC9B5194C6F;
	Fri,  6 Dec 2024 05:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733462864; cv=none; b=ZdLJgty7Lk7r/poDQH9eprSsBXiHb4dxQyK82R1ScKJ+fZ7yshv/F+6ZWW5EIs82hXq3L1PCvAWs24UPo+bj8KUGrT7smFmepeuOAJfvRAPR9xmMmMnW7kr5Myw4HG/YF+/EDcUmkGlPCd28S4qaGrqlhZ14nOjZgJm1F172okY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733462864; c=relaxed/simple;
	bh=n49cZMt8fyzcEOsPskmd0i1C0Ujbbl232rPfrhh5Pc4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=r8pRiG0TIZuTv3wwahN9LOuWgagIAZtoKsEpZYUBtA7sJxzwy528nYgVHYqT+ct/L1A8bSyvhh+R8QnMWIuxKFr3aZbSxWXV3+YwGe8vFhi/4H7Gt4h6YWVUWgAjB/9K7I82OY0KZZTW9woaOwUSUjdjtiEbFWkRozX3BMGTjgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LWVYgCwf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5HaRHI004903;
	Fri, 6 Dec 2024 05:27:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MdckaWPuNfCGb6nEWiCV1VdAHxRdIKi2c95j7PHO29o=; b=LWVYgCwf936SiNgh
	c3woNL0aNsIL3e4ZYTZ8invyzRTF/ep3XvLrsJ0bRWl3CbM/i+sWhw/WhNjoTJdV
	F5iQFuXHsHjEhoy2Yz4M+BybX2hYuD7/pwCDyc7pKdVn2imUOlpwbzVe5VtJMAqe
	G1tSHOAkwGJgjC6hNxtCYhqH8Fa2dHx/lRSdCD70pK8o9U0udbgUMzQ/3kqp0FVH
	iaNn+7xic/QP2iDplHO9Mdc93Ib69uR1EqlOsX49JSeUT4+YlEcdA8SWW83PnF3+
	CKai0AiGp52QsoVihbNkdNh3Fd234hqBsa7MUm4Oy3u1PfhcYrIf0jUr8tLaD8ed
	ePP/dA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ba142qbf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Dec 2024 05:27:37 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B65RaJM011802
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Dec 2024 05:27:36 GMT
Received: from [10.50.18.22] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 5 Dec 2024
 21:27:34 -0800
Message-ID: <01a4eb57-d7bc-4d0b-82f6-d3c19a089966@quicinc.com>
Date: Fri, 6 Dec 2024 10:57:31 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/2] dt-bindings: mailbox: qcom: Document
 qcom,tmelite-qmp
To: Krzysztof Kozlowski <krzk@kernel.org>, <jassisinghbrar@gmail.com>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20241205080633.2623142-1-quic_srichara@quicinc.com>
 <20241205080633.2623142-2-quic_srichara@quicinc.com>
 <e6759ca4-bcfb-4817-8a72-d1e9eb5d3d02@kernel.org>
 <360dda0a-35e0-4fcb-a2bf-77d400d71623@quicinc.com>
 <640201c7-84d5-4564-8ef3-afcc39929fd9@kernel.org>
Content-Language: en-US
From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
In-Reply-To: <640201c7-84d5-4564-8ef3-afcc39929fd9@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: u1h9VA74s-AR7A9uzWuOcYv1H4rUJp_3
X-Proofpoint-ORIG-GUID: u1h9VA74s-AR7A9uzWuOcYv1H4rUJp_3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 phishscore=0 clxscore=1015 mlxscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=680 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412060038



On 12/5/2024 5:13 PM, Krzysztof Kozlowski wrote:
> On 05/12/2024 10:17, Sricharan Ramabadhran wrote:
>>
>>
>> On 12/5/2024 1:42 PM, Krzysztof Kozlowski wrote:
>>> On 05/12/2024 09:06, Sricharan R wrote:
>>>> From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
>>>>
>>>> This binding describes the component responsible for communication
>>>> between the TME-L server based subsystems (Q6) and the TME-L client
>>>> (APPSS/BTSS/AUDIOSS), used for security services like secure image
>>>> authentication, enable/disable efuses, crypto services. Each client
>>>> in the   SoC has its own block of message RAM and IRQ for communication
>>>> with the TME-L SS. The protocol used to communicate in the message RAM
>>>> is known as Qualcomm Messaging Protocol (QMP).
>>>
>>> This is RFC, so only limited review follows. I will review more once
>>> this is ready for review.
>>>
>> Thanks. Once i get the design/approach confirmed, will post the V1.
> 
> Not a v1, but next version. This was v1 already, because we do not count
> from 0. Please use b4 to avoid such mistakes.

Ok, understand.

Regards,
  Sricharan

