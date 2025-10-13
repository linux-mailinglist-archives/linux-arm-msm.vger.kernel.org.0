Return-Path: <linux-arm-msm+bounces-76984-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 52353BD288E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 12:21:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 342754E23ED
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 10:21:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B82A92FF154;
	Mon, 13 Oct 2025 10:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FWD8z0Bz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D15E62FF149
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 10:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760350887; cv=none; b=rH3WKc4OwEaHVKQro0/+j5aclTQHO2bwuakhHp0v+C507R2LTMYO1/GqPQzJmQiOPk5UK+Q2e0VxWI/z8KIe5FcXVmGDCXCaGe1RISINFD+/he2qd3ErwvrEOhCWiPEMwvC4XP1JL16SYC/AjxAber/0SHHoVRfXn0jSIn6yXck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760350887; c=relaxed/simple;
	bh=+FW/t/JZLoRj3fCJ6l0uGs6lOtXEWsH1VJl9JV8psyE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cJJkOU5VyqRFjPK13jpZD6Ak7+9eEzGZFQ3kEBNbwm2X0YzXcG+5I0X8bB3NUmBEcNAqLJWjD2NnmxBH54I6mEmzM7ndsUiBFJ5Dm+LKkN2gtxr7OsP7Ad7wy4oAID5Ij+gYiFIyzkLuyAX55mM9RBtGfCKlZIFNqqy7jhhup2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FWD8z0Bz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59D2n6x8017035
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 10:21:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4Fadm5UWE9Z1SeNHKDkEAbSo
	CIBBWtecpyx1PD/Kvao=; b=FWD8z0BzbgIF46ZnojQnErH4b5eudWnBC7z3aGME
	OY2+7gs58kou9JC0hFSIV3242zzpDUzauoJXjd6g9UuEdUQwoangnH6LmPpR4s30
	6gSGZzHZMdEou+s/f4IE3u8N5HQVzsaAWVzVMti57D0IKzo3070zF4l2qZmPJizz
	RgvI6fr24uszRX3s1oFE1AKSl/pC9d09deoJ3nj+Yj2/gJtAsJ2jdYaZ45AQcY/e
	L7usewEy9edKnf65wBKrypRJ40qPui/klZ2WwigqLe85ZTqXefX41EFKX06Pcq4K
	lJJkXIPi6U/J/OA7MTuaKFO9U2WZLaCdY0k9uDGyBtKFEg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfdk4707-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 10:21:24 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-28e8d1d9b13so83315895ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 03:21:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760350883; x=1760955683;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Fadm5UWE9Z1SeNHKDkEAbSoCIBBWtecpyx1PD/Kvao=;
        b=FDz4/44Esy+fudesky8uTvM0yI9I4xW8NaLTibbsdTWhB5sMGD3z5g7My5nett0/Tc
         gtgSJYzXA/MCGwlZRBcw3wAuv2n5nQAH9N/nBdZH/qFk7QfB4i+i30ghoZgpeHSa9ZHv
         hsnLOsUZiL7iC+j5ErjpHx6XVkjGd9aMiLbCiuOXJyOkOm54MjKLligt7ovRj/wGV+UQ
         jpVBTYq+cbaoaJxdT+NxTK2SLXO/cC9Kplj+KOCzTWImU+yli+CojO/XGhbAH/2iUieS
         Nw3YtFysQo+CIqcTVq9s8uX9aw1jI+SmlqLmi6QrCoL6jj92XwtwJ4fVZflxHHQ6kSJO
         dQjg==
X-Forwarded-Encrypted: i=1; AJvYcCVZGUCmeCb1yRAI05a9IheXSsBQsenyV3GApjv3oTEekI7MSLoWVy+8snwJVC/lPqu9LIdSbG63/mdvQDxs@vger.kernel.org
X-Gm-Message-State: AOJu0YyThB/LCOeKO5ze4pAvCPe021WtIV/WzZPQXlE2ImbfDDVTbfWy
	waF2ddMVcaApvBhwjvc+tBijdeeh7q9k3+oOPcwVc8eFxZDb+T7Srl13QVhUZd9ZGnMEnSm/YF7
	EKPUrSkZZS8iFiBqy/qLRuoRudiCZ7eR3KP61+f7Ds0jvK9/A8Fbw2Zf9YCmAgI6xmaJS
