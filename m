Return-Path: <linux-arm-msm+bounces-103169-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cNPlIUJm3mmxDgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103169-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 18:07:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D876F3FC56B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 18:07:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2A8A6302BEA7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 16:02:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F5A53EC2FD;
	Tue, 14 Apr 2026 16:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G0bsYxwn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G9HTAISZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A53D3ECBFD
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 16:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776182566; cv=none; b=MjjTMpTaeEeOeLpibi8MTLQhpBG1kXBiUHTuQNR+33GHvREmUa4H3uUxZSoIWnNlexBzgDWM2DiHmSsrFvBehxhItFBMQk9kb383zxZL9mQI9yyX1fMw9AYojz0KiTiFI6YrEPJYUihJumH+K2r2V5hsujTUzCPcFOU28nZrUbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776182566; c=relaxed/simple;
	bh=EP8n3YLnADnw2/3kHVDDISUzu1uMqBvZHl417sZONP4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IWopMVLh/GjWDjXvyi/mJCEVmtcAe+/3oFFkVcFQ9Xb4vrotF4/RtClrgp8JAqasmFF4WRAUr3/La01go7dh7Yq+B4U409JTDZyyZn+eBynDZ6AcEnB+D/cTLI5eDNDmRPWVq9d9uXWPn/S5m3FubqEEe0A2zencs9MjnMSCLSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G0bsYxwn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G9HTAISZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EBXkaU3425969
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 16:02:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=oMvbzrILlvyLIiv+/fp3MK3A
	IiOJf+NHiV4k5LZV/is=; b=G0bsYxwnOiOicesphNu2acj7cQ8u86WT/FGi2MMp
	gkrImPnRCwkm1znj4mj1WJZiWpyERXBgRrCSxQIUTxYNfuZCB9wMCMbBnfxOYK1f
	iz5z1f0AMKhmdODrUFzwQ3Yu9opq8YKSJsHSN8u31HBIUtJEpgSks4EVj18eJYYW
	xIBBCSFeFINiCQiZ0Lq6ZAd7889XVjtap/0Cm852Rr07LNy7oNQBY/XFUKDCr4iR
	Lx+4k4g3xuF5fQ76POhTMkOUdtA2XFqMJxooNuKS6QkjKcrkleh4ZzWzG4EiFZ8w
	Na04ynP3NsItWUduU+aVUb223OOvMYRx9+nY75JKoPFKHg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh87fbfj0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 16:02:44 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35fb969a4c0so2453623a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 09:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776182563; x=1776787363; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oMvbzrILlvyLIiv+/fp3MK3AIiOJf+NHiV4k5LZV/is=;
        b=G9HTAISZt0NGqV4Z7hSjR+TQFnpDBF6g9RtBC0ez0UIN8KPDNCYD8A1wZka7y4qeUo
         4Sw7w5EZuuz5ZIyv5OgjYoHS+dFC08bYcJ4DUEeT7ffJz1KrxvcuCUqAVB/aSB58hWi9
         14u1ykYvk9/NWOXhiL3PKk7GieR/oy+m3IVT+hRvioW003GfHGTE87MK8+bwyFcSyTx3
         WFvZ2J2WvQIADoF1jUrVu4iEL7M+74ZIBxoBAJH7ZMU6BmrF7bBcHSf1Lhym9AUisgCj
         GdNRXpXuyOYyXYscvxhr8Ipydg6gQMTSnt9y3iis0rcbhjOkX+3QGjIDYe6bD+Ib7+vd
         Hh/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776182563; x=1776787363;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oMvbzrILlvyLIiv+/fp3MK3AIiOJf+NHiV4k5LZV/is=;
        b=WlyFa9Qxr4K+IaDMh9qsefA70oYGfYdvcUW/gVtif+yz8RWihHV3Z6UCaDPsMKewSm
         5cw23W7mgg0KiyLrnc+QT2F37kTx6APjs2BH0vp0a49X0dkKpOJ2yob2n6jxMlG+Ae3s
         LKTR319rfzYRc2QbV8QmP1uAJSmtKwopzM/Wq7MVC6212ZKGnjLM8czMTewWaG2LqYPF
         F0CUE2KJCWH5cZMWxoNOEDkSMJk1lqxOPcnMqyzmlsRa6r1vVDDQDOxP0Ubi3fpZZTsJ
         vel5N+s+64Ppxoe2ck2su7HMkWhEmsCiKMWOQyJDwnqPDT7IZrIqZP2XAa+nAVsY+BLf
         hw0w==
