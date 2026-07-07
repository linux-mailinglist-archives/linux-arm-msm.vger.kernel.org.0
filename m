Return-Path: <linux-arm-msm+bounces-117374-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qyerDi4yTWqywQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117374-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 19:06:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF0071E18F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 19:06:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=PHowLSK0;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=DE8SSBzv;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117374-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117374-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 099C53097936
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 17:00:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93361426D0B;
	Tue,  7 Jul 2026 17:00:51 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3259A372ED6
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 17:00:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783443651; cv=none; b=KDvtEqEY6Nkun/oY8Lvm1m0r5YE5XXpCIjv1Ss+uoszw+X5kDu6uBLqnXrr3KyYtTfPFr3D/Bq61UyXb8LuHKn+P5q+7Es48PekShWzKiuD5cx2DF1xwZHuE+ryAYOBU/lmPqz5oaza+hcbdsiBBcRkPoE/H7lEkfToERlQNj4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783443651; c=relaxed/simple;
	bh=WbUdL3CNPOorv8htE5XXowd1ZM+m0c6usAKsTT24zYY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DTEuvD3SQgquOYJUMLwMyCL3DK1UBMc6WEjbkDJQCTDOCG5qzskaMZpV2YjR83Ygr+C1WttrJMCG9A9tWnIPbamZmGhnB5Jj9DesumM33LeEDooEMchoslFnCFmPdqnM8+fqUOtEkHvgphFYg7tMxUUFYmpgC95d5seg+j6gxIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PHowLSK0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DE8SSBzv; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667FTNK0011786
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 17:00:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WbUdL3CNPOorv8htE5XXowd1ZM+m0c6usAKsTT24zYY=; b=PHowLSK0/tW4dx6k
	B0FatCQnFbJz3NOZvRBrrL35ODFdS1dKp9U5eyGcPPFy8bsMrlqmG/6195Tu7E2O
	im6gV2S6/uK7cNHELIrNnSp5TW9tTXIf7UDxMgZf0k3eAr2EJP+rqrW16Dq0Rl4t
	GuX5KSeVqLq2L7Pw1LjR2SGrbqfGO1dWcO5yxbu97Dv5WtcMbwKsdN30Pgw61/vA
	BtBX8j/ccTT/Coc0kFHQQIzb5A5AmtYUA0ZXvTvlEvXjugs0aiVagJgOPn8+zqul
	+faFoh62xksi65qwlLsUR5H7ITVdnDnUZvuSsHN9tqU6v+R6f3bMx0UTPGbBNjDa
	3BbZxQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8vdjajcr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 17:00:48 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-388cfc4848dso133732a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 10:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783443648; x=1784048448; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WbUdL3CNPOorv8htE5XXowd1ZM+m0c6usAKsTT24zYY=;
        b=DE8SSBzvLnUJlBLaqV9qrjllgR5k2meVFIUVJgi4v8YuGZlR+wbio6hw79PaDc+quW
         dR162ZOdvU3py1jnrCMAIJ/QHl7JjaNg49w2IqqMirJW0eceDI8X1wvPPcyWCx4xj7Nv
         Br5fx++Mdi69XAG8h1zLy8CUabAZ29ekYmxcc8P/JSiG1pN7lNMzguoxowVLS3nkZat7
         BFaoZGB2YgVEZkaMUHJ8hM4jbor1e2sETHXahnxmEF/KaUVCbiPB4Cj5+zKcSVwUXnER
         vpFGswVgn3t8KkXjwKyk0pcmtYduuON7bZkyHDEmp/T6Pnywag6i7r2p+D9Q/lyvze0o
         Spuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783443648; x=1784048448;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WbUdL3CNPOorv8htE5XXowd1ZM+m0c6usAKsTT24zYY=;
        b=DvKG38Uzr1LfTbVgY6/XQakrOqS4Nhq0vRJQfH7mELQxVEZvSJNt2F4mPUfZjRNF43
         17IIyvWog3a6NN11WjFi6HupoOS/g9XgqD60cQskZhsQqGI1Qa1d9FRgXQRZQGpESTOb
         D70verfhO/eyg2/T/TdWGUhRLH6tDTSBAXVT6qZ8FBAzrkqDabvKj7t29LufQqxVVAVa
         maqWpBnML3CaRT2ThDZxE7VJAfrXAHyjb1MLIawfyNEmouDcs84bRWWcGnDZYSZer0qP
         zBpxXjX7dHYIPhUcJlyylvW6ZjzlpxQWffVOudrQ1QNag2OcDCsyZpBDtUu2fr9k/ZF+
         1Ztg==
