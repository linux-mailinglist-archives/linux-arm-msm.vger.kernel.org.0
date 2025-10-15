Return-Path: <linux-arm-msm+bounces-77341-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8A0BDDBD0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 11:21:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A945E501B01
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 09:18:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F4BE3191B7;
	Wed, 15 Oct 2025 09:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pHKb+eE7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 975D231327F
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 09:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760519927; cv=none; b=YBggFlSx5R5+v7i+Bv6g59WLhHvy98U49vtsQYk9BWdzm84el41XfFxb6KtCDJhwfiAv4u6IGfYbIJmApT+j9jRVopxSOCKbVmKDlSNhvRL5ymZsF5g/3mJzkLnmCD+nbPEp7gq3gI9JMs0imzKo6EUgVcfshYXMN7pNiBVufco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760519927; c=relaxed/simple;
	bh=v+1yFx6m8EFS51NH+9N1+Ps29Xui1uKYHZuhxqSh1hs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sBHwuJiu9bwlzNyR6fX2PpI+0a1OgpJ2j+dqJzW8arhe6gQM4BGKqX0p39cfTva9OhUTjB72UnPeBWWPEl5nyyvSgAxSClt4TsrZY27DdNgBOqi36kMxKVesyxDHz7IzvWCt/i2RvIo1f80upAAVHlMQFyU2us+MSy1qLzU9OTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pHKb+eE7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59F2s7KA004300
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 09:18:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bS1E+4mwLwBFxlFV6Y8vnGID
	Eaq0IJ1+mTWNPvPN/ow=; b=pHKb+eE7EYO3K0e1ksvCiWA39iLCSJMsj+XM1ksK
	4S36D/sLeMMDMQehEZXKtspD1kktRrZO3Dlq7DoNX/eV0sfC/1Dc8OfSatgYNDyQ
	QN6Yg2Pp4Hykgt2jOj+AaTTMA5jeFfO4NaSjuWVHFpSgbHACBlR9wb/q06SQsqo9
	Ty7Bm1djb6BatJ6dqk2tJcDOOSBm4yU5y3H9OcENfgaeX9cMHf+vo/CYEwogapeZ
	xMKsIiOBQSKpnqxUfIOT52/5uD0dTVQu3EawLIxL/jAbjRviygrp/h1lVR79LBAm
	mupIk6btIy3iV4jCQ+DAbEvK2XIVc2uRHW41nIgPV7KQqg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49rw1ag4xb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 09:18:44 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-32ec67fcb88so9455125a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 02:18:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760519924; x=1761124724;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bS1E+4mwLwBFxlFV6Y8vnGIDEaq0IJ1+mTWNPvPN/ow=;
        b=IS4uO6dA/1sFK/pt4vJt5HanUfSiLKmZAi4NtyA49zxCQdLTAunzIe1Yq/Ld26MLjl
         FC81sYTxzIDK+h8w6UkvpHDSU2oaARqBiN9DW7+MyO4N9KQswxZ/5X/H8sEdFUPVKsrK
         2GCTYciSAeFrFMcCIy2oDIlCrkjU6N/O2ZU1h5wWvTRtFUJMcaANIcyxE0/X3E3pesio
         ui0F5HL3SNhhp2N7yOcrp7sXdgeHfW1vNm7bHVABU8f19U3oJUvXsUaYUjDlXYnxV4fD
         I/QgyiIU9vmGeqzfkDFqi/6k59cvmso+AH5klxx7xn7TbVM9gh0PHF4IrHmPQiS49kUw
         So4g==
X-Forwarded-Encrypted: i=1; AJvYcCXOKQLg/hwtRmxX7Qh+w1DTtV9Ej+LCePZAj/gojJ7LtAHu383Otmhk6G65XD453AnpfHUnkFJ8epg2B+lT@vger.kernel.org
X-Gm-Message-State: AOJu0YzQlCYyk9+8uwCoPathMnBMIOMXmK7CDSbiroHBm+SnAWP1cI+6
	BEVa31VXEGB0u5td2No/nQTlNONpFFZVG4BCsJL4Av4wetaDURGJGvASW5uI5yP2loIHO4Gx4yP
	ZRK597mQLJDqOqTyd3RZqZlM570uoLYnRYfv5NyShNGfkICPqt4yG3/jYPHB4ciGmBfHVBrgtFd
	FbbruR5A==
X-Gm-Gg: ASbGncuLutBRH0HAylouhvxz8Hlj9HCdInmz84Vv2LxXoSsEy7SriXrSghU+7b+++FP
	ESfRsyV+P0DQbIjxsDCecY2jjVX6lmcEtOZx9qLHdJlFu3YX3kFF39osxX9Ecc3ZjTOuVJS0OAY
	3wyMZKQ3bskt3SxiusuNitU0d4SsNvMxcHQAPI/5g5O8i85D8EK1wq2ez/cc6/D2jkD5MMvM8Le
	JtRjdOOHL7Y1oLLSQY/2GnK0B6u0j2zVaua4KtArERtv9wz1de3k0Wku1YRDOR17wzPEvC/U89M
	CnOwhhQUPZom718kWwtmM4cjEIH8f+G9H0MI53Dv0CLAJGzG1V7nNm31b3AaofpXLqBcnOqvObQ
	CKA0EaPYuro0=
