Return-Path: <linux-arm-msm+bounces-96371-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kCN0LdQ4r2kPQQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96371-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 22:17:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F89241842
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 22:17:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A5D85302DF93
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 21:16:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 300BE33F5A0;
	Mon,  9 Mar 2026 21:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eYrTi12b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YOQKmHPy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3873933BBCD
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 21:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773091016; cv=none; b=hSoR08XmsoAjZ13KZYchl+/QY1nhzMq7qtqT5C/WgYF/RfRE7I3/WX0PYfqsv1RSalXDXoyB8OLPS2Rian1xzIKfYPu8lhvu3xtxBVCUZEq/E/Ww1ihqQ/RLKY4G8KWh6x3d1ORKBR/jrvAOyL/7JJFqJFX8EQmwrl6ClFlrJtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773091016; c=relaxed/simple;
	bh=9Vi9h/QCYvk5FMh7uKEmgwQ6HQwUbzQlnoVmcbt27Uo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jbGM906eYVdjpTgsQrflc7wKdLBr0uINIMAqH3ruCTMNjV2nXY4zoJoj+kB9tgz91XjBhqrXliSF/eLPl1bopB/F14PNYPUSYh68AgRmg5Jj8QBhXZDfW0psQbL7ECLdygnLG5CuYNi1Kfixs1zV6dHphuJ9GCWvdpO2Yr0dGXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eYrTi12b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YOQKmHPy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HC5KF3280626
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 21:16:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KLgWRaioXqeIrwHgYBcxPqE/
	kg4Fe+2f2o7A+PfgTZw=; b=eYrTi12bsFRg+Ep63Gvyrpkz6qz+XZZnxJnhHzZ8
	Afqkljn6AGFqwUNG6Hi9uCb6ZzQda58iRJHt3K5YZu6fE5lb/rlDs3LPJDnuIy9X
	R2Y9ER606cwX+ZHgCY8VFLE+xAxUWo2O4Thd+KKh+iYlFQhrYQ0g6GO+JQptJ4KE
	6f0gsKaivSPOXL1lrK/xqQc3elp326ygArdomugL7e78pyCIveo8V0I+Gp/yH752
	qn3L1fJOi+1y8gGG02UGdrOgFKCLS1JmoihvFsIZX4/Br1ShuSsjy4BmL2Iv75+1
	0Iz/BPpRhzYykPy9UUlKCrzFisiTC2PnI1DfQMHXc4YBKg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csqcyb8hh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 21:16:53 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50900e9803aso189295001cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 14:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773091012; x=1773695812; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KLgWRaioXqeIrwHgYBcxPqE/kg4Fe+2f2o7A+PfgTZw=;
        b=YOQKmHPyNCEu7UMSTQMMsSM4NSdPdeebQCgvuwAdFDDwGJaOtqHee232pMsGUwaxG1
         W9EdcBAx8+znKW1brCb7JnLsAS9Fy2ibNNALZ8H31HqhKlT8yuzkAZRm/TDf2ApZMRmu
         M12RBRvtxftfMAH9pqQpfwn3pPI5NC2ZGbkni49AlY/4O2lu8NiTb1jcm6mWjYCVHzws
         4srZyWij4cUO03vwvMKUcaGe+z1q8rWeHzUeZx4MRwtkiCcDqLZHzah+IY79W6Vq6vNL
         8JP8/CqDX7hooMuR9HLy5seeZJsiECoCV+2c9tn/jBhtnIl+2nn404YHTSHHD1/zIa8H
         nG2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773091012; x=1773695812;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KLgWRaioXqeIrwHgYBcxPqE/kg4Fe+2f2o7A+PfgTZw=;
        b=WB0uFQqaSmkMwTalE+iDRMOfELSJTi1k+0G3bXA5CowfrfN7btaOxUwiWVlvSpHn+X
         54UvgZuUNUn2I8EnVMO32IZjPLzOHlZVyEas4SpGAA8ALSnMrb/me/Upp2CXf95h29o3
         uii0sbKrC0BYzbY4gD0LZAGhkz8rYsL5CaR4JmzUWawcEdg3UqtEbwfKWGtICeYRVHxT
         Wkq3XYFSRDWx31YnoogT94GeajfgiGj/4HtoyRBVD+hvVkJRyVZT/frBflrE57Hogv39
         IxuS6soAyRTs8CNOdthwrev6Ra8kDpmBRNJEci/15AYFXy+J3fIVB/Ktpf0Yvs+/ro3d
         fBzQ==
