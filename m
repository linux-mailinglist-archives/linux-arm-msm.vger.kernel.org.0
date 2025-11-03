Return-Path: <linux-arm-msm+bounces-80088-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E609C2B75B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 03 Nov 2025 12:43:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3A86C3AF3B4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Nov 2025 11:39:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CB6130171C;
	Mon,  3 Nov 2025 11:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gQvFlsLV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y1Qsxgwn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8514C301491
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Nov 2025 11:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762169953; cv=none; b=rrwukNqJqGofgmO8aMfU7AW5OXFioT03jTogDD8G33dZ9ebq5d79pMygbVb88gmurSpjWcde4ohTo1BJ5XD47L/sbopi934jOMuU66tC0UidK0ujbLQ0tIDfmziBAewBqS09QUYXs/9qF3jxIZMDEkvg20IFmoSi+jbzRxzT7vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762169953; c=relaxed/simple;
	bh=v7dxzTkK2y6JziU88ESJuqvHkqldgIVDBLVgz6H8lGo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JUt5lt2snUIfItYU/AfWvniFbWRxVt7tNE6abebDIDWfwxGVwDVJXeaec5q9lZvnnYu3O2+gGBjEucfGhka9JMfFUa7FjkYINOl3b6c1h1iVoNllcb2yqUbQRn2uxDxxolTLKJGcS+tSGJ+TPGll5J3L/hpb5dLuyPetgT5sbYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gQvFlsLV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y1Qsxgwn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A38g9hL1301951
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Nov 2025 11:39:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dbSFtyOXhXrRYITUZluFGf3PvM41L2P1d4YgGvRgzGc=; b=gQvFlsLVtQdgXjRh
	NAGS+kopf5gZ04/bUoY8Qgf6T6IMeDkLfiJk/uzpsZOPU9KFM0JSzNNJZg5ehhLD
	DmtO+GssegqY98Xehz26U4ctGNFFS3gcr5omlzEpmajzMQPdUEbksaXItdOexqLH
	ImAlkFV5Y5ldkYGAnPAJKVEt+AeI+HwpxuBDUoFKzWIl9tVRLw/9Ga5B5H6QnINR
	jbwnrWTrJUHf6bEvd5Lj7cTWFGe8b6g4RobF8KYzL+5ccS2lqJ/LHOlLD4H05v2F
	KEzACB2ZHy+TNEHPyfzSSGtqXqlU/zbbj/D2ADV/sHCzk7Nd5Vvti+vE3pKOpUoL
	Nuiicw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a5bcm4cwx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 11:39:09 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2950b8e12b8so11490875ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 03:39:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762169949; x=1762774749; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dbSFtyOXhXrRYITUZluFGf3PvM41L2P1d4YgGvRgzGc=;
        b=Y1QsxgwnsRp9kw5mdV4ggbX827Nf9kZ3ZHCikiOK09qeYb6urrGFTj9wIsh/KcLMd4
         pqWiVFrdcMZZ29lGtO077qV9naerWxSYLvDi61FyoLpl8yD+PpOZt/+e7BOW7nlab9rX
         p/leBlRbDRwIMwgIfE1dYjm87Fd6NwolfApsBkprK3pjHEYUxAG3JxRe/xF+aL3HyLtG
         QTItwTXRZFrZ82HfHrCw07G+A5ze0k490nLJ/YIO4I/H30vkRMHcLUfjHSeehn+NqBqA
         kTJXBbgLAjRvowWZejqVftShqs+oQ2Hw5+8qfJtl9TUFCMeoqRFlIBLKdGye4JV+ztxm
         OnLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762169949; x=1762774749;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dbSFtyOXhXrRYITUZluFGf3PvM41L2P1d4YgGvRgzGc=;
        b=mHgWsHIcBzySTt1Cy6KP57h2BLtzR3rtlSDnZ35LyXIpVeHsyYqWI0O19jrEj4Abs0
         xLwYmzCWbTfm2fey18o8qNOX2p2eB7mgN7P0/1VtuSABKGKHCJ8AtZV4XdFMCILOHlD8
         d+r5mYvTRjZf/yL7kzakRaipOgxI/eJ4s+3Mvfvd/pAuDYRf6mezdotDvuio4qT2lfaj
         xVizswyUdn0wZbX1uau17reb+scNmQUhOZ6qIbHbnUtZaIiM90qElaq6/RzHC48+drvn
         8tiJyGcwZlh221u6OqrJxQue3B1sbOhtH7sKaUbvooO7Jwou3N4UMPEh+Ej8Lcu7fX0q
         st8g==
X-Forwarded-Encrypted: i=1; AJvYcCXc51q28mj8m0NfVPnAdIS+Z4cPHd8W/m4/3kEKpZhTwJvmBeBFvwSXZ7ZfI8mIV6xpQjaJ/6k3Sa76+dUj@vger.kernel.org
X-Gm-Message-State: AOJu0YzoU2pzMQVuYkjiogOXuzVC0RfqY26YwA6lzwmEBPY5zO+Wnb+/
	uBs/7n2HtnEtYiCn83DHHD9tP6JDupZ1C6HP0BPsvMGqi3N4bjdCVpARHmxdjNOHJjiiERah2oD
	MaU6r/xgbs3X571jVlu6qW9cbnSH4MIPoE40m9sXcn3Sx646scTU2L19LVP4YsU4O7lsw
