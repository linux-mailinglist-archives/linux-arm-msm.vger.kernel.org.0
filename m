Return-Path: <linux-arm-msm+bounces-115865-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 72biNWQqRmquKwsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115865-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 11:07:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A006A6F5116
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 11:07:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=LDxysJfE;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=jJpbWx50;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115865-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115865-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8FF863002F6D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 08:42:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB0CD42B31F;
	Thu,  2 Jul 2026 08:41:59 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F447356761
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 08:41:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782981719; cv=none; b=i/tCMHBAHlsm1nwSvHHKl1GirjWk4ZLb5+vX3/2QSs+FrWpBiSlcr8GJdyqqDSrldofZRxkfVqs6d0DJaQ1yBnoO1uf+Y09i/sLouGS/S41MQWlqFH85EaPoVsNxOCSbo3yuIvKDwXnl9Y/Xg9p32Tmte+CAkmM7G8ME52uIYeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782981719; c=relaxed/simple;
	bh=U+pvI5T/D6rmus0NkZapMgpy4i7wLIBEvytP8QkySnk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GDuzddbzqpusG4Rngxqqry2SYqwouECd8ynlqL6IrO7dv2xH9Y5g2/XXOR1MtLTsMgEPMvGDyjIhIjgzeVn2thX4NWjGvZY1nxxTtAtl8stP6XgVXbn8tzBv3gGrldKvn2mPLe1I4/6+fdsL0X7pk5VGwoUWt9oBGmTGlm72p9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LDxysJfE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jJpbWx50; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6628QZrH3053022
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 08:41:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6cJiFOV1InyHOaPRhhwPFnx4
	lvPPSPFI7tOyR2N44eo=; b=LDxysJfE3/0oEpWELkIDxQtIPO7UJHBktmjMsURk
	rdAeILs3bf1YvsOJVZm+E4iIFmdNpPvWtjs4EIDTAf5lX9vKKAjr5zD0UUC7HTN1
	yCcjs8CkXDMarBcnbtTOzvo+U/VmckiTNlknkKr0auiY6sE/sH5OKOka1Eq5ylhy
	8oUHS/Vyzf1OO2Pc4AuDXyGXKvrQgDPPb+RaoCLpRRJ91vZ5JKuiWobY1P1lzKoo
	6jgcourY5s6rAfn9ywzVsLMdIg4OFGG1H0t6gsL5IG0vzQGY6nb4o47vypzpAkPw
	38/gKFJaJhUyg59byYRHvspPP+oP730kYcoam7jd90X3eg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f56gpu5bs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 08:41:52 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c8894570b58so1224352a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 01:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782981712; x=1783586512; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6cJiFOV1InyHOaPRhhwPFnx4lvPPSPFI7tOyR2N44eo=;
        b=jJpbWx50gMQ9It5QT9IMDzmrStcsw3b04pNK70uaLAu6O/ltZjQQcv5hhbBHiHUCvW
         fqXU9DowAExoJj/t6/7BgZe+smHR8c2fvCrUdj7q0e4lQzo4BRjcYCcL46CMEFJdOSkp
         /7/JWE2REn5VTvAtcGlNH7ajBdGzk8qlxBQ26IpOE0DWdnms/IXqC9f/o5/1MdvJxWHR
         YJke/vuddHwpSTu4zhJWhA2secrtQsUbAOlAZc7ZsRk+fdsFSpey/6q4zZgKLR1ijJtm
         riz7LZl2ADZdOG2462o7nf/5oMHiPEn/SbpPpIbeUOJQp+UL9eQyYwsweP4ChDQUWZKp
         OJpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782981712; x=1783586512;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6cJiFOV1InyHOaPRhhwPFnx4lvPPSPFI7tOyR2N44eo=;
        b=oygmOx6Ak5HJihoI/Ugckux6qmLDukYUvTKFOppKkDUBzh2/5h8wZ4+TrG4J954G/h
         jBSNVvg+5UJMwIS5RXA/iI1Ajk1p3BpcVRYPhID4qR8N8vPTA4np9go9b63N865JFZo0
         O7PUoPKkkuevwHHpPisblUK/psVCvMblLNm1jzutkCXXZ8ZbJXCgere6LIRhL/7bVENq
         VaE+UEFDqLWulAhbf046LQ5Etns1ldGF7Nv7zI7INWfxdSDQSvMS8+B6GueKoZuJ3v/c
         HqOVKv9d30yibvIPYFhlmCshRQmc4F3c27sf/hoQB9H/1UHx6TuYk3xf04Ff3JA2dTgr
         PSyg==
