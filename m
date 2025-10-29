Return-Path: <linux-arm-msm+bounces-79325-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A20C181A3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 03:57:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A05161B257B0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 02:57:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D71DA2D5A16;
	Wed, 29 Oct 2025 02:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NqJH8JT3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g5uVpq2j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32D812EBDD3
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 02:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761706620; cv=none; b=e6TwIUzl1bI44JH+hnsqTeVgdrBY2pZMPIGRSGfFrw9xuFsfS/9bs3g/fF61bGhErTbOTadZ6n06rlqb0txrwvi1wHBkhPSjw/xrHKRNL6TIQw4hmAEFpacIWbRT3U0bMP0KLLER/Ko+vjfKeFxpJHXm8g+6HgBXpihQHgWw+50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761706620; c=relaxed/simple;
	bh=9md1Uzr7kTavHcX3slny0w5bBbv35Mil8tgVBD2J4YE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EjB62EgY4/YlWKd+Yz+KH6eFbxoGlmoFagLAkmlmwpfgOwOdpk4VqVWxz+rz7GSx1q4rzWMja9WKNM48pE2MD8KefYkBIvOY8F847TwjwtnwWgw+9pbTQXDmxbvBEtbkIJ9DIiXOxAJ0eB1v/agMbzVwOBluMMl0LdNbmwbiOg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NqJH8JT3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g5uVpq2j; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59SJlRFY2622308
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 02:56:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9/9oFapWEm7vhS2CAn8+I4Tp/daljkVATwiiAmLYAZI=; b=NqJH8JT3uhneaCt4
	gpQNSN6U0JhsTD5IxP9ujEwTwn0faBl0Gzmk9ZLbPI55vZCUpZjsv9tSUN0xL02l
	V/bqn4zl17ugSF4xb5BgfEh7ZAFJA6BfTJ/27QdpK48ZnbLlEr95/CQTy+oEHUX9
	wxIHGQAmcC6eNlk7bm1G3Y3Hb8O0Zwfp7UEmLlbQ6uzYdpmh8eL3vwV/L+LgY63j
	Qf1Rz0qIEmvro7ILoS0IcaS0RvvTzsxh74IZ9thH9/5EEygBQ7An+AQLOEHpI+my
	MzjlKF8gRIgM/BbymCwNHXcPWgPIBd+WH4YSoQiBtXEgQBytjzc453kYYGVPnrXJ
	+C9aQQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a10xq4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 02:56:57 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b67c43db504so1541127a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 19:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761706617; x=1762311417; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9/9oFapWEm7vhS2CAn8+I4Tp/daljkVATwiiAmLYAZI=;
        b=g5uVpq2jd+i/9i4sEnZa7NTy0G5uTSeR9QKS11C+1E7YVBA4Kc3ji//FkhOesQPnG2
         Ud36MVkB/9yTDAkhWUQkR7ITD7ti7C8jXUknoOtKFZQD/DTCaCk0WhdSOPLcxLLbkY7X
         zC+2bYM3rnLjPHdQR0PHZwYEfenoosBjkiQ5HK0cn2E4Lbzf9pobajkHVVAaIeTAhxRw
         7L/0nEQ5VyHLQvIwQJw+NkqAs7m7NPLmuNXmYxOUROpnnBTMRivs7GPc4zTowAmaAVw5
         jmP8LBzPGO4wXZUGBaekQDmx1MJweCVp2Rkpj2+Ne48rf9n+3GfTOjzl6HYvg77wtY5/
         Z2cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761706617; x=1762311417;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9/9oFapWEm7vhS2CAn8+I4Tp/daljkVATwiiAmLYAZI=;
        b=QV0erfIWZQW+ez6mS7k9+DpatWGV4PKi17i5osu20qlxvVm8ELRj3lvNVwYa00ZCv3
         2PcDDC6HuDIJFNcEQyl4TslCI/wieDsjsErIZQmwr+Z52BBxL7ruVJZJKsURteBMAivF
         G3qxBfBrDRKnNwMraLBucO0J7xspE144AVbJ/xomlcL73ZwQMF5VYPSoh2eMpMELqoCJ
         0eMYWfQmLG70NgF90cNhAmzlgD5HSAfzC8etSmL1tjT6Uah2vC42FpTRMTwxzZ0BWytB
         ILSJ5YGrHDeUCQzDcabDDbw0jgKvJwJhgJgpAeIJYaP5jOjcqP9ANVlbIPKw6mugOr9O
         cc1A==
X-Forwarded-Encrypted: i=1; AJvYcCW8gTDKFm5XF7beNzvpY1KYV7RMuxvF6xPUpwaq2b8CZxku1VE+vo3MfYOLSSfLAnadJZsfyTwMwQRCFthf@vger.kernel.org
X-Gm-Message-State: AOJu0YxIDQzaNEtUjBSYW+ASAf7yDHDcMy6U9V7YlrbJHpFJIO452ThX
	j/3YWWSWlvCTaG64M4WWEkiUWGR0yiSzrHUvLDxFpx37Y/W1Ahy6Xo2jJKMlvCNYtUsCIVEW98X
	0DJj5p14OOgYnr6dv5WDWqMyk1LsR45h2v70JG2hoHzBL6HQ7am3aNCt7bUzHxTYl7f9i
