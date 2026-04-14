Return-Path: <linux-arm-msm+bounces-103203-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gNk7H+WC3ml9FQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103203-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 20:09:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C72E93FD7C1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 20:09:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DF88D3095BF2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 18:05:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B9ED311967;
	Tue, 14 Apr 2026 18:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CVv3UCUC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G/ji2Tt7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC7B230FC1E
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 18:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776189925; cv=none; b=gcnjue1w8xER7MrwevuvBpFcMDnOJK5twJiSZZGk/kXIyD4whfn/Eop9UxEvCYEHhyfrNm2VRe5MDNJUfGS2MoDKWj5AouOTJS5mvKNlZjy7MRuANXE8pplVxqIst37PEywvNyN/jXDcGNAdMJQdikt5/7MmBidcHm/sICEyUwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776189925; c=relaxed/simple;
	bh=bJjvgZvysPaL60nBzaasDvt3Y3xx8CI9cUxUU3GFnAM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AeDfktyQF0EbVg0dJSsYGjf5k3GuAbsPgZF5fypzAy/rIsmrTCAYBzTisAICx9q9jqiBzGTsjQA4vsU28crXu/0Irvd0Va5vv1K67jYMU/OFr+miZaOXUEpxx0K8BthZrSWutC5mTNg033cZ9R6yKwjc8bPPph19lIOezkhAsek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CVv3UCUC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G/ji2Tt7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EI0Ymr3759256
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 18:05:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MLH+Ml13shpUcCPIl39o9hn3
	og6Wsjh0MtJEFyEKsm8=; b=CVv3UCUCdoziWBcze33ltdmLepnmK9I6tjmSWJ7U
	K3aafF7sSL/xsWQ5Ma/DBphuV3CptKQGDsI2x/EndlSdtHQw7YC+PTJ/yLIZqwLR
	gQHV02mFYBdN2/xU+MsYl9SRvE9WlMO8UH256+0d0lShYGOOL4KO1JnuunteQG6p
	jLwPh0O5Jm3iiB5ri4wX5WKg65jSRFUFTfAQ1HC2haTbiX3+KfZbVsCa3RDLl2+5
	K1CzCjEvcCyVAFt3gpYduBRxHSA9Zz3YkdMGzld8GoIeTnNzjC6Ce9+iAqch5o1G
	hvjDxFNecvilZ2N6691X/cg9aBeqJwTpTK6GCjS1cMPSZg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dhtg080qu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 18:05:22 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6100b5a0757so3620043137.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 11:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776189922; x=1776794722; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MLH+Ml13shpUcCPIl39o9hn3og6Wsjh0MtJEFyEKsm8=;
        b=G/ji2Tt7gWCe0HI5lmndRzXAibTTQZeQu/nNGlOLTIl0+7MLukwjGGsYukpYUxvMJI
         Ab1JjCO/9LNd5s8phyYoXC05jUxb6zNNnUXTibZioFj3eFYQTBaCVaBs+Fy36MIZ5lhp
         Z21a43SDnHjjuIBcWtg4U4aQgjy2KLtJj6n1dNse9nzAv0yb4z3OdP553/bQvQcH8RRR
         hMeaReHeCHFoTXiMB/xtaWtqoi3z8ojbnStefQeDVjM3W16xIyWmS8HA/3wwyIJUMzcT
         kvP1I0nnivHzAoukCGA1A1m4Xq3NIhJDzrkGgV2788AzkXDEfXh3ryZP5n2MK0D0xMGE
         yH2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776189922; x=1776794722;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MLH+Ml13shpUcCPIl39o9hn3og6Wsjh0MtJEFyEKsm8=;
        b=DJMm1BHFZ8oPOuSvkLLFJolpIDopOHXkvbYxSKRxQwQ1IBjrlobiH3IqBAkElS6HAB
         UvOVyaiZTsqTGGWSxOjLWNl0Fxrf3TeBAhFsQqdlWUg+j8Zt61VhqFmh7i+jBdGq1H3k
         /CIVyh41lJQRXKCxrc5Wzz28xh9Z9St/JBkodPE7NWb2lnDhXIqolGlcbcdoQXop9Gcy
         T5dUC+ydgmmgBXiftak0Vc3tAgoKV9FLAFJJwqLBr9gbHmwbCpqVFCkxij0KzT3mPTLu
         iA49MQlB76Ipu1byfqMWRKCEUQu1n8XL0U5+vxGahivmk4KRG+KH6ChSi/Yz8ZxoAaun
         9rag==
X-Forwarded-Encrypted: i=1; AFNElJ+RJglUFYigCximYUp6L4+bPXOe8yLw0qAJma4yc1SKBTvQTbD0GrUJi/YBItMnnGj17OncremiocO9l4hi@vger.kernel.org
X-Gm-Message-State: AOJu0YzqB3oMkorBLMbW9VIiz5sEcnCTfCsHEtaXD4QLnjlDe8PiiviD
	hgu0e6LN4Ty48m6DicO+DtTe8QIXo6/ed0voxh3O56GtA7thiQcl4oRVEeBJZn9EbVqJwcNez5J
	0NgqZEjI+07yerObZwoI7w/e72Ul2afDaYgfVaN4JLbnnYjNLgypzZ6x6Cz47o5kaonN4Kbh2HR
	9j
