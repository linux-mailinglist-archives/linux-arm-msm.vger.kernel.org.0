Return-Path: <linux-arm-msm+bounces-97249-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mNVTGz3LsmlTPwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97249-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 15:18:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 142BE2732E7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 15:18:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A40B1305B280
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 14:18:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE01B35F5FB;
	Thu, 12 Mar 2026 14:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pC9s3oCR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dc2y/T8P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C7C5356A0A
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 14:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773325107; cv=none; b=c8eRkyHyBSa2FSaLFUl08pFDnpFlfTngJVAkapoGfPVZFB0476WnE4dqhStTNIp+d5aE35ROld4ryGDfxX1E8S8f2P+4clIzAxw0Jf19f03HHu2dGiq/TGHRe1698vnKgEPxK4EaMakuPHToV5tpvd3eaKzKWxSg5o00Su34Mxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773325107; c=relaxed/simple;
	bh=WBp6aG8OIPb/dsUpez1Ic8Jytais2oVJHc39FfdijWw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UK8muLSi7xYuDyECKA/J7IQ9cxbVk1fPddxUFyPOs0Eqh8lYcROMr7SBPzjoO+sUY/D8KjG2avu5+nDeZweHRSjtho37PR6AiWz4eyDqN4+u13yUtmTdBtWCvcJfDG/qKehAmTWDxq9D7/YON04x+GbTYic9uu8N921YPv1WzJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pC9s3oCR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dc2y/T8P; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62CADixE3666503
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 14:18:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y7xFTGXb5DPsTd4oxsCvF8mg+z4yb1CrqE2iNac3ooo=; b=pC9s3oCR3E3pJGcF
	6UBJOzneozRH8yHPflsxqstBz8NmkNtzIcCOMzWl7Mf8bniEEG3tg1o8Gf6eOER8
	iEH5SI48La5x3ShD7d2U00BqfTQnGC86RMZBVy2//Y+3lQg8W+seoMLrQOG0EE+z
	dNM8ykzfkh7kNSve4jqCX2isXmsW6au2z2aD2Vl0RhkvgqBsHAjer2W60uOZM/ou
	G8q60QJZpk6R8OE+8EDLj6gFvBCIXS+427OcZgRvCgssFzBbiFfuWMcbTcw+C5VY
	9kymaHldyvZ6go56cowbutM/NN/MqcTN7b0pv0p53rwa2PzV2geT4iFmeTzVyLMA
	ChezqA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh60jcdf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 14:18:25 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-5fa75a19f21so17924526137.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 07:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773325105; x=1773929905; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=y7xFTGXb5DPsTd4oxsCvF8mg+z4yb1CrqE2iNac3ooo=;
        b=Dc2y/T8PUdGZ77A6bD1LCjGXqRDiPTOvhNJCiONItrO+WcQKcl4rs3n/qMfmzKXR40
         mkh076zDmK7Ep4gSAkIb81xzslAkIE3cPZFExcxbBQn1BUXaUk7r+Dhg49GAYMs0IVAg
         81R/V9a0SkrnIa4IvZ3b25iVUm248FkAvzEyllQ6tPQvKec/dvXTHxEdbQaJ9b6/ZDUj
         DhWXtlzl3agxAhdjxxgYwf3CRAofucC8uaJcJ/cDm3fdV/5E7E4kPXClqoGLSCEOx+Lw
         T+USk6/KRigtzWDYnktXywGmLvDlKhUxHT62d15FlrwMG2g20eHdFud0Z56gj2D1GaCA
         pOYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773325105; x=1773929905;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y7xFTGXb5DPsTd4oxsCvF8mg+z4yb1CrqE2iNac3ooo=;
        b=i0vzdjGKPG5f6ycbEz1n87khGfImnvkRvAr/qOw903GGSJi1CsMAmWe99yeOv5LTMg
         TaaEuWtumKKgyxDhwfmHzt26LJxn4pa3QqX5cRRYU/PmdJnjkyaXnq3HnyGgquSrcSVt
         o8q8CgjoleYfE92NVdVKHRR7XcmBRAYNoWMN6Y6s3cJbC7u5Pyk6xvZwbdFrpsVudIcr
         0Pl+TFqkuwll2SqmPrgx8/vSnyAy+XiDzUxlONu5b102n9l3kc6RAay/y6w2eZ8Xyhuk
         PKdamygwwiaK8/itfHp+zgbopLF4qTZxe9CLx2gWqqpe2SRvhRjmSDUjODrY5/NR7IRd
         4vNg==
