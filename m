Return-Path: <linux-arm-msm+bounces-115864-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7B1RG84lRmrWKgsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115864-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 10:48:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B809B6F4F45
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 10:48:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=hMFUT3A1;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=UdcUKobV;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115864-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115864-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 99DD1300F9C2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 08:39:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36BFC43E4B4;
	Thu,  2 Jul 2026 08:39:09 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 130C642EEBA
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 08:39:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782981548; cv=none; b=h3M2Vx3CWkQi/47lUIOaFbqSDqQy0xB5VmkMNnlrE9nKV3Ov1PCI+RbmGggiTSTkBUthZ79S5fBZgerhSKJZhnMrhelv+a3OR7NoAjuQkuF7UHvEOXe4Cpyo3688tUYz99XV8KcybgaIxsUoqGhYLuOALdz3AxfgEEOGQR1UKY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782981548; c=relaxed/simple;
	bh=JyHHTTgn//TUNwsiSQgVvykmVhQLLZrRUEKdovUjNLE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=djKdebHtLmg1Z/fGvsID3fdyLFxNLX+027l2Kvs0dMbnd0fmPFi7Ti2cTHxEKjY0rNaz9ErZ1jsvNIBAXTtosejXnM39SoVgPq3hBW94vCpgmPO5JJUa6biJdrfaeQ7k+oeuoTaoNSu8zBTyGpntbkrwFq/p2uJab3p2Q+TxNR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hMFUT3A1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UdcUKobV; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66242tMZ3460377
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 08:39:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vgJPQNKXC3P3aI7glb1Npj79
	EY/GhBWlSKYZjjosXkw=; b=hMFUT3A1VpAcyq3u9tpd2T9QfQFpYre2P7Hi69aW
	0QAnPktL6LQMEkhn+JFFyhXgNaTa6l3Kr0rLQESW6SUccIe3U+hc49u3QNZgNBf+
	WP2Uck6oIkLM3rRMHG2UjWXgVdXr32tFYij3g5sSw4daaOYDsvC5oaT4eMc03mZr
	Uh22jqWTEiNKMtQ4kXtlkevsaMlNCVupp4XTTci+6LKEE8y15t9XobwtCDXPcBQg
	yjWRthRLEk2jjNc7ER/7mndIaF+ZAwD7z8R9Lv0A1QzWiYi2EMyi2a8kJGGnS5Am
	RPp2LfKLM17qCfV+vduKd/osCaH6bRj94x9XwQfZUs1nig==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5gmb0x97-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 08:39:01 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c88d7a75507so2197489a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 01:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782981540; x=1783586340; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vgJPQNKXC3P3aI7glb1Npj79EY/GhBWlSKYZjjosXkw=;
        b=UdcUKobVFCAZ2GDzO2CW84d9DvTm2F0MaYxObrRcWFZB6hoWDi3vY1pvRtONSsN6P/
         H3yvxV3uE5nxrc0gA2XPGPZQP5R4TYpjD1VOqXc4O/d5FB1aGQeTL4RGOVDVx/Uq5OPC
         9pRSjaIqD7Ljw+G8M2L8OoYhMUyquwGLJdHASpM9fbewC9h+SC5PZKoSAVcZRPDbj2Dz
         d4unzcispJj2f3avB99V4bC/iuwj320JLr4qD8wvQYHJwxKQ9iuN50miTELmKpT/QFS/
         V0Am0Akl6V1IwnuekjzRDKYXF7YJB9U2GxFLMt3pRM8n3Eu2bD7zSn5qhV4cUJyjO9mN
         ng6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782981540; x=1783586340;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vgJPQNKXC3P3aI7glb1Npj79EY/GhBWlSKYZjjosXkw=;
        b=O39DCie03SSPhZW1xyFJRG2xNgqI71dVG0X9CBtT0Ot8jknHr7MQlRAL7wQc1ULrpt
         6wqngNYrPYediVyiksvwx+CJ/PBSQaSZHsYOe7Kh5Wn+jYm2EQz5X+qybyelFfXT65k7
         wE6Gu99VK1lFlrrkgg4UJlcdSHZz6tqpaFh3XEoliTLOmc21pE3cBUqeYeuEOU5JTv3n
         pc6kTWfVKOHBFQAGb/k5jb04XDoZE3aVdnxh5ZHKpPaaPqQn2IhXvqy2YMzs36tKPTAe
         A33vz4/4vH+4Zrj8l3vS328yws8ak71tcc4tLS/tEhgeFJIy9P2Zld9EueClUn0hC77t
         b+hw==
