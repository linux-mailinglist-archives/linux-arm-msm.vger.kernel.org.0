Return-Path: <linux-arm-msm+bounces-101078-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0ASYBnDhy2n0MAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101078-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 17:00:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A623836B4D2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 16:59:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D68D1302F55C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 14:59:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 445AE3FF8A8;
	Tue, 31 Mar 2026 14:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HZ8FILzD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KTfXhVua"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C37637F00F
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 14:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774969194; cv=none; b=dKoLJlyX+w9pQIX6m3r0NVpBgGN+ViPoAv7WxWUoeZgnGpnmxTqhONKA54j2M9JivfSzveNoveIl8KDjvU+BrN9Nif1TU93OF0YMUGkD/VhyKEf/Zwl8NCRHeAW1DZmJ8lJTRp9h4XUXg2fhNkgu/g6MAarutYhyW7+DB/MJ+xA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774969194; c=relaxed/simple;
	bh=QiRxrqei+K6PaiikKThBiLEJm1XZe0nj7yVJVMtDQDw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JhTBV6PBajY65MVO4jPoHW38jT55rs05c3+EkhiM6vtyz5k4di+F13UNRxcSoZPVwBTznKB9lLKdI2LAvxyt1UAa16t0/qAkv0BchKoBbWI4XncV9n/MUgQhGMphA8FER4a2Txz+dEcmZxFr4HpPhdeIax6oiNKvYrlpycfpwAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HZ8FILzD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KTfXhVua; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62VEkZB72049351
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 14:59:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VYap/Rv76WurwaOPbgF1n3XsyyM1ysQ/R5Pd/s9WDMc=; b=HZ8FILzDjzCkuwB6
	JAsA472f66du0rj7tVRsSezzIuRtaofPg65vUdRhykUpJX7P3oVkBHfVzlfbxY+9
	Cn0SyRnh/JFhckfk0XBxWQflLTqRrZfNHizkvKEi2eR7ti7hYLpXTr1vDvqQLuAt
	XLQ7JrZwp6xm8rI9eZvk1LlGiYa6KiGBpe9q7HUB2bPdX7e0Vg7stcZ4plTIMbA0
	yeNeHaiNhejmF5oKpJueeQ2mSU0db2Wh/oB4mUuP//bJSGdnCqeKBOEp9WbPzLoR
	bAyr5+BHX4iSCh0hl65pL7Ncy8ZKv7ZOPv3qyXhcIDcwMWyQp4bG35ZVtduax+UE
	lmiQFQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8b1ysj6t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 14:59:51 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b249975139so94989165ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 07:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774969190; x=1775573990; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VYap/Rv76WurwaOPbgF1n3XsyyM1ysQ/R5Pd/s9WDMc=;
        b=KTfXhVua2nDCjYVt74sj8DzPB8K3Sc00wOkMFLl1DBq2ya4UNEm/joZ2ijNFIinog3
         u8+N/97rFsMYtz/Y4VUV6BZ2aLvdP9tBWcBfQEyrBlsb/O6h1mMUC5qnVO12hJGrzMJB
         +IPbmS1VUAMa8EK8T58/2uqLts2EoUIjuSkK/KGEVLoc+lAQJkIANeNtrPi64Ud8bMpw
         lse1c93hk0u3GCQiU0xNPfl2a8M5QJyHaWAvWnjH0GyT1wvQpbSVmpbMYUcF43zhYXL3
         dz/yBIBqvkZ8ihL4TRSOOHkuz4tAEDv7pyIDmxZ7r06tDg5eNlYXydHgBYNfBdGi+uns
         u+5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774969190; x=1775573990;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VYap/Rv76WurwaOPbgF1n3XsyyM1ysQ/R5Pd/s9WDMc=;
        b=KyH/OgbRPhLTb2WEdc3WPt8gqtjd3h0E5pSaaq+g0Djvt6TD4U30OYpbc2PoTxRS19
         XmCQ+vA7WFQ1ohrVWffpww9hDRWc9k7qrNoSnrVpf6TSw0IwCbOmyzy50oShwqBQoshB
         Pu/iSW4COb9xukhtBn1VxQcXzlXmlVHS4sC39uou1xe8PsKnGaUJRcg/OrJQcHqp+Vzi
         S/pJXuhTkPdv96pyuE3Io7fem4nLuwZi3epf5/vLcFqrygVvNqdxi1sMWmgyDIiVog7T
         NGwDmGwpB55nQ5LHPInZ7O4itPIu6q9kIAJJ66zQZcRU75/+lMNK0Vfy8VPg9VKfS/lN
         SiQA==
