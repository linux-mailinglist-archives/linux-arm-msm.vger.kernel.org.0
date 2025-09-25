Return-Path: <linux-arm-msm+bounces-74870-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2916EB9D249
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 04:28:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D32FF3AC11C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 02:28:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45A8F2DEA97;
	Thu, 25 Sep 2025 02:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kMJ9nqtc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C9327F754
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 02:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758767304; cv=none; b=B437t5AcPiqLNVqQU/NQ6Z0h6tWUO1aRKANRZBvBM/oys/dLrdRhy+cHN7hwyx8cHZGd1EUTo0+qF49dfyMQnTqM53ogMc8kT866H5+h1PiEzT83UOL+bt+475Q/xQXC0FKcpxmYTj8VpjQ8ZLMbYFBh/SUfAcQmQI+VCTmmP1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758767304; c=relaxed/simple;
	bh=VeW+/dxWBFokkjVS0wYtTsWpjpgB19ZpOQMGvhrWa2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RCntJh53Bxx2geR0I4U+4MQFBdFlqikF6k5iplPj1OhWNskMPVMFDe9CY1BxxLcf2TPHKDl9QCYDUKx9nqhrhnNf6X6pfgiH2eujdZxAZVBBnanxb25dedtZhhSGxIlTE6chGu0IMzqAhwXeV3kYx49e7lmeeM5Y07yr3xrWAs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kMJ9nqtc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P10QKG018716
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 02:28:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wXSfj1wi08RKzF1L2ephokkz
	/QuwdGIgQuSB3kutQM8=; b=kMJ9nqtcoBmAhHEvQshcaEBd68YJo37OKD8KDaQu
	IjF+2n/fEIA87dyZpcu8b1ho+xbcqXGUXCQVHGvHhxUpQdymjPQoUkg9MDAp+MeZ
	4RnYUJ98E7cA5NSsXzKBFF08xLTCKqsOhCX5tYhIUV7SUYJIaVL/+28GOai7mAiU
	9pNRwJYaUjdgKyAHmXcD8J3yfoqnz4d7yVPapdBfbFrX76Ew4w4EYod7IjH3zfeR
	LOJHic8ZdFBNOSmPETGO2HBHp1JYzY6FxVSCWPhB00jVYjB/ztt2bhZ+4PtGBF5T
	fjfs97a/RdhC1aoDkWmaz9uvRpJQbQcFDLgXTiwVmiQCVg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bhvjyry6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 02:28:21 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4d6a41b5b66so12042911cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 19:28:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758767300; x=1759372100;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wXSfj1wi08RKzF1L2ephokkz/QuwdGIgQuSB3kutQM8=;
        b=nOFnZk2Wo11zyN573rclphr6KU+dxCnmzIILDb/MyxU4X+zmV8IeFDQUSGP4tb1G7n
         5Tu4E6pXQM4IaAy/LDglOkY7VwQLEBtzC3zQv0RD+mGMOV/x6m1Hc05GIK/plVQ0xg7Q
         dTpCKb1t10T6CNWisRWWFeqFve9p1hIU5WylYLMpIMp31RFX+ENY87m8eLYpsZ+l8jb9
         PqwvW7PeH4VaEO1vfZ/u+67yWOguKndhBb04r5ztT036g0U0ECT3RF+UcKxTLLaaymXm
         fVHQ08DzwIFCmX65GPCBtaf9DdOaLAjb1ONbO63w4wxqboIWvP+sK8WnM7rtcviLNJG+
         HjXw==
X-Forwarded-Encrypted: i=1; AJvYcCUG6KrCxWqAa+Um7Qim/6zJMuZrM6OwsUKbQ+adyhUXAMUfiXpM3oPZvWdAkgxzxjh8ecpkEfIKbvgrEvh0@vger.kernel.org
X-Gm-Message-State: AOJu0YxlFGMIVDIDnEXvhuHwt0HXidCMA3CqGTRrzyUNFGWcCWh6fqhz
	5vFX0qhOZh4BmiV+UufADPGjDUFZOo/WoSlKKiDpAU+pADUZb9PLrkslfuF/Mxwk7QZzJr0V2Dl
	T3MKeGptRd2Jiu8GGWszyULOYIXiRf4D62CAF3WRxh+YQ/vTS7eDEQeGHuWShZcPJNHIm
