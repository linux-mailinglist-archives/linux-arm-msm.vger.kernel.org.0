Return-Path: <linux-arm-msm+bounces-87610-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF3ACF6848
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 03:51:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8663C302DCAF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 02:51:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06092224AF9;
	Tue,  6 Jan 2026 02:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cGrSNGrz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hNO2S9qQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED0C181334
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jan 2026 02:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767667885; cv=none; b=Kk1JXLouo6DCd27A6RdGWDQg6sUG/O7rxlMTrD5b+NSl3u9YO+Sut6VNNkKPmwzwWS787W83hqIKaT1WR9lCj3xb7sViAfu/vC4bC3sVb+cZu7/hVIJrlaZCNQwKj0dpY37u5h359jbXC9MzlQj8yu2Xp2sY92f77M0s5FaWjvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767667885; c=relaxed/simple;
	bh=6UEXPIadiM1y28rYkYrVtWb/C9uDu+/4wBRCCKiVdI0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lQLDMyq1furlih+7qGypGkzXSYuCWMrtoueM9uZvzMA2gG58tRGmAwACHb0elW0Klp+7zwzPTVvEmw4XopjDYwZ2/ClELbuxZQkSGEl48W7GULWfgG9smBohdclpWuReE9Cqj1GREJ05g6dC9almFa8JKQY0y12RZ3rCYiA3bbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cGrSNGrz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hNO2S9qQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6060npBH1845097
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Jan 2026 02:51:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GHHGJwQBYKBT8QMPNRVU2nM+
	FeolExizmBIHcVzSd00=; b=cGrSNGrzscWbqqJKKOW8aDFYtcE3sv8B3K968WQJ
	rK535bho3ud7SOTtjp14BKGCnIT9LwxgFyADTet1fCbSaaoaFi7HPUb0R/DebSZ7
	NkQ8wi8CxGMCEu4ZPd8fX5wxiNnKxVshxE7nho5LUQGK0ahgvN7svy5GQDCKE0PL
	Yy10FuvysfL96k90p+LyjiMnFNJ7ZkbuAyIsqa0Lzk+csap5djg0DEyHPotS2aQ6
	M2/H+sVCXbYFnMdFZ2B+2PmB3747EauvFXmv/nUTjjYHX1fJGn92/gWSdi3lIpJJ
	fU+eZQbfNiKwTkoKMAffXfefMN0GHYpINKEbKtVXTirWNA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bg6uubd7q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 02:51:23 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee0488e746so12496531cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 18:51:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767667882; x=1768272682; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GHHGJwQBYKBT8QMPNRVU2nM+FeolExizmBIHcVzSd00=;
        b=hNO2S9qQwQ7ZNJ8LRSDh2yK2iV7LqtzaQ3kgHLYW2pY03w0/LgDUr3dYfved3kcobN
         mRFRezKFHFd5qD2IjwBrUqAK5iAO64XfYAidN5WcYnVC2ahsxStBH5zAn+l5HsLOhejc
         /aBA11y6hWiO2YN+2x6qg2Y7yWYsRD2nNIU2EK8ywO069Dk7l09+Me5cQw3aNyRAWJbN
         mWWiEotl2HZlkNlSTlFzioMspdO1ah74AJWD/r5HMlTBuPMFqHEzYkIrP2eb2v3XfVrQ
         f7GLZe9bD8GKnB6V/eg1FJKLOwTZRC6N18YQa9+V8WRKwIfojF/a4NRzDewqa791ZNt8
         h/UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767667882; x=1768272682;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GHHGJwQBYKBT8QMPNRVU2nM+FeolExizmBIHcVzSd00=;
        b=Bz5sbdYaQHV11VFfchip4lZkDXjyeBcmmSe+QIk6f7HCEKPde1NqQ+Q1ND/5JmoDSQ
         uPsWi7pTKXcWFoR3i156W6g3dDL+CyMXhn0PCQM8tlkkXVPRXjo60xavPsvnobHUnYz4
         GoMRnqnVxx/Tm28c1xrDcOZ+j0bHTsJzcqB6nqqibO64lz1vNyoSYwF9luJ2nSxbQTaf
         rd+huI30aVD+pYuqrMWq6DY3jKJwNgZunWj3pnCtKuQyQLH2s6ciUN17QUAx7crkSjKN
         Di81ln0v/tqT9jjAUlbcK6u/kDJ32vwCBH5HczMkAOB7pJ08pHBbP32Qmo4/uKfIV1vb
         NvnA==