X-Received: by 2002:a17:90b:33c1:b0:32e:dd8c:dd18 with SMTP id 98e67ed59e1d1-33b51386478mr42150817a91.17.1760519923665;
        Wed, 15 Oct 2025 02:18:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHMgnMO7HLRZxNRp6JE2WyjZvNwxMd4B9BWG+xm9wiLFSOLNzWFuvmVaLsS63QDbhtbP/hrPg==
X-Received: by 2002:a17:90b:33c1:b0:32e:dd8c:dd18 with SMTP id 98e67ed59e1d1-33b51386478mr42150785a91.17.1760519923204;
        Wed, 15 Oct 2025 02:18:43 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b9786084fsm1727013a91.10.2025.10.15.02.18.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 02:18:42 -0700 (PDT)
Date: Wed, 15 Oct 2025 02:18:40 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com
Subject: Re: [PATCH 3/6] phy: qcom-qmp: qserdes-txrx: Add QMP PCIe PHY
 v8-specific register offsets
Message-ID: <aO9m8PA5QMb5JDgz@hu-qianyu-lv.qualcomm.com>
References: <20250924-knp-pcie-v1-0-5fb59e398b83@oss.qualcomm.com>
 <20250924-knp-pcie-v1-3-5fb59e398b83@oss.qualcomm.com>
 <fw5hf4p2mjybvfo756dhdm6wwlgnkzks4uwgo7k3dy7hyjhzyr@bv4p7msxapcb>
 <aOzSnxuuAb4gFCkk@hu-qianyu-lv.qualcomm.com>
 <x2443gg3bj37j7qxjk3ocol4xzcly2vandob5j46bp5c6akqb3@zgwrl7qhl2y6>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <x2443gg3bj37j7qxjk3ocol4xzcly2vandob5j46bp5c6akqb3@zgwrl7qhl2y6>
X-Authority-Analysis: v=2.4 cv=K88v3iWI c=1 sm=1 tr=0 ts=68ef66f4 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=naz9k7CIUQbskZorHm4A:9 a=CjuIK1q_8ugA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: IKToqFxzEsx9ke1RW2O2l3L9uTDxbY_H
X-Proofpoint-ORIG-GUID: IKToqFxzEsx9ke1RW2O2l3L9uTDxbY_H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDAzNSBTYWx0ZWRfXydGrnkJjc8oI
 VoachdWLDWTbVxlKZ2CI/aQwRAFfs8IsDSDVg35j9pfNb8/ExxZidjJZWbNQX+Vi5aJuzVjjmOw
 zSfSCakgdKcD6hv5R0THOKB8tRx5Q3/sibR+vNzsRxzZ9qxK98HoSircWnJt28np0mjEp/QnGSf
 Edz2h3ZUVNu2/SWLz5MDOUyzzvKuv5RySKQGCavykbhl4aqEPx6DLXKAl79DRHtW/RZu4XGDqL6
 HhuvAcLC/uSmsiCx5/cjeQzBBMzVXPfjcftq9Vib1GsCIm/jFlZFEwVH3OuY3RMKrik71mDE0tG
 rklL0QKVS7JDr7IjjvGEx3/NBC5wIEMTmRQLiwwl32UxhQPin6fdi0UIEFVQKUhnVUABRyBt+67
 Q6F9188FrJYxSxoF7psSayA16oOdPQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 adultscore=0 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130035

On Mon, Oct 13, 2025 at 03:40:32PM +0300, Dmitry Baryshkov wrote:
> On Mon, Oct 13, 2025 at 03:21:19AM -0700, Qiang Yu wrote:
> > On Thu, Sep 25, 2025 at 05:28:15AM +0300, Dmitry Baryshkov wrote:
> > > On Wed, Sep 24, 2025 at 04:33:19PM -0700, Jingyi Wang wrote:
> > > > From: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > > > 
> > > > Kaanapali SoC uses QMP PHY with version v8 for PCIe Gen3 x2, but its
> > > > qserdes-txrx register offsets differ from the existing v8 offsets. To
> > > > accommodate these differences, add the qserdes-txrx specific offsets in
> > > > a dedicated header file.
> > > 
> > > With this approach it's not obvious, which register names are shared
> > > with the existing header and which fields are unique. Please provide a
> > > full set of defines in this header.
> > 
> > Sorry, I didn't get you. Do you mean we need to add defines for all PCIe
> > qserdes-txrx registers? I don't understand how this makes which register
> > names are shared and which fields are unique more obvious.
> 
> From your commit message it feels like
> phy-qcom-qmp-qserdes-txrx-pcie-v8.h is an extension over some other
> "base" header file (likely phy-qcom-qmp-qserdes-txrx-v8.h. It makes it
> harder to follow the logic and harder to compare the values. Please
> define all used register names inside the new header.

No, the new header file is not an extension. It's a full set of
qserdes-txrx register definitions required for Kaanapali PCIe PHY.

Let me rewrite my commit msg.

- Qiang Yu
> 
> 
> -- 
> With best wishes
> Dmitry

