Return-Path: <linux-arm-msm+bounces-66161-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 96DFDB0E56E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 23:27:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B38566C1134
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 21:27:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29E09285CB9;
	Tue, 22 Jul 2025 21:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i4eGadaE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A0B2857FA
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 21:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753219667; cv=none; b=nQFTiLEYIJSzE+UaeqlHgQiVXtt8yXSr2y/OdvzCtj0z5t2YnV1VoZUuo5rbCAsBAbXUhYidrvh5VSftzNyjEzYYcJOv6wp9m/TEWNT3w8ZM+QnZmOJN4UccPmTUtysqreGcOx7zXBp5P8AwsXCkOvTa/I/Sa4a31G1GVKC9vr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753219667; c=relaxed/simple;
	bh=OFy/DeEbf55iczrB3eYltRPscktHPsaY1tzIyobbwQY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V8s25f9f4E4WJoCmK0c0LPt8JRP9V3eGkDsMoecVL7Ux6ownDyTRMHFhFI2YM4L+IwCiJAMsytH8KzXxrCKCoWZ0UbKLlsM/VHHJ3pRcOpycKqfTplllgF1qmu40mgA1DV/lmv+XaFp4+XPdyMWQsFIdvyZV87hY48xUZPZRSII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i4eGadaE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56MKTKJp025130
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 21:27:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vIRMyOj74xnjmIGlTF15NUrmR7tJtt8RXTZi6qjqdK4=; b=i4eGadaETKA8GevF
	g8LS9pXNQYd23p8bX+ldZHKJhcWlL0d9ept+1FFmaI16n26+pTn70oeXSPxM9sIR
	Em97/j9i2N4yKGsEJJiqMywPr/SUMwkLTAmEXUtW3X9I2/zDd1nSMi7ymebV+jT2
	Cmc2o5GNsQV82LFrBdfl6ZRfMnfL8Bzd1efodvqBGWbX/TVEuLjZj5Rc15wRbXyA
	9RohE6+kzgVD+zk/I0+KSI8XXobWqva7rVhs4v/AnOOqj2UVOlRXwfpvoFZXeV+U
	RRY15cEverwJvj6I7hF0OtYUHHNbOQpDhKIahlgEzwK0WktqRvjJgYmDN1XENsRP
	LOIX/A==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 482d3hry1b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 21:27:43 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-74927be2ec0so7423491b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 14:27:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753219644; x=1753824444;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vIRMyOj74xnjmIGlTF15NUrmR7tJtt8RXTZi6qjqdK4=;
        b=REHVglt89rvrbI4OJBhZE08b7C4ETPxVz4mkVKXEdeq/2Q91M+xPwZuS+aggHLeTMS
         JYRgPK4mubV/qo0LaH9eksFuEIu4tt3sPSu9vg8NVXAWmMUatvhyGPn3lS2BGucsYvG7
         VF5MIMkgpO2eNhLj8ZtDvGlTxpeTUZ1heooDkLQsLHsJzx0i9Q/uAZ1svEd1YnVa/3Rj
         pvek2mGMMW1rKopoha6yXXimRvXrJ7SsgjOf4aBWgl1zxGmZHiu9vTWSoRe08gkXeeu/
         8ggGDvD6eIfI7KYZm9mJ5QxESkiN+zOdSS4yZFnymlGonJv8juEFYJDuHmn+3cYGnf/b
         /ZAg==
X-Forwarded-Encrypted: i=1; AJvYcCWYTEdw+sEk9MtD6G9YgAD4HVQjGVwfCTwbcOOaZe8nCFqlWToz5OQ7R5g/7eEnM29xmVUJlPQPm7hSFLsd@vger.kernel.org
X-Gm-Message-State: AOJu0Yzc5p1MRBR8fYWfgb0ouyjR3V86E1ZzL3P/xq3kKClunIT8DF7t
	TIawdEagyw4QAHJRVx6GY1P6Tsr6Juu21RnlDaHf1IRn/uS8DMQ6G7gwVjFenYVsmUOkw7mMXEH
	yPAamPykJ+V+YiyE3DsczRGIaPQOA5AgKjjBAGT+jkyWITUNCviOsylYNWlEfHrYpAlUH
X-Gm-Gg: ASbGncsQlBQIc1IzfZCMkmTE1hV3TAPdNjvNn3QnWC6qBLjeSdEyHL4KPIj3LoB40mJ
	GgCpW3F733kLh4VuuisMFKaCCk5QKtcFepsjDQRzQUDmclBTS2id44kuIBPIEPksix7+5delCj8
	/+juKvhbTBODRpO/ISNkGhp83sa/PTMIXl5DtDhtFCOMEnT9BA9iH/KfT4x11v0fP+Foy5dzFIB
	99rBmEGsa8kN/xmwRsML9qLDCgsrKLKwgQBA94Nq62eMlVymnp7Ecial2zQwTw9Pf6Jxn0jSYlg
	n4L588+/zqtR/OHZqqXVt4H8zvF5j9J+TLevKWr8gKzUKj2G52FsW7QXM1c4L+8P
