Return-Path: <linux-arm-msm+bounces-91241-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OFcFJRZSfGmwLwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91241-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 07:39:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3685BB7A77
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 07:39:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8F7CD3007896
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 06:39:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A96E3314AE;
	Fri, 30 Jan 2026 06:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iABnG7+4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XvGlMXkP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9201933A014
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 06:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769755157; cv=none; b=NPQ+1Ur2exlUgjU6IgW5QiADrsFuHvdkvKRWlkRoY0jZYcuMu4bRephBJ3T+DkMfMNrvd6AbP88u/DJWqwI6IF/8T0IaHFsemJqfk6Fg0zunq3ZROK1swLlii8IMzm7e4X1xlxxfpAw9/7mCe2ADBMwG8VaMq4TJGGETGLkGGf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769755157; c=relaxed/simple;
	bh=dckEcudvc+6Ln/F9bpvm6/wUvq0fAC8GvkcwZjxGN6U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IWN+4L4wztfYzvy90ywXQL3jK0mPr0lOcfhaYo4/iVWlm/fAXW0/5ZVQw0MuILFnWwp9joiKWxzF3Cx/UyIOPFXakVX4wHkJIi5WLug5QP/cgY0yzgBNI91OEpvEPNAgc27gsXcbulJbRCmcOGbzhRyy6lcMTtC58x8e/FhNqLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iABnG7+4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XvGlMXkP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60U3Vp0R891901
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 06:39:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UWtrr1D2aYsCh0aSO/IvpSEwV2TpA15ipbrRbiCmUBg=; b=iABnG7+4IOS3F4A7
	dqkgyJ7JWN0HTj9cEZQ7dzq7Qr2ern/h/C9Yf+O9tJwvn9ZDbGE1bmRo6haHttGM
	4JQBy6Ca0I+todp6JyD3rNYm4jYkdEmHsye5PrM69qv002IwzUrBVxxQ0dcJwksj
	MCQ7pGAl3pfldM1QdmIZQREEPk/YgdhDjTCWuOo38uBV264QKNNKlsLj4s0gCHRZ
	O2yl4FpGrSkBIbHlBdN9cP6h1xCzZbj0ecRC6vDLXxRces/PP/KTPR2hVV9kNMBQ
	DKchp0jQxCRDudo3qvJUaEu71ZLF//5K1OVscy8WEEpbjFN9M4zCJjpIUzip+Jn+
	XgYZLQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0gs7s2p9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 06:39:09 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8230d6d54a5so2139335b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 22:39:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769755148; x=1770359948; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UWtrr1D2aYsCh0aSO/IvpSEwV2TpA15ipbrRbiCmUBg=;
        b=XvGlMXkPcaY1HIR39t+mjKZQ5PI1PEmMogLTniXC1IM3etARTt8FNnlewdmbDdbLc9
         wBXsBEUoavQOsuGWXzngCen4yE3wECMitVUe3vJpXR3TYxY7yXKszfzi58/R020naj/2
         TzvkjUJAs/dCmr+2SBwQvL8XwVV+zSN3tvA29Aqq2YLFKCFTFjMxC6MK5tea8VtJ12Tp
         DnWQ7u6AmEDRhHPbMYNGn+Dh43xju/rkPQZnZDRs1faaKSBmf4la2eSpa7E3kUS8ohlT
         2JJ3QgWIGB649tY1PSeUWSPp/WQ4nTEa1kuOUcIsULniybHkd/0PMEvP0rM3xXlneA9l
         7oeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769755148; x=1770359948;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UWtrr1D2aYsCh0aSO/IvpSEwV2TpA15ipbrRbiCmUBg=;
        b=rVc+CwFvKNj+2shvLZ0KwfdsGIyDd7Lxf6HAelXSkhyV96lKidyLMqRZMP7oiipvBF
         wExD2w8ISptIOuHKC0GGMUJ2/8s5CVOMnr0Uk9HJdZz9PzoXs6lwV4vNAu6/tLiemoZu
         K5JMtc1H3qQx/Yi/mNF8Jzi63p4bzATzJjrXIQSqKq1qpPur3I5f+iOz6IcM+W728Ke3
         nb7nJezX/Q6ApCIXBpczXEzz9q+md8aI6E9ZwGfRrqlJ05YA13XGimTvLbteEHkI0+iB
         G+RU4z+RO9g08ytg437FW4XNI7so8WPSR58eSs5Wt/aa+YWYA32ghDRC1e6zeaj0+wob
         8L/A==
