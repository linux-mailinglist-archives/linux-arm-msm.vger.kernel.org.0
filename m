Return-Path: <linux-arm-msm+bounces-104410-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QH5QMjU262nRJwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104410-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 11:21:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F68D45C17B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 11:21:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E98F7301E5A5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 09:17:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7089C37DE81;
	Fri, 24 Apr 2026 09:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ler9R/RQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dhwtm89n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDBB9372B24
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 09:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777022273; cv=none; b=rTpNhe5sIYs/vawynjXOFYYsm2nW4EpHWbyMV7/UnOafG6iVbeAcPexKaGMdTR30GEOxHGvqGhLhIOGp+mW5EFXr5dx32IUOPTnYKLa6GmJhlrMAm0YCOfT/FV+g1lh0l+0ltJdQ/FTQFEaINcQdcYUXU7Iu/2WGAk/zaCvc4mU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777022273; c=relaxed/simple;
	bh=ZqD9SCbSH5/aik2kX9oPA2bNhJzOsnyxshXjNaCGGS4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jKDo2eCs29y3w3L3kxy+TXYK5mafdSQAJrTcHqO+fhl0OUkyfjrDwIXIIxD4NIP+PXEYnPa3qhmRl4LOqeABbSts5CIDNEKjuMcYqy0xE3SXWREh/stqeyDxYjx6NqEQT5Gwa0lToHeT58UGuMuznX0Yq7bK/CECQknSBhvvKlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ler9R/RQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dhwtm89n; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O5kUSU1959422
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 09:17:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZqD9SCbSH5/aik2kX9oPA2bNhJzOsnyxshXjNaCGGS4=; b=ler9R/RQwVPLaFBw
	QTto4e4FT8hhSvQBmGbiMupbl8C6Z0NoDBHOVyrzFz3LGhuW1hsKQUVizLozF/da
	1W9E1QAkOZHe/W2VgpglzjkR2zFt61FLDgGyBvbT5ztpPRHIElEje875bNKq5fjt
	uwAaBBEg0/80XZsEsmWOOsVLLd8d+8Ill2uXnIfXdLa92ei4sUiftNYihWKVbiVV
	VpkY+H4s+qSJODhaQDJuBRwEjkuoMKHdcXByp33MOv4o8iGjX4kdUw/8kk7FOi+1
	c6faHB3MoYuVosMYxUbk8c49bd0K2UO3AQoFgncOfGV1K3IyvK45QreBZFOQpHf8
	IyWKHA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dr2nrgx09-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 09:17:51 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82fa6c3a77cso4391330b3a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 02:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777022270; x=1777627070; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZqD9SCbSH5/aik2kX9oPA2bNhJzOsnyxshXjNaCGGS4=;
        b=dhwtm89nMsLCDiYN9FteF+PNcKkylUaDtn2uxjqL4/t+I/89AYP4OLwwbmveEh6Y0O
         wkfjl6tg85Y5fvrgyJUoNYUij45zh5SOeJLbWpQve4Et3hueheYJi4H58UUttic9IG2i
         3veyzj3RZo/h/I8NNyaUFpLIwD/ADremeb/RO5NjIHhQT8ZDdMbCL/A2FIiqn2t+7rdM
         72xUMd/y9OO4K3M3oXHfGiv/afQd3/yz/e7IOBzN88ncJH4QmxPFCF0a8FS6EQf4TIup
         JbZ8zd1DMYsuBJOEyMhIS8m/wZAPcsbia+a/53j/7vAkaIRsxdTr67CEqYtN8ucpoixQ
         Vgsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777022270; x=1777627070;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZqD9SCbSH5/aik2kX9oPA2bNhJzOsnyxshXjNaCGGS4=;
        b=A1Be9xXfK/7q66jASxHwZWz2B1aR8yJvKMIMsVil5qwjKEoQllpgTtJyug1A9vFu5t
         yeMDZVeOj0NiDrOBUu1wgwRzx6k/MlOqNQMVXA36+HfvoW/XuplG1tl4OcYc5xMJx7w3
         j5mOvrGsXhcZiHT8c8mY3YCCks01uYiSe+584t57Mex0GSoeZW10cGuw/mrucz8Pw9xV
         CVhJndwN9UDnZ8qRTzVgnlx3E0e7qYxXhPa/GLLlrWgP+/tp7VuKzvv7o5nJfcoAwCZH
         7fW7HXVYxgiwTWoriTkVYRO0Acd1QWg1caVqmM6lsxxQbW3XAAm/2rvSeswxhL9SKMQV
         Qgtw==
