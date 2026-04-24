Return-Path: <linux-arm-msm+bounces-104409-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8DxGN8g162nRJwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104409-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 11:20:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BC47F45C10A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 11:20:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 236153031CD3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 09:16:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F11FB37DE98;
	Fri, 24 Apr 2026 09:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gzisQckw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CbSzlfhu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDAF6372B24
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 09:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777022194; cv=none; b=lo8WEN1BYT/3GbB1X0NWsSKWEbd8fAqKWOIcQMkIiot1Gmyu2zH5U35+Ht9ZNpqZodt8w5IuyWCdvgW+gY3V1a78nV9RxR+DVAHKhDdz3RtQAXiK1a6Cq+9AdOmF9MgDYjCrfd7suPq6lWIP54/2zh5l2xMbHjRj6JMG5UTxJVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777022194; c=relaxed/simple;
	bh=g88rq/W6/jJt6g2zQBKGzuV5Xjn9aHoWAgxGMOp3QSQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VucG/5rTk6c4lSUUOdTAqjxGyHsYfSDd9/gAtNPiN+vQeFu2l1utPNhuJNOErHJ0uDFnJb8yrQqRgqv2UB6q/Rw6kquNLcv2mdC4y5HK+VwN+mi+1n2cy7bbf1RJZhHpmDwueOF+/qpvpOQftlQkSQNHF7tNffH0t3NcEsgbYvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gzisQckw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CbSzlfhu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O7ILFv1888440
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 09:16:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b8MeOqbyQh64Wo6o3xnugk0LDSP6qrP343xhplxDA7M=; b=gzisQckwIpW7Vfoe
	IQgkFQhU++XIGkW28WYvmYwrQcg+HooZ5OQmopgHt7WD1HF7iAZQ0mnoLmaVV9D6
	Phj5IS9FXMriT12HiJvSbJeIV2eyXKBQAjrJ37XkWMQYXj0O2tHRsdUpkmX0a4jF
	W65ky1g0mXiY9UIYBvXxYHwurew1PKHz9c9UKzv8dTVurQQx27nTLranfrIGQh//
	IpCpe1NHB1rFDWJJTEJFzqNZx9GEy7/HIUiNaFeLQcfJr6PULnSXHGGabcfPzZRf
	WZ/dyAu7cukhLJ2iqCRuxY+2k4u0uQBHfzvRX7GKWzHGwrwW469fsK/c0SHx6y25
	DIq4cQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqp9duu1x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 09:16:31 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35da4795b3cso14808815a91.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 02:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777022191; x=1777626991; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b8MeOqbyQh64Wo6o3xnugk0LDSP6qrP343xhplxDA7M=;
        b=CbSzlfhuGlK7pcXlIk0hfPF7KMnR0R3V9HJTAj+VQ2KHtySVDMoaAxYQ5GpTF6JqpG
         0E8Bl16SJxCi3FbQnINoD7R4iujqz44B2OhBrVClaKehoKvSIzbUsE1gIY602anoGFi3
         8pcPESilDwPb3uq6v7CSsmhWy7mWOGrTD6Qeg35PnTljCk4Gi7H+nF7xzj1lsxKmTmGJ
         OrjY5nI0EUlhZpzmIH0t7g5WCHO4Me6r9KYWbFOuw7qw4bigRokUMmaUeU/pEl9UCEMP
         DILxw7E6DzfceUZlHl2zv4BWIq1ES7hwha6Md1tcvtRq+Z2mi3Ly+gv7jrSkdVRHNuQg
         XkcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777022191; x=1777626991;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b8MeOqbyQh64Wo6o3xnugk0LDSP6qrP343xhplxDA7M=;
        b=f8I5U5hfkQWq18w+AhrLlfD3WrygclHM7bIPjtJ/AwgIMG4/EgPRof4pa9YyG/3FYD
         tx2CbO27OOx/evak7U4eaO0qIjVPt+4S2yXz7qbmnqBjSj8mySu87v7V5BralugHVSpf
         aDnUl3Dk5SDPeDcAY0wgx7JcIUIVoeKulZPoQ7CYl/8OG0gFSftyYJvxsjiWO6E5g6Kn
         r9G/55wPKj/P+wHR4+ASMxE5LXyufsc21fcR4UxbGZ6id1NEQm3HkI6QWOTqW8nkB66a
         5pZDyPoCGaJlMKwMup5KuHMMHU4p/VvfZ+LnEeiNdIo7g8lyS2mdArURwLwz66hp1+tu
         Pt0Q==