X-Forwarded-Encrypted: i=1; AJvYcCW5/LyBWECQThwhZHgr1IF7SYVzvDzye/yiKpZpGYrM4QbbHZFrGXlA5sRYB8xHw+o+ni3BOD8FNZceRcZj@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2hmHLla4WZsXkyt1boEZJX+i6e//0limKUXM5O14spWOYFVdI
	2IwyuPYz/arO4oTunTUhewVvm2OWB2dM6Hu/HZCUSajD9uIKHJ0Txm4aHvxRSV/zTMtWK5fbkz9
	yuhVZYSp8Ii+2TIFFdf786Vz5ofwH6irIcqg6CN/w/KXQ40hW0CdY9D7B4PMbPu4Kvy5LCgX+KS
	0v
X-Gm-Gg: AZuq6aLVLlRrlsDxkItWVcTYR/Cm2LMDNMl0Mik5F2cJxDa53ZXnuuZjrQ65hk19Wiu
	EM7Gy0tbr4R67DT1O/W+ey0KOOcvZQzolANnBGEsw6EqryDU/0ND32O9/2xhEBF58XlJ/jQ7udX
	FodQAEwXqvKEzY3/hZ4ibWUVPVaEMbGKctAs21FimnuNHuOXV/AtryejFhhMbJ3k6ZUtaKPkiby
	m3M23eAJqb2/JMmvSjuEQsS+WONaqMaNTblk5+uIQLSJfCg1mVtXAK7w8DqkWcFvuw3FRmlPl4i
	2oqPv4WqxOdCQ9Mq/jsaT+CJBqg7ly2Pp/l07Yd9SVFBDv0DPmm7ni1ad/xhqze8qEPCw5BD8ae
	LeUBmyjs59li4BLTgwLEaS72NAQlm1FGf5ZxiAsyK
X-Received: by 2002:a05:6a21:339c:b0:38e:916c:b701 with SMTP id adf61e73a8af0-392cc5c8783mr6036011637.3.1769755148328;
        Thu, 29 Jan 2026 22:39:08 -0800 (PST)
X-Received: by 2002:a05:6a21:339c:b0:38e:916c:b701 with SMTP id adf61e73a8af0-392cc5c8783mr6035974637.3.1769755147761;
        Thu, 29 Jan 2026 22:39:07 -0800 (PST)
Received: from [10.217.199.117] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c642487f1f5sm7037538a12.0.2026.01.29.22.39.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jan 2026 22:39:07 -0800 (PST)
Message-ID: <6fb993f3-4479-4b37-ab57-91807eeea988@oss.qualcomm.com>
Date: Fri, 30 Jan 2026 12:09:00 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/8] thermal: Add Remote Proc cooling driver
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, rui.zhang@intel.com,
        lukasz.luba@arm.com, konradybcio@kernel.org, mani@kernel.org,
        casey.connolly@linaro.org, amit.kucheria@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        manaf.pallikunhi@oss.qualcomm.com
