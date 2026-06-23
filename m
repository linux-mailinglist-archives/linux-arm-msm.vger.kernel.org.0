Return-Path: <linux-arm-msm+bounces-114116-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aFtaDJdJOmp85QcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114116-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 10:53:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 209D56B570C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 10:53:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=asT6Mglx;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=amV5CM6a;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114116-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114116-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EA9F130241DF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 08:52:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C44F43CF213;
	Tue, 23 Jun 2026 08:52:01 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5180E2D77F5
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 08:51:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782204721; cv=none; b=Y+l+L+Hv7X1JZLvNh1gWs104YhSjD0gQSKenaR7nc5vpPJr/2u1QQEI2LMIGSTQaG7YXoWx+HX/neJ7bUId5xVX33peIg4wA8qcyGSHMscL3E8qxrPWIMgX3HRpWGVFaRaR6kbnUYXg5MB5JfWJdxpnQGvTbooKEMdtg31A1HXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782204721; c=relaxed/simple;
	bh=BFBG8+SC5Uj5ZB2Ay5lTKTJQltli+zwEim5VFBFstPM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BDCfBEIOEqS6Ue7V8SiWFiyInLxhY1heaLt1wuqIK1ymJGOTwr4EU8CyAjpt5Y2GMzBsoB23zCGQKcPchSpZbbxPPfqfvZbfOFClMMwxhoyn4dvA05Wo2DAAq/ZwxpRr2tg8mqhfoMZ59ZMNs/wpsQ+3m1kgvfhwk1ytI2k3ceM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=asT6Mglx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=amV5CM6a; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N6cVU73338247
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 08:51:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zfMUMzU1RF+WDR1ZaUyRVDL9
	zp3SnqsjfGf7c+h7ADg=; b=asT6MglxIIq0cO6EQ0OLdb0VTdZMJllLKn72jxy5
	5p4wE5k3xs0FcNi3TtlH3UMCV+zEaEK0/0wN4TMbz7+96y1xiYQ0ceokAWMc2efx
	ovbH5y4LvnBoHYQmwud/X2vSRPHWmAv0xFmNJN4hmifnJ2j3OMZxnGAsNcjCcfpB
	NgI1EsIoXkSi+qFN3nikBxo+NYSQ12fkGVL5Wf3F1OLtLxYj5EtO2xOo7N8rCa7V
	sFuSPrGPCySm/ciYUCPX67GdLEwszssOJEgir8HM0awGaNub6hlkGW23ixJ3krGR
	/7JohAZgsj6semAAKGYjyJbQioZ+xeI12SyIqoXRqv+GVg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eygkjhd6t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 08:51:58 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-37c9127e316so4159872a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 01:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782204717; x=1782809517; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zfMUMzU1RF+WDR1ZaUyRVDL9zp3SnqsjfGf7c+h7ADg=;
        b=amV5CM6ai5HyLJMUnrSlcBBdWsvOonNVkXY8nYUe1Za8Ms+aGitz7jPLvaJJnQNb2K
         4NZ+GySytBdp00RzAT/1qgUrjBbgjis02g5/Lk2veWwLj6Tdhp4PKZ6b74v/RFe4SG4J
         ieOYWO+9SHD8y/Kqn2dPVVwZj0D8/U95b+f6ATDPagSPUkfDJc+KZViEgBxtyGR8v4vt
         HZoFf/IqH494hVCZOkCBresWS9F7RYDEIv4ObJEDKG/O8djTIK91jGSYnkywEwKq3U30
         4CS9srDk3KwOkdTa+kCU1Cm5EG3GF2gCDF5pvEmHNS0jMkgxnYnvonriwSifYZxsa9mZ
         UB6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782204717; x=1782809517;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zfMUMzU1RF+WDR1ZaUyRVDL9zp3SnqsjfGf7c+h7ADg=;
        b=LTJcSvUx2Fi4W8QrgDdMYyJbtPtjud/7gp3qSiAJ3k6yZdSVZAwL31NyFjSthAjIqV
         y9HiFZemCe3oMSDQvZH/ee0T3iDegzIraUIkGWdnu4qVY8EbFMiJiizhFKve9HWi0KXN
         hIZbnba+efMT2qrqzFwQZpI4h7mM8MNzG6n57pzOU0KOEZtuky+HFnzYKczenNduyot9
         Q/ePZI1J5FEDhGhrsCrpeMSxppGBYmHUGObXQ2dboh2WzcL0YRkWS6t3qoc7E6+ki9X2
         9iA5z1apZqLldEc0eZbRqD7oR2iLaQkBVqVPx9Ib7RuLDg0173xkot1URtbGKr+MVjQ7
         dHRA==
X-Forwarded-Encrypted: i=1; AHgh+Rq5An8DsCz/rSGPO6r7FHZheNSzwPWrH+5FBJUxeYWlZnMBeEREid+f2ZTeik1onaF5hfpBaEHpbTyROWCQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yyemc61DRoy828yO1p7PSih0YMbMe7wM/8n0WsDvtbFD7mdebWj
	FFGFWWBICnboIv3JwIHE0Jjd1M2JPwd0FYRvdRT4W3piZLFmnnAB2hu480SNnkfDcVyYPuwTRjk
	D7OvwUNZ/QfPo/OL8rYlYNLbp0utGu4pTQ6AHELMtiovTBvVATNNpQMdLjbHuPHu/DWQnw1+WQA
	50