X-Forwarded-Encrypted: i=1; AFNElJ+k3F9KfGDAk+8Qj59IaKvTCCz7nNezx5U5eoBeTqt+rewLlKJckHsDeuq8SSajNJ3YAPhTEkjIXFG9m4tv@vger.kernel.org
X-Gm-Message-State: AOJu0YxNJkqKlrh8l9KBuL0tECOCuiUh7YSWRiKsNwNbbwxaE4pmWNFz
	J/oFVooSBC2TeBZJngEBgoqbsxZs63RXtSi0Wbu5KCiFY9pLp4MQy3+4hGv0TYXx+EZ6Lh0nM00
	4xnn14pQ5pV7Pw5X2g+338ZKihexVz5PKtWizWdcnaDgjvpW1ZhZNvv18m3jy8/Na1nP4
X-Gm-Gg: AeBDieuMr7CF53aJ7peYz4gGcRuSvnATf2T0bRuZvfv82SjzNQZyawkN4rZj5+AFZXB
	nGYkoBTkHewpH4ZSMsvrRyCqyLEn0VnCfKMyTECpQPtukbg+2ZkgamAeWi8ECKDBqx/fZvnOXif
	NkS0ZSzmYuM+cL1Yntwuz6RGL7slquLPJXj0puKSFNvNchHeOqjpH2Hx31dOlrkD8qCePFPDBqm
	HktmRxFk9KC5ukGm7HMKJlsy85/p4XEUpgwDCwvG8d+EdPsUEbs9sTQLISuWoEE0DD0qLHr0w64
	Rswe1SN4FKFyJwX3i+SlQ4vgimjFRQLoxTVS56qBUz4Kc5ychCGb57tOcQqgVxCQ1f1AHu4IYuh
	dgFGe38rd1Jjn+ArQUlbbOQ7FF9S6j32ztYU1dS7lNsWBzYhYf2oOGfe4xnDHCY3pdQ==
X-Received: by 2002:a05:6a00:2da2:b0:82c:9c47:fef9 with SMTP id d2e1a72fcca58-82f8c87e249mr34286771b3a.2.1777022270462;
        Fri, 24 Apr 2026 02:17:50 -0700 (PDT)
X-Received: by 2002:a05:6a00:2da2:b0:82c:9c47:fef9 with SMTP id d2e1a72fcca58-82f8c87e249mr34286725b3a.2.1777022269873;
        Fri, 24 Apr 2026 02:17:49 -0700 (PDT)
Received: from [192.168.29.100] ([49.43.194.239])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebe40dasm22540997b3a.40.2026.04.24.02.17.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 02:17:49 -0700 (PDT)
Message-ID: <ec1a0557-18eb-4b16-7c10-95b69ea7e63a@oss.qualcomm.com>
Date: Fri, 24 Apr 2026 14:47:44 +0530
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
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <lWwJ9pbXoZXg350L9fA8Sx-qznLud6KXnJlBTFNBLZQXEwKZeI50KGzJPDq43FO2QtbisF9pyxxeVTXX-WvN0Q==@protonmail.internalid>
 <20260421-optimize_comv_buffer-v1-1-7c9a24da3ad3@oss.qualcomm.com>
 <c0a23200-e3f3-46ad-9057-4ee8723d2f43@kernel.org>
 <899e0575-6de3-4ab7-b817-7a51c6b45787@oss.qualcomm.com>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <899e0575-6de3-4ab7-b817-7a51c6b45787@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDA4NiBTYWx0ZWRfX+P/z2EzI3nAd
 6127s6m7R5lSEoUnJt1TZPzuazhTHfd7ZiNrNQkTp2sAvmxVGKESLhb2BUHf2+KuYeXxaJThQK3
 P4RFQM3f+JNUBRR0sPh5bv0AT0qOd89px1LhUJHxVmqhM8cSmXhvtXIGD9z0oKtLhfzLsSSDS6x
 cvSx4Gr1aJCCgRCEKAGGVOd5nicrs3cK5OeXttZH4zDUo1NmvsH9DugULbs8muC21X0pe9zs9dS
 uRXkSKz79SMJ7FB3yVVuidi6ZSuHVd14UIVFtGkocRaQ3AiTCarDOOpYgvBZXI2WmaQ1xQsRV2H
 d65J4ZxecVF3EWqFxxH5J6i6Hkd1WpFNeJEYVTx8QaeM1UNUYEYMfYj9NCu6DHb2+DkVVkjqMD7
 SM8ZC+fX+ikOTW4le0MPU12fhpJTFPPZOBCdLIsn/yghBCObeYJUhSeHd7cP4X9eoblM7XMN2j8
 NMQa8jEnLxnhogF04cw==
