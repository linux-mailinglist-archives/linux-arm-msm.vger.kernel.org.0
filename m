Return-Path: <linux-arm-msm+bounces-81524-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CEA2C55DB0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 06:52:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1AE024E3BBF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 05:51:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8318304BDF;
	Thu, 13 Nov 2025 05:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="V1JliKXg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA5BD305053;
	Thu, 13 Nov 2025 05:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763013109; cv=none; b=MZI4ljp/7nefg+O8UJc4OykrQFO5HPGmih5+CJpD5IZoCW6gvin1HTQCmm8eGMnzY+4yddN1gr3IxXWXngzSNpb0pObe4hb4CTNzdgXboHbzL+IjjJH7u83NeEr2X0LyW87zT4cBBHYarILpzuAYbIIzJSFS53/h+eniASHgIkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763013109; c=relaxed/simple;
	bh=oG5GWqPRGqYt7LGXdvogwqrrHBwuCzPlSM2JhzzUi2w=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=tQU9dKf1xaUm5UrxAOh6czCoEMGWVCIpNDkea7eMDHzQ9UaXND03JTj6VUETw+i+0/mGxx0ILQU2GkIxzNagbpCHLUfXx+a8lwF2MmvE+o012HMzAf3gM8CPId+jJRXKbu50EGUJ0CB6s8Vt+HTEPg8Ud8WE1oKqmX/WeSRNjzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=V1JliKXg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AD11SjJ2918923;
	Thu, 13 Nov 2025 05:51:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4P66KwSo6fpnnz3i2XtUdLqB3yxuIcOjbZT+apX7ha4=; b=V1JliKXgzhGBnBQH
	j/J2r5GeYbL7gjAGnhbnEKXSbGf09NwmHiEYn6j80lQv0yi4w37OMalVrylFB1TJ
	+i9trRaXP/G4+5aBDxIBw28zGCGF4M0fPL0mxv6drOTvTJnX3LSSuumnOxl1VDqH
	ur1wsVjKZVsipR9LRKtWxGkdDlGqlS+V1HLCDdVgjkJS8LDbB1o+X4+Q8EX61T0k
	2+IddSksmkSSOurqBv6Czu3xhiuqcFh2Sl8XvTKPVNEWPUNSHIvu96ZNTQwClJr7
	vfWgDH/r6zmQxwRT6sqLa668GkGMPL3Ld678qhedIgjD/YqSTfau+ci654Qr97E2
	VvSlMA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acqdgkj8a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Nov 2025 05:51:43 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5AD5pgEL008135
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Nov 2025 05:51:42 GMT
Received: from [10.151.36.184] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Wed, 12 Nov
 2025 21:51:39 -0800
Message-ID: <272f7c21-16d0-25db-4d09-51a987945c3e@quicinc.com>
Date: Thu, 13 Nov 2025 11:21:24 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v4] mmc: sdhci-msm: Enable ICE support for non-cmdq eMMC
 devices
To: Ulf Hansson <ulf.hansson@linaro.org>, Eric Biggers <ebiggers@google.com>,
        Abel Vesa <abel.vesa@linaro.org>
CC: <adrian.hunter@intel.com>, <linux-mmc@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_varada@quicinc.com>
References: <20251111104604.2494305-1-quic_mdalam@quicinc.com>
 <CAPDyKFomGKtznQ4wD8O83b6uAKfNkKhERjoivrbmSqtQODDDDA@mail.gmail.com>
Content-Language: en-US
From: Md Sadre Alam <quic_mdalam@quicinc.com>
In-Reply-To: <CAPDyKFomGKtznQ4wD8O83b6uAKfNkKhERjoivrbmSqtQODDDDA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=dtrWylg4 c=1 sm=1 tr=0 ts=691571ef cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=QyXUC8HyAAAA:8
 a=R0DNL_tlP23u0T8KSwUA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
 a=cPQSjfK2_nFv0Q5t_7PE:22 a=HhbK4dLum7pmb74im6QT:22 a=pHzHmUro8NiASowvMSCR:22
 a=Ew2E2A-JSTLzCXPT_086:22
X-Proofpoint-GUID: 1H9Ib84ATuz3yhJeuZ6JfWsOWhAHcvFz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDAzOCBTYWx0ZWRfX23SzOWWTVWjH
 4TYRHLXVQ/RbfNyZHvfOM14Ik/Zus+gRw0qWqvVfbl44kYWlNTSEBPIAGNrfayxCxrDDOlwYcK2
 1o9/XP4UEcwOVP/zvYuop6IlI/VQgWP7RIiUH57niDRPR0/dPtQ7uRrEPISq3/4QvSLdRgvBha3
 8jPZI1aueNkwKsNzwT1m8m/W3JpvZYOjvD+CsSlTkbPqBxeTHtG6oyrBiWpb07LqnvHsVulbCMR
 gcIlk1kLu+JBpXfrv37eDWe8dBH/Of5vvMX9fuS4JKqEo//Dnlp5TPyDVnuGvzC45B60+sNTqar
 YtDhwHXzP6j8jRC7lbDy/v3m1V10LksFNlBhv0KQ7Jq0fAohB0gyyZdoUs6RR3aaLA31CAsnWTJ
 jQWgvKyKV1iTsQqxpHgWGaNG/LFDiw==
X-Proofpoint-ORIG-GUID: 1H9Ib84ATuz3yhJeuZ6JfWsOWhAHcvFz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_06,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 clxscore=1011 adultscore=0
 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130038

Hi,

On 11/11/2025 11:02 PM, Ulf Hansson wrote:
> + Eric, Abel
> 
> On Tue, 11 Nov 2025 at 11:46, Md Sadre Alam <quic_mdalam@quicinc.com> wrote:
>>
>> Enable Inline Crypto Engine (ICE) support for eMMC devices that operate
>> without Command Queue Engine (CQE).This allows hardware-accelerated
>> encryption and decryption for standard (non-CMDQ) requests.
>>
>> This patch:
>> - Adds ICE register definitions for non-CMDQ crypto configuration
>> - Implements a per-request crypto setup via sdhci_msm_ice_cfg()
>> - Hooks into the request path via mmc_host_ops.request
>>
>> With this, non-CMDQ eMMC devices can benefit from inline encryption,
>> improving performance for encrypted I/O while maintaining compatibility
>> with existing CQE crypto support.
>>
>> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
>> Acked-by: Adrian Hunter <adrian.hunter@intel.com>
> 
> Please add Eric/Abel for any future submission of the patch as it's
> for ICE. I don't feel completely confident to apply this without some
> of their acks.
Thank you for the guidance. I completely understand your concern and 
will make sure to include Eric and Abel in any future submissions 
related to ICE.

Thanks,
Alam.