X-Gm-Gg: AeBDievMI6zV9mYBj1ezyNrfdub1Js+PBIHvZ1kHvOeuSevOD+CGvA02cJYpHUsBhYn
	aMJUXn8i/bZtBcW2Pw5YS+F1xheOlhk+O7SUDnjnyOpYX2TfT8YImNYQjtm4dLYspOafVB21LYD
	xqmqvo8gpRt4kjTGAR2qMZkdLdm96C9h9MiJAWKjck55yER5UjCp8Ny9a6t7Pe84/jIKa5Zzasx
	Lkfe4ZlGQ4rjAa5/ec04/oFQJYB82PTACme+7idLAyvRMur+I6EOMBbV3ocWjb5X5L/KOY1M63F
	3Qc0tUuXKuFyVAYhjrjvKxWewE3KMVXayVz+XKZOJ/PueFnPMeUJBNnI3Kz/fzO1QdZ1eP7ES8x
	Dny+fRASrkmQb882/UoFQjpRYvPDJoRLbSfY/0/YAXGZq6uKbTUk9sYPe3P9/VYr7++FVhwXZDD
	PFtzqp/rQ7WXRC0hqjeYHdT846lq64XUUHK7+tg/MzbkcHAw==
X-Received: by 2002:a05:6102:4a8c:b0:607:97a9:e3dd with SMTP id ada2fe7eead31-60a00e43eeamr8012337137.24.1776189922065;
        Tue, 14 Apr 2026 11:05:22 -0700 (PDT)
X-Received: by 2002:a05:6102:4a8c:b0:607:97a9:e3dd with SMTP id ada2fe7eead31-60a00e43eeamr8012314137.24.1776189921647;
        Tue, 14 Apr 2026 11:05:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3fe377e5dsm1416420e87.30.2026.04.14.11.05.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 11:05:20 -0700 (PDT)
Date: Tue, 14 Apr 2026 21:05:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 04/35] irqchip/qcom-pdc: Replace pdc_version global with
 a function pointer
Message-ID: <adhldkguq5xazute3yj7f2iteie7qwj6vw3wnm6ouu4gvltt7z@liwfdfdwkvfj>
References: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
 <20260410184124.1068210-5-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260410184124.1068210-5-mukesh.ojha@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=AszeGu9P c=1 sm=1 tr=0 ts=69de81e2 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=k0SPMzxaIUwtrynI4mAA:9 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: GelExs69apcrDTdfjQCElYPvbNLsAGUn
X-Proofpoint-ORIG-GUID: GelExs69apcrDTdfjQCElYPvbNLsAGUn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDE2OSBTYWx0ZWRfXwOfqcc7e/A5S
 V7E2aO7FHW1OqkdN9I9yoe6RbheBZO7izkngoAGEkF//mNUYR038NAceMbMZ4nzOqloYOl3O5Ec
 fjQwE5zavysqg+XlM//XkiSuMAayZXn0ngo0eGGN8xrhnAK09dI+IWbAq/RVCLblBAXKdi5ZmVW
 4vWPOcvFSIZq0lfawPLBb6CLyT3iyNoHcCXY6GPAphCQ4ZMr3kJssRgSZO9VnC/VMaHind9MwBu
 2ZQIrNAeunpkue4Z2CIIg177qbNqcjYxEZW70tYm8e3Zo4k5NRWK3lp7cHy7M/kY2BKONBW9zoT
 Z8zd7VwlnYpc2z4p9wZQygPebFuE0tD8+4B3q33IiL1qKGzBlrV0YDTrYuQUEnm678a96eABvPd
 RAvDTSYezOTzixk2EkaFQU3BuXLmyMkKrOEOrBR6vXFJxik6IXckwGGo9V0x1EjyFUbK8Mmf6O2
 hB1DAOBNuOFeEMgEw5g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 bulkscore=0 impostorscore=0 clxscore=1015
 phishscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140169
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103203-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C72E93FD7C1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Apr 11, 2026 at 12:10:41AM +0530, Mukesh Ojha wrote:
> Now that the two enable paths are separate functions, replace the
> pdc_version global with a __pdc_enable_intr function pointer. The
> pointer is assigned once at probe time based on the version register,
> moving the version comparison out of the interrupt enable/disable hot
> path entirely.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/irqchip/qcom-pdc.c | 13 +++----------
>  1 file changed, 3 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
> index 21e2b4b884ee..734576cdce0c 100644
> --- a/drivers/irqchip/qcom-pdc.c
> +++ b/drivers/irqchip/qcom-pdc.c
> @@ -51,7 +51,7 @@ static void __iomem *pdc_base;
>  static void __iomem *pdc_prev_base;
>  static struct pdc_pin_region *pdc_region;
>  static int pdc_region_cnt;
> -static unsigned int pdc_version;
> +static void (*__pdc_enable_intr)(int pin_out, bool on);

I'd say, it's more awkward than the current implementation.

>  static bool pdc_x1e_quirk;
>  
>  static void pdc_base_reg_write(void __iomem *base, int reg, u32 i, u32 val)

-- 
With best wishes
Dmitry

