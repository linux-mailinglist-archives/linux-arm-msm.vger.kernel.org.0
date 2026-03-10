Return-Path: <linux-arm-msm+bounces-96685-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qGWBG3AusGlHgwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96685-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 15:45:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D666E25256C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 15:45:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 647DE3366C4A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 13:40:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A785240DFCE;
	Tue, 10 Mar 2026 13:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KZ4j66NE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YXE8YNnr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E6423D2B1
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 13:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773150020; cv=none; b=QFpjqExDlm1YXeLMpOWQn3X36VBVJCzySvIhufiTOFjlyti2BoI4yTDZpUVNJFxRsn/drETK1ZhrLlGWi0PdItW2jvuUgbohpo+WufJi0ZnzfBYklISJACVQswvYiQJAS9HowagwuDEs3TDDYax6vt81z3mdXrlIZ8JYG/33U0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773150020; c=relaxed/simple;
	bh=AYKdwTwctQ3mzLsfO3T3OyISk54x0KiPdowXIBLOC/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lcv9jqpgG2trzOPjB2vgmx/V7V+RkqiilTXqB1pzfZTIgd+MTwrcklyDl9e+sivC7I1/CxY/f8K269H2y8wFNFUXOG8JUTLm9VkE3UP7cWk065kvvdrWlTcaIviXWHUgUYZcBWQiFC+V5jV3QIh+NqsHRswBB5HMFdI7U9nAIbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KZ4j66NE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YXE8YNnr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ACaWUC3759617
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 13:40:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UHFLrAbSUyAwHv7VDsqiGb+M
	Pxyxm/LYIa1/CsROgSk=; b=KZ4j66NEootDb4HzslbnpnOhS+ujVRV0zyJbOy7c
	whvVSTN43QPZozizXuzqN2500S3kTyrAvd9ANaHm3wx1EljJf4voW8bRs7YgUHUZ
	+QjulVBfxaEZrf4yFeFheY0ZVxsxEXNpvA72OLK9lnoEBfEDwPem1Ds5mJl/u1Ca
	Bbk2+8jXZzu3JmbmMhPMkQ9MJEYLro7YvP0EOGfipdMPsw4KPLbmWmgq7/1zITV8
	y0euvI5AQV1mZQQV0ns5zFnPognkYANWzvjrRaj7Xyd5Tz+UbKRZo8HJWKAu+cS/
	+XEufo6HVrtzUOYowxnvponiEdlA+Ditd0W9rwLrqAI66Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctk8ug8sp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 13:40:18 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35986cc87a6so8614109a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 06:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773150018; x=1773754818; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UHFLrAbSUyAwHv7VDsqiGb+MPxyxm/LYIa1/CsROgSk=;
        b=YXE8YNnrT2+haJze808PhlK1Sjzui+/lOlYwbYwaUPhwb4+YuZ/NlO1cbps3vfY9yB
         Uf8qYy2r9hldZSICbGASn8pOJpwvOq5A8qOvpZJIQltqgCj9qc8z5bPy1P7aR5yqIEnW
         B8HL82wRYqMvRezMq4mZ/NcEcFE66wWYVSU7/4ziucZ7O7fz/3gNL9fuALh6Q4ssNlo4
         c9dPSrwSY9Xn/TXYhS0ZAQ3R4g5nnEhBY62G/VWvYQsGj7eXfl9FVIm/LYQqR2vVZo4J
         rYH1ref12QMLO6ipdd5dHwfukvtjL4vv24R8WTd41g2ZhCTRPAeCPvOT/BHSM8zN2OOO
         BTwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773150018; x=1773754818;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UHFLrAbSUyAwHv7VDsqiGb+MPxyxm/LYIa1/CsROgSk=;
        b=Ms2qj3rdwSQetBFyDKny6T3Zi6cizZkv1KgUswPVDpddOBxl3WBl6jyoNO1BICM/22
         FdZOblxDPXVNjYA57nUsMuN7nRrHg6KnR7asW7CGQgfxADZ1rcqioLmJEXuYWWqcuTdT
         GCO2YHrnvMEsUUUoJNtwaoH+Kn7JWQgscjDQTygqV0wm4rgn2c65zQJD+1R6k/p603DN
         4mFwI0ebGBCL5dVFoEcDxIFN8KEad1Kzl8ICF/cggVakSf/Of/1Z0N47a9CyA+JOUyoW
         PME6k5dFfr5m4365h2itrSYHNPZS+DhA19gMH4yt5caq1jxGkhxpsxZNhKpEQ2XlfqQk
         8nvw==