References: <20260127155722.2797783-1-gaurav.kohli@oss.qualcomm.com>
 <20260127155722.2797783-2-gaurav.kohli@oss.qualcomm.com>
 <20260128-quick-maroon-dragon-d832c8@quoll>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <20260128-quick-maroon-dragon-d832c8@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDA1MCBTYWx0ZWRfXz6bQXMCjfWvH
 1Gw9VtXxfqk4GfI406O+lxoE6dMmrf/+jL09JH1mO12JjYZMPJGHJBI2G4tC6HfDldaPlNUpS3z
 hRk/Dy3uIeoid5oB2agNhX3e4FvMbpEioaVxOM1c0u9P1dQJueITuzq/Hp09T1/U0N+Pgkypvv1
 VQJwi5s8ucweQ2MYxuifquO5e49dd4UM+igYsVezBMis9Pjh90pFuwgudn1ydHJT7uTdjxYioVp
 hG1aNUi7j0kPXwyie+9cHIc6FYLnWweAA50StK3piFDpJz1e6p2UHCbcKOhtxt8cLhZBF7y//J+
 7oF0uWU7cvQJz6PIQFQhFaLci7/1Na4UYkg+vkIBlR/5HS5R/RyDO3kB6htl3pJvkL+Jmbz25y2
 ICSur2xWq+kkTVEHYAjTqK53jTISCNdHEBjVTWEtJnQ1cusv35w+nOG4hop44APjdY+vB1fbCRO
 uJ9viRMvFDDM4uZqHag==
X-Proofpoint-ORIG-GUID: NB94Q90TXip8rFQstkcZ52wT0qOg5buj
X-Proofpoint-GUID: NB94Q90TXip8rFQstkcZ52wT0qOg5buj
X-Authority-Analysis: v=2.4 cv=UPLQ3Sfy c=1 sm=1 tr=0 ts=697c520d cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8
 a=C0gsozRwKHkyj9PfwZYA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_03,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 spamscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601300050
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91241-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gaurav.kohli@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3685BB7A77
X-Rspamd-Action: no action


On 1/28/2026 5:02 PM, Krzysztof Kozlowski wrote:
> On Tue, Jan 27, 2026 at 09:27:15PM +0530, Gaurav Kohli wrote:
>> Add a new generic driver for thermal cooling devices that control
> There is no driver here. You did not a single driver entry point.
>
>> remote processors (modem, DSP, etc.) through various communication
>> channels.
>>
>> This driver provides an abstraction layer between the thermal
> Please read coding style how much we like abstraction layers.
>
>> subsystem and vendor-specific remote processor communication
>> mechanisms.
>>
>> Advantage of this to avoid duplicating vendor-specific logic
>> in the thermal subsystem and make it easier for different vendors
>> to plug in their own cooling mechanisms via callbacks.
>>
>> Suggested-by: Amit Kucheria <amit.kucheria@oss.qualcomm.com>
>> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
>> ---
>>   MAINTAINERS                          |   7 ++
>>   drivers/thermal/Kconfig              |  10 ++
>>   drivers/thermal/Makefile             |   2 +
>>   drivers/thermal/remoteproc_cooling.c | 143 +++++++++++++++++++++++++++
>>   include/linux/remoteproc_cooling.h   |  52 ++++++++++
>>   5 files changed, 214 insertions(+)
>>   create mode 100644 drivers/thermal/remoteproc_cooling.c
>>   create mode 100644 include/linux/remoteproc_cooling.h
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 414f44093269..5ebc7819d2cf 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -26169,6 +26169,13 @@ F:	drivers/thermal/cpufreq_cooling.c
>>   F:	drivers/thermal/cpuidle_cooling.c
>>   F:	include/linux/cpu_cooling.h
>>   
>> +THERMAL/REMOTEPROC_COOLING
>> +M:	Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
>> +L:	linux-pm@vger.kernel.org
>> +S:	Supported
>> +F:	drivers/thermal/remoteproc_cooling.c
>> +F:	include/linux/remoteproc_cooling.h
>> +
>>   THERMAL/POWER_ALLOCATOR
> Please beginning of this file. P < R.
>

will update this ordering.