X-Gm-Gg: ASbGncsGISy9ym46gutEn7P5Mqgpoi6Vm6kCii5dWnFfwL7VkrjRgNlwvliPLx6jVNl
	S2omqojszEktIysHUfSu62zcSn08JgwwWfJU40IgBnb1OrHmMQhouVdtDOuRg9qNFAUsXt1eY5o
	5WzErFFm0dczKts/nl4gsf0lno1NTVUu7Ks9IE9+Ti/hWupfWLgj44WcFXAA8lW7YuiJg4BS/P6
	zIj3CgQEj4g19cNZkGYfDjXhILCSoZxAMOYVZyP2fKiFB7nmy24iB63pEYdj+RZzkoVyHfPXJW9
	0CbI5axYFh34AwZVQIBBpKU6fEfxMhCHvtomv5DzkIg4IOc3mK/wqf2n4r7Pqa1KTql7jlr3B+z
	RUEQVAKvMq0SFN2Bn9RPgT+8keDepDDzPI8zljUlc0gCa2nbNPeuC
X-Received: by 2002:ac8:5856:0:b0:4b6:2be2:e816 with SMTP id d75a77b69052e-4da4735508amr26619121cf.8.1758767300266;
        Wed, 24 Sep 2025 19:28:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4UEfkhO1mpjxW8ifjJvdLmt7J0vNk2R3BrhhdTbo1+/m7PrsyR8BHP8zagES/AEoTWgsM8A==
X-Received: by 2002:ac8:5856:0:b0:4b6:2be2:e816 with SMTP id d75a77b69052e-4da4735508amr26618921cf.8.1758767299822;
        Wed, 24 Sep 2025 19:28:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-583166561c0sm243601e87.81.2025.09.24.19.28.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 19:28:18 -0700 (PDT)
Date: Thu, 25 Sep 2025 05:28:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
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
        yijie.yang@oss.qualcomm.com, Qiang Yu <qiang.yu@oss.qualcomm.com>
Subject: Re: [PATCH 3/6] phy: qcom-qmp: qserdes-txrx: Add QMP PCIe PHY
 v8-specific register offsets
Message-ID: <fw5hf4p2mjybvfo756dhdm6wwlgnkzks4uwgo7k3dy7hyjhzyr@bv4p7msxapcb>
References: <20250924-knp-pcie-v1-0-5fb59e398b83@oss.qualcomm.com>
 <20250924-knp-pcie-v1-3-5fb59e398b83@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924-knp-pcie-v1-3-5fb59e398b83@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: p0DiidpoAuHicdKzp0HmxN5zrygZtMa5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDAxMSBTYWx0ZWRfX6XaIp/l+LTgf
 39RWXt5GS/q3bcsVpikGLtJuA8Yyjly6EPXzA4arCcvfEgQk14kNNvXTcUuKbokUCFyZ0ygfiiG
 b39H7zQmn5mhuwlrAx3YUcTz8VZx3LW3p/4/EeME3ofZcLke2rJ+Z+hn3eyftiXFdL8lK6N4bD4
 oyIJDeo5w3+XR8Cz1avnx8wd8kjvmdrLoQEEC8kB6Ist+B8USJgS8m+E1+G/IWP1o0W1LTlfDoR
 i7hSkYEyZbvYBYQ1iv2JTSHLJCYFuPnjyt7eHb1dTUWb2A1tKgCcuVeBREneU+hRQoMBS3lMhu2
 0RGJYKxTaQ6poY8Ne34/sHkBW8ZGJqxFZBerDZFkt3Tk2+5xQVphfiwv0BD8J5G7wYG6/VU3hGb
 10mUrwev
