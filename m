Return-Path: <linux-arm-msm+bounces-94712-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kCXyEZ8RpGlcWQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94712-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Mar 2026 11:14:55 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F691CF11D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Mar 2026 11:14:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B5629301E3FC
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Mar 2026 10:14:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9385D3358B6;
	Sun,  1 Mar 2026 10:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hppjOok7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RI22B1iz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD4123358AE
	for <linux-arm-msm@vger.kernel.org>; Sun,  1 Mar 2026 10:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772360072; cv=none; b=YWzoz3lAr2ybWUYcx71hrq+lgE57hfBPw9KfvRmg1/UKWIYCI3B2AmnYGtjl7pRlBICLlbwqakQom4PKtbIy6D5jfLgBnrJPsxaEthv2za6LuWjENRWeeJmFOI3v5rtFLeoi8Gvo6u4ECdoNEEuG70rQOidaDGfAf6AXpHLJg/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772360072; c=relaxed/simple;
	bh=qFO9ArJfnVJ/J0uOK2zYGRWfq7LuSVPNGPutlX/On7A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kgr3IunUn5Ruztq3O5+KHEFAgscKy70GD9IN++dnoaaQZjsM2kkNCtGTafZCUUrA0wX0iaU/Ekn7S+4SUrzNP9RZaNU1k/gUy1fUSIZpfVyhbmpag5A8sFml2aTvSz8fqtP8EnK+GzhIuvVFlYQbP2OLDUyMGj6EsWNjpCj+iJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hppjOok7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RI22B1iz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61SLur2j680951
	for <linux-arm-msm@vger.kernel.org>; Sun, 1 Mar 2026 10:14:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=AaYtDY7i19JC+kgo6Aub+wpd
	CRyygwATCwFfvf7SeLs=; b=hppjOok7n3kZEvdpFxy+oGrOFaOPC7WA6YKIHC/P
	RLEYZxYbkUwgyYloRukhuv54XIuvwPWWpkPINmqgr0ipcG19c+mBC/unxCISJ5r8
	zv7oYZVSJSJYmp55jiMff6vOdPdxkh2HD9IUTL9/EGMSQq7cxEt5ifcUcnLdvyPQ
	CC0CKVFN4N93C/eKDl3lfXTKt14GvBGu6SOZqNz1kipYOf05iepCsnG0pQWfv/Tj
	WFKOcpyXYTiGyABliGv3BCzT079+WL77nYdK0AQqkVT1B1nEmAl3yQKyr4QgxvnL
	0GB6owfy1UPawDPjWgbesksP+P/Io90JOQoe94KPSYHL8w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksfytf4g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 01 Mar 2026 10:14:28 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb3a2eb984so2483988685a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Mar 2026 02:14:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772360068; x=1772964868; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AaYtDY7i19JC+kgo6Aub+wpdCRyygwATCwFfvf7SeLs=;
        b=RI22B1iz25FpWyxjvxwZpPbFDNumexxrObWl8UDrdrYToso2PuwwZIU27hXBkstXXX
         31s2Bamiz9sPUrz82TXCbPrZ4QqUTgDzVava9/HCNg0b/qyvcqc7CdhzAM+rVj00Lr5E
         P7DLploEa3rpkj0PkWVDJ93mfgtUyidTKxX3GEtxzR6xV8tEHcjkNarRDvLTgCN0znEj
         0kIF3Yv7x8dae9RqSDhI72JuShq9AT2TMIhEUcsqpFWjNUP8U8NydLvv7HacZHQbdtYp
         rldxMGpfyssMjH0Hkv5MjqyaLoMmSH/FP6I8n+T+SCNjeOMpSw6078+3ZPuNS8wr7mtb
         zebQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772360068; x=1772964868;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AaYtDY7i19JC+kgo6Aub+wpdCRyygwATCwFfvf7SeLs=;
        b=TgTdp+748xoii9Owfis5y9eQ4obKxct1mkozyolHgmY7s7V1Zzs0Uj+rTwwaXOsf5V
         taGbD2hhO8WC2rPKlh8l163eOweyPuy4oAg0aEF98khPteWfsQxeQ5BMWqA0HvvmCwo6
         W4VOPAalIdQQKS6+PUDFXKOh0INe3a9yAMCHq5Bdym4mEZmTsEUxYxEG/06vAsNedzfj
         uK72+nzapeAVWudg9f9lFM9t9Mkiq9DCTaWluT6VJQzIFiwICk20HsA798f3MIVgrOu+
         xujgWwOzfrA1Tvyunb3am/XJQmgkH8cTy3IJ7Zgl+P6Gtwa1MngVJsSc1kgPyuZhEkoJ
         OOmQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+jND6vcF2twF+SGRqGdKKyREuVGt0ncrKSkI3N+C68FSwyRDRKtVeimrzQ5d1eD3fCAHaS7l5n2DLW6uA@vger.kernel.org
