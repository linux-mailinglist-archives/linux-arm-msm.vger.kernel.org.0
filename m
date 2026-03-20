Return-Path: <linux-arm-msm+bounces-98882-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6MT0DSbqvGnQ4QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98882-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 07:33:10 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D0EE72D6410
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 07:33:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1682C304A150
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 06:32:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59EE12F7ADE;
	Fri, 20 Mar 2026 06:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bVGanlVy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LNm57/+S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9177E2DC774
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 06:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773988377; cv=none; b=ZNFeFzO7NPlyYNNNsEoR6zzpBAg66uqxxR9eLlQ7lVAdJu5s6wpytgPt9JW9UW+5wgLgNQlJsEyUOA7kIW1Eu96owB44C3UQeU6OxFoDdDsDmYWgphTr3r3BZoMPhsKGYxVOdee/+DzJOV1lQMQmg4bExd1ybt9IIvbioYR/HRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773988377; c=relaxed/simple;
	bh=JDWybbQZFLzT0yqWz2yTi4vljDUY6qfxjSR/o3TSXHo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kvPM3bbQmwCuIeqg1wmn2vDeVzrx4WmQOrVNa+xqZ2EuKbmMwJTPPNWZ/Qn3pYZo7vj79/vcQf6w47OuRXXNPMnO8hm5GoCgRKWnyMIfxzxYqQcdDezUrkGEuoav/bEwfC10Z3Mhlv6C1V4A14RL2gseo1db1Df79NASaItrvJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bVGanlVy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LNm57/+S; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62K2XmZ21692069
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 06:32:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S3XDmZ6DZpsSMr45TYJTcuxR2oKUiRkyGpJn2zik/2c=; b=bVGanlVyrrugaFBp
	n89/r0+rOxjBzcZbdMepVpVDlI8yAWuJSHbaPDT+7nXvm4uyAJknH0cPELqa0741
	S+iiHTtxFN8ZUNTncImt0lkRv0y/+JIE+SPborKXbGQ2ibnY4lvXbriQkLTs+8cS
	WL76sRUwZS4DqKINJYiKXmeGb3QH2zqwIgIDpAL81KshP9chzUrCV1k/I7dj1wFa
	l3X3gbfnuhUklCLwJwAOqoobvGqpph2QrnOzjZ3c2WAbAp1u/HNFhCjT/0h8NhGe
	KPcpCTA21em6VGuvhUBSG/0c2ZMkLX2TAoYTDyyZeuFFlQu6VnzguC2beeK20eoW
	ErxDLQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d0s5d14hj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 06:32:53 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-358e95e81aeso12227330a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 23:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773988372; x=1774593172; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S3XDmZ6DZpsSMr45TYJTcuxR2oKUiRkyGpJn2zik/2c=;
        b=LNm57/+SVHAUUikdf+Xgs24nqEuFDISY4/WRJzBMRMjFMx2Y+l6V6w2KLYlJBJ21+s
         6TNlatfgLWpZM9A16qmKO4I+QE25V/Wu2XQGpNs7IDGkVnunvGwcEyBfngZKMEFbk9hq
         iguiE9HaZaXp9D3+6jtvtMcl7rW/6oM1IVMBWzj/AMsFFHHCsnsS52div/iWrbQ3lSmB
         x6NKPqGHYlZeEdrUOthCj4fcwG0dxBz8FDVajm/4Ezvny/zbBB2uZGNJ7arEbPJP+OEp
         1xiix1TYB0ApOar33fTsPhoNbvRdq+h8OTdZqQ/R5p/sKT1/lf7l/y8eSueW1d3WalHR
         tcRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773988372; x=1774593172;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S3XDmZ6DZpsSMr45TYJTcuxR2oKUiRkyGpJn2zik/2c=;
        b=Cc2I0mw7MBWt3xplScFLjbP99jBjV7fuGlDt5HNhhiHKUmmr95wVQBIm54w/nzEDGY
         GARltfoLmBAtsewI8C9mxyOx8inClgqBbbUFsWCetnTz94NOpjgCRMHgoYso0SxDFU2U
         uCdcPCqUIFR6mykxnEeN2DIVrG0cQDmzf57jyba3bk1LjMQcBCYHLdym5t91YvU+m2qt
         mDG6XrZ+Lyb9vrTXppMtqqXKGu7gZzFmqnD37Ideab5HnblfSr3tk8RKmckOdZdF6Hzj
         HhOhpwmWBZ/e74pOPp3++zckBqNnvWVcBGZc/ITqLUuwkAu0AqOsU4g9+if+sBOXPWvA
         y0Pg==
