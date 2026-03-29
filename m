Return-Path: <linux-arm-msm+bounces-100605-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sCWHJWEEyWmitQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100605-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 12:52:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 15307351A65
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 12:52:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 589D33008225
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 10:51:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8ADD31326B;
	Sun, 29 Mar 2026 10:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IGU8gKEI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d1ikQhrJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E85C3101A9
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 10:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774781483; cv=none; b=kSitgTRZ3PTYsraiIpJJ44Sp5IDZc13Jczqdn63RGEoUtTexaSgypl2j7dkO1c7qqOx4XSVDITNysXMeoZEEAl6MQCL0puUVaK71GMHgYeAtuem1TsWUi7OoYeZuwNwQEs9bcoy33ZUeJD+GShosk0LuHBptzWYIRazV/J86WYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774781483; c=relaxed/simple;
	bh=5Q9TIYcr463J2je76gtxrnL7bTgbqCXFXmVai7GJAeM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R8wNrNpeZvH4mNfcaodnl+l2Kwbrhm937X6KWgKQLLUAyAEVL8jcNFp85P1f9bpWqzC1uTuykfPQHn59MoH8RaGo0f2gNoIDbN/JZU/yN4bLLsTY/9tVD9kbyHPzKRYq7kXTjvN5imkSN0BUQNrxovFnBMb+r4WsOPmkmlVJzP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IGU8gKEI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d1ikQhrJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62TAia4x813978
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 10:51:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lD6v/4S6rAhCUZ6xQaXFYuxC
	Dmg9dn9zKc92hDRlYMk=; b=IGU8gKEIhN279cXgg5uW8bgyHcOYRxtPFuYC4OvG
	8GNryJrIpWrc6R7tOtbvFI9mSDBycg3WNKKeSovmT/I6j7VCxAqinxvgaNY/VzzK
	hT5l4bsV+t9TvvQh0cTN+lNj45m/Lb/aDpoDiioMJuCy8ZEqmcUqhOvdYfBUJ4VL
	NVXD6nslB4AU317cg2S8fJM3DrfJWY4q4pSct6SU+6JCYYcm8SH+RPeZb8AVOGR5
	AngKAH26dY5mS3sBi+Gyh7FogVeRR8VoOkjULZr77kJLCnoIQ4y1l29cM+3ykFjG
	dUhpY2Scxre1E51MBV/Yxi/mgQzonRn5mVa5GRlxM+wJvA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d67c7akq9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 10:51:21 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5093b92f327so100561761cf.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 03:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774781481; x=1775386281; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lD6v/4S6rAhCUZ6xQaXFYuxCDmg9dn9zKc92hDRlYMk=;
        b=d1ikQhrJX68ckbke9HVBWSxTdPVKQADxA9Cf4skM1bAEP0pwIQJ7dvBzby4IrR5N8k
         DEyDdBa3hpX2ZhIlCPuqBZsvKYf/YeM6dRNTlbBKnAjN/JKELFib+/sttu69AyqAWjA3
         bqHPRzIYUJZptetwn0VYODFbzJN/PTzFOEC7+s/O4AtZIQVIf2PDi0fWaf0LRPM5+Z34
         YKuC8MZroj4iXk7jw7sK1QTD1PovQ1JLjzFjjRWPrHip09xL1DH9UqVo/GtxhAnMnoDI
         wzoU2Xjp7TuO9ex99VIEQofVTfoNGiY/NnalLZaLu+2qDcV1JBzrK4obQcRsq8CYu7O5
         QWiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774781481; x=1775386281;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lD6v/4S6rAhCUZ6xQaXFYuxCDmg9dn9zKc92hDRlYMk=;
        b=kctAvTvD6nE2+wL5Nqo6pBbR/sNYfoje/C+cCdnCLKPbQT9XBGkBaul02FMf0AskhD
         19VTk7hgaFCJXHw4TCVfYyyNgWZKT9n+q1Hk/vwfK6aabt9rYuwcKpyPH9clo7b30kTg
         8Pngj4Dx5cmhIIfKn7a6X6A70uvPn4wSZPJQql3RMOixmlqDftUeCnhIPehm17iD2T62
         PBmgo3v9+ipfHIfrSS11P5taEubDZ/TbedvsTJBIlddb4wDyZAWwebwq8xkg9sLz7cpX
         H0kis1h7Y05qzTIRm+6+4P0g4eN268Ohta3k9Y47CB+8AGrM4apFK7zRbWua209f/zx8
         14kQ==
X-Forwarded-Encrypted: i=1; AJvYcCWIYK8MU0W1IPl+zhxoIVT3tEyYpdNf0EY4N/NqWbincF+W1tmQfqQtKsQSwxI74oaaeRDWsOyt7AC9mnjT@vger.kernel.org
X-Gm-Message-State: AOJu0YxkpDa3zLds1qESV7MPTVN7SlV1/3x9isiQO3EwTvVLTBMXdLsA
	htDtl+K6cCHKOeMFGjdpxO72SQF06sOGP2Bu1h/TIwviuzgeBe+oFPWMXHE2PdnRU/54szY9kN9
	lYO8o4F5C+HHLSbwsONL9pXDMKaZQy8JeFPKhl/vhN1GXC+z9v3KdbOm6xFqDJYP2lrXT