X-Forwarded-Encrypted: i=1; AJvYcCWStHIcN3MKcnhI6V5hdz4adxBqu2lVoI2jPbXjbH7URetVUN8fSFETDZN+q5pCcang09/aijZCOJPCuOvw@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/NXCupo16lmIXGoEoiKmSpyA7aVzfTwkqiCXa1IYv1/PepAfv
	u4a8Euo+z4ZSaJQNP1UYwz6KXDdGUGER285c3DC2jaMqkfiVquczSHQfIJEE6ZP7qB3qGSmFGTt
	XCzrONup8jluNxmdwo+ECX0e+pmkIhxkLdXzBPfhM94l7iyB5AjHn2Y2GGNm/NdJ4LDBh
X-Gm-Gg: ATEYQzwe7j49eJmjqADUaGd8rahL/3E1B4yordKCiqg/UDMkUMo0ZnuCqttA2RPmvr1
	UABF++sAWnrI+IS0xnMr9vCovI0z+4KmWNZAMzQVkjOg+rBGAmEyg85ZfSi0I028P0WQGoVZiqN
	RzribFa+m/PG+2YU94mCTW1bqH/9uTFjbWlm36OKfcXuwroRwWXTbNnKcwJA/ilSOtYC19vL0+N
	WLK9deftV2F24vTRzlaovBq6q8iNX6zJdBIM43kMzxBykZG02NqNz/Y1MfbREtMAh0LDQXZmzFp
	nvR8QG6Xh85i+KDcfr045F8g0wM6AxlRW5SFmtnNrGpa0hRE9WbgCO3wZrExKTdsvVDjIPACnsF
	2ghH4jYzF6Cjbbtuzw01cwEpZtOCrFKS7eHA84jWET1SRtmWfg/LFeVYm8sQjANeeqfvlSw3j7I
	aC2aM15u2NyHBgar5KeGSjL7L6gLjzeCqBZKs=
X-Received: by 2002:a05:6102:f11:b0:5ff:eaf0:6e77 with SMTP id ada2fe7eead31-601f4a44a79mr1406618137.17.1773325104571;
        Thu, 12 Mar 2026 07:18:24 -0700 (PDT)
X-Received: by 2002:a05:6102:f11:b0:5ff:eaf0:6e77 with SMTP id ada2fe7eead31-601f4a44a79mr1406556137.17.1773325104042;
        Thu, 12 Mar 2026 07:18:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a15602e268sm977710e87.21.2026.03.12.07.18.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 07:18:22 -0700 (PDT)
Date: Thu, 12 Mar 2026 16:18:20 +0200
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
        xen-devel@lists.xenproject.org, linux-arm-msm@vger.kernel.org,
        Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
Subject: Re: [PATCH v10 2/3] of: factor arguments passed to of_map_id() into
 a struct
Message-ID: <dyjdwxaq4oc7ahri3iuhnmobh3gwmn6drhox7t2elep4rlqhuq@fe4gp5t7q5r5>
References: <20260309-parse_iommu_cells-v10-0-c62fcaa5a1d8@oss.qualcomm.com>
 <20260309-parse_iommu_cells-v10-2-c62fcaa5a1d8@oss.qualcomm.com>
 <esfzpgpgenydif2sxahsetkglz6kewsgjhkmzr6ulrrkctnkbq@a4zsfdmhbxui>
 <27edd195-b0d3-4214-9df3-74a84da1e3e1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <27edd195-b0d3-4214-9df3-74a84da1e3e1@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: xdKW4nKjptDLDWZfvSElDWulTngW3FPl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDExNCBTYWx0ZWRfX8ttswEADuT1C
 MNdrTs6sm/6YcToS4SP331QJRv1WxOb0ZCIxZA8DupqkUJ8kSan+9ctvYUXAgqf/vsOi/vJwdP0
 wNsFGDrs1tQbDlzdNPmZeBfMDk+ouXhFzzl+LUxS87b5pjx1vlJCNfqekVoSF3J7a4YpTkgL6xY
 wIG11+GmrjJwqC2Bpel8lWFh4aptOfx2eNg5zKREuZ5+bVHrZmdTxXa/KYyQqAVbPBZc7v0cDlR
 zNXjaxZDiIgwWuK1TWle05WjZOkMayStK0AN3fm6mhlG1w0evNfsMPef/QO218mx63QZe5j7WYt
 WCDL+oCTG5plKIrRPvEkAvkj8fIwDEpI/FspYsOlVW3AIAT+l44LCilJLdd/0bkAIS4KL/7OYS4
 xHTyz1eTKhz+DhdjrpGPkDL0dPaEb1RF1e+mqng15Vl4oj5FUKqxk4FulmwyDOAMgEej7BVDkzW
 VYntRDttwEEvO3dT5Jw==
