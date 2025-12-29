Return-Path: <linux-arm-msm+bounces-86780-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F304CE5FC9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 06:58:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B2FAB3004BB6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 05:58:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8B7125A65B;
	Mon, 29 Dec 2025 05:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OvrRdh55"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9AC1E0DCB;
	Mon, 29 Dec 2025 05:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766987895; cv=none; b=Mgp12Yzr061SC4oXPB+9Oly8kmaPqAtQwc5mWVnVuINCdHiZHOdQoBWU1DTOhOJza4Yu/ZcdXq0UWb2oedkrw1t/MTXW54NYBurcIcpwJv4RdI39l/zxj1OJyMGomiPndrXu/go20rdw9XH9owX3LL/Gu6q2JkIK4mtdPAnQi4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766987895; c=relaxed/simple;
	bh=uL1TFW4J0VCjajm3Z2TahbvyNxlUvdhtQsCMeWTTkqI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=YEt+OHVYCChfGSBh16arnDoRxe3eoA3ieCIz/ccRPrstRxcJWR4g7AE64rrF+ZMLekjakHXB2RdksF0WJcoy56LhjoeVk3ju8Wq+7wwKc5D1deiHXWbM7MQEkCMBAZc86uSh3WNLtAZB+SUcr3HG4KiXjaKADxDCzPb83DHye4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=OvrRdh55; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BSMo1H23707398;
	Mon, 29 Dec 2025 05:58:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aWJl9ru0v6PfS0UDae+dhyfbWHHllVP007m3utlH6f0=; b=OvrRdh55byx6O1cW
	JTrYL4XWBJhQKCZZKtV4pDfaDsXJ07jTVW54wIX2kLVPPPbWs2Cv+pm7jiT4p5rg
	bkyKz3oBsCQ9XHVGIhhCeKFCO3ObW+Xlb8HzzJkeQrNRE7nbaRRlpocvqCT1Zy9A
	PuwHOKDdWhoTCN4NW/cHP/nkZ7ogzD37QqnwY0JagSCN1tzgumP4Y+6QsyWlSIem
	XZUtRBLMCJ63Rzp9aj69HesR4iSvTXWUwVPrbyyxL/qISP4eKHsXflitlzLqECHS
	cbFOEUn430zDKORokx3RdBOr59oRPiPea7/mMVtnWFUHzqAepWOPIthE5B3/5KtF
	LP88lw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba6sg3gtd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Dec 2025 05:58:05 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5BT5w4qd021213
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Dec 2025 05:58:04 GMT
Received: from [10.151.36.184] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Sun, 28 Dec
 2025 21:58:02 -0800
Message-ID: <c4eef659-a4df-4856-5d87-cb699de67fed@quicinc.com>
Date: Mon, 29 Dec 2025 11:27:48 +0530
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
To: Eric Biggers <ebiggers@kernel.org>
CC: <adrian.hunter@intel.com>, <quic_asutoshd@quicinc.com>,
        <ulf.hansson@linaro.org>, <linux-mmc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
References: <20251224101050.3497746-1-quic_mdalam@quicinc.com>
 <20251228202057.GB2431@quark>
Content-Language: en-US
From: Md Sadre Alam <quic_mdalam@quicinc.com>
In-Reply-To: <20251228202057.GB2431@quark>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: UbVpXeSvbPH-gcrPkCRanGrhasGVYFBH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDA1MiBTYWx0ZWRfXzdrUrsrWFhOI
 f0yYGnQTHvmOBfMX1DiBm95DFX+g6KDu6axT0+avBGlubfcRyyij0sxBDhM+eoB9Q2i29wvCeQ5
 MBmtMvjsZlcoybzB6WV9+FVpIc++3mwfO0Ewu8WznPUTbzpABZR3G9TsIhsGRZyK0D5qft92i30
 EXglw/KxOJGQOu9aOxKHeCe7/DNLNUJ6KRoBf+8Km6fcDLjGSRHzMHu5walYRueQ8XFWIBHuuQq
 87Iek2T6HUaah9rDW4tEG5WPXXEp2tSRD2zo3t3StLNO50aZELEir/eJmTynDGhCy2gC7MVdFsD
 ++4UgrcWcXqxpbBDwDCSamnLCWs9KJ1IlNVlaTqaDDgktcP9HpjPGT2L+WE2ppXV/j6VI4V9U50
 5MkSS9dDeYQyeFpulVDHRcbgZ03zIlYzwoHF2WNYRLdtMGalvFj+oTq301ABkkrrxU6/8TgWmEr
 ee27q36us5+8N5UOi6A==
X-Proofpoint-ORIG-GUID: UbVpXeSvbPH-gcrPkCRanGrhasGVYFBH
X-Authority-Analysis: v=2.4 cv=Y+L1cxeN c=1 sm=1 tr=0 ts=6952186d cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=KkW5yuFp_KLN4ZHH0lMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_01,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512290052

Hi,

On 12/29/2025 1:50 AM, Eric Biggers wrote:
> On Wed, Dec 24, 2025 at 03:40:50PM +0530, Md Sadre Alam wrote:
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
>>
>> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
> 
> I'm confused.  If CQE isn't supported by the hardware, surely it would
> make more sense for the driver to not advertise the host as being
> CQE-capable at all?  This patch seems to introduce an ambiguous middle
> ground, where the host is CQE-capable but not really.
The hardware supports CQE: both the SDHCI‑MSM controller and the eMMC 
device are CQE‑capable.
The issue arises because the ICE driver is tightly coupled with the CMDQ 
(CQE) driver code, creating a dependency.
If the host forcefully disables CMDQ, ICE becomes unusable under the 
current design.
This patch allows ICE to remain functional via the legacy SDHCI path 
even when CMDQ is explicitly disabled by the host.

Thanks,
Alam.




