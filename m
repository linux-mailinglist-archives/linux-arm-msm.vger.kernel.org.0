Return-Path: <linux-arm-msm+bounces-60266-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9D1ACE8A7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 05:35:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4BB9A3A97BA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 03:35:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE8BB1F8EEF;
	Thu,  5 Jun 2025 03:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VOYIKthe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA5E61F8BD6;
	Thu,  5 Jun 2025 03:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749094510; cv=none; b=Ivljvl8ATr7bZXKXHcvR3zB+zEhfpUc+8oDrd9/c8NsVX3NyUL7br19elqVSfb8Ez8zYTXh8bQkqy6dB44Dy3rAfZ86gY6J58556oekj3xv7c+sprJBvd7YQuMWkgt1ueN2XoPtKB5629wvx2kIcQlpxivU4b/8R0gEeTAzJR2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749094510; c=relaxed/simple;
	bh=fkxEIFyRAyzUTGA/3k3vFB28vHxgYECrnK2TeDDpRq4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=IhIYS6RxC6UVh0UChvRYsgGO9ypb8ZIoRVmWAbjS1bMNpPWRt/92qRyWz4cl6vJ46jL+Bk6vPUkPke28oCL25pe5gqKES7uMYROaGaLshF+Qn0JiDwBuHkfvWCmB7ztyChILjnYpOdwNJaEnBCE7SBlwh70LP12x7HdI26QcwRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VOYIKthe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 554G3Ito000686;
	Thu, 5 Jun 2025 03:35:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6qsyL/mkUf55/J1iG+sSINN6G+q6LgfkddYl7Zora7w=; b=VOYIKthegoG2oCZK
	JYV200Y0H3XY9AkG6xJ/lV6uzluNKMrY1Wy6rQYSdwY6uL/qBbXwB9gd6z/kAFjz
	Wg82IGt5w96z1B3/qyBFqkDyJeIptFqpqnzduhZHJMieAU/eDQCoHKq3ByaUQelG
	BHwU4DpAusg10V9MEgpfJi7WS9V897mnlyyy67vEtp6tSTkdd9zRV6TpvukYERyM
	gK21Ilx99otoyfw8Oify8aqyjXxpteZlcPA4KSUWS1ZysmJ0hgDvW/A+Ac8ZVlRG
	0YlsOaA6Kqnm8hiNa2iog2WDMNrBpvCAn901b3kEnjmSUNMfKIzWVERFlbZBYe8O
	IBmzNA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8q80qp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Jun 2025 03:35:03 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5553Z20Y002294
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 5 Jun 2025 03:35:02 GMT
Received: from [10.216.5.91] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 4 Jun 2025
 20:34:56 -0700
Message-ID: <f80ea2fa-1003-48ae-bf57-df388ba1963b@quicinc.com>
Date: Thu, 5 Jun 2025 09:04:53 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/8] serial: qcom-geni: move clock-rate logic to
 separate function
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-serial@vger.kernel.org>, <devicetree@vger.kernel.org>
CC: <psodagud@quicinc.com>, <djaggi@quicinc.com>, <quic_msavaliy@quicinc.com>,
        <quic_vtanuku@quicinc.com>, <quic_arandive@quicinc.com>,
        <quic_mnaresh@quicinc.com>, <quic_shazhuss@quicinc.com>
References: <20250506180232.1299-1-quic_ptalari@quicinc.com>
 <VkNsXqYDdmwW9dutwc76Dv8ks2pvgcUwpf1UREJXhbXDQRaobVZL8m0hLz6rsOG-v6CjyAW3vHbuKMiPc9kN_Q==@protonmail.internalid>
 <20250506180232.1299-7-quic_ptalari@quicinc.com>
 <47d19ad8-37ad-462f-8cb3-d39c29008709@linaro.org>
 <8f18716f-cba2-4615-950a-63b6b73e23e9@quicinc.com>
 <bdcc3e48-ceee-45bf-bc4f-f0e63d44b333@linaro.org>
Content-Language: en-US
From: Praveen Talari <quic_ptalari@quicinc.com>
In-Reply-To: <bdcc3e48-ceee-45bf-bc4f-f0e63d44b333@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: CtWTna4LdkrIX9NIzyo90YhRRAqgel9y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDAyOCBTYWx0ZWRfXwJytQT2pNwGp
 RJH0MsY0N+zfZjtQe/WbVFJRL2Nok6veHKbGALPBVzEOX9mAPijf4w4hZpNF9UjlpaJ6C2vDXI7
 qiUXvm37yDTAG/6Wo8PBfZWqbNaBwHpvBpttQ3WswU+hwjoVZEea00pt6Us7UEpzFTJQShyZ12K
 ODm/k8d/rUs50uXVR6lMY/u1mo+sKz+TWsx+D4mhWIl761LQk4rqqLBQBf0y5C1tg9N0n9Rce7f
 awmXOzTZ+dgPaDl/cMBgIaH8oy8Y6ux54kimdjKkzCUfCQ7NKAU5uoIjUlWAPK2psFKko6cAAcl
 3NOU/m9svGfiWshyRLCwLGjQz1T9Jk9Wq1e/LGtqb+hpN52vE4NbmU4OMXqF2Ho2CdiKKaCzoWu
 j1pFwZd4P5hIQCFpl2Ipdc98RO0rPchxtucPL9mMoUK3kiha0oeM7+4sQmHnK3ADltH5tHeu
X-Proofpoint-ORIG-GUID: CtWTna4LdkrIX9NIzyo90YhRRAqgel9y
X-Authority-Analysis: v=2.4 cv=PrmTbxM3 c=1 sm=1 tr=0 ts=68411067 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10
 a=bzMaToIjV4cEPkjtaokA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_01,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 mlxlogscore=999 mlxscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015 adultscore=0
 suspectscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506050028

Hi Bryan,

Thank you for your inputs.

On 6/5/2025 5:19 AM, Bryan O'Donoghue wrote:
> On 04/06/2025 18:11, Praveen Talari wrote:
>>> Separate this stuff out.
>>>
>>> Your code should match the commit log. If you want to convert %u to 
>>> %lu make a patch to do that, even if it seems trivial, it is better 
>>> to make granular submissions.
>>
>> It comes under newly added API. Do we still need to make separate patch?
> 
> Best practice is to split this stuff up.
We can avoid this change by using unsigned int instead of unsigned long 
in newly added API function params.

Will fix in next version.

Thanks,
Praveen Talari
> 
> If your commit log says "I'm moving code" then it should _only_ move 
> code, don't sneak any other changes in, no matter how seemingly innocuous.
> 
> ---
> bod

