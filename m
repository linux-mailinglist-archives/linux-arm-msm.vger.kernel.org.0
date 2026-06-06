Return-Path: <linux-arm-msm+bounces-111473-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id h40LJX7+I2ri1AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111473-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 13:03:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF6864D243
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 13:03:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=LrVQW465;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=cenPDrjv;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111473-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111473-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 350E93015448
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Jun 2026 11:02:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B39D21F30BB;
	Sat,  6 Jun 2026 11:02:50 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85CAA18A93F
	for <linux-arm-msm@vger.kernel.org>; Sat,  6 Jun 2026 11:02:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780743770; cv=none; b=Y2SLpPzzZTvtpAWMEEibhPiIdntQD/otcfJ8C0raWpahg19Nfe7Fjrn6g3ZxzU+n3SvaJja+yUq7TrlQ7lOVEHxUQiKbmUkhQP58M8s0iid4dJ8eveabKemB0godpFHdmFAjY/mZNlhv2MDGncw5bq3uW3mr3vgrKDVykuM1MKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780743770; c=relaxed/simple;
	bh=gyXPG6ELo0bmL+MqC1Mzp39K+l1S9rmcEaB7WJdATCc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gQ3io8zlZJyLeCVcOtHTk9MU/l0dgD8cbjzTRQKFXYFoyga6j+EJAowXowiegyhTWaQhvYTUrbvUo5RNBqFQvVmN+PnElXBMJiG3H4OP3yRblf4i7ZtcXrlUqKFY6lpsB9KGQ4IAk+nMLPepyhEA9/jaCIb7yREkjW/x6mwdIcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LrVQW465; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cenPDrjv; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65660Z0d621675
	for <linux-arm-msm@vger.kernel.org>; Sat, 6 Jun 2026 11:02:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=z0LAyodJZxP2JtWWuj8zBbIW
	zqB3tSZJxVWd9wh/CFc=; b=LrVQW465tK7okccwqCIxHHZWWMRu4xV1FLt17IhE
	dLxH2fhb2rsWAIrZRFdwrnTvwgt5CwSSFAEOVeHJlqLDM+hodJVNuccx8qsHgrPH
	++TAOeI9QWvLQ2XgmajkBMHS5SOc0iXQDG9Gxtckba2FQvHORkJ/onmrhspHQM5z
	9Iq5TNwiF0fuyTp5ozeJ+19Beyxa3HI6wCzkcuKog6MgO/5MNE41BflD0fGylslN
	A1SYy231lNLy7b9uMeh2PHXQs78lTJ+GacmUC8ypWEf0vrUAZzETwKbdNXN6qcgk
	qwmIyM1kUQ4EBAG6rhiSsgYhsaS94YHtAhSmxBGrBV/6QQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emcadrqn9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 06 Jun 2026 11:02:48 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6c554284973so3381531137.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 06 Jun 2026 04:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780743768; x=1781348568; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=z0LAyodJZxP2JtWWuj8zBbIWzqB3tSZJxVWd9wh/CFc=;
        b=cenPDrjveyOgojbcXBPwW7GN7PbsEGVPsoPr1SJvC02Cs72RaXzRgpOim/m2eg86Be
         5EJHt7J4F0yM55wxF9GRMShjGlzAZsLvgYm31vIp0QHDzrnP/eyWKbEThiGUV2otWHv7
         kZ0yPplMjNa/VybXeWnD2odjbuuNo32SyXye+otc2ps8vVgNRvGmUv9Xfl5PXXkO5w8F
         6t9b5HHjT2hubJVGF3U4+WTc/3X+P/prsQ7KOl1InA90PlLyaMFo7XnBO8zUmOFi5ns+
         V7/aGtJu0VZzLFPc/90mi1NX8hOiN0A2rcCAqkz78ex24aDPb/Gkcc2JFSbkA0ufQvbR
         I/tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780743768; x=1781348568;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z0LAyodJZxP2JtWWuj8zBbIWzqB3tSZJxVWd9wh/CFc=;
        b=pb2sVmfWPaKa3nXDL4Z5uXgBwUGvQhK1vXuhngRknpFOyEk0zTSmfMtmIipJJ8H3FZ
         G8APxlCalBOQ8hFetNvMdcMJkZ8PmN8J2yFuP6eCfl3NTx1J+FJ58Fc7FyuS6j38S+pb
         ZSZ38Cyp7gHOoxp3tg0w8qdDIF3snZGNikuj8HzNyQ6mkWazHGYq4QS6hmetooowP68l
         ljzDnAbdljhNotfgQsR02m7cNL9jBLFo6DzsEoBkKPsDRpi3UCskSX9VMl0EnBfWWDLn
         E5rsKLdjpvQh4hXKawdQENQ8wjTu+v81vVl16edRAZbElpDl2Dt0+bUryIzWpdiiFcCb
         VPuw==
