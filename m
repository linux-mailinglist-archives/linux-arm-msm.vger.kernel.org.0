Return-Path: <linux-arm-msm+bounces-111465-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id h+/5FNzNI2oJzAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111465-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 09:35:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DAEC464CDBC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 09:35:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=O4edS4FB;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=B1ZKZuNs;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111465-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111465-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A502F302A6F8
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Jun 2026 07:35:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EC6830FF1E;
	Sat,  6 Jun 2026 07:35:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 948E61AF4E9
	for <linux-arm-msm@vger.kernel.org>; Sat,  6 Jun 2026 07:35:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780731323; cv=none; b=GPNb06C/ry9twk0I8RdtXbv+QdYNRtR0wabOLv2tVVLzYJFDP5hjM3PWPEOMLEJAMRon+YZL5B+BXkJd4DBC1oumIHvsvRCgEoZ7MXLnTIN9BESkSmAz5fpjGrNC+Yt+WiZT2r+s5/jM/n28p/CKaYImCVliA41ask9jkpy//8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780731323; c=relaxed/simple;
	bh=/oDCS3eOUgngfS7/IU3V1g33L6zvRMNLrNAeONBh+dY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=re031aryCxhn0EzNuRobU+ayFnZrVLR0LhvEL1aFxabRoaSCIzPQkEVj4e3+k0kAQfPNYzyv51jnhDeFuh8/efHE3zG+ZcOen6M2KEOFMlDqz1r4eqeptv7oQF6h/Gdj2vUAciLtETaXBxY//6VPdbpRjzWV0EP6CDlyP/Zz9ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O4edS4FB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B1ZKZuNs; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 656619pv653176
	for <linux-arm-msm@vger.kernel.org>; Sat, 6 Jun 2026 07:35:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2X4zrvGrRxpvhXWxOp6gjbBk
	hg/3kjiMxAtkmz08Tqc=; b=O4edS4FBoF0pm7jdho1tOlp9XgJ6+pWx8A/Lu+9z
	ZVrr1g0quPggPG7pbNVtzhUMgstl9rAYVJ2QeOqWK7ch9ncui2i1czYxDIAd683+
	sA1IlNEbtavZXWIXhO4j0bGCGN+eUaL3QC4QTvf75h8zD4uuyw7XlLqM02XMdtod
	S7sTU5ehBHYd1eNNqlGb3adjwCNBvUo6fDWl++JEku1mI/k1gs6oKJB+kTGCl1u+
	q9DQ/QWd/macb+LuA8G9nhvzC58rCx4W8W92Yw+9I3zYGjeFvcEC7Daxux7QVK5c
	nX5tZg8/yap61swjz3U1jXa2vVK8XtlZgpJGH5bXf7//7Q==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4em9k3gyrc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 06 Jun 2026 07:35:19 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6798c46f723so1722348137.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 06 Jun 2026 00:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780731319; x=1781336119; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2X4zrvGrRxpvhXWxOp6gjbBkhg/3kjiMxAtkmz08Tqc=;
        b=B1ZKZuNsJ73epr1HEcpk5UGRf2EBGGt+cfm+LUfBB4TgJhHRvkc8hiW59/4etISX/8
         A1MZSegM0Osz45z9NyKzwP0i6V63Ov4O3oQT17aLtZygYe8VdbRhVeLfhCPyaEAea1je
         tS1c/LiwYYahiVACEW2ZFX2cbyC6vMC0Ybl829m7HkG5jsTvb+6J8baE8v6G8EuhqXZg
         yQuwGmBmi7y6H5VqGCth6zYrqSSEg14ibHWq9ReeXXvpZrvdBW2WJxAeYDGRbR3ro3HD
         cxmfLy0n63tU5kCDFIqbaSDhiTL19pSdjSxkeb+EYIQY+tSJ3v6hObGkTlUDSJXJW3m4
         IqGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780731319; x=1781336119;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2X4zrvGrRxpvhXWxOp6gjbBkhg/3kjiMxAtkmz08Tqc=;
        b=Ca9WOXUZ3A84TfZ1oDPOEHCZ/VBdVzSOp3tO9xwLr1nofS9Wa+5OrrnWz1QouMb4PK
         JvO/Vqz8TyoTUkQyWYBhagmDB8hRxRcqxIoJ2X9D1PkMwiJoX+dfDBWhLLsMGjjf6j/0
         vKzo2gFa7SbhrLxp8A1GI2BNk0ZoQKgKGfxd3Nm9DxlF6YaIvQiO2lgyDqdX5Er2eKRC
         m2o0TadFcbK7Y3MnF8QaO18QVRUm81Ott4xGaUkxFLXvTfvRqFM8eLgkHIWR+gw71nsl
         QNPwkCQcZFG4WFZjBOH8buh8mhiJVoLmJoAVOIhtKo9nIKfEF6G/oXW3JOVyiiH5v+Tt
         3eBg==
X-Forwarded-Encrypted: i=1; AFNElJ+utNWbigaomeczAj865nYU6ty12jzgfaKoOzMpuOuJwlY9hNn0nCvEkKeQrIT2k0uz41dRPjDUFpXpIXSP@vger.kernel.org
X-Gm-Message-State: AOJu0YzVOJolCC6kWNFjGCuj7HOsc/jldZLLzuSWyTozYPPnQpW2l/jv
	ZEarMtU+ISKVCmY+/DVXCx0EfqQ4NBmbPOslv8CA9KmqRvmpKYI1Jc6ziw9Bf343vzVhY2B08CT
	dx1ptS8Xl0Tvxp9aEqu1KwcLAyKPwhlsgSRCD8Zp5FwI2xUSup9EzGHI4nDPAhfCPBehf
