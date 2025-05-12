Return-Path: <linux-arm-msm+bounces-57575-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA29AB2E52
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 May 2025 06:16:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E1CAF7A715D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 May 2025 04:15:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B196A1DD543;
	Mon, 12 May 2025 04:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HFvYA+Tp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6BD22576;
	Mon, 12 May 2025 04:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747023389; cv=none; b=ULF1oi5Dq1rEQ1DB/NAbdjGfbyZ1M8jy6zMVpwpJT+NiGf3mzIgdaDBnkWUdc9mSoovLIi3LAH/xSC2rcXSU0ncMql25QHDigTXTSzI8/fYC73qpVNbvmW8Yd0UYLCLFJyGz12Em5giZSR0hpgUYBo93eF36SKo5tpQr6VcfHGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747023389; c=relaxed/simple;
	bh=CSx5GjW8qiIQ6AI5LGKRHO8jBbY0J44kUonuoOj6vpo=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=gO6KpE4g/PRU72I1Kh2WW6J8YGx6MbTn+KgeZuEl5W9Ih/C04XiTxjbRUEO3W3rkRaO3na9BQGJLX0hbLLavpjonM7FYovbiR4hG2A4HBJYM6dwUvEqKQ3KoAaqfgpX4tK8cvJLeyb9Peg0l9huUV4sa/RAvo9bh3LUJqm365X8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HFvYA+Tp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54BMHLg7022069;
	Mon, 12 May 2025 04:15:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w0qXQLLr+NzmGUNVJlRa+YPm19SxX0X9UG+bF3cx/Fk=; b=HFvYA+TpDHtheibJ
	JuyDFfCHUFnxmLbHsvuUNL1X3q/hbDlhh3RD8Ca3c2EwwEK8YJh11OjiiRAqw5VS
	IXvsi6WXtFgIVXwysHN9ksBZCBiaNAec9s+8Wz/KpXHK6oIDYWwZwW3Yg2zI2vq7
	iuefm4XW4Q6GzfqSge968xf3WZUZu8YT4IfIYuVIFpTY6KW88It9w4JGO2NXOgVo
	0hqoydngIRb6Gww1LKyAS2WpuVWh5jnIbCQ7OjkjfbgAssHgVRiEC2qFnG+gkKGp
	4ws7EvwDBy8n3VClPkK5CmwQI5GIc8b7XWyxGQXKWA2dF5FQztUB2LHZzYsoOucg
	TUWIZg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46hy68k0mq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 May 2025 04:15:58 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54C4FvPr008184
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 May 2025 04:15:57 GMT
Received: from [10.216.41.215] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 11 May
 2025 21:15:52 -0700
Message-ID: <8ebe4439-eab8-456a-ac91-b53956eab633@quicinc.com>
Date: Mon, 12 May 2025 09:45:49 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 1/3] scsi: ufs: dt-bindings: Document UFS Disable LPM
 property
From: Nitin Rawat <quic_nitirawa@quicinc.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, <alim.akhtar@samsung.com>,
        <avri.altman@wdc.com>, <bvanassche@acm.org>, <krzk+dt@kernel.org>,
        <robh@kernel.org>, <mani@kernel.org>, <conor+dt@kernel.org>,
        <James.Bottomley@HansenPartnership.com>, <martin.petersen@oracle.com>,
        <beanhuo@micron.com>, <peter.wang@mediatek.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
References: <20250506163705.31518-1-quic_nitirawa@quicinc.com>
 <20250506163705.31518-2-quic_nitirawa@quicinc.com>
 <667e43a7-a33c-491b-83ca-fe06a2a5d9c3@kernel.org>
 <9974cf1d-6929-4c7f-8472-fd19c7a40b12@quicinc.com>
Content-Language: en-US
In-Reply-To: <9974cf1d-6929-4c7f-8472-fd19c7a40b12@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEyMDA0MSBTYWx0ZWRfX5lpTx1qfLZEX
 9efWac04HZiyJAoUuKIOzYP384IVU5nmZuSzPcBH2pwkraycLo88cFGaxE4ky6NR3fZjaSY3jQw
 Efm5qcrftdQRQCnNAFarbykz0VcSDo95YDBoasfbQYt3+8Wof5UksEMQ+i66rOxy9/lU5YUDPsS
 htF8jJkvxPKiY1i5ZAf2jTpFPryfPei1J9/04nymmaY4intaEKLvtltsooZV9FCt/1aQb5aV5bW
 rMoRSq+cdrwgNKDgXUJ8wTPGzuDpWhxdgRrkwF90CS1/nEmg4RPDVy8EROXdTpHGikWPVEJEyTW
 TWpUDess3zEg6YeM5vxzAi3rZNl6fOsGkNDXWxqoo52uXZ88WVsbwtgqJeh03eXGf3dNhHSRFaH
 lkegvitShDfra9dVayq+4E5p6j2QDUM6oLChtlvC6x6mi/XUCbWWvmPvKsKD4s69qWsnv+1A
X-Proofpoint-GUID: 12Wti5JdCVsqytwACHxoaLvWRHLh0rZ1
X-Proofpoint-ORIG-GUID: 12Wti5JdCVsqytwACHxoaLvWRHLh0rZ1
X-Authority-Analysis: v=2.4 cv=c5irQQ9l c=1 sm=1 tr=0 ts=682175fe cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10
 a=paxrxDOAfeD8ejVehjsA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_01,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0
 impostorscore=0 mlxlogscore=999 mlxscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505120041



On 5/7/2025 8:34 PM, Nitin Rawat wrote:
> 
> 
> On 5/6/2025 11:46 PM, Krzysztof Kozlowski wrote:
>> On 06/05/2025 18:37, Nitin Rawat wrote:
>>> Disable UFS low power mode on emulation FPGA platforms or other 
>>> platforms
>>
>> Why wouldn't you like to test LPM also on FPGA designs? I do not see
>> here correlation.
> 
> Hi Krzysztof,
> 
> Since the FPGA platform doesn't support UFS Low Power Modes (such as the 
> AutoHibern8 feature specified in the UFS specification), I have included 
> this information in the hardware description (i.e dts).


Hi Krzysztof,

Could you please share your thoughts on my above comment? If you still 
see concerns, I may need to consider other options like modparam.

Regards,
Nitin

> 
> Thanks,
> Nitin
> 
>>
>>> where it is either unsupported or power efficiency is not a critical
>>> requirement.
>>
>> That's a policy, not hardware, thus not suitable for DT.
>>
>> Best regards,
>> Krzysztof
> 
> 


