Return-Path: <linux-arm-msm+bounces-115862-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 35uzOYYkRmqfKgsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115862-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 10:42:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3806F4E9D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 10:42:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=kAsQWlH6;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=U3jef2Dz;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115862-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115862-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 56D31309FAA0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 08:24:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8628426410;
	Thu,  2 Jul 2026 08:24:36 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868CF4189B3
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 08:24:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782980676; cv=none; b=e9ChQMt3Ci57CoM6Wn42aSBiveH820M6BiMn+3iPvyDSyeVrbcBB8zODOaD/dxElYEGbRQmQefHTY7wGkBOqMRqpSzZn5Z4BhQx+4VVvckT7WVoYoskVaDZINaw/Vogzn830N4fCq7+iE3HULk3tzgFd+QcLUWSGoQ2a5N51HpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782980676; c=relaxed/simple;
	bh=7TfNTR0hfRdlUgnTVzle7w/4oYrCBb3RfmM7hrPSBZc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JG1oB4CwQ4t/fhf83Zch2JbNGx/fjb7yLSCyW/6J16l9Iwp7ujJFJ/Y2XTyn8Y0QKB7OWID1H4PzEoWDqYlUA+nT4m3fBP+itQNJwU4dzNI4Rqvj6hMEZFogviF63k1+JjdW72PZHijYGBTzk9UCwmNZW2stpafoaVMjTSao1yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kAsQWlH6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U3jef2Dz; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6621KS5q2957684
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 08:24:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NQzS7IkpXrEl8fo5F5AKeNfc
	E33LniJCvRZH7fNgTy8=; b=kAsQWlH6J9fnddB2sAV2nrTX45MbJ9QDWGJmrI+h
	boy9AEYB1qZ/XjeKF0Rz9PwILCiZIZlsk43mNdqtaXzQiVRClU27IkV5inMt7QVG
	+4CNSniOoJcTx5YW1faOD8ES0Nv90jy2sLr7T8dUmAqYgV/MPUS1sccB27yp7jEY
	3X2hR7iNOnUho1S8JlGu604M4UK9MC746BJoaNLarjio+JDCu3uEorV5pi2t5cJ0
	Pe6ZCV0VjZkP6y2Nvwsbri74PqIJursUD4inp74UGTnv54vTctPX7aMjE6H/wTwx
	t8vSb8d0tVgGQzcKGzefkdqeqWHG4P95tDmeNOKVsHDLXg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5630b7x4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 08:24:28 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-37e5ef8299fso1679451a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 01:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782980668; x=1783585468; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NQzS7IkpXrEl8fo5F5AKeNfcE33LniJCvRZH7fNgTy8=;
        b=U3jef2DzavmtWZv2wHluqbYj1KXdim6xVMiWH2rd4rROhvvvK0QrwuOu/a71hPWVqY
         dZXLOhQPcHUqKrwO+iL9xQCiiLn8M/CXGYKNjRVB5g+7lsboxpW6dLsNZg8TyEFKQeHB
         vxlLlEa2HnO8sXRbPpHv7KtV0vdUiNBrJdkGr1x9vnl6qgNtTEI00/zK/L7zuEv6DpqI
         sdhC4RlKcW4DMKDvOrt/Tc7+hVm0d/Jr3qZJRwa3vg9fcVLSIiIO1JJkBgH5JaZ9IDZN
         tOi5NK2dcekS1m2pqbaKG30c00VLLoyd2bNcx8VQVXOdTfxd/2WfIrN3KMWUgtlAwUTg
         EudQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782980668; x=1783585468;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NQzS7IkpXrEl8fo5F5AKeNfcE33LniJCvRZH7fNgTy8=;
        b=IhWIyl7EBmdBJx789PkGagpnMbeeOWIUqGMtaTtCiXLmk1XPwxPu8Tv/5Z2cWU1j9t
         f9FUGoyrKeBthwLTknV4m0KdF8ts6cEuRrV4LXr/afD3h1jwFSy2YGpc2JeY63Xj+XJ2
         8aa2ULE1zsJUQfP1hVEAw5A4FjpL+xiF6w1TsL08luE+Z1oyK/G4Q1ft5YToNskbxkcM
         qGmqtFo8apDcURT4BFPNb8LQlFDniCB16PV3N0bj5OngQACxU53bcil/RRiKS661LfmL
         aTJgHuWVzhpdddFv9SVgG+n8C32Z9E4VTed48PoQZxw6LmTaHM61+HppKigu9B9iK0qn
         FX9Q==
