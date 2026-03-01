Return-Path: <linux-arm-msm+bounces-94714-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IFWoOhUcpGnSXQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94714-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Mar 2026 11:59:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7767B1CF3CB
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Mar 2026 11:59:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 87683300682E
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Mar 2026 10:59:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09D5B2E889C;
	Sun,  1 Mar 2026 10:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZbRtpKNV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FNjodZfR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D815E2E612E
	for <linux-arm-msm@vger.kernel.org>; Sun,  1 Mar 2026 10:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772362770; cv=none; b=iE+9s4QAbOji48ZxieCy798C/bVkuyHEjZnlBq+GKu8mBSNDWZysRWut82ATQzA+32+nf+r/ohztX7Nzdq7Gqi0lu88QBnKDDK1DKwO1VgMUoVAJWd9ANz9nDsW88zpI5gfcDltM/IDHnqMpLErSrpTOVOLMAscvpmZi5O3GJ5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772362770; c=relaxed/simple;
	bh=ma5KFEqHslgRuuIwDm092krRisjxb/PVQ/WF+lX7RAM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P1uqcTY/08/syHrAT7v/tioq+TU1C/Tlc9pEa5iO5+gf6lefGE+Juribl4DM+CDkCdtshrjlEQotB9fAGfXJ2H9jiteTRVN8qybVRuFSEZ6KKr6ccI2T9byNREiF/5ADjCc5AD+TrJOnZjT9PJknU/5l/vmnxo95SqZyEsGGCi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZbRtpKNV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FNjodZfR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 621AhKmm993989
	for <linux-arm-msm@vger.kernel.org>; Sun, 1 Mar 2026 10:59:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tWvbzoSirp2+/mfj208EVtuC
	kSsURTVI0XL++QIzXe8=; b=ZbRtpKNVrLZlATBeln8U+o1HVMJ1NJFODQD2g1Xt
	5zqmD26FEi7oT89X6dB/3Kf0XkkF6A8sXLJiy6k2cdCfTElYXz+CjMK5FIy3AQPe
	xpwFsAEbry2aIJz+ovYfTdhNnokCCupYZNrBBmfiE6N5iXxEnaecxqJfkBq7jA6g
	atxv+7P2SKJ+CThu9PnqyE+e14r5zyxB6+fChJWyb7bmsbhO1nbIl9sdXtyQ92aF
	9NNtP7wU75FlG/y0oxLuqIE1sXvncry7ovuFrwD64sbYiUvq0bz1X2QeTCCuTyIj
	PQrXowySKFMO/mebdHFA3zvBB6060oQ2+M3ZZuPrtLkY+g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksgq2kqj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 01 Mar 2026 10:59:29 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb3ff05c73so2929093885a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Mar 2026 02:59:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772362768; x=1772967568; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tWvbzoSirp2+/mfj208EVtuCkSsURTVI0XL++QIzXe8=;
        b=FNjodZfROy8PDZ8894bTGs3Y3BWNGtnrD5haRrzP61itCm0bPjRxDe13g01iYiNRCq
         Q6qkdKSXweYzT10IDgSp6A9f/oZFntmUky9Y4fhPB8ZUKH5vE1VDlNR8kx16Vw1LiZHs
         7ASk5gmBkK2LWE/6uWxWvYG9VkyxZu5UCxHkj9z+7MLNcC9gF+yls+5MD7bFp0odipLB
         8o0+poh10AVUi3gKRlMvMOMI2uSWRVzH3yGbSsWVdgl9IztKfUB9yHdQMSizsEiuoLu4
         Zx3xmT8m4TbOiT6ZWV1z0lH46ARFTadI5cQqNFTvCKQbS4VedMFCeECn5J4PSbJ3RxCy
         QOig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772362768; x=1772967568;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tWvbzoSirp2+/mfj208EVtuCkSsURTVI0XL++QIzXe8=;
        b=SDWHrTUPN6yHXdyWO8rGqjRAbgvyHkOwt1IPwfi5vsxW9YFKPK5smopDvOlCiS5kpY
         wCNL/bhnC0Pz6W+qVY0vF+11rBNbeuDWqMGvdevLTSU5kOB+/NDLXWTe4+fGI+jS6pxP
         o3wZJ6wb0h33k7MFGsyMvFYbCttJvmOXzOA9XPufIOXKs0qU40DQU41aHJQSR87hdygf
         4XhPKHnU9wX3FJxBHgmz7Fp6r5isBv3XGDLpgIO0M2LG29RCjamKL2erTp3P+bh9anuL
         L98MLeka8VA1Qn1Jikx7LTGFlEr1j9DrA/RM34JZyw7ut5WoAoAaTAS2VK144LuFqTn4
         8/4w==
X-Forwarded-Encrypted: i=1; AJvYcCX5oMbq463Fu/sRohY/t9yVd5vgjVC833jDzooIw8aPLj0eHliax7NV30+wiUzNmrV3MSAwv2Z64HRac2q+@vger.kernel.org
X-Gm-Message-State: AOJu0YyDq3VYTAqKmnsd9XzRu5ioxVU6kfnWnZDKW8bq0D579SurMNK6
	2udeGKJntS4IfApjtoFXnTp1wGdAEVIvRjaurtGm408gixjnWFpgvo19uvNzPn76t+fTVqv64Ej
	P9ETjpVHlb2VOiW6RjCMKsPtYzCb/p8HOF3Zu2E325vUTP0CFSHjRAx6gwGVGPLDfeXNNpy0pDD
	i3
