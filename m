Return-Path: <linux-arm-msm+bounces-103564-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IK3hBXJ84mm36gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103564-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 20:31:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8303841DF92
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 20:31:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BE5A7301C898
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 18:31:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6126E263C9F;
	Fri, 17 Apr 2026 18:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QVR+d2ym";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O0m8H9ab"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 290C11A5B84
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 18:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776450667; cv=none; b=M9Ho7aQff2vRr0G+WXp6k6lS5v40kVoNu6wacML2Mn+MkCBZDhWRSeyy8TDp1XavDaXUz7ZQAY2SFCmyAcgH/TTEFIHSoROlTmsmbVz8W5+bxSnnuJmsQFJujV2iIveNaDV0IuvG+/OSDY5jtqU27PvxrYgfZG6yqWJy660bqJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776450667; c=relaxed/simple;
	bh=JkKOwkEcT4D8ryHgKwaaZ0yPiMvgxeFUx12jixsCSDM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oD9gsGVVTpfCAx9fqYoPqH4wAJQoKJh1p+JVrT6G1csoktluxh11+EfNq4h/QAVea55LX/7vhWP2iTQDP5X0u1yXrhsfMQDPerarsa7oxkJ7BnsBLhARfnpFGxXTNddBxMqdWZ9Y8SyBpiChAG9f64Fe8+MHAwQWVFIY9zrRdJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QVR+d2ym; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O0m8H9ab; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63HG4DT04044188
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 18:31:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zJHWa2uZRpV/rmjTXEG/PvVZ
	8/IZn5LnPOQKv/Tfa3k=; b=QVR+d2ymTJhbZoPBWGqgcN+Xzmxckyz8lwnTEkFl
	YfZ2W1FGTraUKgN7h5WSkHrEXAPFCd66VsdtsKotSAcx1Ix9odFToiSmlK8tbfZ0
	4porw56HNVI30h2IqEcv5Atpf8HQEl8eqEsucs/lg4EEJskwp0I6YH6U+i/ZtOGp
	VnHRlZyBh0FtrEVT7Hx3Jx2bx/hT63kWGdTieeouc/pfi0bvoBc7WUEU6vX5I6RV
	CooIEKO6BirS5tjMe8frlR4oC0js+waHUggUmhK02uF0+B6z1G/3Fu0z9Jfk2kSn
	1MPajWUCvvB4m/1P5mlSouZ+XPx8HF3pm51ivuSF3qp83w==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dkqumghk5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 18:31:05 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-47545742ec3so1562908b6e.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 11:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776450664; x=1777055464; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zJHWa2uZRpV/rmjTXEG/PvVZ8/IZn5LnPOQKv/Tfa3k=;
        b=O0m8H9abyevTevFJGMm1HNEOsVkCzVTOqaYk0Bwtd4UfLo3qoqUF9utZ16B8C4LhY4
         rOVCO7q2WAedEuvYwH6kzkBpj0aaOY7B1zulZccXADNeX3R+tpsx3vEHtipvZGXCTpMo
         wjdJ90uSF5tX2RZ3eqwMbgLPrfLwfCA1EIw06zAzEhpluuFAx6HXXfh3GrdbnkEgzOK8
         HUUiDnxadQmRkBGOJcOfQFKDWQ+29ZaoEyJmth9LxPqwIv1+XV9sSmgaOeQBB7vt9eKk
         zCtoNI8DxDWnrKPiJA/nDFv1GW59gdwwcWYQq73C/SMYdYFFp9X08h5kCVu5fczW7FqS
         gcPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776450664; x=1777055464;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zJHWa2uZRpV/rmjTXEG/PvVZ8/IZn5LnPOQKv/Tfa3k=;
        b=pFjFOuUxymEXC/pjIJwy41VVhWC+4Fxqxodr0YDS0fVR7R0/q7T1DxakQF5ViLiwFY
         VoHJPdto6h2RvVOS+M474VdftpoxifB3r6uozBEVq0chxetO7XNkpvtNx0EjzsOVa9vW
         Q9ag7mZcW2t212Eq1fdXiRQrs2SYMMicj5gB06lQwsQbN5MK+1v++ind9l3JriqNPJXN
         VlaYRHkNEI9qN29iU1qOxcyeVFNHeExukymc+r8N2a9YSAjupZlVb7K1cYB2FRiu94Ef
         NVMOiCYNNuXUq1g8sm/PCggv66ZBFsE8E1OxyQB13oD4lkJiRnKEU8oRvv3i16/PQUs2
         SifA==
X-Forwarded-Encrypted: i=1; AFNElJ9qvIt2XeR23Nquls8TP6QiThvfH4CRL8Uw3Mz+5g8aqYGc3wPU4TCLIGs1wYX4ORm/Mli0o2qFWKPLMj1s@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ5wtjNAFZrnk48uzto+DCdAuB9gc7Xcsr0w9tHt4PmYVEDy8i
	OqmueVGvIj8JQtzO9fuxjcV7DljMrqByAC4re5FSIz7sHp+b4xVqJYhhrErQ2oxFyJD+hNVGUxO
	+DqV3eApq/VPGWqWlD6l86GrOcVpwpiFNfzCQUK1Al41QoSV+viUeWzz7yRB45F2hG6Fl
