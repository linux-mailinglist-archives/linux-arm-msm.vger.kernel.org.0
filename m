Return-Path: <linux-arm-msm+bounces-98026-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cOu3KEJduGnXcgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98026-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 20:42:58 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A77D29FDED
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 20:42:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B3605302EEB8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 19:42:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30B983ED122;
	Mon, 16 Mar 2026 19:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TZMBzrho";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xa842Nm1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C2A1A9FAF
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 19:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773690176; cv=none; b=sdUxhQ9TNUVYuyamJmwQfI50GcXqO1SwXG/Clc90bAjUzFKAjvMXDmyCf75zZm7kgAQNsdiTNKXD2mfxd0ECHntOZRi4ZSjH/62iVw8rsWccTZMfFzs9R2Cnykc301Rr0obIul1fyfaRb2IgFL2w+BHAbfFrbF0/MixHzwWTufo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773690176; c=relaxed/simple;
	bh=8pKSoyetPXKpNKLPG0IjYbFaZYicC2/GSi26W65ckfg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AKJz+kcNja1pXUYqxN1GiHjJvq9LQ9CmpZ/fsPJ6z4NhF0mE3keohNdSHUdUfPJMMApzw5/YUn9nXvjLSJYADeeufH/7rp8FMU6Cx2BlKN8AWol7SF6qFVFkHNf4bz36QiL6d+51mxq5jwR5cGaGmIlgDxD+/jZy+o+PhI3H5h4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TZMBzrho; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xa842Nm1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GHagZQ1428758
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 19:42:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+cnQIkFDXwporw30NasLf4kS
	q8rzFR+Uzt/PemH3SE8=; b=TZMBzrho1ZI9j3MecyDJMrQhyfYnbp7F+HbgPg7R
	mqfG+xh/rvJqlW2mwKsCyVLwfzrC53QO8yBljjCYZZZjYabFv0bm9U5n4/bMcabq
	YF91ns+etwVEXWpgUnVfpVioCHWVnw7Cx0EpIQWBBbaQQV+X0Z4FCLk/ECUB2gu9
	IFz9s4XLYnswCOPX/A5G3JbjNPfwmH51uRI3xjMeiVaFLgWnjFPeSppW8kGt/5db
	2TR/0eQePYHL75VvPioyDrfUy4lTd5GC02JHxagrRGm3bXDSnk3HmHyicFSh+ZvW
	B756UKaOFmyJet8cUhVlEyPQtuuFGVvOCTwZLpwxvLTArw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxh999s4m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 19:42:54 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd7d4cc049so5402308685a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 12:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773690173; x=1774294973; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+cnQIkFDXwporw30NasLf4kSq8rzFR+Uzt/PemH3SE8=;
        b=Xa842Nm1Fyd4Si2jFjOHFczxs1o50hElsUidErWD/VLFOY1+kAO0UkxiotkMBuJ8hq
         2QgxANvdDRdjqP3CfMGgAMQ1ro+KQ6hlVnIL6J2phFeRDeYUsMwEP4rTFfZd03KaR33E
         ebdUvZ8ypi/6X6G7wcILt1jUIuG3MbfpSqdedeoSrxr29Nk7gnzexbMX5/J2ZKNFu7kZ
         BqOSMaBv6reLx46KOStKgJOQQg6NwpT3wH0/gyyki1VQ7Fsi329G7BgzUeTLDHLmGhPq
         ci0B51USxG6h9D15uyQUgWfBwZjSCpYfPwIMOuK9DzQsVdOGUSRGx0AlVLhzqHvf+d6o
         PrnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773690173; x=1774294973;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+cnQIkFDXwporw30NasLf4kSq8rzFR+Uzt/PemH3SE8=;
        b=ZFcn+WqQqRcyzo8VgXMFiex3aMruR1jkdp0fZYg/HKpsGUxj5RX1MdcE8LRU+c26nL
         iDSo6jDDrKr15PNv61LhQmB6pp+W3iwAwNWVt8PF3EET0ZorvQRYGReJ2UBBoCsbaYBE
         WwLdU2n7ZuW0syjOauO10f5lyI5N27/Y/EMgHQbRgAe5ca+9BOJGN97GBQ3ZvseDEumW
         oOwKPr7JWKNv+rWMcdjJ7JZP/oUpfkpyj9j6WFnWcJxU+4aG+LnDR1Ns+EVTb2hsoqTS
         WRBRdGVb8bzV8VBxvtnOFI7Iq11qBvtEKZ2MU9/bGi5IksAE1UuSMSlZhYUiVZeAZVMx
         rMCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjhcxARqTRrqGSwkeDeFEcZPmP7LVANotMMM/mzP4Ddguqb59UPVAWR0ys0oZw8xqUY/rdNqfc9zLE0WzB@vger.kernel.org
X-Gm-Message-State: AOJu0YxIjm3YcfqbxxvIrp1aXCkIiihed1zB/ZshWA++MhV8dZ/Lp5ZY
	RnG/EisIdEvScBFm+b8+LWjwH43ncnn5vm+lOWAvpz0Eai+Gz/EW336Np5zJsl3tPcv87j3MY9B
	hnlfmwROHSQbOkW1Hh2BzczzCBZGEmOp3YCKNcXj4/vxRlqvvtbH55065mv2Cf5O4iavU
