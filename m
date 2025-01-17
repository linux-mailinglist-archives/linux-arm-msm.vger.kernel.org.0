Return-Path: <linux-arm-msm+bounces-45450-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B2228A154A5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 17:46:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E869218857BC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 16:46:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBA3C19E97F;
	Fri, 17 Jan 2025 16:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SG6Qq0J5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A9613AA2D;
	Fri, 17 Jan 2025 16:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737132382; cv=none; b=mXOUagsD9EwkuvH7KvefwvedCnsgiSER91lv/1ik9bkLkXcA64XMsCPCNT2Wrt43BUoWPvxVA8UM95KHFqrP5GwA9GUXegE6TeV87lQWTcSZBpRprOc2D1Qu4qVYpC7G50kCwgizl0GM1RIWcbot0pO9wQOaQXWFqBzCgxRHvZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737132382; c=relaxed/simple;
	bh=q5FKZ6y/kmX2vrD+IbQW2Wv+Qluimxbo9rKnDUHhtmI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=FYuAQzYzASSGIdq0Z5tODK36/ji19wB6ZDY7G0BD7mIPz0jMdXO6xTNqAk5SBPgN9vhVSUfivwDhV8q1AlwZfrw4x5J2IzFVTDzL6RwFq1+jxoGIi6RgwZ33Ele0mduh7zttan49EtnnjYSgTyozcRcdEinQN1YHniexJLPDqbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SG6Qq0J5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50HEC1i2019421;
	Fri, 17 Jan 2025 16:46:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IYleNHd6kVbwmkUVRZHEi85/2k+atbmlo8sSssb+Rk8=; b=SG6Qq0J5Eh2lpi/b
	KeW+akVwhok0tUlU7julxhWiom9gXhvZEcdNEN7or5hMEl+WSF13jldONECrqKBj
	wL8F1xHkJBtxtg7elal+htgOaUTti7JOROiznq9o5XbvRDcxkJwK19ctGNlkaFOO
	fglUW15+Ncyez4iQRQQeBugws85T+aJSh2uo9Milw1nvj85uAciP2aap3VFAV784
	mv+w+Ppc3Io0E9SFhrikUhCdHEqrvmXfd2ktJ0z1a7YSh65GunI06eDG8XavjozP
	0d0q7lVCyMVMMSQz7awnmzbtpcEQ7FLfx9iipkgBCr+Zitnr1ePwRuueNVvwkwnA
	125SDA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 447rrkgc8u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Jan 2025 16:46:14 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50HGk11Z029517
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Jan 2025 16:46:01 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 17 Jan
 2025 08:46:00 -0800
Message-ID: <17d0336c-f28b-2ec1-661f-45b670b6856f@quicinc.com>
Date: Fri, 17 Jan 2025 09:45:59 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 2/7] bus: mhi: host: Add a policy to enable image transfer
 via BHIe in PBL
Content-Language: en-US
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
CC: <quic_carlv@quicinc.com>, <quic_yabdulra@quicinc.com>,
        <quic_mattleun@quicinc.com>, <quic_thanson@quicinc.com>,
        <ogabbay@kernel.org>, <lizhi.hou@amd.com>,
        <jacek.lawrynowicz@linux.intel.com>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <mhi@lists.linux.dev>
References: <20241213213340.2551697-1-quic_jhugo@quicinc.com>
 <20241213213340.2551697-3-quic_jhugo@quicinc.com>
 <20250108054202.r4bqxduuhpcvpqm4@thinkpad>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20250108054202.r4bqxduuhpcvpqm4@thinkpad>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: h10ipOuYMdkhxtkAKEyabjnwQkeWx3RD
X-Proofpoint-GUID: h10ipOuYMdkhxtkAKEyabjnwQkeWx3RD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-17_06,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 adultscore=0
 phishscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 impostorscore=0 spamscore=0 suspectscore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501170132