X-Forwarded-Encrypted: i=1; AJvYcCViIVu1Xorb1OdIL1mOgzOadFbSrKj6hSM26ddbWVd5OtTF9rHywBzD27rFctWD16bhx/GWap5H+AaikxQQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwVWb3M3Adt71/Bo8su4xkILI2t1Jm1pXKZFqkD17ctIh0LwZhu
	U/DPp2pY9P+ZVwGgCZ4DtTYl0YRDBGhgSR5/KGormxdoRckMJ8XdqirFtIOIdz7wZCcrLQ7MSs+
	Mucs0JD9czjY2fIZfCdQln/V22ycKz3d7DsEEtfHJyr5DXSfdJ6BZiolrqI/2dgqX3+bI
X-Gm-Gg: ATEYQzyxqSyjK0z0PniAb8vJ2yro/Q4ALiviHCJ871jNP+Y5Z404r1Q10GgTlhaGDH9
	02G1yuWKMpobo4QN5lw4J4dMfRy73dfF+EtAU9aKMgjNNbsn6fNi6NVB8VoWxXidZYwIxZHrH3o
	Im2kLQpB33h+kPrhOSaE4YjPPzsBdddg+0XTpmFQSLeOzbJe3K3Di1nxwHYg9EEjacZK5DiUnnf
	icSUSAnyRh9WIFipIoMymAFUtytiTwT0U0b4BN/4dTmSzE0GCh+fx/dlzaDrP1v6cwNT/oXlBhm
	xi3OJTIS1VF3I7AlYYXpot4LsA5hJTTOLkF2jzh1poYCmT5u4E0jhbl9O92h6njxbWiYg+adpqK
	Eb6hSEOG0GjbhSYB7DSmQNZdomYUrltvYqed6T77xD/Gk+nvO8TY=
X-Received: by 2002:a17:903:290:b0:2b2:51ed:4522 with SMTP id d9443c01a7336-2b251ed580emr95262845ad.47.1774969190465;
        Tue, 31 Mar 2026 07:59:50 -0700 (PDT)
X-Received: by 2002:a17:903:290:b0:2b2:51ed:4522 with SMTP id d9443c01a7336-2b251ed580emr95262455ad.47.1774969189919;
        Tue, 31 Mar 2026 07:59:49 -0700 (PDT)
