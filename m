Return-Path: <linux-arm-msm+bounces-95727-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iOYlL+uRqml0TQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95727-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 09:35:55 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 19FEA21D2C6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 09:35:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 79B17301653E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 08:35:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F03FE318BA6;
	Fri,  6 Mar 2026 08:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TLPkKVpt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Uodsciiy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 121C7376486
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 08:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772786152; cv=none; b=i2y0bde3qrcZk+VoKw8aPnwpXidGSSeWOxjsjHJpv5rYeDLvU6cEmdYJV6JcPDAU24UnyqWXycy804qTHX50bJxFYiFOpjA5qJvrvzv0hMLrQ30ScENxFkmuxAaJmbwFJ5oSlBQ1XCA9PCMMjIZmE0lCbvGotYTaa7xQKfATujY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772786152; c=relaxed/simple;
	bh=uDg+eXXc82VfCk6xMKbsneT6Tpz1j1l0OhD2Jtmju5U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b3uglmg/LMbvdhw9jjRFd5RxPDoeQcYbiGxTDgW2cF8+TlXjk4iahB89+5TF+BSi9JmIKRRlEzNuZWuZLRrMoaSu/TW3XcStWFm3cTQkJL+wjwiNsjOFmS58m+gOd9kFO+TAnc+ukcHq8gzRYs6hIL/yiCB1NrrrQ+GmiTQOH9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TLPkKVpt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Uodsciiy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6264ajti2328058
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Mar 2026 08:35:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rPSIBOaKrTaFEU5pgrvCQyRqxyV9K5ArRm+ghebkNOo=; b=TLPkKVptC8KC4lc/
	hRUCulQtbB1JNnG3XmCT590QFaOfWdLjyGd3KRVJQzx+qTLg02neiEybH1hanyhd
	MdXAnZ6WaDDcF2FtZAYQkHHU6dOZaHkpYLoRXqJj5oAkHsfanyFyDcfw9ZmJl48D
	XcMbpYBmD3w/jLxkrrQo4ZKuClu9T5gqD3bGGiIakgZZBpTPgrHmR5kutm9nD3Is
	bOf0YstCZYueXcwjbuVQ2+vErKFqmGn4Y4IDUKVIM6CG7H+TtDIkMng5jWgeIc/x
	9u/XH9JH2JDMXc2DE9ke2LrVPv4LPquzLNsY7s7zNRlG4JqZ+khXR1VD33a2Q9Fa
	m0pbqg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqg09t91b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 08:35:50 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-358e425c261so8108301a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 00:35:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772786149; x=1773390949; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rPSIBOaKrTaFEU5pgrvCQyRqxyV9K5ArRm+ghebkNOo=;
        b=Uodsciiyy2dbYkBwMSSPPQ4CqZA18QLqkqBEh6x4vVyyPxRqQ9/OqiZqlFkP4UNkpE
         t6BEzYQQn+XS1ECSyVne3zq+ID6r9zSJob9tvO/MzlajWrivBVe33gvWAqIGZSXuhvAz
         VvzxCWGdOa7EXABAWJAF3M1834kIKsd8AxZFuVd5o5f9tnOpjsp6HMvZu3zVh+xYcKJ5
         qzZmVIxyKsmCVf2F3/jUqzYkAiUbIe7cKUmY+erS8IfWRtI+Y5X6+wuiS3x0oGPGYgW7
         YSp7AB853R33NgYdkdqcncPSl4oa/MZcuMoPbECpo0NytGcSRYdz94wKHlEY2+PON/Si
         vxpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772786149; x=1773390949;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rPSIBOaKrTaFEU5pgrvCQyRqxyV9K5ArRm+ghebkNOo=;
        b=YkjU4uDXzzqF8BZClzu/HT5kuB+difZmHFGDnkXsyVXb+aIWQxCDCXP0rDlK3T/D53
         TznUMQ5UHMeKmZo0IrLFad/mJTCgyX5+BniruOQLcM9lG9Lj0lwFj9JCCJE9nG/GEieT
         tWojZz0BYYw+++RdQlj7248zr1cMZZFZyE6pMUuktpUayLTekNk35Nv/hOwkq/bGZMx3
         3dYkK/M5UoU16mf1eo95zC90QpLjJhWkBGm1wLWLJpA0nKEE0LQS4qK5FaEkxx3k1sXu
         CgZTEQYET9UYEcBM369lSjXpJtD25LyrBikvwR6kPN4oi5HbRKD4E1MTievkNDn/YcjU
         R84w==