X-Gm-Gg: ATEYQzwC9tKddDQwcy3LpxNlwxMA1e1IlxezDgouOqQKtBzCB5C5FNNRcq0YBsgBTzT
	2Jn79DKbiMjIP/FKflb279UIEV2tqEPgN4F/KXfysuyOxwX3pa+p9gtgNV7RO+JBbHbFi59EfBC
	mZAkFVURw38suKs5JasBiMpn0EID7cE5UXBj1mfXWMdbPY5weCjTxdwO+snbmowi98GaGwhI6LE
	mYaJFzvwdhuH57rTNYNmcMOcDC3aZJ0kd+sxxukc0JTEUg/5k7qj22AKX06NhxwgMIT53e/96I+
	fe4TUlqNXF7ojizgVcaNg6KOdX5lL5Z1WC10kWXBrwuxuUh/fpln4+Cs77SZqCWoauOy2j4jR5E
	PTa8Q/xV9acEq70wgizqmEe1OuduTle/6CwupXX/eaFChn7JxQFV+xp7xfZHudGJI268MvuuVdw
	VE331Gj7ET9WXxdqTSxjFpP5HgOLN4pQJ01jo=
X-Received: by 2002:a05:620a:3949:b0:8c7:1b3f:7d0c with SMTP id af79cd13be357-8cbc8e55216mr1090394685a.16.1772362767947;
        Sun, 01 Mar 2026 02:59:27 -0800 (PST)
X-Received: by 2002:a05:620a:3949:b0:8c7:1b3f:7d0c with SMTP id af79cd13be357-8cbc8e55216mr1090393285a.16.1772362767407;
        Sun, 01 Mar 2026 02:59:27 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a116de019esm872280e87.3.2026.03.01.02.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 02:59:26 -0800 (PST)
Date: Sun, 1 Mar 2026 12:59:23 +0200
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
Message-ID: <bo5kb53hrzvl6e5mctvnpqluobdgbpq4x3m5ca7mwtfnl53npw@7axqsph2vyqd>
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
X-Proofpoint-GUID: fn6OhKenJlZXw01g6QoIZOAjgZrqRaOl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAxMDA5OSBTYWx0ZWRfX115kuuy1uGxV
 qfj+SZO9jGT2zVR1/DunOxZxLyOID0tGCOt4Nu6w9fZL6OKVgXtQX7gdHaVpA0U7a/rW7MNae4o
 3n9IQEuEkYDPrSm87NxVwmmeq8YqO10k6rSDMEeA1lYfK9hZuC+G9THcexkW8kxe+Ibd5I1MvGB
 w4nY2t+pxZJVevMfEdoAV7zPzPA8/NcuZKvUyBRjFo0s320qloePrVOkuNg+Qz1aOglrcNkLNs0
 zMl80Djk2iJzWA5jA93DingttVgdNm90MCS8IRi986ZunpGOO9WPNBdxNu/Ob8FBt//kZaCF/2x
 TYO5Uji7NRewJFJrsTQ5/GTzn2M/JSmCkxBFelGhoIi3NPCuJ7urPEqCwgsxfZHuJyMy3/vIxgX
 FfraRMJSZDUbcbuaAPqz0GAsg0VXdvZKVQcxu70hZFk9uzaX6GqALBLVqc1xGhP4/P1oop6gShE
 kKz38H4v9yqWt8DgkcQ==
X-Authority-Analysis: v=2.4 cv=bdRmkePB c=1 sm=1 tr=0 ts=69a41c11 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=Dq95N7oyZucg39lo86YA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: fn6OhKenJlZXw01g6QoIZOAjgZrqRaOl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-01_01,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603010099
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94714-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[38];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,8bytes.org,kernel.org,arm.com,nxp.com,pengutronix.de,google.com,gmail.com,suse.com,epam.com,oss.qualcomm.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7767B1CF3CB
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
> diff --git a/drivers/pci/controller/pcie-apple.c b/drivers/pci/controller/pcie-apple.c
> index a0937b7b3c4d..e1d4b37d200d 100644
> --- a/drivers/pci/controller/pcie-apple.c
> +++ b/drivers/pci/controller/pcie-apple.c
> @@ -755,6 +755,7 @@ static int apple_pcie_enable_device(struct pci_host_bridge *bridge, struct pci_d
>  {
>  	u32 sid, rid = pci_dev_id(pdev);
>  	struct apple_pcie_port *port;
> +	struct of_phandle_args iommu_spec = { .args_count = 1 };

Hmm, I didn't notice this. Parsing functions are expected to ignore
of_phandle_args before the parsing. So passing .args_count = 1 is
strange.

>  	int idx, err;
>  
>  	port = apple_pcie_get_port(pdev);

-- 
With best wishes
Dmitry

