Return-Path: <linux-arm-msm+bounces-95468-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sM9SN8DEqGlaxAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95468-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 00:48:16 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 728512091E2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 00:48:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9FA373047DE7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 23:48:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF88C383C8F;
	Wed,  4 Mar 2026 23:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aVdHPngs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OYXXn9NQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1136221D89
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Mar 2026 23:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772668092; cv=none; b=JYLiGQ9wQsQ+zTth9MRaZtDiGwbJc/KBVdLf/JZ/m2iSem52ZZHqsQ1Ta1zR9Z6RCYjxaNSy9mIeBIR+hwqKRRa+zqdLwRhRBJjstzBkAxfeOkhzTQ8YS5ePtNWBWVHoalPzaXABRyGglcbK4LkJI+7KUQ+1FTHcEVOVexRIyzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772668092; c=relaxed/simple;
	bh=iDgzPdTfY/YmV2gOcRHkK0iaClE0CXMdo2FdxhnA42g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HbibfVNSajVzmrWhrLo2RrTinDRhDLQQB9FGNNQs8gzZMAh2ZXlyog0ASw42m+VKJdurnxKhU8efl9XM/14I7TxpqSNEMskDyhkzmkOYVO9flpN7nWWIo4f/an4aEOytSRoPscseEs9b/7QwwZyJfO/Hl4G+/sWrPWP08aOdvz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aVdHPngs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OYXXn9NQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624HHnTX2612150
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Mar 2026 23:48:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UJZs6BbEFPW8OUhQ3kN9LgfRkepS1RZtU3P9VDciA7k=; b=aVdHPngsjbyqgrIW
	m0MJv9aGvPSOv7JHKGUvwROWy47iUsBdiQmtf8e0Vc2Bz3qNf7NAxjbYrjpXQhaX
	EKCyjBQQVy3MK7f/jU4u0nknS/GaC6/sGyDa+XlKtdvBgiyRJ0lbzrrfNrkVMuBh
	f3euURbkqHuLnHx12azkHWv8cwQiOUvW0nubrOJYqPhT8oL5TQ+VQUCQ34e+5xE5
	9M3r3YAGA6/v6aUxLAxzIZ37vMVDkG7+r5SY5xMSNg+q9Wppsol1jYxs64OOMeaL
	dhQKmoQFsQ/I5gNQKL8MQ2Os574Lbh57rptn8P8Aj4ezUttSie6dKLNuheXOOduW
	hmaQuQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cps0w91em-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 23:48:10 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb37db8b79so5399756985a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 15:48:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772668089; x=1773272889; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UJZs6BbEFPW8OUhQ3kN9LgfRkepS1RZtU3P9VDciA7k=;
        b=OYXXn9NQfPbFs9LCIRigC7kTS2I17H90sUu63cZCYTj36gi2b1JuyDgQsIc6bLIVRx
         WrQewGlTlkA14HfsCiBPXZjufZWdwgbpMoE19cJfJ3M2cO6+JbpeionWlstuuq4YzBLt
         ThQ7iUjbAUVNJ+1rREcgb5Lc6r3CMim794QSXaqONEyAjijqYoUDT6tWdGxjg38cRCM5
         Jkd4pKHQ1YL3O3GjtsubC6jgf02Fo2Um86lcrO2KK5e6nJHFw4N7VqBLWllkbHUY5GPY
         3o1ZWluBuivpzjPNfxtVrokLGLtzrT1lgl6JJOBfQZ5yJOB97minWnARbpAT/f2T/NJv
         6bBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772668089; x=1773272889;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UJZs6BbEFPW8OUhQ3kN9LgfRkepS1RZtU3P9VDciA7k=;
        b=I6M6K8K7G4Nvvm5oqwbXNKamwZiuYUVpe6EJnwNZ7N4zPXgo/i2+2AzK67hQ4YaHCp
         g8/FDI4kZxfd743WrYb5yAJlZ4QIA1XefoofW/h1B1cNgx5+sM+lDo/fTsc+H8TnmFIP
         wISe/zuNfxqBOg8n2Ge28jHZF4SVo9qIQp6Xj5HzqMG7pbUE81WPfmFnbF58KBfm2J3b
         ypxeluz9um3UFxe3wl3K7U5oppk6g6FSQVv40L43okYggYcvX9X8RNltzoo7NCclW0TX
         xfPRgqF7atm8o1Kya1yfyZXmQ4OkRh3gA3zd+i82MoK+6k8nFZsjlsPWYUdeQL6TnLPj
         KXDw==