X-Forwarded-Encrypted: i=1; AJvYcCVD7x2rKIujkZM8jSHJl5vmWSyEHxMmlVsU0ab83JHRTzykvwd8ZhY/eXHjeYpWDrFEvGxQYjqMkEh6SBy3@vger.kernel.org
X-Gm-Message-State: AOJu0YwC8E67VlM3gq2XHlN9XcCtlF+kDA9bKp7TKFNfYvwxStFwbp55
	DScJqf+ZZTFBaMX025tJXmsDamXqG9JWiKROYgxABTLamzW2673TiMawaeYLquC5s53QWnjgyEx
	3BoRlFNDEP6F6uyQaXVHXeANna3lmy7lGQ9uuD3P/Hr73kkM4cpCHYIPz4VV0v7RjQNIM
X-Gm-Gg: ATEYQzxKKrvQvvi52COr/1pzoyujS4XWF0VYoOwT8KLM0usOE7+MkMg81SddhQr6uau
	/hZ8lo7ykNEHtJ8t1KDtR4vhNMf6F2sTh75N0IoQMOAh+uD3ta8sLqeuvEh4n1QC0eXkK8zJNcO
	W2x48vijulisHnfM34OuyXrWsqkvEkwJZ3OW9BLaC7EOm9SGvH3kS3KBqAAw7k7iEH1Qw/Y5Ves
	HxGheYQmAWecKaKRUdryycwzBqynEfiS62QzqT/UfQ7CgNLBMrhI0uepwaWZZOkCsJO7nW2z79c
	Xr2dZT2BQRGLcC9FgVEzRJ0NMrdcMpb60r9kx3ZdGFimJHIiCt1jjCNgO3PoN/HJEITpONT/c1t
	IfO0u4uR053ulQYeM+QZ8SFyh2Gwl3TTKC9TborYtxq6pIW18QQjuWg==
X-Received: by 2002:a17:90b:5104:b0:359:8988:38bc with SMTP id 98e67ed59e1d1-359be233210mr1384100a91.7.1772786149054;
        Fri, 06 Mar 2026 00:35:49 -0800 (PST)
X-Received: by 2002:a17:90b:5104:b0:359:8988:38bc with SMTP id 98e67ed59e1d1-359be233210mr1384075a91.7.1772786148422;
        Fri, 06 Mar 2026 00:35:48 -0800 (PST)
Received: from [10.0.0.3] ([106.222.231.181])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359bbab6e4bsm758328a91.0.2026.03.06.00.35.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 00:35:48 -0800 (PST)
Message-ID: <69150451-3580-e7d9-9ed9-1d3fc0a2476b@oss.qualcomm.com>
Date: Fri, 6 Mar 2026 14:05:43 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 07/11] media: qcom: iris: split HFI session ops from
 core ops
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260228-iris-platform-data-v2-0-acf036a3c84c@oss.qualcomm.com>
 <20260228-iris-platform-data-v2-7-acf036a3c84c@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260228-iris-platform-data-v2-7-acf036a3c84c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 5bG4M4smj8-v5A9yWaAkRxG5agZYL9mw
X-Authority-Analysis: v=2.4 cv=b/u/I9Gx c=1 sm=1 tr=0 ts=69aa91e6 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=IrIcjQS8YOhLhDNCWt0oYA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=aeXXQIQdJUFBVMhoBREA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: 5bG4M4smj8-v5A9yWaAkRxG5agZYL9mw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDA4MCBTYWx0ZWRfX0XKzYkd7iNDR
 VaqQbWG99NU93FOa8yrjto6uofxoyLHX2zt0UDWailkN4QpHTU2RPpuClF2UkHCs8kt67koO4bF
 pPBMtp/weysrAl5zdtwFiqTy+wq8GwHM7lZtq4p+mLR+lZWuVFV4Ma4FUElavcXlzMAfr3C9jJB
 kDkTqKAOMC9SklmESULaB25m0L64XcurHJ8Lm52j8mow81gPWuSLo4GKcoS29s31y+xUOSyVSZc
 +TOaO/EfFB7oaUhaFwl1acryHGTFSx1yn2pwj9cypLBLg+RdK9AmTe2Dga4OX3EtWfcdNGJ+W1e
 l8yUqe7q+7DJpAOU5KaOscUuMcTbESty1M0wGKZee9CbwcdtKejA2kQZsFaz6RGa0HtdqiMB8E5
 McJkfxd/OK2o8Q58TJWi4A3U7mOLhYj8G5wZxdwecowNbGmVG2dyYfqFF0mUluCpT1e2CuRmc+g
 jqdHADRcEcKIrV7IaFQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_03,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060080
