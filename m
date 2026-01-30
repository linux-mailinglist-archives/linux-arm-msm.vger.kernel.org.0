Return-Path: <linux-arm-msm+bounces-91229-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sH3lBdEZfGlgKgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91229-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 03:39:13 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7379BB6830
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 03:39:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5050E3003EC1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 02:38:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05F2F2036E9;
	Fri, 30 Jan 2026 02:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fM6VQ2nm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EctdeNpf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00C0D531
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 02:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769740724; cv=none; b=N8drsGSwR08kbynoo0x7X0fla8VoUu0x+GA2en1pSj8uVXe1c5FICRs3u9mHdZKV83W+/Z4iRqGKQ0zN/IHS15BvZnIjCNGogvlFVV3e2h4DOceDNAagQ9rWZK1BjQAi8iHlvGJkAqGeLghZyyFFJHhbJTb/ocZznrnTHzLfCPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769740724; c=relaxed/simple;
	bh=JnFBL+9V8/JBHBzdXwhO2xwJEtpLOKOZ5XiUEV7JSEE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=osZz2Vah/qQfExE4M+cQpR+FHQF5fGytmSvzrIMoAA4n6NHTf4IuD24e+q4TqkYlm63/sjbbDcrjdZnpcsnDVvp2F5lH+OMHhMkP9Lw+ejcrNpLd+6iQxzqCgBHQ5qs9UIipGCkleCjZ6LOIHV4w2UE1Fwt97Iy/5cu0EzAR4Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fM6VQ2nm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EctdeNpf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60TMtWGQ325578
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 02:38:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HcDaTxd00FsQjxgCY5XTLK8c
	zak37LqC5DSMKVJvXbU=; b=fM6VQ2nmuyDmhrCq4s6mv0jHql7R2VFbt+vd0W7d
	mkXlVrxBHh5xP5XWqQCG8ZDjYyuRD1AHyp6wB9Uc6YD/1RxNNxaPemycLDDiOauM
	yX0CJAojEpW/h60uu/xomjpVYJ4Dk+ceblo6fVVh5r/BJHr8Jo5sUxrnCfVq+NoQ
	6z8BwblpnTlk7SnuwZAjmUifCs4Z2F36Yf786tuxt3KAMZ00AEWwD5cRrlWZXkbb
	IwA5XAXnQrJnlbkRb9/1WVBycoTRb+jdY2pTTFSlBvKmHt1HHfRQoR4gLYwPl2A5
	d12DCtCRBBsSZqIty3CI+hpKTyZF6mwa67WXPAEaQwLQkQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0gs7rfge-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 02:38:42 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-5f53259a432so4006061137.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 18:38:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769740721; x=1770345521; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HcDaTxd00FsQjxgCY5XTLK8czak37LqC5DSMKVJvXbU=;
        b=EctdeNpfZ5DhUfxcFSmiXoW2eNryTNwmfZhKH5hcJwn8r5MCGPXsnntyKfmS0kDiuP
         UkQK1mgtjATg8VBVlMBOC5HSeF3o9x6NfuO7V331/imJWny4GfzBg6Ja8kcMvd3snQTz
         O1i+GHJWL+maxA5N6W+3Oh7GcY8LNvg0vFhVHs+71OYVQZnCOMhfJS6e69QA43z3l2M1
         qQhX6Z6hrGr+droYUZB8+siOQIRi3pJmITfb1BMvm/GkEHW+ukFDnxMYZ+ufVD9NiXSP
         rG9vl/d7CnajJ082XoTJWm5Ot8RL+u6gHpgkjQ+B8QP/ry7tULFtHpY0HP69pgc+WVcT
         AjZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769740721; x=1770345521;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HcDaTxd00FsQjxgCY5XTLK8czak37LqC5DSMKVJvXbU=;
        b=AjL5WGs53hzhmLaL/xbcOVM3zTJKkK5wUHf7Z6gR6dqqgYXaWrk4kH9BgAIiyTRH7d
         hl6ilc8BShUgumhNXjdQa4+/hry5NwPYDGsEMBRkPAlyqamWTwD7ygZK4UULjNUQ0asd
         Xdv2OghQlY5FhbcWgTA/z3A98CSgGzxB6rWZIibcp+X/BeuwRHPw980gVoiuwjtVgE0U
         PumdM5oOg3BEAonUQaPEu83zuJaFcvAC+VUbijSgdPo4Bwn1WCU3Dhl2nl/wlxTjk0vA
         +FOxuiSEFy9GL/GxR86C3Z+Ulbzln5qs0hrT1PEF5ZVzRYghpqR26+ZXuf0ZS0xZX8FI
         NbMA==