X-Gm-Gg: Acq92OEcoCLvKHIMO2kbCawO+t5TsuN6VZvMvdTbjnwRjdNCAyAlwYcq2B9kjwSCwOh
	PlhbynANG2nl8B4M2D/YAfkVzuUZ05liPWK+ZKXavAiDn0QAJs4EqQOQ6eoqZetnyTcOFpcCfs4
	ZqvzaNxlKFY7NUolm5vzJcexyvKerhIQaiT+vUlVYJMK8+KL4NzPeeXTh4rZGNy1TaDEPXYSU3n
	PesdlxjnDYOB9UBd/MCc219znWbrHSzYwFa2r6vb7Y0Caoybsz9gOT4maVF39eVEM9JY2M7BfSz
	xOi6b9SmjQadnLf9GyVtY4cYptG4ux7hvkP8agiLn0xsjc747ZRSIBw/fdsyw/EpCnIAp/YB/If
	pTwSj8hT1tCdvz6xN6jN7HyqIUDDkxhYJPA7/ZM33ocE6FmUJePlO/03j9JmpQ+aRhSBXNXkM8W
	nbbZr5TqkY0UdvfsmDccYXdxVDOiZ2BTBIDCjkSmNGa3x4Ww==
X-Received: by 2002:a05:6102:4485:b0:66b:a0d7:abc4 with SMTP id ada2fe7eead31-6fee79766bamr3658493137.0.1780731318851;
        Sat, 06 Jun 2026 00:35:18 -0700 (PDT)
X-Received: by 2002:a05:6102:4485:b0:66b:a0d7:abc4 with SMTP id ada2fe7eead31-6fee79766bamr3658483137.0.1780731318393;
        Sat, 06 Jun 2026 00:35:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b99ca90sm2341905e87.84.2026.06.06.00.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 00:35:17 -0700 (PDT)
Date: Sat, 6 Jun 2026 10:35:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ruoyu Wang <ruoyuw560@gmail.com>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: iris: check decoder format allocations
Message-ID: <6nsm3ijxlxfw5n7cyntfo2hx7zppnttne6xvmnywe7ydfw372l@rmubfdchimj7>
References: <20260606040736.13-1-ruoyuw560@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260606040736.13-1-ruoyuw560@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA2MDA3MyBTYWx0ZWRfX8muWhD8P3JrQ
 eXbpZbHz0UT+EQzSekPDmuPfQVe4hm0FNE7S9gDjmuyGI0KouZm/MOQVSP2Et2F0uAa9c37Qqta
 0KKMl0vhm6zbw01vHHK8PToI7RfBLQTiEdJCVHcsPmczANehSpkHdMZiNc9O6Mryh/kpyambtT/
 etvn+GvDAp1ZZnLb3zp4O0R7WZGa8fSo5uSuU3UAEnAGbGcQSOjdeVdHQ/nErNngHVA/AsE94+N
 eaWv+54/rViDK5QqZAd/ALpTLEIfPhLCA99UHqc0RUCSqm2Mc1ZTl8iPJwxwCwnFZI29c+7LSYJ
 7leBQVC9h/LLUuCu+7SAAK6TAGrqfyWTw6H4wvylPYpXDm9rNLnJJIq0HbyE2UC21ATjBWVQYWG
 lp2AYMyPRoLgtLklWK9dmeQcRs/YMqSu3aRvGtuBg5sz8XUSXPvWHOvioMs/hCkLM3KPZ+Q17LS
 A7GafQMhdMZvhGKOw1g==
X-Proofpoint-ORIG-GUID: xPmwdGKAh1MtlBTY28qRysWXCMgG8eGV
X-Proofpoint-GUID: xPmwdGKAh1MtlBTY28qRysWXCMgG8eGV
X-Authority-Analysis: v=2.4 cv=TIB1jVla c=1 sm=1 tr=0 ts=6a23cdb7 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=pGLkceISAAAA:8
 a=U62o5wFZXXwz9zNoNkkA:9 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-06_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606060073
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111465-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp,qualcomm.com:dkim,rmubfdchimj7:mid];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:ruoyuw560@gmail.com,m:quic_vgarodia@quicinc.com,m:quic_dikshita@quicinc.com,m:abhinav.kumar@linux.dev,m:bryan.odonoghue@linaro.org,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DAEC464CDBC

On Sat, Jun 06, 2026 at 12:07:36PM +0800, Ruoyu Wang wrote:
> iris_vdec_inst_init() allocates the source and destination v4l2_format
> structures and then immediately writes fields through inst->fmt_src and
> inst->fmt_dst. Either allocation can fail, leading to a NULL pointer
> dereference during instance initialization.
> 
> Check both allocations before initializing the formats. Free any partial
> allocation, clear the instance pointers so later cleanup does not see
> dangling values, and return -ENOMEM so the open path can unwind the
> instance.
> 
> Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>
> ---
>  drivers/media/platform/qcom/iris/iris_vdec.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
> index 99d544e2af4f9..dd18079a9ea5f 100644
> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
> @@ -23,6 +23,13 @@ int iris_vdec_inst_init(struct iris_inst *inst)
>  
>  	inst->fmt_src = kzalloc_obj(*inst->fmt_src);
>  	inst->fmt_dst = kzalloc_obj(*inst->fmt_dst);
> +	if (!inst->fmt_src || !inst->fmt_dst) {
> +		kfree(inst->fmt_src);
> +		kfree(inst->fmt_dst);
> +		inst->fmt_src = NULL;
> +		inst->fmt_dst = NULL;
> +		return -ENOMEM;
> +	}

I'd rather see the check for the allocated objects before they are
assigned to the fields in the instance.

>  
>  	inst->fw_min_count = MIN_BUFFERS;
>  
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

