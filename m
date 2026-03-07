Return-Path: <linux-arm-msm+bounces-95955-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KM6XK58MrGnUjQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95955-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 07 Mar 2026 12:31:43 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B9F22B6C7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 07 Mar 2026 12:31:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 46E0C3003621
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Mar 2026 11:31:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 938D729B233;
	Sat,  7 Mar 2026 11:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="laH8BhUz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NFrMfOMw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F501339A4
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Mar 2026 11:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772883094; cv=none; b=rqlfYWorRErXZEhLUmCfTahIihxPlZRGNabnJ38+pwI/vqaGsZ5s7yoOYGt7+VxO0zgt4FS+kGfxbjCc8BQPmy2kTD0baX4fMfA3QdnZEq3FWZLxQLnJGq8kF6Jj2lAhfe0Z0O0TN02MSw1gAFo9b21+qASJDfg7fcDck4S5I1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772883094; c=relaxed/simple;
	bh=ngPvObfydwcnIrL+pxURGOLrmqXxnGFGmqfh8svoxVg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mhFdY4M1nVFhxaIgW7MBvvQUef41K1cpox3vVG4zaOAn1xllGOURhrt2nCBMDwWHDG9Tskjiy789l7QpMJpZqtVbTlfrF8KcT0jReLKvtJli7IjwY0Hg28ge/6XcxHEpOIPpDSXT/tan5OzIc0yGHwHNDtpXgANlko8o+z2q+g8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=laH8BhUz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NFrMfOMw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6276qqgc3098381
	for <linux-arm-msm@vger.kernel.org>; Sat, 7 Mar 2026 11:31:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bPMKZAFCwnAhy/5sPxmB0+k3Yj6RwbTx5MsJpU3YgEg=; b=laH8BhUzY/xJQbXX
	Tgp6KP8ULlYClbIj42DcFP6Epk55uljRmoL4Vpmf9nix73rCgJEsRkGC1u9/GM/7
	5LMWVb278lIOaGs5+KWG3zzp4d4g+xfgFdypTtNxXpvfmhHkv25Qi18gKaI8z/BN
	B1eGcWk5Qs9ijVyXeO651CQOYIdtNTFpH7dhfaiW8zCZjUIBuBAzuY6UR36tTd2z
	a8PXEjLTC3xo91nfTgQdPe44HYvrJDeCiGY0Pzratz4lQUobvqedA18JPcPON/ZI
	p/shdYGgbTktReEx2u4bz/OxwfM+ofOjqDH5sAzpVhMXs1VgH66wSzMO1r/y4zFv
	fW9dQw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crayrgty8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 07 Mar 2026 11:31:32 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ae3badc00dso80987665ad.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Mar 2026 03:31:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772883091; x=1773487891; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bPMKZAFCwnAhy/5sPxmB0+k3Yj6RwbTx5MsJpU3YgEg=;
        b=NFrMfOMwKjS6WySeu0XinNgCZ2PEoo+0cTzsDB9jiQcYJmFIiBFkwCK6mCCIYqUK9+
         FWp8FJigZjsWuZ4Y5jT5fBRAX5OGsIwoU3ZPx4sCniexjtWxK3KJL5RIr0KktoY3W+Qm
         fyI38gWUZJgQbtHY2lj7liM0yv0+lm2G+M589Yikpw1DuZW0IGeCgdmL1g9X1cM/fTPa
         mpwIHkNco3blYOPwVU1y6igtD3pGQKW4J6VSglhStfEUm0yEXvfdohZCKZ9LG2o//QqS
         Qt9HLfY1L/3No+CCw1bYG4f/jw4m0UO7KQZQnVUzGUTuzB7cMdhEw87ZxDX6ase0t4cN
         lChQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772883091; x=1773487891;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bPMKZAFCwnAhy/5sPxmB0+k3Yj6RwbTx5MsJpU3YgEg=;
        b=mzo3N3Xo8FsNeEJ6pUrV3pVC1HBpuAquf4NeBf7kXEEi0vSmBaskcb1va3f5nIWlVX
         xyLQLOzyQL9J6l2hBYix9kwcIfnJpkj+adbC6/i5UB4AmtmHfKKjsqVD1fscPaXCPPxe
         ginYiCKbR36V/m+bG+32qY4L157TWZoLUbewlsgoX4FINV5UuYzdmhzlQpPr3PHHKElx
         E4YS+XY4QaCAb3yvT7kdB8E6mXuplEulFwoQYUEGPGArZuACzV+ZC19YZ/qx4er6VQ6w
         swfCMyRJojQK246Iu4UgU9gpzfDv6Q5MHe/L11PXQtkyPvLb2WEBc/iIZKQSLmjFI8zP
         5a3A==