X-Forwarded-Encrypted: i=1; AJvYcCXf1FYnvU9aNPIOzTAp0yWd6aQ9i8koy8WBuSEaQh5hDmqCgE18bjlmOmen1eIdlFJYQEX5jCg6k0Ab30t0@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/mRZ9uQbDc0gPXO7kgzlKSGkvUls3QOhzUk2pfqur+hREfwdc
	q/h0tPyhQUhGln1h6HhEhVArkAnGLhuQW4HQprbsaTCJS1DT8jqefwxfHPn7Xgc73o6lE+i90gC
	cMRLAgSgRO9PrOgkoKzQ17PupHE8IrZWW1pp44ktVfcxZLyrGa4dE+K5eaVlCY7ucgOPdbHrzTi
	uo
X-Gm-Gg: AY/fxX7Va2mSuqDn0hYQVwU6O+/OW+NiZ5AUuNZbNLtnWaJEQqfxhAU+XQ6T9SobIcR
	ghDJGZLDcQR4V1vm1bGmQc9aU4wDTqfrDAvTFqloiRiNdfBWxJgBc8xivb2XXRzV2cIWqjrLcti
	XtkKcxGAWa6dt/Du9HyyjmwKKMxRm6kADWrwx7iUjPCFJXqRn6V5okUapwnRaH/PDcbgbWUvw4q
	7iesFAxZ+XxKSSOfNT2k3XwT7qyuCOU9MZSluRXwf9Qj4cmeetclrOp3UU/+RbkAMKDdchx3win
	BRLmcXsxYdW9+zfbqrKQc1ZXILblwrfBXI1EMbrUsXuFtBAaJWqOlRUXXLO1MGguWrJ9+vf5LGr
	l7j1kNc5SULB7DUS7xzuyc309Ro00c3NHqUcVvk77EuoTZ4i/PEHXzpmqSWcDKUp39AWjDGPmWb
	LBAUHnV4irUl9Bydm9kRz1uI4=
X-Received: by 2002:a05:622a:15c6:b0:4ed:a8e0:13c2 with SMTP id d75a77b69052e-4ffa840f4bemr17259651cf.10.1767667882087;
        Mon, 05 Jan 2026 18:51:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGlAVTAlS1sCEpDNlZqWgZxacKqAI2JL4ZwLUyA/sFDbGnCpD13jiv9GuxWEVQItfeZS7KbdA==
X-Received: by 2002:a05:622a:15c6:b0:4ed:a8e0:13c2 with SMTP id d75a77b69052e-4ffa840f4bemr17259501cf.10.1767667881673;
        Mon, 05 Jan 2026 18:51:21 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65d68df9sm228572e87.72.2026.01.05.18.51.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 18:51:19 -0800 (PST)
Date: Tue, 6 Jan 2026 04:51:18 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: srini@kernel.org, linux-arm-msm@vger.kernel.org,
        gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de
Subject: Re: [PATCH v3 3/3] misc: fastrpc: Support mapping
 userspace-allocated buffers
Message-ID: <z3tktit6jkxrkre4gm666aw3ql3plyhs6266cu2itrbjbj2das@yjp2pyesoszn>
References: <20251230110225.3655707-1-ekansh.gupta@oss.qualcomm.com>
 <20251230110225.3655707-4-ekansh.gupta@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251230110225.3655707-4-ekansh.gupta@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDAyMyBTYWx0ZWRfX9vkv/jyXcYIE
 MBgKBHQ5mJsRNUZH3sEeB3SrGJzqe0ELRE610V5KWQGP0+XqsrAbyX8Fx1EXODwWuvpZPptrMOZ
 E9U0CxsZ71VIZxFLxJDJLBnQbsSuiakroy9Z6kmrzYqsdSCq6tjGe7nFDUcy7iwoL5M4dspAws0
 cnW3+CWxiQNlijxvyPe9IwwYELZfwxZjBzozoHdjDbdGBeMer272xvaO8X1GmIPh0iBtYb5zl8m
 oey7xwBl/sD0+pvGzPHikPKTXpqLIZ42Zo7mKT2u6J/0ElCr3tmQP35zbzG1dBgGfbRBqLVbQg6
 9GhUpwiFH0uibIzsdf29tofAru3L8UJXbFCCdCVkRMLGfa9kcitrzHMXCZfE4JVcuayG271z17e
 3IzioIWviA6ZOinNp+OZiatArHXdK+Y7hi55iOh70OHBcmrKPZyWYxFB0vGQJWC6smFGT3FibzT
 cb0scK719CqRzT0xo2g==
