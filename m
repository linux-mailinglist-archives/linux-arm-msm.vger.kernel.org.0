Return-Path: <linux-arm-msm+bounces-90368-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UBZ5Ahi3c2ncyAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90368-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 18:59:52 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A08794BF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 18:59:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0C7DE305BA81
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 17:59:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37CFE237163;
	Fri, 23 Jan 2026 17:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AHjwkHJi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZXaoI5Ad"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E58AA221578
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 17:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769191140; cv=none; b=sZSV4fpRMYJpVJDnUrbjgp7izyo3sp/2o+IYTDdLTrHZYNqQKEE9rVw9rm9pYEML4bliV0vKubpwVwOGUPxkwRUgc8emw5HF2VkROBiydKeAKZCrVmxhMRheIMZK5DxEDZrx3JrnTeN+dkLnJiR7XDUvRyJCUMgKkxOEX+Bt8NY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769191140; c=relaxed/simple;
	bh=yLqQPJW4UueEtYDyLiaQOCkBmNkY4+UKlvkSULTIwyc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aaepHQ0TYNpR/FOQunJnFECFYKd9xwvp/2glysIzJbagRZ4GnHWvdRJgOuXFaHGX4wNJ7H6Hx+n2V20lvAgJNgpKJJsk+AVTQgyNWrEpJkH1XeO4tuL3YGbBn9FrnRV3ZkLaCNhy7j7FJRJsDIDlXVRMqftgHPQMmKqFjcLJ+vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AHjwkHJi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZXaoI5Ad; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60NH3sbZ077780
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 17:58:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ckrbQ0Dcn2KkakWCOeOQyrNO
	RUKM1Yp3djJ4f4UP3gQ=; b=AHjwkHJi0HJBT7HX77vgRFEcbp4HwcTzuDWwQrZ6
	jPFd9HgkEBq4giVK2odCov10T4lU4XXMLxfPH2+gNrdEBuoaV32nw7v7brzq0+We
	s6J2edGaHLdgPsRBwESVyH/y/ANfsmod+Ke6XQCg3NCWqwv0HgDMs7DovOXLNjvZ
	CYmB/irRKFCIUKJyuB7+NaSNEyquYhjYyuRj0SGvJ3YImBCY7G8r4+wcD8+RlLmn
	6ldGuQOisRJK/FebbZHXuS6NaMNUJAOCBBJamrAox5no4A+re7COv2s4JWxnWwEI
	fvDFTfSvmAN6YURDayqEh3sqFxIs7WR7pIHoUxF9RZabDA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvd2cg65s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 17:58:58 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-93f568048ccso2666502241.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 09:58:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769191137; x=1769795937; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ckrbQ0Dcn2KkakWCOeOQyrNORUKM1Yp3djJ4f4UP3gQ=;
        b=ZXaoI5Addz3nO8Hro8pTY5vW5Pp7uOooXRky7YPI7/fW0Gus/ZzBz6c8ZdSZSuHlUy
         5uD2wP7xVEuSek9kHlfp76gSm+R2IHZG8ZViN9Ms01FdOn//A6qggaRpsOQdexyxpuJc
         3me6qOef771rdpSHenMc/8Wk0OmWqhQPggXKeVU0+My8JcTI3mCF9tAo9kjoY0WYMS6G
         0jyYrMBSk/aHxOF+0Qv3CQLT/6RniwOEIZN+kKB3cKw3bJxQPABfZHGOGyrODKx5MhNq
         2TaKCLgq8eUM3d13Z/6RVAGk+UvSVjMTNkCnY9rVQjmJU0nN7zDJcHBihFJQ+9uAGRJs
         tLoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769191137; x=1769795937;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ckrbQ0Dcn2KkakWCOeOQyrNORUKM1Yp3djJ4f4UP3gQ=;
        b=sFuNM7KwGP3XhJfPKp6iRRvqYlDjdS+I1+4v4/n2BPsh055MADAcnf1unmOkZchhGf
         80sEUn1Tv8jZjT/sKcSv3Yh4CH1TZSP6iJqtoOKnT2RWAsdkWrh1RTJMOBxsG/kwooFW
         HglAjir0vH3lz/Nkiq3KPEOctHwGdrO3QxmCzBXOhc62BAQ9Gorequ2GhP7kaZIJjeyJ
         wa2z+iIJXTuIPTOCNiCGWf5rTRYvcrPLf02pJiNurVcgb5gL6HIViUQoTdEcALUlEnGc
         UMANQsU78/T8f8zhXyhO14lyYyTGRG4fHvY9z+ZfnJn63n7NVBwkYd73ow05whgPMYEa
         SPTA==
X-Forwarded-Encrypted: i=1; AJvYcCUZBA40cQfY9EpMEPqzmb4FMFu6Eau/msqvBhCWLQnXF5wQYN1UVKc4Umob0jCs8GxqDf8L6FxzK1RmVgzD@vger.kernel.org
X-Gm-Message-State: AOJu0YwcE4V6q0mjzMwCjZN2OX3BWE872BN548d2/hnwBda+7kt5WDJ5
	oa7XpXC6mwJfD9zAlzdlvynYOw5wGo2P1m2FKVBuf+gbeXZFkOmfec4iVcy48dfl7j2blmSlOOf
	Y7s4cLK5CIKrkESYa2b+AxrPknv3RDmkbGw6eq9opJwy0JB2/r6CAiupXbj/DX1oxGNDL
