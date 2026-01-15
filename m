Return-Path: <linux-arm-msm+bounces-89273-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F2FD28864
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 21:49:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AE92C300C343
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 20:49:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B2792877D4;
	Thu, 15 Jan 2026 20:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WRmGzlVM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C59i3BhT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A6E2836B1
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 20:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768510182; cv=none; b=uUt6aIbM3Hm7pCuZcxAomKhKtGU4qP51Lu4VRZ069lRk6DR94QouDwBL6X3TLrHIviyfPf8MVa+76hNMu3yx33UeENVPm4nBw4Zwmkdk7H3P6+IfECOehkLCmIIBP3sunjlhqS+9Yx1AQjOTBtn4Luu07VP72Cpo2Mv43HX1pWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768510182; c=relaxed/simple;
	bh=L16jOftVwdMLTV3fnIv+RDBggTYq+LEiiigZYxJMzlE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DVslQa5yycqVbONT1Vdaa8gdTKd0cZjokaaQdad14aG6b6dp9kOCwZ0igeDnAAjZxhUmQ26dNF56Jd6mImTOw+IzUtN0zhTuXmFW2+/3fAixk4vQQ01yNF9pUANVgHMMSTrjG13OURtv828SA6RtuhkftvDyvMES2JktMVr/1ZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WRmGzlVM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C59i3BhT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FFYDgP1722673
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 20:49:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=THQFNIkFF3/t/NDKgOjpetPz
	WnPIDkihaT7sa0eZps4=; b=WRmGzlVM+uUghOVU4tiq16Yd7CkPTrD8BiGmPC0+
	Djv9x6RlWhQVp1X0FwN19BSbWOEwthQq2C+0/2WsVeb91WE20RE1TbrYtayEiXxy
	5JmdbH0Awngc1LRAVxgIKKmVlUG0wzpijOxjyDeIyReiEyJLzLyllM/F9HE606+x
	ZvYS1AQDm+/S4VyuRy2gv7l8KdI9amBvOQG9SKbm0ZcbM5Kcz68yYhRhvWGkSDuH
	/1dWdPjg3zEFkknurbv+qH8KqSx7AIaJnY4q4ABCOxzwCzSV9Ory6I6Tt/yxe+CH
	UvMOjNls0VorwqDEYZfdIXzpOh9oH+Kxwhr9thhNpmktpw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bptna2eb1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 20:49:39 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c52c67f65cso501330485a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 12:49:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768510179; x=1769114979; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=THQFNIkFF3/t/NDKgOjpetPzWnPIDkihaT7sa0eZps4=;
        b=C59i3BhTLXymKXmWJ1GgMZMvjmSc0Wj0OJPJ/9DQVDEIka/yXtkMut7v6/QSQJnOVH
         lAIr6SMye/FSRguY0jSb4BwgnTWgCaB6lhzmoyTmbXFa+YHqALzC5dcWTVS51e9Ueppc
         Rtqi8Vc/AAMBBEChUS/k7qamULJ7oX87e0eOts65omY6uQCbxbqCXu7iSy4W9mzotC6I
         1W2pbhY+wOy4lkV9gTARle25IWk6NblEfwnak8Kuseo3QOu+mV97nVyh4sJBhdh7SFZf
         4aQHStT22CmX6aRI92zHikD9dKmZXnnWOXzxBgTYPNr4jGsFcXAH6MNV39LKMWQkyw4A
         3Vfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768510179; x=1769114979;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=THQFNIkFF3/t/NDKgOjpetPzWnPIDkihaT7sa0eZps4=;
        b=KZBfaOAkcEpY7SKo0aq4yfNAFbOWP4bDdjwYBo5NBSUyf3cUW7ybeVF3KD46OF9UCM
         xlx/tm4cNiMcQH4LuI+upvdJFXBmn2koj24te+X7QCE9ijq+E8OfELshA/ZDD1QMuMYC
         b2dwuimt+jhxME557zv3uPV03SOn4VM+YpI2eO1w9P0nG7hQkl7pbon64HYZnJFQv6fW
         HCxVoHVFadEnQETK8rlghsmd75veVdM6Wfzg8olF1agxNcOGfp3MvdIPWiQux/2/tLph
         LGV79KO1e0qXY96ubHy7SZ7/UCWy99YoMPBcqICPYWADQelqL9RjtzvK/Zjy399Qmaha
         Z5ig==
