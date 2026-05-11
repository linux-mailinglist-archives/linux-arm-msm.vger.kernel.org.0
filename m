Return-Path: <linux-arm-msm+bounces-106840-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eDFzH5NuAWqPZAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106840-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 07:52:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C9C5084AB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 07:52:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B31EB300382D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 05:52:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C0E93793BF;
	Mon, 11 May 2026 05:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MKRQJQIX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aB6bbaMb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D74A37881E
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 05:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778478733; cv=none; b=d65JRqsKEL4PoUOEcxlvC7vOMy61moXUrBjJwOHytc0Mk0kVaKkekTcyALQxrqdZSgpypJk/b7015uIYzjVdTMjndj2dp1UDaukwC+uVO/PKhEAcWDkYTjXf7iwTXJcK8c8mxdVQjkE1yD9bAGgpBS8WfcmUP/AThp0M/Ma5qo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778478733; c=relaxed/simple;
	bh=gEygSniM1pwb1d5rEaDZ2qpWQGQVXMOGcEOj7g0O7IU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dWbmHMq/GGkYpgK8K5Tub/ONaTSloCWbjup6KEQei28vOGi76Aa1F5kk/tQJQy6Z4/60zEaPKb0aF3hHKsDFDwpFq+0ZXfrtJaCo9anGQVDAk70D8/rJWORqCkeDTsdwGCujC6UT0B1Yf+MulSUkg+fVK48TeHNodBaD/Rd19sI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MKRQJQIX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aB6bbaMb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B4L7OY2664177
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 05:52:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bvnm4K8l7T6NPyyBPovwsigFHLr+oEtTC7vrT+0xgto=; b=MKRQJQIX2JUTzPCx
	8Y2pzj0LgpMtau0ftlz/Vipjpl1U53aO+tONxgAjzzawcI3wcKHPtyV+LmnGU7+m
	VKAiMoB/qDM3Nvd0Q3f1axUa0sq3GNfvPzUMdgP6IWirvXgSv1hG3r8qWYEPuEsR
	04HAX4DXLx9XyDbZ9b6tVhXOGxQzZtkFRaNOcXhraYSuzx59T0tILDg9u7THcHAu
	47AqDLDX2qxuBMwnR3jLqN2sj824KG2b8InEgmRk+AjX3yl68/9hDhuNmcnXu+3A
	JprXAAxHnYzieZUlGWq4ugJARxuF1TThluAVTD7Q5lRCHcmie6HaQD42Wm1cZmxB
	isnmUg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1vgy4n8w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 05:52:10 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-365bba50e82so3817712a91.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 May 2026 22:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778478729; x=1779083529; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bvnm4K8l7T6NPyyBPovwsigFHLr+oEtTC7vrT+0xgto=;
        b=aB6bbaMbp2ubPqLlNQdY4EsgHg5VgtMtlFHiUBolxAClpHR9JEmXEspuvoYDk5nC88
         1/XfAr7vTkhAVpyV//UtnThwjnIecNWvIEEpggoePRW/MqHY8aNW2ncP+Ql0bh4r3B0b
         EqnGUhYZKh9EAp7K3TOC16oR+uxdtWzKB6MUZ9Z5ojBLIGc+GkRcO1C1QcudqKYc4sZ1
         DFG0hLtnfvx0NXJAhfZAv2eFRNUJaINAbnGQFoaBdaroB3O51ZG9cOvYaJF/RZsg1KVt
         JNsi3zFMZEx2eod2jTKBps2WurRI8onXvX/iRir75Ea98BrFGInMi/QX/wvczdDCJQyx
         AfcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778478729; x=1779083529;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bvnm4K8l7T6NPyyBPovwsigFHLr+oEtTC7vrT+0xgto=;
        b=PHdL0zgLr+zlPzCr8oEcfvr3IdG98kRwEjbAPsFtSheth5Gqa2gAeOFg8mWE6POo5P
         lL+jAGdSSJCsJ9H3xMpEQmfbPerWxbUS6dqJgOtvwYri2kcBBfCiNy+NNE4kknFdFF/A
         LUY9I1yMxw7wWrBreM0nWodkDSc0jjjzfw2Je11LcdmtWFWHG6KHISwY5WmU15uyWYzy
         49NrGeW/B8/WzgwXVXfchpzTotxKO4kZBRFD/9EKXPlL6/hI/9jj7FFHv4d/3hZP+N/F
         DouGrHnlqm2bX1nLED5XJiN+AqvznbYZD0jfjiFjhtCsk/leWVBiKYLDVJQ7GlNeV5XM
         jzKg==
X-Forwarded-Encrypted: i=1; AFNElJ+tqSpJqTgYSu16ih+3ttqWtAHIkR5ytUjlRh1BQzFNXQOpcmI4/eSQFdEQla+tuPuxgQX7nPEc82pmb8AN@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+4HB3n2HGEhG4jwTc2XiNNyrHNlO3akVO9GIOo6REyzWiFUMP
	joLZ+XHkOoQbCY7SQKLdas0QqN+f0NqAJJdBlhHFPdoiFDz5/73RIbzy2LcVTnWrmnvAA724owP
	NcFvzfv8Yt8r0bHDe4F+cutGoe0kchML1+9o2UpPU8EEYBYy0DmxOIjrLyThYqcgwOERe