X-Forwarded-Encrypted: i=1; AFNElJ9tjp3CksPDHcCSzEO1WILyxaovHJ9waAP9vfEy0RD9dWCNSuYa6g4gsNcOXS0yOKS6epTFSfVDKryJk6HU@vger.kernel.org
X-Gm-Message-State: AOJu0YxM9LrqcCIAfGl8YMjw51TW1GKeYEIfjteRYoA6FgPZeQGAVZiR
	uqmu21i0LCyx1N3+5pQ6HEhZ2KlIsj4m36M35ARl+7lfo5gklBfJi01KBGj4DLe9cV+C8E8I4i7
	6LE0dZLap3+xHDtx1vRs1vVboxFYo20IDW9gGDQhgUga9OOEsc7zU1uF5SwRGuITzzkq4
X-Gm-Gg: AeBDieuajOEwQnHyuIT7NQcLSTwPUg1kXeu0FSg+lkeT+5DoXGj2rUMtUtyOQg4VUo7
	myqKOWU534VMNgVGgpGXOBD0JGNQjKeY2TJ2aF8W112Qxmbvvlmj9j+hszdouSnNwOTKI+JAW3z
	P4A3dkeuESgrHtbsh8jSbkADKCBeUFMIdi34p3axAJuOXds4NDeB09TesA4W9kT7OsAq8zUAjoO
	ORrjlNk4jqNFiYBg8d0/MCPeZVPiYwcDiNAcyBXX/AH0/eJRNzMVyFB3f6opXjmPilH+FdMju3F
	ovL0G0vAjGFj6nzLttWCIa+9EmEH53OwWScWbjy7iI3GeAS0bntGEiWBUm/28+n6aGPSNYvTRES
	oeU6fvu1ykIWKbkxb80Qi0PAh25blnLXeC6PTD2j6hZzwF23f4ayDk3pG4KwZ0Dr8vA==
X-Received: by 2002:a17:90b:390d:b0:35c:30a8:319 with SMTP id 98e67ed59e1d1-36140222bbbmr32539521a91.0.1777022190783;
        Fri, 24 Apr 2026 02:16:30 -0700 (PDT)
X-Received: by 2002:a17:90b:390d:b0:35c:30a8:319 with SMTP id 98e67ed59e1d1-36140222bbbmr32539505a91.0.1777022190266;
        Fri, 24 Apr 2026 02:16:30 -0700 (PDT)
Received: from [192.168.29.100] ([49.43.194.239])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab0db13sm234364865ad.53.2026.04.24.02.16.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 02:16:29 -0700 (PDT)
Message-ID: <dffbf0c6-a458-2dcd-1927-7495dc326d76@oss.qualcomm.com>
Date: Fri, 24 Apr 2026 14:46:23 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] media: iris: optimize COMV buffer allocation for VPU3x
 and VPU4x
Content-Language: en-US
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <lWwJ9pbXoZXg350L9fA8Sx-qznLud6KXnJlBTFNBLZQXEwKZeI50KGzJPDq43FO2QtbisF9pyxxeVTXX-WvN0Q==@protonmail.internalid>
 <20260421-optimize_comv_buffer-v1-1-7c9a24da3ad3@oss.qualcomm.com>
 <c0a23200-e3f3-46ad-9057-4ee8723d2f43@kernel.org>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <c0a23200-e3f3-46ad-9057-4ee8723d2f43@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: DmKUA-2sMmfF3UKPJ4m2y47m0Y2femdm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDA4NiBTYWx0ZWRfX6hM/R5Rm6z7z
 7SaK9Lr/Knby4dXzpYSOIbt9HGyZl9uJmmvc6drJtS+xVv3NZSgrPgm6tH5m4G5A/oUqqtMbzY9
 rjBhcsTJEYHkNlorBnUE32iF34/+SEutenwYOW9O5oDSyHmXN/iFl/i6821+KfbBm7Yil5/qcqL
 aPNilEDvfCNVxPWv6b2OhUwoGpwZ4pXYkiDUUBbc31nsO9zk6DJpOEz/dGLFVistts8OgUnTDPS
 7+IXGLCtyodF3w3yzFCHr5noFYRAbTBkfAaG7kQqhVC+NUxkB92U2vhYYw/0xy0enlBEZm/J6Cl
 +ffrJRw5htD6jMuz4rBW378I6ATonNkiH8q4Er13RK+xW6j8Gmrs/ZChsT5rUIMZfjnSfyTvEux
 Oa5Xr/suK4dVrG0jAa0UBBRGxt1XCWK2RNLwpEVSfuKFYjT/rJOk/7BLC3j00b1h2uOxuXXnIH8
 ru9jLT/iKTwnyAoaQRw==