X-Forwarded-Encrypted: i=1; AFNElJ/K2APPEs4dAqgjzLyWWZAOqOeowJRe8ggpJQnMEAztTm4nm7mOOVcDB0OEbmr266wYTsvQc8P+OUhQwzR5@vger.kernel.org
X-Gm-Message-State: AOJu0YzFnKKofEZcxoCSbcUG4inFLcFEm/NVXOSXgc5xTk2cr0OkOF3j
	v/brJu58mE+6yuJXL8skPBuHp7Z34KrX3K79Fw8bI4I/fbcS+PViu+mFYHZACohVmaShV516C71
	UtFsXTS7uJZclQUI9Bw+s3GHWcdLEIwsXGkwHT8TH1G95eCqnBccJ5Sq6SkIUng3pHPdz
X-Gm-Gg: AeBDietADWhIt63NM/jrAVcVt4oQSZoGeTuljNybgeodMe2HDHKh91qsROGJ1NCIofY
	Vkp+Y5b62e9tSZCYOf7ubU0YLkrRzU2MSvYN6HVOXjMGRBzi/Or3BKFnDR5gXSwj2IaCgRDg3ch
	ZJ9ewLDiSwT7uOn6JNxhmF3QW7feLEZKrcUs0IQwJ3r9QnSbyKD9wdOO3jUyXfA5sBI3xbxrV+2
	HSE0T17aDIG7/4Zsr0CVGhTY36qL3x/46Z4Zd+hNp2wQWVOqKrattLqXyKzh1GLeL1LAKpNuR2L
	HvlqONYKp7kUKilErW8l30T4Uy1BX+BCZOTj12DlUa8yjFYSAD6sMW79UB7yCx0m8xQU7pslmKR
	l7UnWwHr63Y3et+9anWU3w+MQUTYn1pBa9DeMESQ8jnDRDPP6STUKII4fVVnBMCrh1L+ZLTBYN7
	Q/GFeDmm8U1m32rtTGGvtOjCKSvzAG0VfZjWN2M5ybmR38fA==
X-Received: by 2002:a05:6a20:3953:b0:398:7eea:50a0 with SMTP id adf61e73a8af0-39fe3da99c8mr20480570637.18.1776182563289;
        Tue, 14 Apr 2026 09:02:43 -0700 (PDT)
X-Received: by 2002:a05:6a20:3953:b0:398:7eea:50a0 with SMTP id adf61e73a8af0-39fe3da99c8mr20480464637.18.1776182562524;
        Tue, 14 Apr 2026 09:02:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e495b4e73sm30336891fa.41.2026.04.14.09.02.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 09:02:41 -0700 (PDT)
Date: Tue, 14 Apr 2026 19:02:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev
Subject: Re: [PATCH 09/11] media: iris: Add support to select core for dual
 core platforms