X-Forwarded-Encrypted: i=1; AJvYcCUEPKYsc8UPWdKtj1rcMdRRaGIMOzFIvCgZtWP0+eT64h1HBmtCXPsEVii0H2W/r5Fz+OSDWsM/8UsjrEcU@vger.kernel.org
X-Gm-Message-State: AOJu0YyfHiPvnqS2sa7Ro+R+2Re31Pt1uLAUmKVj+ffVBv8zm1lRaeSc
	mpf1e4qU3ztp+c6DkwXh6CiZh7GfDnu/rWYcJTZpt+fmAx74o2Wv/mDsvLNMNI2+fZ7dtYZ/ebV
	9a/4RFckyX4w6F3EHXtXdrr0/ViFLTH0gW6SuP7FzFCJ8V6fAP7Y2M1RAbgPu1XzzThsvKnv1m8
	/R
X-Gm-Gg: ATEYQzzHNR+hU3k2O44AS7nvd81blEMDaQTLpnNA2olbTymnMJpHn0kO2x1KGObSri0
	y0CQ1j9Ae+mh+ix64lPdyK6YwI523WdbdXFMZs4hJjto0hFrei1gc/iGkf317w4o4wdd9p0JfIw
	WIbpN0uYL1q8ga36IY9kg+ZtoId3pGbUN2vKLD7X4C67+xnTqztO8LBaWspi5SuLP6ZefVicWwR
	uLwr4r+QKe6pMmHBFRDewKqMRYS4JvIAn6hGkCRX/C0Lp/2GsH3gWcAWkGKRsVujD8MB2ea2HI9
	EcILdDPLfE8v8QBgvSw0TuRVbURnHGd0juHI7Z9hICego5LsvxYA57I+XgdAMmrs32t/azGLi2C
	vHup0sGzSCezyyNFYHkhIGNL4BBNscrm2yySuQfggbiZJAeRZ0unA+d0=
X-Received: by 2002:a17:903:3c6b:b0:2ae:3bf0:c086 with SMTP id d9443c01a7336-2ae8247f3d5mr59725135ad.44.1772883091530;
        Sat, 07 Mar 2026 03:31:31 -0800 (PST)
X-Received: by 2002:a17:903:3c6b:b0:2ae:3bf0:c086 with SMTP id d9443c01a7336-2ae8247f3d5mr59724815ad.44.1772883091019;
        Sat, 07 Mar 2026 03:31:31 -0800 (PST)
Received: from [192.168.0.215] ([49.205.244.213])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83f77350sm55162475ad.51.2026.03.07.03.31.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Mar 2026 03:31:30 -0800 (PST)
Message-ID: <ab548ca1-c758-4096-b6aa-bce886fd904f@oss.qualcomm.com>
Date: Sat, 7 Mar 2026 17:01:27 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 04/12] drivers: accel: Register Qualcomm AIC specific
 image tables with Sahara.
To: Bjorn Andersson <andersson@kernel.org>
Cc: jeff.hugo@oss.qualcomm.com, bjorn.andersson@oss.qualcomm.com,
        konradybcio@kernel.org, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org