X-Received: by 2002:a05:6a00:39a0:b0:748:f365:bedd with SMTP id d2e1a72fcca58-760356fc150mr908993b3a.17.1753219643654;
        Tue, 22 Jul 2025 14:27:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEbz6+fLhPKRFEyCulAvdJ+UL97bOqbxq7BvDDpud4yaUJ+lg5oggjWeRZLsXDpbvO5CSBbxA==
X-Received: by 2002:a05:6a00:39a0:b0:748:f365:bedd with SMTP id d2e1a72fcca58-760356fc150mr908961b3a.17.1753219643161;
        Tue, 22 Jul 2025 14:27:23 -0700 (PDT)
Received: from [192.168.1.4] ([106.222.235.133])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759cbc6aab8sm8078213b3a.157.2025.07.22.14.27.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jul 2025 14:27:22 -0700 (PDT)
Message-ID: <6472bc1a-9546-4cb1-85b9-d826f76ba9f4@oss.qualcomm.com>
Date: Wed, 23 Jul 2025 02:57:17 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/17] drm/msm: Add support for IFPC
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-11-9347aa5bcbd6@oss.qualcomm.com>
 <k653qq6a4xkvwadeum5kbr7cheje773vobehpzq33ec44vyxjj@vi3ekv4jwext>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <k653qq6a4xkvwadeum5kbr7cheje773vobehpzq33ec44vyxjj@vi3ekv4jwext>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=G8UcE8k5 c=1 sm=1 tr=0 ts=6880024f cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=4dphQItTPUswyQvINXrzgA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=JnQl59jAsqm81Bwny3IA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDE4NiBTYWx0ZWRfX6kHV2Ws57IY9
 6sQmolJ0dGehd25+z9BRhF2x49O+CeDpCrjvCU6bkqciEKyOGPrFrHbFz76YB5EkmlNvt4VAT2l
 FP+Q7/pBm359K865KII5FUl3Q4uRfSWwLXPQQlNb6H61/BEQ5zdDOJL/JCKFdPuusLAKm3ryMYx
 GPhOjtfDe+H5L7FSXuhMvZVBipj8QmYT6I7frfXbmU5jL4VQShU9znSoULzdKLQ1EaK6F8ZUqU3
 RkzPe8+pwQGvJj3oJZVk0fzDIRPRawVkMixafEDIlDuqcRCx6t/fTNYw2lyDhHtNiUYA3grtfUB
 QpP9hgKM9kjN6vvlBIif9SxUdfKqxDrrRQPwWqT6iRHEyurZVtzQjgna/c2qlzxiCMStU6z1Ogw
 nvKdDudB9mizlkGndfTb0dJkJ1Z2a8CvNShW14yp1Oqhn3+O2x7BEpxQRPlroRfKZCxnOkCd
X-Proofpoint-GUID: d5dLow0LvU7dXPbV9PpFiH3nzSrHAO17
X-Proofpoint-ORIG-GUID: d5dLow0LvU7dXPbV9PpFiH3nzSrHAO17
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_03,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 mlxlogscore=999 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507220186

