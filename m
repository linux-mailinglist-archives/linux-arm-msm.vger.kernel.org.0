Return-Path: <linux-arm-msm+bounces-62218-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6AFAE6673
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 15:30:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0D2DF16EDC1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 13:27:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE084277CA3;
	Tue, 24 Jun 2025 13:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TLqI/8z+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D3052BE7BC
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 13:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750771648; cv=none; b=Aw8S+j8ihSIh16Pw9WD7r3haqL4XnP4EhDXnLO1FqfgZ+97mMEcI3oKvTp55z9w+RMa80ReyjndgjAE2GIXlv64Qa2JWAqB5g1pbm7lzDfTt907zRR5jKPbHdMCw0h1GacLiANabY1CZqtFPYcRG8C6aCi9rCyDTfmX8aoVpigg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750771648; c=relaxed/simple;
	bh=FjGEmCs0BPZm1dpeoPxOF8sgxgNrQTwtd7YpxAVn5FA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=feBand9IO9iQYmBvjdbDaPfhGSKPIs458OY6D3nII6EodXY4wJqS8UMBs3AeezMtHYhxdQiy2ObzdfsdyfDMULn8wdKKCfThAxyeazfeThDQtr5xi2arGlFwj6zmLrgBoKKJlv6ksXI9Pc3fvhCJVcAMyai4l1yd/YWwSCWQ6Sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TLqI/8z+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55O8mkau013999
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 13:27:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3u59PIoZvajI4RoVnO03xO36
	HTQDU80w+BqZTeYpQYQ=; b=TLqI/8z+FS8sniZGFDD5/2pnt1Tq33q5N7/7z2qA
	+mqr/gko6T/n7tOYGhvd0wqRfi74kpGme+ijFxp8iMXgyzkg8D3zqyEeIc9mLZuj
	bByJlwL+qr5Xx5CdQFNOQAbmVIF5rbZe8N6QkGaEtcLFm4obVdFYNZO21LY3r/85
	hEjmaa9A4fb1sSo14DENHrmoAONqdb2PWzGYRz5DkjtGMnG8xWATN2hefDk7Llqg
	aQOdBVpU5/Ad+aArYdf+lwxcFEwxqz9LAemF5NzJySWY+XPPUL3SvgxDOBMQvAOx
	5xomNEx0HRAn18+FJc1v52RIY7l0WWQaFtV8Fsy4dj/xmg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47evc5nca0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 13:27:26 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c760637fe5so58647485a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 06:27:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750771645; x=1751376445;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3u59PIoZvajI4RoVnO03xO36HTQDU80w+BqZTeYpQYQ=;
        b=kaD1QbOgN86IdHCnDLj1XeypMMLZ4Q3XoG5Gi3Uckga+KZmeDiwDnc4lUSntnWBtqt
         TSFxnGgin1EYE1SZsnpBpfasinlxqyExNi3sNmhBJfWzcW9JKPmFFl7Otrknvmr+ERbq
         QlOStQ6t+FapFFgoLmWUB5Eh7L0GTUO2sglTwNMqqJ86NtqBd6OfL9ZQmTPZR++Sy+BI
         5PhynjILXlArmzZZEsRIYVP+21xcL5yWnkefiI9UuXiyIcrCknFXRqZ97tS1pgZxkfcK
         oX3fZ0Br1CsnszlaxP+VWm9GSl7WMG93L4D32D9nAPF/FbPMna+qabSzb2twLHItXBmv
         cQ3g==
X-Forwarded-Encrypted: i=1; AJvYcCWPm4zadg5NY+a940IK71D/NCYTG8jNwc9UqnNsxRe5luXaXUNU4IgpYN5zKPCw0kF78kApHl0K35qJsdPy@vger.kernel.org
X-Gm-Message-State: AOJu0YwLyGs9UccjID0u9qsdDRejSNbOEsGI/8OShbvjpLu8Spxyy5b8
	0SamrUhIzGVUVcV+k1Oz1o04JXyJoGHIvTywDxEP7gn8xuzi0rqYx3G2usebK3W7k3kLUv9aIdW
	Bizo2rWWTJpBEocKVrIhkitmv/oetOXrQj/fIkdWPKYqITaxNTqeKbHzQNh/R5Ngf1jAQ
X-Gm-Gg: ASbGncuz3Al0ylaoeEhOJjVUvcpTr6OG+hDQh8ZzVuxazZX/6rHWY1rEmcqOAejrz/e
	aC43cFIE1ZGrBi7FInhZQ+RpdfcEAfCi4ed2sxiEX8iUMH9MRX79EJUrvlikbFT33qm8j8WL++o
	38f8gEmxFWBV1Y/icYTxnwOK9KiDi/KNgbBX2CzE303wF770XkufqJ6TryRk49jbMFaCuy/Opp/
	H/oVqFXCpXeWgNApnlV+ZzrcZzJTnrhRY345OoexNCq36fYcZYg0YXB8esGL5MuxzqIc2kvSlL1
	39Jr0N9pnIQ7jXUoiWP4GJ5IEI5hS/C/X158YQuRerwyHWWsA3MhPxLSl1Lunp9wESYe/aYrEtL
	fV+1U4cnonxK4dz9VmpNqKHpwOoeoYCsfir8=
X-Received: by 2002:a05:620a:3948:b0:7cd:2857:331c with SMTP id af79cd13be357-7d3f99391b4mr2099562585a.42.1750771644874;
        Tue, 24 Jun 2025 06:27:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJohpmNgR/m6Bev2x4bpKCE4S9GH7jwNhU52tyVVzKiXQBuLrZ3zNs+xx5pc5YtD/I+Bl0Yg==
