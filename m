Return-Path: <linux-arm-msm+bounces-101084-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sDDWG/Xmy2myMQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101084-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 17:23:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B5F36B971
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 17:23:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 996DF3010BB6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 15:18:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEBB0402435;
	Tue, 31 Mar 2026 15:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QzgDFR5u";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ct6bDKpp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9848C1DF748
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 15:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774970298; cv=none; b=OCTr9N1Z9Eobgu5sHhgfh/moW72C1aJagd9/o5KxIF7/EqdZzO/a7q6sKhah19XGDQONRQRYSUakhPSjkQuXKwftniFw0a16hQwZ/+COSHtoiR8PACwGrr1JoJrTng0H5vZLHgU/aZpl7VpivN3TQ6dWiOw7dQWNIK5vhXSHZSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774970298; c=relaxed/simple;
	bh=/lsOE6TqJ9iksaykE4MyP83YRb2jljX5RAJv1AdU6XA=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=PWDEpju6KDpEKnCunPbnk9kB/bIPWx7khiWXwRuaZYCbDsmz2uXKKg8nvrxm9vntIrplJeuXvM5qXuDnLeqFtP78ap/G70e4AOCRGPF1BtS75WRBe2ktFptueRyLlrVsQTwZ3gwyaiY3yagHjzDuO4NOVhsFv0cMeteuk+fdWew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QzgDFR5u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ct6bDKpp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62VCwrlK2465261
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 15:18:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lLMkwz7Yi/zXO46TtGqdKX8JGWZs4KKD7BRQgHrJUAc=; b=QzgDFR5uQJRRpfVR
	UnKcaacV6UXUjRKc0iydS5IvO4EndMsj7+OMO8AepsnXM6eIsmHql02jFPGwQveA
	lGa0/kizrDWIrrD0bgnWIvdPgrqDYXe6tEcijkP8GCCiPib3tu7xVH5asLaFCO2M
	K818VKZoWzFL0WReX83889YLPPMMvs9ngehAtXYA438oLEBqJpZNJ2PF3yeT6hEh
	LwU6kTGgY5rE4JE0oHGWQSiDB0PFKJM/FGmLteokLyN1xxbbEd4NhI6L66aCWdcV
	15wLZhGXM7/TugctATEv879Q6a8Dt17dQZXLbMPqnpLXu23dIeVITORLrYn13UFb
	w99zCA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d89uta2pa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 15:18:14 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82ce0a9e125so370432b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 08:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774970293; x=1775575093; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lLMkwz7Yi/zXO46TtGqdKX8JGWZs4KKD7BRQgHrJUAc=;
        b=Ct6bDKppA72P8uJzd6fJNinECWFI5IWjYszQ3XEyCP70pUwqE+AMt+S68fYDS+0V6E
         QK9MCTFgeJHv+korGPpPgmg/QQcWw/E5X+6RILOFzHInNoU3JdX3ejuuRmDISLw8EVUO
         IjRL/NiHbte6lbzGJ5x75kWzeFpKiwh2eLAE9jWdD0DZJt8SwDAwJ8Wf5CaFKaBuajrx
         ARetnBOlPOeukU8QmFtqOZswUF4TbXMCuwEeYe5uJ3gRpuQDExAeZfDlzr/WcZCBOl+X
         zq01ho1ch6eflAH5s7HI7biCP1br9/1uz/xfI7VVSTUELlOc7DqUxt/CQKugbrMN5An7
         ytkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774970293; x=1775575093;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lLMkwz7Yi/zXO46TtGqdKX8JGWZs4KKD7BRQgHrJUAc=;
        b=ige3wGPOBH9ImVh7Lz0/4TyFaq+RWkJtPM+AOTk9wr4UxUnZLHr3wJsZ0/jq9H3oOF
         0R3ZUvLQTV1ySW+JRt3VHrIyQRNKSKdHsKe9i+pmHUhrZP3vd8FO8J50yiwdtI+dQHUd
         KjxDU8nt5A8HDVoNHvxhHOJZmFHp9dtHuyBpHJExQuOX29tRHfKXLF57cxm1Zf9FbYcx
         tdyLJ1/la0U9K3e0CLSq1UIFkKtuLdcimlhIcMz9Qu85Bvw/SjpFRlw8otxXmC0pY0sj
         trCE+2K4D2cUyq0v8XWfilsQCZZ5Ro8PzdaHuEGYI1vEJ0Yzhf4uMYTtc/B5StLTfO0H
         9Z7Q==