On 7/22/2025 7:19 PM, Dmitry Baryshkov wrote:
> On Sun, Jul 20, 2025 at 05:46:12PM +0530, Akhil P Oommen wrote:
>> Add a new quirk to denote IFPC (Inter-Frame Power Collapse) support
>> for a gpu. Based on this flag send the feature ctrl hfi message to
>> GMU to enable IFPC support.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c   |  5 +++--
>>  drivers/gpu/drm/msm/adreno/a6xx_hfi.c   | 33 +++++++++++++++++++++++++++------
>>  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  1 +
>>  3 files changed, 31 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> index 4d6c70735e0892ed87d6a68d64f24bda844e5e16..3bbcc78179c1cf1bfa21ff097e9350eb2f554011 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> @@ -1961,8 +1961,9 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
>>  	if (ret)
>>  		return ret;
>>  
>> -	/* Fow now, don't do anything fancy until we get our feet under us */
>> -	gmu->idle_level = GMU_IDLE_STATE_ACTIVE;
>> +	/* Set GMU idle level */
>> +	gmu->idle_level = (adreno_gpu->info->quirks & ADRENO_QUIRK_IFPC) ?
>> +		GMU_IDLE_STATE_IFPC : GMU_IDLE_STATE_ACTIVE;
>>  
>>  	pm_runtime_enable(gmu->dev);
>>  
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
>> index 8e69b1e8465711837151725c8f70e7b4b16a368e..20ade6b0558b016b581078f5cf7377e7e7c57f8e 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
>> @@ -21,6 +21,7 @@ static const char * const a6xx_hfi_msg_id[] = {
>>  	HFI_MSG_ID(HFI_H2F_MSG_PERF_TABLE),
>>  	HFI_MSG_ID(HFI_H2F_MSG_TEST),
>>  	HFI_MSG_ID(HFI_H2F_MSG_START),
>> +	HFI_MSG_ID(HFI_H2F_FEATURE_CTRL),
>>  	HFI_MSG_ID(HFI_H2F_MSG_CORE_FW_START),
>>  	HFI_MSG_ID(HFI_H2F_MSG_GX_BW_PERF_VOTE),
>>  	HFI_MSG_ID(HFI_H2F_MSG_PREPARE_SLUMBER),
>> @@ -765,23 +766,39 @@ static int a6xx_hfi_send_bw_table(struct a6xx_gmu *gmu)
>>  		NULL, 0);
>>  }
>>  
>> +static int a6xx_hfi_feature_ctrl_msg(struct a6xx_gmu *gmu, u32 feature, u32 enable, u32 data)
>> +{
>> +	struct a6xx_hfi_msg_feature_ctrl msg = {
>> +		.feature = feature,
>> +		.enable = enable,
>> +		.data = data,
>> +	};
>> +
>> +	return a6xx_hfi_send_msg(gmu, HFI_H2F_FEATURE_CTRL, &msg, sizeof(msg), NULL, 0);
>> +}
>> +
>> +#define HFI_FEATURE_IFPC 9
> 
> Can we please have an enum or at least a set of defines rather than
> havign them scattered through the code?

Ack

> 
>> +
>> +static int a6xx_hfi_enable_ifpc(struct a6xx_gmu *gmu)
>> +{
>> +	if (gmu->idle_level != GMU_IDLE_STATE_IFPC)
>> +		return 0;
>> +
>> +	return a6xx_hfi_feature_ctrl_msg(gmu, HFI_FEATURE_IFPC, 1, 0x1680);
> 
> magic number?
> 

Let me check.

-Akhil

>> +}
>> +
>>  #define HFI_FEATURE_ACD 12
>>  
>>  static int a6xx_hfi_enable_acd(struct a6xx_gmu *gmu)
>>  {
>>  	struct a6xx_hfi_acd_table *acd_table = &gmu->acd_table;
>> -	struct a6xx_hfi_msg_feature_ctrl msg = {
>> -		.feature = HFI_FEATURE_ACD,
>> -		.enable = 1,
>> -		.data = 0,
>> -	};
>>  	int ret;
>>  
>>  	if (!acd_table->enable_by_level)
>>  		return 0;
>>  
>>  	/* Enable ACD feature at GMU */
>> -	ret = a6xx_hfi_send_msg(gmu, HFI_H2F_FEATURE_CTRL, &msg, sizeof(msg), NULL, 0);
>> +	ret = a6xx_hfi_feature_ctrl_msg(gmu, HFI_FEATURE_ACD, 1, 0);
>>  	if (ret) {
>>  		DRM_DEV_ERROR(gmu->dev, "Unable to enable ACD (%d)\n", ret);
>>  		return ret;
>> @@ -898,6 +915,10 @@ int a6xx_hfi_start(struct a6xx_gmu *gmu, int boot_state)
>>  	if (ret)
>>  		return ret;
>>  
>> +	ret = a6xx_hfi_enable_ifpc(gmu);
>> +	if (ret)
>> +		return ret;
>> +
>>  	ret = a6xx_hfi_send_core_fw_start(gmu);
>>  	if (ret)
>>  		return ret;
>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>> index bc063594a359ee6b796381c5fd2c30e2aa12a26d..1135beafac464f3162a3a61938a7de0c7920455a 100644
>> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>> @@ -58,6 +58,7 @@ enum adreno_family {
>>  #define ADRENO_QUIRK_HAS_CACHED_COHERENT	BIT(4)
>>  #define ADRENO_QUIRK_PREEMPTION			BIT(5)
>>  #define ADRENO_QUIRK_4GB_VA			BIT(6)
>> +#define ADRENO_QUIRK_IFPC			BIT(7)
>>  
>>  /* Helper for formating the chip_id in the way that userspace tools like
>>   * crashdec expect.
>>
>> -- 
>> 2.50.1
>>
> 