X-Authority-Analysis: v=2.4 cv=eZ8wvrEH c=1 sm=1 tr=0 ts=695c78ab cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=1JIYHknd9OP_1O8iUoQA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: WIOqsytUaEr6ZS9p6N2xDkGGMnGaLnyu
X-Proofpoint-ORIG-GUID: WIOqsytUaEr6ZS9p6N2xDkGGMnGaLnyu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 clxscore=1015 impostorscore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060023

On Tue, Dec 30, 2025 at 04:32:25PM +0530, Ekansh Gupta wrote:
> Currently, FastRPC only supports mapping buffers allocated by the
> kernel. This limits flexibility for applications that allocate memory
> in userspace using rpcmem or DMABUF and need to share it with the DSP.

Hmm, for DMABUF we need _import_ support rather than support for mapping
of userspace-allocated buffers.

> Add support for mapping and unmapping userspace-allocated buffers to
> the DSP through SMMU. This includes handling map requests for rpcmem
> and DMABUF-backed memory and providing corresponding unmap
> functionality.

For me this definitely looks like a step back. For drm/accel we are
going to have GEM-managed buffers only. Why do we need to handle
userspace-allocated buffers here?

> 
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 97 +++++++++++++++++++++++++++++++++++++-----
>  1 file changed, 86 insertions(+), 11 deletions(-)
> 
> @@ -1989,25 +2020,69 @@ static int fastrpc_req_buf_alloc(struct fastrpc_user *fl,
>  	return err;
>  }
>  
> -static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
> +static int fastrpc_req_map_create(struct fastrpc_user *fl,
> +				  struct fastrpc_req_mmap req,
> +				  char __user *argp)
>  {
> -	struct fastrpc_req_mmap req;
> +	struct fastrpc_map *map = NULL;
> +	struct device *dev = fl->sctx->dev;
> +	u64 raddr = 0;
>  	int err;
>  
> -	if (copy_from_user(&req, argp, sizeof(req)))
> -		return -EFAULT;
> +	err = fastrpc_map_create(fl, req.fd, req.size, 0, &map);
> +	if (err) {
> +		dev_err(dev, "failed to map buffer, fd = %d\n", req.fd);
> +		return err;
> +	}
> +
> +	err = fastrpc_req_map_dsp(fl, map->phys, map->size, req.flags,
> +				  req.vaddrin, &raddr);
> +	if (err)
> +		goto err_invoke;
>  
> -	if (req.flags != ADSP_MMAP_ADD_PAGES && req.flags != ADSP_MMAP_REMOTE_HEAP_ADDR) {
> -		dev_err(fl->sctx->dev, "flag not supported 0x%x\n", req.flags);
> +	/* update the buffer to be able to deallocate the memory on the DSP */
> +	map->raddr = (u64)raddr;

Which type are you converting? And why?

>  
> -		return -EINVAL;
> +	/* let the client know the address to use */
> +	req.vaddrout = raddr;
> +	dev_dbg(dev, "mmap OK: raddr=%p [len=0x%08llx]\n",
> +		(void *)(unsigned long)map->raddr, map->size);
> +
> +	if (copy_to_user(argp, &req, sizeof(req))) {
> +		err = -EFAULT;
> +		goto err_copy;
>  	}
>  
> -	err = fastrpc_req_buf_alloc(fl, req, argp);
> +	return 0;
> +err_copy:
> +	fastrpc_req_munmap_dsp(fl, map->raddr, map->size);
> +err_invoke:
> +	fastrpc_map_put(map);
>  
>  	return err;
>  }
>  
> +static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
> +{
> +	struct fastrpc_req_mmap req;
> +	int err;
> +
> +	if (copy_from_user(&req, argp, sizeof(req)))
> +		return -EFAULT;
> +
> +	if ((req.flags == ADSP_MMAP_ADD_PAGES ||
> +	     req.flags == ADSP_MMAP_REMOTE_HEAP_ADDR)) {

Side note: why are these flags not defined in the uABI header?

> +		err = fastrpc_req_buf_alloc(fl, req, argp);
> +		if (err)
> +			return err;

-- 
With best wishes
Dmitry