X-Proofpoint-GUID: p0DiidpoAuHicdKzp0HmxN5zrygZtMa5
X-Authority-Analysis: v=2.4 cv=Csq/cm4D c=1 sm=1 tr=0 ts=68d4a8c5 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=KS3u3L2nYUaZ2k-SVKIA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509230011

On Wed, Sep 24, 2025 at 04:33:19PM -0700, Jingyi Wang wrote:
> From: Qiang Yu <qiang.yu@oss.qualcomm.com>
> 
> Kaanapali SoC uses QMP PHY with version v8 for PCIe Gen3 x2, but its
> qserdes-txrx register offsets differ from the existing v8 offsets. To
> accommodate these differences, add the qserdes-txrx specific offsets in
> a dedicated header file.

With this approach it's not obvious, which register names are shared
with the existing header and which fields are unique. Please provide a
full set of defines in this header.

> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  .../qualcomm/phy-qcom-qmp-qserdes-txrx-pcie-v8.h   | 71 ++++++++++++++++++++++
>  1 file changed, 71 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-pcie-v8.h b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-pcie-v8.h
> new file mode 100644
> index 000000000000..181846e08c0f
> --- /dev/null
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-pcie-v8.h
> @@ -0,0 +1,71 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries. All rights reserved.
> + */
> +
> +#ifndef QCOM_PHY_QMP_QSERDES_TXRX_PCIE_V8_H_
> +#define QCOM_PHY_QMP_QSERDES_TXRX_PCIE_V8_H_
> +
> +#define QSERDES_V8_PCIE_TX_RES_CODE_LANE_OFFSET_TX		0x030
> +#define QSERDES_V8_PCIE_TX_RES_CODE_LANE_OFFSET_RX		0x034
> +#define QSERDES_V8_PCIE_TX_LANE_MODE_1		0x07c
> +#define QSERDES_V8_PCIE_TX_LANE_MODE_2		0x080
> +#define QSERDES_V8_PCIE_TX_LANE_MODE_3		0x084
> +#define QSERDES_V8_PCIE_TX_TRAN_DRVR_EMP_EN		0x0b4
> +#define QSERDES_V8_PCIE_TX_TX_BAND0		0x0e0
> +#define QSERDES_V8_PCIE_TX_TX_BAND1		0x0e4
> +#define QSERDES_V8_PCIE_TX_SEL_10B_8B		0x0f4
> +#define QSERDES_V8_PCIE_TX_SEL_20B_10B		0x0f8
> +#define QSERDES_V8_PCIE_TX_PARRATE_REC_DETECT_IDLE_EN		0x058
> +#define QSERDES_V8_PCIE_TX_TX_ADAPT_POST_THRESH1		0x118
> +#define QSERDES_V8_PCIE_TX_TX_ADAPT_POST_THRESH2		0x11c
> +#define QSERDES_V8_PCIE_TX_PHPRE_CTRL		0x128
> +#define QSERDES_V8_PCIE_TX_EQ_RCF_CTRL_RATE3		0x148
> +#define QSERDES_V8_PCIE_TX_EQ_RCF_CTRL_RATE4		0x14c
> +
> +#define QSERDES_V8_PCIE_RX_UCDR_FO_GAIN_RATE4		0x0dc
> +#define QSERDES_V8_PCIE_RX_UCDR_SO_GAIN_RATE3		0x0ec
> +#define QSERDES_V8_PCIE_RX_UCDR_SO_GAIN_RATE4		0x0f0
> +#define QSERDES_V8_PCIE_RX_UCDR_PI_CONTROLS		0x0f4
> +#define QSERDES_V8_PCIE_RX_VGA_CAL_CNTRL1		0x170
> +#define QSERDES_V8_PCIE_RX_VGA_CAL_MAN_VAL		0x178
> +#define QSERDES_V8_PCIE_RX_RX_EQU_ADAPTOR_CNTRL4		0x1b4
> +#define QSERDES_V8_PCIE_RX_SIGDET_ENABLES			0x1d8
> +#define QSERDES_V8_PCIE_RX_SIGDET_LVL			0x1e0
> +#define QSERDES_V8_PCIE_RX_RXCLK_DIV2_CTRL			0x0b8
> +#define QSERDES_V8_PCIE_RX_RX_BAND_CTRL0			0x0bc
> +#define QSERDES_V8_PCIE_RX_RX_TERM_BW_CTRL0			0x0c4
> +#define QSERDES_V8_PCIE_RX_RX_TERM_BW_CTRL1			0x0c8
> +#define QSERDES_V8_PCIE_RX_SVS_MODE_CTRL			0x0b4
> +#define QSERDES_V8_PCIE_RX_UCDR_PI_CTRL1			0x058
> +#define QSERDES_V8_PCIE_RX_UCDR_PI_CTRL2			0x05c
> +#define QSERDES_V8_PCIE_RX_UCDR_SB2_THRESH2_RATE3			0x084
> +#define QSERDES_V8_PCIE_RX_UCDR_SB2_GAIN1_RATE3			0x098
> +#define QSERDES_V8_PCIE_RX_UCDR_SB2_GAIN2_RATE3			0x0ac
> +#define QSERDES_V8_PCIE_RX_RX_MODE_RATE_0_1_B0			0x218
> +#define QSERDES_V8_PCIE_RX_RX_MODE_RATE_0_1_B1			0x21c
> +#define QSERDES_V8_PCIE_RX_RX_MODE_RATE_0_1_B2			0x220
> +#define QSERDES_V8_PCIE_RX_RX_MODE_RATE_0_1_B4			0x228
> +#define QSERDES_V8_PCIE_RX_RX_MODE_RATE_0_1_B7			0x234
> +#define QSERDES_V8_PCIE_RX_RX_MODE_RATE3_B0			0x260
> +#define QSERDES_V8_PCIE_RX_RX_MODE_RATE3_B1			0x264
> +#define QSERDES_V8_PCIE_RX_RX_MODE_RATE3_B2			0x268
> +#define QSERDES_V8_PCIE_RX_RX_MODE_RATE3_B3			0x26c
> +#define QSERDES_V8_PCIE_RX_RX_MODE_RATE3_B4			0x270
> +#define QSERDES_V8_PCIE_RX_RX_MODE_RATE4_SA_B0			0x284
> +#define QSERDES_V8_PCIE_RX_RX_MODE_RATE4_SA_B1			0x288
> +#define QSERDES_V8_PCIE_RX_RX_MODE_RATE4_SA_B2			0x28c
> +#define QSERDES_V8_PCIE_RX_RX_MODE_RATE4_SA_B3			0x290
> +#define QSERDES_V8_PCIE_RX_RX_MODE_RATE4_SA_B4			0x294
> +#define QSERDES_V8_PCIE_RX_RX_MODE_RATE4_SA_B5			0x298
> +#define QSERDES_V8_PCIE_RX_Q_PI_INTRINSIC_BIAS_RATE32			0x31c
> +#define QSERDES_V8_PCIE_RX_Q_PI_INTRINSIC_BIAS_RATE4			0x320
> +#define QSERDES_V8_PCIE_RX_EOM_MAX_ERR_LIMIT_LSB			0x11c
> +#define QSERDES_V8_PCIE_RX_EOM_MAX_ERR_LIMIT_MSB			0x120
> +#define QSERDES_V8_PCIE_RX_AUXDATA_BIN_RATE23			0x108
> +#define QSERDES_V8_PCIE_RX_AUXDATA_BIN_RATE4			0x10c
> +#define QSERDES_V8_PCIE_RX_VTHRESH_CAL_MAN_VAL_RATE3			0x198
> +#define QSERDES_V8_PCIE_RX_VTHRESH_CAL_MAN_VAL_RATE4			0x19c
> +#define QSERDES_V8_PCIE_RX_GM_CAL			0x1a0
> +
> +#endif
> 
> -- 
> 2.25.1
> 

-- 
With best wishes
Dmitry

