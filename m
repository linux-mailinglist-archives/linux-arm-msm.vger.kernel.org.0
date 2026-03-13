Return-Path: <linux-arm-msm+bounces-97440-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oPR9C17xs2nYdgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97440-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 12:13:34 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B8528206A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 12:13:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 686F8318AC65
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 11:11:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0C44372EFF;
	Fri, 13 Mar 2026 11:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Uw4CtOdA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eXLbkrTh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D11535F19C
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 11:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773400276; cv=none; b=KItu+tIGMerROzZ9NmzDSwiRcUJjZ6PkeSQKFqPIPLo8kcouOZ54UKiFUOfT9lHCW87GmWFTqj7WT8DW0xyGw8D+HzHgi76vuCDe7c0ldlsK7+mrQPXvt6iJybvlCX3BBCs/93agqIAeoqsLHEkJUVarfLQx7ZFxW32zy0mdIwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773400276; c=relaxed/simple;
	bh=YnwcHaVVk5a1ldfbtd3/N6J9vOu78e330RV80djtycY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aHswwZonFpJ7u2L4vRQ9exwMnAdUzTQDPaE07cC5iXw6FB0efaIMxVhtz5lJPhDBSt8JtAoOHpVnhRBWrlGZzkzd1ZYXwg8KIictnZr6Q/YYgHbzOOjYMTutxI3KKCZ0db3Y0csCFCvsSHMCz9kFlHFELVEHTotAg61JGlQLDy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Uw4CtOdA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eXLbkrTh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D5tY5Q3229734
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 11:11:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mLpV9IJ4BvaUl89u79yOHs2lX87W2UzHV2lsQNonTkw=; b=Uw4CtOdASLAou5P2
	vaAVu3m713BqFV82V49u9VUn3bgD218tb102Qwg2oQxybIdxbdFoV1+5pgETWvty
	P96qt0Lc8ilV0p846xhyiDKs2f4Xlh0vdMut0HMBttYsFnoeCGpODqPeuLp4jKol
	OLvU/7GsrTvWOWa6I/UZZbofIgCTUqjXYdc3sv6dMFoFp1JrvIJju4muA4fLpc4n
	YUCiZcBNnf/6AJ4R0VJ63Ck+q49Zno81IR0mFQbL+Qvr8WTKMfEpCrTZ72tirq7g
	j3zwNRVwHfnMZLPAgkCTsWUVHdwLa/LXKohHhqfmhVo6Ie5o0BfmfKU5TSbxMLDA
	Y84QhQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cv8n7hv0j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 11:11:14 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2aec89e1f05so10368105ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 04:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773400274; x=1774005074; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mLpV9IJ4BvaUl89u79yOHs2lX87W2UzHV2lsQNonTkw=;
        b=eXLbkrThLeXXYS/1QkjZoZ7c0fGDq60f2nzmdd0GVeX5CfhGa9zUtTvE6laQfrVez6
         Y2kfHuuI3mxEvR2x0blEwOWsmjSVQA8g2SyLgQ2sVfykTCf4e6DLiQDvDktg7jnmOetB
         VkwscaubRHRw/29LHR9tK392gIy0TtVgkBvM3RRMNEFuxoelmSFHW5pJxLHFBapAOQyh
         +QBxihPN2XQniASnvIjs2wmTRnCrtGJl+O0iB32K1awPiYP1HPR8QYezhXHlZaReBXkw
         JSZzI2ldgQ0ddljWxPyveOvvayEjqVWnaZ0oi8Nc8bmY7aEQjU+n/uq9/dxUSpQcame/
         h8rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773400274; x=1774005074;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mLpV9IJ4BvaUl89u79yOHs2lX87W2UzHV2lsQNonTkw=;
        b=ORsX5fQ0RXQzXvZ8E9UoMOS/OiKXo2NVEwhCbPvB6UhUmoRM1k0OGUziGW3FZLvjRM
         NBKmtoKHiWlLBGxm9uul7wZfAI393rrFqd88fis6Wvicx+X4E0Scz4ReHGbJYyLx4mhK
         ouWpb1dLVtngoBbz9lnB67q77oNFwckUdjjYdQZFUL+OUJ3zfjHAMC8b7o3KpCTHzuSN
         F9RXqcVO2EHeFDSqej7WQCeKPJSX6r2sVLlzd1suX5oP2CcCZqXQ2sggywxCj9e6wJ7Q
         7GIBmaRgw3EhOgvXP03dW7I+5SErWuugLscdjvsXqWe9ZDJzIgN0hE97yGEKkemWkiEd
         zhTw==