>>   M:	Lukasz Luba <lukasz.luba@arm.com>
>>   L:	linux-pm@vger.kernel.org
>> diff --git a/drivers/thermal/Kconfig b/drivers/thermal/Kconfig
>> index b10080d61860..dfc52eed64de 100644
>> --- a/drivers/thermal/Kconfig
>> +++ b/drivers/thermal/Kconfig
>> @@ -229,6 +229,16 @@ config PCIE_THERMAL
>>   
>>   	  If you want this support, you should say Y here.
>>   
>> +config REMOTEPROC_THERMAL
>> +	tristate "Remote processor cooling support"
>> +	help
>> +	  This implements a generic cooling mechanism for remote processors
>> +	  (modem, DSP, etc.) that allows vendor-specific implementations to
>> +	  register thermal cooling devices and provide callbacks for thermal
>> +	  mitigation.
>> +
>> +	  If you want this support, you should say Y here.
>> +
>>   config THERMAL_EMULATION
>>   	bool "Thermal emulation mode support"
>>   	help
>> diff --git a/drivers/thermal/Makefile b/drivers/thermal/Makefile
>> index bb21e7ea7fc6..ae747dde54fe 100644
>> --- a/drivers/thermal/Makefile
>> +++ b/drivers/thermal/Makefile
>> @@ -34,6 +34,8 @@ thermal_sys-$(CONFIG_DEVFREQ_THERMAL) += devfreq_cooling.o
>>   
>>   thermal_sys-$(CONFIG_PCIE_THERMAL) += pcie_cooling.o
>>   
>> +thermal_sys-$(CONFIG_REMOTEPROC_THERMAL) += remoteproc_cooling.o
>> +
>>   obj-$(CONFIG_K3_THERMAL)	+= k3_bandgap.o k3_j72xx_bandgap.o
>>   # platform thermal drivers
>>   obj-y				+= broadcom/
>> diff --git a/drivers/thermal/remoteproc_cooling.c b/drivers/thermal/remoteproc_cooling.c
>> new file mode 100644
>> index 000000000000..f958efa691b3
>> --- /dev/null
>> +++ b/drivers/thermal/remoteproc_cooling.c
>> @@ -0,0 +1,143 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Remote Processor Cooling Device
>> + *
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#include <linux/err.h>
>> +#include <linux/export.h>
>> +#include <linux/module.h>
>> +#include <linux/mutex.h>
>> +#include <linux/of.h>
> Where do you use it?


thanks for pointing this, this won't be used anymore.

We had originally plan to parse dt from here, and included was added for 
that earlier approach.

Will fix this.