X-Gm-Message-State: AOJu0YyNaNUrA1w9PUVOQETy5yLsHbpL9meOggaHtXai7nsjXgYwLHVQ
	F3dCXBzOzWmudDLhGuYu+RnRegwWETR+3RldrN6Qat2jTB46Fo78p9iAarVSfb08x2vGseGtJBH
	MA0RQP6Afhbg57jtDYURU6uT+XTt9jSXPkJDq/IUDbSvZ/vAnhhcU811qEK6LYqC3yNXc
X-Gm-Gg: ATEYQzy935LhoKYRTqDuPGum9rFg582yPBSKlWSGTMC9lXDdhHac8dwCBL5MbJH2enQ
	q5iBm69xQNcHwmei7ljQc0JuGYsq6ri8gd/A5v9YJAfUAsLns4N/XDVCl6axbmHbWj3rCQrZukX
	sIWIfVCQIjs+fM00MQbasK6ViiZWFn06vfqrcBSaJWmyIkAQu3M+AeCo24Zp2ml3KG9GUE5e14p
	pQpSwjNvp5lgO0HSwk4jjTCW4laictlDyMPEltxc3UGljJ/I9xwZtjgh+si3EShvXF+h/y+FHgi
	hXeCgLhm2glaRwIW8h4TGmDKASN+mxjNEu4gyUoDvMsVV6TASgcW5V27Zy6/TUwZpdtoWHX8kQl
	b4P1UrPCNiko8zaQPazIo399F6XdPdVaRY492fEr5n7iFWq60hONksTN6xQOdxB1grF64v8fUhK
	jub4IAe+tiBH6XIH6EaHZNgr7G1n8vUVP5Z28=
X-Received: by 2002:a05:620a:c4a:b0:8b6:1877:3689 with SMTP id af79cd13be357-8cbc8d9f7f5mr1039717385a.35.1772360067934;
        Sun, 01 Mar 2026 02:14:27 -0800 (PST)
X-Received: by 2002:a05:620a:c4a:b0:8b6:1877:3689 with SMTP id af79cd13be357-8cbc8d9f7f5mr1039712785a.35.1772360067368;
        Sun, 01 Mar 2026 02:14:27 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a115bce377sm961212e87.15.2026.03.01.02.14.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 02:14:26 -0800 (PST)
Date: Sun, 1 Mar 2026 12:14:23 +0200
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
Subject: Re: [PATCH v9 3/3] of: Respect #{iommu,msi}-cells in maps
Message-ID: <laif6gacqyacvchnfuyhu4w3f4746xlrlxrr23klrgtkbn7dn3@rracfqemavwd>
References: <20260301-parse_iommu_cells-v9-0-4d1bceecc5e1@oss.qualcomm.com>
 <20260301-parse_iommu_cells-v9-3-4d1bceecc5e1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260301-parse_iommu_cells-v9-3-4d1bceecc5e1@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAxMDA5MSBTYWx0ZWRfXzbUaXaLKArMO
 0H+a9bSgAEJYHJDV0GLnDLChx4G3SuLOSXKpbJmfKdLRfsQgnXFk5gH9nulPLVHj4RokcRNG0oe
 DNolom7zMFKhWBiJF3GU0W8FWCnB50bfk43GQ8Zv+O9R0F1P6V/pmVeH+I0SeuTKNHehxJF2ukm
 7jDd0FCRiTiqSJAvFFNZGniG/mAfbFih1fUlyV+5PI90u5IFYm9QenvvtlecZpLCB82PTcrLLb0
 /+mOFRIP+d3ZgGd5oO8Yt0nLspPRL33/EqXi9x6rEr9zOa5Ku3TcSf3JYu4CW2GcytoaDTU2stP
 T0cVVrzpI+1OifKJ49+tgqz/AUfWVrY7WTu+P8yrwBVwXvnw9yn2Md5xKl7FxJkbinCLhx3ZkxO
 NfDqJK0GP6FmbnSJ0hCnKo4ghiIWLnr+orxupwfDWTsy1dLWOLFo9K9ZEK067y7YGxMNI60GfqN
 L/Szm/BPObuIq+mXObg==