X-Forwarded-Encrypted: i=1; AFNElJ+CKGl/GKPKX+DY1epXoKBwrI1D7zkn1jAl77rHN6XBjvoptKqmhUc16UELeN1ErqMHt4oCayTUpa76OGCQ@vger.kernel.org
X-Gm-Message-State: AOJu0YyvO4QpnQnFRNgqliDJ3wAbaZ9UykoeDIQqbB2nlNkeeWJSM8Tw
	Byz+ZCjHLEkDPt1babQ6aLVMTr1DsnnEfGyghq16y50Ne/9JDv0zunP7zA7OVZl6VdnO84PAyui
	/c/0uYUE55SQSl7EGEkNCTAtj15tl1BwD8zfYpIfTrhjRpvSDbts5EC0TSKo4mB9KYjd9
X-Gm-Gg: AfdE7ckO8SnXMvLuUNNBXVgg2+Xln/1YQx8U18V9n4jWYJvyAVeNxTQkRI6YDmbgirI
	9cLz0rXLdgEHESDcv84NuHBa5aVBSmb5dImkDPo3pdQTjFLs6f4wG87DdAHJsgdsc/AV070zNP4
	56gQpTAW8UVCUxi+DB1rheG/2gbHdyWyLCn6la1mYqkaTAnzjn2AmF/KQXOymTGzy1x1DRHA+/c
	/rzf1fkJWVnhWBWcyka7CZ9xYc7NMazXxKOXr9ekpcQ+qdaC2SLM5NXw7ry2fXmFlE5CxsZnBFi
	S0GMXDV5/qHYFHO8d46Axi0QS8bDYkMHmpY+LhY2bdoKyhs3r5yjisa9V41x9f4ROZZ6WOISchE
	NIAfffuwxGlvWV3uCG3sYwkteup5qA3nRma7Apg==
X-Received: by 2002:a05:6a20:be8f:b0:3bf:b885:2fae with SMTP id adf61e73a8af0-3bff430faf4mr5622449637.56.1782981712172;
        Thu, 02 Jul 2026 01:41:52 -0700 (PDT)
X-Received: by 2002:a05:6a20:be8f:b0:3bf:b885:2fae with SMTP id adf61e73a8af0-3bff430faf4mr5622403637.56.1782981711554;
        Thu, 02 Jul 2026 01:41:51 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b813cd9sm6549321eec.8.2026.07.02.01.41.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 01:41:51 -0700 (PDT)
Date: Thu, 2 Jul 2026 14:11:45 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] firmware: qcom: scm: introduce qcom_scm_clk class
 for clock management
Message-ID: <20260702084145.qpd5mtov4lvb3qeh@hu-mojha-hyd.qualcomm.com>
References: <20260701-qcom-scm-code-shrink-v1-0-02f5ce02c95a@oss.qualcomm.com>
 <20260701-qcom-scm-code-shrink-v1-3-02f5ce02c95a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701-qcom-scm-code-shrink-v1-3-02f5ce02c95a@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDA4OCBTYWx0ZWRfX59ANI/fJ+pRN
 ZpqP2oqlXZOwS/pqhBOJA6JpNaFdKLEaKvBr4LtU+XtY2x4QYFgnQRg/0s1rUAUf0T/bZ5kxz0+
 28jHO2nSquPut8yRb5vmj//BM14LnyE=
X-Proofpoint-GUID: elfsyzlQaQgNmxKt4z6Vvya6nrTJM9IQ
X-Proofpoint-ORIG-GUID: elfsyzlQaQgNmxKt4z6Vvya6nrTJM9IQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDA4OCBTYWx0ZWRfX6BWouwZQq4Sk
 RLCGtDuE4AqLp2+h+sI2JEKkuJzNF3Fj0soOt5VVooTygct7UCzNZC0oQygCLrq70m5Iq09fWNH
 TxrDY91Zh8q5yf00LfWoPo0Xn/0fm0Qnhx6knbUWIvhmv3nyHc6r3XiFH5cqiVfUWBRzyTsY0+X
 lQraPHpyRiQzX0+I7JsgtSqTMmdn7u4eVbFbsivTg7EypIL5pywnklAKCQJgnuvXdvWGu3kJHRg
 6A77OYRS1bQclbWaa5WYLIVwwp4cUr/nY38QwMTPljK5lycLBD2D8F+R4ME4Dpd5bjw8NVN/Hj8
 kxj6cAuDGKGNS2RwW/SLDoemwSkfQNMmjKdv7IfyoSI+m0OCmxiDDx8EZ22TBUtwEpySU9BQ5mb
 nXvB+LtvblQM+ZfVJc1TkZ4t3hiR8jLn1KJX1xSQ2adtJwbzp5McRuuVbqXQk07JCr7B+40WfeP
 xo+W3F9oaRjQSsLi7Yw==