>> +#include <linux/slab.h>
>> +#include <linux/thermal.h>
>> +
>> +#define REMOTEPROC_PREFIX		"rproc_"
>> +
>> +struct remoteproc_cooling_ops {
>> +	int (*get_max_level)(void *devdata, unsigned long *level);
>> +	int (*get_cur_level)(void *devdata, unsigned long *level);
>> +	int (*set_cur_level)(void *devdata, unsigned long level);
>> +};
>> +
>> +/**
>> + * struct remoteproc_cdev - Remote processor cooling device
>> + * @cdev: Thermal cooling device handle
>> + * @ops: Vendor-specific operation callbacks
>> + * @devdata: Private data for vendor implementation
>> + * @np: Device tree node associated with this cooling device
>> + * @lock: Mutex to protect cooling device operations
>> + */
>> +struct remoteproc_cdev {
>> +	struct thermal_cooling_device *cdev;
>> +	const struct remoteproc_cooling_ops *ops;
>> +	void *devdata;
>> +	struct mutex lock;
>> +};
>> +
>> +/* Thermal cooling device callbacks */
>> +
>> +static int remoteproc_get_max_state(struct thermal_cooling_device *cdev,
>> +				    unsigned long *state)
>> +{
>> +	struct remoteproc_cdev *rproc_cdev = cdev->devdata;
>> +	int ret;
>> +
>> +	mutex_lock(&rproc_cdev->lock);
>> +	ret = rproc_cdev->ops->get_max_level(rproc_cdev->devdata, state);
>> +	mutex_unlock(&rproc_cdev->lock);
>> +
>> +	return ret;
>> +}
>> +
>> +static int remoteproc_get_cur_state(struct thermal_cooling_device *cdev,
>> +				    unsigned long *state)
>> +{
>> +	struct remoteproc_cdev *rproc_cdev = cdev->devdata;
>> +	int ret;
>> +
>> +	mutex_lock(&rproc_cdev->lock);
>> +	ret = rproc_cdev->ops->get_cur_level(rproc_cdev->devdata, state);
>> +	mutex_unlock(&rproc_cdev->lock);
>> +
>> +	return ret;
>> +}
>> +
>> +static int remoteproc_set_cur_state(struct thermal_cooling_device *cdev,
>> +				    unsigned long state)
>> +{
>> +	struct remoteproc_cdev *rproc_cdev = cdev->devdata;
>> +	int ret;
>> +
>> +	mutex_lock(&rproc_cdev->lock);
>> +	ret = rproc_cdev->ops->set_cur_level(rproc_cdev->devdata, state);
>> +	mutex_unlock(&rproc_cdev->lock);
>> +
>> +	return ret;
>> +}
>> +
>> +static const struct thermal_cooling_device_ops remoteproc_cooling_ops = {
>> +	.get_max_state = remoteproc_get_max_state,
>> +	.get_cur_state = remoteproc_get_cur_state,
>> +	.set_cur_state = remoteproc_set_cur_state,
>> +};
>> +
>> +struct remoteproc_cdev *
>> +remoteproc_cooling_register(struct device_node *np,
>> +			    const char *name, const struct remoteproc_cooling_ops *ops,
>> +			     void *devdata)
>> +{
>> +	struct remoteproc_cdev *rproc_cdev;
>> +	struct thermal_cooling_device *cdev;
>> +	int ret;
>> +
>> +	if (!name || !ops)
>> +		return ERR_PTR(-EINVAL);
>> +
>> +	rproc_cdev = kzalloc(sizeof(*rproc_cdev), GFP_KERNEL);
>> +	if (!rproc_cdev)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	rproc_cdev->ops = ops;
>> +	rproc_cdev->devdata = devdata;
>> +	mutex_init(&rproc_cdev->lock);
>> +
>> +	char *rproc_name __free(kfree) =
>> +		kasprintf(GFP_KERNEL, REMOTEPROC_PREFIX "%s", name);
>> +	/* Register with thermal framework */
>> +	if (np)
>> +		cdev = thermal_of_cooling_device_register(np, rproc_name, rproc_cdev,
>> +							  &remoteproc_cooling_ops);
>> +	else
>> +		cdev = thermal_cooling_device_register(rproc_name, rproc_cdev,
>> +						       &remoteproc_cooling_ops);
>> +
>> +	if (IS_ERR(cdev)) {
>> +		ret = PTR_ERR(cdev);
>> +		goto free_rproc_cdev;
>> +	}
>> +
>> +	rproc_cdev->cdev = cdev;
>> +
>> +	return rproc_cdev;
>> +
>> +free_rproc_cdev:
>> +	kfree(rproc_cdev);
>> +	return ERR_PTR(ret);
>> +}
>> +EXPORT_SYMBOL_GPL(remoteproc_cooling_register);
>> +
>> +void remoteproc_cooling_unregister(struct remoteproc_cdev *rproc_cdev)
>> +{
>> +	if (!rproc_cdev)
>> +		return;
>> +
>> +	thermal_cooling_device_unregister(rproc_cdev->cdev);
>> +	mutex_destroy(&rproc_cdev->lock);
>> +	kfree(rproc_cdev);
>> +}
>> +EXPORT_SYMBOL_GPL(remoteproc_cooling_unregister);
>> +
>> +MODULE_LICENSE("GPL");
>> +MODULE_DESCRIPTION("Remote Processor Cooling Device");
> I do not see any driver here, just bunch of exported functions. I do not
> see point in this abstraction/wrapping layer.
>
> Another abstraction layer, NAK.


Thanks Krzysztof for review.

We need this abstraction layer to provide a common interface that 
multiple vendors can rely on for

their remote processor based cooling communication. If we use 
QMI-cooling driver only, then solution will

be qualcomm specific only or other's can not extend that.


>
> Best regards,
> Krzysztof
>

