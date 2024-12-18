Return-Path: <linux-arm-msm+bounces-42688-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D481B9F69E7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2024 16:21:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BB8501883BBE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2024 15:19:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E85961B425F;
	Wed, 18 Dec 2024 15:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="pD5jB407"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B37376410;
	Wed, 18 Dec 2024 15:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734535173; cv=none; b=pFKlWN4goKfW6r1p0D2w311M/So2+XGgqhdW5BsS2bTyWItY9m3U5AtvAwx/nGvsa1DcblQUOB7tvBUhUcCMDtg90Dha3/ib95+439jCm3Ihf9F3mZHa0OREJkI92gVLF+FBhi1gVkx2tK38YIKIN3WNJFLUZugkWxeQ3JsiCcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734535173; c=relaxed/simple;
	bh=LjFNish1dc/CV+o5lZI8OS72vVCjbei47j1H7DVlClo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=IIk3YeL1Ew9ba+J/6cDDdpLseK0HUng3MrVS5ihKF1iT0EQKKQFSopm94qQ61gRBXjsCDiE7KoAuINlkAFBMfOyv1vmClq7ByracyuUyV6spy9e7X5e16vfuuaq8tj/oTYs+EmvCXxQPgP12sEjdTjrEpmuJy3FHxG4V2T37lEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=pD5jB407; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BIEICbf010042;
	Wed, 18 Dec 2024 15:18:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MlCWfORcQPF1uS9V5F+d7aUrmO/JpT8/ia+4goMdXqI=; b=pD5jB407PelmCaVk
	vAMg7sX6Qkeaz+faQ2h7APWoYqlmOCzbF+thVuskJKNTo5jHi2RJpjdjVGjYMjTM
	xvGvbW5BiWUdW9C0vpnCZISk/R/4IM1GeKsZ7V+m6bJo39f1cmCoe7bstC7J+Wq8
	froP3KJ43spw0nhnvKIKzxYtAYwW0e7i99KrniChHAdczYWjGBx7tTPZ+DyWL540
	GfZmMehHnsNvu8A1VeO/W1k7uZX7DDXyzNtZLlzzKwC9dOI9i2/igdVCw57F4LW7
	d4SXbvBOUAmjryynuiuosPQyp1riOj4ivnCQz1bcnDGb2T7ct6aaIMdoCjGXBhx5
	7LXIWA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43m01gg59k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Dec 2024 15:18:43 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BIFIgSC010610
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Dec 2024 15:18:42 GMT
Received: from [10.218.43.20] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 18 Dec
 2024 07:18:39 -0800
Message-ID: <0f4836c6-9a1d-4798-af1c-b3a01d2328d5@quicinc.com>
Date: Wed, 18 Dec 2024 20:48:36 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3] scsi: ufs: qcom: Enable UFS Shared ICE Feature
To: Bart Van Assche <bvanassche@acm.org>, <manivannan.sadhasivam@linaro.org>,
        <James.Bottomley@HansenPartnership.com>, <martin.petersen@oracle.com>,
        <andersson@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Naveen Kumar Goud Arepalli
	<quic_narepall@quicinc.com>,
        Nitin Rawat <quic_nitirawa@quicinc.com>
References: <20241217144059.30693-1-quic_rdwivedi@quicinc.com>
 <65f95b01-8d2d-4e03-88a2-c501379f21ea@acm.org>
Content-Language: en-US
From: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
In-Reply-To: <65f95b01-8d2d-4e03-88a2-c501379f21ea@acm.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: RmQ4LPZ2YxEkw_JjUQOHKMePgi5HsbsK
X-Proofpoint-ORIG-GUID: RmQ4LPZ2YxEkw_JjUQOHKMePgi5HsbsK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 clxscore=1015 mlxscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 suspectscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412180119



On 17-Dec-24 9:16 PM, Bart Van Assche wrote:
> On 12/17/24 6:40 AM, Ram Kumar Dwivedi wrote:
>> +    unsigned int val[4] = { NUM_RX_R1W0, NUM_TX_R0W1, NUM_RX_R1W1, NUM_TX_R1W1 };
>> +    unsigned int config;
>> +
>> +    if (!is_ice_config_supported(host))
>> +        return;
>> +
>> +    config = val[0] | (val[1] << 8) | (val[2] << 16) | (val[3] << 24);
> 
> Has it been considered to change the data type of val[] from unsigned int into u8 or uint8_t? That would allow to use get_unaligned_le32() instead of the above bit-shift expression. Additionally, why has 'config' been declared as 'int' instead of 'u32'?
>
Hi Bart, 
Thanks for review. We have addressed your comment in latest patchset.

Thanks,
Ram.

> Thanks,
> 
> Bart.