X-Forwarded-Encrypted: i=1; AJvYcCXRwmoZiV0ZazKk8rC5SaGab24avih94JkdGtRuYqhUHyJDcBgpdkzn4DeMWWwOq2CX9NuUMfTbKtWKWuGe@vger.kernel.org
X-Gm-Message-State: AOJu0Ywmkv1IZjD6m1dV0oM17unjRRRIOshr9xvX3uUsg7RNk9hHp2Uh
	QG6/S/+qyFkm3N9g/lTri1jcBomBkoNdZIQhfrYcFg23RffZwHBRxrKzL3PSdqlgh95Wo/zL5Gq
	7bGBOY2YrkvTH+kElYuZUcLbxsGE3kJUXukLIiwok7G7UIlcUfD8e8mbT9RgUzMPE0nn2
X-Gm-Gg: AY/fxX5BHaODUTRV9vyoP1xC+lcIHvYRviKJg0xbbJbh/vQW5zltePbAghtDfai/CD4
	muWouFFjeI0B4oTP2SBRQWd0FMGPAlZHq7fgeyez3b4LqxZmks2iI+3sUUOS8PaBZNlMyFxGqaa
	LmoEFddcg7Vo8Q+x8x0wQQ8oM/alfw6FmfqHgxtF4bD7kZ2a/WYa8rx4OINx/itg6GfuSn2uCH1
	/iEWcdAOWJ1Pb6Df7DxjQ01kU09RT/GihmKs7hshuTsrMC43bIkn2wBZ7FqR+nGd1DSXptxzTr5
	pFlXj2CTYvevV8eEh7+OKIkZrXP2uopiFP771LD1NC3RaeRc7My1mgQvLyi+KeMJJsqMnT+Mztx
	OQTrczi9X/JWjGyxPZ5nMUHMJKWr8v+sfxeaadmiKpGZYz1IkgZxNkAkevzx87dIgLkGXncWJ65
	aBVqIahl9x/KMSL78OQ5lukVc=
X-Received: by 2002:a05:620a:46a6:b0:8b2:dcea:fc78 with SMTP id af79cd13be357-8c6a68d3711mr108034385a.16.1768510179039;
        Thu, 15 Jan 2026 12:49:39 -0800 (PST)
X-Received: by 2002:a05:620a:46a6:b0:8b2:dcea:fc78 with SMTP id af79cd13be357-8c6a68d3711mr108031085a.16.1768510178524;
        Thu, 15 Jan 2026 12:49:38 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf39776dsm142269e87.46.2026.01.15.12.49.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 12:49:37 -0800 (PST)
Date: Thu, 15 Jan 2026 22:49:36 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jianping Li <jianping.li@oss.qualcomm.com>
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
        gregkh@linuxfoundation.org, linux-arm-msm@vger.kernel.org,
        thierry.escande@linaro.org, abelvesa@kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        quic_chennak@quicinc.com, ekansh.gupta@oss.qualcomm.com
Subject: Re: [PATCH v2 4/4] misc: fastrpc: Allocate entire reserved memory
 for Audio PD in probe
Message-ID: <ewiz36hwffy4egxpm7z3icvk4vd4fp7ktnny2vyiuzcsmzft5x@nsfvnpip26nd>
References: <20260115082851.570-1-jianping.li@oss.qualcomm.com>
 <20260115082851.570-5-jianping.li@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115082851.570-5-jianping.li@oss.qualcomm.com>
