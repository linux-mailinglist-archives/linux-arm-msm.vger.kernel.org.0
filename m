Return-Path: <linux-arm-msm+bounces-61514-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 75013ADBED8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 03:53:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CBA3C18934CC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 01:53:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F9C91ADC97;
	Tue, 17 Jun 2025 01:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="oVoL4xiz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ACDC1A316C;
	Tue, 17 Jun 2025 01:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750125189; cv=none; b=fw2AZCiBDsXEXMtxjWle//bkd6eJwHptPGEhWyye22OCf064m7tNsSSLgF36Yq/+n7vGwmkARsQ1yEoU9RXJfxJUFZ9K3ICOYcG7TTX6ozBkSEKF5YsVAuOtMZ4htpClwxcDiaeA22rESVVS1Jr1N1amR9NyWaQ0Z7fc9oPJ0uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750125189; c=relaxed/simple;
	bh=NB2ggrQXZ+eo3SElQhWF9C2/ihDG9UGBQc9RNPfqabU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Q/i2Si/tvd28s+XLtHeCLEB/xSQnAkm3skteL6FfCeUcZZRFnDvn1BQu/5BG2ya1QNqw58O4S25/CKHfU4l8oFKeF+PfEP8Tcmte4b93qZo2MPovWMh6EIqplBEp88/Ix+haDHbOSJw0/ypwnUdnXL9roew9Drx84d0LI4dFmHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=oVoL4xiz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55GI2Rea024998;
	Tue, 17 Jun 2025 01:53:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2VQjLUDu6Je2JeOGoPp/4asARdo9to30yDN9lnxd0gQ=; b=oVoL4xiz5dp9ycqB
	Af7uI9sEqmej5nKz//jNPtnRaeZtfX3+EVL1KVoAbW5+pBuaRibwvytqSKQuMHJa
	HOvzEVZXaf7dPhYaRConfDwTyivU1uO9lPq1CgPaWcTZwCpf3hdrlpOCg1yxakmf
	wgt5oUBo9WUgylsTh4yT5CyRNdZttI/+yZIvVRH45YMCvIpWhVtsmc97EBafRHzj
	0cxKP0a39dSi4woE7lqMtTxF8hpB7wJQFlkY4wovkKnhM6wCsl210KERTM4w9nAA
	OwPe6HzULzg/aYKxou3A2lzv2trawQGSMq2kPz0vIo+4Dk3O4qtHHDiak++Pc5iR
	+PQ3Ow==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791fsxcc4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Jun 2025 01:53:01 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55H1r0kw019726
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Jun 2025 01:53:00 GMT
Received: from [10.216.4.100] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 16 Jun
 2025 18:52:55 -0700
Message-ID: <06688869-3867-4db1-b549-49467c54b9e7@quicinc.com>
Date: Tue, 17 Jun 2025 07:22:52 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/8] soc: qcom: geni-se: Enable QUPs on SA8255p
 Qualcomm platforms
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
References: <20250606172114.6618-1-quic_ptalari@quicinc.com>
 <20250606172114.6618-4-quic_ptalari@quicinc.com>
 <d4ce9309-4021-44e2-bc26-1bd9e7b7e8df@quicinc.com>
 <956ddebf-9db4-4875-a948-41f17afe2e8c@linaro.org>
Content-Language: en-US
From: Praveen Talari <quic_ptalari@quicinc.com>
In-Reply-To: <956ddebf-9db4-4875-a948-41f17afe2e8c@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDAxNCBTYWx0ZWRfX7LxBoiUQOYcP
 I0+UusY2UkcjvTLPyZBaRVvJ0sBEX6dYz8hsvQjfAMH8wJL2pJxVvsuG1WEyUXLU2nx1Jc6JweQ
 6nlY0VM47l2Y0Vc02tgGTrbOqXbMFNo7YRX5Zvavm58yPWYVwo+WHuRihy0rs6ut98i2aiLCNdo
 h7B8ndnrAQt7P6eiMEDlQxiK1ofjqtSI1C9dUZ6umwwdiRwskwfryVkQo4x81BQsT3/k7LEtphv
 TyqEBeWAORcc7LSc1bNoh4JC/NSAZRvKl4qW0xrw/eFjDSKmXeQqf79282VhFCZi4PIVu6q5E6b
 WrlA+sAAO61scP/CkzFdo4oQx69MwNs30CTJdWP5vRPkZD6KznkD4HHHLrTHmVplMNI/UhGzhoU
 Y/RtAa2VVD90h+L30TeuC+i0dXApubHlJRi6pnOrS6euKBR3w5dMRWi53BUPBp6A/lBAfoM7
X-Proofpoint-ORIG-GUID: p1IUbb8zO0NZHvhS3ekvhRTM6BBV4Uuc
X-Authority-Analysis: v=2.4 cv=OLIn3TaB c=1 sm=1 tr=0 ts=6850ca7e cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10
 a=eNocmHOysMloforwy0QA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: p1IUbb8zO0NZHvhS3ekvhRTM6BBV4Uuc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_12,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 mlxscore=0 bulkscore=0 adultscore=0
 suspectscore=0 phishscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506170014



On 6/17/2025 12:06 AM, Bryan O'Donoghue wrote:
> On 16/06/2025 09:40, Praveen Talari wrote:
>> Hi Bryan,
>>
>> Gentle reminder!!
>>
>> Thanks,
>> Praveen talari
>>
> Small nitpick here.
> 
> 1. You didn't include me in your v6 CC list so the ping
>     is the first direct notification of this series I've received.
>     This is no problem BTW just for your reference.
> 
> 2. Again as a general recommendation to qcom folks the commit
>     overview logs are fine but please include the name of the person
>     whose feedback you are addressing in that log.
> 
> eg
> 
> v5 -> v6
> 
> - replaced dev_err with dev_err_probe - Bryan
> 
> etc, that way a reviewer can re-up their context quicker.

Thanks you for your valuable inputs. I will ensure it is reflected in 
the next patch set onwards.

Thanks,
Praveen Talari

> 
> ---
> bod