X-Gm-Gg: ASbGncvF1UkRWwuHUWyU/Eq6rmGvlr13bzcqpnUd8y5Lp2+5WioYmW/wzond1orMRDN
	Qv9TiVXw3//ek312ATww/nkB/B/3mh/ze+83h/PT37XCLM/1nTOtJioNemxmj9Q5D1bz2s13Xfu
	47C4zgTQAfnGnFHNoMRC1x4amCPNF4lX2ROL8K1Dy3xquzurqhSOY6JXUSOaUSF90CyatBYpJZQ
	cWW2Je2ECZy46FWfDm5ANGGlmwNMj5Afxs/BRntJ8Y9HvTy59sJoqLleknouF7SqW1YobPf0/8t
	zrshyQKVRlog9FEtYmS+oWeBndv0Ue2rYJClEvecvpf1gvNiQm7VGlmqFGr49cmV2z31+vCgNU3
	+VaNkO9Fv8Dg=
X-Received: by 2002:a17:903:1510:b0:27e:ec72:f62 with SMTP id d9443c01a7336-2902728b8a2mr258678475ad.6.1760350883026;
        Mon, 13 Oct 2025 03:21:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGI2xIesTPKfihzbvuN6SjY2IhVfnvd+E8VKr6jMCnNPvpl/9my3behcmfa8v1Mlq4cfp6Z2A==
X-Received: by 2002:a17:903:1510:b0:27e:ec72:f62 with SMTP id d9443c01a7336-2902728b8a2mr258678235ad.6.1760350882443;
        Mon, 13 Oct 2025 03:21:22 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f0726asm129326225ad.72.2025.10.13.03.21.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 03:21:21 -0700 (PDT)
Date: Mon, 13 Oct 2025 03:21:19 -0700
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
Message-ID: <aOzSnxuuAb4gFCkk@hu-qianyu-lv.qualcomm.com>
References: <20250924-knp-pcie-v1-0-5fb59e398b83@oss.qualcomm.com>
 <20250924-knp-pcie-v1-3-5fb59e398b83@oss.qualcomm.com>
 <fw5hf4p2mjybvfo756dhdm6wwlgnkzks4uwgo7k3dy7hyjhzyr@bv4p7msxapcb>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fw5hf4p2mjybvfo756dhdm6wwlgnkzks4uwgo7k3dy7hyjhzyr@bv4p7msxapcb>
X-Proofpoint-ORIG-GUID: CnTya6M7ICw9mGo47P9TqutZVDHlatTn
X-Authority-Analysis: v=2.4 cv=MrNfKmae c=1 sm=1 tr=0 ts=68ecd2a4 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=_a7lAMoHYZZEAV_m-VEA:9
 a=CjuIK1q_8ugA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: CnTya6M7ICw9mGo47P9TqutZVDHlatTn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX7U0NR6qMVEhZ
 Zi4TVGCChuUxIeOEIB5im8xxBbghjoYFVb8x0kWphW8uRde5AzfdwiiEuvl6RRQqDzbrg/aFfzU
 9E2bmPSc66fEuwipGGSXCuhmgAXmAJFwyOBFkbg+Wueng4qWsRuJ+iOcom2+VzTeII+zKxjjEmj
 S867YaR7FqXH/5KCU5rwRWZW3ZBnWfkwFzy5BQ+GLcSSDMEQHsWw7Jezo7Br4MAvO18Nndar+wa
 yQaawWxIY+6vh1NnrhcyVCzXM2WodHyz1EUYZVlF9hnGkYUQLFqrHicSqxceYjXO8Lbnn8GITx3
 0yHzb7Qx/18Bc+4yTCbRXAhEcldd0WuRFCsOkjjXbJLdcqttl0X01gsR3LBNE+Uu936BjaMAJcB
 NiGSWD/IfEY7iQe6U2ETesGL8u6kQg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018