X-Forwarded-Encrypted: i=1; AJvYcCUmy5WfrH5+JNJCf+9KHF6Xu68N1B9BCHHoukFDZuFwhuJ13SlCavnv+pXxq1stPLmLghwohQ7A3vURf+kl@vger.kernel.org
X-Gm-Message-State: AOJu0YyDWsA7tLFQAbAFujrYbaOBi/V6qozVpf4BTq9ITUF0Dp/j92TG
	iUV+Mz+aSub6ruBBi5p0OGI0RJt2evX03jJcDVPwUwc5jtUE0324SG11wspIGNICyG6DDM4TGzS
	LR5w9mmFWbIsbkWCPIrlGvovcUBCRx85/aEeTQgN7RoTJL/6QvOsFI1irIIcdjWh9n7RPxVwLyW
	h9
X-Gm-Gg: ATEYQzxRV5gVDq4Ju7KKBHKpMxvsGCVvPE5kcA7VzW85H2S7clKWR4wHakpDdpFme90
	6jr232qcq6dBe6y1emHLoqfEwWe7epxsFQ0a0U/khX4E6hMoCGL+1gTQszwHYgzujM6A8MXIAb1
	cqbAf9tKcJVwArEHXKOh9VhLJ9RZdg3w5mEk8C/d6RfJ0flzRQ9YPWN3Dd3RvsvPuLZulkUc7tg
	1RVaqkh4yM7ghw/QOKJ2bvAf+9f8gvOSUEuEdS6b2w6RycEv0No+FYySOx+KI4vO5d1wXBa8i0r
	fkrY5zk7omizNLXYAASn9erE7067o3SD/98TO/BYMmbSPnDNIPCUWW+aXltyUQqVDF34zd8LQl7
	1y7wKr/qZbCfPHRJDauJLsQdvmwwZSsyQmCtYFtcPCZ5iigcG6kn1
X-Received: by 2002:a17:903:2c06:b0:2ae:b807:da61 with SMTP id d9443c01a7336-2aecaaf6429mr25200985ad.35.1773400273499;
        Fri, 13 Mar 2026 04:11:13 -0700 (PDT)
X-Received: by 2002:a17:903:2c06:b0:2ae:b807:da61 with SMTP id d9443c01a7336-2aecaaf6429mr25200655ad.35.1773400272978;
        Fri, 13 Mar 2026 04:11:12 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.229.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece56cde9sm23677475ad.15.2026.03.13.04.11.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 04:11:12 -0700 (PDT)
Message-ID: <61ae9967-e848-5f8d-c154-5022caf0799e@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 16:41:07 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 3/3] media: iris: Add support for Gen2 firmware
 detection and loading on SC7280
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260227-iris_sc7280_gen2_support-v2-0-7e5b13d26542@oss.qualcomm.com>
 <20260227-iris_sc7280_gen2_support-v2-3-7e5b13d26542@oss.qualcomm.com>
 <yjtzeyjovbi3coyw4rblczokuki6t7oj5ni3exrzksdg4dwwd5@seuaf2tmrvub>
 <b6caaf35-2e41-9b76-aab8-0b8b6a8a8e67@oss.qualcomm.com>
 <hzltrmeqf5oeh7o7xj7vtzhyaldyoep6ngmcwk6jqmiwdqszdp@raogozbh3iap>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <hzltrmeqf5oeh7o7xj7vtzhyaldyoep6ngmcwk6jqmiwdqszdp@raogozbh3iap>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: BBITooD8mjG0fUwzMdmCtZAhrYyqHCoY