X-Forwarded-Encrypted: i=1; AFNElJ/63xpKp7SljZr0RYkmzOp1P8F1nquULjcDxTmAdPClkxDAyfzWigznw7rOvqGDjDz+v5l1n49NwI+3xbyn@vger.kernel.org
X-Gm-Message-State: AOJu0YxOuLlTzXQbLnhqDVj9Pb54WiWH/kcTXPXKbHIbPCWu7tmCUxhC
	skUHDtw2gwg6XyXvPtF7xFsoqLxhXiWP3ygPg5THNuEZjwGcE+rINWtgT5RHWnLApbETJx9dMh9
	whYFf/rZlHf9DoTVey/by6yAXXBtaQL/pSXzhhSg3Mxpecxk1ctn1QeTlisHNWEzYwxg+Hpy31B
	ht
X-Gm-Gg: Acq92OEyvC/7bxFQlvtDinYOU50qjOch/S6bEft42r4mOwLIOxze2/UdjsWvuN3vOgJ
	EOSacyB+OnhHevsPTXNXRCJVvAkbsJS+n5EVVCq2K48bABxiEbZm4kO/zV5l6y0G4k9L0yzfQe1
	hl5ywIsChVlVbBzr5CA8JghgeBo6l0Pa5GV++8i3MmKYnTAwLgww6P/Ec9P1JhvwLt7MEfQV2Rx
	5EH2G42hbqgJxR+kC919w+1DDHlHZUdH0DgL3NUfP88yOlO7weX9Fw9hYpgfignDCvOxz6Z64+S
	oR4Gwen3XPLkElc7zzSOCc5gciXlo1yEqFLx6NCUqRgSJ3B2Aqo4N+OgtSMFnEoVaKfqqq717md
	i2igKK1CiA5s2LNd9ss1YZOSCrDp1Xrt3yFTUCYfN7LHzTjmhwlTWE6D8KtIJITtPpKT34XAIiM
	InyWDjhhlstvs22DraEqRKWnAYFvHT0CxpahR/p0YVLuAD3A==
X-Received: by 2002:a05:6102:442c:b0:632:d8d5:2908 with SMTP id ada2fe7eead31-6ff0d489a97mr3582789137.26.1780743767705;
        Sat, 06 Jun 2026 04:02:47 -0700 (PDT)
X-Received: by 2002:a05:6102:442c:b0:632:d8d5:2908 with SMTP id ada2fe7eead31-6ff0d489a97mr3582768137.26.1780743767298;
        Sat, 06 Jun 2026 04:02:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8ed90csm2383114e87.7.2026.06.06.04.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 04:02:46 -0700 (PDT)
Date: Sat, 6 Jun 2026 14:02:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ruoyu Wang <ruoyuw560@gmail.com>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: iris: check decoder format allocations
Message-ID: <kdnmoyguzvkaih2emd72ljlbwn5mzarupioxztkfyz3fb3lwxu@lbc4wkzzr7pv>
References: <20260606040736.13-1-ruoyuw560@gmail.com>
 <20260606081636.3-1-ruoyuw560@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260606081636.3-1-ruoyuw560@gmail.com>