X-Gm-Gg: ATEYQzyi5FljzSkbVIig5y2ViOwrGwgesQSOWiR+Sco+st2Iid8sWhxXN3zh4h8sb+L
	eWAhaK1O059nES0CquF+fVIan6MXjLmPG8KzaDDCDqwCAD4ytIYF0ZCDvdUMcL6xDiKJhw/66/N
	Gvu1YeSDsp3h05RsKXiWxvbzn0IMm2Tc04ijmBLHlBtlVoE/UC1ClTG7nmJbwNhZaCUve2PzMD4
	aQpLopuzmwKuBvNxoQuKozg9LjHUFJeCU4tuxTOc48x6q5iJJYkz3/nkKmb63x7R6pcSz1E8Uja
	Zj9qwUFHCjmTg7QO2YuGanyjZ5x1ZM9zjYQhYznEMCi/Fx5ZI90cyRR2uKA5f2Pk/KU1tKaxEBa
	WW3saHxwPL6IFvr5x6t+2clCDK4GErh0JrR5eI7dRrPfQR10zslUcS3x6dlDYcq8yWz5n/9cNSl
	BcSE54mRypfEufLKcvlvr3vgIIQWkxXlqc09M=
X-Received: by 2002:a05:622a:295:b0:50b:22c2:d7ec with SMTP id d75a77b69052e-50ba398f23fmr118691701cf.59.1774781480940;
        Sun, 29 Mar 2026 03:51:20 -0700 (PDT)
X-Received: by 2002:a05:622a:295:b0:50b:22c2:d7ec with SMTP id d75a77b69052e-50ba398f23fmr118691501cf.59.1774781480550;
        Sun, 29 Mar 2026 03:51:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c836d463bsm9915851fa.4.2026.03.29.03.51.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 03:51:19 -0700 (PDT)
Date: Sun, 29 Mar 2026 13:51:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] remoteproc: qcom: pas: Fix the dtb PAS context
 creation
Message-ID: <fcgfzcg5upqw5idgb7acayxgtrmyojtmosqbzqok2cl6dhyr36@n5oyb2rbkf3k>
References: <20260325191301.164579-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325191301.164579-1-mukesh.ojha@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=SPdPlevH c=1 sm=1 tr=0 ts=69c90429 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=NHyXfb6j7ZaXbkreoXwA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: -TSFugL61xy-pOumXybmA_jtaczp7sI9
X-Proofpoint-ORIG-GUID: -TSFugL61xy-pOumXybmA_jtaczp7sI9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI5MDA4MiBTYWx0ZWRfX9H85tAhGH/6g
 2obKCSRTua5pGgNnOPlgquFTkUY8pF8slXc3HebVhpmkLIA5RfGeKYIwmkjE6cL9xlaYlxPVEuJ
 APswRDloDaZXwOfaBZUg0GJK1BNKuTdFBN/2Ixh8+GRU3i35cem34v727txuIcQqVejWRpCyWAH
 Na+r8Bbf/xB8/TecENd2i7vj2Vfebjz48uUkkvZJMlrblKWFBtAwgxy+glA6mUJXSHCVAgC6P9s
 hNV9uUtHDqLXNHxMnnBvGaQizBjDzNY9bWwJo88aUvRfGkDKfoU5N2jn7wqHOQqNBrKhHsBZ3JN
 rzfM4aUbngL+d1vWgEQsVasQ/GU2+Gi/E2A/+zX7oxajeiwqOnxT9jbFV9olEnFI3iFOVfoqGPZ
 aFzMm7vH3dgC+GzbvplYLMqgYsELr3LiAJdprAcax50CfcGf4IuYGpnGpRRENGY4GcF4XGlKWqE
 tJJmoW3moZ4QmXavMLw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603290082
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100605-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 15307351A65
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 26, 2026 at 12:42:59AM +0530, Mukesh Ojha wrote:
> DTB PAS context creation should be done only for subsystems that support
> a DTB firmware binary; otherwise, memory is wasted. Move the context
> creation to the appropriate location and, while at it, fix the place
> where the DTB PAS context was being released unconditionally.

Okay, if it wasn't obvious from the previous comment: split into two
patches.

> 
> Fixes: b13d8baf5601 ("remoteproc: pas: Replace metadata context with PAS context structure")

Was the issue not present before this commit? Was the metadata correctly
freed?

> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
> Changes in v2: https://lore.kernel.org/lkml/sxklpgc2rtr75maiu7lg4iukmaetvjyho7ytyyykmtdu2tov3k@gctoozxj7frl/
>  - No change.
> 
>  drivers/remoteproc/qcom_q6v5_pas.c | 36 +++++++++++++++---------------
>  1 file changed, 18 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index 46204da046fa..3bde37ac510c 100644
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

-- 
With best wishes
Dmitry