References: <20250825101926.2160554-1-kishore.batta@oss.qualcomm.com>
 <20250825101926.2160554-5-kishore.batta@oss.qualcomm.com>
 <mftf4oqwa2mslfghmkohkrgyx2ka2cowfjmfnly35pdly337ny@3o4xk75ppmax>
Content-Language: en-US
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
In-Reply-To: <mftf4oqwa2mslfghmkohkrgyx2ka2cowfjmfnly35pdly337ny@3o4xk75ppmax>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=U5qfzOru c=1 sm=1 tr=0 ts=69ac0c94 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=KtsNJ/6bKgz7QsArn2OSsQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=jncRdyhB-QCM7_70OxYA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: S_2HHxazPWswFz3fvYobIqaLchI2M8IX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA3MDEwNiBTYWx0ZWRfX5qSnm2zs5Di+
 30XVI/7Ij2IYwXPYpF5ETPKJwhS6zovF/MA1LUOc7ySefmU7e4QWrXM+K4aPRCcOYSCYvWminDv
 W5eVQaifFf9aii0qX5HvfEAZG3mZmvPODJgcjG7AF3vElKcTyuvaEAII0tNBaeZFXPsSW14ntgP
 A+f16yqrnjsHsw4dYcVPWCAxGr4D9robLwr9uxX/d3ScA1f6CtUqNb+LV8b+/E19nOmNgEpm9bq
 ZLOAqsmE2F5Oa/JILbLU01dtdOs8uotYC5TCAv2WnSKcqIAZvzW+ND51bmyw4JBF0sODyaQ+qi9
 iL+OloYQQDYZ0LMQiqt54eQgZg3meUBzEQ4dgmYKMNRLiwrYt3rC/ATI9AovgW9qMyEVBl8/Xnm
 gU4yQuZzlAE66PhiIdsUHeKRHadg5ziGYPPkzOW0rZ6yEacvrmaUGaF8/6Z9McJYJbHhg/WJcyu
 vupl1pUofl+RNX4M8Zw==