X-Gm-Gg: Acq92OFXBjF0vNSwT8V075H3vdNlLn4FMW2elnRWL1+0WQC6yzhJzzXIqlfSSCdVuoG
	34UY72PywSfiyaVcVl+2yj79XPsWRZd9UsIa/zf2JHX3yDlf1kz67dDvuhnz794LBo1817GMmk1
	SJweK8ahXmRJj7bdYmg2VH0hTl9rvETVdR9388EGvgf9Mf4lWBl2V3u0D4xwNmpQefY+/Z4iZTN
	OSKhOzAt2nz53mExpQAq60rrZPD+DDwDDj0gUG2L7BgYMFfeEZVp5X81K5YMVEIeu6o0eKLN33p
	GX34xDi+DrqDvGz+4NBb/UbFZs/TVeqEZRK6y7wcxyD+Wn6nNwzBCQAHSV9b+yg/3WD/Aj535hh
	/dFx8xTqhSkzyqsQKXlLNtpH1hwMDT+ikpJsOcEVjuf7j97WhuYc09w==
X-Received: by 2002:a17:90b:3c0a:b0:367:e244:4c40 with SMTP id 98e67ed59e1d1-367e24450c9mr7642010a91.26.1778478729066;
        Sun, 10 May 2026 22:52:09 -0700 (PDT)
X-Received: by 2002:a17:90b:3c0a:b0:367:e244:4c40 with SMTP id 98e67ed59e1d1-367e24450c9mr7641978a91.26.1778478728584;
        Sun, 10 May 2026 22:52:08 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367d683fb92sm6113862a91.12.2026.05.10.22.52.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 May 2026 22:52:08 -0700 (PDT)
Message-ID: <b473e703-17ea-1cb6-8efc-697ecb7779a3@oss.qualcomm.com>
Date: Mon, 11 May 2026 11:22:01 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 05/16] media: iris: add vpu op hook to disable ARP buffer
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
References: <20260507-iris-ar50lt-v1-0-d22cccedc3e2@oss.qualcomm.com>
 <20260507-iris-ar50lt-v1-5-d22cccedc3e2@oss.qualcomm.com>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20260507-iris-ar50lt-v1-5-d22cccedc3e2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=fpHsol4f c=1 sm=1 tr=0 ts=6a016e8a cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=EBYp1ujtl4tFS5Gl5KcA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: ilYgcvkgKglvEbxg9GIYEC_YcSxv5o4h
X-Proofpoint-GUID: ilYgcvkgKglvEbxg9GIYEC_YcSxv5o4h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDA2MiBTYWx0ZWRfX0+IEnr5/2Bdc
 DmpRU6Xm5L5avT7ed5ice82MJCHC4pNU4OuNqUxFigQ65k4DHEfqJG4N+b9kRKiY8F71gq7A+2u
 jt7xynCjS6aUHuCPNbt1L7TbWgC2iKjht4mX4sEzU5Kg3ZsvZYhye5OLwI6aXFGE98ssyxB04Cy
 DRIERjXIFMCH0dLc0KL+C6DRiPDeCL5LTxWgpQMV0a2rtJt56/WQnWL8sFprg93R66NcQLdcNWc
 oih/LNfBrbpGQVrYxy7RtS3rvu0S49sPTUxOGU2ZVzCIBV5pa8R3xAuf/2PJE8w5M9TqtHY3Kuq
 H6ORv0PF20tXO3LYM+HMhXFArHl9ILfnGwf+3TlAmAdqFI6KTGlcmGwCmAmuzDaKVfE2MfrCmFp
 dg42zeftOyPDUTOdFULh+bLDf65d2Q5NPwArOFDLDWSYVrlbAhXwjEGIcv42+BsQxPIo46fc4ob
 VqPcopQzZ9CdDG8l1RQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 phishscore=0 clxscore=1015 spamscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605110062
X-Rspamd-Queue-Id: 69C9C5084AB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-106840-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/7/2026 12:12 PM, Dmitry Baryshkov wrote:
> @@ -144,6 +144,7 @@ int iris_hfi_pm_suspend(struct iris_core *core)
>  
>  int iris_hfi_pm_resume(struct iris_core *core)
>  {
> +	const struct vpu_ops *vpu_ops = core->iris_platform_data->vpu_ops;
>  	const struct iris_hfi_sys_ops *ops = core->hfi_sys_ops;
>  	int ret;
>  
> @@ -163,6 +164,9 @@ int iris_hfi_pm_resume(struct iris_core *core)
>  	if (ret)
>  		goto err_suspend_hw;
>  
> +	if (vpu_ops->disable_arp)
> +		vpu_ops->disable_arp(core);
> +
>  	ret = ops->sys_interframe_powercollapse(core);
>  	if (ret)
>  		goto err_suspend_hw;
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
> index 9151545065cd..71d96921ed37 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
> @@ -24,6 +24,7 @@ struct vpu_ops {
>  	int (*set_hwmode)(struct iris_core *core);
>  	void (*set_preset_registers)(struct iris_core *core);
>  	void (*interrupt_init)(struct iris_core *core);
> +	void (*disable_arp)(struct iris_core *core);
>  };
>  
>  int iris_vpu_boot_firmware(struct iris_core *core);

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>