X-Forwarded-Encrypted: i=1; AHgh+Rp3k2Z6CYufwgwU7dnCOnGDoMfKMjjxVw4chwi7uhyBaC0V5VbOJtq98DNrXCloUOS2YjYrnV2r2JuyAO2s@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+DjYc10z+WzwlNYhEm82kftij9SJ1kBxI62c7vrK/zTvOZ1ZV
	aEmAwcAH0XbmgxIxkBg8XXSRtxWyG9i0E7SVWpCrTZzhEEQZvyQhf4eGm+9PvoJRLKEmTUy1L4a
	JVRbmL5Ex+w58ipuXV5Lx1E4h1wNJb78uquAbtXpLo8/W13/GrB2h9TC/OgbzsDKAh0Wz
X-Gm-Gg: AfdE7ck2sQNvw//ZO54PX0+vSs6vi6NcilLkN3Rq7dhYMViLkC+bOJZUEd2EZNlL2mR
	Ax0BBsgns7N7zfS4eNYfa56TSnd+Zv55gvT8CkjjTY4sJXnm2MuXxYLSN06lBNCkj2f3LZp77a9
	snkdNV2zwEEec3kyjr31C3JrrpCOT1ZjzVZm66Gvr1Co1QhUfk+zhYf8JMilu7fKb58LJA+G9ma
	e8TSJAQntKaSSqzxg++eak7x9a+aJK2jIC6CxoguKaRYqjDRRblKg7R1Ceuis55rahNKDdRTl5h
	0N42ZRu0Y2GKuwiT63ekTeB6ELANBqctatGv3MGIdeFkyRkdEtphuzIcEDqx4gzCV58vDqbZPRS
	1F+LYa3S4ZqYJkE3PZZWWYtlm7r6ifUWf9wiVYHHWsMQ=
X-Received: by 2002:a17:90b:50cc:b0:387:e0bb:57f2 with SMTP id 98e67ed59e1d1-387e0bb5bb4mr3501554a91.35.1783443647820;
        Tue, 07 Jul 2026 10:00:47 -0700 (PDT)
X-Received: by 2002:a17:90b:50cc:b0:387:e0bb:57f2 with SMTP id 98e67ed59e1d1-387e0bb5bb4mr3501507a91.35.1783443647126;
        Tue, 07 Jul 2026 10:00:47 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174ac14f2sm11023355eec.27.2026.07.07.10.00.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 10:00:46 -0700 (PDT)
Message-ID: <7cff4a0d-727a-9b55-9fd9-57fa861d6029@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 22:30:40 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/2] media: iris: avoid bit depth validation for capture
 formats