X-Gm-Gg: ASbGncs+cbFSwSkw+ePurFCEQq77kHmdvl5pki2pSyA1jwU8IymgPcF79d5HahZzHFB
	7gvy4O4D9o3mizR1gJNDk1lvHV0gCK21mhANTgO20zl1Y5Wv+m7VmtxHFBROkJkHjg1dvHWfQ2d
	gtD+sW7RZW/AaPB2TjN3hCrkGBD5ux54Z2QTDDg1hsFuSHUyEj40oMj6ggoMRilX4qHlf9aO6Ng
	o2ZAEwwDL5xEM1oiGpmP/a+tQQn6oXhk8cqVPQJt0zvJfMXY08wGVaf3v+CzSEfo4/NyRTadpB1
	BvU6onYa788dGTRAy6fsyKSLK+Ui+K2ogXWCYVujPNpJpnq5K6smYPZrdXgJu8v/e0gd4D9RqRm
	DnMGta87GA/eiKNg1aqCyJWWh0PUKgqZW0ORxem0WJQwNyjkvqd+WjSigmD5IJw==
X-Received: by 2002:a05:6a00:2daa:b0:7a2:757f:6f6b with SMTP id d2e1a72fcca58-7a4e57e4207mr843090b3a.7.1761706616958;
        Tue, 28 Oct 2025 19:56:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbf5BxO+16nSHXaW14qJKmHt8+BvGiXFbDgsl0Eu4/6mECXc6p15tRZWj8hVR8t6WSLhNWFg==
X-Received: by 2002:a05:6a00:2daa:b0:7a2:757f:6f6b with SMTP id d2e1a72fcca58-7a4e57e4207mr843075b3a.7.1761706616383;
        Tue, 28 Oct 2025 19:56:56 -0700 (PDT)
Received: from [10.110.87.192] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a427684bddsm9990852b3a.31.2025.10.28.19.56.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Oct 2025 19:56:56 -0700 (PDT)
Message-ID: <59402591-f657-4b54-954a-4bf08d92d793@oss.qualcomm.com>
Date: Tue, 28 Oct 2025 19:56:49 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] media: iris: Add internal buffer calculation for
 AV1 decoder
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <20251017-av1_irisdecoder-v2-0-964a5478139e@oss.qualcomm.com>
 <20251017-av1_irisdecoder-v2-5-964a5478139e@oss.qualcomm.com>
 <36543c8c-5a69-56ed-7d96-a3f5d7396b89@oss.qualcomm.com>
Content-Language: en-US
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
In-Reply-To: <36543c8c-5a69-56ed-7d96-a3f5d7396b89@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: fbAKRkRhFEi2JUrJyBKxcLuKOYJ-u83-
X-Proofpoint-ORIG-GUID: fbAKRkRhFEi2JUrJyBKxcLuKOYJ-u83-
X-Authority-Analysis: v=2.4 cv=A5dh/qWG c=1 sm=1 tr=0 ts=6901827a cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=3Uohc88nFzBvfxjGL6AA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDAyMSBTYWx0ZWRfX5rpqOCjQsK6H
 7QFXjgIBeAfXPopXXFoyjvIT78Mj8NawcSJJ/1hP570fPwDZDAdsqnJIdU7902PWVBqStg55n2P
 HQENbad7jQIqiPmZHAPx/5Uc6y/Gr4T1giv4bQPZG+1+YV/bg+ywm33oVqZg3S4FsWWY/yzRGhG
 h0qdwd/y6Tns4ZrM2aJs3Av+VNKn0LUyyKLB262XtbuQRjls5JtN19qNNV8pvOTm16ALN4OeZ0b
 mFSHDqgbiZv65hJBB5UdPQD2/WA54QWJcrcBLP6KuDWdb8uqcN7euoKIW2wStutdjy7lFh54B3e
 wnY/s2vyryZ6ZiwYTPjnvoFwhx8jmC+Ro++gtrdFC+TPD6WxtXj/uvBcxCk5oj+t5ufjJsFX5vy
 LyBQAnrz4MbalfhYMHUbCDsyk/wE0g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-29_01,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290021