X-Forwarded-Encrypted: i=1; AJvYcCXEDM/HnSofvuW7lJDTKqY36GfA0gdmaasCQd8FSoIpAsLPwqs0quXxD92zdOBuIQX7oyVcW7+FDt01z1Km@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3t/x2QTb0pZMwUQyi+QCR4g77JpiAH3FP4NJrEmtYiRUB+vW3
	coHVtAVvd2v61JRgQOZz1DI03Vi4mjTqDFt+Z8FUz6aaKVeINaWiEAfF+eft6AcoODjOIb8icL7
	TK/nmxwm5tQShfPqL/ry9auYbbD7xaK7ywxbm17Iaw/HMlEAiCmoPBJKBUAZVhaDbbcNY
X-Gm-Gg: AZuq6aImSaUd8bx0LevstGP6bbvqVQpsvyfgpEtsJ9dZ/E+2tqRm+A+FUGLGD4yt/zA
	gyPQ6puKXdnjaVL3Yd5J7AehsZZKybw0mQCmXzb9RaQyOcNkkG9RkyL87nmBD4xK7fC3RlKN3xf
	mBFHYUPJz1IwtVeglRCvAK3NPdHEU+sP0KjgcSU0AE1G3aLKWnuKkAJtjFdmBEil/t2hU297Zoc
	NRfiG5qIvVx1YWd19H/59xt3+VEYAk44aVXjY9fnVZ4I+UyS8Tw9UZsAWVG/xjLKNh/CIJuqiGW
	BrOwNUt7yL+Y94CwnR62Bu3hy81nwJrylxWZJC9aL3FyY24RZpPx9K8ytbGrVqEtybM1S/XmgV0
	Z5umhNcBlMbofsnCBfaGfeKDWlWk2B3HDY8BY8EoICBlR5emIga5KoSe2rjqtL+7a9Qlbkkolv+
	oFPONSuyuF7KzszlwzKIhM6DI=
X-Received: by 2002:a05:6102:d8b:b0:5ee:a590:6b11 with SMTP id ada2fe7eead31-5f8e2607eb7mr529940137.36.1769740720984;
        Thu, 29 Jan 2026 18:38:40 -0800 (PST)
X-Received: by 2002:a05:6102:d8b:b0:5ee:a590:6b11 with SMTP id ada2fe7eead31-5f8e2607eb7mr529936137.36.1769740720593;
        Thu, 29 Jan 2026 18:38:40 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e074bbe0bsm1433749e87.83.2026.01.29.18.38.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 18:38:40 -0800 (PST)
Date: Fri, 30 Jan 2026 04:38:38 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xingjing Deng <micro6947@gmail.com>
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
        gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xingjing Deng <xjdeng@buaa.edu.cn>, stable@vger.kernel.org
Subject: Re: [PATCH v7] misc: fastrpc: check qcom_scm_assign_mem() return in
 rpmsg_probe
Message-ID: <ie3hipmp5nqappyuwnxm2kpgscnl6qe42cwf2sep4inwunb5th@gontu4foua6q>
References: <20260129233703.407404-1-xjdeng@buaa.edu.cn>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260129233703.407404-1-xjdeng@buaa.edu.cn>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDAxOSBTYWx0ZWRfX9g6q1OaEqgHd
 gduZLFRSBzEyoJB7qzvfByZCq1j0ZNaTKNGYmxK0kijxT6JhM/SXUlYbIjakPNGSY7/EIOarbUv
 brXR3FrWOn6TlxWaOSKUIQAbfAq+LzUfQC/vX7jYlqRd5gF2lV0h8DdZLIHRmWTd9e43vnM75JK
 fkHtWnCeH1JMMNf+x8LWOcnLdAN4PFZgnJZSNY3m3OKEo4OOMplj9B0Hk80CuyePpbzlK4Ge0k4
 SVrdM4OGf5U4AviK8bxOf5X6as9236GaEyY1o9POQ5VEBYaue2env5JD562t9LwjbT3UccilOAz
 F/xD8oDY5/bNgebhtw8H7/gH7nusww2D540H9yhFrpF2x7Iit5/788FDEp71vZTXuZ1Te+jpUDE
 idFqTnp/4Cwpj1PUPzPkmWkHU/bXkmrX+ZKb3oyD4DmMaZqp1UXqYynWkyWVt2Dq09TiVwzoM1m
 ill70Stl0loaKkNqgeA==