On 1/7/2025 10:42 PM, Manivannan Sadhasivam wrote:
> On Fri, Dec 13, 2024 at 02:33:35PM -0700, Jeffrey Hugo wrote:
>> From: Matthew Leung <quic_mattleun@quicinc.com>
>>
>> Currently, mhi host only performs firmware transfer via BHI in PBL and
> 
> s/mhi/MHI here and below.

Done

> 
>> BHIe from SBL. To support BHIe transfer directly from PBL, a policy
>> needs to be added.
>>
>> With this policy, BHIe will be used to transfer firmware in PBL if the
>> mhi controller has bhie regs, sets seg_len, and does not set
> 
> s/bhie/BHIe

Done

> 
>> fbc_download. The intention is to transfer firmware using BHIe in PBL
>> without further BHIe transfers in SBL.
>>
>> Signed-off-by: Matthew Leung <quic_mattleun@quicinc.com>
>> Reviewed-by: Youssef Samir <quic_yabdulra@quicinc.com>
>> Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
>> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
>> ---
>>   drivers/bus/mhi/host/boot.c     | 80 +++++++++++++++++++++++++++------
>>   drivers/bus/mhi/host/init.c     |  2 +-
>>   drivers/bus/mhi/host/internal.h |  8 ++++
>>   3 files changed, 75 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/bus/mhi/host/boot.c b/drivers/bus/mhi/host/boot.c
>> index e3f3c07166ad..c9ecb6427209 100644
>> --- a/drivers/bus/mhi/host/boot.c
>> +++ b/drivers/bus/mhi/host/boot.c
>> @@ -452,12 +452,62 @@ static void mhi_firmware_copy_bhie(struct mhi_controller *mhi_cntrl,
>>   	}
>>   }
>>   
>> +static enum mhi_fw_load_type mhi_fw_load_type_get(const struct mhi_controller *mhi_cntrl)
>> +{
>> +	enum mhi_fw_load_type ret = MHI_FW_LOAD_UNKNOWN;
> 
> You can directly return the enum without a local variable.

Done

> 
>> +
>> +	if (mhi_cntrl->fbc_download) {
>> +		if (mhi_cntrl->bhie && mhi_cntrl->seg_len)
> 
> I don't think this condition can fail. If 'mhi_cntrl->bhie' is NULL,
> mhi_prepare_for_power_up() will fail. So I think MHI_FW_LOAD_UNKNOWN is not
> needed.
> 
> Also, all the validation should be performed early, not while loading fw.

You are right.  That will not fail.  I've simplified this, relying on 
the existing validation.

> 
>> +			ret = MHI_FW_LOAD_FBC;
>> +	} else {
>> +		if (mhi_cntrl->bhie && mhi_cntrl->seg_len)
>> +			ret = MHI_FW_LOAD_BHIE;
>> +		else
>> +			ret = MHI_FW_LOAD_BHI;
>> +	}
>> +	return ret;
>> +}
>> +
>> +static int mhi_send_image_bhi(struct mhi_controller *mhi_cntrl, const u8 *fw_data, size_t size)
> 
> mhi_load_image_bhi?

Done

> 
>> +{
>> +	struct image_info *image;
>> +	int ret;
>> +
>> +	ret = mhi_alloc_bhi_buffer(mhi_cntrl, &image, size);
>> +	if (ret)
>> +		return ret;
>> +
>> +	mhi_firmware_copy_bhi(mhi_cntrl, fw_data, size, image);
>> +
>> +	ret = mhi_fw_load_bhi(mhi_cntrl, &image->mhi_buf[image->entries - 1]);
>> +	mhi_free_bhi_buffer(mhi_cntrl, image);
>> +
>> +	return ret;
>> +}
>> +
>> +static int mhi_send_image_bhie(struct mhi_controller *mhi_cntrl, const u8 *fw_data, size_t size)
> 
> mhi_load_image_bhie?

Done


