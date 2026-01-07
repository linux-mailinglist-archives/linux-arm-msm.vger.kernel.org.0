Return-Path: <linux-arm-msm+bounces-87872-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A233DCFD81F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 12:55:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1C29B3001BE4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 11:55:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA1112773C3;
	Wed,  7 Jan 2026 11:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="n/tCkPSs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A9BA1DA23;
	Wed,  7 Jan 2026 11:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767786956; cv=none; b=HqNVPHpvvMZCyfKG1UH+X8kbhe43Dr2obegcyYd4hKtdAtlujn3bGHNgsPKS317x+34MfLvsaxjGY8TaNVSf4/j3I6dtvn3D7EyntE+2WZD/FwiAQqIaD/Mwz4TyKjXezQhuuNJKXJd41SbY0YyaLkBmid/Kh1c4sh/xWjMfURo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767786956; c=relaxed/simple;
	bh=ZUlMx/j6bH/j+2Roi9ErKmb7TnceH8BH4xVGrkmbPdk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=LqIitclBGp4BAwG81urguP8CU/pul0zdzVBWKK5Wib+vAfKjF1qdJjSGHl7mrAyAazTO9Py4QoxCiJOWrth/F81fzxoIXvDOD8KDqSrpdWXTPkk+o4W0iI9CwOclf+u49YcWv/yK1ZvcklSPsxRAvBHoeVAlKt1E/IabHnv43AM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=n/tCkPSs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6076tUaD2379337;
	Wed, 7 Jan 2026 11:55:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CIq+18x+soA9frLu2kF3O8pZ4WsxJURVdjCXHQ7b7ug=; b=n/tCkPSs0/V/Liq0
	hm0Hg8DabdGu4/IYBo/KNYwAo966Y0s/SHGfeGfovzbDLK9CXr64Rw9//mSp0OBd
	NZjxaCP31tOzYfnFXAyKdfFcAS0FfPWBnh+tlubLEbPbZZ19gfPAzSK6acDiXeVr
	nwV9Z8npUiLTTIxr3b5wWYywZM4nnnhrO8nnzv7TMODsn4IpOz6HmO6sQzJ9rOFB
	C63JKd8fnlmclT2c+wyO1qoOKWhKIKpeyNQTvw2uGHF+R0BpL0uDKKogOeueE3d8
	WEofXZeX1ueJgxNYHCFh0W4RA+1X170l8HHRVQeRV/+PfuHnLjEq0SOrkIoNEo8B
	Jjv1fg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhjn4rxcq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Jan 2026 11:55:50 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 607BtncY013474
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 7 Jan 2026 11:55:49 GMT
Received: from [10.151.36.184] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 7 Jan
 2026 03:55:47 -0800
Message-ID: <0c33b361-8563-8aef-53d4-6158b358fb72@quicinc.com>
Date: Wed, 7 Jan 2026 17:25:34 +0530
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
To: Adrian Hunter <adrian.hunter@intel.com>, <quic_asutoshd@quicinc.com>,
        <ulf.hansson@linaro.org>, <linux-mmc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <ebiggers@kernel.org>
References: <20251224101050.3497746-1-quic_mdalam@quicinc.com>
 <f65f1647-3c95-41e0-8c6c-a25d835fcf35@intel.com>
Content-Language: en-US
From: Md Sadre Alam <quic_mdalam@quicinc.com>
In-Reply-To: <f65f1647-3c95-41e0-8c6c-a25d835fcf35@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=LJhrgZW9 c=1 sm=1 tr=0 ts=695e49c6 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=V-YQJDOuvsr3gOM6QpgA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA5MyBTYWx0ZWRfX+9Z3+d7Gu3c1
 OHx4wkPbIgq3wCFoSPHpv5ifut/MtBZzmry3QNxXG7JEws8kfGLVGBaE+nkg/nR2REPK0LAAc0h
 XPVHK/c6EUhXALQa2TIvBlUz2vAsz8Xf4JiwTO6FagbXZtprzTa6YRyvCp1nAfNXQIPqIdPs9dG
 yAkSBoU61OdrlF2XxarsnSqzWrgGChZRxzERcJfGSgZKGm9Idga5MjWvhzLY2upd5wULK8Zv00h
 uMIPP+LAkJTFaSRXiV1u/HvedzWtJbylzNdZ/sW212udPplGEd6S4rZC3zk011WpuLfYw349jlO
 NCUj62EN3fFgpJwCuNzf9kTi0O9S0cUl7mzZvwuhIM+lCpVppkzchHGNdajTbBnIR2e3fEFUn8R
 PSLSBV9ElSVgrFreTIWz2HCXqGepW6ZCOomfbY/Cl0/DVEpLNs2P8ba6RIAWaMMVB1udpil+Hot
 FGszwR8RkjznnJXY/2A==
X-Proofpoint-GUID: W7_VsIFlUcfAEPNYnTQIFA-qaI1eU8zj
X-Proofpoint-ORIG-GUID: W7_VsIFlUcfAEPNYnTQIFA-qaI1eU8zj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070093

HI,

On 1/5/2026 8:31 PM, Adrian Hunter wrote:
> On 24/12/2025 12:10, Md Sadre Alam wrote:
>> Some hosts require Inline Crypto Engine (ICE) to operate in legacy mode
>> instead of Command Queue Engine (CQE) mode for platform-specific
>> requirements or compatibility reasons. Introduce a host-level quirk
>> `host_disable_cqe` to forcefully disable CQE negotiation and allow ICE
>> to function through the legacy request path.
>>
>> When the device tree omits the "supports-cqe" property, the driver sets
>> `host_disable_cqe = true` and avoids enabling MMC_CAP2_CQE during card
>> initialization. This ensures that even CQE-capable hardware falls back
>> to legacy SDHCI request handling. A minimal `cqhci_disable_ops` is
>> provided with `.cqe_enable = cqhci_host_disable` returning -EINVAL to
>> force the fallback. Other ops are left NULL for safe defaults.
>>
>> For builds without CONFIG_MMC_CRYPTO, the driver uses standard
>> sdhci_add_host() to avoid unnecessary CQE infrastructure initialization.
>>
>> This allows platforms to forcefully opt out of CQE usage and ensure ICE
>> operates reliably in legacy mode, providing stable crypto operations
>> without command queuing complexity.
> 
> Can't the driver simply opt-out by not setting MMC_CAP2_CQE?
Correct. This change is intended for the case where both host and device 
supports CMDQ, but the host explicitly wants to disable CMDQ and want to 
use the Inline Crypto Engine (ICE) in legacy way.Simply clearing 
MMC_CAP2_CQE would bypass CMDQ, but it would also bypass ICE as well.

Thanks,
Alam.