X-Authority-Analysis: v=2.4 cv=DIa/JSNb c=1 sm=1 tr=0 ts=6a23fe58 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=pGLkceISAAAA:8
 a=dsol5IgxmFJRDfbvXG8A:9 a=CjuIK1q_8ugA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: umg7rDPDjMJL8zzIg_Mt6FviP1wC95S5
X-Proofpoint-ORIG-GUID: umg7rDPDjMJL8zzIg_Mt6FviP1wC95S5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA2MDEwOSBTYWx0ZWRfX1AyZDbxBBRgZ
 J8M27OLV7ArdHnE9IciLo1p0sBotR2s+wgUdc4N7b1y21X4m/dr1c3SaatE4Jm+ttcyK7V4baub
 uMhq8lM+ajBY4C9ZeoROlh4P920oaJZuIApgUKrXBD87FqFvcyUBtNuxdyP7EI4gri7T86zx8bS
 NV6+CcuQrfNCQ1mNF4C7ZVwfqC6VoRG0g1oCitKVbwrpUdtKEhIkIgy3lJZF9s9qnR5mR5xCMSz
 AjcZ2jVwi7GaUo79YgvSvMv637yWsmK/JtdEQCKPuvW16fONER4H0Lk3MeQfAK2yqg846K6A5il
 hKOYIlh1oTpOYk8s5g538BtjDp2t15w3x0OVU1tMSKHEhcTZm9bMQuCMk7DPbi5OQMCDlp54LfC
 GCHboEtFW7jNslNvaDj7BgUv7l/so+UiFdLtMu0T3106w40OBFilgOI85Gh+uu8LXX3NmvrrL+x
 vYUhPbIPZjLCOFq3a1A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-06_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606060109
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111473-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:ruoyuw560@gmail.com,m:quic_vgarodia@quicinc.com,m:quic_dikshita@quicinc.com,m:abhinav.kumar@linux.dev,m:bryan.odonoghue@linaro.org,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DCF6864D243

On Sat, Jun 06, 2026 at 04:16:36PM +0800, Ruoyu Wang wrote:
> iris_vdec_inst_init() allocates source and destination v4l2_format
> structures before initializing their fields. Allocation failures would
> leave the function dereferencing NULL pointers during instance
> initialization.
> 
> Allocate the formats into local variables and check each allocation before
> assigning them to the instance. If the second allocation fails, free the
> first allocation and return -ENOMEM. Store the pointers in the instance
> only after both allocations have succeeded so the open path can unwind
> cleanly.
> 
> Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>
> ---
> Changes in v2:
> - Allocate the formats into local variables and assign them to the
>   instance only after both allocations succeed, as requested in review.
> 
>  drivers/media/platform/qcom/iris/iris_vdec.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
> index 99d544e2af4f9..837f29f403bb7 100644
> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
> @@ -19,10 +19,21 @@
>  int iris_vdec_inst_init(struct iris_inst *inst)
>  {
>  	struct iris_core *core = inst->core;
> +	struct v4l2_format *fmt_src, *fmt_dst;
>  	struct v4l2_format *f;
>  
> -	inst->fmt_src = kzalloc_obj(*inst->fmt_src);
> -	inst->fmt_dst = kzalloc_obj(*inst->fmt_dst);
> +	fmt_src = kzalloc_obj(*fmt_src);
> +	if (!fmt_src)
> +		return -ENOMEM;
> +
> +	fmt_dst = kzalloc_obj(*fmt_dst);
> +	if (!fmt_dst) {
> +		kfree(fmt_src);
> +		return -ENOMEM;
> +	}

This is not the style of the rollback that is used in Linux kernel. Also
if iris_ctrls_init() fails, then the allocate memory will not be
unallocated. Further iris_open() will happily overwrite those
pointers, resulting in a memory leak.

Should we replace the pointers with the instances of v4l2_format
instead?


BTW: please don't send patch iterations as a reply to a previous thread.
Always start a new thread for the new iteration.

> +
> +	inst->fmt_src = fmt_src;
> +	inst->fmt_dst = fmt_dst;
>  
>  	inst->fw_min_count = MIN_BUFFERS;
>  
> -- 
> 2.51.0
> 

-- 
With best wishes
Dmitry