X-Forwarded-Encrypted: i=1; AJvYcCXm8eXoTFYjmE6tY61KpCXBWLeT1xxurRdYfWSFwkqj5Ai2K72PTKQsuad/E3c+7WcT6iqGR2mkROUF/nLy@vger.kernel.org
X-Gm-Message-State: AOJu0YzXoNe6IGGjUm0GRFyT1+HNheI6sw8GULQI6xfh4O0AyOP2SYuw
	BUj6s8elZUCY1s9GGn5uqLdn5XUN7rI93YIVCFHjCRgiOC7eE7YEY8EvvlTGv34WWdFxpAens6d
	xDTF/5ZRZ/QKTg4wbHHY3MsaMRz9GvonoHLabqhxXDctliusscdfRn6UtdWZqLf2HtoVo
X-Gm-Gg: ATEYQzyRUsZz+7HPQExmz40JPjOSLpkEJAECQ1rnI9AaY36C/NupZKPA+KeJ1b9ORoM
	27cAdILzqabmJZAGSiuktTGB7Qnsf95XSYdcUQKvqjJLnGdMAaCXGrXIE7Muwzf5GE9sop50N6f
	J2T7hrWSXrtuWMLrjxNi7T2vCxZv2plH+RV0cVlNqUVRfwxxaIBnI8+NV50twRsrSTU68WXlTl+
	lsS1g2YdhKuavRvt+p2hBrVOq5De+hW4Zaukgw5bg9JsFlriZBkIsXZncY8/Ur5KFbDJHpKiGnH
	fND6Wt3lXDcn+qVkyvGefZ35i7Ht80j3hLC2bYmpj2Uoxkkq5UxVBTiNsHBHZqgFRe+ZYJoOTwk
	7OTivvuRp2RXYdja8THY65kKA0RAsNhmKFYxaa6wTgMdpZhyPAqTFjmIuM4rCjgHhPFEnwCBE4f
	71JygnSliV+ZOMLlesHZz4rafcNUcDnhLzS/I=
X-Received: by 2002:a05:620a:2946:b0:8cb:3d7a:c009 with SMTP id af79cd13be357-8cd6d4b5029mr1566974185a.78.1773091012364;
        Mon, 09 Mar 2026 14:16:52 -0700 (PDT)
X-Received: by 2002:a05:620a:2946:b0:8cb:3d7a:c009 with SMTP id af79cd13be357-8cd6d4b5029mr1566971885a.78.1773091011890;
        Mon, 09 Mar 2026 14:16:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13d01cbfasm2323612e87.14.2026.03.09.14.16.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 14:16:50 -0700 (PDT)
Date: Mon, 9 Mar 2026 23:16:47 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Cc: Nipun Gupta <nipun.gupta@amd.com>, Nikhil Agarwal <nikhil.agarwal@amd.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Marc Zyngier <maz@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Richard Zhu <hongxing.zhu@nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Juergen Gross <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Prakash Gupta <prakash.gupta@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-pci@vger.kernel.org, imx@lists.linux.dev,
        xen-devel@lists.xenproject.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v10 1/3] of: Add convenience wrappers for of_map_id()