X-Proofpoint-GUID: S_2HHxazPWswFz3fvYobIqaLchI2M8IX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-07_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 malwarescore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603070106
X-Rspamd-Queue-Id: 15B9F22B6C7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-95955-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kishore.batta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.949];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On 8/26/2025 3:08 AM, Bjorn Andersson wrote:
> On Mon, Aug 25, 2025 at 03:49:18PM +0530, Kishore Batta wrote:
>> Register Qualcomm AIC-specific image tables with the Sahara protocol.
>> The Sahara protocol provides a method for client drivers to register
>> device-specific image tables, which is mandatory for firmware transfer.
>> During QAIC device initialization, the QAIC driver must register the
>> image table information with the Sahara protocol for firmware transfer
>> to occur. Once the device is probed, it sends the required Sahara packets
>> to the host. Based on the connected device, Sahara selects the appropriate
>> image table and sends the firmware image data back to the device.
> This does describe things that is happening. But it doesn't describe the
> purpose of this patch.
ACK. In v2, i have rewritten it properly.
>> Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
>> ---
>>   drivers/accel/qaic/mhi_controller.c | 57 +++++++++++++++++++++++++++--
>>   drivers/accel/qaic/mhi_controller.h |  2 +
>>   drivers/accel/qaic/qaic_drv.c       |  7 ++++
>>   drivers/accel/qaic/sahara.c         | 17 +++++----
>>   drivers/accel/qaic/sahara.h         |  6 ---
>>   5 files changed, 73 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/accel/qaic/mhi_controller.c b/drivers/accel/qaic/mhi_controller.c
>> index 5cc7994f4809..16c346e0e3b5 100644
>> --- a/drivers/accel/qaic/mhi_controller.c
>> +++ b/drivers/accel/qaic/mhi_controller.c
>> @@ -13,6 +13,7 @@
>>   
>>   #include "mhi_controller.h"
>>   #include "qaic.h"
>> +#include "sahara_image_table_ops.h"
>>   
>>   #define MAX_RESET_TIME_SEC 25
>>   
>> @@ -801,8 +802,6 @@ const char * const aic100_image_table[] = {
>>   	[10] = "qcom/aic100/fw10.bin",
>>   };
>>   
>> -const size_t aic100_image_table_size = ARRAY_SIZE(aic100_image_table);
>> -
>>   const char * const aic200_image_table[] = {
>>   	[5]  = "qcom/aic200/uefi.elf",
>>   	[12] = "qcom/aic200/aic200-nsp.bin",
>> @@ -831,7 +830,59 @@ const char * const aic200_image_table[] = {
>>   	[75] = "qcom/aic200/pvs.bin",
>>   };
>>   
>> -const size_t aic200_image_table_size = ARRAY_SIZE(aic200_image_table);
>> +static struct sahara_image_table_provider aic100_provider = {
>> +	.image_table = aic100_image_table,
>> +	.image_table_size = ARRAY_SIZE(aic100_image_table),
>> +	.dev_name = "AIC100",
>> +	.fw_folder_name = "aic100",
>> +	.list = LIST_HEAD_INIT(aic100_provider.list)
>> +};
>> +
>> +static struct sahara_image_table_provider aic200_provider = {
>> +	.image_table = aic200_image_table,
>> +	.image_table_size = ARRAY_SIZE(aic200_image_table),
>> +	.dev_name = "AIC200",
>> +	.fw_folder_name = "aic200",
>> +	.list = LIST_HEAD_INIT(aic200_provider.list)
>> +};
>> +
>> +static struct sahara_image_table_provider *aic_providers[] = {
>> +	&aic100_provider,
>> +	&aic200_provider,
>> +};
>> +
>> +int qaic_sahara_register_image_tables(void)
>> +{
>> +	int ret;
>> +
>> +	for (int i = 0; i < ARRAY_SIZE(aic_providers); i++) {
>> +		ret = sahara_register_image_table_provider(aic_providers[i]);
>> +		if (ret) {
>> +			pr_err("qaic: Failed to register image table %d\n",
>> +			       ret);
>> +
>> +			/* Rollback previously registered providers */
>> +			while (--i >= 0)
>> +				sahara_unregister_image_table_provider(aic_providers[i]);
>> +
>> +			return ret;
>> +		}
>> +	}
>> +	return 0;
>> +}
>> +
>> +void qaic_sahara_unregister_image_tables(void)
>> +{
>> +	int ret;
>> +
>> +	for (int i = 0; i < ARRAY_SIZE(aic_providers); i++) {
>> +		ret = sahara_unregister_image_table_provider(aic_providers[i]);
>> +		if (ret)
>> +			pr_err("qaic: Failed to unregister image table %d\n",
>> +			       ret);
>> +	}
>> +}
>> +
>>   
>>   static int mhi_read_reg(struct mhi_controller *mhi_cntrl, void __iomem *addr, u32 *out)
>>   {
>> diff --git a/drivers/accel/qaic/mhi_controller.h b/drivers/accel/qaic/mhi_controller.h
>> index 8939f6ae185e..90c0f07cbdf6 100644
>> --- a/drivers/accel/qaic/mhi_controller.h
>> +++ b/drivers/accel/qaic/mhi_controller.h
>> @@ -12,5 +12,7 @@ struct mhi_controller *qaic_mhi_register_controller(struct pci_dev *pci_dev, voi
>>   void qaic_mhi_free_controller(struct mhi_controller *mhi_cntrl, bool link_up);
>>   void qaic_mhi_start_reset(struct mhi_controller *mhi_cntrl);
>>   void qaic_mhi_reset_done(struct mhi_controller *mhi_cntrl);
>> +int qaic_sahara_register_image_tables(void);
>> +void qaic_sahara_unregister_image_tables(void);
>>   
>>   #endif /* MHICONTROLLERQAIC_H_ */
>> diff --git a/drivers/accel/qaic/qaic_drv.c b/drivers/accel/qaic/qaic_drv.c
>> index e31bcb0ecfc9..5c4fab328003 100644
>> --- a/drivers/accel/qaic/qaic_drv.c
>> +++ b/drivers/accel/qaic/qaic_drv.c
>> @@ -688,6 +688,12 @@ static int __init qaic_init(void)
>>   		goto free_mhi;
>>   	}
>>   
>> +	ret = qaic_sahara_register_image_tables();
> Now that you're doing this on a per-device basis (but actually per
> driver), could this somehow be done from qaic_mhi_register_controller()
> instead. So we don't run this code unless you actually have a QAIC
> attached?
I have removed registration mechanism in v2.
>> +	if (ret) {
>> +		pr_debug("qaic: Image table registration failed %d\n", ret);
> That's not a debug print...which is also the reason why you pr_err()
> inside the function. I.e. this is at best spamming the log.
Removed in v2.
>> +		goto free_mhi;
>> +	}
>> +
> Regards,
> Bjorn
>
>>   	ret = qaic_timesync_init();
>>   	if (ret)
>>   		pr_debug("qaic: qaic_timesync_init failed %d\n", ret);
>> @@ -727,6 +733,7 @@ static void __exit qaic_exit(void)
>>   	 * reinitializing the link_up state after the cleanup is done.
>>   	 */
>>   	link_up = true;
>> +	qaic_sahara_unregister_image_tables();
>>   	qaic_ras_unregister();
>>   	qaic_bootlog_unregister();
>>   	qaic_timesync_deinit();
>> diff --git a/drivers/accel/qaic/sahara.c b/drivers/accel/qaic/sahara.c
>> index cf8f8b585223..7eae329396be 100644
>> --- a/drivers/accel/qaic/sahara.c
>> +++ b/drivers/accel/qaic/sahara.c
>> @@ -14,6 +14,7 @@
>>   #include <linux/workqueue.h>
>>   
>>   #include "sahara.h"
>> +#include "sahara_image_table_ops.h"
>>   
>>   #define SAHARA_HELLO_CMD		0x1  /* Min protocol version 1.0 */
>>   #define SAHARA_HELLO_RESP_CMD		0x2  /* Min protocol version 1.0 */
>> @@ -738,13 +739,15 @@ static int sahara_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_
>>   	INIT_WORK(&context->fw_work, sahara_processing);
>>   	INIT_WORK(&context->dump_work, sahara_dump_processing);
>>   
>> -	if (!strcmp(mhi_dev->mhi_cntrl->name, "AIC200")) {
>> -		context->image_table = aic200_image_table;
>> -		context->table_size = aic200_image_table_size;
>> -	} else {
>> -		context->image_table = aic100_image_table;
>> -		context->table_size = aic100_image_table_size;
>> -	}
>> +	/* Get the image table for a given device name */
>> +	context->image_table = sahara_get_image_table(mhi_dev->mhi_cntrl->name);
>> +	if (!context->image_table)
>> +		return -EINVAL;
>> +
>> +	/* Get the image table size for a given device name */
>> +	context->table_size = sahara_get_image_table_size(mhi_dev->mhi_cntrl->name);
>> +	if (!context->table_size)
>> +		return -EINVAL;
>>   
>>   	context->active_image_id = SAHARA_IMAGE_ID_NONE;
>>   	dev_set_drvdata(&mhi_dev->dev, context);
>> diff --git a/drivers/accel/qaic/sahara.h b/drivers/accel/qaic/sahara.h
>> index d7fd447ca85b..dde8c736d29e 100644
>> --- a/drivers/accel/qaic/sahara.h
>> +++ b/drivers/accel/qaic/sahara.h
>> @@ -8,10 +8,4 @@
>>   int sahara_register(void);
>>   void sahara_unregister(void);
>>   
>> -extern const char * const aic200_image_table[];
>> -extern const size_t aic200_image_table_size;
>> -
>> -extern const char * const aic100_image_table[];
>> -extern const size_t aic100_image_table_size;
>> -
>>   #endif /* __SAHARA_H__ */
>> -- 
>> 2.34.1
>>