X-Forwarded-Encrypted: i=1; AJvYcCVuqRBzX8l6Vj9UCB10r0bt8j90hQ5HjOIaKqHzmRwXHk6U1wTOFmLfj4jbCJhUlSlNvL725ScOhppc3gRB@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2Xk4R4fg3qtHNtu8QNvFB1K+sNzL0OCoRwJ6Y9+6yFo4371Ai
	/Bm6X+DxUegXE52sYkc/DYo4NhqZjHEL3azaqqFQMMc2QnM8+guRNQ8qIKvqET51aLxOgccaunG
	9Ry3/2Q2RP8dJAbK2T1eMQpf0AlOQFWUW7yqKQtf7lRSsRpfySURdTnhRsOE6fBL08Sfo
X-Gm-Gg: ATEYQzzA9HbQm3fYD3bh9E0jzw+hGBtpkzlQhUKSgTksDQfYXzomFfzNZe2ZTABBS50
	0UCqcjD0Z9nRycEEhml91SAXL9dIsVe/XGeh+GgCIWhL8IqDvmnJKe9MXkH7D4EsaYztJFGXZqw
	BlJhf/cTUWxl72/5u3M7S3eJfKLoxyH5n5YKFop5f5yQFCWw0v+SGAz8kyTFXg3JbGoFivI8H63
	Sk+9SCyI6XitqIOa6Lb+hIqAd1BPYrAiIsLfyF3r6f63l7ywrvh/T835LtJert6JaaMMQENd7q3
	vdx7QES4jslWToydnO1pOO6T8km3Xkm8CgPToUj1z/ICph2Cy6om4AxlTFJ7jlMPzUtOZany7n6
	Qr8vwy+BV02+ZLXfBbGhnzGOgGeuSubdablIuS8Qxnz7gCIkXrI8scidocJnpVqYE0Yt7ZOC12e
	bw0jhpKtEB78Us7N3YCjXte/YpeFqwk1v3sV0=
X-Received: by 2002:a05:620a:460b:b0:8cb:7b27:9336 with SMTP id af79cd13be357-8cd5aedbea3mr527939885a.5.1772668088894;
        Wed, 04 Mar 2026 15:48:08 -0800 (PST)
X-Received: by 2002:a05:620a:460b:b0:8cb:7b27:9336 with SMTP id af79cd13be357-8cd5aedbea3mr527933085a.5.1772668088325;
        Wed, 04 Mar 2026 15:48:08 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a12357fa9dsm1597108e87.33.2026.03.04.15.48.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 15:48:07 -0800 (PST)
Date: Thu, 5 Mar 2026 01:48:04 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Cc: Marc Zyngier <maz@kernel.org>, Nipun Gupta <nipun.gupta@amd.com>,
        Nikhil Agarwal <nikhil.agarwal@amd.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
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
        xen-devel@lists.xenproject.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v9 1/3] of: Add convenience wrappers for of_map_id()
Message-ID: <iuy4mdv4hr7qdem2zm3yg5eostdhlcta6tifqasyov3ag26yje@huragoeossqf>
References: <20260301-parse_iommu_cells-v9-0-4d1bceecc5e1@oss.qualcomm.com>
 <20260301-parse_iommu_cells-v9-1-4d1bceecc5e1@oss.qualcomm.com>
 <86342janlx.wl-maz@kernel.org>
 <d3687764-024d-4dbc-9342-8edc9b4f1fdd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d3687764-024d-4dbc-9342-8edc9b4f1fdd@oss.qualcomm.com>