X-Proofpoint-GUID: daWnajvkoiWUKRlp53m5MnDx-f00La-Z
X-Proofpoint-ORIG-GUID: daWnajvkoiWUKRlp53m5MnDx-f00La-Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE2MyBTYWx0ZWRfX+ML4WzQucpuO
 Y7mbuPi8aVEgsezSmLLUa3jBjpuXwzLTG0edVimu9XipePVRo3dmxqQLgPnu7WiltnssI898wZl
 aWQfG8OrJMnoBU2WZ2E5kd+jtXiEdU6WRQp5nONwbZs56Hxc4FyC8H1nbCIglokbDgL4oRSCnlm
 RRRMr93ZqY1BWrZWcp5Vz1PXxWEno390QYMn/va462zxgVYgO01NQIKWDa2KxfJ8lE6mnRri2hI
 ucA/lYXNYjIDhFlylDYTGRvQSzrJiVecTgu0DxFybBygAoZvs6nJJhmgABsqLQ0Cij77r0MoMub
 6O3uGuj6wnlleqsGtS6Xv+jHI1NZfi7qrnUqVUOeNFV+54BgbcGC4wlFALOwSLTMXsvmuR6RCTp
 cPnHs0SmqIdPXYItyh0bWSpK1DrYrEt2V127IHa+lA+kBC+xw50TX37IOF4teEPJYgWBmDHAZ8f
 kBE5KGPqlEZJhy8ELQw==
X-Authority-Analysis: v=2.4 cv=fsHRpV4f c=1 sm=1 tr=0 ts=696952e3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=kNrQIcF38_EFy8roB68A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_06,2026-01-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0
 clxscore=1015 impostorscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150163

On Thu, Jan 15, 2026 at 04:28:51PM +0800, Jianping Li wrote:
> The entire reserved-memory region is now assigned to DSP VMIDs during
> channel setup and stored in cctx->remote_heap. Memory is reclaimed in
> rpmsg_remove by revoking DSP permissions and freeing the buffer, tying
> heap lifecycle to the rpmsg channel.

Why?