X-Forwarded-Encrypted: i=1; AHgh+Rq9RTsu/VXd53jwEnbCuFmwYaQryTa5G+McUaKL6zKzBMIKZXWpXHch7Fpk+KTh7+MXjvwpth2wrXL+9cAF@vger.kernel.org
X-Gm-Message-State: AOJu0YywO+b3OKOHkZbP7eFVhGh/cYGggaGpqEfOMQANBxtR3hI4F2gd
	a6T7Bi1l5SkA6rUe7iO+hjuSNhFPvdfSXh3fzUPzSOpKZSDJF4jorE9UK/EW/xPCna2TfEZacBr
	GquR2Wgw6kGafs+n0dcvJP0KWxnQJufFT/aVYKis/Y/W/DNkwYSsCd3j6Djr4kjHVifNl
X-Gm-Gg: AfdE7cl4TYfTGGocrYeMwNPRa8G6nE2adMC3mTK6QuV8fI1w9UrsUrX1Nn1rzJNhg3U
	5fpOydUaREwdEF/dKfJaPvZkQa6JOvQXwkrpNXV8mZ1bRye0Nq047WELVGlNtKSzD8GjZqWu7Be
	YGAAvuaJepaE/nyO7ccwML3BITBIviKjWn6xEWsZUzPaiDFFMCU+c8Ji+MRdfvy6ZfWYGrSIRSq
	zwcru1hSbKSwjQml0C0wJIMEEwvJldB5uLSF4O7ut4H2FjaiKwwkJb7xIh+ivLEVoOWiST+uVvA
	XTFPv+fV/W+jIOvyCnXI/2rG+1tcHlgcolECQYn51/+XLsSYxyX/a2Emrzt2AdXxeF0TKKLJRQQ
	eBCQklHGmIgqHd0J6oq9l+42zJYjksrWoo7KtqQ==
X-Received: by 2002:a17:90a:e7c1:b0:37f:df85:272f with SMTP id 98e67ed59e1d1-380baa6b3d2mr3932202a91.19.1782980667527;
        Thu, 02 Jul 2026 01:24:27 -0700 (PDT)
X-Received: by 2002:a17:90a:e7c1:b0:37f:df85:272f with SMTP id 98e67ed59e1d1-380baa6b3d2mr3932175a91.19.1782980666951;
        Thu, 02 Jul 2026 01:24:26 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0bc38e5fsm6372442eec.29.2026.07.02.01.24.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 01:24:25 -0700 (PDT)
Date: Thu, 2 Jul 2026 13:54:19 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] firmware: qcom: scm: use __free(qcom_tzmem) to
 simplify cleanup
Message-ID: <20260702082419.7fonnhhjnajw5mgp@hu-mojha-hyd.qualcomm.com>
References: <20260701-qcom-scm-code-shrink-v1-0-02f5ce02c95a@oss.qualcomm.com>
 <20260701-qcom-scm-code-shrink-v1-2-02f5ce02c95a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701-qcom-scm-code-shrink-v1-2-02f5ce02c95a@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=JdiMa0KV c=1 sm=1 tr=0 ts=6a46203c cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=99dtVS8xjqmWsoOSzEwA:9 a=CjuIK1q_8ugA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDA4NiBTYWx0ZWRfX0XHDg8+s2UCT
 ulsjn5pGlckT7bYvYFV3IY5Xw/n0ogXqhO5mrApR2TDWzMGyK39WQ5v8hBUqDk0yhKAG5AzXdkC
 /rtCv2bAk6tIdLTn8ncZIxGzBvCmiaY=