X-Gm-Gg: AfdE7cmlAKoA+ke+i/k+AicJfA5Qy3ynnzLUwmach53gJv8OLvr7oyJQtF9pA+ER+89
	RmryhZPmjs1rOK7ceWW2n0D7iRcpV4o+lS5HUpctn/7L0P5dTvN5jvfsebdV27IkW7vF5O9K+B7
	bBUBsKXtfAxsflkIblSbNAtQG0zopJpL20e41OVVk+1V+6uSf+SYrKILNF7mBR0CjDNDRvYQ2JW
	pWcSUJTsr80xMDSVFndbE30ReXYRnpF85rfL1ZjShUvu1J4Xep57u1ndjqE2jPPNKoXnz4RSc7+
	aAh2vnh7gchg3X47Gae8Szg+tSQx8xiPIk6hqVuAoRPPSjHYb6KQZ20w6xd3V38ypHs7KCtBuAD
	S9xhtUHp50mOY1bquEgjCCeqsUavzV75rAD6Iqg==
X-Received: by 2002:a17:90b:3d43:b0:36a:5d1f:7b6 with SMTP id 98e67ed59e1d1-37dd16b5af1mr1870940a91.2.1782204717209;
        Tue, 23 Jun 2026 01:51:57 -0700 (PDT)
X-Received: by 2002:a17:90b:3d43:b0:36a:5d1f:7b6 with SMTP id 98e67ed59e1d1-37dd16b5af1mr1870920a91.2.1782204716687;
        Tue, 23 Jun 2026 01:51:56 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37d15f92d5bsm3246843a91.0.2026.06.23.01.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 01:51:56 -0700 (PDT)
Date: Tue, 23 Jun 2026 14:21:50 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Haoxiang Li <haoxiang_li2024@163.com>
Cc: robin.clark@oss.qualcomm.com, will@kernel.org, robin.murphy@arm.com,
        joro@8bytes.org, jroedel@suse.de, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iommu/qcom: Remove sysfs device on probe failure path
Message-ID: <20260623085150.nr45mbu4225lpaom@hu-mojha-hyd.qualcomm.com>
References: <20260623071245.1985938-1-haoxiang_li2024@163.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260623071245.1985938-1-haoxiang_li2024@163.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA3MCBTYWx0ZWRfX8YclwATEh7cK
 IvUMxn2MfbTHHJLGD4Q8BNMr+9Dmr26QPPdqn2yiuydfCr7JBK+jEtzzVdhc1nmM9n7xcDFps2y
 IGpSjtSSkbBuLGExppdbvsYx5IKJlouqnW+w6e+HbUtWE2QW6AvP13KqyG8XqKL2XubsVYtHmWj
 sF6KfGX+GgQZjj2G4ED0TaS0iTgGmD210jcv76hWGfirKlNIpTsiNMIMCGdQj8L4OkWB4X1C8Px
 DU9pehY6CpXFiG76KjIl2vnoS6B/yaF7Qz01VfbE2eLGykffpEAaSGwsxe8LzRPfN8+slx2nwNU
 HTDGqIv8ej83+SNj5t4TkQMgWUpP+dqoaQC0Iq64W1DaexTGvzhh3hoFUd8gbLBwdw5rRFOW7TR
 wNMS3+EXujmtooaOeCIqLWZ6t3w2eHDsdHykT7zj4nUslF/rBOsTNcUjTLFL3JoVo/ejJrirc69
 gDGyVOHAyF8YjgAhaLg==
X-Proofpoint-GUID: WW880On38a_YFMBn4xPUipM-PCiFJONw
X-Authority-Analysis: v=2.4 cv=SoKgLvO0 c=1 sm=1 tr=0 ts=6a3a492e cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=Byx-y9mGAAAA:8 a=EUspDBNiAAAA:8 a=pQidVZ3N1npoo1zWM9kA:9 a=CjuIK1q_8ugA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA3MCBTYWx0ZWRfX750JeyxKKB3D
 oEEtLSmRjHgi5WJd6Dg13HPH+/pmeQRG+vrbY+wZjzJXXqATN6Uax3F+U8XoZ3VoWUawFgIIVuu
 MI3UrsExQVZoNdYdRpMJoP/uy8Gc7ds=
X-Proofpoint-ORIG-GUID: WW880On38a_YFMBn4xPUipM-PCiFJONw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230070
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114116-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:haoxiang_li2024@163.com,m:robin.clark@oss.qualcomm.com,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:jroedel@suse.de,m:iommu@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,hu-mojha-hyd.qualcomm.com:mid,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime];
	FREEMAIL_TO(0.00)[163.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 209D56B570C

On Tue, Jun 23, 2026 at 03:12:45PM +0800, Haoxiang Li wrote:
> In qcom_iommu_device_probe(), if iommu_device_register()

You can take space till col 65..

> fails, the sysfs device created by iommu_device_sysfs_add()
> is not released. Add a goto label to do the cleanup.
> 
> Fixes: 0ae349a0f33f ("iommu/qcom: Add qcom_iommu")
> Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>

Not related to this change,  but there are some more issue in this
driver..

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

> ---
>  drivers/iommu/arm/arm-smmu/qcom_iommu.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> index a1e8cf29f594..32efef69e72d 100644
> --- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> +++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> @@ -855,7 +855,7 @@ static int qcom_iommu_device_probe(struct platform_device *pdev)
>  	ret = iommu_device_register(&qcom_iommu->iommu, &qcom_iommu_ops, dev);
>  	if (ret) {
>  		dev_err(dev, "Failed to register iommu\n");
> -		goto err_pm_disable;
> +		goto err_sysfs_remove;
>  	}
>  
>  	if (qcom_iommu->local_base) {
> @@ -866,6 +866,8 @@ static int qcom_iommu_device_probe(struct platform_device *pdev)
>  
>  	return 0;
>  
> +err_sysfs_remove:
> +	iommu_device_sysfs_remove(&qcom_iommu->iommu);
>  err_pm_disable:
>  	pm_runtime_disable(dev);
>  	return ret;
> -- 
> 2.25.1
> 

-- 
-Mukesh Ojha