X-Received: by 2002:a05:620a:3948:b0:7cd:2857:331c with SMTP id af79cd13be357-7d3f99391b4mr2099557685a.42.1750771644210;
        Tue, 24 Jun 2025 06:27:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e41bc044sm1834507e87.107.2025.06.24.06.27.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 06:27:23 -0700 (PDT)
Date: Tue, 24 Jun 2025 16:27:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org,
        gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de, stable@kernel.org
Subject: Re: [PATCH v2] misc: fastrpc: Fix channel resource access in
 device_open
Message-ID: <kk3jvlwjdzy2mfs6bip7dadrnsoxwksyp2odi3rfxkv4crmwtn@x5qyn4sp2gck>
References: <20250619051026.984361-1-ekansh.gupta@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619051026.984361-1-ekansh.gupta@oss.qualcomm.com>
X-Proofpoint-GUID: Cy6gW5fUKY1fwy_HPhyr9QxfJ7je3gFw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDExMyBTYWx0ZWRfX/6p8MbJ5/hMi
 BP8qEQssz1J28j6ENVAkBXUMpwgYBAcltPwzQc5LpbszK84WTiG78p7s6dwoHIMih4h09cb+1AX
 TSpufQXSYvYxrN65kB+5YwLr/HjSpy9ccPNA4F9jP5nLNJw90xHqc+MFjn3JI3aaBQQe8C8bq+3
 XTt4/37w0GMrTlF+eZxHxdTHmigKSb3GQ4k1zmNeJkglsyntjaYo+S97ae75vtFuzFfbteO73iG
 x/R+gGIJJ5BxuK9gOMLxY/PUv+UCAZiVahHMQNmRpk7oiwrq6rS9JGq8/YWdFMX8u5KfurlBgsS
 pq7aVDwEgRmPsW9T4x89vB0BixoOeE4AuM8bVADcEos57aXMvL2HlKhI3h8XijuXVOLBQwnFw53
 57JkSM//v1YlfzB/xoBCpDs/FntiTsjwcLL6//xpQ6vxQju61C9FMXiHDlDRg6xwNxmXOPxU
X-Authority-Analysis: v=2.4 cv=caHSrmDM c=1 sm=1 tr=0 ts=685aa7be cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=FrjfeDAZNqR-H4J_opYA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: Cy6gW5fUKY1fwy_HPhyr9QxfJ7je3gFw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_05,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxlogscore=999 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 mlxscore=0 spamscore=0
 malwarescore=0 phishscore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506240113

On Thu, Jun 19, 2025 at 10:40:26AM +0530, Ekansh Gupta wrote:
> During rpmsg_probe, fastrpc device nodes are created first, then
> channel specific resources are initialized, followed by
> of_platform_populate, which triggers context bank probing. This
> sequence can cause issues as applications might open the device
> node before channel resources are initialized or the session is
> available, leading to problems. For example, spin_lock is initialized
> after the device node creation, but it is used in device_open,
> potentially before initialization. Move device registration after
> channel resource initialization in fastrpc_rpmsg_probe.

You've moved device init, however there is still a possibility for the
context devices to be created, but not bound to the driver (because all
the probings are async). I think instead we should drop the extra
platform driver layer and create and set up corresponding devices
manually. For example, see how it is handled in
host1x_memory_context_list_init(). That function uses iommu-maps, but we
can use OF nodes and iommus instead.

> 
> Fixes: f6f9279f2bf0e ("misc: fastrpc: Add Qualcomm fastrpc basic driver model")
> Cc: stable@kernel.org
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
> Patch v1: https://lore.kernel.org/all/20250517072432.1331803-1-ekansh.gupta@oss.qualcomm.com/
> Changes in v2:
>   - Moved device registration after channel resource initialization
>     to resolve the problem.
>   - Modified commit text accordingly.
> 
>  drivers/misc/fastrpc.c | 32 ++++++++++++++++----------------
>  1 file changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 378923594f02..f9a2ab82d823 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -2326,6 +2326,22 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  	secure_dsp = !(of_property_read_bool(rdev->of_node, "qcom,non-secure-domain"));
>  	data->secure = secure_dsp;
>  
> +	kref_init(&data->refcount);
> +
> +	dev_set_drvdata(&rpdev->dev, data);
> +	rdev->dma_mask = &data->dma_mask;
> +	dma_set_mask_and_coherent(rdev, DMA_BIT_MASK(32));
> +	INIT_LIST_HEAD(&data->users);
> +	INIT_LIST_HEAD(&data->invoke_interrupted_mmaps);
> +	spin_lock_init(&data->lock);
> +	idr_init(&data->ctx_idr);
> +	data->domain_id = domain_id;
> +	data->rpdev = rpdev;
> +
> +	err = of_platform_populate(rdev->of_node, NULL, NULL, rdev);
> +	if (err)
> +		goto err_free_data;
> +
>  	switch (domain_id) {
>  	case ADSP_DOMAIN_ID:
>  	case MDSP_DOMAIN_ID:
> @@ -2353,22 +2369,6 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  		goto err_free_data;
>  	}
>  
> -	kref_init(&data->refcount);
> -
> -	dev_set_drvdata(&rpdev->dev, data);
> -	rdev->dma_mask = &data->dma_mask;
> -	dma_set_mask_and_coherent(rdev, DMA_BIT_MASK(32));
> -	INIT_LIST_HEAD(&data->users);
> -	INIT_LIST_HEAD(&data->invoke_interrupted_mmaps);
> -	spin_lock_init(&data->lock);
> -	idr_init(&data->ctx_idr);
> -	data->domain_id = domain_id;
> -	data->rpdev = rpdev;
> -
> -	err = of_platform_populate(rdev->of_node, NULL, NULL, rdev);
> -	if (err)
> -		goto err_deregister_fdev;
> -
>  	return 0;
>  
>  err_deregister_fdev:
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