X-Authority-Analysis: v=2.4 cv=avS/yCZV c=1 sm=1 tr=0 ts=69a41184 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=7CQSdrXTAAAA:8
 a=EUspDBNiAAAA:8 a=7GgscoS1Nejt2LJ9sp4A:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: j8G55iGznUmAyIT6m6GgNGj7RBZvYyq2
X-Proofpoint-ORIG-GUID: j8G55iGznUmAyIT6m6GgNGj7RBZvYyq2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-01_01,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 phishscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603010091
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94712-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[38];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,8bytes.org,kernel.org,arm.com,nxp.com,pengutronix.de,google.com,gmail.com,suse.com,epam.com,oss.qualcomm.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,arm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D7F691CF11D
X-Rspamd-Action: no action

On Sun, Mar 01, 2026 at 02:04:21PM +0530, Vijayanand Jitta wrote:
> From: Robin Murphy <robin.murphy@arm.com>
> 
> So far our parsing of {iommu,msi}-map properites has always blindly
> assumed that the output specifiers will always have exactly 1 cell.
> This typically does happen to be the case, but is not actually enforced
> (and the PCI msi-map binding even explicitly states support for 0 or 1
> cells) - as a result we've now ended up with dodgy DTs out in the field
> which depend on this behaviour to map a 1-cell specifier for a 2-cell
> provider, despite that being bogus per the bindings themselves.
> 
> Since there is some potential use in being able to map at least single
> input IDs to multi-cell output specifiers (and properly support 0-cell
> outputs as well), add support for properly parsing and using the target
> nodes' #cells values, albeit with the unfortunate complication of still
> having to work around expectations of the old behaviour too.
> 
> Since there are multi-cell output specifiers, the callers of of_map_id()
> may need to get the exact cell output value for further processing.
> Added support for that part --charan
> 
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> Signed-off-by: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
> Signed-off-by: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
> ---
>  drivers/iommu/of_iommu.c |   2 +-
>  drivers/of/base.c        | 117 +++++++++++++++++++++++++++++++++++++----------
>  include/linux/of.h       |  16 +++----
>  3 files changed, 102 insertions(+), 33 deletions(-)
> 

>  /**
>   * of_map_id - Translate an ID through a downstream mapping.
>   * @np: root complex device node.
>   * @id: device ID to map.
>   * @map_name: property name of the map to use.
> + * @cells_name: property name of target specifier cells.
>   * @map_mask_name: optional property name of the mask to use.
>   * @arg: of_phandle_args structure,
>   *	which includes:
> @@ -2118,18 +2145,19 @@ int of_find_last_cache_level(unsigned int cpu)
>   *
>   * Return: 0 on success or a standard error code on failure.
>   */
> -int of_map_id(const struct device_node *np, u32 id,
> -	       const char *map_name, const char *map_mask_name,
> -	       struct of_phandle_args *arg)
> +int of_map_id(const struct device_node *np, u32 id, const char *map_name,
> +	      const char *cells_name, const char *map_mask_name,
> +	      struct of_phandle_args *arg)

Some extra whitespace-related noise in here. Last line wasn't changed,
so there is no need to touch it.

