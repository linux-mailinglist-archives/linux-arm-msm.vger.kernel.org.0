Return-Path: <linux-arm-msm+bounces-94710-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2HC8IsAOpGlbWAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94710-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Mar 2026 11:02:40 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E410D1CF01B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Mar 2026 11:02:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7B2003016292
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Mar 2026 10:02:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3FEF1C549F;
	Sun,  1 Mar 2026 10:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MFDwcsRM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GLuxb86c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C24F2E54A3
	for <linux-arm-msm@vger.kernel.org>; Sun,  1 Mar 2026 10:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772359352; cv=none; b=C/wglLd5uVwn+Oumya976UijZmCROh681QqvTgi46vjFdyrtjXGLXcg5p7vour1I4BlPXk/4y/xg6mjcHE//fRh7ZVklkFDyemNtUefx3ewECgrF6DzOL8CI2IStgpLK0iqhZvc58cJZLSCG/JZpLLwDJnFc/tZakDgOE5TPsaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772359352; c=relaxed/simple;
	bh=0qeqXrjHsjlCMKeBisiWhuDOAfV33+sVSyKxf6rWuNs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jA/XCtLwpfHMBgGym+S/KvT2ZIe7Ae+xWcnzk/reDuvzz3sAiZsKGcwPDf3ukgSXzok8w83lmstcVA/45+/ragDjisUYCg6ak0AE2b1QuTHLc9cyqk8IQ+yvfXQBf6NpG8638QTkz+NgXhWDSX7HedyGYe7LcYZEaziUmq6CkcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MFDwcsRM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GLuxb86c; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61SH0O9K632062
	for <linux-arm-msm@vger.kernel.org>; Sun, 1 Mar 2026 10:02:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0xpqoMV9nCv7588O/2lb3+Dy
	gEwHNzZq2QKo2gKrDEI=; b=MFDwcsRMUoLALjslv9VY/VdAydAxc3/eD8jPp+b0
	3dbJ7aTibd/9b6GV9IF2gWn6gSpe/I3btoHNAVjlHAbEwxC6eHSVdnwqOitswsKK
	BFmc5ona0teu2h6YmGm5UzCmJDzSNJQeil3gsT4tu2E/DuMyeeU2M4A9oTkvAzIU
	6Nj7aXpW3vgAMvolk/oLAysN+VfAUn/SXHBScRSfZ3wrgr7md5skbPHMUU+5C7cg
	PDWi6o6khIMR296Rtf2LMqviKvYVMgehPnRNL1VGGCDd7pD1khwDOQnaVh1y70D6
	5NTfRB58X2oh3kZa0pAyMmBzeNyGrUi6kb5A/jodMBBWgw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksf6jffh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 01 Mar 2026 10:02:29 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-899bef1ea49so401238396d6.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Mar 2026 02:02:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772359348; x=1772964148; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0xpqoMV9nCv7588O/2lb3+DygEwHNzZq2QKo2gKrDEI=;
        b=GLuxb86ckPTK7eYf4c7DD58VwLcz8o/Y0+iuOWWK9rd/nSJ2dVXaPZDLdd4WRbHvOs
         RuewtCHkz9Tphzp64io5qMGAETk3v2H/aTkMVQ+OGL6bzdpcpmGCsaJ+e0/B3HwL4MDm
         oCh+JETbXuZSF1mSuuaHxsxsbuBOE9WjziOFigGky0yluVhdddBSP97yd/ApA8QizxtK
         bsjBftgbLWja7sSamVvS99sTDTSrrmsDY6+L3TJE+0Co6339inm0+VQG1Qpa1MHBvu9H
         RzSxr3luGzfKI7IJeXMTzSOqhP3rCCF5/Crdo6aT3g5oFRFtht596DjNeQlFD0/1+P3N
         Ncpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772359348; x=1772964148;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0xpqoMV9nCv7588O/2lb3+DygEwHNzZq2QKo2gKrDEI=;
        b=GQGE5e1+uXYEZ1QnysMmGho8+ilQC2Eu3pM8SpKYglBRMXh4B4ZLIvGewFj9mhKbrS
         hZKr5es4B/0Jf4V3gE080FDnY6QSXwwopKvBhmuNOayvFHRkGaa+qwB+NrDGzAqqYogn
         AYXI4ZAV6covkKSERSf58lbryLMhgVnnshLFwibFF62QTOprwlCcq+6OrTf7vcuavTGP
         u1mWcyFqUkP+q6Ybt9oNWVAeeBzYS3DHljaSnnrnXrC9QuRMx/2DEU5M1bbaiBL78Zx0
         MulKZVu0wu0yVPCyLe97YYmjB44iIOZpKQy0gqQITJlXMDARl/FDTq0MUGmNRv4sUG9z
         Bbhw==