X-Forwarded-Encrypted: i=1; AJvYcCV6GMFCh2jAdSC+BISBzqR7a7idclybdaTVKkSgR/LEzU89jewS9KhvXyYDOvNIHID6I3K9lTysyJMH+IVm@vger.kernel.org
X-Gm-Message-State: AOJu0YwjHR+Qg/YcrtqL44oU6NuBTrt7QiKu1ycLXChqXVAIlKAgA7kO
	993f/qteXjZsKhtuR/W/Me66WZUy8h6s0MlmKbfswgnBp/L0sp6AccHcfX2k/QjZ7IXWziNysc5
	/VIkUav/CYy9ldbNtdS/JG507h5ozEIAeVqsENL28NnCWJkHw1jblHSeAO0S042O8zJPJhvZ2GF
	Ha
X-Gm-Gg: ATEYQzwK8KefThwYEx/ul/vDjgBX1k6yscBu1JzCkPTc6Iy+y0RoMQxu9Z8tRcHdx09
	0eYXkAoEzJmRv5KuBTJlsS2Ptg2KUOK77OdM8iCT/Y7WQdxSyokSOQ37kqeS/N4fNxr7bmXqN+3
	SZF8ldfaX41blyENP02qz3Rv7NS7ut7cbooDpAYNtyeWf2JkfzDAYYVjcWhbUCA51U2I4MkpX2f
	TwK2heqYAxgDU47RkpGeSxrNte7lVrnfVGs6A5YBozbOpcnFPiCtqbQ0PBfkicSesge0bnFe2G+
	lGjxOxm/Ksgb1cC3bTFNVLC6rpvNJAKzTJHCmBnpDMFEpNz2wJJLvw84Q6DCf+yByvdK3LQ3s9C
	Di5jFIl+gMkh46aUrJjfA6bM+QFpBJgbkVhoXKdVw8wtMMOo9CvA=
X-Received: by 2002:a05:6a00:451b:b0:82c:9fe1:aa4e with SMTP id d2e1a72fcca58-82ce8956308mr28322b3a.21.1774970292954;
        Tue, 31 Mar 2026 08:18:12 -0700 (PDT)
X-Received: by 2002:a05:6a00:451b:b0:82c:9fe1:aa4e with SMTP id d2e1a72fcca58-82ce8956308mr28270b3a.21.1774970292363;
        Tue, 31 Mar 2026 08:18:12 -0700 (PDT)
Received: from [192.168.0.5] ([49.205.255.13])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca85fc735sm10552942b3a.40.2026.03.31.08.18.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 08:18:11 -0700 (PDT)
Message-ID: <3f5bddbc-e4d3-6474-22f0-a68ee27296de@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 20:48:06 +0530
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
Content-Language: en-US
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
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
 <e930aabf-2876-5a19-50e4-5f6130d601a0@oss.qualcomm.com>