X-Gm-Message-State: AOJu0YzmB7IZPMrDBxjpshA8jCKZ/zJRR8sIpdLpkE+8a+ozOqMh0l5S
	+3MQrT3gsZ+g1saSYTXJbggXOSx2DhPOt918I9OF9hkz1OpiLn5d5XGVAFWqJpR4NPKf2dsMfnW
	Gms86+ayl0ZS3nik9paknOaRbb47jBQI+X99h7WH0n3Y7nG6xNqUImky43dWjySt6RwR5
X-Gm-Gg: ATEYQzyw1lk2I+lnfdhUfkTCAI8XISRwLZuMTZs0Ft3v6fDcN0eV5FTx8O27oqlFaK6
	cxQ3eTnslITMLIGpa9AGigr5ObQaqEdqD5tLomzQt+kDs7T06zjWbt66nzeiu9wC5LefIT5cYkJ
	0TU1Y9ffu+OGs7SdCY+Vts1YEkQcYaZp5GqpC/ChAhFd49/6HFb5mL5LU8wDjfOKMtxBEsVUALH
	BU94zd67Qqgn0fMKTib9AZnsEY8ImwCLwp28GWMFmHNyar9xumMVbMqEGwwddqiWOJDFvStTdJX
	kHkIPydLtbK/cPrb1yOoSFcjnFqit8DT3xEhoVtoumFu/rI7vwIFTU/Lobinhgn2qGsrk/RZ6d2
	1D43A91rhHDlm3dPgxqwHDwHAfkYLbkz1SevBLhLhu9snJQS8
X-Received: by 2002:a17:90b:5544:b0:359:8d38:cdee with SMTP id 98e67ed59e1d1-359be28e0b5mr12943083a91.2.1773150017810;
        Tue, 10 Mar 2026 06:40:17 -0700 (PDT)
X-Received: by 2002:a17:90b:5544:b0:359:8d38:cdee with SMTP id 98e67ed59e1d1-359be28e0b5mr12943059a91.2.1773150017227;
        Tue, 10 Mar 2026 06:40:17 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c739e1961f0sm11926210a12.33.2026.03.10.06.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 06:40:16 -0700 (PDT)
Date: Tue, 10 Mar 2026 19:10:12 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] remoteproc: qcom: pas: Fix the dtb PAS context
 creation
Message-ID: <20260310134012.vxkrkgainjzeyygw@hu-mojha-hyd.qualcomm.com>
References: <20260310133711.2452445-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310133711.2452445-1-mukesh.ojha@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: RyNnhGyXSv1Yepzd6hokN_RKa2Abv0Eb
X-Proofpoint-GUID: RyNnhGyXSv1Yepzd6hokN_RKa2Abv0Eb
X-Authority-Analysis: v=2.4 cv=YcmwJgRf c=1 sm=1 tr=0 ts=69b01f42 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=ayo1p_KwZeqNCnpFpMYA:9 a=CjuIK1q_8ugA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDExOSBTYWx0ZWRfXxc7e35awEpYW
 d3Rrka64E6RO1iT57CkZdQwoJ/C97Aqh9O4h+jYJRCck7d8Bi1lMdUlzOuwEIq3LaRnqGsqGZ0l
 KbgOWcEsZXLt8eOpazDOytLRzVhVBLwoJrAZ/Q9+c4IxZr2Xu8b4K6OdkpxJRUkwup/kkUTgb+P
 Or43fR+6l4ELGiZW3loYJUsfesW+eNuaXc9HMrUusIZYEL3HkZgTSlK7Nwq0UDPFlBClA7q1DJ3
 0B+C8c1MPM/HZeqLSvcbC7klKYJFaBM86S8Ebv7H0s32dRPPSEazrBl+u9oGSCzV1AgK271G565
 L9bOjBjIAfVwNt3ls3pe138UiqK7TGKjG32gFDZz1uUGoem7ePqrv3ZhxNTNpGixNKafo4Ufm9Q
 3HHujr62wV3vgisjzcV1wSOU4lBF7hKURhe28STi78wsrNaq7KN93W8QRenWeWy7q/UytpxHNS4
 oOtPxIMwIJJR7PBhyfw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603100119