X-Authority-Analysis: v=2.4 cv=UqpT8ewB c=1 sm=1 tr=0 ts=69eb353f cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=gkiTcqCCC2T/77GpOVv7Jg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=LgKhh46ExfKBiJyGOCMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: Wj6Tr5GMgDlLTUCF_PnNNEAs3_Yoh_Nm
X-Proofpoint-GUID: Wj6Tr5GMgDlLTUCF_PnNNEAs3_Yoh_Nm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604240086
X-Rspamd-Queue-Id: 2F68D45C17B
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104410-lists,linux-arm-msm=lfdr.de];
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


On 4/22/2026 1:12 PM, Vikash Garodia wrote:
>
>
> On 4/21/2026 2:31 PM, Bryan O'Donoghue wrote:
>> On 21/04/2026 07:41, Vishnu Reddy wrote:
>>> The existing iris_vpu_dec_comv_size() used VIDEO_MAX_FRAME (32) as
>>> num_comv count unconditionally when calculating the COMV buffer size.
>>> This resulted in an oversized COMV buffer allocation throughout decode
>>> session, wasting memory regardless of actual number of buffers required.
>>
>> You should define what a COMV buffer is before talking about how you are
>> changing it, i.e. define the term Co-located Motion Vector (CMOV) and then
>> use the abbreviation CMOV liberally as you wish.
>>
>>> For VPU3x and VPU4x platforms, introduce iris_vpu3x_4x_dec_comv_size() to
>>> replace iris_vpu_dec_comv_size(). It derives num_comv dynamically, it
>>
>> "These derive num_cmove dynamically"
>>
>>> uses inst->fw_min_count once the firmware has reported its minimum buffer
>>> requirements, and fallback to inst->buffers[BUF_OUTPUT].min_count during
>>> initialization before firmware has communicated its requirements. This
>>> aligns the COMV buffer size to the actual count needed rather than always
>>> allocating with fixed VIDEO_MAX_FRAME value.
>>>
>>> Additionally, during iris_vdec_inst_init(), fw_min_count was initialized
>>> to MIN_BUFFERS instead of 0. This masked the fallback logic and caused the
>>> COMV size calculation to use MIN_BUFFERS even before firmware had reported
>>> its actual requirements. Fix this by initializing fw_min_count to 0.
>>>
>>> During testing of 1080p AVC, it reduces the COMV buffer size from 32.89MB
>>> to 6.16MB per decode session, significantly reducing memory consumption.
>>
>> Cool nice fix.
>>
>
> Indeed, a good saving.
>
>>>
>>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>>> ---
>>>   drivers/media/platform/qcom/iris/iris_vdec.c       |  2 +-
>>>   drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 24 ++++++++++++
>>> +++++++---
>>>   drivers/media/platform/qcom/iris/iris_vpu_buffer.h |  1 +
>>>   3 files changed, 23 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/
>>> media/platform/qcom/iris/iris_vdec.c
>>> index 719217399a30..f433065e08b2 100644
>>> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
>>> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
>>> @@ -24,7 +24,7 @@ int iris_vdec_inst_init(struct iris_inst *inst)
>>>       inst->fmt_src = kzalloc_obj(*inst->fmt_src);
>>>       inst->fmt_dst = kzalloc_obj(*inst->fmt_dst);
>>>
>>> -    inst->fw_min_count = MIN_BUFFERS;
>>> +    inst->fw_min_count = 0;
>>>
>>>       f = inst->fmt_src;
>>>       f->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
>>> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/
>>> drivers/media/platform/qcom/iris/iris_vpu_buffer.c
>>> index 9270422c1601..57237543b229 100644
>>> --- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
>>> +++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
>>> @@ -731,6 +731,23 @@ static u32 iris_vpu_dec_comv_size(struct iris_inst *inst)
>>>       u32 height = f->fmt.pix_mp.height;
>>>       u32 width = f->fmt.pix_mp.width;
>>>
>>> +    if (inst->codec == V4L2_PIX_FMT_H264)
>>> +        return hfi_buffer_comv_h264d(width, height, num_comv);
>>> +    else if (inst->codec == V4L2_PIX_FMT_HEVC)
>>> +        return hfi_buffer_comv_h265d(width, height, num_comv);
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static u32 iris_vpu3x_4x_dec_comv_size(struct iris_inst *inst)
>>> +{
>>> +    struct v4l2_format *f = inst->fmt_src;
>>> +    u32 height = f->fmt.pix_mp.height;
>>> +    u32 width = f->fmt.pix_mp.width;
>>> +    u32 num_comv;
>>> +
>>> +    num_comv = inst->fw_min_count ? inst->fw_min_count : inst-
>>> >buffers[BUF_OUTPUT].min_count;
>>
>> Please just if/else this though its far easier to read/understand that way.
>>
>>> +
>>>       if (inst->codec == V4L2_PIX_FMT_H264)
>>>           return hfi_buffer_comv_h264d(width, height, num_comv);
>>>       else if (inst->codec == V4L2_PIX_FMT_HEVC)
>>> @@ -739,7 +756,8 @@ static u32 iris_vpu_dec_comv_size(struct iris_inst *inst)
>>>           if (inst->fw_caps[DRAP].value)
>>>               return 0;
>>>           else
>>> -            return hfi_buffer_comv_av1d(width, height, num_comv);
>>> +            return hfi_buffer_comv_av1d(width, height,
>>> +                            num_comv + AV1D_COMV_BUFFER_OVERHEAD);
>>>       }
>>>
>>>       return 0;
>>> @@ -2025,7 +2043,7 @@ u32 iris_vpu_buf_size(struct iris_inst *inst, enum
>>> iris_buffer_type buffer_type)
>>>
>>>       static const struct iris_vpu_buf_type_handle
>>> dec_internal_buf_type_handle[] = {
>>>           {BUF_BIN,         iris_vpu_dec_bin_size             },
>>> -        {BUF_COMV,        iris_vpu_dec_comv_size            },
>>> +        {BUF_COMV,        iris_vpu3x_4x_dec_comv_size       },
>>>           {BUF_NON_COMV,    iris_vpu_dec_non_comv_size        },
>>>           {BUF_LINE,        iris_vpu_dec_line_size            },
>>>           {BUF_PERSIST,     iris_vpu_dec_persist_size         },
>>> @@ -2098,7 +2116,7 @@ u32 iris_vpu4x_buf_size(struct iris_inst *inst, enum
>>> iris_buffer_type buffer_typ
>>>
>>>       static const struct iris_vpu_buf_type_handle
>>> dec_internal_buf_type_handle[] = {
>>>           {BUF_BIN,         iris_vpu_dec_bin_size         },
>>> -        {BUF_COMV,        iris_vpu_dec_comv_size        },
>>> +        {BUF_COMV,        iris_vpu3x_4x_dec_comv_size   },
>>>           {BUF_NON_COMV,    iris_vpu_dec_non_comv_size    },
>>>           {BUF_LINE,        iris_vpu4x_dec_line_size      },
>>>           {BUF_PERSIST,     iris_vpu4x_dec_persist_size   },
>>> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.h b/
>>> drivers/media/platform/qcom/iris/iris_vpu_buffer.h
>>> index 12640eb5ed8c..7a9cc1c92da3 100644
>>> --- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
>>> +++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
>>> @@ -110,6 +110,7 @@ struct iris_inst;
>>>   #define MAX_PE_NBR_DATA_LCU16_LINE_BUFFER_SIZE 96
>>>   #define AV1D_NUM_HW_PIC_BUF    16
>>>   #define AV1D_NUM_FRAME_HEADERS 16
>>> +#define AV1D_COMV_BUFFER_OVERHEAD 7
>>
>> Whats this ? Why is there a new seven byte overhead ? Does it represent a
>> header, an alignment ?
>
> Vishnu, pls check if we need to add this as initial count was 18 [1] ? What if
> initial count was 11 [2], and post DRC, fw_min_count would be 11 too for AV1d,
> so the overhead can be avoided.
>
> [1]
> https://elixir.bootlin.com/linux/v7.0-rc7/source/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c#L1220
>
> [2]
> https://elixir.bootlin.com/linux/v7.0-rc7/source/drivers/media/platform/qcom/iris/iris_vpu_buffer.c#L2157
>

Thanks for the information, will check and update in next revision.

> Regards,
> Vikash
>>
>> An overhead can mean anything.
>>
>>>   #define SIZE_AV1D_SEQUENCE_HEADER 768
>>>   #define SIZE_AV1D_METADATA        512
>>>   #define SIZE_AV1D_FRAME_HEADER    1280
>>>
>>> ---
>>> base-commit: 4fbeef21f5387234111b5d52924e77757626faa5
>>> change-id: 20260421-optimize_comv_buffer-ae7107673609
>>>
>>> Best regards,
>>> -- 
>>> Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>>>
>>
>>
>