X-Forwarded-Encrypted: i=1; AJvYcCV8kNL2z0tG26QN5wJuwz15ntJ8bkmmgp+tiSzvj2F2aXCTH5QTIt029cQtP3BvnyTCxP/Z6ziqD7Vy8xhN@vger.kernel.org
X-Gm-Message-State: AOJu0YyIN5e9nC3If8YdBQI1HaKD4CCr1O721amKtuHLfqsG+cQYrBqF
	F5dTiUcN6a3RTwMnzPW+jkND43d58KQ9AHdR1zZxQa14dpgH2DzyeScrGLXIP52+7FcwmMHri6h
	1Q5zqUAsAk+Nk1L9yxTnSiVz0rc5EPOrpXjvDmAf3OEEffuj3VRJIyAcepyHZ9G9xlYo3
X-Gm-Gg: ATEYQzwgygvGKUX5rzVmYVuruxpu4ejrJwQ2v+slErVEaavEpY6J2aFrFoQguviNfAN
	+SPBjPSWkHEEQhjPIs00hF7WjHxPkgQduYT6gWdFOTPw4dMJuQ7hpFfDp1f2L5ve45cHTSUJqa7
	9Mw+gYCxdJ8GEEA7QyX7NDT62AgrCVPk1S5JJNHOlNBRpq1hgMLFb76mQXinquO8sFtVK5L+YYC
	Vx05+/+7L13Ptr8kSVp2zk0jUo3uqAj3Un8lhDVzE0MADzgV0XIsidvlhf+OeS4z9RSahPC1su5
	sFsiBl2DrCc4bLXIpDUPORhmVRgU6weZUnbudmzcTyjD+H5hEo7EKtllPPi4lD+1Dj+9I0dLyFj
	hBLx4JPPDe4lCZ1AVebFut6B/eDpS5C1ZoWNX9ssnTaXrm1TjYZLbK+30
X-Received: by 2002:a17:90b:4c8e:b0:34c:fe57:2793 with SMTP id 98e67ed59e1d1-35bd2cec778mr1453016a91.20.1773988372448;
        Thu, 19 Mar 2026 23:32:52 -0700 (PDT)
X-Received: by 2002:a17:90b:4c8e:b0:34c:fe57:2793 with SMTP id 98e67ed59e1d1-35bd2cec778mr1453000a91.20.1773988371900;
        Thu, 19 Mar 2026 23:32:51 -0700 (PDT)
Received: from [10.100.155.18] ([223.228.117.104])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bc6017492sm4536207a91.5.2026.03.19.23.32.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 23:32:51 -0700 (PDT)
Message-ID: <9c5da48f-4003-b46f-cfb9-0ad5f5062d69@oss.qualcomm.com>
Date: Fri, 20 Mar 2026 12:02:43 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2] media: iris: add FPS calculation and VPP FW overhead
 in frequency formula
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260305-update_fps_calculation-v2-1-e3b5cccb1246@oss.qualcomm.com>
 <19e9afa8-b0fa-43e1-8758-b58e6c7a095c@oss.qualcomm.com>
