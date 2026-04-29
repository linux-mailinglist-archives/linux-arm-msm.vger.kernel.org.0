Return-Path: <linux-arm-msm+bounces-105215-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gAfuBzwK8mlXnAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105215-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 15:40:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AE56A494FC4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 15:40:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 189E1302DE12
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 13:38:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AAC53B0AD1;
	Wed, 29 Apr 2026 13:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S/3FWZpf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZpeJ0UGl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 081843FD14F
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 13:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777469915; cv=none; b=dPUXnoXcXn9ytz8KDjgQinHsoTfd9i1Y5Ag4+sTiaIhAk7c8+HSUpCJAbEtF0B/CHviOjarpdiR6jJEPsCsnRAFm6pIMUPbpVxBk5ToR1mWUsoQ080TMoXgLiofhmz8d93fpoqADGCXKvetUDC8RtDKi5AtnJRDM1SNQ09EHWgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777469915; c=relaxed/simple;
	bh=MRDsFSfuBFabAIIIagqsgS+mCDpLVwpoDeKjPiaxopE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o8prLmATh18FbENMrEYoICKvqgPl7BUrdAr+jd6FC7KUOP/jf2touKUoJ0AMv5Awplj0wRHAoY9doSs1H79LnsyA630k4GeKyLRzNN2Ji6vmKwPYvaQ0JbYLrWOEifuoj+z/FVFrPjYOIoIJYyGwVXLCJtg2vmky5IaMMRFFluw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S/3FWZpf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZpeJ0UGl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8qWV62889857
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 13:38:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZMKkdJHg23uv+SVdhSyOX9By
	EcKHgGmfNLP+pkpZBiM=; b=S/3FWZpfZK1ZTZ2YA/Nz8Wr3u4bKqcb692Q0vd8w
	756ZB/IdNhKQtUXVSj+ezKnZjJ2K2AVxRUle07ONUFcbv+DodYFhXx7V3IHutxTq
	nYtIBljf1kxC718V6C4RDMSZlpjaQnG6m1kCNl5kw8uzS7yp3ugLoSweAdMTbiwc
	oljSlffD9KNNkRvQmntfEURiYvkMlDmtg5K4ozuSdyFR+HUbnr41OoAC+PQt2i5F
	iPM8MvJ/PvOjZ8QAwE2YL8NzvxBxnskTwgsKnnWcJ8Aw8mwVLL8ck6VaTr8NvdxS
	8faPJy4WQ6OThCLySuOhD6wzsIMFu808rrfRbA/0saOCDA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du0wqc41t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 13:38:31 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35da1c703d1so14886210a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 06:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777469911; x=1778074711; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZMKkdJHg23uv+SVdhSyOX9ByEcKHgGmfNLP+pkpZBiM=;
        b=ZpeJ0UGlBaVFoq62Iq33v/93Dk8cSwZ/g0BBAqu7rohOYqtdl7RuUi5biCGUIp0UJ9
         w0fa2QyQ/M277CJNy+zTwDEdCRWomn8WZuRQEC8C8mgi1KRRdzObt0Ygm0NEdEifg+8X
         wARfwPbdrPt0uRcdzY0I6bjlrgUOFJnq2CxK82zdDIuxxsSt2s5kLOR4WxI7IKwPazOV
         CZvjDRE3vtQid0XS0nEGSFWc53cVvrTFvegjfv9zwF+stbV/2Ur9mfwgMdVf2YAiIY1R
         phvlBQR7v5erRC60/TeZ41EcPsERZpArJFN7yG/CSWlOBzcrusm4CKatNZ2pZKiNbl63
         PTLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777469911; x=1778074711;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZMKkdJHg23uv+SVdhSyOX9ByEcKHgGmfNLP+pkpZBiM=;
        b=f63mxxCrrddMM3Y6GqNRmZ6p6IkAqpoHV4NWLTQk1jiDZ40MoXQ63MErFLbtMldiSL
         4Ftlxq3zoJLyU1uwQEs228dn73BXh5YHMM6dB+vn3FxvUxMiRuJrGcsIYurB3RLF5+iU
         YuTtWDuSjNgo0c2lO90D+BG7i81Wn1Tw1OmzVS+Hbk5w0I2WstPPThXaMv+4lgkUKduq
         uONiLFjay77L57HmcmmZWj153ily1XGmhEtAXgOGRj8hftHJCqX7/CKPoi6n83758JuT
         etUWkxqYfEjeUXSDGS16W9HIeNsrAV1fR/YlH2gYesgqY+BUGPEa/7jowAJdNu6mRdZ9
         oy2A==
X-Forwarded-Encrypted: i=1; AFNElJ9xq2f9oL2NrR2zyZ7ZZbWmx4WaYPannvF92CSp9WKBZOqV4Vtw0/vhmMGxKWHNFtH5F8tNAKHd2vCUi9qd@vger.kernel.org
X-Gm-Message-State: AOJu0YyOyBcwnMkkJfkFBlQC1RN4aTCkRyqMWeOHbGn6XlgUABDGZaLG
	/Au1GHEphXBbFsc7wiKCAU77KsvUB+09v4ljJt15qe4FqoF14Nd+66upplg1TPb1++614+4u2Xh
	BOQ0L1ZB+FdPF/tH4zQxCgHvK3LbEFTMV+Jt8Jpl9hc7eIni+Bjojyytn7zj+BSWQbYSb
