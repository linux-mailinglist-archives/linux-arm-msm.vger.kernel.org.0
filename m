Return-Path: <linux-arm-msm+bounces-7067-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 67ACC82B510
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jan 2024 20:08:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F27E91F25315
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jan 2024 19:08:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B70254BE6;
	Thu, 11 Jan 2024 19:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CUtYlyJ0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B064A537E9;
	Thu, 11 Jan 2024 19:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40BHvkVI004541;
	Thu, 11 Jan 2024 19:08:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=+ko6Z3IfMgwJaq0xPkO7dtlhamKrUQhyA/8VsNYV5Yg=; b=CU
	tYlyJ0ib3sEiPTQrepTqSilnW3XPPPzg6j6Wyjw9zrz2H/Zwy9Asf2MoxGJJvXXr
	rL5ycSSLhqD8rXTfoB2/V6wzbCUIkejnDBxZarGDqQJoYvzqoviVdP498qSGjPkQ
	iGM/et+BWd7Z8TYwtCGovMpfVYE45XDj7c2ynDRePLY7XlwvJeZv/3iK/DhCyp4m
	riEYEVfIOYUzazkYL4+qnIOMUqckAfNETl/Ct4P1FDn79DS7V0BR1RT5qKJwFNZ7
	jeAn1r3V3a9wouzF0HMDGF/PumK3fYwqIzX30wqSkk8H5uFXvlHnyVe4XkPEv/Ku
	nYoYi7xbJ3sfp3q55Uuw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vja9y1t0u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Jan 2024 19:08:22 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40BJ8MsR014332
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Jan 2024 19:08:22 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 11 Jan
 2024 11:08:21 -0800
Message-ID: <a10439f1-0fcd-834c-12a3-677976529cf1@quicinc.com>
Date: Thu, 11 Jan 2024 12:08:20 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] bus: mhi: host: Add sysfs entry to force device to enter
 EDL
Content-Language: en-US
To: Qiang Yu <quic_qianyu@quicinc.com>,
        Manivannan Sadhasivam
	<mani@kernel.org>
CC: <mhi@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_cang@quicinc.com>,
        <quic_mrana@quicinc.com>, Bhaumik Bhatt <quic_bbhatt@quicinc.com>
References: <1703490474-84730-1-git-send-email-quic_qianyu@quicinc.com>
 <cff4b828-9566-a2bd-287a-138d74a76a59@quicinc.com>
 <20240102165229.GC4917@thinkpad>
 <90c0a654-a02f-46e2-96a9-34f6a30c95a0@quicinc.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <90c0a654-a02f-46e2-96a9-34f6a30c95a0@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ihtljMnwvO57whwvuDAe6RxeTylJRRfM
X-Proofpoint-GUID: ihtljMnwvO57whwvuDAe6RxeTylJRRfM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 spamscore=0 mlxlogscore=999 adultscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401110149

On 1/9/2024 2:20 AM, Qiang Yu wrote:
> 
> On 1/3/2024 12:52 AM, Manivannan Sadhasivam wrote:
>> On Tue, Jan 02, 2024 at 08:31:15AM -0700, Jeffrey Hugo wrote:
>>> On 12/25/2023 12:47 AM, Qiang Yu wrote:
>>>> From: Bhaumik Bhatt <quic_bbhatt@quicinc.com>
>>>>
>>>> Forcing the device (eg. SDX75) to enter Emergency Download Mode 
>>>> involves
>>>> writing the 0xEDEDEDED cookie to the channel 91 doorbell register and
>>>> forcing an SOC reset afterwards. Allow users of the MHI bus to 
>>>> exercise the
>>>> sequence using a sysfs entry.
>>> I don't see this documented in the spec anywhere.  Is this standard 
>>> behavior
>>> for all MHI devices?
>>>
>>> What about devices that don't support EDL mode?
>>>
>>> How should the host avoid using this special cookie when EDL mode is not
>>> desired?
>>>
>> All points raised by Jeff are valid. I had discussions with Hemant and 
>> Bhaumik
>> previously on allowing the devices to enter EDL mode in a generic 
>> manner and we
>> didn't conclude on one final approach.
>>
>> Whatever way we come up with, it should be properly described in the 
>> MHI spec
>> and _should_ be backwards compatible.
> 
> Hi Mani, Jeff. The method of entering EDL mode is documented in MHI spec 
> v1.2, Chapter 13.2.
> 
> Could you please check once?

I do see it listed there.  However that was a FR for SDX55, so devices 
prior to that would not support this.  AIC100 predates this change and 
would not support the functionality.  I verified the AIC100 
implementation is not aware of this cookie.

Also, that functionality depends on channel 91 being reserved per the 
table 9-2, however that table only applies to modem class devices as it 
is under chapter 9 "Modem protocols over PCIe".  Looking at the ath11k 
and ath12k implementations in upstream, it looks like they partially 
comply.  Other devices have different MHI channel definitions.

Chapter 9 doesn't appear to be in older versions of the spec that I 
have, so it is unclear if this functionality is backwards compatible 
(was channel 91 used for another purpose in pre-SDX55 modems).

I'm not convinced this belongs in the MHI core.  At a minimum, the MHI 
controller(s) for the applicable devices needs to opt-in to this.

-Jeff