Received: from [192.168.0.5] ([49.205.255.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2427b3bfdsm147188725ad.75.2026.03.31.07.59.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 07:59:49 -0700 (PDT)
Message-ID: <e930aabf-2876-5a19-50e4-5f6130d601a0@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 20:29:43 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4] media: iris: add FPS calculation and VPP FW overhead
 in frequency formula
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <gBTTNSRWouIHkWZqgHynz2HHwT-GFpNnPnnJ_uScxTYdGt_rvUKr_0cZdIeruTL3YEbWy43tamhM16u395B_Pw==@protonmail.internalid>
 <20260325-update_fps_calculation-v4-1-13728c0065ff@oss.qualcomm.com>
 <09993b18-157a-48b9-afdc-150697b660f3@kernel.org>
Content-Language: en-US
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <09993b18-157a-48b9-afdc-150697b660f3@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: S3UMnPA0_JF0d2j3TmM7yj-y2DNyWA2Y
X-Proofpoint-ORIG-GUID: S3UMnPA0_JF0d2j3TmM7yj-y2DNyWA2Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDE0NSBTYWx0ZWRfXxu+8mGZ2XBO6
 gki3gV86jTuViMiXVa9a90aLv+5JD7SyTtuZP0O3Jg0tU2oEnt9n5i4jzmiLk5vdMhBQEb3Z8ei
 wTCRA4iiSoPFZ+DKEWqQm0WTJPNHAiJtaK21XxQlsY3dcRlhh3KDUwVlEdfXNhfZXCl7kx7PBh6
 whfZcSKV6+fFL+ZmWsd7S2j5qB2vx25H5XJBdZnLRIMm4CPPZ0gWM2JOs93Phl2qug1g40BMK0T
 rPCC/CfDFB+b3n+aNIBxol7ktH0hgE57hEki8Vrj2HguV1Im/G1ZjGGBm2HKfUpsxZdmYgQ0wu8
 U4x2ODNqbCLEnfxlpn6M5hr0PiM6ccJ8pcPCj48KkmA+Ihqt/TqH1z7C6gv0hQJik8AR/Kp95z4
 FGFz44nYSw/jrW8jlWJ8m5wnszO0Phd/pryZSpp6QycIAuPVfg2OJuu9cbgOCPOplqr8D7t0K+e
 dTzZp5vwRY9JVMkYxBA==
X-Authority-Analysis: v=2.4 cv=aJT9aL9m c=1 sm=1 tr=0 ts=69cbe167 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=oBuh6LqfVrjb6oiH9OVomg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=StC7ZdNPSmHupGmBuFAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_03,2026-03-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603310145
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101078-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
X-Rspamd-Queue-Id: A623836B4D2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 3/31/2026 7:45 PM, Bryan O'Donoghue wrote:
> On 25/03/2026 16:35, Vishnu Reddy wrote:
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
>> Changes in v4:
>> - Renamed the variable names (Vikash Garodia)
>> - Updated the fps calculation logic (Vikash Garodia)
>> - Link to v3: 
>> https://lore.kernel.org/r/20260325-update_fps_calculation-v3-1-b2ec654f7e4d@oss.qualcomm.com
>>
>> Changes in v3:
>> - Updated the frame_count condition check (Vikash Garodia)
>> - Link to v2: 
>> https://lore.kernel.org/r/20260305-update_fps_calculation-v2-1-e3b5cccb1246@oss.qualcomm.com
>>
>> Changes in v2:
>> - Replaced div_u64 with mult_frac (Konrad Dybcio)
>> - Link to v1: 
>> https://lore.kernel.org/r/20260304-update_fps_calculation-v1-1-4eeac373a504@oss.qualcomm.com
>> ---
>>   drivers/media/platform/qcom/iris/iris_instance.h   |  2 ++
>>   drivers/media/platform/qcom/iris/iris_vdec.c       | 20 
>> ++++++++++++++++++++
>>   drivers/media/platform/qcom/iris/iris_vpu_common.c |  6 +++++-
>>   3 files changed, 27 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_instance.h 
>> b/drivers/media/platform/qcom/iris/iris_instance.h
>> index 16965150f427..a47cd949645f 100644
>> --- a/drivers/media/platform/qcom/iris/iris_instance.h
>> +++ b/drivers/media/platform/qcom/iris/iris_instance.h
>> @@ -109,6 +109,8 @@ struct iris_inst {
>>       u32                metadata_idx;
>>       u32                codec;
>>       bool                last_buffer_dequeued;
>> +    u64                last_buf_ns;
>> +    u32                frame_counter;
>>       u32                frame_rate;
>>       u32                operating_rate;
>>       u32                hfi_rc_type;
>> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c 
>> b/drivers/media/platform/qcom/iris/iris_vdec.c
>> index 719217399a30..7fb45df37db6 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
>> @@ -54,6 +54,7 @@ int iris_vdec_inst_init(struct iris_inst *inst)
>>       f->fmt.pix_mp.quantization = V4L2_QUANTIZATION_DEFAULT;
>>       inst->buffers[BUF_OUTPUT].min_count = iris_vpu_buf_count(inst, 
>> BUF_OUTPUT);
>>       inst->buffers[BUF_OUTPUT].size = 
>> f->fmt.pix_mp.plane_fmt[0].sizeimage;
>> +    inst->frame_rate = MAXIMUM_FPS;
>>
>>       memcpy(&inst->fw_caps[0], &core->inst_fw_caps_dec[0],
>>              INST_FW_CAP_MAX * sizeof(struct platform_inst_fw_cap));
>> @@ -369,6 +370,8 @@ int iris_vdec_streamon_input(struct iris_inst *inst)
>>       if (ret)
>>           return ret;
>>
>> +    inst->frame_counter = 0;
>> +
>>       return iris_process_streamon_input(inst);
>>   }
>>
>> @@ -411,6 +414,7 @@ int iris_vdec_qbuf(struct iris_inst *inst, struct 
>> vb2_v4l2_buffer *vbuf)
>>   {
>>       struct iris_buffer *buf = to_iris_buffer(vbuf);
>>       struct vb2_buffer *vb2 = &vbuf->vb2_buf;
>> +    u64 cur_buf_ns, delta_ns;
>>       struct vb2_queue *q;
>>       int ret;
>>
>> @@ -427,6 +431,22 @@ int iris_vdec_qbuf(struct iris_inst *inst, 
>> struct vb2_v4l2_buffer *vbuf)
>>           return 0;
>>       }
>>
>> +    if (buf->type == BUF_INPUT) {
>> +        cur_buf_ns = ktime_get_ns();
>> +
>> +        if (!inst->frame_counter)
>> +            inst->last_buf_ns = cur_buf_ns;
>> +
>> +        inst->frame_counter++;
>> +        delta_ns = cur_buf_ns - inst->last_buf_ns;
>> +
>> +        if (delta_ns >= NSEC_PER_SEC) {
>> +            inst->frame_rate = clamp_t(u32, inst->frame_counter, 
>> DEFAULT_FPS,
>> +                           MAXIMUM_FPS);
>> +            inst->frame_counter = 0;
>> +        }
>> +    }
>> +
>>       iris_scale_power(inst);
>>
>>       return iris_queue_buffer(inst, buf);
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
>>
>>       width = max(inp_f->fmt.pix_mp.width, inst->crop.width);
>>       height = max(inp_f->fmt.pix_mp.height, inst->crop.height);
>> @@ -435,6 +435,10 @@ u64 iris_vpu3x_vpu4x_calculate_frequency(struct 
>> iris_inst *inst, size_t data_siz
>>       if (inst->fw_caps[PIPE].value > 1)
>>           vpp_cycles += div_u64(vpp_cycles * 59, 1000);
>>
>> +    /* 1.05 is VPP FW overhead */
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
>> -- 
>> Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>>
>>
>
> Please fix your doxygen.
>
> [[ATTACHMENT|junit/test-kernel-doc.log.txt]]
> 4 warnings as errors
> Warning: drivers/media/platform/qcom/iris/iris_instance.h:124 struct 
> member 'last_buf_ns' not described in 'iris_inst'
> Warning: drivers/media/platform/qcom/iris/iris_instance.h:124 struct 
> member 'frame_counter' not described in 'iris_inst'
> Warning: drivers/media/platform/qcom/iris/iris_instance.h:124 struct 
> member 'last_buf_ns' not described in 'iris_inst'
> Warning: drivers/media/platform/qcom/iris/iris_instance.h:124 struct 
> member 'frame_counter' not described in 'iris_inst'
>
>
> System Err:
>
> [[ATTACHMENT|junit/test-kernel-doc.err.txt]]
> Warning: drivers/media/platform/qcom/iris/iris_instance.h:124 struct 
> member 'last_buf_ns' not described in 'iris_inst'
> Warning: drivers/media/platform/qcom/iris/iris_instance.h:124 struct 
> member 'frame_counter' not described in 'iris_inst'
> Warning: drivers/media/platform/qcom/iris/iris_instance.h:124 struct 
> member 'last_buf_ns' not described in 'iris_inst'
> Warning: drivers/media/platform/qcom/iris/iris_instance.h:124 struct 
> member 'frame_counter' not described in 'iris_inst'
>
Ack
Vishnu Reddy.
> ---
> bod