Message-ID: <utri77cprqzk5b4pt3qjucugs7vihfb4tn7rcg67nwpajkppqc@cizxr5zs2v66>
References: <20260414-glymur-v1-0-7d3d1cf57b16@oss.qualcomm.com>
 <20260414-glymur-v1-9-7d3d1cf57b16@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260414-glymur-v1-9-7d3d1cf57b16@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDE0OSBTYWx0ZWRfXy60Nnq+ktDhk
 8WLqIct6WVsVgeGRwybOsYE7uK8B7plCnfau7IXRp/N2+SocaIlKnc+PcvFMC86AqRWKqGWnwR7
 EtZkqCkzSweOyLziPJ58EGdy37Up0z8sp0TcVeOqzwOinj9S79vegkuZ7Ajkgutb0rszwpwzKqC
 JhoYujZx9Fj7IISf7SZ5xJmgBnAy0tCq+6EY9887cPku1anHvvekU2CEOUubLTqv04yDLVi6NR1
 wCq7m4fLmV4hlR8q7P6mZ0ekkko2olEfRvCnX6UtMWVB99YtnKIRodJ40ThOb+QWvYu3POlLyRu
 LRrJS4WFk3lFVd0DBXQyZx29LdEu6i/WAw2d27E0z5lHDNTA1rF0Hp4Ywuq/oIXnok+zxpU3Y+O
 KWleR9oXm0uO66T+QrDFOHaVfiTLOtN+fY+V39GNC/gPG/xmUvmIr8pREUJJ2dwkU2z8wpij7fX
 Z346LS3LIm5RfSoo9Ng==
X-Authority-Analysis: v=2.4 cv=DaYnbPtW c=1 sm=1 tr=0 ts=69de6524 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=9YbfNqiAQuj9XNyp570A:9 a=CjuIK1q_8ugA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: QWlvoIEn3DPWwlwo33Pq5FWWKXQ44HFr
X-Proofpoint-ORIG-GUID: QWlvoIEn3DPWwlwo33Pq5FWWKXQ44HFr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140149
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103169-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D876F3FC56B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 14, 2026 at 10:30:05AM +0530, Vishnu Reddy wrote:
> Select the hardware core (vcodec) for a session, based on load when the
> platform supports dual vcodec cores. Assign the session to vcodec if its
> MBPF/MBPS capacity allows it, otherwise assign to vcodec1. Communicate
> the selected vcodec core to firmware using new HFI_PROP_CORE_ID property.

Is it possibly do dynamically control power to those codec cores? Is it
possible to shutdown unused vcodec?