Message-ID: <3plcdobbd6teiluzijzk33yepbpsur24tnmjr32sco7a4loptm@xmzmsaurvmvj>
References: <20260309-parse_iommu_cells-v10-0-c62fcaa5a1d8@oss.qualcomm.com>
 <20260309-parse_iommu_cells-v10-1-c62fcaa5a1d8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309-parse_iommu_cells-v10-1-c62fcaa5a1d8@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDE4OCBTYWx0ZWRfX/iRaLvpFbbo/
 ok/c8M6IqaludiA8HaPfOxqbJ0wH/IG3aCslNKMdIzJEPd4aqr70T/c9yRbr0cRCgVI6Nh+Gifj
 CdDvcef69fRkPsBVaWfhPoY/i28oneqYWQgj1Yb6wdHKKiNW+hlf+OuEgBk6kmJvOTx4Rk/+kHs
 4wvt/tFjGGuUWZAHSSL3ysTIJV/ABbbvHWXgZMqebnJlirH67/szlPKrYs6MJxVvo3T+m1bxTB3
 zcN78pb55UFCCoc5NRuwA1uEcEBCutpNQTNmLQuvHJ51OqfvBr5sz5Bv5MmRsmYhSXOi60nqamX
 1XBs0wEhP9EGBsDs6yrVGqP9r7d6TnEQUnWfQqYyWJT6IXdcmN0yEOYeqivemibgsEo1D6r32/c
 IMd3+sTbW3F7OUFFIuBzcobiCX8FYR7bwfDDMJ4CK/rYV0x4gLCmsVQmbpyw28ykJCslKZxDC3F
 /hHG5cegZYXHO5xZxiQ==
X-Authority-Analysis: v=2.4 cv=QJtlhwLL c=1 sm=1 tr=0 ts=69af38c5 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=7CQSdrXTAAAA:8
 a=VwQbUJbxAAAA:8 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8 a=5ndfpk7zZlG9lj9R3R4A:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22 a=a-qgeE7W1pNrGK8U0ZQC:22
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: 3RzM6Bd25zdrcXjXoDX4xOfsSF9nTy8X
X-Proofpoint-GUID: 3RzM6Bd25zdrcXjXoDX4xOfsSF9nTy8X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_06,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603090188
X-Rspamd-Queue-Id: 47F89241842
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96371-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[37];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,8bytes.org,kernel.org,arm.com,nxp.com,pengutronix.de,google.com,gmail.com,suse.com,epam.com,oss.qualcomm.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,nxp.com:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,arm.com:email];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Mon, Mar 09, 2026 at 01:03:37AM +0530, Vijayanand Jitta wrote:
> From: Robin Murphy <robin.murphy@arm.com>
> 
> Since we now have quite a few users parsing "iommu-map" and "msi-map"
> properties, give them some wrappers to conveniently encapsulate the
> appropriate sets of property names. This will also make it easier to
> then change of_map_id() to correctly account for specifier cells.
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> Signed-off-by: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
> ---
>  drivers/cdx/cdx_msi.c                    |  3 +--
>  drivers/iommu/of_iommu.c                 |  4 +---
>  drivers/irqchip/irq-gic-its-msi-parent.c |  2 +-
>  drivers/of/base.c                        | 36 ++++++++++++++++++++++++++++++++
>  drivers/of/irq.c                         |  3 +--
>  drivers/pci/controller/dwc/pci-imx6.c    |  6 ++----
>  drivers/pci/controller/pcie-apple.c      |  3 +--
>  drivers/xen/grant-dma-ops.c              |  3 +--
>  include/linux/of.h                       | 18 ++++++++++++++++
>  9 files changed, 62 insertions(+), 16 deletions(-)
> 
> +
> +/**
> + * of_map_msi_id - Translate an ID using "msi-map" bindings.

Which ID are we talking about wrt. MSI interrupts?

> + * @np: root complex device node.
> + * @id: device ID to map.
> + * @target: optional pointer to a target device node.
> + * @id_out: optional pointer to receive the translated ID.
> + *
> + * Convenience wrapper around of_map_id() using "msi-map" and "msi-map-mask".
> + *
> + * Return: 0 on success or a standard error code on failure.
> + */
> +int of_map_msi_id(const struct device_node *np, u32 id,
> +		  struct device_node **target, u32 *id_out)
> +{
> +	return of_map_id(np, id, "msi-map", "msi-map-mask", target, id_out);
> +}
> +EXPORT_SYMBOL_GPL(of_map_msi_id);

-- 
With best wishes
Dmitry