X-Rspamd-Queue-Id: 19FEA21D2C6
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95727-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 2/28/2026 8:56 PM, Dmitry Baryshkov wrote:
> Calling HFI instance-specific ops should not require double indirection
> through the core ops. Split instance-specific ops to a separate struct,
> keep a pointer to it in struct iris_inst and set it directly in the
> get_instance function.
> 

IMO, In this case better names could be hfi_sys_ops and hfi_session_ops.

Thanks,
Dikshita

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_buffer.c     |  4 +-
>  drivers/media/platform/qcom/iris/iris_common.c     |  8 ++--
>  drivers/media/platform/qcom/iris/iris_ctrls.c      | 46 +++++++++++-----------
>  drivers/media/platform/qcom/iris/iris_hfi_common.h |  3 ++
>  .../platform/qcom/iris/iris_hfi_gen1_command.c     | 23 ++++++++---
>  .../platform/qcom/iris/iris_hfi_gen2_command.c     | 17 +++++---
>  drivers/media/platform/qcom/iris/iris_instance.h   |  4 ++
>  drivers/media/platform/qcom/iris/iris_vb2.c        |  2 +-
>  drivers/media/platform/qcom/iris/iris_vdec.c       |  6 +--
>  drivers/media/platform/qcom/iris/iris_venc.c       |  4 +-
>  drivers/media/platform/qcom/iris/iris_vidc.c       |  2 +-
>  11 files changed, 72 insertions(+), 47 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
> index 9151f43bc6b9..915096b21279 100644
> --- a/drivers/media/platform/qcom/iris/iris_buffer.c
> +++ b/drivers/media/platform/qcom/iris/iris_buffer.c
> @@ -404,7 +404,7 @@ int iris_create_internal_buffers(struct iris_inst *inst, u32 plane)
>  
>  int iris_queue_buffer(struct iris_inst *inst, struct iris_buffer *buf)
>  {
> -	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	const struct iris_hfi_inst_ops *hfi_ops = inst->hfi_ops;
>  	int ret;
>  
>  	ret = hfi_ops->session_queue_buf(inst, buf);
> @@ -572,7 +572,7 @@ int iris_destroy_dequeued_internal_buffers(struct iris_inst *inst, u32 plane)
>  static int iris_release_internal_buffers(struct iris_inst *inst,
>  					 enum iris_buffer_type buffer_type)
>  {
> -	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	const struct iris_hfi_inst_ops *hfi_ops = inst->hfi_ops;
>  	struct iris_buffers *buffers = &inst->buffers[buffer_type];
>  	struct iris_buffer *buffer, *next;
>  	int ret;
> diff --git a/drivers/media/platform/qcom/iris/iris_common.c b/drivers/media/platform/qcom/iris/iris_common.c
> index 7f1c7fe144f7..69748e5764f3 100644
> --- a/drivers/media/platform/qcom/iris/iris_common.c
> +++ b/drivers/media/platform/qcom/iris/iris_common.c
> @@ -48,7 +48,7 @@ void iris_set_ts_metadata(struct iris_inst *inst, struct vb2_v4l2_buffer *vbuf)
>  
>  int iris_process_streamon_input(struct iris_inst *inst)
>  {
> -	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	const struct iris_hfi_inst_ops *hfi_ops = inst->hfi_ops;
>  	enum iris_inst_sub_state set_sub_state = 0;
>  	int ret;
>  
> @@ -90,7 +90,7 @@ int iris_process_streamon_input(struct iris_inst *inst)
>  
>  int iris_process_streamon_output(struct iris_inst *inst)
>  {
> -	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	const struct iris_hfi_inst_ops *hfi_ops = inst->hfi_ops;
>  	enum iris_inst_sub_state clear_sub_state = 0;
>  	bool drain_active, drc_active, first_ipsc;
>  	int ret = 0;
> @@ -189,7 +189,7 @@ static void iris_flush_deferred_buffers(struct iris_inst *inst,
>  
>  static void iris_kill_session(struct iris_inst *inst)
>  {
> -	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	const struct iris_hfi_inst_ops *hfi_ops = inst->hfi_ops;
>  
>  	if (!inst->session_id)
>  		return;
> @@ -200,7 +200,7 @@ static void iris_kill_session(struct iris_inst *inst)
>  
>  int iris_session_streamoff(struct iris_inst *inst, u32 plane)
>  {
> -	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	const struct iris_hfi_inst_ops *hfi_ops = inst->hfi_ops;
>  	enum iris_buffer_type buffer_type;
>  	int ret;
>  
> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
> index 3cec957580f5..f5032c5eb5a5 100644
> --- a/drivers/media/platform/qcom/iris/iris_ctrls.c
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
> @@ -399,7 +399,7 @@ static u32 iris_get_port_info(struct iris_inst *inst,
>  
>  int iris_set_u32_enum(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
>  {
> -	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	const struct iris_hfi_inst_ops *hfi_ops = inst->hfi_ops;
>  	u32 hfi_value = inst->fw_caps[cap_id].value;
>  	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
>  
> @@ -412,7 +412,7 @@ int iris_set_u32_enum(struct iris_inst *inst, enum platform_inst_fw_cap_type cap
>  
>  int iris_set_u32(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
>  {
> -	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	const struct iris_hfi_inst_ops *hfi_ops = inst->hfi_ops;
>  	u32 hfi_value = inst->fw_caps[cap_id].value;
>  	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
>  
> @@ -425,7 +425,7 @@ int iris_set_u32(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
>  
>  int iris_set_stage(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
>  {
> -	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	const struct iris_hfi_inst_ops *hfi_ops = inst->hfi_ops;
>  	struct v4l2_format *inp_f = inst->fmt_src;
>  	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
>  	u32 height = inp_f->fmt.pix_mp.height;
> @@ -446,7 +446,7 @@ int iris_set_stage(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id
>  
>  int iris_set_pipe(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
>  {
> -	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	const struct iris_hfi_inst_ops *hfi_ops = inst->hfi_ops;
>  	u32 work_route = inst->fw_caps[PIPE].value;
>  	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
>  
> @@ -459,7 +459,7 @@ int iris_set_pipe(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
>  
>  int iris_set_profile(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
>  {
> -	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	const struct iris_hfi_inst_ops *hfi_ops = inst->hfi_ops;
>  	u32 hfi_id, hfi_value;
>  
>  	if (inst->codec == V4L2_PIX_FMT_H264) {
> @@ -479,7 +479,7 @@ int iris_set_profile(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_
>  
>  int iris_set_level(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
>  {
> -	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	const struct iris_hfi_inst_ops *hfi_ops = inst->hfi_ops;
>  	u32 hfi_id, hfi_value;
>  
>  	if (inst->codec == V4L2_PIX_FMT_H264) {
> @@ -499,7 +499,7 @@ int iris_set_level(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id
>  
>  int iris_set_profile_level_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
>  {
> -	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	const struct iris_hfi_inst_ops *hfi_ops = inst->hfi_ops;
>  	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
>  	struct hfi_profile_level pl;
>  
> @@ -520,7 +520,7 @@ int iris_set_profile_level_gen1(struct iris_inst *inst, enum platform_inst_fw_ca
>  
>  int iris_set_header_mode_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
>  {
> -	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	const struct iris_hfi_inst_ops *hfi_ops = inst->hfi_ops;
>  	u32 header_mode = inst->fw_caps[cap_id].value;
>  	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
>  	u32 hfi_val;
> @@ -539,7 +539,7 @@ int iris_set_header_mode_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_
>  
>  int iris_set_header_mode_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
>  {
> -	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	const struct iris_hfi_inst_ops *hfi_ops = inst->hfi_ops;
>  	u32 prepend_sps_pps = inst->fw_caps[PREPEND_SPSPPS_TO_IDR].value;
>  	u32 header_mode = inst->fw_caps[cap_id].value;
>  	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
> @@ -561,7 +561,7 @@ int iris_set_header_mode_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_
>  
>  int iris_set_bitrate(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
>  {
> -	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	const struct iris_hfi_inst_ops *hfi_ops = inst->hfi_ops;
>  	u32 entropy_mode = inst->fw_caps[ENTROPY_MODE].value;
>  	u32 bitrate = inst->fw_caps[cap_id].value;
>  	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
> @@ -586,7 +586,7 @@ int iris_set_bitrate(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_
>  
>  int iris_set_peak_bitrate(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
>  {
> -	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	const struct iris_hfi_inst_ops *hfi_ops = inst->hfi_ops;
>  	u32 rc_mode = inst->fw_caps[BITRATE_MODE].value;
>  	u32 peak_bitrate = inst->fw_caps[cap_id].value;
>  	u32 bitrate = inst->fw_caps[BITRATE].value;
> @@ -613,7 +613,7 @@ int iris_set_peak_bitrate(struct iris_inst *inst, enum platform_inst_fw_cap_type
>  
>  int iris_set_bitrate_mode_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
>  {
> -	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	const struct iris_hfi_inst_ops *hfi_ops = inst->hfi_ops;
>  	u32 bitrate_mode = inst->fw_caps[BITRATE_MODE].value;
>  	u32 frame_rc = inst->fw_caps[FRAME_RC_ENABLE].value;
>  	u32 frame_skip = inst->fw_caps[FRAME_SKIP_MODE].value;
> @@ -640,7 +640,7 @@ int iris_set_bitrate_mode_gen1(struct iris_inst *inst, enum platform_inst_fw_cap
>  
>  int iris_set_bitrate_mode_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
>  {
> -	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	const struct iris_hfi_inst_ops *hfi_ops = inst->hfi_ops;
>  	u32 bitrate_mode = inst->fw_caps[BITRATE_MODE].value;
>  	u32 frame_rc = inst->fw_caps[FRAME_RC_ENABLE].value;
>  	u32 frame_skip = inst->fw_caps[FRAME_SKIP_MODE].value;
> @@ -667,7 +667,7 @@ int iris_set_bitrate_mode_gen2(struct iris_inst *inst, enum platform_inst_fw_cap
>  
>  int iris_set_entropy_mode_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
>  {
> -	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	const struct iris_hfi_inst_ops *hfi_ops = inst->hfi_ops;
>  	u32 entropy_mode = inst->fw_caps[cap_id].value;
>  	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
>  	u32 hfi_val;
> @@ -687,7 +687,7 @@ int iris_set_entropy_mode_gen1(struct iris_inst *inst, enum platform_inst_fw_cap
>  
>  int iris_set_entropy_mode_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
>  {
> -	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	const struct iris_hfi_inst_ops *hfi_ops = inst->hfi_ops;
>  	u32 entropy_mode = inst->fw_caps[cap_id].value;
>  	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
>  	u32 profile;
> @@ -712,7 +712,7 @@ int iris_set_entropy_mode_gen2(struct iris_inst *inst, enum platform_inst_fw_cap
>  
>  int iris_set_min_qp(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
>  {
> -	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	const struct iris_hfi_inst_ops *hfi_ops = inst->hfi_ops;
>  	u32 i_qp_enable = 0, p_qp_enable = 0, b_qp_enable = 0;
>  	u32 i_frame_qp = 0, p_frame_qp = 0, b_frame_qp = 0;
>  	u32 min_qp_enable = 0, client_qp_enable = 0;
> @@ -776,7 +776,7 @@ int iris_set_min_qp(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_i
>  
>  int iris_set_max_qp(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
>  {
> -	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	const struct iris_hfi_inst_ops *hfi_ops = inst->hfi_ops;
>  	u32 i_qp_enable = 0, p_qp_enable = 0, b_qp_enable = 0;
>  	u32 max_qp_enable = 0, client_qp_enable;
>  	u32 i_frame_qp, p_frame_qp, b_frame_qp;
> @@ -841,7 +841,7 @@ int iris_set_max_qp(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_i
>  
>  int iris_set_frame_qp(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
>  {
> -	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	const struct iris_hfi_inst_ops *hfi_ops = inst->hfi_ops;
>  	u32 i_qp_enable = 0, p_qp_enable = 0, b_qp_enable = 0, client_qp_enable;
>  	u32 i_frame_qp, p_frame_qp, b_frame_qp;
>  	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
> @@ -902,7 +902,7 @@ int iris_set_frame_qp(struct iris_inst *inst, enum platform_inst_fw_cap_type cap
>  
>  int iris_set_qp_range(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
>  {
> -	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	const struct iris_hfi_inst_ops *hfi_ops = inst->hfi_ops;
>  	struct hfi_quantization_range_v2 range;
>  	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
>  
> @@ -923,7 +923,7 @@ int iris_set_qp_range(struct iris_inst *inst, enum platform_inst_fw_cap_type cap
>  
>  int iris_set_rotation(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
>  {
> -	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	const struct iris_hfi_inst_ops *hfi_ops = inst->hfi_ops;
>  	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
>  	u32 hfi_val;
>  
> @@ -953,7 +953,7 @@ int iris_set_rotation(struct iris_inst *inst, enum platform_inst_fw_cap_type cap
>  
>  int iris_set_flip(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
>  {
> -	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	const struct iris_hfi_inst_ops *hfi_ops = inst->hfi_ops;
>  	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
>  	u32 hfi_val = HFI_DISABLE_FLIP;
>  
> @@ -972,7 +972,7 @@ int iris_set_flip(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
>  
>  int iris_set_ir_period(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
>  {
> -	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	const struct iris_hfi_inst_ops *hfi_ops = inst->hfi_ops;
>  	struct vb2_queue *q = v4l2_m2m_get_dst_vq(inst->m2m_ctx);
>  	u32 ir_period = inst->fw_caps[cap_id].value;
>  	u32 ir_type = 0;
> @@ -998,7 +998,7 @@ int iris_set_ir_period(struct iris_inst *inst, enum platform_inst_fw_cap_type ca
>  
>  int iris_set_properties(struct iris_inst *inst, u32 plane)
>  {
> -	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	const struct iris_hfi_inst_ops *hfi_ops = inst->hfi_ops;
>  	struct platform_inst_fw_cap *cap;
>  	int ret;
>  	u32 i;
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.h b/drivers/media/platform/qcom/iris/iris_hfi_common.h
> index 3edb5ae582b4..4f26b010249a 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_common.h
> @@ -110,6 +110,9 @@ struct iris_hfi_command_ops {
>  	int (*sys_image_version)(struct iris_core *core);
>  	int (*sys_interframe_powercollapse)(struct iris_core *core);
>  	int (*sys_pc_prep)(struct iris_core *core);
> +};
> +
> +struct iris_hfi_inst_ops {
>  	int (*session_set_config_params)(struct iris_inst *inst, u32 plane);
>  	int (*session_set_property)(struct iris_inst *inst,
>  				    u32 packet_type, u32 flag, u32 plane, u32 payload_type,
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> index b7aafda1d99e..fde8219309b0 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> @@ -1015,11 +1015,7 @@ static int iris_hfi_gen1_session_set_config_params(struct iris_inst *inst, u32 p
>  	return ret;
>  }
>  
> -static const struct iris_hfi_command_ops iris_hfi_gen1_command_ops = {
> -	.sys_init = iris_hfi_gen1_sys_init,
> -	.sys_image_version = iris_hfi_gen1_sys_image_version,
> -	.sys_interframe_powercollapse = iris_hfi_gen1_sys_interframe_powercollapse,
> -	.sys_pc_prep = iris_hfi_gen1_sys_pc_prep,
> +static const struct iris_hfi_inst_ops iris_hfi_gen1_inst_ops = {
>  	.session_open = iris_hfi_gen1_session_open,
>  	.session_set_config_params = iris_hfi_gen1_session_set_config_params,
>  	.session_set_property = iris_hfi_gen1_session_set_property,
> @@ -1032,6 +1028,13 @@ static const struct iris_hfi_command_ops iris_hfi_gen1_command_ops = {
>  	.session_close = iris_hfi_gen1_session_close,
>  };
>  
> +static const struct iris_hfi_command_ops iris_hfi_gen1_command_ops = {
> +	.sys_init = iris_hfi_gen1_sys_init,
> +	.sys_image_version = iris_hfi_gen1_sys_image_version,
> +	.sys_interframe_powercollapse = iris_hfi_gen1_sys_interframe_powercollapse,
> +	.sys_pc_prep = iris_hfi_gen1_sys_pc_prep,
> +};
> +
>  void iris_hfi_gen1_command_ops_init(struct iris_core *core)
>  {
>  	core->hfi_ops = &iris_hfi_gen1_command_ops;
> @@ -1039,5 +1042,13 @@ void iris_hfi_gen1_command_ops_init(struct iris_core *core)
>  
>  struct iris_inst *iris_hfi_gen1_get_instance(void)
>  {
> -	return kzalloc_obj(struct iris_inst);
> +	struct iris_inst *out;
> +
> +	out = kzalloc_obj(*out);
> +	if (!out)
> +		return NULL;
> +
> +	out->hfi_ops = &iris_hfi_gen1_inst_ops;
> +
> +	return out;
>  }
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> index 93ce7ac3a19c..502767f1593d 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> @@ -1390,11 +1390,7 @@ static int iris_hfi_gen2_session_release_buffer(struct iris_inst *inst, struct i
>  					inst_hfi_gen2->packet->size);
>  }
>  
> -static const struct iris_hfi_command_ops iris_hfi_gen2_command_ops = {
> -	.sys_init = iris_hfi_gen2_sys_init,
> -	.sys_image_version = iris_hfi_gen2_sys_image_version,
> -	.sys_interframe_powercollapse = iris_hfi_gen2_sys_interframe_powercollapse,
> -	.sys_pc_prep = iris_hfi_gen2_sys_pc_prep,
> +static const struct iris_hfi_inst_ops iris_hfi_gen2_inst_ops = {
>  	.session_open = iris_hfi_gen2_session_open,
>  	.session_set_config_params = iris_hfi_gen2_session_set_config_params,
>  	.session_set_property = iris_hfi_gen2_session_set_property,
> @@ -1409,6 +1405,13 @@ static const struct iris_hfi_command_ops iris_hfi_gen2_command_ops = {
>  	.session_close = iris_hfi_gen2_session_close,
>  };
>  
> +static const struct iris_hfi_command_ops iris_hfi_gen2_command_ops = {
> +	.sys_init = iris_hfi_gen2_sys_init,
> +	.sys_image_version = iris_hfi_gen2_sys_image_version,
> +	.sys_interframe_powercollapse = iris_hfi_gen2_sys_interframe_powercollapse,
> +	.sys_pc_prep = iris_hfi_gen2_sys_pc_prep,
> +};
> +
>  void iris_hfi_gen2_command_ops_init(struct iris_core *core)
>  {
>  	core->hfi_ops = &iris_hfi_gen2_command_ops;
> @@ -1420,6 +1423,10 @@ struct iris_inst *iris_hfi_gen2_get_instance(void)
>  
>  	/* The allocation is intentionally larger than struct iris_inst. */
>  	out = kzalloc_obj(*out);
> +	if (!out)
> +		return NULL;
> +
> +	out->inst.hfi_ops = &iris_hfi_gen2_inst_ops;
>  
>  	return &out->inst;
>  }
> diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
> index 16965150f427..c58e8ec24c62 100644
> --- a/drivers/media/platform/qcom/iris/iris_instance.h
> +++ b/drivers/media/platform/qcom/iris/iris_instance.h
> @@ -15,6 +15,8 @@
>  #define DEFAULT_WIDTH 320
>  #define DEFAULT_HEIGHT 240
>  
> +struct iris_hfi_inst_ops;
> +
>  enum iris_fmt_type_out {
>  	IRIS_FMT_H264,
>  	IRIS_FMT_HEVC,
> @@ -38,6 +40,7 @@ struct iris_fmt {
>   * @list: used for attach an instance to the core
>   * @core: pointer to core structure
>   * @session_id: id of current video session
> + * @hfi_ops: iris HFI instance ops
>   * @ctx_q_lock: lock to serialize queues related ioctls
>   * @lock: lock to seralise forward and reverse threads
>   * @fh: reference of v4l2 file handler
> @@ -80,6 +83,7 @@ struct iris_inst {
>  	struct list_head		list;
>  	struct iris_core		*core;
>  	u32				session_id;
> +	const struct iris_hfi_inst_ops	*hfi_ops;
>  	struct mutex			ctx_q_lock;/* lock to serialize queues related ioctls */
>  	struct mutex			lock; /* lock to serialize forward and reverse threads */
>  	struct v4l2_fh			fh;
> diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c b/drivers/media/platform/qcom/iris/iris_vb2.c
> index bf0b8400996e..104910419dd1 100644
> --- a/drivers/media/platform/qcom/iris/iris_vb2.c
> +++ b/drivers/media/platform/qcom/iris/iris_vb2.c
> @@ -129,7 +129,7 @@ int iris_vb2_queue_setup(struct vb2_queue *q,
>  	if (!inst->once_per_session_set) {
>  		inst->once_per_session_set = true;
>  
> -		ret = core->hfi_ops->session_open(inst);
> +		ret = inst->hfi_ops->session_open(inst);
>  		if (ret) {
>  			ret = -EINVAL;
>  			dev_err(core->dev, "session open failed\n");
> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
> index 719217399a30..a48771687c10 100644
> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
> @@ -374,7 +374,7 @@ int iris_vdec_streamon_input(struct iris_inst *inst)
>  
>  int iris_vdec_streamon_output(struct iris_inst *inst)
>  {
> -	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	const struct iris_hfi_inst_ops *hfi_ops = inst->hfi_ops;
>  	int ret;
>  
>  	ret = hfi_ops->session_set_config_params(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
> @@ -434,7 +434,7 @@ int iris_vdec_qbuf(struct iris_inst *inst, struct vb2_v4l2_buffer *vbuf)
>  
>  int iris_vdec_start_cmd(struct iris_inst *inst)
>  {
> -	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	const struct iris_hfi_inst_ops *hfi_ops = inst->hfi_ops;
>  	enum iris_inst_sub_state clear_sub_state = 0;
>  	struct vb2_queue *dst_vq;
>  	int ret;
> @@ -497,7 +497,7 @@ int iris_vdec_start_cmd(struct iris_inst *inst)
>  
>  int iris_vdec_stop_cmd(struct iris_inst *inst)
>  {
> -	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	const struct iris_hfi_inst_ops *hfi_ops = inst->hfi_ops;
>  	int ret;
>  
>  	ret = hfi_ops->session_drain(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
> diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
> index aa27b22704eb..ffa7d5a91d15 100644
> --- a/drivers/media/platform/qcom/iris/iris_venc.c
> +++ b/drivers/media/platform/qcom/iris/iris_venc.c
> @@ -581,7 +581,7 @@ int iris_venc_qbuf(struct iris_inst *inst, struct vb2_v4l2_buffer *vbuf)
>  
>  int iris_venc_start_cmd(struct iris_inst *inst)
>  {
> -	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	const struct iris_hfi_inst_ops *hfi_ops = inst->hfi_ops;
>  	enum iris_inst_sub_state clear_sub_state = 0;
>  	struct vb2_queue *dst_vq;
>  	int ret;
> @@ -623,7 +623,7 @@ int iris_venc_start_cmd(struct iris_inst *inst)
>  
>  int iris_venc_stop_cmd(struct iris_inst *inst)
>  {
> -	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	const struct iris_hfi_inst_ops *hfi_ops = inst->hfi_ops;
>  	int ret;
>  
>  	ret = hfi_ops->session_drain(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
> diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
> index bd38d84c9cc7..eddf2694e759 100644
> --- a/drivers/media/platform/qcom/iris/iris_vidc.c
> +++ b/drivers/media/platform/qcom/iris/iris_vidc.c
> @@ -224,7 +224,7 @@ int iris_open(struct file *filp)
>  
>  static void iris_session_close(struct iris_inst *inst)
>  {
> -	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	const struct iris_hfi_inst_ops *hfi_ops = inst->hfi_ops;
>  	bool wait_for_response = true;
>  	int ret;
>  
> 

