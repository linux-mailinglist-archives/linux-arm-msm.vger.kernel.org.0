Return-Path: <linux-arm-msm+bounces-46718-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D57A25493
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 09:38:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B64F31638CC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 08:38:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 461CC1FBE88;
	Mon,  3 Feb 2025 08:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="PV4PSb9y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 976501FA859;
	Mon,  3 Feb 2025 08:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738571893; cv=none; b=mGc0KNG12F3iIbcW1QD2YsdEsMT7pHMq91CNY1aCQDluI58FtYKAsQv6Y0BfTmTwC6pw6eun0crecmLEYQHlj9DgDGUvHHGWKkPg8VCoJyk4IqKqRZ6Tolay+dotFPrYLH0xeDWzB2aUz8GZvv9dzOhrqZ2BavypikA88kGgvSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738571893; c=relaxed/simple;
	bh=EJVvYHmUv5g/Vnq219Og/XdQw7v2OLZ38BqZWLWWbgA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=TnmM+YbCfr6JVrtku7HjaBByPZ1SgnRdyWeJ0lm6B5ZRcZi3t8mqdv3wLdPjXmrIW9C8uUCnZM+JAVGrnAFgupDvLIwSvNpEEacR5o8p6Iwg4guYKYZ6yDKNHuHx4nFZq5dHv8t80Sfgj6T0NfCdpah1JS7dwUkEpveZo5wJwsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=PV4PSb9y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5135lEr1007514;
	Mon, 3 Feb 2025 08:38:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XVGYg007DqlZ14Celc1KRgbSlHax+yNO1OqjdJZgd5k=; b=PV4PSb9ywGcurZ2N
	BQBhAJnxJtXP/oJ1EBRGtk0FtNpLNTKo70pmYFul3I0+AU5Szf30TnFfqIdJXqX0
	hxsiwpJksDdw6sqBxwwd/VGrfSaX29gWFiSxHHn30GjYuYPSdUTOCUIm5dt/97hM
	xxbNC4APIDCokYgC5+CkA2lQovNlm+XjnlGmcdqu0mzVQ7bpPoQ3tk9uIdubCxrY
	tY5LbjoM1NmeHrIR59ApO4uTCoBnplgOesGoKcgyNL4PuldS0BUkolPCOQR+e3Nh
	SbynayGywdqj3BaBs4ID1mm2pJNjt4TtiTFsnW8lKm7EoTQ31J21d8agVF9C8KgP
	iyTeRA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44jqxw0bva-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Feb 2025 08:38:01 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5138bxcX030486
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 3 Feb 2025 08:37:59 GMT
Received: from [10.219.57.57] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 3 Feb 2025
 00:37:55 -0800
Message-ID: <273df630-007d-4aaf-9432-2884a7e94d5e@quicinc.com>
Date: Mon, 3 Feb 2025 14:07:52 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] Add support for GPU SMMU on QCS8300
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg
 Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>
References: <20250203-b4-branch-gfx-smmu-v4-0-eaa7aa762f48@quicinc.com>
 <20250203-lean-delightful-ermine-f5b902@krzk-bin>
Content-Language: en-US
From: Pratyush Brahma <quic_pbrahma@quicinc.com>
In-Reply-To: <20250203-lean-delightful-ermine-f5b902@krzk-bin>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: A3Y4AVxh3AHw6zDw3dRdd7GiAx6Rmuqp
X-Proofpoint-GUID: A3Y4AVxh3AHw6zDw3dRdd7GiAx6Rmuqp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-03_03,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 phishscore=0 bulkscore=0 priorityscore=1501 mlxscore=0 suspectscore=0
 adultscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502030068


On 2/3/2025 1:03 PM, Krzysztof Kozlowski wrote:
> On Mon, Feb 03, 2025 at 11:17:00AM +0530, Pratyush Brahma wrote:
>> Enable GPU SMMU function on QCS8300 platform. GPU SMMU is required
>> for address translation in GPU device.
>>
>> Signed-off-by: Pratyush Brahma <quic_pbrahma@quicinc.com>
>> --
>> Changes since v3:
>> - Modified the order of clock voting and properties as suggested by Konrad
>> - Removed dependency on clocks in commit text as change is merged in
>>    linux-next before current base commit
>>
>> Link to v3:
>> https://lore.kernel.org/all/20241227105818.28516-1-quic_pbrahma@quicinc.com/
>>
> How are you sending these?
>
> b4 diff 20250203-b4-branch-gfx-smmu-v4-0-eaa7aa762f48@quicinc.com
> Grabbing thread from lore.kernel.org/all/20250203-b4-branch-gfx-smmu-v4-0-eaa7aa762f48@quicinc.com/t.mbox.gz
> Checking for older revisions
> Grabbing search results from lore.kernel.org
>    Added from v3: 2 patches
> ---
> Analyzing 7 messages in the thread
> Preparing fake-am for v3: dt-bindings: arm-smmu: Document QCS8300 GPU SMMU
> ERROR: v3 series incomplete; unable to create a fake-am range
> ---
> Could not create fake-am range for lower series v3
I have sent this version of the patch series using b4 for the first 
time, as suggested earlier [1]. The issue might be due to the previous 
version being sent
incorrectly using git send-mail. Consequently, I had to manually apply 
the previous patches after creating the b4 branch,
since "b4 prep -F" was throwing an error when trying to apply the last 
patch.

[1] 
https://lore.kernel.org/all/64ak7h5pwqinmcymas5i4xexa6bntvti7zkwfhzx7qrsmgaow3@zmn7jffcrp5f/
>
> Best regards,
> Krzysztof
>
-- 
Thanks and Regards
Pratyush Brahma


