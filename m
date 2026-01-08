Return-Path: <linux-arm-msm+bounces-88077-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 56105D02448
	for <lists+linux-arm-msm@lfdr.de>; Thu, 08 Jan 2026 12:02:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 21A3E301956D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jan 2026 11:01:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E17048693D;
	Thu,  8 Jan 2026 11:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="aOdREEQz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AAB52C326F;
	Thu,  8 Jan 2026 11:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767870053; cv=none; b=N+WBc3BoxH4iBERfRwnGwXGNaX3P44jiletxhnjfXmjEHJNp6slHH7IjM6lkuWhuoMPBy0SPDWBjAqiETr4HdQp6cbdKzMccuvT4c0mKSrJRE6TPY5YBQWiOYbEIw7WkW+lINlAWUSKMxg9sLy7KvImldD02bBG5Ec+43p2/5BU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767870053; c=relaxed/simple;
	bh=IIJSs9LrbzY8RgKWqqelh5qE0iiHiVlSTPrLZYYCcP4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=l+rLG1QZl+s20/M/KD4pNg47s+jD0zm+7Wj1C1owH/nwGaYVZWg3+IOV+YM74Uyln7cRnvYxHP29zvBi9Pn71TkpKekdGldLIrC4w/qKNq0wQD9bDxCYl5jYL+1jOe6Y8xA4qtyzjCCtSq9stlLL87IQBTYbrR7jTf9xQSI8eH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=aOdREEQz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6085U9xO3890457;
	Thu, 8 Jan 2026 11:00:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jpQn1GGMJu8x4ZoFkdd7YARH1CvZwhVIgQJPhvr2nQk=; b=aOdREEQzZTSyWJn4
	r4MIE22IKikDmkwSe/ZttM7kQEjA31+3phW/ZxRnsKa7edUiVI/NoMXcK0cwWWC7
	BsDiUap9giT9jMZSNwF0G9i0CaTcSw72hbEcxiOD7FHTRZHzn4dt7yeX8O3FW1/c
	gTidRU1W3ITX0hEDc3Y7zKuOoc9Z15B73rDLpZ+ZXU18RptdbNfEm/F/fX3S/885
	cQZiIr/ixe/5Yco6WFvDPejQ0UAhCH9tnAVmzQnesCjHQhtFseM+3QuXk7n6lzjV
	lAH/kC/Ld1h1lF9MgK8NTxXSMcmXx4TKGnGYlvJVAIPSDjJBhnBOa8cKdhfWhKaO
	73j1Hg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhuy72teb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 Jan 2026 11:00:32 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 608B0Vo1028526
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 8 Jan 2026 11:00:31 GMT
Received: from [10.151.36.184] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 8 Jan
 2026 03:00:28 -0800
Message-ID: <a807d3ac-56db-2055-0732-7347647b38fa@quicinc.com>
Date: Thu, 8 Jan 2026 16:30:25 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] mmc: sdhci-msm: Add quirk to disable CQE for ICE legacy
 mode
Content-Language: en-US
To: Adrian Hunter <adrian.hunter@intel.com>, <quic_asutoshd@quicinc.com>,
        <ulf.hansson@linaro.org>, <linux-mmc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <ebiggers@kernel.org>
References: <20251224101050.3497746-1-quic_mdalam@quicinc.com>
 <f65f1647-3c95-41e0-8c6c-a25d835fcf35@intel.com>
 <0c33b361-8563-8aef-53d4-6158b358fb72@quicinc.com>
 <db79d30b-03ee-4e98-baa4-c0201f4eca8f@intel.com>
From: Md Sadre Alam <quic_mdalam@quicinc.com>
In-Reply-To: <db79d30b-03ee-4e98-baa4-c0201f4eca8f@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Gq-Al0x6YOdT0VImxdUtdoD5e4dFVoaA
X-Proofpoint-GUID: Gq-Al0x6YOdT0VImxdUtdoD5e4dFVoaA
X-Authority-Analysis: v=2.4 cv=DZEaa/tW c=1 sm=1 tr=0 ts=695f8e50 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tu0YU7S5tw2X3cI39zIA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA3NCBTYWx0ZWRfX7doshNr7tB4N
 pGVl6qEu3RHPpmlhejUaaVp4Pwio3cHZveX/2GG/dnlExyufU/XmFL20r5FrS8rrtMN+CQPLk/B
 R7ui9Sk1HwQ8hQ+hpKJYxx0WhBp4GeTUjvMq/ojZIIaekfn44PzglWyGr3+q2IafZYDchMfvGUk
 b7mnT2wFjA1Wvqb0HlIedVxpB9lvqoU6nOYPQ3unRDpNVYT2scuuM1f3zCa/zc1fumv4UOS+SPb
 iv1f+/9Dlm6FdTdxJV9/Ft4ZXJIJuPNZ34KcNZAr9LxMKYJclGHAAWQwak5zRpMkS5ZBQKt+uAI
 x2mirIZZnmM/dWRpYnbHpSvjg1U2g+fxds+pZKRQHKQXG26rPlRcTo5ooZF58A50vnqjCr103FI
 HrC1jE+tggV26mu0z7IdsXxv1IacTPD+rAvYMajuTz2wUO6GIRGsWGso+FaZi+M/grEvq8QliYd
 a3g+Fi6GhsOH/x+4Www==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_02,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0 adultscore=0
 spamscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601080074

Hi,

On 1/7/2026 7:33 PM, Adrian Hunter wrote:
> On 07/01/2026 13:55, Md Sadre Alam wrote:
>> HI,
>>
>> On 1/5/2026 8:31 PM, Adrian Hunter wrote:
>>> On 24/12/2025 12:10, Md Sadre Alam wrote:
>>>> Some hosts require Inline Crypto Engine (ICE) to operate in legacy mode
>>>> instead of Command Queue Engine (CQE) mode for platform-specific
>>>> requirements or compatibility reasons. Introduce a host-level quirk
>>>> `host_disable_cqe` to forcefully disable CQE negotiation and allow ICE
>>>> to function through the legacy request path.
>>>>
>>>> When the device tree omits the "supports-cqe" property, the driver sets
>>>> `host_disable_cqe = true` and avoids enabling MMC_CAP2_CQE during card
>>>> initialization. This ensures that even CQE-capable hardware falls back
>>>> to legacy SDHCI request handling. A minimal `cqhci_disable_ops` is
>>>> provided with `.cqe_enable = cqhci_host_disable` returning -EINVAL to
>>>> force the fallback. Other ops are left NULL for safe defaults.
>>>>
>>>> For builds without CONFIG_MMC_CRYPTO, the driver uses standard
>>>> sdhci_add_host() to avoid unnecessary CQE infrastructure initialization.
>>>>
>>>> This allows platforms to forcefully opt out of CQE usage and ensure ICE
>>>> operates reliably in legacy mode, providing stable crypto operations
>>>> without command queuing complexity.
>>>
>>> Can't the driver simply opt-out by not setting MMC_CAP2_CQE?
>> Correct. This change is intended for the case where both host and device supports CMDQ, but the host explicitly wants to disable CMDQ and want to use the Inline Crypto Engine (ICE) in legacy way.Simply clearing MMC_CAP2_CQE would bypass CMDQ, but it would also bypass ICE as well.
> 
> Did you try it?  Looks to me like removing MMC_CAP2_CQE is all that is needed since "mmc: sdhci-msm: Enable ICE for CQE-capable controllers with non-CQE cards"
I will test with MMC_CAP2_CQE removed as you indicated and share the
results.

Thanks,
Alam.

