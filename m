Return-Path: <linux-arm-msm+bounces-67990-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64BB7B1D5BC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 12:22:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9801A176CC0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 10:22:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C30DD230D2B;
	Thu,  7 Aug 2025 10:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ly3OWM66"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2884A229B2E;
	Thu,  7 Aug 2025 10:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754562153; cv=none; b=Xjvsl38oAbAjOjTc+PNzh2yWpoY7T5pOmpk88LjPOY/iEh8Y5AKVuBvKeau7fqZdX3w4otGTPQ31r/4hdn1lbylBjx32HKQvQRmTZPdK5OM1SrM8LOJHHg2g+PDCwZBa3k2nxaj+t48TuCyDEYrZIBe2i7LkLLAsKu+aSb8FgM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754562153; c=relaxed/simple;
	bh=bxXxBx0q+rEvahnpBPM8quAxYfnYhXwuzt+kP9CiZpE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=q3esLskRtRLx8EEYGgPSzq3w+b88WdnApkQb7Ke3gtt5pz9YWHKe8zwE6cPkxCy/bElOTquYDbHwm0ny+MAafBk+AOXyhnGgNT3aER/rPzG/IHD3vqmYI2uL4wOg48SXJ6RWWaZpSoPExKMiE93cA9P/CCi7Md2f0uA5ZWRUzI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ly3OWM66; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5779DA3d003603;
	Thu, 7 Aug 2025 10:22:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mFLRsK25BoxpZs4W0silGq6dm59BiiPnRbKoTG1ly3c=; b=ly3OWM66NDMUh2GH
	EkOEvofUFsjOT9+QUDuT9cKoL4fhGRQe9fiRAkN9aCxQRY+M5yQ43YDPygiX1QvW
	Jlowb9knejFGaSr5JYZfja35trt3sSbAfkdBNLqsqjuN69kiWG+afaEvuwxszzY7
	jw/1/qzlTAAPU9s+VuECDfRSDL+ZLq7W0s6ilL7dEAG043AX2qWs9r09W77yrbmH
	8TB9Etk0HsawGbeCtbFIArIvUHjAZB1hEzzClGDw3/JzTsjwq9bnNL/YPszdAo+T
	bpqNQUNebj3ZIwNHHMyV2uPwKtkZk8CQWkkE+9aFZGofCcI399ednN7ORcyFGLBS
	PUBwZQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpvyx4m0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Aug 2025 10:22:27 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 577AMQip001044
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 7 Aug 2025 10:22:26 GMT
Received: from [10.216.18.215] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 7 Aug
 2025 03:22:23 -0700
Message-ID: <0bfb6a39-785b-431f-9cd4-c63df35c5ac3@quicinc.com>
Date: Thu, 7 Aug 2025 15:52:20 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] ufs: ufs-qcom: Align programming sequence of Shared
 ICE for UFS controller v5
To: Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>
CC: <James.Bottomley@hansenpartnership.com>, <martin.petersen@oracle.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_nitirawa@quicinc.com>
References: <20250806063409.21206-1-quic_pkambar@quicinc.com>
 <ucr4imzntw6ghcvpeioprmva7gxrqnkphjirjppnqgdpq5ghss@y5nwjzzpvluj>
 <c62c2744-0d07-4fe8-8d2a-febc5fa8720a@oss.qualcomm.com>
 <mhridnexscaevsmssu6k3l4x276cj63gl2rlvypym23kj2kgov@pw323zkhqcrg>
Content-Language: en-US
From: Palash Kambar <quic_pkambar@quicinc.com>
In-Reply-To: <mhridnexscaevsmssu6k3l4x276cj63gl2rlvypym23kj2kgov@pw323zkhqcrg>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: l5T1PRQxmbobViJG3Kxh3Sbm9UIXktxe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX5n48MN/3KK4H
 GJCrHcoPyPcOZ95/AUxe6hJbz2HlPNJch6HATKv3Iby8HPjXfL7/uOIgpPFmqUgamvG7Wo9R0f/
 cKKbk+GIYtaITUepBqg35jENZSo6Yc6YlirTmcGUZls3ZYncjfDB1HsZGIgU6M9M/Uqa9AmssYk
 tHxX3afe+nYJhrTfk9PWOl/AhD4Kt5hPq7820xLgwNmSSpRUeJvYpjMsp+KTvILxy8Fm4o8sKvp
 MYA6thiQCsdRwS/M0lzym0siQYYfmlLgNVhfc4o0seB6tRJCQtWYYA6Vd0w6XDGP/L+F813OaQg
 GbmFXjCm2PNCikMSm+u472iemUaKlS0jjRcKmuhtqlk3ysPF5Gp+6KiYErQG/Zb+GJC0Yp6oKnA
 JYg76iap
X-Proofpoint-ORIG-GUID: l5T1PRQxmbobViJG3Kxh3Sbm9UIXktxe
X-Authority-Analysis: v=2.4 cv=NsLRc9dJ c=1 sm=1 tr=0 ts=68947e63 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=ftMxJ0LbfJfX_HPbJzQA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-07_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009



On 8/6/2025 11:09 PM, Manivannan Sadhasivam wrote:
> On Wed, Aug 06, 2025 at 02:56:43PM GMT, Konrad Dybcio wrote:
>> On 8/6/25 1:14 PM, Manivannan Sadhasivam wrote:
>>> On Wed, Aug 06, 2025 at 12:04:09PM GMT, Palash Kambar wrote:
>>>> Disable of AES core in Shared ICE is not supported during power
>>>> collapse for UFS Host Controller V5.0.
>>>>
>>>> Hence follow below steps to reset the ICE upon exiting power collapse
>>>> and align with Hw programming guide.
>>>>
>>>> a. Write 0x18 to UFS_MEM_ICE_CFG
>>>> b. Write 0x0 to UFS_MEM_ICE_CFG
>>>>
>>>> Signed-off-by: Palash Kambar <quic_pkambar@quicinc.com>
>>>> ---
>>
>> [...]
>>
>>>
>>>> +		ufshcd_readl(hba, UFS_MEM_ICE);
>>>> +		ufshcd_writel(hba, 0x0, UFS_MEM_ICE);
>>>> +		ufshcd_readl(hba, UFS_MEM_ICE);
>>>
>>> Why do you need readl()? Writes to device memory won't get reordered.
>>
>> I'm not sure if we need a delay between them, otherwise they'll happen
>> within a couple cycles of each other which may not be enough since this
>> is a synchronous reset and the clock period is 20-50ns when running at
>> XO (19.2 / 38.4 MHz) rate
>>
> 
> IIUC, the second register write is just reenabling the mask, so there is no
> delay required between these two writes. If that's not true, and if there is a
> delay required, then do:
> 
> 	ufshcd_writel(0x18);
> 	ufshcd_readl();
> 	usleep()/msleep();
> 	ufshcd_write(0x0);
> 

 I will address this in next patch set.

-Palash K