X-Gm-Gg: AeBDiesnKNiHdi+uSgszNBu7zbMXixo7CDBYn2ErwKX9uGRgvfSGEL3XNliFTzX3gDm
	zTVwIuBFcShrBDuk5G6x8XVG/UBhaJRLpzi9CCSPyP7mozorFsGstQSsML/AGllJ5NPLcwMGjky
	ooM1rmjuwHuQarqipzSwq04aYFbNyvpI07Do2WRT0XT03fHbCAHg+HcmBoBQuFcOJSWrQNmWwnC
	bOmIgb4i2i2ETxgu+gxq1hmfEH4cZbkoMUXxFcT525yW0XglVv5HAM4r1PAGR2ZdcbRpi1dqmK4
	sSqV7d1TRm8FdUt5P8KcXUuScaeqi9P7qoR9J7fTAGaYkjizxLnwTWzQC1pGPBFxbOBP4LfV1yE
	EefbDkK6izGtmKqB1wGB71NTEsd/B5rLgprbjsVJm2zS0niBNDmBhKeSYqvG/fsVMLG5nEfJ8QU
	cDgkVRtHIgdA9FyBuse2ksQJ/1NSmEH5fYhDRfyCzUeyLQ9g==
X-Received: by 2002:a05:6808:220f:b0:472:cd4c:c36f with SMTP id 5614622812f47-4799c873bb6mr2096893b6e.3.1776450664434;
        Fri, 17 Apr 2026 11:31:04 -0700 (PDT)
X-Received: by 2002:a05:6808:220f:b0:472:cd4c:c36f with SMTP id 5614622812f47-4799c873bb6mr2096860b6e.3.1776450663882;
        Fri, 17 Apr 2026 11:31:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185bc333sm629956e87.24.2026.04.17.11.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 11:31:02 -0700 (PDT)
Date: Fri, 17 Apr 2026 21:31:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jianping Li <jianping.li@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, ekansh.gupta@oss.qualcomm.com,
        quic_chennak@quicinc.com
Subject: Re: [PATCH v4 3/4] misc: fastrpc: Allocate entire reserved memory
 for Audio PD in probe
Message-ID: <7rfiwbbunlbzmhdjvsfqccltdx7cveahbgg2rk6kkom2jesta4@nnbas4vn63we>
References: <20260409062617.1182-1-jianping.li@oss.qualcomm.com>
 <20260409062617.1182-4-jianping.li@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409062617.1182-4-jianping.li@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: Ei64bI-hhIPGQXOUBQ11BaBw_dGzUcmx
X-Proofpoint-GUID: Ei64bI-hhIPGQXOUBQ11BaBw_dGzUcmx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDE4NiBTYWx0ZWRfX9YDNz2m3ujVY
 xxxIfCEelhOIZ9gmyeK7RDKcghI/jooWRQu6n3tq6Kp6+7uh3MS7Z4h1cqIu87DE9I75uaEM3jd
 6pTYXJ0uAguBWR6BWfHOGHKPO+uhrPIo3gt2KAkjdqzLWXnNZ2RfQR3MBq18b3uDTXO3oaxKQ+r
 fmQANI1qHVstWxax4slMIBFwHjaR069nEixCtOl9XD/MSG5c7IlXiJG5/9kmDLuzv3voEX8Ah3U
 rzlgluzBevQ0kt55WOVMr+DU6EoLnm+ZP5seUFQbXMeieWhradT/14sxI/EyHkBdfe8bGUZJKeA
 kjhAAOYIVDv6ddyIAwp222eDa1tI5z67UOnkflE66KSHOULVlZflhNxoDBMArUqZ3WSABfXFsbF
 Z94YMMyUxuiEkU/gfHTUfC5PibRR/qA27E7dRfMgfEqGcvFkCkIFL3tu0fGOhThSpnDp2TzV7DT
 A7CxmHCdVfnW690Zzfg==
X-Authority-Analysis: v=2.4 cv=PKw/P/qC c=1 sm=1 tr=0 ts=69e27c69 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=xL7owM3MNuM7HuHup6QA:9 a=CjuIK1q_8ugA:10 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-17_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604170186
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103564-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8303841DF92
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 09, 2026 at 02:26:16PM +0800, Jianping Li wrote:
> Allocating and freeing Audio PD memory from userspace is unsafe because
> the kernel cannot reliably determine when the DSP has finished using the
> memory. Userspace may free buffers while they are still in use by the DSP,
> and remote free requests cannot be safely trusted.
> 
> Allocate the entire Audio PD reserved-memory region upfront during rpmsg
> probe and tie its lifetime to the rpmsg channel. This avoids userspace-
> controlled alloc/free and ensures memory is reclaimed only when the DSP
> shuts down.
> 
> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 104 +++++++++++++++++++++--------------------
>  1 file changed, 53 insertions(+), 51 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 148085c3b61a..a67ae991c0b0 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -276,6 +276,8 @@ struct fastrpc_channel_ctx {
>  	struct kref refcount;
>  	/* Flag if dsp attributes are cached */
>  	bool valid_attributes;
> +	/* Flag if audio PD init mem was allocated */
> +	bool audio_init_mem;
>  	u32 dsp_attributes[FASTRPC_MAX_DSP_ATTRIBUTES];
>  	struct fastrpc_device *secure_fdevice;
>  	struct fastrpc_device *fdevice;
> @@ -1295,15 +1297,16 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>  	struct fastrpc_init_create_static init;
>  	struct fastrpc_invoke_args *args;
>  	struct fastrpc_phy_page pages[1];
> +	struct fastrpc_channel_ctx *cctx = fl->cctx;

What was the base for this series? It doesn't apply to linux-next. The
code here is different.

>  	char *name;
>  	int err;
> -	bool scm_done = false;
>  	struct {
>  		int client_id;
>  		u32 namelen;
>  		u32 pageslen;

This struct is way bigger.

>  	} inbuf;
>  	u32 sc;
> +	unsigned long flags;
>  
>  	args = kzalloc_objs(*args, FASTRPC_CREATE_STATIC_PROCESS_NARGS);
>  	if (!args)

-- 
With best wishes
Dmitry