In-Reply-To: <e930aabf-2876-5a19-50e4-5f6130d601a0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: G-xfFv93j1I8_eRt2mHA8jq9TerrLXoG
X-Authority-Analysis: v=2.4 cv=C5LkCAP+ c=1 sm=1 tr=0 ts=69cbe5b6 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=oBuh6LqfVrjb6oiH9OVomg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=rkbFAUwAFsWdHakyx1AA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: G-xfFv93j1I8_eRt2mHA8jq9TerrLXoG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDE0OCBTYWx0ZWRfX1Cl0+ANnmO3X
 vc4EwfwlM9my26xGEZxFS5lX+87YlQTTnqX1D+5W7OLoHoW/IOEzU+FE6dS+YyEP9Mc324QTt2k
 SCxkWSt/j1IZ0NZlZZf7WN26/hwReDF95pmmIkfk28MChHko2EMjDoWjTxg7h7GYffrFa2vZgSh
 XP7TTxykVthknWVxq5pEMqIa0WOjds1PukIrki0XZkyHgceRIPEYLNH11CvvzC2G+v1C4pjbQVP
 B/zXYHoT8MmM2RHug+dpya7boM6S+Y/Z4/LnRsOiIGX7LYKMXInfR/Lh98RdAFVreK0DM+WuVaL
 ztgoLGx6dEAlMrR6XKjSQKQc8mxJzclrbaGzClp89ooS1VX4915RfqpO3sQw2Zuh+GHMPE2Gt4O
 LPbqwlTKzKH+lbOv1WD7QQ4PFQ30ukGIXSwt/Szn/w5Q3PUrEqQ4Bu8obdx3syF14+8LpD7dYnv
 Fu3joRgEi7f8MNJ0W6w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_03,2026-03-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310148
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101084-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: B9B5F36B971
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 3/31/2026 8:29 PM, Vishnu Reddy wrote:
>
> On 3/31/2026 7:45 PM, Bryan O'Donoghue wrote:
>> On 25/03/2026 16:35, Vishnu Reddy wrote:
>>> The driver was using a fixed default FPS value when calculating the VPU
>>> frequency. This caused wrong frequency requests for high‑frame‑rate
>>> streams, for example 4K at 240 FPS. Because of this, the hardware was
>>> running at a lower frequency than needed.
>>>
>>> Add the FPS measurement based on the decoder input buffer arrival rate.
>>> The measured FPS is stored per instance and used in frequency 
>>> calculation
>>> instead of the fixed default FPS. The value is clamped so that it does
>>> not exceed platform limits. Add a VPP firmware overhead when running in
>>> STAGE_2.
>>>
>>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>>> ---
>>> Changes in v4:
>>> - Renamed the variable names (Vikash Garodia)
>>> - Updated the fps calculation logic (Vikash Garodia)
>>> - Link to v3: 
>>> https://lore.kernel.org/r/20260325-update_fps_calculation-v3-1-b2ec654f7e4d@oss.qualcomm.com
>>>
>>> Changes in v3:
>>> - Updated the frame_count condition check (Vikash Garodia)
>>> - Link to v2: 
>>> https://lore.kernel.org/r/20260305-update_fps_calculation-v2-1-e3b5cccb1246@oss.qualcomm.com
>>>
>>> Changes in v2:
>>> - Replaced div_u64 with mult_frac (Konrad Dybcio)
>>> - Link to v1: 
>>> https://lore.kernel.org/r/20260304-update_fps_calculation-v1-1-4eeac373a504@oss.qualcomm.com
>>> ---
>>>   drivers/media/platform/qcom/iris/iris_instance.h   |  2 ++
>>>   drivers/media/platform/qcom/iris/iris_vdec.c       | 20 
>>> ++++++++++++++++++++
>>>   drivers/media/platform/qcom/iris/iris_vpu_common.c |  6 +++++-
>>>   3 files changed, 27 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/media/platform/qcom/iris/iris_instance.h 
>>> b/drivers/media/platform/qcom/iris/iris_instance.h
>>> index 16965150f427..a47cd949645f 100644
>>> --- a/drivers/media/platform/qcom/iris/iris_instance.h
>>> +++ b/drivers/media/platform/qcom/iris/iris_instance.h
>>> @@ -109,6 +109,8 @@ struct iris_inst {
>>>       u32                metadata_idx;
>>>       u32                codec;
>>>       bool                last_buffer_dequeued;
>>> +    u64                last_buf_ns;
>>> +    u32                frame_counter;
>>>       u32                frame_rate;
>>>       u32                operating_rate;
>>>       u32                hfi_rc_type;
>>> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c 
>>> b/drivers/media/platform/qcom/iris/iris_vdec.c
>>> index 719217399a30..7fb45df37db6 100644
>>> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
>>> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
>>> @@ -54,6 +54,7 @@ int iris_vdec_inst_init(struct iris_inst *inst)
>>>       f->fmt.pix_mp.quantization = V4L2_QUANTIZATION_DEFAULT;
>>>       inst->buffers[BUF_OUTPUT].min_count = iris_vpu_buf_count(inst, 
>>> BUF_OUTPUT);
>>>       inst->buffers[BUF_OUTPUT].size = 
>>> f->fmt.pix_mp.plane_fmt[0].sizeimage;
>>> +    inst->frame_rate = MAXIMUM_FPS;
>>>
>>>       memcpy(&inst->fw_caps[0], &core->inst_fw_caps_dec[0],
>>>              INST_FW_CAP_MAX * sizeof(struct platform_inst_fw_cap));
>>> @@ -369,6 +370,8 @@ int iris_vdec_streamon_input(struct iris_inst 
>>> *inst)
>>>       if (ret)
>>>           return ret;
>>>
>>> +    inst->frame_counter = 0;
>>> +
>>>       return iris_process_streamon_input(inst);
>>>   }
>>>
>>> @@ -411,6 +414,7 @@ int iris_vdec_qbuf(struct iris_inst *inst, 
>>> struct vb2_v4l2_buffer *vbuf)
>>>   {
>>>       struct iris_buffer *buf = to_iris_buffer(vbuf);
>>>       struct vb2_buffer *vb2 = &vbuf->vb2_buf;
>>> +    u64 cur_buf_ns, delta_ns;
>>>       struct vb2_queue *q;
>>>       int ret;
>>>
>>> @@ -427,6 +431,22 @@ int iris_vdec_qbuf(struct iris_inst *inst, 
>>> struct vb2_v4l2_buffer *vbuf)
>>>           return 0;
>>>       }
>>>
>>> +    if (buf->type == BUF_INPUT) {
>>> +        cur_buf_ns = ktime_get_ns();
>>> +
>>> +        if (!inst->frame_counter)
>>> +            inst->last_buf_ns = cur_buf_ns;
>>> +
>>> +        inst->frame_counter++;
>>> +        delta_ns = cur_buf_ns - inst->last_buf_ns;
>>> +
>>> +        if (delta_ns >= NSEC_PER_SEC) {
>>> +            inst->frame_rate = clamp_t(u32, inst->frame_counter, 
>>> DEFAULT_FPS,
>>> +                           MAXIMUM_FPS);
>>> +            inst->frame_counter = 0;
>>> +        }
>>> +    }
>>> +
>>>       iris_scale_power(inst);
>>>
>>>       return iris_queue_buffer(inst, buf);
>>> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c 
>>> b/drivers/media/platform/qcom/iris/iris_vpu_common.c
>>> index 548e5f1727fd..d621ccffa868 100644
>>> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
>>> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
>>> @@ -416,7 +416,7 @@ u64 iris_vpu3x_vpu4x_calculate_frequency(struct 
>>> iris_inst *inst, size_t data_siz
>>>       u32 height, width, mbs_per_second, mbpf;
>>>       u64 fw_cycles, fw_vpp_cycles;
>>>       u64 vsp_cycles, vpp_cycles;
>>> -    u32 fps = DEFAULT_FPS;
>>> +    u32 fps = inst->frame_rate;
>>>
>>>       width = max(inp_f->fmt.pix_mp.width, inst->crop.width);
>>>       height = max(inp_f->fmt.pix_mp.height, inst->crop.height);
>>> @@ -435,6 +435,10 @@ u64 iris_vpu3x_vpu4x_calculate_frequency(struct 
>>> iris_inst *inst, size_t data_siz
>>>       if (inst->fw_caps[PIPE].value > 1)
>>>           vpp_cycles += div_u64(vpp_cycles * 59, 1000);
>>>
>>> +    /* 1.05 is VPP FW overhead */
>>> +    if (inst->fw_caps[STAGE].value == STAGE_2)
>>> +        vpp_cycles += mult_frac(vpp_cycles, 5, 100);
>>> +
>>>       vsp_cycles = fps * data_size * 8;
>>>       vsp_cycles = div_u64(vsp_cycles, 2);
>>>       /* VSP FW overhead 1.05 */
>>>
>>> ---
>>> base-commit: f505e978d1a0442adbbde48aed38c084ddea6d6e
>>> change-id: 20260304-update_fps_calculation-98ee7f7507b1
>>>
>>> Best regards,
>>> -- 
>>> Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>>>
>>>
>>
>> Please fix your doxygen.
>>
>> [[ATTACHMENT|junit/test-kernel-doc.log.txt]]
>> 4 warnings as errors
>> Warning: drivers/media/platform/qcom/iris/iris_instance.h:124 struct 
>> member 'last_buf_ns' not described in 'iris_inst'
>> Warning: drivers/media/platform/qcom/iris/iris_instance.h:124 struct 
>> member 'frame_counter' not described in 'iris_inst'
>> Warning: drivers/media/platform/qcom/iris/iris_instance.h:124 struct 
>> member 'last_buf_ns' not described in 'iris_inst'
>> Warning: drivers/media/platform/qcom/iris/iris_instance.h:124 struct 
>> member 'frame_counter' not described in 'iris_inst'
>>
>>
>> System Err:
>>
>> [[ATTACHMENT|junit/test-kernel-doc.err.txt]]
>> Warning: drivers/media/platform/qcom/iris/iris_instance.h:124 struct 
>> member 'last_buf_ns' not described in 'iris_inst'
>> Warning: drivers/media/platform/qcom/iris/iris_instance.h:124 struct 
>> member 'frame_counter' not described in 'iris_inst'
>> Warning: drivers/media/platform/qcom/iris/iris_instance.h:124 struct 
>> member 'last_buf_ns' not described in 'iris_inst'
>> Warning: drivers/media/platform/qcom/iris/iris_instance.h:124 struct 
>> member 'frame_counter' not described in 'iris_inst'
>>
> Ack
> Vishnu Reddy.

v5 addressing above, please apply.
Vishnu Reddy.

>> ---
>> bod