X-Authority-Analysis: v=2.4 cv=DsRbOW/+ c=1 sm=1 tr=0 ts=69b2cb31 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=KPxCMH61eqygQ3DODZ0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: xdKW4nKjptDLDWZfvSElDWulTngW3FPl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0
 clxscore=1015 bulkscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120114
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
	TAGGED_FROM(0.00)[bounces-97249-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[38];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,8bytes.org,kernel.org,arm.com,nxp.com,pengutronix.de,google.com,gmail.com,suse.com,epam.com,oss.qualcomm.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
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
X-Rspamd-Queue-Id: 142BE2732E7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 12, 2026 at 05:12:51PM +0530, Vijayanand Jitta wrote:
> 
> 
> On 3/10/2026 2:53 AM, Dmitry Baryshkov wrote:
> > On Mon, Mar 09, 2026 at 01:03:38AM +0530, Vijayanand Jitta wrote:
> >> From: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
> >>
> >> Change of_map_id() to take a pointer to struct of_phandle_args
> >> instead of passing target device node and translated IDs separately.
> >> Update all callers accordingly.
> >>
> >> Subsequent patch will make use of the args_count field in
> >> struct of_phandle_args.
> >>
> >> Suggested-by: Rob Herring (Arm) <robh@kernel.org>
> >> Signed-off-by: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
> >> Signed-off-by: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
> >> ---
> >>  drivers/cdx/cdx_msi.c                    |  5 ++-
> >>  drivers/iommu/of_iommu.c                 |  2 +-
> >>  drivers/irqchip/irq-gic-its-msi-parent.c | 11 ++++--
> >>  drivers/of/base.c                        | 63 ++++++++++++++++----------------
> >>  drivers/of/irq.c                         |  8 +++-
> >>  drivers/pci/controller/dwc/pci-imx6.c    | 16 ++++++--
> >>  drivers/pci/controller/pcie-apple.c      |  5 ++-
> >>  drivers/xen/grant-dma-ops.c              |  4 +-
> >>  include/linux/of.h                       | 12 +++---
> >>  9 files changed, 76 insertions(+), 50 deletions(-)
> >>
> >> diff --git a/drivers/cdx/cdx_msi.c b/drivers/cdx/cdx_msi.c
> >> index 63b3544ec997..03232b5ffbca 100644
> >> --- a/drivers/cdx/cdx_msi.c
> >> +++ b/drivers/cdx/cdx_msi.c
> >> @@ -121,6 +121,7 @@ static int cdx_msi_prepare(struct irq_domain *msi_domain,
> >>  			   struct device *dev,
> >>  			   int nvec, msi_alloc_info_t *info)
> >>  {
> >> +	struct of_phandle_args msi_spec = { .np = NULL };
> > 
> > Why do you need to set it? Parse functions ignore passed args, don't
> > they?
> > 
> 
> The parse function does check arg->np on input — if it is non-NULL,
> it is used to match only entries targeting that specific node.
> 
> Also, there is this existing path in drivers/pci/msi/irqdomain.c which
> pre-sets the node and passes it as input to of_msi_xlate(), so the node
> pointer is not ignored by the parse code:

Is it only being used for MSIs? If so, can we make that explicit in the
API by having the 'filter' device_node pointer?

> 
> u32 pci_msi_domain_get_msi_rid(struct irq_domain *domain, struct pci_dev *pdev)
> {
>         struct device_node *of_node;
>         u32 rid = pci_dev_id(pdev);
> 
>         pci_for_each_dma_alias(pdev, get_msi_id_cb, &rid);
> 
>         of_node = irq_domain_get_of_node(domain);
>         rid = of_node ? of_msi_xlate(&pdev->dev, &of_node, rid) :
>                         iort_msi_map_id(&pdev->dev, rid);
> 
>         return rid;
> }
> 

-- 
With best wishes
Dmitry