X-Gm-Gg: ASbGnctvCI1Rdqv5omXgFjT2/w/VGzLohiUxHF1J2vytgVmZ7UaHU2J/fcwSWcViDtm
	B6FLUDRjyfqbB3Q1G3G+eZHJKC1v2XcA0uiXprJqyG/FQZcE43l9tIQFuZUbitTvMgTQMa+d82O
	lUw7qbvpjFpZsbm8bSHin6buPvSS1g5Q8WQ08D6bW6nxagZxMgcRqTXTwlSQ4Ku9wU3oVVubOge
	SrPKJzjhv6gz+5Ciw0tGWNkrq2Mpgy+t4i7zmxhvFoNRZDfFEFsS2G9ca1jFR0w0A3+xLwGuw0P
	B6Ca0CnyC5/cW1FFlUFOk//oBD6eiqgbJ+NP3+zlNC2HRpxo9NeAPjUSKHluoaIzIeV/l1z/BJi
	cilQB6ia1Gfoc/dBUlC9WS4O+AN57liKMuKUdc7IJMjG2Gng4qeMhyyCp2Ujh
X-Received: by 2002:a17:902:e885:b0:295:9b3a:16c6 with SMTP id d9443c01a7336-2959b3a194cmr33416395ad.9.1762169948573;
        Mon, 03 Nov 2025 03:39:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEWsWkXgbPt/yeq47ZUZtPknQAwsBfKk6RT7Ovi5fmj95JSdMuT3tfBj4QOuC0yB9XBO7ed2Q==
X-Received: by 2002:a17:902:e885:b0:295:9b3a:16c6 with SMTP id d9443c01a7336-2959b3a194cmr33416065ad.9.1762169947919;
        Mon, 03 Nov 2025 03:39:07 -0800 (PST)
Received: from [10.110.50.61] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3415c8b5cc1sm692101a91.18.2025.11.03.03.39.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Nov 2025 03:39:07 -0800 (PST)
Message-ID: <43a37f91-a492-4e00-8c38-f99edc477cb8@oss.qualcomm.com>
Date: Mon, 3 Nov 2025 03:39:00 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] media: iris: Define AV1-specific platform
 capabilities and properties
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel test robot <lkp@intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20251030-av1d_stateful_v3-v3-0-a1184de52fc4@oss.qualcomm.com>
 <20251030-av1d_stateful_v3-v3-4-a1184de52fc4@oss.qualcomm.com>
 <950010c2-4b86-7530-bb3a-c7997bfcef66@oss.qualcomm.com>
Content-Language: en-US
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
In-Reply-To: <950010c2-4b86-7530-bb3a-c7997bfcef66@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDEwNiBTYWx0ZWRfX0Cnl8eAN0jdD
 LCBhH0LMdaIldyKkN75Il6Kpvd3ABikY/IK74GXCVg6/v3Mp5Z0RZcDgj07g4csAYiriBjL6L9o
 +6zMmsqPk/SnmucYJUhgUu/a0Sx4hmfUcz/Op5+8dkkmD3r/RYXCCUC5rbAS43sUOkQs5x8lJZE
 PRuzUXL0ozOm3tZ6ypRLL9sJGaEnpTGDsmpHS4ZzBUKAHXd1hL50G8ENN0U8DxQbElYiFhyz1Fc
 xgOzACMEFwMVCRouVOns58oGz5qF9az4004zSEVk6D4WjuDcEPnYE0RNBYtdYf/X9k0Wy5zCtE4
 eszIBbiM/eUaaj16R4UiY2y5Z8P56B2p+486TgLYSoV4HA0dXkMfTsMjPBP6dqAzR5Rgf7PdQYR
 XzO+rgv1zOEBTuCKD2ka3GINFOalEg==
X-Authority-Analysis: v=2.4 cv=EszfbCcA c=1 sm=1 tr=0 ts=6908945d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=Fc6LZXL3woBgcE4gZnkA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: LrspPCUd4lzgfhel6lWzzeuD41lyyf_G
X-Proofpoint-ORIG-GUID: LrspPCUd4lzgfhel6lWzzeuD41lyyf_G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_01,2025-11-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511030106