> 
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_common.c     |  7 +++
>  drivers/media/platform/qcom/iris/iris_hfi_common.h |  1 +
>  .../platform/qcom/iris/iris_hfi_gen2_command.c     | 19 ++++++
>  .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  1 +
>  drivers/media/platform/qcom/iris/iris_instance.h   |  2 +
>  .../platform/qcom/iris/iris_platform_common.h      |  1 +
>  drivers/media/platform/qcom/iris/iris_utils.c      | 68 +++++++++++++++++-----
>  7 files changed, 83 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_common.c b/drivers/media/platform/qcom/iris/iris_common.c
> index 7f1c7fe144f7..e31d4c988c55 100644
> --- a/drivers/media/platform/qcom/iris/iris_common.c
> +++ b/drivers/media/platform/qcom/iris/iris_common.c
> @@ -49,11 +49,18 @@ void iris_set_ts_metadata(struct iris_inst *inst, struct vb2_v4l2_buffer *vbuf)
>  int iris_process_streamon_input(struct iris_inst *inst)
>  {
>  	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	bool dual_core = inst->core->iris_platform_data->dual_core;

inline

>  	enum iris_inst_sub_state set_sub_state = 0;
>  	int ret;
>  
>  	iris_scale_power(inst);
>  
> +	if (dual_core) {
> +		ret = hfi_ops->session_set_core_id(inst, inst->core_id);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	ret = hfi_ops->session_start(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
>  	if (ret)
>  		return ret;
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.h b/drivers/media/platform/qcom/iris/iris_hfi_common.h
> index 3edb5ae582b4..fbaf852a6b99 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_common.h
> @@ -124,6 +124,7 @@ struct iris_hfi_command_ops {
>  	int (*session_drain)(struct iris_inst *inst, u32 plane);
>  	int (*session_resume_drain)(struct iris_inst *inst, u32 plane);
>  	int (*session_close)(struct iris_inst *inst);
> +	int (*session_set_core_id)(struct iris_inst *inst, u32 core_id);
>  };
>  
>  struct iris_hfi_response_ops {
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> index 30bfd90d423b..9d9fae587297 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> @@ -1300,6 +1300,24 @@ static int iris_hfi_gen2_session_release_buffer(struct iris_inst *inst, struct i
>  					inst_hfi_gen2->packet->size);
>  }
>  
> +static int iris_hfi_gen2_set_core_id(struct iris_inst *inst, u32 core_id)
> +{
> +	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
> +	u32 payload = core_id;
> +
> +	iris_hfi_gen2_packet_session_command(inst,
> +					     HFI_PROP_CORE_ID,
> +					     HFI_HOST_FLAGS_NONE,
> +					     HFI_PORT_NONE,
> +					     inst->session_id,
> +					     HFI_PAYLOAD_U32,
> +					     &payload,
> +					     sizeof(u32));
> +
> +	return iris_hfi_queue_cmd_write(inst->core, inst_hfi_gen2->packet,
> +					inst_hfi_gen2->packet->size);
> +}
> +
>  static const struct iris_hfi_command_ops iris_hfi_gen2_command_ops = {
>  	.sys_init = iris_hfi_gen2_sys_init,
>  	.sys_image_version = iris_hfi_gen2_sys_image_version,
> @@ -1317,6 +1335,7 @@ static const struct iris_hfi_command_ops iris_hfi_gen2_command_ops = {
>  	.session_drain = iris_hfi_gen2_session_drain,
>  	.session_resume_drain = iris_hfi_gen2_session_resume_drain,
>  	.session_close = iris_hfi_gen2_session_close,
> +	.session_set_core_id = iris_hfi_gen2_set_core_id,
>  };
>  
>  void iris_hfi_gen2_command_ops_init(struct iris_core *core)
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> index cecf771c55dd..1926a5344427 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> @@ -56,6 +56,7 @@
>  #define HFI_PROP_BUFFER_HOST_MAX_COUNT		0x03000123
>  #define HFI_PROP_BUFFER_FW_MIN_OUTPUT_COUNT	0x03000124
>  #define HFI_PROP_PIC_ORDER_CNT_TYPE		0x03000128
> +#define HFI_PROP_CORE_ID			0x030001A9

lowercase hex

>  
>  enum hfi_rate_control {
>  	HFI_RC_VBR_CFR		= 0x00000000,
> diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
> index 16965150f427..dd341ca5be57 100644
> --- a/drivers/media/platform/qcom/iris/iris_instance.h
> +++ b/drivers/media/platform/qcom/iris/iris_instance.h
> @@ -37,6 +37,7 @@ struct iris_fmt {
>   *
>   * @list: used for attach an instance to the core
>   * @core: pointer to core structure
> + * @core_id: specifies the hardware core on which the session runs
>   * @session_id: id of current video session
>   * @ctx_q_lock: lock to serialize queues related ioctls
>   * @lock: lock to seralise forward and reverse threads
> @@ -79,6 +80,7 @@ struct iris_fmt {
>  struct iris_inst {
>  	struct list_head		list;
>  	struct iris_core		*core;
> +	u32				core_id;
>  	u32				session_id;
>  	struct mutex			ctx_q_lock;/* lock to serialize queues related ioctls */
>  	struct mutex			lock; /* lock to serialize forward and reverse threads */
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index e3c1aff770dd..aeb70f54be10 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -258,6 +258,7 @@ struct iris_platform_data {
>  	const struct tz_cp_config *tz_cp_config_data;
>  	u32 tz_cp_config_data_size;
>  	u32 core_arch;
> +	bool dual_core;
>  	u32 hw_response_timeout;
>  	struct ubwc_config_data *ubwc_config;
>  	u32 num_vpp_pipe;
> diff --git a/drivers/media/platform/qcom/iris/iris_utils.c b/drivers/media/platform/qcom/iris/iris_utils.c
> index cfc5b576ec56..38ede9f76d0b 100644
> --- a/drivers/media/platform/qcom/iris/iris_utils.c
> +++ b/drivers/media/platform/qcom/iris/iris_utils.c
> @@ -90,18 +90,51 @@ struct iris_inst *iris_get_instance(struct iris_core *core, u32 session_id)
>  	return NULL;
>  }
>  
> -int iris_check_core_mbpf(struct iris_inst *inst)
> +static u32 iris_get_mbps(struct iris_inst *inst)
>  {
> -	struct iris_core *core = inst->core;
> -	struct iris_inst *instance;
> -	u32 total_mbpf = 0;
> +	u32 fps = max(inst->frame_rate, inst->operating_rate);
> +
> +	return iris_get_mbpf(inst) * fps;
> +}
> +
> +static void iris_get_core_load(struct iris_core *core, u32 *core_load, bool mbpf)
> +{
> +	bool dual_core = core->iris_platform_data->dual_core;
> +	struct iris_inst *inst;
> +	u32 load;
>  
>  	mutex_lock(&core->lock);
> -	list_for_each_entry(instance, &core->instances, list)
> -		total_mbpf += iris_get_mbpf(instance);
> +	list_for_each_entry(inst, &core->instances, list) {
> +		if (mbpf)
> +			load = iris_get_mbpf(inst);
> +		else
> +			load = iris_get_mbps(inst);
> +
> +		if (inst->core_id == BIT(0))
> +			core_load[0] += load;
> +		else if (dual_core && inst->core_id == BIT(1))
> +			core_load[1] += load;
> +	}
>  	mutex_unlock(&core->lock);
> +}
>  
> -	if (total_mbpf > core->iris_platform_data->max_core_mbpf)
> +int iris_check_core_mbpf(struct iris_inst *inst)
> +{
> +	struct iris_core *core = inst->core;
> +	u32 max_core_mbpf = core->iris_platform_data->max_core_mbpf;
> +	bool dual_core = core->iris_platform_data->dual_core;
> +	u32 core_mbpf[2] = {0, 0}, new_mbpf;
> +
> +	inst->core_id = 0;
> +	iris_get_core_load(core, core_mbpf, true);
> +	new_mbpf = iris_get_mbpf(inst);
> +
> +	if (core_mbpf[0] + new_mbpf <= max_core_mbpf)
> +		inst->core_id = BIT(0);
> +	else if (dual_core && core_mbpf[1] + new_mbpf <= max_core_mbpf)
> +		inst->core_id = BIT(1);
> +
> +	if (!inst->core_id)
>  		return -ENOMEM;
>  
>  	return 0;
> @@ -110,17 +143,20 @@ int iris_check_core_mbpf(struct iris_inst *inst)
>  int iris_check_core_mbps(struct iris_inst *inst)
>  {
>  	struct iris_core *core = inst->core;
> -	struct iris_inst *instance;
> -	u32 total_mbps = 0, fps = 0;
> +	u32 max_core_mbps = core->iris_platform_data->max_core_mbps;
> +	bool dual_core = core->iris_platform_data->dual_core;
> +	u32 core_mbps[2] = {0, 0}, new_mbps;
>  
> -	mutex_lock(&core->lock);
> -	list_for_each_entry(instance, &core->instances, list) {
> -		fps = max(instance->frame_rate, instance->operating_rate);
> -		total_mbps += iris_get_mbpf(instance) * fps;
> -	}
> -	mutex_unlock(&core->lock);
> +	inst->core_id = 0;
> +	iris_get_core_load(core, core_mbps, false);
> +	new_mbps = iris_get_mbps(inst);
> +
> +	if (core_mbps[0] + new_mbps <= max_core_mbps)
> +		inst->core_id = BIT(0);
> +	else if (dual_core && core_mbps[1] + new_mbps <= max_core_mbps)
> +		inst->core_id = BIT(1);

else return -ENOMEM.

But... Which of the checks will be used in the wild? Will it be
iris_check_core_mbpf() or iris_check_core_mbps()? What if they disagree?

>  
> -	if (total_mbps > core->iris_platform_data->max_core_mbps)
> +	if (!inst->core_id)
>  		return -ENOMEM;
>  
>  	return 0;
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