X-Forwarded-Encrypted: i=1; AFNElJ80Gl6LcdPAaREjMDVG6hI9x61hKLbmEE8xWK3hqvWmiM28w+I1Zp7/vcMgmrH6WFQD0VjJu9xdYfM+hqGo@vger.kernel.org
X-Gm-Message-State: AOJu0YykZs+shQjO45zclQc+7nPBLi7Kqs0qntjI29GxHmI9GJnTW000
	FXuJ80ct9kVacrzGac2j/nJl81F5aDKW2mH1eCeoUA5pKsvBezBSFSYQleYROmNemxvhPZSDaZC
	bT65IwOJOIVvnh53VgxJsvCa+/JlcW8kf+zaY7Ag34zoh6T2mfEaZvm+KtvPa30NdY1FR
X-Gm-Gg: AfdE7clKuw+kyXMxI8TRr14ZlA8cMqzzJzwzMxGAAHoq8xWoChourMTMDie541NZQCC
	B9lQj2rM60nMf5UVMwZYwZMigvjz9b8LTczacrD+ReYytLWCMZRrDN2P8y5PJmnEnZdH9JT4Fy7
	bb2ZWZEgrE8BRbF/wQGd4q0Ll0rhZRecTx/6zlzvm0FaGl3R6puZBnB3zsfmkrphvD1T2QfUNvv
	4RiCoERqxtCicJ7gz31OoEo41ljUlE8V9E4+brjBnQq9Ku6OvmXJaIXBls3dwUKMBg3NBDY/h8X
	I0ZxXUqSz/cCDqklsVzgcmRXdVmxCnCDlwCLG+QXIDEasOu4ZIeJA11VVTJgvOlUg8tyHL6C/j9
	SsOnkypG5jzkwdGj8Gy2LpmqMJ+r8OTg1Jdy4og==
X-Received: by 2002:a05:6a21:e0a6:b0:3bf:7110:9949 with SMTP id adf61e73a8af0-3bfed1c58e3mr6050610637.6.1782981540210;
        Thu, 02 Jul 2026 01:39:00 -0700 (PDT)
X-Received: by 2002:a05:6a21:e0a6:b0:3bf:7110:9949 with SMTP id adf61e73a8af0-3bfed1c58e3mr6050581637.6.1782981539702;
        Thu, 02 Jul 2026 01:38:59 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c870effsm8064082c88.12.2026.07.02.01.38.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 01:38:59 -0700 (PDT)
Date: Thu, 2 Jul 2026 14:08:53 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] firmware: qcom: scm: introduce qcom_scm_bw class for
 bandwidth management
Message-ID: <20260702083853.vklonxq56t3fyuzw@hu-mojha-hyd.qualcomm.com>
References: <20260701-qcom-scm-code-shrink-v1-0-02f5ce02c95a@oss.qualcomm.com>
 <20260701-qcom-scm-code-shrink-v1-4-02f5ce02c95a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701-qcom-scm-code-shrink-v1-4-02f5ce02c95a@oss.qualcomm.com>
X-Proofpoint-GUID: GA0eZ5czZrqoxnqQf5IIVVVsu3ZRZi4R
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDA4OCBTYWx0ZWRfXyLOFx+uTCE8I
 UR0yIL6unfDWfN4Egb4gf7xqXA2O/jm3hhudEgKo0+b/N/ocPETmGKZqpt43CnoFYSzYXYeyf7G
 6LL/2s2bvlGWwRSYWh84HXMGXSavJUU=