X-Proofpoint-GUID: _hzdhSG00pzJ26hZQ94r2Si7seg6RFLN
X-Authority-Analysis: v=2.4 cv=BNK+bVQG c=1 sm=1 tr=0 ts=69a8c4ba cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=7CQSdrXTAAAA:8 a=VwQbUJbxAAAA:8 a=8AirrxEcAAAA:8 a=srtYxZOELw0pIWJIyL0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=a-qgeE7W1pNrGK8U0ZQC:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDE5NiBTYWx0ZWRfX+0a/L9o5qFMI
 llUnzvLmTUeM5u3z0Bs9XlI2NY1wSB2I3/Ts+laNlrCMC+4Vafb5Us7caCA75lrCTcz2GIBUbBX
 BfpYJsAYY3OWjP6pd7ncLp1T7lwkNlaeClt1NYqnGWREGkV0Pcg8YzBSJGaWnF8HQC4GvoZEVuI
 ggpN1EbCPsY0lBnkxmBs7LgBuK2xT8fd6OH8aEXjk/4A3xQvLLDKd1lbCAK8HLb/v3WsBslH0I0
 gomYNTNOh1xXvQ3k/FdsBNeoV1tsC7b7D3YE4YFRq5s/9BzfZPOtBDP/VxoGLUxO0V/bkbqtWTh
 +LGDCnCwLgJQLvvquIwSxeX41aXyzGMUkNnvDa9O22l4AVzCz2xAB0hhRlTZWHPo8TMQMb6pEWq
 4lgBROpB3/RFP/xoihS4hXKSvVZ3BVv0PUuMpNRJi9Jx/X92wsy+cbHX0PPuoeJ/8NFnkyC11+i
 +9qXDJHt6Ehj7T8W1GQ==
