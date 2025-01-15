Return-Path: <linux-arm-msm+bounces-45095-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B22E0A11EE5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2025 11:06:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C8FB8167548
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2025 10:06:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE1161F9A9F;
	Wed, 15 Jan 2025 10:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="pVDVvkin"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 079552361DA;
	Wed, 15 Jan 2025 10:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736935588; cv=none; b=fnX5S14/3dp16vDQ2ig5XACjURwUl1EhLgV9HxUjoFgT30YwZW8ZmhCVyAuzNx+/Nhjz/Xx/yzAUcaY7tmx/36TG3jzKduVJEFCFp5shh7C3kCrYRgUBCrFZcy9LkNgw/V2uWoXhZsZP4glNvXArKL0cZx43xhjyKKkRJM8x23s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736935588; c=relaxed/simple;
	bh=7AS/KitQlguNxF7vSxEkrKlJTDNOIY4kAUsu1PfXNd4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ibe0tCT1fT0T4wgXZZZLjo9G9yLYiFvLoCwzhI+IHNN0F5vjKCkyzhpluacsI6VFDa6/EA/VB+kZxqQNq0U/U7N9rRzUxadhgITH4Qc9dN5fMiBJqCL7aTvn/VvT6SZYnuZIAns0760PLV+VJA4jkx0FY+wMg2tzztxcPzf0RFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=pVDVvkin; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50F9KsQe022452;
	Wed, 15 Jan 2025 10:06:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7AS/KitQlguNxF7vSxEkrKlJTDNOIY4kAUsu1PfXNd4=; b=pVDVvkin6iliRgAn
	jkp1dszuQc9WpLK1uXiqAKp8PSBl/8InmnNLSSmS8aRDe1sT+cJIpzclBe3fZprQ
	GoJtfZekr3DpJGekcsdS3xs3PIAPOtve6QkA/hEoXKNwgMYy40u0G0NtPdTvWZ1U
	Uf2n0gG22sNfTXxaLVmq0LzOjpO6ugbBY3sdpnLtWRtTH5Xmiq3wvaeXERbSpNes
	+x9rJxKgLazk/ShkVENHRJ0WcICMKtWtI0Bvycw+KXg92A9VcwC3F6PFYIxWdJJd
	6aGc9XDRZx9oZ8PqLmrroeKbQUqEy3dfDYwInHUNUhkRn9Tto252JhFxZW5bS+ZM
	BWOEFA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 446aa9g3xh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Jan 2025 10:06:22 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50FA69Bm031718
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Jan 2025 10:06:09 GMT
Received: from [10.152.201.37] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 15 Jan
 2025 02:06:04 -0800
Message-ID: <f0a261ff-e9b1-4c65-8f26-e7ffd86251c0@quicinc.com>
Date: Wed, 15 Jan 2025 15:35:52 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 7/8] arm64: dts: qcom: ipq9574: add nodes to bring up
 q6
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        "jassisinghbrar@gmail.com"
	<jassisinghbrar@gmail.com>,
        "robh@kernel.org" <robh@kernel.org>,
        "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
        "conor+dt@kernel.org"
	<conor+dt@kernel.org>,
        "andersson@kernel.org" <andersson@kernel.org>,
        "mathieu.poirier@linaro.org" <mathieu.poirier@linaro.org>,
        "konradybcio@kernel.org" <konradybcio@kernel.org>,
        "Manikanta Mylavarapu
 (QUIC)" <quic_mmanikan@quicinc.com>,
        "linux-arm-msm@vger.kernel.org"
	<linux-arm-msm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "linux-remoteproc@vger.kernel.org"
	<linux-remoteproc@vger.kernel.org>,
        "dmitry.baryshkov@linaro.org"
	<dmitry.baryshkov@linaro.org>
CC: "Vignesh Viswanathan (QUIC)" <quic_viswanat@quicinc.com>,
        "Sricharan
 Ramabadhran (QUIC)" <quic_srichara@quicinc.com>
References: <20250107101647.2087358-1-quic_gokulsri@quicinc.com>
 <20250107101647.2087358-8-quic_gokulsri@quicinc.com>
 <20abe9a9-34dc-4712-8fde-b959eb3e22c6@oss.qualcomm.com>
Content-Language: en-US
From: Gokul Sriram P <quic_gokulsri@quicinc.com>
In-Reply-To: <20abe9a9-34dc-4712-8fde-b959eb3e22c6@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 7ruNp92vKOsCPhN3u-lXEEW12-zBawvo
X-Proofpoint-ORIG-GUID: 7ruNp92vKOsCPhN3u-lXEEW12-zBawvo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-15_04,2025-01-15_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 phishscore=0 mlxscore=0 bulkscore=0 mlxlogscore=610 malwarescore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501150077


On 1/9/2025 6:42 PM, Konrad Dybcio wrote:
> On 7.01.2025 11:16 AM, Gokul Sriram Palanisamy wrote:
>> From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
>>
>> Enable nodes required for q6 remoteproc bring up.
>>
>> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
>> Signed-off-by: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
>> ---
> The comments you got on patch 6 apply here and to patch 8 too

sure Konrad. Will address.

Regards,

Gokul