X-Forwarded-Encrypted: i=1; AJvYcCXFnhVpJ1ZQd36IoR5WKSNr9qLxT198cfiwgUFbUi5dB1buLSsFnBDdxVpb4XjZgkyzN3SUQJMGUo00u720@vger.kernel.org
X-Gm-Message-State: AOJu0YzjtXjOkpom4Pw6aVvaX8cijk3e8+NEoznFp7mMYaFxdugm7qtB
	fR6i3bJ44ILniEdch1P/XJ8WvvRzNJMdh2xpldokTRCKTZz1z7/GCrew1WRYfmQYFeoX32wAf4a
	0VSA2k8uy+tymU3c3VjB9m3LoUdlzB+L4rJHJtrftzrp5AWpD99OXKy9Jb16EdYlyU24K
X-Gm-Gg: ATEYQzxIJw/LbrKjEpnLOQ7Xl8MV3rLzH414Teu/CFwql7bRLZfhLClX/yPWviBjPBs
	JJjVeYjo8EkX2bZsA1h5bMMUuju83FSt2MTZmYM1YlMazqz8ckoWKNdfgdagXtY1L4ZSfywFDP5
	8Y6OhSZYc6oX7NIY6WZioZXBqXFHN37b+NUkXs9MX5VBOWrckzYL5QSRPqHXHDbkyAfs/Lc43BM
	ZTyE3zHRFJ2cSYOKv9Dt4A9kWCvgF8Twi+O/6L1pVVSyqWYVy30DuayKFmEZC2VsAU1Fx5JnCTp
	DOgVjeCJNyirZwUEV1yHx5icLlh++UEg4wyhy/PUFYfKEdUrdyGIkvhBS1VmEyZQdeqHavDpCIS
	iscPZe3Tm+9RjbZgRZnM3qnbCeIxZRWxN3LvdpcGYgbnVgmKNYtlkUCaI2z1xDwAlt0qNNc6FsU
	Ok61FyWnxSrprn9oDyzH+SvfmJu50BFO5k8+Y=
X-Received: by 2002:a05:620a:2904:b0:8b2:e17a:37 with SMTP id af79cd13be357-8cbc8df0942mr1244111685a.43.1772359348322;
        Sun, 01 Mar 2026 02:02:28 -0800 (PST)
X-Received: by 2002:a05:620a:2904:b0:8b2:e17a:37 with SMTP id af79cd13be357-8cbc8df0942mr1244105085a.43.1772359347812;
        Sun, 01 Mar 2026 02:02:27 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389f302285fsm22929771fa.44.2026.03.01.02.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 02:02:26 -0800 (PST)
Date: Sun, 1 Mar 2026 12:02:23 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Cc: Nipun Gupta <nipun.gupta@amd.com>, Nikhil Agarwal <nikhil.agarwal@amd.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Marc Zyngier <maz@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
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
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Prakash Gupta <prakash.gupta@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-pci@vger.kernel.org, imx@lists.linux.dev,
        xen-devel@lists.xenproject.org, linux-arm-msm@vger.kernel.org,
        Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
Subject: Re: [PATCH v9 2/3] of: factor arguments passed to of_map_id() into a
 struct
Message-ID: <grcqbs42seqxmes7lm527kwhqf6osherykg6pc3w5voubd72rn@hncfl3oforza>
References: <20260301-parse_iommu_cells-v9-0-4d1bceecc5e1@oss.qualcomm.com>
 <20260301-parse_iommu_cells-v9-2-4d1bceecc5e1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260301-parse_iommu_cells-v9-2-4d1bceecc5e1@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: yenPj8IKQYcfTdoR_QzzmysLuHs635PN