X-Authority-Analysis: v=2.4 cv=fP4JG5ae c=1 sm=1 tr=0 ts=69eb34ef cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=gkiTcqCCC2T/77GpOVv7Jg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=sxecAc6Fdml7H7xBZ-gA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: DmKUA-2sMmfF3UKPJ4m2y47m0Y2femdm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 adultscore=0 suspectscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604240086
X-Rspamd-Queue-Id: BC47F45C10A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104409-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]


On 4/21/2026 2:31 PM, Bryan O'Donoghue wrote:
> On 21/04/2026 07:41, Vishnu Reddy wrote:
>> The existing iris_vpu_dec_comv_size() used VIDEO_MAX_FRAME (32) as
>> num_comv count unconditionally when calculating the COMV buffer size.
>> This resulted in an oversized COMV buffer allocation throughout decode
>> session, wasting memory regardless of actual number of buffers required.
>
> You should define what a COMV buffer is before talking about how you are
> changing it, i.e. define the term Co-located Motion Vector (CMOV) and then use
> the abbreviation CMOV liberally as you wish.

Ack, will update accordingly.

>
>> For VPU3x and VPU4x platforms, introduce iris_vpu3x_4x_dec_comv_size() to
>> replace iris_vpu_dec_comv_size(). It derives num_comv dynamically, it
>
> "These derive num_cmove dynamically"

Ack.

>
>> uses inst->fw_min_count once the firmware has reported its minimum buffer
>> requirements, and fallback to inst->buffers[BUF_OUTPUT].min_count during
>> initialization before firmware has communicated its requirements. This
>> aligns the COMV buffer size to the actual count needed rather than always
>> allocating with fixed VIDEO_MAX_FRAME value.
>>
>> Additionally, during iris_vdec_inst_init(), fw_min_count was initialized
>> to MIN_BUFFERS instead of 0. This masked the fallback logic and caused the
>> COMV size calculation to use MIN_BUFFERS even before firmware had reported
>> its actual requirements. Fix this by initializing fw_min_count to 0.
>>
>> During testing of 1080p AVC, it reduces the COMV buffer size from 32.89MB
>> to 6.16MB per decode session, significantly reducing memory consumption.
>
> Cool nice fix.
>

Thanks!