> 
> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 95 ++++++++++++++++++++----------------------
>  1 file changed, 45 insertions(+), 50 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 833c265add5e..f9edca7a8de1 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -278,6 +278,8 @@ struct fastrpc_channel_ctx {
>  	struct kref refcount;
>  	/* Flag if dsp attributes are cached */
>  	bool valid_attributes;
> +	/* Flag if audio PD init mem was allocated */
> +	bool audio_init_mem;
>  	u32 dsp_attributes[FASTRPC_MAX_DSP_ATTRIBUTES];
>  	struct fastrpc_device *secure_fdevice;
>  	struct fastrpc_device *fdevice;
> @@ -1304,7 +1306,6 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>  	struct fastrpc_phy_page pages[1];
>  	char *name;
>  	int err;
> -	bool scm_done = false;
>  	struct {
>  		int client_id;
>  		u32 namelen;
> @@ -1334,31 +1335,6 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>  	inbuf.client_id = fl->client_id;
>  	inbuf.namelen = init.namelen;
>  	inbuf.pageslen = 0;
> -	if (!fl->cctx->remote_heap) {
> -		err = fastrpc_remote_heap_alloc(fl, fl->sctx->dev, init.memlen,
> -						&fl->cctx->remote_heap);
> -		if (err)
> -			goto err_name;
> -
> -		/* Map if we have any heap VMIDs associated with this ADSP Static Process. */
> -		if (fl->cctx->vmcount) {
> -			u64 src_perms = BIT(QCOM_SCM_VMID_HLOS);
> -
> -			err = qcom_scm_assign_mem(fl->cctx->remote_heap->dma_addr,
> -							(u64)fl->cctx->remote_heap->size,
> -							&src_perms,
> -							fl->cctx->vmperms, fl->cctx->vmcount);
> -			if (err) {
> -				dev_err(fl->sctx->dev,
> -					"Failed to assign memory with dma_addr %pad size 0x%llx err %d\n",
> -					&fl->cctx->remote_heap->dma_addr,
> -					fl->cctx->remote_heap->size, err);
> -				goto err_map;
> -			}
> -			scm_done = true;
> -			inbuf.pageslen = 1;
> -		}
> -	}
>  
>  	fl->pd = USER_PD;
>  
> @@ -1370,8 +1346,15 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>  	args[1].length = inbuf.namelen;
>  	args[1].fd = -1;
>  
> -	pages[0].addr = fl->cctx->remote_heap->dma_addr;
> -	pages[0].size = fl->cctx->remote_heap->size;
> +	if (!fl->cctx->audio_init_mem) {
> +		pages[0].addr = fl->cctx->remote_heap->dma_addr;
> +		pages[0].size = fl->cctx->remote_heap->size;

Do we need a flag? Can't we assume that remote_heap is always to be
allocated to the PD?

> +		fl->cctx->audio_init_mem = true;
> +		inbuf.pageslen = 1;
> +	} else {
> +		pages[0].addr = 0;
> +		pages[0].size = 0;
> +	}
>  
>  	args[2].ptr = (u64)(uintptr_t) pages;
>  	args[2].length = sizeof(*pages);
> @@ -1389,26 +1372,7 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>  
>  	return 0;
>  err_invoke:
> -	if (fl->cctx->vmcount && scm_done) {
> -		u64 src_perms = 0;
> -		struct qcom_scm_vmperm dst_perms;
> -		u32 i;
> -
> -		for (i = 0; i < fl->cctx->vmcount; i++)
> -			src_perms |= BIT(fl->cctx->vmperms[i].vmid);
> -
> -		dst_perms.vmid = QCOM_SCM_VMID_HLOS;
> -		dst_perms.perm = QCOM_SCM_PERM_RWX;
> -		err = qcom_scm_assign_mem(fl->cctx->remote_heap->dma_addr,
> -						(u64)fl->cctx->remote_heap->size,
> -						&src_perms, &dst_perms, 1);
> -		if (err)
> -			dev_err(fl->sctx->dev, "Failed to assign memory dma_addr %pad size 0x%llx err %d\n",
> -				&fl->cctx->remote_heap->dma_addr, fl->cctx->remote_heap->size, err);
> -	}
> -err_map:
> -	fastrpc_buf_free(fl->cctx->remote_heap);
> -err_name:
> +	fl->cctx->audio_init_mem = false;
>  	kfree(name);
>  err:
>  	kfree(args);
> @@ -2396,7 +2360,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  		}
>  	}
>  
> -	if (domain_id == SDSP_DOMAIN_ID) {
> +	if (domain_id == SDSP_DOMAIN_ID || domain_id == ADSP_DOMAIN_ID) {
>  		struct resource res;
>  		u64 src_perms;
>  
> @@ -2408,6 +2372,15 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  				    data->vmperms, data->vmcount);
>  		}
>  
> +		if (domain_id == ADSP_DOMAIN_ID) {
> +			data->remote_heap =
> +				kzalloc(sizeof(*data->remote_heap), GFP_KERNEL);
> +			if (!data->remote_heap)
> +				return -ENOMEM;
> +
> +			data->remote_heap->dma_addr = res.start;
> +			data->remote_heap->size = resource_size(&res);
> +		}
>  	}
>  
>  	secure_dsp = !(of_property_read_bool(rdev->of_node, "qcom,non-secure-domain"));
> @@ -2488,10 +2461,13 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
>  	struct fastrpc_buf *buf, *b;
>  	struct fastrpc_user *user;
>  	unsigned long flags;
> +	bool skip_free = false;
> +	int err;
>  
>  	/* No invocations past this point */
>  	spin_lock_irqsave(&cctx->lock, flags);
>  	cctx->rpdev = NULL;
> +	cctx->audio_init_mem = false;
>  	list_for_each_entry(user, &cctx->users, user)
>  		fastrpc_notify_users(user);
>  	spin_unlock_irqrestore(&cctx->lock, flags);
> @@ -2505,7 +2481,26 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
>  	list_for_each_entry_safe(buf, b, &cctx->invoke_interrupted_mmaps, node)
>  		list_del(&buf->node);
>  
> -	fastrpc_buf_free(cctx->remote_heap);
> +	if (cctx->remote_heap) {
> +		if (cctx->vmcount) {
> +			u64 src_perms = 0;
> +			struct qcom_scm_vmperm dst_perms;
> +
> +			for (u32 i = 0; i < cctx->vmcount; i++)
> +				src_perms |= BIT(cctx->vmperms[i].vmid);
> +
> +			dst_perms.vmid = QCOM_SCM_VMID_HLOS;
> +			dst_perms.perm = QCOM_SCM_PERM_RWX;
> +
> +			err = qcom_scm_assign_mem(cctx->remote_heap->dma_addr,
> +						  cctx->remote_heap->size,
> +						  &src_perms, &dst_perms, 1);
> +			if (err)
> +				skip_free = true;
> +		}
> +		if (!skip_free)
> +			fastrpc_buf_free(cctx->remote_heap);
> +	}
>  
>  	of_platform_depopulate(&rpdev->dev);
>  
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