Content-Language: en-US
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <19e9afa8-b0fa-43e1-8758-b58e6c7a095c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: dCGHB_9CK8sC9mwEoZFPP03PmY5S6TAr
X-Proofpoint-GUID: dCGHB_9CK8sC9mwEoZFPP03PmY5S6TAr
X-Authority-Analysis: v=2.4 cv=CqCys34D c=1 sm=1 tr=0 ts=69bcea15 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=7c+JdVm+58SBmuR1ZE9k/Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=yceorTwUWq3GjdelvQMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIwMDA0NyBTYWx0ZWRfXwluexnQvc7Bj
 2o2ovXHFyPuqG6YCRdqm/vNeIZGiRQWaZycGsxZb0ExxA5TTNMHaUoKzQiOxBEB0Jwl8S6+UEn6
 pBxZrm3IFAfEvvSfcElaiJdTCWqPqdRu3vKd82OBHiyA9HyUnsqsM4MPi1/7Ir4Wb+9YVTiLAI2
 Nky74bxXdJ1Tz3PJ0IeWHN9fRUzZaegJU7E74qR+GqsAaq4h3m2UPX9l6qry8vHuR6QVJss+XCB
 Vsor3Mi0+CdvB0qStyfngW/+tuaMluHP1CBe7x4RSks1nS47waCGI1KcLUuo/kJz24v+sdLqNoD
 YP5j2NtQqezP8sptKQJZbxThEa+r+m4qjvaKursy0DY0w6/nF6TL+vZEdtbtfXzTI18ij+Tmke/
 /OtVY0IUmxU+Ji9aL2RldJ8shCzIXistz6twu2bgPA6EEVVcSdiwu0zfOwBOLkhvkUgVZSkC5lr
 T0GgpLZwHsK4VMh0bQg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_04,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 phishscore=0 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603200047
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98882-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D0EE72D6410
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 3/13/2026 12:54 PM, Vikash Garodia wrote:
>
> On 3/5/2026 7:00 PM, Vishnu Reddy wrote:
>> The driver was using a fixed default FPS value when calculating the VPU
>> frequency. This caused wrong frequency requests for high‑frame‑rate
>> streams, for example 4K at 240 FPS. Because of this, the hardware was
>> running at a lower frequency than needed.
>>
>> Add the FPS measurement based on the decoder input buffer arrival rate.
>> The measured FPS is stored per instance and used in frequency 
>> calculation
>> instead of the fixed default FPS. The value is clamped so that it does
>> not exceed platform limits. Add a VPP firmware overhead when running in
>> STAGE_2.
>>
>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> ---
>> Changes in v2:
>> - Replaced div_u64 with mult_frac
>> - Link to v1: 
>> https://lore.kernel.org/r/20260304-update_fps_calculation-v1-1-4eeac373a504@oss.qualcomm.com
>> ---
>>   drivers/media/platform/qcom/iris/iris_instance.h   |  2 ++
>>   drivers/media/platform/qcom/iris/iris_vdec.c       | 21 
>> +++++++++++++++++++++
>>   drivers/media/platform/qcom/iris/iris_vpu_common.c |  6 +++++-
>>   3 files changed, 28 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_instance.h 
>> b/drivers/media/platform/qcom/iris/iris_instance.h
>> index 16965150f427..180cba36a7f2 100644
>> --- a/drivers/media/platform/qcom/iris/iris_instance.h
>> +++ b/drivers/media/platform/qcom/iris/iris_instance.h
>> @@ -109,6 +109,8 @@ struct iris_inst {
>>       u32                metadata_idx;
>>       u32                codec;
>>       bool                last_buffer_dequeued;
>> +    u64                last_buf_recv_time_ns;
>> +    u32                frame_count;
>>       u32                frame_rate;
>>       u32                operating_rate;
>>       u32                hfi_rc_type;
>> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c 
>> b/drivers/media/platform/qcom/iris/iris_vdec.c
>> index 719217399a30..88820060e22a 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
>> @@ -369,6 +369,8 @@ int iris_vdec_streamon_input(struct iris_inst *inst)
>>       if (ret)
>>           return ret;
>>   +    inst->frame_count = 0;
>> +
>>       return iris_process_streamon_input(inst);
>>   }
>>   @@ -411,6 +413,7 @@ int iris_vdec_qbuf(struct iris_inst *inst, 
>> struct vb2_v4l2_buffer *vbuf)
>>   {
>>       struct iris_buffer *buf = to_iris_buffer(vbuf);
>>       struct vb2_buffer *vb2 = &vbuf->vb2_buf;
>> +    u64 cur_buf_recv_time_ns, time_delta_ns;
>>       struct vb2_queue *q;
>>       int ret;
>>   @@ -427,6 +430,24 @@ int iris_vdec_qbuf(struct iris_inst *inst, 
>> struct vb2_v4l2_buffer *vbuf)
>>           return 0;
>>       }
>>   +    if (buf->type == BUF_INPUT) {
>> +        cur_buf_recv_time_ns = ktime_get_ns();
>> +
>> +        if (inst->frame_count == 0) {
>> +            inst->last_buf_recv_time_ns = cur_buf_recv_time_ns;
>> +            inst->frame_rate = MAXIMUM_FPS;
>> +        }
>> +        time_delta_ns = cur_buf_recv_time_ns - 
>> inst->last_buf_recv_time_ns;
>> +
>> +        if (time_delta_ns >= NSEC_PER_SEC) {
>> +            inst->frame_rate = clamp_t(u32, inst->frame_count, 
>> DEFAULT_FPS,
>> +                           MAXIMUM_FPS);
>> +            inst->last_buf_recv_time_ns = cur_buf_recv_time_ns;
>> +            inst->frame_count = 0;
>> +        }
>> +        inst->frame_count++;
>> +    }
>> +
>
> simplifying it ?
>
>     u64 now_ns, delta_ns;
>
>     if (buf->type == BUF_INPUT) {
>         now_ns = ktime_get_ns();
>
>         if (!inst->input_frame_count)
>             inst->buf_fps_start_ts = now_ns;

Here, the actual required FPS will be found after 1 second. until that,
the initial FPS need to set for max.

>
>     inst->input_frame_count++;
If we increment the frame_count here, once frame_count becomes zero 
(after 1 sec),
In next buffer queue, again the above if condition will be true and FPS 
will be set to max.
I can add the code like below, Let me know your opinion.

if (buf->type == BUF_INPUT) {
     now_ns = ktime_get_ns();

     if (!inst->frame_count) {
         inst->last_buf_recv_time_ns = now_ns;
         inst->frame_rate = MAXIMUM_FPS;
     }
     delta_ns = now_ns - inst->buf_fps_start_ts;

     if (delta_ns >= NSEC_PER_SEC) {
         inst->frame_rate = clamp_t(u32, inst->frame_count, DEFAULT_FPS, 
MAXIMUM_FPS);
         inst->buf_fps_start_ts = now_ns;
         inst->frame_count = 0;
     }
     inst->frame_count++;
}

Regards,
Vishnu Reddy

> delta_ns = now_ns - inst->buf_fps_start_ts;
>         if (delta_ns < NSEC_PER_SEC)
>             //skip the further logic;
>
>         inst->frame_rate = clamp_t(u32, input_frame_count, 
> DEFAULT_FPS, MAXIMUM_FPS);
>        inst->input_frame_count = 0;
>     }
> }
>
>>       iris_scale_power(inst);
>>         return iris_queue_buffer(inst, buf);
>> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c 
>> b/drivers/media/platform/qcom/iris/iris_vpu_common.c
>> index 548e5f1727fd..d621ccffa868 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
>> @@ -416,7 +416,7 @@ u64 iris_vpu3x_vpu4x_calculate_frequency(struct 
>> iris_inst *inst, size_t data_siz
>>       u32 height, width, mbs_per_second, mbpf;
>>       u64 fw_cycles, fw_vpp_cycles;
>>       u64 vsp_cycles, vpp_cycles;
>> -    u32 fps = DEFAULT_FPS;
>> +    u32 fps = inst->frame_rate;
>>         width = max(inp_f->fmt.pix_mp.width, inst->crop.width);
>>       height = max(inp_f->fmt.pix_mp.height, inst->crop.height);
>> @@ -435,6 +435,10 @@ u64 iris_vpu3x_vpu4x_calculate_frequency(struct 
>> iris_inst *inst, size_t data_siz
>>       if (inst->fw_caps[PIPE].value > 1)
>>           vpp_cycles += div_u64(vpp_cycles * 59, 1000);
>>   +    /* 1.05 is VPP FW overhead */
>> +    if (inst->fw_caps[STAGE].value == STAGE_2)
>> +        vpp_cycles += mult_frac(vpp_cycles, 5, 100);
>> +
>>       vsp_cycles = fps * data_size * 8;
>>       vsp_cycles = div_u64(vsp_cycles, 2);
>>       /* VSP FW overhead 1.05 */
>>
>> ---
>> base-commit: f505e978d1a0442adbbde48aed38c084ddea6d6e
>> change-id: 20260304-update_fps_calculation-98ee7f7507b1
>>
>> Best regards,
>