On Thu, Sep 25, 2025 at 05:28:15AM +0300, Dmitry Baryshkov wrote:
> On Wed, Sep 24, 2025 at 04:33:19PM -0700, Jingyi Wang wrote:
> > From: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > 
> > Kaanapali SoC uses QMP PHY with version v8 for PCIe Gen3 x2, but its
> > qserdes-txrx register offsets differ from the existing v8 offsets. To
> > accommodate these differences, add the qserdes-txrx specific offsets in
> > a dedicated header file.
> 
> With this approach it's not obvious, which register names are shared
> with the existing header and which fields are unique. Please provide a
> full set of defines in this header.

Sorry, I didn't get you. Do you mean we need to add defines for all PCIe
qserdes-txrx registers? I don't understand how this makes which register
names are shared and which fields are unique more obvious.

- Qiang Yu
> 
> > 
> > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> > ---
> >  .../qualcomm/phy-qcom-qmp-qserdes-txrx-pcie-v8.h   | 71 ++++++++++++++++++++++
> >  1 file changed, 71 insertions(+)
> > 
> > diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-pcie-v8.h b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-pcie-v8.h
> > new file mode 100644
> > index 000000000000..181846e08c0f
> > --- /dev/null
> > +++ b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-pcie-v8.h
> > @@ -0,0 +1,71 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries. All rights reserved.
> > + */
> > +
> > +#ifndef QCOM_PHY_QMP_QSERDES_TXRX_PCIE_V8_H_
> > +#define QCOM_PHY_QMP_QSERDES_TXRX_PCIE_V8_H_
> > +
> > +#define QSERDES_V8_PCIE_TX_RES_CODE_LANE_OFFSET_TX		0x030
> > +#define QSERDES_V8_PCIE_TX_RES_CODE_LANE_OFFSET_RX		0x034
> > +#define QSERDES_V8_PCIE_TX_LANE_MODE_1		0x07c
> > +#define QSERDES_V8_PCIE_TX_LANE_MODE_2		0x080
> > +#define QSERDES_V8_PCIE_TX_LANE_MODE_3		0x084
> > +#define QSERDES_V8_PCIE_TX_TRAN_DRVR_EMP_EN		0x0b4
> > +#define QSERDES_V8_PCIE_TX_TX_BAND0		0x0e0
> > +#define QSERDES_V8_PCIE_TX_TX_BAND1		0x0e4
> > +#define QSERDES_V8_PCIE_TX_SEL_10B_8B		0x0f4
> > +#define QSERDES_V8_PCIE_TX_SEL_20B_10B		0x0f8
> > +#define QSERDES_V8_PCIE_TX_PARRATE_REC_DETECT_IDLE_EN		0x058
> > +#define QSERDES_V8_PCIE_TX_TX_ADAPT_POST_THRESH1		0x118
> > +#define QSERDES_V8_PCIE_TX_TX_ADAPT_POST_THRESH2		0x11c
> > +#define QSERDES_V8_PCIE_TX_PHPRE_CTRL		0x128
> > +#define QSERDES_V8_PCIE_TX_EQ_RCF_CTRL_RATE3		0x148
> > +#define QSERDES_V8_PCIE_TX_EQ_RCF_CTRL_RATE4		0x14c
> > +
> > +#define QSERDES_V8_PCIE_RX_UCDR_FO_GAIN_RATE4		0x0dc
> > +#define QSERDES_V8_PCIE_RX_UCDR_SO_GAIN_RATE3		0x0ec
> > +#define QSERDES_V8_PCIE_RX_UCDR_SO_GAIN_RATE4		0x0f0
> > +#define QSERDES_V8_PCIE_RX_UCDR_PI_CONTROLS		0x0f4
> > +#define QSERDES_V8_PCIE_RX_VGA_CAL_CNTRL1		0x170
> > +#define QSERDES_V8_PCIE_RX_VGA_CAL_MAN_VAL		0x178
> > +#define QSERDES_V8_PCIE_RX_RX_EQU_ADAPTOR_CNTRL4		0x1b4
> > +#define QSERDES_V8_PCIE_RX_SIGDET_ENABLES			0x1d8
> > +#define QSERDES_V8_PCIE_RX_SIGDET_LVL			0x1e0
> > +#define QSERDES_V8_PCIE_RX_RXCLK_DIV2_CTRL			0x0b8
> > +#define QSERDES_V8_PCIE_RX_RX_BAND_CTRL0			0x0bc
> > +#define QSERDES_V8_PCIE_RX_RX_TERM_BW_CTRL0			0x0c4
> > +#define QSERDES_V8_PCIE_RX_RX_TERM_BW_CTRL1			0x0c8
> > +#define QSERDES_V8_PCIE_RX_SVS_MODE_CTRL			0x0b4
> > +#define QSERDES_V8_PCIE_RX_UCDR_PI_CTRL1			0x058
> > +#define QSERDES_V8_PCIE_RX_UCDR_PI_CTRL2			0x05c
> > +#define QSERDES_V8_PCIE_RX_UCDR_SB2_THRESH2_RATE3			0x084
> > +#define QSERDES_V8_PCIE_RX_UCDR_SB2_GAIN1_RATE3			0x098
> > +#define QSERDES_V8_PCIE_RX_UCDR_SB2_GAIN2_RATE3			0x0ac
> > +#define QSERDES_V8_PCIE_RX_RX_MODE_RATE_0_1_B0			0x218
> > +#define QSERDES_V8_PCIE_RX_RX_MODE_RATE_0_1_B1			0x21c
> > +#define QSERDES_V8_PCIE_RX_RX_MODE_RATE_0_1_B2			0x220
> > +#define QSERDES_V8_PCIE_RX_RX_MODE_RATE_0_1_B4			0x228
> > +#define QSERDES_V8_PCIE_RX_RX_MODE_RATE_0_1_B7			0x234
> > +#define QSERDES_V8_PCIE_RX_RX_MODE_RATE3_B0			0x260
> > +#define QSERDES_V8_PCIE_RX_RX_MODE_RATE3_B1			0x264
> > +#define QSERDES_V8_PCIE_RX_RX_MODE_RATE3_B2			0x268
> > +#define QSERDES_V8_PCIE_RX_RX_MODE_RATE3_B3			0x26c
> > +#define QSERDES_V8_PCIE_RX_RX_MODE_RATE3_B4			0x270
> > +#define QSERDES_V8_PCIE_RX_RX_MODE_RATE4_SA_B0			0x284
> > +#define QSERDES_V8_PCIE_RX_RX_MODE_RATE4_SA_B1			0x288
> > +#define QSERDES_V8_PCIE_RX_RX_MODE_RATE4_SA_B2			0x28c
> > +#define QSERDES_V8_PCIE_RX_RX_MODE_RATE4_SA_B3			0x290
> > +#define QSERDES_V8_PCIE_RX_RX_MODE_RATE4_SA_B4			0x294
> > +#define QSERDES_V8_PCIE_RX_RX_MODE_RATE4_SA_B5			0x298
> > +#define QSERDES_V8_PCIE_RX_Q_PI_INTRINSIC_BIAS_RATE32			0x31c
> > +#define QSERDES_V8_PCIE_RX_Q_PI_INTRINSIC_BIAS_RATE4			0x320
> > +#define QSERDES_V8_PCIE_RX_EOM_MAX_ERR_LIMIT_LSB			0x11c
> > +#define QSERDES_V8_PCIE_RX_EOM_MAX_ERR_LIMIT_MSB			0x120
> > +#define QSERDES_V8_PCIE_RX_AUXDATA_BIN_RATE23			0x108
> > +#define QSERDES_V8_PCIE_RX_AUXDATA_BIN_RATE4			0x10c
> > +#define QSERDES_V8_PCIE_RX_VTHRESH_CAL_MAN_VAL_RATE3			0x198
> > +#define QSERDES_V8_PCIE_RX_VTHRESH_CAL_MAN_VAL_RATE4			0x19c
> > +#define QSERDES_V8_PCIE_RX_GM_CAL			0x1a0
> > +
> > +#endif
> > 
> > -- 
> > 2.25.1
> > 
> 
> -- 
> With best wishes
> Dmitry