X-Authority-Analysis: v=2.4 cv=JoL8bc4C c=1 sm=1 tr=0 ts=69a40eb5 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=ZF1vm7_Oee5k7ESqZ6kA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAxMDA4OSBTYWx0ZWRfX3a1HxTwcMjmq
 0eODsHtpfO+gJnvRwgAdqGwe+F4GqRhW6wRJMK6vgzu6xXPNNCuJYke2ASaIwcOTMOrL08lLcH9
 zYZqbXqHTa+PNwd0GPxBQhUgGOfheuv9mKRqKoKUezrC8Sc19u5rJV+4iZyZusZrSke421MosHo
 +RxR0ZP5FXpaIdd7+f/AYeBtI9vkowXZycq5U7sHb6g8cTDOAKmv7aLtJaXiCoCAc/oydO5ZjIh
 U54lMRS/BuI3O+ZDMV/51KWA5/+NOhPH6Ber5mWeMtrfqdefHYwOPtLCogtJ2oMCAHR+IiL4LSH
 sugw5ag3H8VsiFQnU4sInUsDPYT0r1vyDPBFcPIzyTE4PhBfYp/3d4AJ56jZKVOoWzQmFwjm59I
 vUAnz86nXBJKkhW/gm1bDTDbWWMzIC3Z4NOeF9WdgdFBqGkTPVwj7idNtBOceOnNrKs6bXFLSPl
 g6Yfgn3l3xX09pxIkIg==
X-Proofpoint-GUID: yenPj8IKQYcfTdoR_QzzmysLuHs635PN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-01_01,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603010089
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
	TAGGED_FROM(0.00)[bounces-94710-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[38];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,8bytes.org,kernel.org,arm.com,nxp.com,pengutronix.de,google.com,gmail.com,suse.com,epam.com,oss.qualcomm.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,iommu_spec.np:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
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
X-Rspamd-Queue-Id: E410D1CF01B
X-Rspamd-Action: no action

On Sun, Mar 01, 2026 at 02:04:20PM +0530, Vijayanand Jitta wrote:
> From: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
> 
> Change of_map_id() to take a pointer to struct of_phandle_args
> instead of passing target device node and translated IDs separately.
> Update all callers accordingly.
> 
> Subsequent patch will make use of the args_count field in
> struct of_phandle_args.
> 
> Suggested-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
> Signed-off-by: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
> ---
>  drivers/iommu/of_iommu.c              |  2 +-
>  drivers/of/base.c                     | 37 +++++++++++++++++------------------
>  drivers/pci/controller/dwc/pci-imx6.c |  8 +++++++-
>  drivers/pci/controller/pcie-apple.c   |  4 +++-
>  drivers/xen/grant-dma-ops.c           |  2 +-
>  include/linux/of.h                    | 21 +++++++++++++-------
>  6 files changed, 44 insertions(+), 30 deletions(-)
> 

> @@ -2193,11 +2193,10 @@ int of_map_id(const struct device_node *np, u32 id,
>  	}
>  
>  	pr_info("%pOF: no %s translation for id 0x%x on %pOF\n", np, map_name,
> -		id, target && *target ? *target : NULL);
> +		id, arg->np ? arg->np : NULL);

Is it just 'args->np' then? If it's NULL, it's NULL anyway.