Content-Language: en-US
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
References: <20260707-qc10c_fix_and_disable_time_delta_based_rc-v1-0-33fa130bc535@oss.qualcomm.com>
 <20260707-qc10c_fix_and_disable_time_delta_based_rc-v1-1-33fa130bc535@oss.qualcomm.com>
 <fbed6245-75dd-4975-8193-76edd4587fb5@oss.qualcomm.com>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <fbed6245-75dd-4975-8193-76edd4587fb5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=R7cz39RX c=1 sm=1 tr=0 ts=6a4d30c0 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=GrxmyxEN0g0U0qsHxscA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: _YfTmqD6KYRgHu12SdbuSI2Y7lnSL5Lq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDE2NyBTYWx0ZWRfXzvaTjaL/F1ib
 JnFCWlqjoU+7JaWkq1Pe6DsWGbXFA0lgHnoC4RdgN8T1D4q80Zjc2i1DYCxnYBNBwPO3SJfWhk0
 Sk7wvCcGsesETiyN4jvAvoNuedN9T9qPGVk4gm1ZyVpL7uFBZnEpBTK7ar/eHhMCb2SsyOVZI4q
 X+PJILbPYn2CzZU+4Ir9yFJduTxRP5W4VXZHT4gwmjV4QCZ/Df/IGGIUFAnRTs8ymBJRllREPnj
 lwS+UZqDmGocZMhzbwn0w/hO7TREXl2kpOMfyppqS+VNV/YpslDcZIk42/bkZW4e3kS9oLOpZJm
 31490FFZ7NjwtOE1z/bJ/H9Y4/cHOnoNrEz7RV1vTxcqIv2776imNoi+9zpFKhRdC+nZlOhDF9o
 osP/vKYMa0b9R0EjXo3b1kELZkN523JLKIO+yhEQBojMbH+KmpjcEc3G2s+MC7223pmP0pbwNz4
 SQdIg3CbyFECz+qQPkg==
X-Proofpoint-ORIG-GUID: _YfTmqD6KYRgHu12SdbuSI2Y7lnSL5Lq
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDE2NyBTYWx0ZWRfX1D8yjWluY2CD
 wzm6R3PwaNci6l2hBh0prCPt87Vjz4gJoPHjVdc0hanR2uhsByuoX/pzDzpXItJrFpfUO39L03/
 2Ewui+QkdzCrxZ1gJtC/Lgqdw78FJ5g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_04,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070167
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117374-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:bryan.odonoghue@linaro.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8BF0071E18F


On 7/7/2026 2:23 PM, Vikash Garodia wrote:
>
>
> On 7/7/2026 12:05 PM, Vishnu Reddy wrote:
>> When validating a capture format, check_format() compares the requested
>> pixel format against inst->fw_caps[BIT_DEPTH]. However, the bit depth
>> capability is not available at this stage and it contains the default
>> value of BIT_DEPTH_8. The actual bit depth is updated later after the
>> firmware reports stream capabilities through read_input_subcr_params().
>> Because of this, a valid QC10C format request is rejected during the
>
> client request
>

Ack.

>> initial format negotiation. The driver then falls back to the default
>> capture format (NV12) and stores it as capture format.
>>
>
> No new line
>

Ack.

>> Later, when the firmware reports that the stream is 10-bit, the driver
>> sees NV12 as the selected capture format and switches to the default
>> 10-bit format (P010). As a result, the original QC10C format requested
>> by userspace is lost and QC10C decoding cannot work correctly.
>>
>
> No new line.
>

Ack.

>> The bit depth information is not reliable during the initial format
>> setup, so it should not be used to validate capture formats. Remove
>> the bit-depth checks from check_format() and only verify that the
>> requested pixel format is supported. This allows the format requested
>> by userspace is handled correctly.
>>
>> Fixes: 20c3ef4c7cae ("media: qcom: iris: vdec: update find_format to handle
>> 8bit and 10bit formats")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> ---
>>   drivers/media/platform/qcom/iris/iris_vdec.c | 10 ----------
>>   1 file changed, 10 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c
>> b/drivers/media/platform/qcom/iris/iris_vdec.c
>> index 9e228b70420e..7f89e745a4b1 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
>> @@ -95,16 +95,6 @@ static bool check_format(struct iris_inst *inst, u32
>> pixfmt, u32 type)
>>       if (i == size)
>>           return false;
>>   -    if (type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
>> -        if (iris_fmt_is_8bit(pixfmt) &&
>> -            inst->fw_caps[BIT_DEPTH].value == BIT_DEPTH_10)
>> -            return false;
>> -
>> -        if (iris_fmt_is_10bit(pixfmt) &&
>> -            inst->fw_caps[BIT_DEPTH].value != BIT_DEPTH_10)
>> -            return false;
>> -    }
>> -
>>       return true;
>>   }
>>  
>