X-Gm-Gg: ATEYQzxxF8IjQiPISC55dj1q8pvJQjqXTW7sjdHmZP7OOvVa+GjFU1/MYiS0gCcPxE5
	KIR3yQbPnb9Uiz5djPC6l+4tlpFNfvPpgOq1Zj6NXIsqBZx0KgaONT5V2JE3jpI3Y7TVMxyFOsx
	FbXgn/VfOj1n24OL+ePMHY8xHIpQJudtXLLyrSSi4YKfuxcGe9IG92klWRLXKLlw/l12EAAaUAU
	G1a1Tyjq+mr1xe3NcIU2QMWXE4U63P10YxJr+j3MObcu1cFBNE/DA7/E8ceU9dL6ubz2AvnvtZa
	L/9UobRvLPIexc4e+0M8mcmcUwhqORsyHDr/8f/bz+A88Vc+vy/tmWKTGeSlqNYkXla6AMl7LHs
	Rc330zeRpVAnPulR9BZhCE+0Ke3lJVdFrwDv0bKbGJdwvRHMNR6852ERDVqOL4MjGC2f8AagNDJ
	+xbzu/j3GG/eV/xKQ00tT6DSC5RTkyK9qd23c=
X-Received: by 2002:a05:620a:28cc:b0:8cb:72b2:2a14 with SMTP id af79cd13be357-8cdb5a4b8f1mr1825089285a.16.1773690173132;
        Mon, 16 Mar 2026 12:42:53 -0700 (PDT)
X-Received: by 2002:a05:620a:28cc:b0:8cb:72b2:2a14 with SMTP id af79cd13be357-8cdb5a4b8f1mr1825082085a.16.1773690172393;
        Mon, 16 Mar 2026 12:42:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a155f33be6sm3676665e87.7.2026.03.16.12.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 12:42:51 -0700 (PDT)
Date: Mon, 16 Mar 2026 21:42:49 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Richard Zhu <hongxing.zhu@nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Marc Zyngier <maz@kernel.org>,
        Juergen Gross <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Prakash Gupta <prakash.gupta@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        imx@lists.linux.dev, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] of/iommu: support multiple iommu-map entries per
 input ID
Message-ID: <z4eqsfnxiprfktxi5g7miqqukhjsqqbivs4jqmox6r75x6pbyd@hgtkiy3ltyzu>
References: <20260315-iommu_multi_map-v2-1-51b98cb79331@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260315-iommu_multi_map-v2-1-51b98cb79331@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=RJ++3oi+ c=1 sm=1 tr=0 ts=69b85d3e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=b47Md4NF8ZsVKqcXDakA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDE1OCBTYWx0ZWRfXxJIq1TELN+/B
 DBFiGCUm40YNCd7RvVFBYu5HtCXV1BTkJiOmTDhYGtdCXzTw/MzDZ9wK1Qin9kmHirWnRAuol2A
 K2vsHn97ic7fi83HPCobcxSLBa161gzUP5gqw/aKocKW71GPacu1gT8tSzUf5o8Jhm84iPIxgpD
 gjlTGTIMIrsDqHHZ7+RF2fse7g5gd/fZZzuCDztiqiq7uecg5RDX/odaHIINIGcChKnbi/t1HKu
 qzskP0w66BbM4dkO7XXdXGTPptvZQBqWnwkLmcbaZ1JzThxnhfTMaieVgrpi7GAkYUXIPfsyIKj
 NElRFFCuWd6TzVcIK/JdYxD9/O8/E7srSMVrg1ar9vcfnJPn1Dz1SrngY1rOeetDRabka9Ipb/y
 55WsvJLKGondH3vBmlHhoJuGmSY0iC1LsyywXhG0CdcAXZXZvDRfI0zVtZKcDU26U0/0qmcSu02
 F0iF9+5TzQKBprB+HNg==
X-Proofpoint-ORIG-GUID: ZbxLtJAgpgX3RM2hOFaeV3xXAIqfzxJ3
X-Proofpoint-GUID: ZbxLtJAgpgX3RM2hOFaeV3xXAIqfzxJ3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_05,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603160158
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98026-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[34];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[8bytes.org,kernel.org,arm.com,nxp.com,pengutronix.de,google.com,gmail.com,suse.com,epam.com,oss.qualcomm.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0A77D29FDED
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Mar 15, 2026 at 10:37:43PM +0530, Vijayanand Jitta wrote:
> When multiple mappings are present for an input ID, linux matches
> just the first one. There is a usecase [1] where all the mappings
> are to be maintained in parallel for an iommu-map entry of a same
> input id.
> 
> Add a next_offset iterator parameter to of_map_iommu_id() and
> refactor of_map_id() internals into a static helper to carry it.
> Update of_iommu_configure_dev_id() to loop over all matching
> entries to support this case. All other callers pass NULL and
> are unaffected.
> 
> [1] https://lore.kernel.org/all/20250627-video_cb-v3-0-51e18c0ffbce@quicinc.com/
> 
> Signed-off-by: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
> ---
> On Qualcomm kaanapali, the VPU hardware has multiple internal blocks
> that generate different stream IDs for the same input ID. The device
> tree encodes them as separate iommu-map entries sharing the same input
> ID:

Vijayanand, even I would not understand what you mean here. What is the
"input ID". Please describe the issue _exactly_, which blocks, what do
they genrate and when.

> 
>   iommu-map = <0x100 &apps_smmu 0x1940 0x1>,
>               <0x100 &apps_smmu 0x1a20 0x1>, ...
> 
> This requires multiple iommu-map entries per device.
> of_iommu_configure_dev_id() currently stops at the first match,
> so only one stream ID gets registered with the IOMMU.
> 

-- 
With best wishes
Dmitry