>  
>  	/* Bypasses translation */
> -	if (id_out)
> -		*id_out = id;
> +	arg->args[0] = id;
>  	return 0;
>  }
>  EXPORT_SYMBOL_GPL(of_map_id);
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index bff8289f804a..74fc603b3f84 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -1139,12 +1139,18 @@ static int imx_pcie_add_lut_by_rid(struct imx_pcie *imx_pcie, u32 rid)
>  {
>  	struct device *dev = imx_pcie->pci->dev;
>  	struct device_node *target;
> +	struct of_phandle_args iommu_spec = { .args_count = 1 };
>  	u32 sid_i, sid_m;
>  	int err_i, err_m;
>  	u32 sid = 0;
>  
>  	target = NULL;
> -	err_i = of_map_iommu_id(dev->of_node, rid, &target, &sid_i);
> +	err_i = of_map_iommu_id(dev->of_node, rid, &iommu_spec);
> +	if (!err_i) {
> +		target = iommu_spec.np;
> +		sid_i = iommu_spec.args[0];
> +	}
> +
>  	if (target) {
>  		of_node_put(target);
>  	} else {
> diff --git a/drivers/pci/controller/pcie-apple.c b/drivers/pci/controller/pcie-apple.c
> index a0937b7b3c4d..e1d4b37d200d 100644
> --- a/drivers/pci/controller/pcie-apple.c
> +++ b/drivers/pci/controller/pcie-apple.c
> @@ -755,6 +755,7 @@ static int apple_pcie_enable_device(struct pci_host_bridge *bridge, struct pci_d
>  {
>  	u32 sid, rid = pci_dev_id(pdev);
>  	struct apple_pcie_port *port;
> +	struct of_phandle_args iommu_spec = { .args_count = 1 };
>  	int idx, err;
>  
>  	port = apple_pcie_get_port(pdev);
> @@ -764,10 +765,11 @@ static int apple_pcie_enable_device(struct pci_host_bridge *bridge, struct pci_d
>  	dev_dbg(&pdev->dev, "added to bus %s, index %d\n",
>  		pci_name(pdev->bus->self), port->idx);
>  
> -	err = of_map_iommu_id(port->pcie->dev->of_node, rid, NULL, &sid);
> +	err = of_map_iommu_id(port->pcie->dev->of_node, rid, &iommu_spec);
>  	if (err)
>  		return err;

of_node_put(iommu_spec.np);

>  
> +	sid = iommu_spec.args[0];
>  	mutex_lock(&port->pcie->lock);
>  
>  	idx = bitmap_find_free_region(port->sid_map, port->sid_map_sz, 0);
> diff --git a/drivers/xen/grant-dma-ops.c b/drivers/xen/grant-dma-ops.c
> index 1b7696b2d762..5f1d6540049a 100644
> --- a/drivers/xen/grant-dma-ops.c
> +++ b/drivers/xen/grant-dma-ops.c
> @@ -325,7 +325,7 @@ static int xen_dt_grant_init_backend_domid(struct device *dev,
>  		struct pci_dev *pdev = to_pci_dev(dev);
>  		u32 rid = PCI_DEVID(pdev->bus->number, pdev->devfn);
>  
> -		if (of_map_iommu_id(np, rid, &iommu_spec.np, iommu_spec.args)) {
> +		if (of_map_iommu_id(np, rid, &iommu_spec)) {
>  			dev_dbg(dev, "Cannot translate ID\n");
>  			return -ESRCH;
>  		}
> diff --git a/include/linux/of.h b/include/linux/of.h
> index 824649867810..9d72d76f909d 100644
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -463,7 +463,7 @@ bool of_console_check(const struct device_node *dn, char *name, int index);
>  
>  int of_map_id(const struct device_node *np, u32 id,
>  	       const char *map_name, const char *map_mask_name,
> -	       struct device_node **target, u32 *id_out);
> +	       struct of_phandle_args *arg);
>  
>  phys_addr_t of_dma_get_max_cpu_address(struct device_node *np);
>  
> @@ -929,7 +929,7 @@ static inline void of_property_clear_flag(struct property *p, unsigned long flag
>  
>  static inline int of_map_id(const struct device_node *np, u32 id,
>  			     const char *map_name, const char *map_mask_name,
> -			     struct device_node **target, u32 *id_out)
> +			     struct of_phandle_args *arg)
>  {
>  	return -EINVAL;
>  }
> @@ -1458,17 +1458,24 @@ static inline int of_property_read_s32(const struct device_node *np,
>  }
>  
>  static inline int of_map_iommu_id(const struct device_node *np, u32 id,
> -				  struct device_node **target, u32 *id_out)
> +				  struct of_phandle_args *arg)

Document that it's the caller's responsibility to of_node_put() returned
node. As it can be seen from the previous comment, it's not obvious.

>  {
> -	return of_map_id(np, id, "iommu-map", "iommu-map-mask",
> -			 target, id_out);
> +	return of_map_id(np, id, "iommu-map", "iommu-map-mask", arg);
>  }
>  
>  static inline int of_map_msi_id(const struct device_node *np, u32 id,
>  				struct device_node **target, u32 *id_out)

Is there a reason for chaning the of_map_iommu_id() args but not
of_map_msi_id() args?

>  {
> -	return of_map_id(np, id, "msi-map", "msi-map-mask",
> -			 target, id_out);
> +	struct of_phandle_args msi_spec = { .np = *target, .args_count = 1 };

Which driver passes something being worth of storing in .np?

> +	int ret;
> +
> +	ret = of_map_id(np, id, "msi-map", "msi-map-mask", &msi_spec);
> +	if (!ret) {
> +		*target = msi_spec.np;
> +		*id_out = msi_spec.args[0];
> +	}
> +
> +	return ret;
>  }
>  
>  #define of_for_each_phandle(it, err, np, ln, cn, cc)			\
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

