Return-Path: <linux-arm-msm+bounces-24782-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A69891DA27
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2024 10:40:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 72BAAB2102C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2024 08:40:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94D5F83CD7;
	Mon,  1 Jul 2024 08:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="d+4eF9Pm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9005839F4;
	Mon,  1 Jul 2024 08:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719823234; cv=none; b=rD8k06mDFxncuNLhRvhk/Agz8dbJfJFIWZa1NmzbQNCx0gCRobqb4OBjH5GRX29jZllAG7XjRiYYkX0Xw2R08ZqxCvVQypOFln86CPspi7dmPUWozpJj1Z1EzCaHgKmuiOHD1jIbvKy1HebsKuGFZvYDQLilQnzsHejGmCzRF0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719823234; c=relaxed/simple;
	bh=lQDakvkuTP95XC9nGbLvBkMLIuh0XUah0cZPHLuoKsE=;
	h=From:Subject:To:CC:References:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=aFlIIBZlKUAQylQH5xpS1T6D7BD82WQS1Hn2OvUTP/I+9LBfmvdY/lb/Y/13tF7FGZ/A47tFobpns8tELYZ1DfrkXSyw7LWu+JhcVXdNxfdmdfAr9aX43HO22+U2Z6a+ckilieITyQRpKlPbWqe/HSBsrm7XZcBpeIEkAaKcme8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=d+4eF9Pm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45ULuuvT006937;
	Mon, 1 Jul 2024 08:40:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ILgMAm3EqPPh0KqXEOvCXs48fV2I2eMWHuby+dIR9PY=; b=d+4eF9PmHd5p3WEU
	0raCfLW2iM/UaunLmOj/TPp9ymzWT+XPW94xCgam/rhbE3gJUB10Z9S1kX6POIG0
	c37+Z1KJjVBfTDX0V9L/rNTEBFlv8rZ4xrLk9pghRkljBnbH5OX/dOVaiw+350nW
	tXa+oy8RBSADea6SVlFM+/YaZGTvr6rLwIKVYTtqXd8CUK6eE7rTiB5VOaIk+kt+
	ktPbmiyAhGvdqMVbw/G0wdShoAu0e4hXVPiQkU2TcKZa8xKDBcNeHxsE/fneOLEJ
	muZich7gjc8IZ85XLetkfrsFveOU7DMRBu+bTN4VI+Q7UMkOs8D+yH+WciMqNIXB
	I1Gbcw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 402bejk8vj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Jul 2024 08:40:28 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 4618eRqi007170
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 1 Jul 2024 08:40:27 GMT
Received: from [10.214.66.219] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 1 Jul 2024
 01:40:23 -0700
From: Naina Mehta <quic_nainmeht@quicinc.com>
Subject: Re: [PATCH v3 3/5] arm64: dts: qcom: sdx75: update reserved memory
 regions for mpss
To: Konrad Dybcio <konrad.dybcio@linaro.org>, <andersson@kernel.org>,
        <mathieu.poirier@linaro.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <manivannan.sadhasivam@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20240618131342.103995-1-quic_nainmeht@quicinc.com>
 <20240618131342.103995-4-quic_nainmeht@quicinc.com>
 <e5b7a888-8ca3-463a-a2de-cf719e58d7a0@linaro.org>
 <c186bd2e-a132-fbe6-2212-dcdb93a6c14a@quicinc.com>
 <45c95955-51a7-489f-993e-252e8bd63dbd@linaro.org>
Message-ID: <fc7e3c93-1a79-6911-04c2-19ddc7e298cb@quicinc.com>
Date: Mon, 1 Jul 2024 14:10:20 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <45c95955-51a7-489f-993e-252e8bd63dbd@linaro.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: rAgPgtuWnVBKcgr4r2NkUCMxJbSIA-Le
X-Proofpoint-ORIG-GUID: rAgPgtuWnVBKcgr4r2NkUCMxJbSIA-Le
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-01_07,2024-06-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 impostorscore=0 spamscore=0 clxscore=1015 mlxscore=0 suspectscore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407010066



On 6/26/2024 9:12 PM, Konrad Dybcio wrote:
> On 24.06.2024 1:21 PM, Naina Mehta wrote:
>>
>>
>> On 6/18/2024 7:08 PM, Konrad Dybcio wrote:
>>>
>>>
>>> On 6/18/24 15:13, Naina Mehta wrote:
>>>> Rename qdss@88800000 memory region as qlink_logging memory region
>>>> and add qdss_mem memory region at address of 0x88500000.
>>>> Split mpss_dsmharq_mem region into 2 separate regions and
>>>> reduce the size of mpssadsp_mem region.
>>>>
>>>> Signed-off-by: Naina Mehta <quic_nainmeht@quicinc.com>
>>>> ---
>>>
>>> Alright, we're getting somewhere. The commit message should however motivate
>>> why such changes are necessary. For all we know, the splitting in two is
>>> currently done for no reason, as qdss_mem and qlink_logging_mem are contiguous
>>> - does the firmware have some expectations about them being separate?
>>>
>>
>> Since different DSM region size is required for different modem firmware, mpss_dsmharq_mem region being split into 2 separate regions.
>> This would provide the flexibility to remove the region which is
>> not required for a particular platform.
>> qlink_logging is being added at the memory region at the address of
>> 0x88800000 as the region is being used by modem firmware.
> 
> Ok, now put that in the commit message :)
> 
> And I suppose:
> 
> "This would provide the flexibility to remove the region which is not
> required for a particular platform." - but you still pass both to the
> remoteproc in patch 4. Are these regions mutually exclusive?
> 

Yes, for IDP platform, we are using both the DSM regions.
Based on the modem firmware either both the regions have to be used or 
only mpss_dsm_mem has to be used.

Regards,
Naina

> Konrad
> 

