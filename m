Return-Path: <linux-arm-msm+bounces-88545-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 255B1D1231D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 12:13:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A49523088DE9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 11:09:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3858435581D;
	Mon, 12 Jan 2026 11:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HHVPFa52";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YckibfU+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D128D28F948
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 11:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768216167; cv=none; b=tTrqrvWKV0h2h5KPgmeYS9OeYsFfi2AMtYoWBIv+E5mRXHy+S2EOS2VFWyn+LQdnsV4/2fNvdC1vooNTpQBPz4amoWvEmu6K7MmvY/iv7VsfxWtUMFzhnA5Vh1D0qb4J4daeXMHO5IAgmDHxxsdae1iteml5BNU1bgnTufj5jV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768216167; c=relaxed/simple;
	bh=F9fnjsc7wxE5WUOT2dZuyDtrByNpEJpdIy9Qs2a2Sxs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pgTHv6KTmxjtZfReLyooGIQoNRYRj1hDM1CnEckA9Npult4W+ho/Y4/Jxr+be+HsxdhHlqTc/rrZ7emvMnvIdtHYQrgNmYfPIaZWhzOAz9KfNHems/B1JwfFSqfwSDl/f9qa3qkhy3AB/JnQVNOqmUB/EZOBd7SCWmeHApVTYTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HHVPFa52; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YckibfU+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C8ruEs675944
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 11:09:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AbQcZeIoGK5ueJWkw4WLyp3e/HKxCl2Hby7gRumzRTE=; b=HHVPFa52SYPxb6dP
	RKxUYaEPRQumq1p9TG80J1/z+kVvpHKr+EQGdmo2JHVT/Ug0gtFLRmtnpMYyq1cN
	uF6IT1hNaNVMvvdpnrE6I6QUY4X9MtsbWUwTSHk78UdV36Xqfc6cv+exhWT7gpvb
	W5xcor+qoCUxzi9D43gJVumhsXHNo1In2n72Nrf/iMldWdES4QJN5zkrevB8TxzF
	tteFXojfwavZbVuYah+p03tRG7L4QAQcRAllPwI6OOyFAwZJf6a5muU3rbvuXClV
	CmUUMF4h+co0txkC5sD6Mhd3qMATfoFgcYTZedw9rnpLqW0yJc8wf8vvy8vTg/Fn
	USseRQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bmwur8dkb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 11:09:25 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b630b4d8d52so4470136a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 03:09:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768216165; x=1768820965; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AbQcZeIoGK5ueJWkw4WLyp3e/HKxCl2Hby7gRumzRTE=;
        b=YckibfU+BPFrZGAZuaD4cNsF5zgQXsA4CBNyjb4TTL8oq1RHNARkapsxZ+hdy6wMgC
         9Wa64W85TYBeUaZRYWDY8zbbRh3H5vZ65YBFZY6iEGudu/VO2s+GXO5G5AJ8B9lNtnnV
         cHr4dU0lzVTtXnuic9e6zQSZsZh5bvPq0B6j67+VseYQYQcHMXKWmEVvxgt9HAz6S+ih
         a3gfflygSQUBem6OYDwgbeimbPXgiPFVVxSR3vvrH+w1aVljDncllWi3BNJLrBZOWRyG
         RsxdWH72xSi8LWXBZ33S/HSUHVk5pMmzbg5jAUi+aM1dY8sa6KLvrB8P8ujyV5GJucFy
         cI8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768216165; x=1768820965;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AbQcZeIoGK5ueJWkw4WLyp3e/HKxCl2Hby7gRumzRTE=;
        b=a1JaSPB18AmzAB9VmHDt+E3evkVKhSDgPP+1dtC8IQRq6e0of/WgfOj0h91hjdU7YN
         tnzt1N36QpuYqLQS2miZMe9O7ytodkzGfGZLeAZJJGTTct8wbzv8McwIhIElQRf92rw8
         HaH+okph/D0XLPYOzQAG2VQ1RQOhFfnBjdWm3wgboRrdIO+xGN+yegUItcvR3z/6YxMO
         9q9hP+rXmsFXL4iBIOeYSNRVsYPyGdJkv+TsznoHRlv9Q2uuq3adQZkrjGNzH1iBIQg2
         K8VSHgG1dzfeK3xV3Zayp2JngAWbQTd14aoTEKLPVPFt/wX0hmOV2POINPP4AhKay+Nu
         Ln1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWSoP2yFznrAtzfdqQJsS7aH93t8CngaMr4l+rA/ry2N6rei6LZgsGmQOTzULdAFqMd7IOQHzhy9iuyDKLL@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8m+8LoOZlTyLu1bi/QjokSuDIyfTvMlEtQ7NLMG98EnguvJFl
	na3UUVwqcm2hWUMC7GzfaRPnPmC3v5nCeJmg688ac3uKXV+vD398Oj+rwzEM1RWY6FUR6VZxDFj
	Ezx8TmByvSvy9hiEAhWg/vgeaTQoKsLFSMdYjJ299SK0lEpqC/+OdYTB/+32sgoKVzkMf