X-Proofpoint-ORIG-GUID: 6dhdPLecZ9QQ4ukyXzyiZZFhG7wQiP-V
X-Proofpoint-GUID: 6dhdPLecZ9QQ4ukyXzyiZZFhG7wQiP-V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDA4NiBTYWx0ZWRfX1c9x1mjW2qL2
 KmizF8dzrxX1WlGzDJV7FOHU2UuPceAo5R3yV/L0KYvgSoiRB9KemgP5xs+WcWdXcnltfwabOCn
 xlSykiqxYCvx2qgMbt6jO/fAiwYBMvEP5Est8KoDRaYvgJHRS8F45+bGPPCZL7P+feAZ8Oub7ID
 yDu0CCUPnzV5jILB4AWd6Zh/EsfAWu/x4GGTsEwH/+6Erlw4wz5WVZIQhL2K2Y7fzBYVzOfrH52
 X0wda6+yNLIC7v72sg51LcbnCfNRdKvq/dXHjfaLCilN2m45fVtfI+N+3WN27B74ySMt8ffaKZ1
 n8JO4B/NDgQSOygz/rZJO2uiy9CMQwdXMFQsxuiVNmEfoIRLV25m4F+AycebcEX0v2+0EVfHGOE
 vKomo7x+S51W6ds/G8KDvnF0c/m8+kPChr+X0ZUcgpFn/PE7KKkbHaAsjSxifS4iarz3GkRriEI
 lwBKAPn04U6UlrNz3Gg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020086
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115862-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bartosz.golaszewski@oss.qualcomm.com,m:brgl@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[hu-mojha-hyd.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AE3806F4E9D

On Wed, Jul 01, 2026 at 03:38:56PM +0200, Bartosz Golaszewski wrote:
> Use the __free(qcom_tzmem) cleanup attribute (together with no_free_ptr()
> whenever ownership is transferred) to replace open-coded
> qcom_tzmem_free() calls and their associated goto labels.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  drivers/firmware/qcom/qcom_scm.c | 48 +++++++++++++++++-----------------------
>  1 file changed, 20 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index 6b601a4b89dbf04322730aa22fc9590d180a383c..1684220617748e4890ecb45a1787a6798dafd5cc 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -640,10 +640,9 @@ static int qcom_scm_pas_prep_and_init_image(struct qcom_scm_pas_context *ctx,
>  {
>  	struct qcom_scm_res res;
>  	phys_addr_t mdata_phys;
> -	void *mdata_buf;
>  	int ret;
>  
> -	mdata_buf = qcom_tzmem_alloc(__scm->mempool, size, GFP_KERNEL);
> +	void *mdata_buf __free(qcom_tzmem) = qcom_tzmem_alloc(__scm->mempool, size, GFP_KERNEL);
>  	if (!mdata_buf)
>  		return -ENOMEM;
>  
> @@ -652,11 +651,10 @@ static int qcom_scm_pas_prep_and_init_image(struct qcom_scm_pas_context *ctx,
>  
>  	ret = __qcom_scm_pas_init_image(ctx->pas_id, mdata_phys, &res);
>  	if (ret < 0)
> -		qcom_tzmem_free(mdata_buf);
> -	else
> -		ctx->ptr = mdata_buf;
> +		return ret;
>  
> -	return ret ? : res.result[0];
> +	ctx->ptr = no_free_ptr(mdata_buf);
> +	return res.result[0];
>  }
>  
>  /**
> @@ -791,10 +789,11 @@ static void *__qcom_scm_pas_get_rsc_table(u32 pas_id, void *input_rt_tzm,
>  		.owner = ARM_SMCCC_OWNER_SIP,
>  	};
>  	struct qcom_scm_res res;
> -	void *output_rt_tzm;
>  	int ret;
>  
> -	output_rt_tzm = qcom_tzmem_alloc(__scm->mempool, *output_rt_size, GFP_KERNEL);
> +	void *output_rt_tzm __free(qcom_tzmem) = qcom_tzmem_alloc(__scm->mempool,
> +								   *output_rt_size,
> +								   GFP_KERNEL);
>  	if (!output_rt_tzm)
>  		return ERR_PTR(-ENOMEM);
>  
> @@ -814,20 +813,17 @@ static void *__qcom_scm_pas_get_rsc_table(u32 pas_id, void *input_rt_tzm,
>  	 * be of unresonable size.
>  	 */
>  	ret = qcom_scm_call(__scm->dev, &desc, &res);
> -	if (!ret && res.result[2] > SZ_1G) {
> -		ret = -E2BIG;
> -		goto free_output_rt;
> -	}
> +	if (!ret && res.result[2] > SZ_1G)
> +		return ERR_PTR(-E2BIG);
>  
>  	*output_rt_size = res.result[2];
>  	if (ret && res.result[1] == RSCTABLE_BUFFER_NOT_SUFFICIENT)
> -		ret = -EOVERFLOW;
> +		return ERR_PTR(-EOVERFLOW);
>  
> -free_output_rt:
>  	if (ret)
> -		qcom_tzmem_free(output_rt_tzm);
> +		return ERR_PTR(ret);
>  
> -	return ret ? ERR_PTR(ret) : output_rt_tzm;
> +	return no_free_ptr(output_rt_tzm);
>  }
>  
>  /**
> @@ -878,8 +874,6 @@ struct resource_table *qcom_scm_pas_get_rsc_table(struct qcom_scm_pas_context *c
>  {
>  	struct resource_table empty_rsc = {};
>  	size_t size = SZ_16K;
> -	void *output_rt_tzm;
> -	void *input_rt_tzm;
>  	void *tbl_ptr;
>  	int ret;
>  
> @@ -901,7 +895,9 @@ struct resource_table *qcom_scm_pas_get_rsc_table(struct qcom_scm_pas_context *c
>  		input_rt_size = sizeof(empty_rsc);
>  	}
>  
> -	input_rt_tzm = qcom_tzmem_alloc(__scm->mempool, input_rt_size, GFP_KERNEL);
> +	void *input_rt_tzm __free(qcom_tzmem) = qcom_tzmem_alloc(__scm->mempool,
> +								  input_rt_size,
> +								  GFP_KERNEL);
>  	if (!input_rt_tzm) {
>  		ret = -ENOMEM;
>  		goto disable_scm_bw;
> @@ -909,8 +905,9 @@ struct resource_table *qcom_scm_pas_get_rsc_table(struct qcom_scm_pas_context *c
>  
>  	memcpy(input_rt_tzm, input_rt, input_rt_size);
>  
> -	output_rt_tzm = __qcom_scm_pas_get_rsc_table(ctx->pas_id, input_rt_tzm,
> -						     input_rt_size, &size);
> +	void *output_rt_tzm __free(qcom_tzmem) =
> +		__qcom_scm_pas_get_rsc_table(ctx->pas_id, input_rt_tzm,
> +					     input_rt_size, &size);
>  	if (PTR_ERR(output_rt_tzm) == -EOVERFLOW)
>  		/* Try again with the size requested by the TZ */
>  		output_rt_tzm = __qcom_scm_pas_get_rsc_table(ctx->pas_id,
> @@ -919,21 +916,16 @@ struct resource_table *qcom_scm_pas_get_rsc_table(struct qcom_scm_pas_context *c
>  							     &size);
>  	if (IS_ERR(output_rt_tzm)) {
>  		ret = PTR_ERR(output_rt_tzm);
> -		goto free_input_rt;
> +		goto disable_scm_bw;
>  	}
>  
>  	tbl_ptr = kmemdup(output_rt_tzm, size, GFP_KERNEL);
>  	if (!tbl_ptr) {
> -		qcom_tzmem_free(output_rt_tzm);
>  		ret = -ENOMEM;
> -		goto free_input_rt;
> +		goto disable_scm_bw;
>  	}
>  
>  	*output_rt_size = size;
> -	qcom_tzmem_free(output_rt_tzm);
> -
> -free_input_rt:
> -	qcom_tzmem_free(input_rt_tzm);
>  
>  disable_scm_bw:
>  	qcom_scm_bw_disable();
> 
> -- 
> 2.47.3
> 

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

-- 
-Mukesh Ojha