X-Authority-Analysis: v=2.4 cv=aJ7Ab79m c=1 sm=1 tr=0 ts=6a4623a5 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=KNPxY_twASYAIBHjqOoA:9 a=CjuIK1q_8ugA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDA4OCBTYWx0ZWRfX4mtZzJtgFVXg
 3v946BMK4LKEa0KESN5Y+XoN3HgtmGGx9RNpXLp8jFq4IDS5txJVZvpjxksU1p4G+4zbvCEbBA3
 8H5bw7Kv7H4XEfN9N0ijWKfa+mT2KbrdS0VPkSPfTrSpoKqTHjVvRkdpPiu0aYMv6HankSK2G3R
 NyI8QTaDwTjmt/GdIkQIz4SUYAmLqy24nzmLNdOoeXnAR48GahmrQ3a1NsLpeNxIkxH612HLv+Q
 SlXT2Na/SIvnXzvvXHG5KguoKLBc38QEH/i+Xy9QucRjb4uMSQrpEns6pqYYIxRgnVAgbikLzaT
 WbCJerrreF+23YDgXLlIJ+JHmiOAZvlcqq0hSWCUaMeJZfbnIL80gy38SItYF2keesjsOO5g+0k
 drnk3FpXeyQldbqZGPJorSlUXlwh/1CknTPDl6E1ckXsOADlQFptv2qQi/SKpPnPep7I3P+VNb4
 g9PVW8M4UdJXVWwZu+A==
X-Proofpoint-ORIG-GUID: GA0eZ5czZrqoxnqQf5IIVVVsu3ZRZi4R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020088
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115864-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bartosz.golaszewski@oss.qualcomm.com,m:brgl@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,hu-mojha-hyd.qualcomm.com:mid];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B809B6F4F45