X-Gm-Gg: AZuq6aJ6FBON+Q+gWZppWMKZ4aKIkDYvHn99R7g+RI1bpHRTUPPSe22ISLQIPI64Fya
	T8z0/2p1VhLb/BSf2R1IqoEyBvtWxhZbSUdeO/AF8civdQwxGQg9REuY3Xugu6O1ZKSXaYoPeu3
	Ye/i3+ozcPODK8Xgmp6+JPcTi5LZNzTBu7zvk3Zd7/6/MOuqoQiYHE1uWFRaVXeSFhtCNOMVHxz
	ALInPDEqWA4R/OoW+0zYe80vtYy4oJ4Q3To2ydaiJ7OPYWXSm9b3MqVp9dn32ZufZepoF7u7ga/
	W9uCKLadUYLm03D63/ZRn3SQYjyolozEsV/wwF2GtRO8Umylp4wz+bjDOcAEIW/cIYG63K2GvPc
	GwGlVhSxHGvMcNIbT3KuoE80t4HGHECbMzSrnQvdG513I/8qlE6Hs9IJ92mYW3WvhsEmMKX21ln
	iROZChpbO68Q+mvs6zt7Ct37E=
X-Received: by 2002:a05:6102:3a06:b0:5db:20ea:2329 with SMTP id ada2fe7eead31-5f54bcc0411mr1142227137.35.1769191136973;
        Fri, 23 Jan 2026 09:58:56 -0800 (PST)
X-Received: by 2002:a05:6102:3a06:b0:5db:20ea:2329 with SMTP id ada2fe7eead31-5f54bcc0411mr1142206137.35.1769191135070;
        Fri, 23 Jan 2026 09:58:55 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59de48f0259sm801012e87.45.2026.01.23.09.58.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 09:58:54 -0800 (PST)
Date: Fri, 23 Jan 2026 19:58:52 +0200
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
Subject: Re: [PATCH] drm/msm/adreno: Fix a reference leak in a6xx_gpu_init()
Message-ID: <nsw5leex5uwofbhmue52l4zjmwz2wbel7i5tngjysr73ujvgxh@476xtlglkoom>
References: <20260124-a6xx_gpu-v1-1-fa0c8b2dcfb1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260124-a6xx_gpu-v1-1-fa0c8b2dcfb1@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDEzNiBTYWx0ZWRfX8+dXoY/EoFqL
 7vnwGZ0gdlk8jo4PSDo1VDJTJsybqEamzPWB43yMHzmg8zggrGNgzfWcs1U5Qn86VaVa4s7+wBZ
 N9DE91TY8J4TWE2p0/QHOWfzsT35LmxDxH+0hUyZ7t03cnzEvALjQRHcAD0tizsE8cnR8MGYRRu
 vDuATYhYO154AfceqesfydEMLyIashZ0CIpuXR+Ir4WysyLUoSI3GZr5IZYOJBQksbP5MUjNbuD
 ruZYjbYenFdGLPRjf1xxBwah04CfsdBcrcckQXLsPmg36CkiCYOeqTqsZAJvpGZVh1dSZzbjCn/
 F/GMOcjIc/Uh3K/IvdV44HRVBmx3591+6UnIqAgSFNu3ksXO6TiOnExLg8FC8qN0XartbLZ7/1i
 tS6cqUU/rUPWXa+x4nRvtJWXAXaOr3ycWywJ0/Ft0io2iSX+dzdq1IJdOdXQk9eRVXM3ewkfoEt
 7qhY3LCHYPH2ecLY+AQ==
X-Proofpoint-GUID: K0tSwzyH5FcIKNEDb_yqhJbbtq5jwfbv
X-Proofpoint-ORIG-GUID: K0tSwzyH5FcIKNEDb_yqhJbbtq5jwfbv
X-Authority-Analysis: v=2.4 cv=bapmkePB c=1 sm=1 tr=0 ts=6973b6e2 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=mHnloJP8uCFruMiY-FkA:9 a=CjuIK1q_8ugA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-23_03,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601230136
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90368-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.984];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 59A08794BF
X-Rspamd-Action: no action

On Sat, Jan 24, 2026 at 12:37:38AM +0800, Felix Gu wrote:
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
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 2129d230a92b..0bc518d9fd65 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -2640,7 +2640,6 @@ static struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
>  	struct msm_drm_private *priv = dev->dev_private;
>  	struct platform_device *pdev = priv->gpu_pdev;
>  	struct adreno_platform_config *config = pdev->dev.platform_data;
> -	struct device_node *node;
>  	struct a6xx_gpu *a6xx_gpu;
>  	struct adreno_gpu *adreno_gpu;
>  	struct msm_gpu *gpu;
> @@ -2660,7 +2659,8 @@ static struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
>  	adreno_gpu->registers = NULL;
>  
>  	/* Check if there is a GMU phandle and set it up */
> -	node = of_parse_phandle(pdev->dev.of_node, "qcom,gmu", 0);
> +	struct device_node *node __free(device_node) =
> +		of_parse_phandle(pdev->dev.of_node, "qcom,gmu", 0);

Missing include for cleanup.h.

>  	/* FIXME: How do we gracefully handle this? */
>  	BUG_ON(!node);
>  
> @@ -2702,7 +2702,6 @@ static struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
>  		ret = a6xx_gmu_wrapper_init(a6xx_gpu, node);
>  	else
>  		ret = a6xx_gmu_init(a6xx_gpu, node);
> -	of_node_put(node);
>  	if (ret) {
>  		a6xx_destroy(&(a6xx_gpu->base.base));
>  		return ERR_PTR(ret);
> 
> ---
> base-commit: a0c666c25aeefd16f4b088c6549a6fb6b65a8a1d
> change-id: 20260123-a6xx_gpu-cbc095dbe423
> 
> Best regards,
> -- 
> Felix Gu <ustc.gu@gmail.com>
> 

-- 
With best wishes
Dmitry

