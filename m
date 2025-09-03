Return-Path: <linux-arm-msm+bounces-71869-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5F2B421CE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 15:35:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AF7F4188750F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 13:35:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 281A93093D8;
	Wed,  3 Sep 2025 13:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Oq5EYdPk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D391EE7C6;
	Wed,  3 Sep 2025 13:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756906487; cv=none; b=gT2R5fWynBKUWC6uhKnfB5PNCdfkk9MTlqhIw4iRAG70aNIgsLShVvL1o79zIAObkRbzljOV4hk+H68sWfLYe+8CXLOeP7FZtl9pjMshJBc47fKcDegwmZ8SABCc3tlDhHsTswNInnMMKP/yNcCwRN8GP7jdN3aLot4glhsaT4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756906487; c=relaxed/simple;
	bh=EAV9G1NZWwYcTtYDpNYP0qYxFjeoE9satkLlJGdZv8g=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=SZzo1K/ipSSZi81TTI3ZLn3iRiNDI4YnFya4ig8Ykn2I/N6spLgqwWkgVXHwRhLqZ89xfSBC70M6NYL/3eoDaXRYhs8dVLVgJjWl8e4NZXRjUkW3YQXdhQlubMXuRWV/ITQRJ3uswo1neRMC9kPpe39BDg3o4Jg3oTevdZNef+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Oq5EYdPk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583BEuOs004906;
	Wed, 3 Sep 2025 13:34:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h5XQrsEBVWNvjygVqAdOwnAkCvxaBE49RrGWGcaTm+Y=; b=Oq5EYdPkCNFVocka
	u6prd+u9gJVgqxDSt+gtYT/4Y7DXfF0oA7UAvUws8B2OueiDHqKSAaTrr+65OvLB
	9C9jOFSw0qWJeWYfOZH3I6s6aw+9MRRItb+kkoOEqjvDX5jGKv8pxPf+33FwBixQ
	CSbQQ3JQUl1yoXKMr/Z6XU+QcYFOb+Eg7N63o8KJaMBAKQ0p9Hpp66ezBA/wUFUO
	k0Acgcfa8nE+alKkruHn0iPPGlYHGrPb9VXDB5qUroUctPnDI0zq59+PxhYqKsuO
	UMYqo1HBLocyFD0ShWK1nZB3xDl/LJn6C/mbLKjddgay69bk1db5UmMV/WNQ63lz
	BRJfbw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ur8s3wsx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Sep 2025 13:34:39 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 583DYcoZ001709
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 3 Sep 2025 13:34:38 GMT
Received: from [10.216.0.245] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Wed, 3 Sep
 2025 06:34:34 -0700
Message-ID: <89c85f63-4432-4779-b3e4-fcc7812f555e@quicinc.com>
Date: Wed, 3 Sep 2025 19:04:30 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 3/5] scsi: ufs: core: Remove unused ufshcd_res_info
 structure
To: Manivannan Sadhasivam <mani@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>,
        Ram Kumar Dwivedi
	<quic_rdwivedi@quicinc.com>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <James.Bottomley@hansenpartnership.com>,
        <martin.petersen@oracle.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-scsi@vger.kernel.org>
References: <20250821112403.12078-1-quic_rdwivedi@quicinc.com>
 <20250821112403.12078-4-quic_rdwivedi@quicinc.com>
 <1ccecf69-0bd8-4156-945d-e5876b6dea01@kernel.org>
 <1efa429d-7576-49da-a769-b1eba9345958@quicinc.com>
 <jzxvodlzamuta5cgupp7upkh2wjmi4n6gdvj5vceawhvw2kquc@hm4kz2qt5u2k>
Content-Language: en-US
From: Nitin Rawat <quic_nitirawa@quicinc.com>
In-Reply-To: <jzxvodlzamuta5cgupp7upkh2wjmi4n6gdvj5vceawhvw2kquc@hm4kz2qt5u2k>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAxOSBTYWx0ZWRfX9XNAfMHvLRfz
 3QLUUYdpd3y6VTPdJZTdq3xjvyI3cBr5lt9tyuIPCRAoIx5jKHTVOXcv2GkbaYtdyyfe8HeDLgv
 ea6iCW2nyN00HkbDILmb4uBPJePHvuarF/HkwoR8JuuvOZelCBDpUasVyqf7LIr/PAmpjrPBdyg
 VJxGadpfxqs4rJnW//yJj6WxluQ4VZTn8//1IloeOsOfIPgPhwEwr66lcnn13sDW/9wJc5uwSDm
 UfQ0pEbtPuO6w2oSPYAhdk4T+ZZwevzuAy1/VeV7AsjK8yKHT2sBWWYcCljZbEiPhj/fHYjqL6S
 hCXxg29L38NB7cfXdDT36GxhqPxkXZ9vKunLSfhtXhKZm1aNp4p+H4XpOqiFYCGll3VpSXKQRVg
 BqZKS3MD
X-Proofpoint-GUID: ZDVZf4fZr7deGWKxI1Yc1PFeo8jWD2V4
X-Proofpoint-ORIG-GUID: ZDVZf4fZr7deGWKxI1Yc1PFeo8jWD2V4
X-Authority-Analysis: v=2.4 cv=PNkP+eqC c=1 sm=1 tr=0 ts=68b843ef cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8
 a=4E0j1FCiVcJF2q5ArJcA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_07,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300019



On 9/3/2025 6:58 PM, Manivannan Sadhasivam wrote:
> On Mon, Sep 01, 2025 at 09:38:25PM GMT, Nitin Rawat wrote:
>>
>>
>> On 8/21/2025 5:18 PM, Krzysztof Kozlowski wrote:
>>> On 21/08/2025 13:24, Ram Kumar Dwivedi wrote:
>>>> From: Nitin Rawat <quic_nitirawa@quicinc.com>
>>>>
>>>> Remove the ufshcd_res_info structure and associated enum ufshcd_res
>>>> definitions from the UFS host controller header. These were previously
>>>> used for MCQ resource mapping but are no longer needed following recent
>>>> refactoring to use direct base addresses instead of multiple separate
>>>> resource regions
>>>>
>>>> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
>>>
>>> Incomplete SoB chain.
>>>
>>> But anyway this makes no sense as independent patch. First you remove
>>> users of it making it redundant... and then you remove it? No.
>>
>> Hi Krzysztof,
>>
>> The driver changes are in the UFS Qualcomm platform driver, which uses the
>> definitions, while ufshcd.h is part of the UFS core driver. Hence kept in 2
>> separate patch.
>>
> 
> No, that is not a logical split. When the users are removed, the unused
> definitions also have to be removed even if the definitions are in a different
> file.
> 
> So I believe you need to remove 'ufshcd_res_info' in patch 1 and 'ufshcd_res' in
> patch 2.

Agree with this. Hence I have taken care of this in v4.


> 
> - Mani
> 