X-Gm-Gg: AY/fxX4a4PQqpqNSlXI9j1RTkdB14Yu9V4Mtmu3IFL5YN5U9BQNIfgUJplMhwSRH2zB
	lebBInFeF/rD6VmZ4sVYHtHCLNg+HjrGe2uWWE7X9sMSZyWAM/lNCckWkTu0zYbq48zJ18OaSOf
	3FCLKBsCxOtFBe60ch/0R25fYVCFXP+pPzc4y5tAMGFBPW0VJmiXuL2nVNtwfx7ipP69DOi3YHB
	7XQsHswMjat/j4l/+NqvtILYkyhSzohBfpLpYdwZmpd9nukLoByLgXcUwBa9wUMUGkqYSg+6RGJ
	6klFI7gGBWPezClZplQ7fEkVdPo7BKCaODvKVma8MG1aY7lbeyp0/D95Yi+zn+ccuzGYFy4EZO4
	4Y4Pgx6KSKESTXYVTRcEA/GrPEov3JMnU44fKnKuzvpg=
X-Received: by 2002:a05:6a00:f92:b0:81f:52d9:5fe with SMTP id d2e1a72fcca58-81f52d90cc0mr3092840b3a.33.1768216164533;
        Mon, 12 Jan 2026 03:09:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE3DqqiVAGDuMadEVug6aPn1DZj+wCnH5DiJ7gmZozwb6jXrl8SRz3fKLb98e1+Nt+IkrwPtA==
X-Received: by 2002:a05:6a00:f92:b0:81f:52d9:5fe with SMTP id d2e1a72fcca58-81f52d90cc0mr3092818b3a.33.1768216164086;
        Mon, 12 Jan 2026 03:09:24 -0800 (PST)
Received: from [192.168.0.171] ([49.205.249.58])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81e4c0f183bsm8967543b3a.42.2026.01.12.03.09.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 03:09:23 -0800 (PST)
Message-ID: <f443d903-b69e-4e59-8366-e1970dca913b@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 16:39:18 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] media: iris: gen2: Add sanity check for session
 stop
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20251229-iris-fixes-v2-0-6dce2063d782@oss.qualcomm.com>
 <20251229-iris-fixes-v2-5-6dce2063d782@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20251229-iris-fixes-v2-5-6dce2063d782@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA4OCBTYWx0ZWRfX1haZ3yc1F19F
 ZC1Jh6fabnsJfZ2khab6pVxf2MML/Ji/G9laLeD1dAp07WlX1f1f5Ms2FmyUQFo6p6ocCrFv39X
 +VNN3rJ5YiA8ZJy0Md5D0WTKXlpPufUsuYbmTWDmZbZ3BmnFFsOB9Io/RvKTaSGeEjqmVWAlmmd
 B9gqECdNTd3kl4MUz8OGM7c0vxWN6q6cN8LP5WMf2F2S/yGRZkJp481ofvzLmsWCytOOzY80hiR
 BGfhfc8QD2ba9fP80YWSLRHumBpBJHEosuw4eO8vfJ3gUpIQWvv3b1sAvos6sg7RyL9JYzt9W4a
 tuBbVf2TZA651kcZU8ItZXf2UtWDYPPlFZQZBW0LHk6CmRHqu0HL6VIZQxQI8XCvDQ09bFlNYE3
 pm6Lp308WU87yE49/JXu1Puad6GiBF4P4yhvaN/xT/zCzzSroIZqzhViQi+i9iuo1nbf65uze6h
 96i7Ldes58LyIayQqPg==
X-Authority-Analysis: v=2.4 cv=HrJ72kTS c=1 sm=1 tr=0 ts=6964d665 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ntuG9qRpOVxPRPblRsQ5Fw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=ERLT3ukgNE3iqUHOUQAA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: 4A-MUJB2I5vUEKMqEEYOlmllGLGpLUjx
X-Proofpoint-ORIG-GUID: 4A-MUJB2I5vUEKMqEEYOlmllGLGpLUjx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0
 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120088


On 12/29/2025 12:01 PM, Dikshita Agarwal wrote:
> In iris_kill_session, inst->state is set to IRIS_INST_ERROR and
> session_close is executed, which will kfree(inst_hfi_gen2->packet).
> If stop_streaming is called afterward, it will cause a crash.
> 
> Add a NULL check for inst_hfi_gen2->packet before sendling STOP packet
> to firmware to fix that.
> 
> Fixes: 11712ce70f8e ("media: iris: implement vb2 streaming ops")
> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> index 6a772db2ec33fb002d8884753a41dc98b3a8439d..59e41adcce9aadd7c60bb1d369d68a4954f62aef 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> @@ -963,6 +963,9 @@ static int iris_hfi_gen2_session_stop(struct iris_inst *inst, u32 plane)
>   	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
>   	int ret = 0;
>   
> +	if (!inst_hfi_gen2->packet)
> +		return -EINVAL;
> +
>   	reinit_completion(&inst->completion);
>   
>   	iris_hfi_gen2_packet_session_command(inst,
> 

Reviewed-by: Vikash Garodia<vikash.garodia@oss.qualcomm.com>