X-Authority-Analysis: v=2.4 cv=K9oS2SWI c=1 sm=1 tr=0 ts=6a462450 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=mEDfBHwhFytbHMqOLsQA:9 a=CjuIK1q_8ugA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020088
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115865-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bartosz.golaszewski@oss.qualcomm.com,m:brgl@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,hu-mojha-hyd.qualcomm.com:mid];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A006A6F5116

On Wed, Jul 01, 2026 at 03:38:57PM +0200, Bartosz Golaszewski wrote:
> Define DEFINE_CLASS(qcom_scm_clk) that calls qcom_scm_clk_enable() on
> construction and automatically calls qcom_scm_clk_disable() at scope exit
> *if* the enable succeeded.
> 
> This allows us to convert all call sites to using
> CLASS(qcom_scm_clk, clk)() instead of the manual enable/check/disable
> pattern and to remove the associated goto labels.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  drivers/firmware/qcom/qcom_scm.c | 89 +++++++++++++++-------------------------
>  1 file changed, 34 insertions(+), 55 deletions(-)
> 
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index 1684220617748e4890ecb45a1787a6798dafd5cc..35aa9e8886b6ce8ab8eaf16c83fef7aafaef2822 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -192,6 +192,9 @@ static void qcom_scm_clk_disable(void)
>  	clk_disable_unprepare(__scm->bus_clk);
>  }
>  
> +DEFINE_CLASS(qcom_scm_clk, int, if (!_T) qcom_scm_clk_disable(),
> +	     qcom_scm_clk_enable(), void)
> +
>  static int qcom_scm_bw_enable(void)
>  {
>  	int ret = 0;
> @@ -511,13 +514,11 @@ static int qcom_scm_disable_sdi(void)
>  	};
>  	struct qcom_scm_res res;
>  
> -	ret = qcom_scm_clk_enable();
> -	if (ret)
> -		return ret;
> +	CLASS(qcom_scm_clk, clk)();
> +	if (clk)
> +		return clk;
>  	ret = qcom_scm_call(__scm->dev, &desc, &res);
>  
> -	qcom_scm_clk_disable();
> -
>  	return ret ? : res.result[0];
>  }
>  
> @@ -616,22 +617,19 @@ static int __qcom_scm_pas_init_image(u32 pas_id, dma_addr_t mdata_phys,
>  	};
>  	int ret;
>  
> -	ret = qcom_scm_clk_enable();
> -	if (ret)
> -		return ret;
> +	CLASS(qcom_scm_clk, clk)();
> +	if (clk)
> +		return clk;
>  
>  	ret = qcom_scm_bw_enable();
>  	if (ret)
> -		goto disable_clk;
> +		return ret;
>  
>  	desc.args[1] = mdata_phys;
>  
>  	ret = qcom_scm_call(__scm->dev, &desc, res);
>  	qcom_scm_bw_disable();
>  
> -disable_clk:
> -	qcom_scm_clk_disable();
> -
>  	return ret;
>  }
>  
> @@ -758,20 +756,17 @@ int qcom_scm_pas_mem_setup(u32 pas_id, phys_addr_t addr, phys_addr_t size)
>  	};
>  	struct qcom_scm_res res;
>  
> -	ret = qcom_scm_clk_enable();
> -	if (ret)
> -		return ret;
> +	CLASS(qcom_scm_clk, clk)();
> +	if (clk)
> +		return clk;
>  
>  	ret = qcom_scm_bw_enable();
>  	if (ret)
> -		goto disable_clk;
> +		return ret;
>  
>  	ret = qcom_scm_call(__scm->dev, &desc, &res);
>  	qcom_scm_bw_disable();
>  
> -disable_clk:
> -	qcom_scm_clk_disable();
> -
>  	return ret ? : res.result[0];
>  }
>  EXPORT_SYMBOL_GPL(qcom_scm_pas_mem_setup);
> @@ -877,13 +872,13 @@ struct resource_table *qcom_scm_pas_get_rsc_table(struct qcom_scm_pas_context *c
>  	void *tbl_ptr;
>  	int ret;
>  
> -	ret = qcom_scm_clk_enable();
> -	if (ret)
> -		return ERR_PTR(ret);
> +	CLASS(qcom_scm_clk, clk)();
> +	if (clk)
> +		return ERR_PTR(clk);
>  
>  	ret = qcom_scm_bw_enable();
>  	if (ret)
> -		goto disable_clk;
> +		return ERR_PTR(ret);
>  
>  	/*
>  	 * TrustZone can not accept buffer as NULL value as argument hence,
> @@ -930,9 +925,6 @@ struct resource_table *qcom_scm_pas_get_rsc_table(struct qcom_scm_pas_context *c
>  disable_scm_bw:
>  	qcom_scm_bw_disable();
>  
> -disable_clk:
> -	qcom_scm_clk_disable();
> -
>  	return ret ? ERR_PTR(ret) : tbl_ptr;
>  }
>  EXPORT_SYMBOL_GPL(qcom_scm_pas_get_rsc_table);
> @@ -956,20 +948,17 @@ int qcom_scm_pas_auth_and_reset(u32 pas_id)
>  	};
>  	struct qcom_scm_res res;
>  
> -	ret = qcom_scm_clk_enable();
> -	if (ret)
> -		return ret;
> +	CLASS(qcom_scm_clk, clk)();
> +	if (clk)
> +		return clk;
>  
>  	ret = qcom_scm_bw_enable();
>  	if (ret)
> -		goto disable_clk;
> +		return ret;
>  
>  	ret = qcom_scm_call(__scm->dev, &desc, &res);
>  	qcom_scm_bw_disable();
>  
> -disable_clk:
> -	qcom_scm_clk_disable();
> -
>  	return ret ? : res.result[0];
>  }
>  EXPORT_SYMBOL_GPL(qcom_scm_pas_auth_and_reset);
> @@ -1039,20 +1028,17 @@ int qcom_scm_pas_shutdown(u32 pas_id)
>  	};
>  	struct qcom_scm_res res;
>  
> -	ret = qcom_scm_clk_enable();
> -	if (ret)
> -		return ret;
> +	CLASS(qcom_scm_clk, clk)();
> +	if (clk)
> +		return clk;
>  
>  	ret = qcom_scm_bw_enable();
>  	if (ret)
> -		goto disable_clk;
> +		return ret;
>  
>  	ret = qcom_scm_call(__scm->dev, &desc, &res);
>  	qcom_scm_bw_disable();
>  
> -disable_clk:
> -	qcom_scm_clk_disable();
> -
>  	return ret ? : res.result[0];
>  }
>  EXPORT_SYMBOL_GPL(qcom_scm_pas_shutdown);
> @@ -1791,18 +1777,13 @@ EXPORT_SYMBOL_GPL(qcom_scm_import_ice_key);
>   */
>  bool qcom_scm_hdcp_available(void)
>  {
> -	bool avail;
> -	int ret = qcom_scm_clk_enable();
> +	CLASS(qcom_scm_clk, clk)();
>  
> -	if (ret)
> -		return ret;
> -
> -	avail = __qcom_scm_is_call_available(__scm->dev, QCOM_SCM_SVC_HDCP,
> -						QCOM_SCM_HDCP_INVOKE);
> -
> -	qcom_scm_clk_disable();
> +	if (clk)
> +		return false;
>  
> -	return avail;
> +	return __qcom_scm_is_call_available(__scm->dev, QCOM_SCM_SVC_HDCP,
> +					    QCOM_SCM_HDCP_INVOKE);
>  }
>  EXPORT_SYMBOL_GPL(qcom_scm_hdcp_available);
>  
> @@ -1840,15 +1821,13 @@ int qcom_scm_hdcp_req(struct qcom_scm_hdcp_req *req, u32 req_cnt, u32 *resp)
>  	if (req_cnt > QCOM_SCM_HDCP_MAX_REQ_CNT)
>  		return -ERANGE;
>  
> -	ret = qcom_scm_clk_enable();
> -	if (ret)
> -		return ret;
> +	CLASS(qcom_scm_clk, clk)();
> +	if (clk)
> +		return clk;
>  
>  	ret = qcom_scm_call(__scm->dev, &desc, &res);
>  	*resp = res.result[0];
>  
> -	qcom_scm_clk_disable();
> -
>  	return ret;
>  }
>  EXPORT_SYMBOL_GPL(qcom_scm_hdcp_req);
>

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

-- 
-Mukesh Ojha