X-Proofpoint-GUID: BBITooD8mjG0fUwzMdmCtZAhrYyqHCoY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA4NyBTYWx0ZWRfX8D3zk4BPVabK
 d5Kq8z6PXKRPwyIpENS/pehJ0mdnVIBtOmCuOsxwm+sIjFd6vTO3Lpab0HJPpXAyd/yU700BMX0
 tn8dxTFNzXpp+E1TU50k79LqBEQnWT7sd9E9WHlTxAYYknpCHCZCThXglCd8xFL/rB4J0gc3axm
 1lR7nmIR5QMQ+T6MDLCwNbktz35S/fAubGmIZcku4H2phjHpeyI2JIqgwHkmZ8mGVm3ZqCWDOCl
 w2+EKNRAmjqaAAGq1q/ynU+DbkU/nhDsfs2PeUDurR/eqVBPHqx1sUlyOi6WWJtoqBktDmpTYfC
 xaw4fUTiEP5r5XPpb0KJb8JxLFVYpwtdDO+/a0GapzuP0Nmb16kRVg++SPcRgfUbeaXEygquOLW
 AYlb1K18cQLcdtRj41zkEfvga+8f1sko1ghRQhHBUKk00peHTY/GjE4pR2VeZCfE92TkogdZS/Z
 8Cz3r3+UaxeiAqm921Q==