X-Gm-Gg: AeBDieuVDWKNEEfswYCTBnoHYg8L2MijWsKqQCQHT1W0IYfhGWlct4o3Qol1qCx+QLX
	6CCWFB05ZVSp3UIbF5rfpNIXIetT2kE5xt5nzbk66n+4DbhU0HkmXdPay0LvyhBSajGJKNVM0fc
	1IYAY4LWMNgH1yoSqPTDQ6oB+SULaLdFQUEhThKE0oQN04VEsTqrO2UCXPLwrJBPbNNjqnl9Zhp
	RaGgEoL+nip049Xdw67s6hLI/SNbL+Bku8LFuk1WwK2a8dFLRJuPoF0NnDLfJzpIxGNkwbB4XnM
	0pKbDJVtYJNL4zF3bS01/g4kME1iwIVWrkQHFx/tDlQLpmmKNrYlod8I2JbigQvm6BKKOYjweh6
	ClA1dpZMyM5e/NFnEp7D5hwHlCQbfTXB0FDXb9XoHTJEoFRudwud/5AZaD5o=
X-Received: by 2002:a17:90b:554d:b0:35d:a380:6d1a with SMTP id 98e67ed59e1d1-36491f89850mr7950671a91.2.1777469911012;
        Wed, 29 Apr 2026 06:38:31 -0700 (PDT)
X-Received: by 2002:a17:90b:554d:b0:35d:a380:6d1a with SMTP id 98e67ed59e1d1-36491f89850mr7950636a91.2.1777469910398;
        Wed, 29 Apr 2026 06:38:30 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364a4152b85sm3754659a91.4.2026.04.29.06.38.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 06:38:30 -0700 (PDT)
Date: Wed, 29 Apr 2026 19:08:25 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] soc: qcom: mdt_loader: Fix qcom_mdt_pas_load()
 kerneldoc
Message-ID: <20260429133825.nxo4djgsq7odo4rm@hu-mojha-hyd.qualcomm.com>
References: <20260429115209.283331-1-shengchao.guo@oss.qualcomm.com>
 <20260429115209.283331-3-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260429115209.283331-3-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-GUID: Nf2XgWrb03W-gKvujtzj0O7VJtKFtHZH
X-Proofpoint-ORIG-GUID: Nf2XgWrb03W-gKvujtzj0O7VJtKFtHZH
X-Authority-Analysis: v=2.4 cv=BfDoFLt2 c=1 sm=1 tr=0 ts=69f209d7 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KyQoKVKRHxE9qbi3G2MA:9 a=CjuIK1q_8ugA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDEzNyBTYWx0ZWRfX2O+v9mpq5qDs
 yGuBLaZRUWKMQU+mqSU2Cy6Wnz/RTdTVtOsLAFId1rG8Kjjyuqg8U5ieV0AXLt2NxC4pmt/XMkv
 ojSEclYaz1r/wl9pZxLf3RdUnalCMphmbMgPVM5pvvoINmcDxE9OmAnc1UtUQGcDVfKjtbSgrVH
 +K8x21antG0J95HQpaIAFMcU/k4E44jC/rMKpc14pA09WfeDmoRj5yds3joyISr9I6w41r8Gr/q
 bSgl9I8By7babkA7wIGY4ZeSbTW2tLCs5LutprV8B3o2zEODJ2P/PjApRhuU9ZdIBBmAV0/ovTo
 oVrx6YxRKZ89ycsmFKxXopBj3nEBPM6nEmyS6wDaiqCpTPeDaPYWkOqL0HuB2yt6Tcd6O2nROg3
 U2D+PeJxXzpOiuJ1apKfC6qSt/s9/XEFxLLi3AcI8aWRSNa7FLSyLTWLmGM24K0cBwUDwp61vw3
 gnNUBCWfpe+06l4eKgg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290137
X-Rspamd-Queue-Id: AE56A494FC4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105215-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On Wed, Apr 29, 2026 at 07:52:08PM +0800, Shawn Guo wrote:
> The PAS context helper function added by commit ccb7bde5f7cc ("firmware:
> qcom_scm: Introduce PAS context allocator helper function") is
> devm_qcom_scm_pas_context_alloc() rather than qcom_scm_pas_context_init().
> 
> Fixes: 8a4fcffde6c8 ("soc: qcom: mdtloader: Add PAS context aware qcom_mdt_pas_load() function")
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/mdt_loader.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
> index c004d444d698..75c1d472d930 100644
> --- a/drivers/soc/qcom/mdt_loader.c
> +++ b/drivers/soc/qcom/mdt_loader.c
> @@ -472,7 +472,7 @@ EXPORT_SYMBOL_GPL(qcom_mdt_load);
>   * firmware segments (e.g., .bXX files). Authentication of the segments done
>   * by a separate call.
>   *
> - * The PAS context must be initialized using qcom_scm_pas_context_init()
> + * The PAS context must be initialized using devm_qcom_scm_pas_context_alloc()

FYI, it should be again rename to devm_qcom_pas_context_alloc()
https://lore.kernel.org/lkml/20260427095603.1157963-3-sumit.garg@kernel.org/

In case this lands earlier..


Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

>   * prior to invoking this function.
>   *
>   * @ctx:        Pointer to the PAS (Peripheral Authentication Service) context
> -- 
> 2.43.0
> 

-- 
-Mukesh Ojha