X-Rspamd-Queue-Id: D666E25256C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-96685-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Tue, Mar 10, 2026 at 07:07:10PM +0530, Mukesh Ojha wrote:
> DTB PAS context creation should be done only for subsystems that support
> a DTB firmware binary; otherwise, memory is wasted. Move the context
> creation to the appropriate location and, while at it, fix the place
> where the DTB PAS context was being released unconditionally.


Ignore this patch, this is half baked..

> 
> Fixes: b13d8baf5601 ("remoteproc: pas: Replace metadata context with PAS context structure")
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 35 +++++++++++++++---------------
>  1 file changed, 17 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index 46204da046fa..74596b82aa74 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -250,7 +250,9 @@ static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
>  	return 0;
>  
>  release_dtb_metadata:
> -	qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
> +	if (pas->dtb_pas_id)
> +		qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
> +
>  	release_firmware(pas->dtb_firmware);
>  
>  	return ret;
> @@ -640,6 +642,12 @@ static int qcom_pas_alloc_memory_region(struct qcom_pas *pas)
>  		return PTR_ERR(pas->mem_region);
>  	}
>  
> +	pas->pas_ctx = devm_qcom_scm_pas_context_alloc(pas->dev, pas->pas_id,
> +						       pas->mem_phys, pas->mem_size);
> +	if (IS_ERR(pas->pas_ctx))
> +		return PTR_ERR(pas->pas_ctx);
> +
> +	pas->pas_ctx->use_tzmem = rproc->has_iommu;
>  	if (!pas->dtb_pas_id)
>  		return 0;
>  
> @@ -657,6 +665,14 @@ static int qcom_pas_alloc_memory_region(struct qcom_pas *pas)
>  		return PTR_ERR(pas->dtb_mem_region);
>  	}
>  
> +	pas->dtb_pas_ctx = devm_qcom_scm_pas_context_alloc(pas->dev, pas->dtb_pas_id,
> +							   pas->dtb_mem_phys,
> +							   pas->dtb_mem_size);
> +	if (IS_ERR(pas->dtb_pas_ctx))
> +		return PTR_ERR(pas->dtb_pas_ctx);
> +
> +	pas->dtb_pas_ctx->use_tzmem = rproc->has_iommu;
> +
>  	return 0;
>  }
>  
> @@ -838,23 +854,6 @@ static int qcom_pas_probe(struct platform_device *pdev)
>  
>  	qcom_add_ssr_subdev(rproc, &pas->ssr_subdev, desc->ssr_name);
>  
> -	pas->pas_ctx = devm_qcom_scm_pas_context_alloc(pas->dev, pas->pas_id,
> -						       pas->mem_phys, pas->mem_size);
> -	if (IS_ERR(pas->pas_ctx)) {
> -		ret = PTR_ERR(pas->pas_ctx);
> -		goto remove_ssr_sysmon;
> -	}
> -
> -	pas->dtb_pas_ctx = devm_qcom_scm_pas_context_alloc(pas->dev, pas->dtb_pas_id,
> -							   pas->dtb_mem_phys,
> -							   pas->dtb_mem_size);
> -	if (IS_ERR(pas->dtb_pas_ctx)) {
> -		ret = PTR_ERR(pas->dtb_pas_ctx);
> -		goto remove_ssr_sysmon;
> -	}
> -
> -	pas->pas_ctx->use_tzmem = rproc->has_iommu;
> -	pas->dtb_pas_ctx->use_tzmem = rproc->has_iommu;
>  	ret = rproc_add(rproc);
>  	if (ret)
>  		goto remove_ssr_sysmon;
> -- 
> 2.50.1
> 

-- 
-Mukesh Ojha

