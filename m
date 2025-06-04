Return-Path: <linux-arm-msm+bounces-60254-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D87ACE2CE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 19:11:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 08AC716E80B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 17:11:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EE781EB1AA;
	Wed,  4 Jun 2025 17:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jQAn5OhK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E9432C85;
	Wed,  4 Jun 2025 17:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749057108; cv=none; b=rmTTpw/kAOZoe7mxMdnnPCeD4BnjdX9wZxMJM06SqYZUMBawPS5dLGzNAFTAE5o+/bDNwlbKBdPalYyfQB1W7gmzWz6V7ky3WbgmkGFl5IQ9Jqz9XBf4OunOmFd7XMuvRngx4VhKn8I9OLzRVuStskscRIKYkygTDbfeD5IdF28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749057108; c=relaxed/simple;
	bh=u3RQ0MuAj7Hb7zignGUFDcyFEUbjoKeV7VD5W4yl4Ds=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=SlAfoa6gHG+STJtbX6etUGAzMjQoz1tM2xqZXietne4O8P8nzr94fRuS1wWAoFhvAfpekRuba6u4Qr/fLaFpkB+WDe586rQDBHHm8nq6JXxSD90r1wVMKGuQq3M9WGZUWkZlyuwvGH+06gosNjVfUr17siLTzF+0UvXmhvrtmwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jQAn5OhK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5549PEuC012867;
	Wed, 4 Jun 2025 17:11:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4i/ajO3EBvye/1TdHU6V/5kg4qohajAkIxEF+I0YpZo=; b=jQAn5OhKTrqEHiMd
	zW/+EUK8xtFGjFf7qflhY0x+7VcdHnGthBYYW5KBCO6a/7R3SsIQzsV4tH30BaHy
	QSEDSTVI8DH0V+AAoNbG0I2pnSJTNob802aTr6AP98cl0GRSc7gb5DCOv4udt80D
	Xogl01iHu/OXBMQGL8xoQEgOUwCCon7bh9Hpa7LNXdWt+5oQx6IXETOxmNA7jZWP
	8gRRHov3x6hZ7NEQ0xm+1qGOPQallVyGudmtQVhxhFkhX9X08W/RsI6b7cpFw4fE
	RYOupe14ApzF+GyV8YQb/fgtBvqm8MHyST8ZuxekYygYbZmtLI15tlbk0mbjXZ9c
	uHnhTw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47202wcewv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Jun 2025 17:11:40 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 554HBdfj027919
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 4 Jun 2025 17:11:39 GMT
Received: from [10.216.5.91] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 4 Jun 2025
 10:11:33 -0700
Message-ID: <8f18716f-cba2-4615-950a-63b6b73e23e9@quicinc.com>
Date: Wed, 4 Jun 2025 22:41:30 +0530
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
Content-Language: en-US
From: Praveen Talari <quic_ptalari@quicinc.com>
In-Reply-To: <47d19ad8-37ad-462f-8cb3-d39c29008709@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: iWmGidyfj-w3FQMyXgezkWXLZfUxlxSI
X-Proofpoint-GUID: iWmGidyfj-w3FQMyXgezkWXLZfUxlxSI
X-Authority-Analysis: v=2.4 cv=Y/D4sgeN c=1 sm=1 tr=0 ts=68407e4c cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10
 a=_xQr-q912Lc-BbZZ_8YA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDEzMiBTYWx0ZWRfXyXwx1MucbnsN
 OGiLiLBKmhrD1SKNCUV9IfBS4kYo9csA5FA2AcadXHwtYokIyPuBWKX/ZH/qaW1kgiTcvkZW2Kx
 iC/H9VldSVmaf9oSkbMwWCior114Ayww47nq9dROiP6KwhdrjQ3YkFzL5h9+mNdipoqMSP/Hq0g
 DjRoDJ1igVDxPU03cOuwoD8DsM8vjUuFnhKUQ4YvhrTJZhTg7tZnQFt3/6vCwb13yGCl4/Bt0/v
 ocNAleuf6KxncmZqIg/zGumoRYElX4Bq4JX8PGH74BTyILqqk4DTXsJytza+wbOHGKrt9IJMwmy
 uio9x5i8fZEVxTgU3waQaHuDPLQLHP1NbTuhQFjGf4giRi9pywgU8fLqcRx1bDK1ww0FYP1XY54
 U9tBvtZJQUHiy8wBQW2Hv2bBlXcksFa5YseSFUfft7iT4k17irNzcFSfGYKfJXTkxpPGyAgG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_03,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506040132

Hi Bryan,

On 6/3/2025 8:11 PM, Bryan O'Donoghue wrote:
> On 06/05/2025 19:02, Praveen Talari wrote:
>> -            "Couldn't find suitable clock rate for %u\n",
>> +            "Couldn't find suitable clock rate for %lu\n",
>>               baud * sampling_rate);
>> -        return;
>> +        return -EINVAL;
>>       }
>>
>> -    dev_dbg(port->se.dev, "desired_rate = %u, clk_rate = %lu, clk_div 
>> = %u\n",
>> -            baud * sampling_rate, clk_rate, clk_div);
>> +    dev_dbg(port->se.dev, "desired_rate = %lu, clk_rate = %lu, 
>> clk_div = %u\n",
>> +        baud * sampling_rate, clk_rate, clk_div);
> 
> Separate this stuff out.
> 
> Your code should match the commit log. If you want to convert %u to %lu 
> make a patch to do that, even if it seems trivial, it is better to make 
> granular submissions.

It comes under newly added API. Do we still need to make separate patch?

Thanks,
Praveen Talari
> 
> ---
> bod

