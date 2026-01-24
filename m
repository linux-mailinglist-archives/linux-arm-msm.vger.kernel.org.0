Return-Path: <linux-arm-msm+bounces-90414-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sLH0CK7rdGng+wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90414-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Jan 2026 16:56:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B0AD47E106
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Jan 2026 16:56:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C7A4F3004916
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Jan 2026 15:56:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A34C239E9D;
	Sat, 24 Jan 2026 15:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EPWJPsnu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gclwtS0o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DEAB1EB5FD
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Jan 2026 15:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769270187; cv=none; b=f5N3Z48VZ8tMm6YKLad97HPBL8pYmdz8TRgzexJhbqbAR6F5cR66K8ZFVvv5LRJNT6UVssfQLfKp0/4oBAEPxEVLbREIAp+ApqmHJBY43909qib6vdf6seGtFveS90IG1JYTSpKIy54ZX4yFpxjIVtCqomkkdhEwl8nGk0qzdwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769270187; c=relaxed/simple;
	bh=zLZPhntnNql/oWHFnQCE427AxV7B7JHeP38VYxQ9E5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QluPFY3DFO5i9Ytmqm7dUZ7xQyQjumwP88USH0Qj1iabqX+RHMGW8R45lmSA23IWJd+o1kEw1QznvAm8mop6F8SWdUVGXid9X1abw7tf8DEh7EMpSW2cFCPOZvSe0sO+IfoqtgsVyXWPlD2SwjS4H42q66HMFjvQT/OTa16+Pfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EPWJPsnu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gclwtS0o; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60O7qvQa546181
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Jan 2026 15:56:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kFuOXEbgChpXVrko/J+lG6Z+
	AySCv/eG/jHBiZiGWJs=; b=EPWJPsnuGVi3JfCfKaQXs7DtuTIRP8NUQMCLtIYF
	wyOUHWvDEkBl2DXR9F9aidKnRU7fO8QY5wzJKshwp+RAEmuJXjg34mVAnjrQyZox
	wH/W8c59J1vOQQVpqc6W6ZW8CAtvl7wnQHlmRL44faVbk1OHtchuUuJddMIAF3zv
	iMUk+XK9YKhWaW8vJj612itE5muD97bYjvODyX4cZz1vx6Bj5BPIfjBa6dNt5jyW
	ZHE6RCdGOYKO3Pa/3EbfDhKythGY/CfCCUz8hbpc+u0x02E9NHlu14TAd+0oTEfE
	+gNrivex5p9AY0yGeiGIPxlPD0i6gXfTbt7ce74oUqNP4w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq9f0td0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Jan 2026 15:56:25 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c52c67f65cso1159849285a.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Jan 2026 07:56:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769270184; x=1769874984; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kFuOXEbgChpXVrko/J+lG6Z+AySCv/eG/jHBiZiGWJs=;
        b=gclwtS0oxK0EVnvGqpRdQTgCDOr1y70YYdzeQHdHIbhV3DC0ZgvzMvxGGaoA63Hffn
         6pcvZMLAzJmJSkR8g44cEp1Oun+TNj6q1XqKxQBNpOgItFa+b6vjWr+Hy52I8IDQnNEH
         tk29fkPQOvNOicjXiDEZA5osM0cfubMFJbScBnG/0hfzwd7kng2hEMyPvLHfTlvssNa5
         1Kze46JLWt7WHFs0D+f4VpX3xPcfl+rrFfwgaxcihNxfM0d2vJYRaj3H3r/3e+zsTg3O
         pwkN3EoF4VQnsOvcKVx2xDV/nSDrYdwjtiq/4p+ZemIrCWfJrYz8+C80TCGsQw1pLjCs
         XmPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769270184; x=1769874984;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kFuOXEbgChpXVrko/J+lG6Z+AySCv/eG/jHBiZiGWJs=;
        b=ddzPSbJ+s/mF3xcoa45IQ4V4ZnWkbCMNmuNSQYdE16AFa6J6kP3EHtIfRsIldNpkvc
         yI8lB+wBVn1AfgTXyoQ4gGbWGoquZixwG7lUVRaege4PBCaXRe5N3xIEckzr9q2TJlFe
         PPZV7WYS1QQerBmWJfEMIAIxKTRDifKEtXcIMt3CtZyW4jMA36KzH4J1DkFP3v8mXilc
         Rg9Z/K5X8TidBSvlB8e/bC76cY5yHOcIphLyVuGeThQS/AYngQgm2M2iL/38eBt6Css1
         0O8u6uWjLSntrn0klyzg9vUNKfiHLLsRNDvuhJ2YEOa4q6JsJmZ/Dv477E+DhRNAlV9L
         OV9g==
X-Forwarded-Encrypted: i=1; AJvYcCU1F2k1AjQ4jeIXxZGfUGSwiB4JEhu/8Uaqaq6ZS80p8P9cQLpeyWaTAh/RGc3gGmZPJIf8IK0LSdm3oZCg@vger.kernel.org
X-Gm-Message-State: AOJu0YzkYrprvRssMMKusSEa/yer0IyoaYGabzyoklYZWDxXiFFrmxHv
	LHmaGTv5GhKweY3ZdyzYZGZ9Dsi/pXrWVTAMJumoziHQWXR4JBiU3jSlijuMgbnOPu2/loCtj3P
	PyUwODzrG1bClr9ecupXNsi/4POMZiDIBLJV81WrQ8NoSHbCM72db1ixXxqdB3APS8AdRy+ScRz
	PY