X-Authority-Analysis: v=2.4 cv=CpCys34D c=1 sm=1 tr=0 ts=69b3f0d2 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ndT/fs+coltRyMHftQWjTw==:17
 a=vAhLNi6rj8_hoSnI:21 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=HD2aLihsQs9dRDbn5AQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130087
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97440-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,cisco];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 83B8528206A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/5/2026 10:27 AM, Dmitry Baryshkov wrote:
> On Mon, Mar 02, 2026 at 02:56:16PM +0530, Dikshita Agarwal wrote:
>>
>>
>> On 2/27/2026 5:48 PM, Dmitry Baryshkov wrote:
>>> On Fri, Feb 27, 2026 at 12:21:03PM +0530, Dikshita Agarwal wrote:
>>>> SC7280 supports both Gen1 and Gen2 HFI firmware. To support both
>>>> dynamically, update the firmware loading mechanism to prioritize
>>>> Gen2 availability and detect the loaded firmware version at runtime.
>>>>
>>>> The firmware loading logic is updated with the following priority:
>>>> 1. Device Tree (`firmware-name`): If specified, load unconditionally.
>>>> 2. Gen2 Autodetect (SC7280 only): If no DT property exists, attempt to
>>>>    load the specific Gen2 firmware image (`vpu20_p1_gen2_s6.mbn`).
>>>> 3. Default Fallback: If Gen2 loading fails or is not applicable, use
>>>>    the default firmware name defined in the default platform data.
>>>>
>>>> Additionally, introduce `iris_update_platform_data` to inspect the
>>>> loaded firmware memory before authentication. This function scans for
>>>> `QC_IMAGE_VERSION_STRING`. If the version string starts with "vfw" or
>>>> matches "video-firmware.N.M" (where N >= 2), it identifies the
>>>> firmware as Gen2.
>>>>
>>>> If Gen2 firmware is detected on SC7280, the driver switches the
>>>> internal platform data pointer to the Gen2 configuration.
>>>>
>>>> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
>>>> ---
>>>>  drivers/media/platform/qcom/iris/iris_firmware.c   | 70 +++++++++++++++++-
>>>>  .../platform/qcom/iris/iris_platform_common.h      |  1 +
>>>>  .../media/platform/qcom/iris/iris_platform_gen1.c  |  4 +-
>>>>  .../media/platform/qcom/iris/iris_platform_gen2.c  | 83 ++++++++++++++++++++++
>>>>  .../platform/qcom/iris/iris_platform_sc7280.h      | 15 ++++
>>>>  drivers/media/platform/qcom/iris/iris_probe.c      |  3 -
>>>>  drivers/media/platform/qcom/iris/iris_vidc.c       |  3 +
>>>>  7 files changed, 171 insertions(+), 8 deletions(-)
>>>>
>>>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
>>>> index df8e6bf9430ed2a070e092edae9ef998d092cb5e..6dbdd0833dcdc7dfac6d7b35f99837c883e188e7 100644
>>>> --- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
>>>> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
>>>> @@ -414,8 +414,8 @@ const struct iris_platform_data sc7280_data = {
>>>>  	.dma_mask = 0xe0000000 - 1,
>>>>  	.fwname = "qcom/vpu/vpu20_p1.mbn",
>>>>  	.pas_id = IRIS_PAS_ID,
>>>> -	.inst_iris_fmts = platform_fmts_sm8250_dec,
>>>> -	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8250_dec),
>>>> +	.inst_iris_fmts = platform_fmts_sc7280_dec,
>>>> +	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sc7280_dec),
>>>
>>> Why?
>>>
>>
>> SC7280 Gen2 platform data relies heavily on SM8550 data structures.
>> However, unlike SM8550, SC7280 does not support AV1. To address this, I am
>> defining a dedicated platform_fmts_sc7280_dec array that correctly lists
>> the supported codecs (H264, HEVC, VP9) excluding AV1 and using for both
>> gen1 and gen2 platform data for SC7280.
> 
> Why can't we continue using SM8250 data? Also please see the series I
> posted few days ago, it might simplify this piece for you.
> 
>>
>>>>  	.inst_caps = &platform_inst_cap_sm8250,
>>>>  	.inst_fw_caps_dec = inst_fw_cap_sm8250_dec,
>>>>  	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8250_dec),
>>>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
>>>> index 5da90d47f9c6eab4a7e6b17841fdc0e599397bf7..5f3be22a003fe5d80b683b43a1b2386497785fb1 100644
>>>> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
>>>> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
>>>> @@ -15,6 +15,7 @@
>>>>  #include "iris_platform_qcs8300.h"
>>>>  #include "iris_platform_sm8650.h"
>>>>  #include "iris_platform_sm8750.h"
>>>> +#include "iris_platform_sc7280.h"
>>>
>>> Don't you end up with two copies of 7280 data in the object files?
>>>
>>
>> You are right, there is a duplication.
>> The header is needed majorly for above reason to exclude AV1, I can have
>> only platform_fmts_sc7280_dec defined in gen1 file and extern and use in
>> gen2 file, that will deviate from the design we are currently following for
>> platform specific caps though.
> 
> Then the design needs to be changed. I've posted a proposal.
> 
>>
>>>>  
>>>>  #define VIDEO_ARCH_LX 1
>>>>  #define BITRATE_MAX				245000000
> 
>>>> @@ -257,8 +256,6 @@ static int iris_probe(struct platform_device *pdev)
>>>>  	if (ret)
>>>>  		return ret;
>>>>  
>>>> -	iris_session_init_caps(core);
>>>> -
>>>
>>> Why?
>>
>> Movin iris_session_init_caps to iris_open because platform data this
>> capabilities may change after firmware loading, which happens after probe.
>> Initializing caps in probe would result in stale Gen1 capabilities if the
>> driver later switches to Gen2.
> 
> Is there a window where devices already exist, but the params are not
> yet initialized?

The device nodes exist after probe, but session caps are only consumed
through ioctls on an open fd, so there’s no user-visible window where caps
can be queried before open().

Thanks,
Dikshita
> 
> 