X-Proofpoint-ORIG-GUID: _hzdhSG00pzJ26hZQ94r2Si7seg6RFLN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_09,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040196
X-Rspamd-Queue-Id: 728512091E2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95468-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[37];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,amd.com,8bytes.org,arm.com,nxp.com,pengutronix.de,google.com,gmail.com,suse.com,epam.com,oss.qualcomm.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 03:02:14PM +0530, Vijayanand Jitta wrote:
> 
> 
> On 3/1/2026 3:16 PM, Marc Zyngier wrote:
> > On Sun, 01 Mar 2026 08:34:19 +0000,
> > Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com> wrote:
> >>
> >> From: Robin Murphy <robin.murphy@arm.com>
> >>
> >> Since we now have quite a few users parsing "iommu-map" and "msi-map"
> >> properties, give them some wrappers to conveniently encapsulate the
> >> appropriate sets of property names. This will also make it easier to
> >> then change of_map_id() to correctly account for specifier cells.
> >>
> >> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> >> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> >> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> >> Signed-off-by: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
> >> ---
> >>  drivers/cdx/cdx_msi.c                    |  3 +--
> >>  drivers/iommu/of_iommu.c                 |  4 +---
> >>  drivers/irqchip/irq-gic-its-msi-parent.c |  2 +-
> >>  drivers/of/irq.c                         |  3 +--
> >>  drivers/pci/controller/dwc/pci-imx6.c    |  6 ++----
> >>  drivers/pci/controller/pcie-apple.c      |  3 +--
> >>  drivers/xen/grant-dma-ops.c              |  3 +--
> >>  include/linux/of.h                       | 14 ++++++++++++++
> >>  8 files changed, 22 insertions(+), 16 deletions(-)
> >>
> >> diff --git a/drivers/cdx/cdx_msi.c b/drivers/cdx/cdx_msi.c
> >> index 91b95422b263..63b3544ec997 100644
> >> --- a/drivers/cdx/cdx_msi.c
> >> +++ b/drivers/cdx/cdx_msi.c
> >> @@ -128,8 +128,7 @@ static int cdx_msi_prepare(struct irq_domain *msi_domain,
> >>  	int ret;
> >>  
> >>  	/* Retrieve device ID from requestor ID using parent device */
> >> -	ret = of_map_id(parent->of_node, cdx_dev->msi_dev_id, "msi-map", "msi-map-mask",
> >> -			NULL, &dev_id);
> >> +	ret = of_map_msi_id(parent->of_node, cdx_dev->msi_dev_id, NULL, &dev_id);
> >>  	if (ret) {
> >>  		dev_err(dev, "of_map_id failed for MSI: %d\n", ret);
> >>  		return ret;
> >> diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
> >> index 6b989a62def2..a511ecf21fcd 100644
> >> --- a/drivers/iommu/of_iommu.c
> >> +++ b/drivers/iommu/of_iommu.c
> >> @@ -48,9 +48,7 @@ static int of_iommu_configure_dev_id(struct device_node *master_np,
> >>  	struct of_phandle_args iommu_spec = { .args_count = 1 };
> >>  	int err;
> >>  
> >> -	err = of_map_id(master_np, *id, "iommu-map",
> >> -			 "iommu-map-mask", &iommu_spec.np,
> >> -			 iommu_spec.args);
> >> +	err = of_map_iommu_id(master_np, *id, &iommu_spec.np, iommu_spec.args);
> >>  	if (err)
> >>  		return err;
> >>  
> >> diff --git a/drivers/irqchip/irq-gic-its-msi-parent.c b/drivers/irqchip/irq-gic-its-msi-parent.c
> >> index d36b278ae66c..b63343a227a9 100644
> >> --- a/drivers/irqchip/irq-gic-its-msi-parent.c
> >> +++ b/drivers/irqchip/irq-gic-its-msi-parent.c
> >> @@ -180,7 +180,7 @@ static int of_pmsi_get_msi_info(struct irq_domain *domain, struct device *dev, u
> >>  
> >>  	struct device_node *msi_ctrl __free(device_node) = NULL;
> >>  
> >> -	return of_map_id(dev->of_node, dev->id, "msi-map", "msi-map-mask", &msi_ctrl, dev_id);
> >> +	return of_map_msi_id(dev->of_node, dev->id, &msi_ctrl, dev_id);
> >>  }
> >>  
> >>  static int its_pmsi_prepare(struct irq_domain *domain, struct device *dev,
> >> diff --git a/drivers/of/irq.c b/drivers/of/irq.c
> >> index 6367c67732d2..e37c1b3f8736 100644
> >> --- a/drivers/of/irq.c
> >> +++ b/drivers/of/irq.c
> >> @@ -817,8 +817,7 @@ u32 of_msi_xlate(struct device *dev, struct device_node **msi_np, u32 id_in)
> >>  	 * "msi-map" or an "msi-parent" property.
> >>  	 */
> >>  	for (parent_dev = dev; parent_dev; parent_dev = parent_dev->parent) {
> >> -		if (!of_map_id(parent_dev->of_node, id_in, "msi-map",
> >> -				"msi-map-mask", msi_np, &id_out))
> >> +		if (!of_map_msi_id(parent_dev->of_node, id_in, msi_np, &id_out))
> >>  			break;
> >>  		if (!of_check_msi_parent(parent_dev->of_node, msi_np))
> >>  			break;
> >> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> >> index a5b8d0b71677..bff8289f804a 100644
> >> --- a/drivers/pci/controller/dwc/pci-imx6.c
> >> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> >> @@ -1144,8 +1144,7 @@ static int imx_pcie_add_lut_by_rid(struct imx_pcie *imx_pcie, u32 rid)
> >>  	u32 sid = 0;
> >>  
> >>  	target = NULL;
> >> -	err_i = of_map_id(dev->of_node, rid, "iommu-map", "iommu-map-mask",
> >> -			  &target, &sid_i);
> >> +	err_i = of_map_iommu_id(dev->of_node, rid, &target, &sid_i);
> >>  	if (target) {
> >>  		of_node_put(target);
> >>  	} else {
> >> @@ -1158,8 +1157,7 @@ static int imx_pcie_add_lut_by_rid(struct imx_pcie *imx_pcie, u32 rid)
> >>  	}
> >>  
> >>  	target = NULL;
> >> -	err_m = of_map_id(dev->of_node, rid, "msi-map", "msi-map-mask",
> >> -			  &target, &sid_m);
> >> +	err_m = of_map_msi_id(dev->of_node, rid, &target, &sid_m);
> >>  
> >>  	/*
> >>  	 *   err_m      target
> >> diff --git a/drivers/pci/controller/pcie-apple.c b/drivers/pci/controller/pcie-apple.c
> >> index 2d92fc79f6dd..a0937b7b3c4d 100644
> >> --- a/drivers/pci/controller/pcie-apple.c
> >> +++ b/drivers/pci/controller/pcie-apple.c
> >> @@ -764,8 +764,7 @@ static int apple_pcie_enable_device(struct pci_host_bridge *bridge, struct pci_d
> >>  	dev_dbg(&pdev->dev, "added to bus %s, index %d\n",
> >>  		pci_name(pdev->bus->self), port->idx);
> >>  
> >> -	err = of_map_id(port->pcie->dev->of_node, rid, "iommu-map",
> >> -			"iommu-map-mask", NULL, &sid);
> >> +	err = of_map_iommu_id(port->pcie->dev->of_node, rid, NULL, &sid);
> >>  	if (err)
> >>  		return err;
> >>  
> >> diff --git a/drivers/xen/grant-dma-ops.c b/drivers/xen/grant-dma-ops.c
> >> index c2603e700178..1b7696b2d762 100644
> >> --- a/drivers/xen/grant-dma-ops.c
> >> +++ b/drivers/xen/grant-dma-ops.c
> >> @@ -325,8 +325,7 @@ static int xen_dt_grant_init_backend_domid(struct device *dev,
> >>  		struct pci_dev *pdev = to_pci_dev(dev);
> >>  		u32 rid = PCI_DEVID(pdev->bus->number, pdev->devfn);
> >>  
> >> -		if (of_map_id(np, rid, "iommu-map", "iommu-map-mask", &iommu_spec.np,
> >> -				iommu_spec.args)) {
> >> +		if (of_map_iommu_id(np, rid, &iommu_spec.np, iommu_spec.args)) {
> >>  			dev_dbg(dev, "Cannot translate ID\n");
> >>  			return -ESRCH;
> >>  		}
> >> diff --git a/include/linux/of.h b/include/linux/of.h
> >> index be6ec4916adf..824649867810 100644
> >> --- a/include/linux/of.h
> >> +++ b/include/linux/of.h
> >> @@ -1457,6 +1457,20 @@ static inline int of_property_read_s32(const struct device_node *np,
> >>  	return of_property_read_u32(np, propname, (u32*) out_value);
> >>  }
> >>  
> >> +static inline int of_map_iommu_id(const struct device_node *np, u32 id,
> >> +				  struct device_node **target, u32 *id_out)
> >> +{
> >> +	return of_map_id(np, id, "iommu-map", "iommu-map-mask",
> >> +			 target, id_out);
> >> +}
> >> +
> >> +static inline int of_map_msi_id(const struct device_node *np, u32 id,
> >> +				struct device_node **target, u32 *id_out)
> >> +{
> >> +	return of_map_id(np, id, "msi-map", "msi-map-mask",
> >> +			 target, id_out);
> >> +}
> >> +
> > 
> > Any particular reason why this is made inline instead of out of line
> > in of/base.c? Also, some documentation would be helpful for the
> > aspiring hackers dipping into this.
> > 
> > Other than that,
> > 
> > Acked-by: Marc Zyngier <maz@kernel.org>
> > 
> > 	M.
> > 
> 
> Thanks Marc.
> 
> I made them static inline mainly because they’re just trivial wrappers
> around of_map_id(), so keeping them in include/linux/of.h avoids adding
> new global symbols/exports and keeps the callsites simple (similar to
> the existing of_property_read_*() inline wrappers).
> 
> That said, I don’t have a strong preference—if you’d rather have
> out-of-line helpers in drivers/of/base.c, I’m happy to respin accordingly.
> 
> Re Documentation, Sure I'll add comments for of_map_iommu_id() and
> of_map_msi_id() in follow up patch.

... in the next iteration, please.

> 
> Thanks,
> Vijay
> 
> 
> 

-- 
With best wishes
Dmitry

