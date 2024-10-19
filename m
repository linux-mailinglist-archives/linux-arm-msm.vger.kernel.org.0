Return-Path: <linux-arm-msm+bounces-35066-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F2FFB9A4B35
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Oct 2024 06:55:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A126C1F22E52
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Oct 2024 04:55:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5A991CF2AB;
	Sat, 19 Oct 2024 04:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ir2+Ne7S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F1C9193091;
	Sat, 19 Oct 2024 04:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729313723; cv=none; b=ScoIa4vvUoXWeMxuFJa7qPChCnTHjem8p209yaYx/B1O4JKATde/DlrqkLZHsZGJNzhjn9Fujhuu446c/louNARJWbZyT1JKIn59/SNbqSNBVW73KbR4XPOmpMzULdVhhC1p6TlvOnEIFv8Xg2IlE8oqC8TmrBkDtQuYq2P6kLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729313723; c=relaxed/simple;
	bh=RDMR0lJtyBq9BCxNPH6hzVIueELKzEY5stDYPEXKhnY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=pzV7pqkZ0grKkbHgFJy2dpNONYq6btTnLifCZqZzEUXVnCCSGbhrHf9B50y0wNYOfEuZIFfGLDU/4r3IPB6kmgwcrLOFpInAmOSl6UQfnaRNu8qyjapt7UQCnNiAGTptr/aYMAHEWXwZi1BglCUkCGiqtU0eEzNOcf2bOKREj5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ir2+Ne7S; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49J4etnu010139;
	Sat, 19 Oct 2024 04:55:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lW8M9/25VIAT9fH9MllFB+d2AV+SuXHF6lcua4GWprw=; b=ir2+Ne7SX+Vq357o
	K6Kbym/No0KYdk3GKBWuPMSRaq3XokAdcZJPC5E1jkTFYXHpXQw0vi/TmtlmFOzc
	1wziPV+2phdsQ+oEcMKrVz9v9vaCY9yteVDP6f09Ic/4fP+sEDQ7ucJ0Yg+70fYm
	tZY4QCGr3yqrI1HXfK3A+FI7WRZOqchJ+QEbSDmDhvR4SHD9TkSVcqg/KVuZMfKg
	ytZgL8JQsycQFLA/KG6JTzbjJVqdWP6Pev+WYfBKHyZKkdeJ5d1eFJt6+QpYe/5C
	YNOfWA03wAXSJ8iO7n8dqrcVofIvNmKZkRLVZuvcyYCWzNVW42hySctWaGDcG+aF
	FCKrpg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42c5hf01ct-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 19 Oct 2024 04:55:17 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49J4tGFA010751
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 19 Oct 2024 04:55:16 GMT
Received: from [10.216.13.72] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 18 Oct
 2024 21:55:13 -0700
Message-ID: <e63f8862-5e1b-45c4-9815-95deb70f72b4@quicinc.com>
Date: Sat, 19 Oct 2024 10:25:02 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v3 1/2] mmc: core: Add vendor hook to control
 reprogram keys to Crypto Engine
To: Ulf Hansson <ulf.hansson@linaro.org>
CC: Adrian Hunter <adrian.hunter@intel.com>, <linux-mmc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <quic_rampraka@quicinc.com>, <quic_nitirawa@quicinc.com>,
        <quic_sachgupt@quicinc.com>, <quic_bhaskarv@quicinc.com>,
        <quic_neersoni@quicinc.com>, <quic_gaurkash@quicinc.com>
References: <20241006135530.17363-1-quic_spuppala@quicinc.com>
 <20241006135530.17363-2-quic_spuppala@quicinc.com>
 <CAPDyKFpXh0vZrK6PU2V+y92Q_+y6Q2+VUEONXiBrqAp_qqp_jA@mail.gmail.com>
Content-Language: en-US
From: Seshu Madhavi Puppala <quic_spuppala@quicinc.com>
In-Reply-To: <CAPDyKFpXh0vZrK6PU2V+y92Q_+y6Q2+VUEONXiBrqAp_qqp_jA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: dm0ca1HSC-q54R_lW9z1CI9ytrVWmJgw
X-Proofpoint-GUID: dm0ca1HSC-q54R_lW9z1CI9ytrVWmJgw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 clxscore=1011 impostorscore=0 bulkscore=0 mlxlogscore=999
 priorityscore=1501 mlxscore=0 suspectscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410190032



On 10/8/2024 7:30 PM, Ulf Hansson wrote:
> On Sun, 6 Oct 2024 at 15:55, Seshu Madhavi Puppala
> <quic_spuppala@quicinc.com> wrote:
>>
>> Add mmc_host_ops hook avoid_reprogram_allkeys to control
>> reprogramming keys to Inline Crypto Engine by vendor as some
>> vendors might not require this feature.
>>
>> Signed-off-by: Seshu Madhavi Puppala <quic_spuppala@quicinc.com>
>> Co-developed-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
>> Signed-off-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
>> ---
>>   drivers/mmc/core/crypto.c | 8 +++++---
>>   drivers/mmc/host/sdhci.c  | 6 ++++++
>>   include/linux/mmc/host.h  | 7 +++++++
>>   3 files changed, 18 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/mmc/core/crypto.c b/drivers/mmc/core/crypto.c
>> index fec4fbf16a5b..4168f7d135ff 100644
>> --- a/drivers/mmc/core/crypto.c
>> +++ b/drivers/mmc/core/crypto.c
>> @@ -14,9 +14,11 @@
>>
>>   void mmc_crypto_set_initial_state(struct mmc_host *host)
>>   {
>> -       /* Reset might clear all keys, so reprogram all the keys. */
>> -       if (host->caps2 & MMC_CAP2_CRYPTO)
>> -               blk_crypto_reprogram_all_keys(&host->crypto_profile);
>> +       if (host->ops->avoid_reprogram_allkeys && !host->ops->avoid_reprogram_allkeys()) {
>> +               /* Reset might clear all keys, so reprogram all the keys. */
>> +               if (host->caps2 & MMC_CAP2_CRYPTO)
>> +                       blk_crypto_reprogram_all_keys(&host->crypto_profile);
> 
> Don't you even need to call this once, during the first initialization
> of the card?

The first card initialization is done during the boot up for qcom socs 
and the kernel keyring contains no keys immediately after bootup.After 
the initialization of the card, the block i/o operations to encrypted 
folders will automatically trigger the corresponding program key calls 
to the crypto engine since the kernel keyring does not contain the 
required encryption key. So, it is not necessary to explicitly reprogram 
all keys for qcom socs.
> 
>> +       }
>>   }
>>
> 
> [...]
> 
> Kind regards
> Uffe