X-Proofpoint-ORIG-GUID: Qxxg2Z6pSWLHNuq8CapO5u4leczjTZiu
X-Proofpoint-GUID: Qxxg2Z6pSWLHNuq8CapO5u4leczjTZiu
X-Authority-Analysis: v=2.4 cv=UPLQ3Sfy c=1 sm=1 tr=0 ts=697c19b2 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=UE2EgE-5dsTTq3FBrnAA:9 a=CjuIK1q_8ugA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_03,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 spamscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601300019
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91229-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,buaa.edu.cn:email];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7379BB6830
X-Rspamd-Action: no action

On Fri, Jan 30, 2026 at 07:37:03AM +0800, Xingjing Deng wrote:
> In the SDSP probe path, qcom_scm_assign_mem() is used to assign the
> reserved memory to the configured VMIDs, but its return value was not checked.
> 
> Fail the probe if the SCM call fails to avoid continuing with an
> unexpected/incorrect memory permission configuration.
> 
> This issue was found by an in-house analysis workflow that extracts AST-based
> information and runs static checks, with LLM assistance for triage, and was
> confirmed by manual code review.
> No hardware testing was performed.
> 
> Fixes: c3c0363bc72d4 ("misc: fastrpc: support complete DMA pool access to the DSP")
> Cc: stable@vger.kernel.org # 6.11-rc1
> Signed-off-by: Xingjing Deng <xjdeng@buaa.edu.cn>
> ---
> v7:
> - Add the detail description of how the tool detect.
> - Link to v6: https://lore.kernel.org/linux-arm-msm/20260128033454.2614886-1-xjdeng@buaa.edu.cn/
> 
> v6:
> - Add description of the detection tool.
> - Link to v5: https://lore.kernel.org/linux-arm-msm/20260117140351.875511-1-xjdeng@buaa.edu.cn/T/#u
> 
> v5:
> - Squash the functional change and indentation fix into a single patch.
> - Link to v4: https://lore.kernel.org/linux-arm-msm/2026011637-statute-showy-2c3f@gregkh/T/#t
> 
> v4:
> - Format the indentation
> - Link to v3: https://lore.kernel.org/linux-arm-msm/20260113084352.72itrloj5w7qb5o3@hu-mojha-hyd.qualcomm.com/T/#t
> 
> v3:
> - Add missing linux-kernel@vger.kernel.org to cc list.
> - Standarlize changelog placement/format.
> - Link to v2: https://lore.kernel.org/linux-arm-msm/20260113063618.e2ke47gy3hnfi67e@hu-mojha-hyd.qualcomm.com/T/#t
> 
> v2:
> - Add Fixes: and Cc: stable tags.
> - Link to v1: https://lore.kernel.org/linux-arm-msm/20260113022550.4029635-1-xjdeng@buaa.edu.cn/T/#u
> ---
>  drivers/misc/fastrpc.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index ee652ef01534..8bac2216cb20 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -2337,8 +2337,11 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  		if (!err) {
>  			src_perms = BIT(QCOM_SCM_VMID_HLOS);
>  
> -			qcom_scm_assign_mem(res.start, resource_size(&res), &src_perms,
> +			err = qcom_scm_assign_mem(res.start, resource_size(&res), &src_perms,
>  				    data->vmperms, data->vmcount);
> +			if (err) {
> +				goto err_free_data;
> +			}

I think, checkpatch should warn here about unnecessary braces.

>  		}
>  
>  	}
> -- 
> 2.25.1
> 

-- 
With best wishes
Dmitry