>  {
>  	u32 map_mask, masked_id;
> -	int map_len;
> +	int map_bytes, map_len, offset = 0;
> +	bool bad_map = false;
>  	const __be32 *map = NULL;
>  
>  	if (!np || !map_name || !arg)
>  		return -EINVAL;
>  
> -	map = of_get_property(np, map_name, &map_len);
> +	map = of_get_property(np, map_name, &map_bytes);
>  	if (!map) {
>  		if (arg->np)
>  			return -ENODEV;
> @@ -2138,11 +2166,9 @@ int of_map_id(const struct device_node *np, u32 id,
>  		return 0;
>  	}
>  
> -	if (!map_len || map_len % (4 * sizeof(*map))) {
> -		pr_err("%pOF: Error: Bad %s length: %d\n", np,
> -			map_name, map_len);
> -		return -EINVAL;
> -	}
> +	if (map_bytes % sizeof(*map))
> +		goto err_map_len;
> +	map_len = map_bytes / sizeof(*map);
>  
>  	/* The default is to select all bits. */
>  	map_mask = 0xffffffff;
> @@ -2155,27 +2181,63 @@ int of_map_id(const struct device_node *np, u32 id,
>  		of_property_read_u32(np, map_mask_name, &map_mask);
>  
>  	masked_id = map_mask & id;
> -	for ( ; map_len > 0; map_len -= 4 * sizeof(*map), map += 4) {
> +
> +	while (offset < map_len) {
>  		struct device_node *phandle_node;
> -		u32 id_base = be32_to_cpup(map + 0);
> -		u32 phandle = be32_to_cpup(map + 1);
> -		u32 out_base = be32_to_cpup(map + 2);
> -		u32 id_len = be32_to_cpup(map + 3);
> +		u32 id_base, phandle, id_len, id_off, cells = 0;
> +		const __be32 *out_base;
> +
> +		if (map_len - offset < 2)
> +			goto err_map_len;
> +
> +		id_base = be32_to_cpup(map + offset);
>  
>  		if (id_base & ~map_mask) {
> -			pr_err("%pOF: Invalid %s translation - %s-mask (0x%x) ignores id-base (0x%x)\n",
> -				np, map_name, map_name,
> -				map_mask, id_base);
> +			pr_err("%pOF: Invalid %s translation - %s (0x%x) ignores id-base (0x%x)\n",
> +			       np, map_name, map_mask_name, map_mask, id_base);
>  			return -EFAULT;
>  		}
>  
> -		if (masked_id < id_base || masked_id >= id_base + id_len)
> -			continue;
> -
> +		phandle = be32_to_cpup(map + offset + 1);
>  		phandle_node = of_find_node_by_phandle(phandle);
>  		if (!phandle_node)
>  			return -ENODEV;
>  
> +		if (!bad_map && of_property_read_u32(phandle_node, cells_name, &cells)) {
> +			pr_err("%pOF: missing %s property\n", phandle_node, cells_name);
> +			return -EINVAL;
> +		}

This will trigger the cells_name property check even if later we
discover that we have a "bad" map. Is it intended / required?

> +
> +		if (map_len - offset < 3 + cells)

of_node_put(phandle_node);

> +			goto err_map_len;
> +
> +		if (offset == 0 && cells == 2) {

... if it's not required, then the bad_map check can be moved before the
loop.

> +			bad_map = of_check_bad_map(map, map_len);
> +			if (bad_map) {
> +				pr_warn_once("%pOF: %s mismatches target %s, assuming extra cell of 0\n",
> +					     np, map_name, cells_name);
> +				cells = 1;
> +			}
> +		}
> +
> +		out_base = map + offset + 2;
> +		offset += 3 + cells;
> +
> +		id_len = be32_to_cpup(map + offset - 1);
> +		if (id_len > 1 && cells > 1) {
> +			/*
> +			 * With 1 output cell we reasonably assume its value
> +			 * has a linear relationship to the input; with more,
> +			 * we'd need help from the provider to know what to do.
> +			 */
> +			pr_err("%pOF: Unsupported %s - cannot handle %d-ID range with %d-cell output specifier\n",
> +			       np, map_name, id_len, cells);
> +			return -EINVAL;
> +		}
> +		id_off = masked_id - id_base;
> +		if (masked_id < id_base || id_off >= id_len)
> +			continue;
> +
>  		if (arg->np)
>  			of_node_put(phandle_node);
>  		else
> @@ -2184,11 +2246,14 @@ int of_map_id(const struct device_node *np, u32 id,
>  		if (arg->np != phandle_node)
>  			continue;
>  
> -		arg->args[0] = masked_id - id_base + out_base;
> +		for (int i = 0; i < cells; i++)
> +			arg->args[i] = (id_off + be32_to_cpu(out_base[i]));
> +
> +		arg->args_count = cells;
>  
>  		pr_debug("%pOF: %s, using mask %08x, id-base: %08x, out-base: %08x, length: %08x, id: %08x -> %08x\n",
> -			np, map_name, map_mask, id_base, out_base,
> -			id_len, id, masked_id - id_base + out_base);
> +			 np, map_name, map_mask, id_base, be32_to_cpup(out_base),
> +			 id_len, id, id_off + be32_to_cpup(out_base));

Again, having whitespace changes doesn't simplify reviewing.

>  		return 0;
>  	}
>  
> @@ -2198,5 +2263,9 @@ int of_map_id(const struct device_node *np, u32 id,
>  	/* Bypasses translation */
>  	arg->args[0] = id;
>  	return 0;
> +
> +err_map_len:
> +	pr_err("%pOF: Error: Bad %s length: %d\n", np, map_name, map_bytes);
> +	return -EINVAL;
>  }
>  EXPORT_SYMBOL_GPL(of_map_id);

-- 
With best wishes
Dmitry