X-Gm-Gg: AZuq6aJ7dG4wj3SGud+CQPQqqGRhRQZQ/QIvtCne5+WVCB3tPredf0BacjkJmZIexOO
	dO1E9SWNfC1Ao5x31J+rHUo5cEItbyB05dEKF2gJBasSG0zfYQKzc8l6USIeZvjbEu6myExF+2c
	6rV4GopYy2JrJIf+LQvHmXECLAkFj6I+obq6cfUQXpPm65pHCMprlLrLJiNJKbkH/b7Gf8HmNUw
	Gz0LLRfQL7UB6pTvQyA0OtNLhaWg4fGJCaaN4fCpoHt3Ww0lR1kR/zCwsjwTmb7E4sKt44vcPXL
	Yoj/Eoc0FCiVxI9Q6s8zaqz4ANY+S9Vj4qwGCmIZYxPfzsGxqETPy+f6XE1du5cz2yAkTed4OmK
	buizkm7U1UZe5U0MEXFYaRZpaz9N/WNk10O/3/zuPpaH318JPJ9CJboyW9J3R5KIuoh93so+T4K
	Rnw2783aeKplET/+1fDSKxDBw=
X-Received: by 2002:a05:620a:3727:b0:8b2:ef2d:f74b with SMTP id af79cd13be357-8c6e2d93ff5mr814469085a.29.1769270183999;
        Sat, 24 Jan 2026 07:56:23 -0800 (PST)
X-Received: by 2002:a05:620a:3727:b0:8b2:ef2d:f74b with SMTP id af79cd13be357-8c6e2d93ff5mr814464785a.29.1769270183501;
        Sat, 24 Jan 2026 07:56:23 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-385da1fda63sm12775071fa.49.2026.01.24.07.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jan 2026 07:56:22 -0800 (PST)
Date: Sat, 24 Jan 2026 17:56:20 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Felix Gu <ustc.gu@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm/adreno: Fix a reference leak in
 a6xx_gpu_init()
Message-ID: <7k3szb7kxuhyhir6t52aqwkfxah4ah4pa7vzbnqdl5sovatxqd@vbx33srndwso>
References: <20260124-a6xx_gpu-v2-1-86a1dcf85e13@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260124-a6xx_gpu-v2-1-86a1dcf85e13@gmail.com>
X-Authority-Analysis: v=2.4 cv=YLGSCBGx c=1 sm=1 tr=0 ts=6974eba9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=OED-BgaD9Yn4RF6Et8QA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: ysVjwVC3J1WaD2QlDVuIoKuDzBcrcT1V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI0MDEyOCBTYWx0ZWRfX3MRSepDmAa26
 y5MAGtZj8+J0fNH4aAKqpktkYhVI/PzrPC/Nk8LITU8zkIXc8ZtnxuItntxwmfvLShtSTx72Icp
 EOTm/OOzG4kJeqSraWQ2w3jU7rjrX/le0P/AYghAU6MiqxDPyn/YdkOK/BbZresjxnRCodYKLUD
 buSXpakOtAyypH6bm6fsA+20iAmn2V0rvAffSxo95kauva2cbnglBYyAoRX9j8yba7BRDiZlXvx
 dx+E+XC/2H5ORvf/kWWmS10xwf9IVX0z7M+rE7GngxAfKN2iwLzVmM+fEkPsEg1pHwHoEtRwgOw
 FWZCuqybWJ4d81dPCESb2XjWN9GpY9cHZ5oT899vrLkJFsXXH4BhWywig7dMARjtLD1M9Rv7jKE
 z/J4FhndK0C6UzaPUjYF6hyYssIg914+TyQdtRip+WcK4TS5s2/sHLxDjRI3DGAmcGLT9sPrLdL
 BfMF5bMAuvFs1QXud7w==
X-Proofpoint-ORIG-GUID: ysVjwVC3J1WaD2QlDVuIoKuDzBcrcT1V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-24_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601240128
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90414-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B0AD47E106
X-Rspamd-Action: no action

On Sat, Jan 24, 2026 at 03:34:23AM +0800, Felix Gu wrote:
> In a6xx_gpu_init(), node is obtained via of_parse_phandle().
> While there was a manual of_node_put() at the end of the
> common path, several early error returns would bypass this call,
> resulting in a reference leak.
> Fix this by using the __free(device_node) cleanup handler to
> release the reference when the variable goes out of scope.
> 
> Fixes: 5a903a44a984 ("drm/msm/a6xx: Introduce GMU wrapper support")
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>
> ---
> Changes in v2:
> - Explicitly add header file.
> - Link to v1: https://lore.kernel.org/r/20260124-a6xx_gpu-v1-1-fa0c8b2dcfb1@gmail.com
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