>>
>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> ---
>>   drivers/media/platform/qcom/iris/iris_vdec.c       |  2 +-
>>   drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 24 +++++++++++++++++++---
>>   drivers/media/platform/qcom/iris/iris_vpu_buffer.h |  1 +
>>   3 files changed, 23 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c
>> b/drivers/media/platform/qcom/iris/iris_vdec.c
>> index 719217399a30..f433065e08b2 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
>> @@ -24,7 +24,7 @@ int iris_vdec_inst_init(struct iris_inst *inst)
>>       inst->fmt_src = kzalloc_obj(*inst->fmt_src);
>>       inst->fmt_dst = kzalloc_obj(*inst->fmt_dst);
>>
>> -    inst->fw_min_count = MIN_BUFFERS;
>> +    inst->fw_min_count = 0;
>>
>>       f = inst->fmt_src;
>>       f->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
>> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
>> b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
>> index 9270422c1601..57237543b229 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
>> @@ -731,6 +731,23 @@ static u32 iris_vpu_dec_comv_size(struct iris_inst *inst)
>>       u32 height = f->fmt.pix_mp.height;
>>       u32 width = f->fmt.pix_mp.width;
>>
>> +    if (inst->codec == V4L2_PIX_FMT_H264)
>> +        return hfi_buffer_comv_h264d(width, height, num_comv);
>> +    else if (inst->codec == V4L2_PIX_FMT_HEVC)
>> +        return hfi_buffer_comv_h265d(width, height, num_comv);
>> +
>> +    return 0;
>> +}
>> +
>> +static u32 iris_vpu3x_4x_dec_comv_size(struct iris_inst *inst)
>> +{
>> +    struct v4l2_format *f = inst->fmt_src;
>> +    u32 height = f->fmt.pix_mp.height;
>> +    u32 width = f->fmt.pix_mp.width;
>> +    u32 num_comv;
>> +
>> +    num_comv = inst->fw_min_count ? inst->fw_min_count :
>> inst->buffers[BUF_OUTPUT].min_count;
>
> Please just if/else this though its far easier to read/understand that way.
>

Ack.

Thank you
Vishnu Reddy
>> +
>>       if (inst->codec == V4L2_PIX_FMT_H264)
>>           return hfi_buffer_comv_h264d(width, height, num_comv);
>>       else if (inst->codec == V4L2_PIX_FMT_HEVC)
>> @@ -739,7 +756,8 @@ static u32 iris_vpu_dec_comv_size(struct iris_inst *inst)
>>           if (inst->fw_caps[DRAP].value)
>>               return 0;
>>           else
>> -            return hfi_buffer_comv_av1d(width, height, num_comv);
>> +            return hfi_buffer_comv_av1d(width, height,
>> +                            num_comv + AV1D_COMV_BUFFER_OVERHEAD);
>>       }
>>
>>       return 0;
>> @@ -2025,7 +2043,7 @@ u32 iris_vpu_buf_size(struct iris_inst *inst, enum
>> iris_buffer_type buffer_type)
>>
>>       static const struct iris_vpu_buf_type_handle
>> dec_internal_buf_type_handle[] = {
>>           {BUF_BIN,         iris_vpu_dec_bin_size             },
>> -        {BUF_COMV,        iris_vpu_dec_comv_size            },
>> +        {BUF_COMV,        iris_vpu3x_4x_dec_comv_size       },
>>           {BUF_NON_COMV,    iris_vpu_dec_non_comv_size        },
>>           {BUF_LINE,        iris_vpu_dec_line_size            },
>>           {BUF_PERSIST,     iris_vpu_dec_persist_size         },
>> @@ -2098,7 +2116,7 @@ u32 iris_vpu4x_buf_size(struct iris_inst *inst, enum
>> iris_buffer_type buffer_typ
>>
>>       static const struct iris_vpu_buf_type_handle
>> dec_internal_buf_type_handle[] = {
>>           {BUF_BIN,         iris_vpu_dec_bin_size         },
>> -        {BUF_COMV,        iris_vpu_dec_comv_size        },
>> +        {BUF_COMV,        iris_vpu3x_4x_dec_comv_size   },
>>           {BUF_NON_COMV,    iris_vpu_dec_non_comv_size    },
>>           {BUF_LINE,        iris_vpu4x_dec_line_size      },
>>           {BUF_PERSIST,     iris_vpu4x_dec_persist_size   },
>> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
>> b/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
>> index 12640eb5ed8c..7a9cc1c92da3 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
>> +++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
>> @@ -110,6 +110,7 @@ struct iris_inst;
>>   #define MAX_PE_NBR_DATA_LCU16_LINE_BUFFER_SIZE 96
>>   #define AV1D_NUM_HW_PIC_BUF    16
>>   #define AV1D_NUM_FRAME_HEADERS 16
>> +#define AV1D_COMV_BUFFER_OVERHEAD 7
>
> Whats this ? Why is there a new seven byte overhead ? Does it represent a
> header, an alignment ?
>
> An overhead can mean anything.
>
>>   #define SIZE_AV1D_SEQUENCE_HEADER 768
>>   #define SIZE_AV1D_METADATA        512
>>   #define SIZE_AV1D_FRAME_HEADER    1280
>>
>> ---
>> base-commit: 4fbeef21f5387234111b5d52924e77757626faa5
>> change-id: 20260421-optimize_comv_buffer-ae7107673609
>>
>> Best regards,
>> -- 
>> Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>>
>
>