On Wed, Jul 01, 2026 at 03:38:58PM +0200, Bartosz Golaszewski wrote:
> Define DEFINE_CLASS(qcom_scm_bw) that calls qcom_scm_bw_enable() on
> construction and automatically calls qcom_scm_bw_disable() at scope exit
> *if* the enable succeeded.
> 
> This allows us to convert all call sites to using
> CLASS(qcom_scm_bw, bw)() instead of the manual enable/check/disable
> pattern and to remove the associated goto labels in cleanup path.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  drivers/firmware/qcom/qcom_scm.c | 61 ++++++++++++++++------------------------
>  1 file changed, 25 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index 35aa9e8886b6ce8ab8eaf16c83fef7aafaef2822..6b64ed5a2b70a5ad3e57efb780df7dfa43518f91 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -227,6 +227,9 @@ static void qcom_scm_bw_disable(void)
>  	mutex_unlock(&__scm->scm_bw_lock);
>  }
>  
> +DEFINE_CLASS(qcom_scm_bw, int, if (!_T) qcom_scm_bw_disable(),
> +	     qcom_scm_bw_enable(), void)
> +
>  enum qcom_scm_convention qcom_scm_convention = SMC_CONVENTION_UNKNOWN;
>  static DEFINE_SPINLOCK(scm_query_lock);
>  
> @@ -621,14 +624,13 @@ static int __qcom_scm_pas_init_image(u32 pas_id, dma_addr_t mdata_phys,
>  	if (clk)
>  		return clk;
>  
> -	ret = qcom_scm_bw_enable();
> -	if (ret)
> -		return ret;
> +	CLASS(qcom_scm_bw, bw)();
> +	if (bw)
> +		return bw;
>  
>  	desc.args[1] = mdata_phys;
>  
>  	ret = qcom_scm_call(__scm->dev, &desc, res);
> -	qcom_scm_bw_disable();
>  
>  	return ret;
>  }
> @@ -760,12 +762,11 @@ int qcom_scm_pas_mem_setup(u32 pas_id, phys_addr_t addr, phys_addr_t size)
>  	if (clk)
>  		return clk;
>  
> -	ret = qcom_scm_bw_enable();
> -	if (ret)
> -		return ret;
> +	CLASS(qcom_scm_bw, bw)();
> +	if (bw)
> +		return bw;
>  
>  	ret = qcom_scm_call(__scm->dev, &desc, &res);
> -	qcom_scm_bw_disable();
>  
>  	return ret ? : res.result[0];
>  }
> @@ -870,15 +871,14 @@ struct resource_table *qcom_scm_pas_get_rsc_table(struct qcom_scm_pas_context *c
>  	struct resource_table empty_rsc = {};
>  	size_t size = SZ_16K;
>  	void *tbl_ptr;
> -	int ret;
>  
>  	CLASS(qcom_scm_clk, clk)();
>  	if (clk)
>  		return ERR_PTR(clk);
>  
> -	ret = qcom_scm_bw_enable();
> -	if (ret)
> -		return ERR_PTR(ret);
> +	CLASS(qcom_scm_bw, bw)();
> +	if (bw)
> +		return ERR_PTR(bw);
>  
>  	/*
>  	 * TrustZone can not accept buffer as NULL value as argument hence,
> @@ -893,10 +893,8 @@ struct resource_table *qcom_scm_pas_get_rsc_table(struct qcom_scm_pas_context *c
>  	void *input_rt_tzm __free(qcom_tzmem) = qcom_tzmem_alloc(__scm->mempool,
>  								  input_rt_size,
>  								  GFP_KERNEL);
> -	if (!input_rt_tzm) {
> -		ret = -ENOMEM;
> -		goto disable_scm_bw;
> -	}
> +	if (!input_rt_tzm)
> +		return ERR_PTR(-ENOMEM);
>  
>  	memcpy(input_rt_tzm, input_rt, input_rt_size);
>  
> @@ -909,23 +907,16 @@ struct resource_table *qcom_scm_pas_get_rsc_table(struct qcom_scm_pas_context *c
>  							     input_rt_tzm,
>  							     input_rt_size,
>  							     &size);
> -	if (IS_ERR(output_rt_tzm)) {
> -		ret = PTR_ERR(output_rt_tzm);
> -		goto disable_scm_bw;
> -	}
> +	if (IS_ERR(output_rt_tzm))
> +		return output_rt_tzm;
>  
>  	tbl_ptr = kmemdup(output_rt_tzm, size, GFP_KERNEL);
> -	if (!tbl_ptr) {
> -		ret = -ENOMEM;
> -		goto disable_scm_bw;
> -	}
> +	if (!tbl_ptr)
> +		return ERR_PTR(-ENOMEM);
>  
>  	*output_rt_size = size;
>  
> -disable_scm_bw:
> -	qcom_scm_bw_disable();
> -
> -	return ret ? ERR_PTR(ret) : tbl_ptr;
> +	return tbl_ptr;
>  }
>  EXPORT_SYMBOL_GPL(qcom_scm_pas_get_rsc_table);
>  
> @@ -952,12 +943,11 @@ int qcom_scm_pas_auth_and_reset(u32 pas_id)
>  	if (clk)
>  		return clk;
>  
> -	ret = qcom_scm_bw_enable();
> -	if (ret)
> -		return ret;
> +	CLASS(qcom_scm_bw, bw)();
> +	if (bw)
> +		return bw;
>  
>  	ret = qcom_scm_call(__scm->dev, &desc, &res);
> -	qcom_scm_bw_disable();
>  
>  	return ret ? : res.result[0];
>  }
> @@ -1032,12 +1022,11 @@ int qcom_scm_pas_shutdown(u32 pas_id)
>  	if (clk)
>  		return clk;
>  
> -	ret = qcom_scm_bw_enable();
> -	if (ret)
> -		return ret;
> +	CLASS(qcom_scm_bw, bw)();
> +	if (bw)
> +		return bw;
>  
>  	ret = qcom_scm_call(__scm->dev, &desc, &res);
> -	qcom_scm_bw_disable();
>  
>  	return ret ? : res.result[0];
>  }

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

-- 
-Mukesh Ojha