On 10/31/2025 12:07 AM, Dikshita Agarwal wrote:
>
> On 10/30/2025 12:30 PM, Deepa Guthyappa Madivalara wrote:
>> Defining platform specific capabilities specific to AV1 decoder.
>> Set and subscribe to manadatory properties to firmware for AV1.
>>
>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
>> ---
>>   drivers/media/platform/qcom/iris/iris_buffer.h     |   1 +
>>   drivers/media/platform/qcom/iris/iris_ctrls.c      |   8 ++
>>   drivers/media/platform/qcom/iris/iris_hfi_common.h |   3 +
>>   .../platform/qcom/iris/iris_hfi_gen2_command.c     |  94 ++++++++++++++-
>>   .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  10 +-
>>   .../platform/qcom/iris/iris_hfi_gen2_response.c    |  22 ++++
>>   .../platform/qcom/iris/iris_platform_common.h      |  13 ++
>>   .../media/platform/qcom/iris/iris_platform_gen2.c  | 133 ++++++++++++++++++++-
>>   drivers/media/platform/qcom/iris/iris_vidc.c       |   1 +
>>   9 files changed, 279 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.h b/drivers/media/platform/qcom/iris/iris_buffer.h
>> index 325d30fce5c99185b61ff989fbfd4de9a56762b2..5ef365d9236c7cbdee24a4614789b3191881968b 100644
>> --- a/drivers/media/platform/qcom/iris/iris_buffer.h
>> +++ b/drivers/media/platform/qcom/iris/iris_buffer.h
>> @@ -42,6 +42,7 @@ enum iris_buffer_type {
>>   	BUF_SCRATCH_1,
>>   	BUF_SCRATCH_2,
>>   	BUF_VPSS,
>> +	BUF_PARTIAL,
>>   	BUF_TYPE_MAX,
>>   };
>>   
>> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
>> index 754a5ad718bc37630bb861012301df7a2e7342a1..620c7e1bd273e25febd8ca70dd1dcfb0b862692b 100644
>> --- a/drivers/media/platform/qcom/iris/iris_ctrls.c
>> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
>> @@ -98,6 +98,10 @@ static enum platform_inst_fw_cap_type iris_get_cap_id(u32 id)
>>   		return B_FRAME_QP_H264;
>>   	case V4L2_CID_MPEG_VIDEO_HEVC_B_FRAME_QP:
>>   		return B_FRAME_QP_HEVC;
>> +	case V4L2_CID_MPEG_VIDEO_AV1_PROFILE:
>> +		return PROFILE_AV1;
>> +	case V4L2_CID_MPEG_VIDEO_AV1_LEVEL:
>> +		return LEVEL_AV1;
>>   	default:
>>   		return INST_FW_CAP_MAX;
>>   	}
>> @@ -185,6 +189,10 @@ static u32 iris_get_v4l2_id(enum platform_inst_fw_cap_type cap_id)
>>   		return V4L2_CID_MPEG_VIDEO_H264_B_FRAME_QP;
>>   	case B_FRAME_QP_HEVC:
>>   		return V4L2_CID_MPEG_VIDEO_HEVC_B_FRAME_QP;
>> +	case PROFILE_AV1:
>> +		return V4L2_CID_MPEG_VIDEO_AV1_PROFILE;
>> +	case LEVEL_AV1:
>> +		return V4L2_CID_MPEG_VIDEO_AV1_LEVEL;
>>   	default:
>>   		return 0;
>>   	}
>> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.h b/drivers/media/platform/qcom/iris/iris_hfi_common.h
>> index b51471fb32c70acee44c37f8e9dce0c6bc0b6ccc..3edb5ae582b49bea2e2408c4a5cfc0a742adc05f 100644
>> --- a/drivers/media/platform/qcom/iris/iris_hfi_common.h
>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_common.h
>> @@ -141,6 +141,9 @@ struct hfi_subscription_params {
>>   	u32	profile;
>>   	u32	level;
>>   	u32	tier;
>> +	u32	drap;
>> +	u32	film_grain;
>> +	u32	super_block;
>>   };
>>   
>>   u32 iris_hfi_get_v4l2_color_primaries(u32 hfi_primaries);
>> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
>> index 6a772db2ec33fb002d8884753a41dc98b3a8439d..ee99ba206b64bb3367d0a1cdd7634e3241f9ed83 100644
>> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
>> @@ -10,6 +10,7 @@
>>   
>>   #define UNSPECIFIED_COLOR_FORMAT 5
>>   #define NUM_SYS_INIT_PACKETS 8
>> +#define NUM_COMV_AV1 18
>>   
>>   #define SYS_INIT_PKT_SIZE (sizeof(struct iris_hfi_header) + \
>>   	NUM_SYS_INIT_PACKETS * (sizeof(struct iris_hfi_packet) + sizeof(u32)))
>> @@ -121,6 +122,7 @@ static u32 iris_hfi_gen2_get_port_from_buf_type(struct iris_inst *inst,
>>   		case BUF_COMV:
>>   		case BUF_NON_COMV:
>>   		case BUF_LINE:
>> +		case BUF_PARTIAL:
>>   			return HFI_PORT_BITSTREAM;
>>   		case BUF_OUTPUT:
>>   		case BUF_DPB:
>> @@ -380,6 +382,9 @@ static int iris_hfi_gen2_set_profile(struct iris_inst *inst, u32 plane)
>>   	case V4L2_PIX_FMT_H264:
>>   		profile = inst->fw_caps[PROFILE_H264].value;
>>   		break;
>> +	case V4L2_PIX_FMT_AV1:
>> +		profile = inst->fw_caps[PROFILE_AV1].value;
>> +		break;
>>   	}
>>   
>>   	inst_hfi_gen2->src_subcr_params.profile = profile;
>> @@ -409,6 +414,9 @@ static int iris_hfi_gen2_set_level(struct iris_inst *inst, u32 plane)
>>   	case V4L2_PIX_FMT_H264:
>>   		level = inst->fw_caps[LEVEL_H264].value;
>>   		break;
>> +	case V4L2_PIX_FMT_AV1:
>> +		level = inst->fw_caps[LEVEL_AV1].value;
>> +		break;
>>   	}
>>   
>>   	inst_hfi_gen2->src_subcr_params.level = level;
>> @@ -496,10 +504,12 @@ static int iris_hfi_gen2_set_linear_stride_scanline(struct iris_inst *inst, u32
>>   
>>   static int iris_hfi_gen2_set_tier(struct iris_inst *inst, u32 plane)
>>   {
>> -	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
>>   	u32 port = iris_hfi_gen2_get_port(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
>> +	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
>>   	u32 tier = inst->fw_caps[TIER].value;
>>   
>> +	tier = (inst->codec == V4L2_PIX_FMT_AV1) ? inst->fw_caps[TIER_AV1].value :
>> +							inst->fw_caps[TIER].value;
>>   	inst_hfi_gen2->src_subcr_params.tier = tier;
>>   
>>   	return iris_hfi_gen2_session_set_property(inst,
>> @@ -525,6 +535,40 @@ static int iris_hfi_gen2_set_frame_rate(struct iris_inst *inst, u32 plane)
>>   						  sizeof(u32));
>>   }
>>   
>> +static int iris_hfi_gen2_set_film_grain(struct iris_inst *inst, u32 plane)
>> +{
>> +	u32 port = iris_hfi_gen2_get_port(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
>> +	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
>> +	u32 film_grain = inst->fw_caps[FILM_GRAIN].value;
>> +
>> +	inst_hfi_gen2->src_subcr_params.film_grain = film_grain;
>> +
>> +	return iris_hfi_gen2_session_set_property(inst,
>> +						  HFI_PROP_AV1_FILM_GRAIN_PRESENT,
>> +						  HFI_HOST_FLAGS_NONE,
>> +						  port,
>> +						  HFI_PAYLOAD_U32_ENUM,
>> +						  &film_grain,
>> +						  sizeof(u32));
>> +}
>> +
>> +static int iris_hfi_gen2_set_super_block(struct iris_inst *inst, u32 plane)
>> +{
>> +	u32 port = iris_hfi_gen2_get_port(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
>> +	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
>> +	u32 super_block = inst->fw_caps[SUPER_BLOCK].value;
>> +
>> +	inst_hfi_gen2->src_subcr_params.super_block = super_block;
>> +
>> +	return iris_hfi_gen2_session_set_property(inst,
>> +						  HFI_PROP_AV1_SUPER_BLOCK_ENABLED,
>> +						  HFI_HOST_FLAGS_NONE,
>> +						  port,
>> +						  HFI_PAYLOAD_U32_ENUM,
>> +						  &super_block,
>> +						  sizeof(u32));
>> +}
>> +
>>   static int iris_hfi_gen2_session_set_config_params(struct iris_inst *inst, u32 plane)
>>   {
>>   	const struct iris_platform_data *pdata = inst->core->iris_platform_data;
>> @@ -548,6 +592,9 @@ static int iris_hfi_gen2_session_set_config_params(struct iris_inst *inst, u32 p
>>   		{HFI_PROP_LINEAR_STRIDE_SCANLINE,     iris_hfi_gen2_set_linear_stride_scanline },
>>   		{HFI_PROP_TIER,                       iris_hfi_gen2_set_tier                   },
>>   		{HFI_PROP_FRAME_RATE,                 iris_hfi_gen2_set_frame_rate             },
>> +		{HFI_PROP_AV1_FILM_GRAIN_PRESENT,     iris_hfi_gen2_set_film_grain             },
>> +		{HFI_PROP_AV1_SUPER_BLOCK_ENABLED,    iris_hfi_gen2_set_super_block            },
>> +		{HFI_PROP_OPB_ENABLE,                 iris_hfi_gen2_set_opb_enable             },
>>   	};
>>   
>>   	if (inst->domain == DECODER) {
>> @@ -561,12 +608,20 @@ static int iris_hfi_gen2_session_set_config_params(struct iris_inst *inst, u32 p
>>   			} else if (inst->codec == V4L2_PIX_FMT_VP9) {
>>   				config_params = pdata->dec_input_config_params_vp9;
>>   				config_params_size = pdata->dec_input_config_params_vp9_size;
>> +			} else if (inst->codec == V4L2_PIX_FMT_AV1) {
>> +				config_params = pdata->dec_input_config_params_av1;
>> +				config_params_size = pdata->dec_input_config_params_av1_size;
>>   			} else {
>>   				return -EINVAL;
>>   			}
>>   		} else {
>> -			config_params = pdata->dec_output_config_params;
>> -			config_params_size = pdata->dec_output_config_params_size;
>> +			if (inst->codec == V4L2_PIX_FMT_AV1) {
>> +				config_params = pdata->dec_output_config_params_av1;
>> +				config_params_size = pdata->dec_output_config_params_av1_size;
>> +			} else {
>> +				config_params = pdata->dec_output_config_params;
>> +				config_params_size = pdata->dec_output_config_params_size;
>> +			}
>>   		}
>>   	} else {
>>   		if (V4L2_TYPE_IS_OUTPUT(plane)) {
>> @@ -615,6 +670,9 @@ static int iris_hfi_gen2_session_set_codec(struct iris_inst *inst)
>>   		break;
>>   	case V4L2_PIX_FMT_VP9:
>>   		codec = HFI_CODEC_DECODE_VP9;
>> +		break;
>> +	case V4L2_PIX_FMT_AV1:
>> +		codec = HFI_CODEC_DECODE_AV1;
>>   	}
>>   
>>   	iris_hfi_gen2_packet_session_property(inst,
>> @@ -780,6 +838,11 @@ static int iris_hfi_gen2_subscribe_change_param(struct iris_inst *inst, u32 plan
>>   		change_param_size =
>>   			core->iris_platform_data->dec_input_config_params_vp9_size;
>>   		break;
>> +	case V4L2_PIX_FMT_AV1:
>> +		change_param = core->iris_platform_data->dec_input_config_params_av1;
>> +		change_param_size =
>> +			core->iris_platform_data->dec_input_config_params_av1_size;
>> +		break;
>>   	}
>>   
>>   	payload[0] = HFI_MODE_PORT_SETTINGS_CHANGE;
>> @@ -862,6 +925,16 @@ static int iris_hfi_gen2_subscribe_change_param(struct iris_inst *inst, u32 plan
>>   				payload_size = sizeof(u32);
>>   				payload_type = HFI_PAYLOAD_U32;
>>   				break;
>> +			case HFI_PROP_AV1_FILM_GRAIN_PRESENT:
>> +				payload[0] = subsc_params.film_grain;
>> +				payload_size = sizeof(u32);
>> +				payload_type = HFI_PAYLOAD_U32;
>> +				break;
>> +			case HFI_PROP_AV1_SUPER_BLOCK_ENABLED:
>> +				payload[0] = subsc_params.super_block;
>> +				payload_size = sizeof(u32);
>> +				payload_type = HFI_PAYLOAD_U32;
>> +				break;
>>   			default:
>>   				prop_type = 0;
>>   				ret = -EINVAL;
>> @@ -917,6 +990,11 @@ static int iris_hfi_gen2_subscribe_property(struct iris_inst *inst, u32 plane)
>>   			subscribe_prop_size =
>>   				core->iris_platform_data->dec_output_prop_vp9_size;
>>   			break;
>> +		case V4L2_PIX_FMT_AV1:
>> +			subcribe_prop = core->iris_platform_data->dec_output_prop_av1;
>> +			subscribe_prop_size =
>> +				core->iris_platform_data->dec_output_prop_av1_size;
>> +			break;
>>   		}
>>   	}
>>   
>> @@ -1092,6 +1170,8 @@ static u32 iris_hfi_gen2_buf_type_from_driver(u32 domain, enum iris_buffer_type
>>   		return HFI_BUFFER_ARP;
>>   	case BUF_VPSS:
>>   		return HFI_BUFFER_VPSS;
>> +	case BUF_PARTIAL:
>> +		return HFI_BUFFER_PARTIAL_DATA;
>>   	default:
>>   		return 0;
>>   	}
>> @@ -1104,7 +1184,13 @@ static int iris_set_num_comv(struct iris_inst *inst)
>>   	u32 num_comv;
>>   
>>   	caps = core->iris_platform_data->inst_caps;
>> -	num_comv = caps->num_comv;
>> +
>> +	/*
>> +	 * AV1 needs more comv buffers than other codecs.
>> +	 * Update accordingly.
>> +	 */
>> +	num_comv = (inst->codec == V4L2_PIX_FMT_AV1) ?
>> +				NUM_COMV_AV1 : caps->num_comv;
>>   
>>   	return core->hfi_ops->session_set_property(inst,
>>   						   HFI_PROP_COMV_BUFFER_COUNT,
>> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
>> index 3d56f257bc5620aacec2bb7e11253dc7c83b7db9..12b4c6517bf094e3e98332a1b2b70ac5a349b863 100644
>> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
>> @@ -89,10 +89,18 @@ enum hfi_seq_header_mode {
>>   #define HFI_PROP_DEC_START_FROM_RAP_FRAME	0x03000169
>>   #define HFI_PROP_NO_OUTPUT			0x0300016a
>>   #define HFI_PROP_BUFFER_MARK			0x0300016c
>> +#define HFI_PROP_WORST_COMPRESSION_RATIO	0x03000174
>> +#define HFI_PROP_WORST_COMPLEXITY_FACTOR	0x03000175
>>   #define HFI_PROP_RAW_RESOLUTION		0x03000178
>>   #define HFI_PROP_TOTAL_PEAK_BITRATE		0x0300017C
>> -#define HFI_PROP_OPB_ENABLE			0x03000184
>> +#define HFI_PROP_AV1_FILM_GRAIN_PRESENT		0x03000180
>> +#define HFI_PROP_AV1_SUPER_BLOCK_ENABLED	0x03000181
>> +#define HFI_PROP_AV1_OP_POINT				0x03000182
>> +#define HFI_PROP_OPB_ENABLE                 0x03000184
>> +#define HFI_PROP_AV1_TILE_ROWS_COLUMNS      0x03000187
>> +#define HFI_PROP_AV1_DRAP_CONFIG            0x03000189
>>   #define HFI_PROP_COMV_BUFFER_COUNT		0x03000193
>> +#define HFI_PROP_AV1_UNIFORM_TILE_SPACING	0x03000197
>>   #define HFI_PROP_END				0x03FFFFFF
>>   
>>   #define HFI_SESSION_ERROR_BEGIN			0x04000000
>> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
>> index 2f1f118eae4f6462ab1aa1d16844b34e6e699f1e..eb3373f0ad4a1b26fb847db02449ec8d8cb3bdbb 100644
>> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
>> @@ -54,6 +54,8 @@ static u32 iris_hfi_gen2_buf_type_to_driver(struct iris_inst *inst,
>>   			return BUF_SCRATCH_2;
>>   	case HFI_BUFFER_PERSIST:
>>   		return BUF_PERSIST;
>> +	case HFI_BUFFER_PARTIAL_DATA:
>> +		return BUF_PARTIAL;
>>   	default:
>>   		return 0;
>>   	}
>> @@ -72,6 +74,7 @@ static bool iris_hfi_gen2_is_valid_hfi_buffer_type(u32 buffer_type)
>>   	case HFI_BUFFER_DPB:
>>   	case HFI_BUFFER_PERSIST:
>>   	case HFI_BUFFER_VPSS:
>> +	case HFI_BUFFER_PARTIAL_DATA:
>>   		return true;
>>   	default:
>>   		return false;
>> @@ -596,6 +599,10 @@ static void iris_hfi_gen2_read_input_subcr_params(struct iris_inst *inst)
>>   		inst->fw_caps[PROFILE_H264].value = subsc_params.profile;
>>   		inst->fw_caps[LEVEL_H264].value = subsc_params.level;
>>   		break;
>> +	case V4L2_PIX_FMT_AV1:
>> +		inst->fw_caps[PROFILE_AV1].value = subsc_params.profile;
>> +		inst->fw_caps[LEVEL_AV1].value = subsc_params.level;
>> +		break;
>>   	}
>>   
>>   	inst->fw_caps[POC].value = subsc_params.pic_order_cnt;
>> @@ -608,6 +615,11 @@ static void iris_hfi_gen2_read_input_subcr_params(struct iris_inst *inst)
>>   		iris_inst_change_state(inst, IRIS_INST_ERROR);
>>   	}
>>   
>> +	if (inst->codec == V4L2_PIX_FMT_AV1) {
>> +		inst->fw_caps[FILM_GRAIN].value = subsc_params.film_grain;
>> +		inst->fw_caps[SUPER_BLOCK].value = subsc_params.super_block;
>> +	}
>> +
>>   	inst->fw_min_count = subsc_params.fw_min_count;
>>   	inst->buffers[BUF_OUTPUT].min_count = iris_vpu_buf_count(inst, BUF_OUTPUT);
>>   	inst->buffers[BUF_OUTPUT].size = pixmp_op->plane_fmt[0].sizeimage;
>> @@ -711,6 +723,12 @@ static int iris_hfi_gen2_handle_session_property(struct iris_inst *inst,
>>   	case HFI_PROP_NO_OUTPUT:
>>   		inst_hfi_gen2->hfi_frame_info.no_output = 1;
>>   		break;
>> +	case HFI_PROP_AV1_FILM_GRAIN_PRESENT:
>> +		inst_hfi_gen2->src_subcr_params.film_grain = pkt->payload[0];
>> +		break;
>> +	case HFI_PROP_AV1_SUPER_BLOCK_ENABLED:
>> +		inst_hfi_gen2->src_subcr_params.super_block = pkt->payload[0];
>> +		break;
>>   	case HFI_PROP_QUALITY_MODE:
>>   	case HFI_PROP_STAGE:
>>   	case HFI_PROP_PIPE:
>> @@ -841,6 +859,10 @@ static void iris_hfi_gen2_init_src_change_param(struct iris_inst *inst)
>>   		subsc_params->profile = inst->fw_caps[PROFILE_H264].value;
>>   		subsc_params->level = inst->fw_caps[LEVEL_H264].value;
>>   		break;
>> +	case V4L2_PIX_FMT_AV1:
>> +		subsc_params->profile = inst->fw_caps[PROFILE_AV1].value;
>> +		subsc_params->level = inst->fw_caps[LEVEL_AV1].value;
>> +		break;
>>   	}
>>   
>>   	subsc_params->pic_order_cnt = inst->fw_caps[POC].value;
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
>> index 9aca70b4c0690f0d8d799e2a9976bd20d6bb8c94..19f0660f0388499ab71a1413b2c05f891bd5d511 100644
>> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
>> @@ -100,6 +100,13 @@ enum platform_inst_fw_cap_type {
>>   	LEVEL_H264,
>>   	LEVEL_HEVC,
>>   	LEVEL_VP9,
>> +	PROFILE_AV1,
>> +	LEVEL_AV1,
>> +	TIER_AV1,
>> +	DRAP,
>> +	FILM_GRAIN,
>> +	SUPER_BLOCK,
>> +	ENH_LAYER_COUNT,
>>   	INPUT_BUF_HOST_MAX_COUNT,
>>   	OUTPUT_BUF_HOST_MAX_COUNT,
>>   	STAGE,
>> @@ -237,8 +244,12 @@ struct iris_platform_data {
>>   	unsigned int dec_input_config_params_hevc_size;
>>   	const u32 *dec_input_config_params_vp9;
>>   	unsigned int dec_input_config_params_vp9_size;
>> +	const u32 *dec_input_config_params_av1;
>> +	unsigned int dec_input_config_params_av1_size;
>>   	const u32 *dec_output_config_params;
>>   	unsigned int dec_output_config_params_size;
>> +	const u32 *dec_output_config_params_av1;
>> +	unsigned int dec_output_config_params_av1_size;
>>   	const u32 *enc_input_config_params;
>>   	unsigned int enc_input_config_params_size;
>>   	const u32 *enc_output_config_params;
>> @@ -251,6 +262,8 @@ struct iris_platform_data {
>>   	unsigned int dec_output_prop_hevc_size;
>>   	const u32 *dec_output_prop_vp9;
>>   	unsigned int dec_output_prop_vp9_size;
>> +	const u32 *dec_output_prop_av1;
>> +	unsigned int dec_output_prop_av1_size;
>>   	const u32 *dec_ip_int_buf_tbl;
>>   	unsigned int dec_ip_int_buf_tbl_size;
>>   	const u32 *dec_op_int_buf_tbl;
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
>> index 3b61723dbf27e9ba8d427686e44cf048a0ab7c5b..9ac5541f528741e45b31634230da44d53012e659 100644
>> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
>> @@ -64,6 +64,16 @@ static struct platform_inst_fw_cap inst_fw_cap_sm8550_dec[] = {
>>   		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
>>   		.set = iris_set_u32_enum,
>>   	},
>> +	{
>> +		.cap_id = PROFILE_AV1,
>> +		.min = V4L2_MPEG_VIDEO_AV1_PROFILE_MAIN,
>> +		.max = V4L2_MPEG_VIDEO_AV1_PROFILE_MAIN,
>> +		.step_or_mask = BIT(V4L2_MPEG_VIDEO_AV1_PROFILE_MAIN),
>> +		.value = V4L2_MPEG_VIDEO_AV1_PROFILE_MAIN,
>> +		.hfi_id = HFI_PROP_PROFILE,
>> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
>> +		.set = iris_set_u32_enum,
>> +	},
>>   	{
>>   		.cap_id = PROFILE_VP9,
>>   		.min = V4L2_MPEG_VIDEO_VP9_PROFILE_0,
>> @@ -147,6 +157,33 @@ static struct platform_inst_fw_cap inst_fw_cap_sm8550_dec[] = {
>>   		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
>>   		.set = iris_set_u32_enum,
>>   	},
>> +	{
>> +		.cap_id = LEVEL_AV1,
>> +		.min = V4L2_MPEG_VIDEO_AV1_LEVEL_2_0,
>> +		.max = V4L2_MPEG_VIDEO_AV1_LEVEL_6_1,
>> +		.step_or_mask = BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_2_0) |
>> +				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_2_1) |
>> +				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_2_2) |
>> +				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_2_3) |
>> +				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_3_0) |
>> +				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_3_1) |
>> +				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_3_2) |
>> +				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_3_3) |
>> +				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_4_0) |
>> +				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_4_1) |
>> +				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_4_2) |
>> +				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_4_3) |
>> +				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_5_0) |
>> +				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_5_1) |
>> +				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_5_2) |
>> +				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_5_3) |
>> +				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_6_0) |
>> +				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_6_1),
>> +		.value = V4L2_MPEG_VIDEO_AV1_LEVEL_6_1,
>> +		.hfi_id = HFI_PROP_LEVEL,
>> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
>> +		.set = iris_set_u32_enum,
>> +	},
>>   	{
>>   		.cap_id = TIER,
>>   		.min = V4L2_MPEG_VIDEO_HEVC_TIER_MAIN,
>> @@ -158,6 +195,53 @@ static struct platform_inst_fw_cap inst_fw_cap_sm8550_dec[] = {
>>   		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
>>   		.set = iris_set_u32_enum,
>>   	},
>> +	{
>> +		.cap_id = TIER_AV1,
>> +		.min = 0,
>> +		.max = 1,
>> +		.step_or_mask = 1,
>> +		.value = 0,
>> +		.hfi_id = HFI_PROP_TIER,
>> +		.flags = CAP_FLAG_INPUT_PORT,
>> +		.set = iris_set_u32,
>> +	},
>> +	{
>> +		.cap_id = DRAP,
>> +		.min = 0,
>> +		.max = 1,
>> +		.step_or_mask = 1,
>> +		.value = 0,
>> +		.hfi_id = HFI_PROP_AV1_DRAP_CONFIG,
>> +		.flags = CAP_FLAG_INPUT_PORT,
>> +		.set = iris_set_u32,
>> +	},
>> +	{
>> +		.cap_id = FILM_GRAIN,
>> +		.min = 0,
>> +		.max = 1,
>> +		.step_or_mask = 1,
>> +		.value = 0,
>> +		.hfi_id = HFI_PROP_AV1_FILM_GRAIN_PRESENT,
>> +		.flags = CAP_FLAG_VOLATILE,
>> +	},
>> +	{
>> +		.cap_id = SUPER_BLOCK,
>> +		.min = 0,
>> +		.max = 1,
>> +		.step_or_mask = 1,
>> +		.value = 0,
>> +		.hfi_id = HFI_PROP_AV1_SUPER_BLOCK_ENABLED,
>> +	},
>> +	{
>> +		.cap_id = ENH_LAYER_COUNT,
>> +		.min = 0,
>> +		.max = 1,
>> +		.step_or_mask = 1,
>> +		.value = 0,
>> +		.hfi_id = HFI_PROP_AV1_OP_POINT,
>> +		.flags = CAP_FLAG_INPUT_PORT,
>> +		.set = iris_set_u32,
>> +	},
>>   	{
>>   		.cap_id = INPUT_BUF_HOST_MAX_COUNT,
>>   		.min = DEFAULT_MAX_HOST_BUF_COUNT,
>> @@ -701,6 +785,19 @@ static const u32 sm8550_vdec_input_config_param_vp9[] = {
>>   	HFI_PROP_LEVEL,
>>   };
>>   
>> +static const u32 sm8550_vdec_input_config_param_av1[] = {
>> +	HFI_PROP_BITSTREAM_RESOLUTION,
>> +	HFI_PROP_CROP_OFFSETS,
>> +	HFI_PROP_LUMA_CHROMA_BIT_DEPTH,
>> +	HFI_PROP_BUFFER_FW_MIN_OUTPUT_COUNT,
>> +	HFI_PROP_PROFILE,
>> +	HFI_PROP_LEVEL,
>> +	HFI_PROP_TIER,
>> +	HFI_PROP_AV1_FILM_GRAIN_PRESENT,
>> +	HFI_PROP_AV1_SUPER_BLOCK_ENABLED,
>> +	HFI_PROP_SIGNAL_COLOR_INFO,
>> +};
>> +
>>   static const u32 sm8550_venc_input_config_params[] = {
>>   	HFI_PROP_COLOR_FORMAT,
>>   	HFI_PROP_RAW_RESOLUTION,
>> @@ -715,6 +812,12 @@ static const u32 sm8550_vdec_output_config_params[] = {
>>   	HFI_PROP_LINEAR_STRIDE_SCANLINE,
>>   };
>>   
>> +static const u32 sm8550_vdec_output_config_param_av1[] = {
>> +	HFI_PROP_OPB_ENABLE,
>> +	HFI_PROP_COLOR_FORMAT,
>> +	HFI_PROP_LINEAR_STRIDE_SCANLINE,
>> +};
> why do you still need this new structure?
> it is same as sm8550_vdec_output_config_params, please reuse.
>
> Thanks,
> Dikshita
<ack>
>> +
>>   static const u32 sm8550_venc_output_config_params[] = {
>>   	HFI_PROP_BITSTREAM_RESOLUTION,
>>   	HFI_PROP_CROP_OFFSETS,
>> @@ -738,11 +841,18 @@ static const u32 sm8550_vdec_subscribe_output_properties_vp9[] = {
>>   	HFI_PROP_PICTURE_TYPE,
>>   };
>>   
>> +static const u32 sm8550_vdec_subscribe_output_properties_av1[] = {
>> +	HFI_PROP_PICTURE_TYPE,
>> +	HFI_PROP_WORST_COMPRESSION_RATIO,
>> +	HFI_PROP_WORST_COMPLEXITY_FACTOR,
>> +};
>> +
>>   static const u32 sm8550_dec_ip_int_buf_tbl[] = {
>>   	BUF_BIN,
>>   	BUF_COMV,
>>   	BUF_NON_COMV,
>>   	BUF_LINE,
>> +	BUF_PARTIAL,
>>   };
>>   
>>   static const u32 sm8550_dec_op_int_buf_tbl[] = {
>> @@ -807,11 +917,18 @@ struct iris_platform_data sm8550_data = {
>>   		sm8550_vdec_input_config_param_vp9,
>>   	.dec_input_config_params_vp9_size =
>>   		ARRAY_SIZE(sm8550_vdec_input_config_param_vp9),
>> +	.dec_input_config_params_av1 =
>> +		sm8550_vdec_input_config_param_av1,
>> +	.dec_input_config_params_av1_size =
>> +		ARRAY_SIZE(sm8550_vdec_input_config_param_av1),
>>   	.dec_output_config_params =
>>   		sm8550_vdec_output_config_params,
>>   	.dec_output_config_params_size =
>>   		ARRAY_SIZE(sm8550_vdec_output_config_params),
>> -
>> +	.dec_output_config_params_av1 =
>> +		sm8550_vdec_output_config_param_av1,
>> +	.dec_output_config_params_av1_size =
>> +		ARRAY_SIZE(sm8550_vdec_output_config_param_av1),
>>   	.enc_input_config_params =
>>   		sm8550_venc_input_config_params,
>>   	.enc_input_config_params_size =
>> @@ -832,6 +949,9 @@ struct iris_platform_data sm8550_data = {
>>   	.dec_output_prop_vp9 = sm8550_vdec_subscribe_output_properties_vp9,
>>   	.dec_output_prop_vp9_size =
>>   		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_vp9),
>> +	.dec_output_prop_av1 = sm8550_vdec_subscribe_output_properties_av1,
>> +	.dec_output_prop_av1_size =
>> +		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_av1),
>>   
>>   	.dec_ip_int_buf_tbl = sm8550_dec_ip_int_buf_tbl,
>>   	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_ip_int_buf_tbl),
>> @@ -901,10 +1021,18 @@ struct iris_platform_data sm8650_data = {
>>   		sm8550_vdec_input_config_param_vp9,
>>   	.dec_input_config_params_vp9_size =
>>   		ARRAY_SIZE(sm8550_vdec_input_config_param_vp9),
>> +	.dec_input_config_params_av1 =
>> +		sm8550_vdec_input_config_param_av1,
>> +	.dec_input_config_params_av1_size =
>> +		ARRAY_SIZE(sm8550_vdec_input_config_param_av1),
>>   	.dec_output_config_params =
>>   		sm8550_vdec_output_config_params,
>>   	.dec_output_config_params_size =
>>   		ARRAY_SIZE(sm8550_vdec_output_config_params),
>> +	.dec_output_config_params_av1 =
>> +		sm8550_vdec_output_config_param_av1,
>> +	.dec_output_config_params_av1_size =
>> +		ARRAY_SIZE(sm8550_vdec_output_config_param_av1),
>>   
>>   	.enc_input_config_params =
>>   		sm8550_venc_input_config_params,
>> @@ -926,6 +1054,9 @@ struct iris_platform_data sm8650_data = {
>>   	.dec_output_prop_vp9 = sm8550_vdec_subscribe_output_properties_vp9,
>>   	.dec_output_prop_vp9_size =
>>   		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_vp9),
>> +	.dec_output_prop_av1 = sm8550_vdec_subscribe_output_properties_av1,
>> +	.dec_output_prop_av1_size =
>> +		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_av1),
>>   
>>   	.dec_ip_int_buf_tbl = sm8550_dec_ip_int_buf_tbl,
>>   	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_ip_int_buf_tbl),
>> diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
>> index d38d0f6961cd5cb9929e2aecbec7353dcc2d4a7d..05eec18f937a51d3c081d0f98a8ffa6bbd30d166 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vidc.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vidc.c
>> @@ -178,6 +178,7 @@ int iris_open(struct file *filp)
>>   	INIT_LIST_HEAD(&inst->buffers[BUF_SCRATCH_1].list);
>>   	INIT_LIST_HEAD(&inst->buffers[BUF_SCRATCH_2].list);
>>   	INIT_LIST_HEAD(&inst->buffers[BUF_VPSS].list);
>> +	INIT_LIST_HEAD(&inst->buffers[BUF_PARTIAL].list);
>>   	init_completion(&inst->completion);
>>   	init_completion(&inst->flush_completion);
>>   
>>