On 10/27/2025 2:07 AM, Dikshita Agarwal wrote:
>
> On 10/18/2025 12:05 AM, Deepa Guthyappa Madivalara wrote:
>> Implement internal buffer count and size calculations for AV1 decoder
>> for all the buffer types required by the AV1 decoder, including BIN,
>> COMV, PERSIST, LINE, and PARTIAL.
>>
>> This ensures the hardware decoder has properly allocated memory for AV1
>> decoding operations, enabling correct AV1 video playback.
>>
>> Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
>> ---
>>   drivers/media/platform/qcom/iris/iris_buffer.h     |   1 +
>>   drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 298 ++++++++++++++++++++-
>>   drivers/media/platform/qcom/iris/iris_vpu_buffer.h | 116 ++++++++
>>   3 files changed, 411 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.h b/drivers/media/platform/qcom/iris/iris_buffer.h
>> index 5ef365d9236c7cbdee24a4614789b3191881968b..75bb767761824c4c02e0df9b765896cc093be333 100644
>> --- a/drivers/media/platform/qcom/iris/iris_buffer.h
>> +++ b/drivers/media/platform/qcom/iris/iris_buffer.h
>> @@ -27,6 +27,7 @@ struct iris_inst;
>>    * @BUF_SCRATCH_1: buffer to store decoding/encoding context data for HW
>>    * @BUF_SCRATCH_2: buffer to store encoding context data for HW
>>    * @BUF_VPSS: buffer to store VPSS context data for HW
>> + * @BUF_PARTIAL: buffer for AV1 IBC data
>>    * @BUF_TYPE_MAX: max buffer types
>>    */
>>   enum iris_buffer_type {
>> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
>> index 4463be05ce165adef6b152eb0c155d2e6a7b3c36..e03ae7cfc9551dd2450b27d5d19ef1d23bba4c99 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
>> @@ -9,6 +9,17 @@
>>   #include "iris_hfi_gen2_defines.h"
>>   
> <snip>
>
>>   static u32 iris_vpu_dec_bin_size(struct iris_inst *inst)
>>   {
>>   	u32 num_vpp_pipes = inst->core->iris_platform_data->num_vpp_pipe;
>> @@ -472,6 +718,8 @@ static u32 iris_vpu_dec_bin_size(struct iris_inst *inst)
>>   		return hfi_buffer_bin_h265d(width, height, num_vpp_pipes);
>>   	else if (inst->codec == V4L2_PIX_FMT_VP9)
>>   		return hfi_buffer_bin_vp9d(width, height, num_vpp_pipes);
>> +	else if (inst->codec == V4L2_PIX_FMT_AV1)
>> +		return hfi_buffer_bin_av1d(width, height, num_vpp_pipes);
>>   
>>   	return 0;
>>   }
>> @@ -487,18 +735,33 @@ static u32 iris_vpu_dec_comv_size(struct iris_inst *inst)
>>   		return hfi_buffer_comv_h264d(width, height, num_comv);
>>   	else if (inst->codec == V4L2_PIX_FMT_HEVC)
>>   		return hfi_buffer_comv_h265d(width, height, num_comv);
>> -
>> +	else if (inst->codec == V4L2_PIX_FMT_AV1) {
>> +		if (inst->fw_caps[DRAP].value)
>> +			return 0;
>> +		else
>> +			return hfi_buffer_comv_av1d(width, height, num_comv);
>> +	}
> newline is required before return.
<ack>
>
>>   	return 0;
>>   }
>>   
> <snip>
>
>> +static u32 iris_vpu_dec_partial_size(struct iris_inst *inst)
>> +{
>> +	struct v4l2_format *f = inst->fmt_src;
>> +	u32 height = f->fmt.pix_mp.height;
>> +	u32 width = f->fmt.pix_mp.width;
>> +
>> +	return hfi_buffer_ibc_av1d(width, height);
>> +}
>> +
>>   static inline
>>   u32 hfi_buffer_comv_enc(u32 frame_width, u32 frame_height, u32 lcu_size,
>>   			u32 num_recon, u32 standard)
>> @@ -1414,7 +1688,9 @@ static int output_min_count(struct iris_inst *inst)
>>   
>>   	/* fw_min_count > 0 indicates reconfig event has already arrived */
>>   	if (inst->fw_min_count) {
>> -		if (iris_split_mode_enabled(inst) && inst->codec == V4L2_PIX_FMT_VP9)
>> +		if (iris_split_mode_enabled(inst) &&
>> +		    (inst->codec == V4L2_PIX_FMT_VP9 ||
>> +		     inst->codec == V4L2_PIX_FMT_VP9))
> This change doesn't make any sense, do you mean V4L2_PIX_FMT_AV1?
Yes, updated in v3
>
>>   			return min_t(u32, 4, inst->fw_min_count);
>>   		else
>>   			return inst->fw_min_count;
>> @@ -1422,6 +1698,8 @@ static int output_min_count(struct iris_inst *inst)
>>   
>>   	if (inst->codec == V4L2_PIX_FMT_VP9)
>>   		output_min_count = 9;
>> +	else if (inst->codec == V4L2_PIX_FMT_AV1)
>> +		output_min_count = 11;
>>   
>>   	return output_min_count;
>>   }
>> @@ -1444,6 +1722,7 @@ u32 iris_vpu_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_type)
>>   		{BUF_PERSIST,     iris_vpu_dec_persist_size         },
>>   		{BUF_DPB,         iris_vpu_dec_dpb_size             },
>>   		{BUF_SCRATCH_1,   iris_vpu_dec_scratch1_size        },
>> +		{BUF_PARTIAL,     iris_vpu_dec_partial_size         },
>>   	};
>>   

