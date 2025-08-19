Return-Path: <linux-arm-msm+bounces-69805-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B883CB2CC4B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 20:43:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D913A174885
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 18:43:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 636B73101B9;
	Tue, 19 Aug 2025 18:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pb5DAA+c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5133A30DEA1
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 18:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755629009; cv=none; b=TYhNmHYyF5soFi9FUXddtUhd7WZ3JRXdxPgAeuMASvsA2S0BRrivZk34VIBpjOy5NmRMvtYUQkHH82UaghwqCbhx0mnZFrk2p6mBJxHl6tgLWOL2nW4XrMT18PQKfeLo4ehZ6n6zbUKKf13xBveCJYZkwaJ/9rSuUwLJO5XoH4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755629009; c=relaxed/simple;
	bh=eC6MPHc/rm5FJ5KXRZT+EhHEfoD8NtKXQo2RF2/rrHs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xn5t1Xugd4P8/t6PKMGcqdOk3pbddA8K61dLvnoxNo4cSf/EqoR2Y4+QVWyFdQUevUfmfFKII6xcGC3xyJjEbnX8OSkX995ciQZYjerKDTDkSHDUYFnHy8b7O8mHkyncSa7LDRdn+eUyO1kcZR3jJ6i6U3iU9nLUJeiMffsySaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pb5DAA+c; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57JH5MCn027047
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 18:43:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rr9m4DMV8aM3HvFiWVF1zTeq
	HFmihXvF2giDIBU/QsQ=; b=pb5DAA+coH5BVtUjj8b5Hu1IkemhWAwRmVfAElzp
	cBSBiiL2CPX1NDt68CG5HsjIbYaiFd4tp7qMyl4O6NClQI52Umk7mTOaLrVr4WWZ
	cEzrDll4UydgZlofzt7bftqaxQxxuSKR0XtkG0TAdFmGZ4GfiphiW8NbValyFYqW
	5p2OzUMCA5vyCW1ZBaQdllPryjXxhRBvmHGUMdCIIRctKaxMxW7ChxRFRug8w4X7
	f+tgfjoYm6JVL+me04SF7OyWii9AG6KTNQt5UXJd1fn3buPPnGqjtBbbeas+MG7k
	HjB8tXs8JHiy/lo1bpuczgHHofOFFsGmzbnzAm4vuJA9Xg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jhjyhm25-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 18:43:26 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-70a9f55eb56so129677416d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 11:43:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755629005; x=1756233805;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rr9m4DMV8aM3HvFiWVF1zTeqHFmihXvF2giDIBU/QsQ=;
        b=nn5XRRcatNlpG9ujybWspfZIPljRMf1f3Vb0yV1bx9lBbwEw0Z5DNSZARqwcQ4EXVH
         TpdNCYyKoDXwm30O8e8qCbZVTXXdC7PNorkDDzs3MmWcmtlfPuO02QF6MkR4GR013WSv
         wwRWSDRvRGVtXAJu+gFqR74UH5WoaPeHG94/ubwiEDV5YBxhgiiedm796+kPgBrtJkIg
         LIZ3poVEKtUOeusSJsVkAwjDrG70WV8NAZcztEcIZ/atXsytWYkNiShDgQwxHCJp+7fx
         7OiRacKt0Ta/yVdEw0AhKL71RryFiXjI1nJbRjv9TBDWlb/PceZ2dBm0Zhd5tNYnKW8d
         z3hg==
X-Forwarded-Encrypted: i=1; AJvYcCXIacaHmyXo1m5BFqGsdID46GHI8zVmb8GsQgg6P2Ok2u+wTWDC0b8fYJzkIP8TJmY4KW8hJujnV6LQSde/@vger.kernel.org
X-Gm-Message-State: AOJu0Yx21Y8xnbYCOkCgUbHJoKQmqP7Ayd/CP2/sInUB8kE7o/UKtyrF
	a5W3oMpbQzHmq3D+YbClO1uIJrbXBcjjjQ0yXp+vFsYcVMVySC7Xywje7MDYbzGYlW/YryMEqJw
	7hIeHHhzD4zaAkB5HmDup6JCSWStK4ePg/2acJrCwbayul8Ndze6dwcoeUNERhHyTXBlH
X-Gm-Gg: ASbGncvfzDc0WNywQrzMX3kWLodr934sFafUe3vW67bR4nf9F6tXR4BR0ug2Zf3qwP6
	y+1K4ngML1szJDlxWpRYdk0e2MI60hbMbh9ZWlq9AKCe/rAWJQ7PLUDu2sQ7Hi+T3yElQDUt/0O
	iBF6Lapr/yCCvzmTKWoXv7rhBbl2YvsZCR0ThK61/XkNupx/SkDlfXaYXcL+fd4sXP4QGQBuXfu
	MNcmTklvNwhocbTc3vRkdwxErm/1esm0LUA0PE4qEV5q0cJ9gqQJkonm2UjIveTcBWBlafhZ9Ur
	+2ZPfB3QPqaGXDbYiSNlrPY8cg4j3OhNq1LCAG1P8ekj2FWJ+e6yQFhzS31mXa1dFIwZ9HXE/sV
	2+zYu/R4JXFlUKmrLDJw2wx81WpSHfqgcTnEK/eX1HVnjB5RGnvvm
X-Received: by 2002:a05:6214:509c:b0:709:8665:f839 with SMTP id 6a1803df08f44-70d770c81d0mr481296d6.43.1755629005010;
        Tue, 19 Aug 2025 11:43:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHT7lpRowLXX5OExQQfbvb5w4hCurs0f1Zuh/FVoSxEHFuy1zmq+FiaB/ZvhSvytDdn5I2dtg==
X-Received: by 2002:a05:6214:509c:b0:709:8665:f839 with SMTP id 6a1803df08f44-70d770c81d0mr480776d6.43.1755629004281;
        Tue, 19 Aug 2025 11:43:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3340a43a34asm25743821fa.24.2025.08.19.11.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 11:43:23 -0700 (PDT)
Date: Tue, 19 Aug 2025 21:43:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wenbin Yao <wenbin.yao@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        konrad.dybcio@oss.qualcomm.com, qiang.yu@oss.qualcomm.com,
        Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>
Subject: Re: [PATCH 4/4] phy: qcom: qmp-pcie: Add support for Glymur PCIe
 Gen5x4 PHY
Message-ID: <6zlydkdgmowqg7cv5eeoaf7mrpnhzokyvhh5xasvznqaxnhdji@xol3jiz2lzld>
References: <20250819-glymur_pcie5-v1-0-2ea09f83cbb0@oss.qualcomm.com>
 <20250819-glymur_pcie5-v1-4-2ea09f83cbb0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819-glymur_pcie5-v1-4-2ea09f83cbb0@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: On3WBklskawB6Kl3DMnjew3FNHUQyh9U
X-Authority-Analysis: v=2.4 cv=ZJHXmW7b c=1 sm=1 tr=0 ts=68a4c5ce cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=7qyaTA0qGF2Sjt_gT38A:9
 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: On3WBklskawB6Kl3DMnjew3FNHUQyh9U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyOCBTYWx0ZWRfX7ny1LOpfilNu
 TmV/1kwy98BufnfQ+3IhJTArKecpLRPn0d3kXgw0OebUorKnn6DURb5TCgshi+jI37Uk3+52Lya
 ffsyGbMFlj3566PaVNPFiadBazhy85Sh4cHWXaGoMsyBlqGymQhiq0gC8lelmq82VMTGnFdW07U
 8qaOiJHrEGBodX5cArvRcZfPa6VrEQpTLrHTjYYh1uGi7c6aSjXbeqf4NQRfhZEn5ywDf6ucpPi
 +/CmUJeHOSZtTPA1MvpGRaJ2keVzyWQjAgkN17liG7xmLIOVmNMxYz6IYLYd+2wbwZsb3GG5M45
 ONEzCo/jlJ/ieCQpYJ9xGodlsLJbZ0hj5QtgACAuo/PxqQuP0s6OTWpoicjun4LJ1Ee9FahGM1X
 +dF7s3/H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0 clxscore=1015
 bulkscore=0 spamscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160028

On Tue, Aug 19, 2025 at 02:52:08AM -0700, Wenbin Yao wrote:
> From: Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>
> 
> Add support for Gen5 x4 PCIe QMP PHY found on Glymur platform.
> 
> Signed-off-by: Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>
> Signed-off-by: Wenbin Yao <wenbin.yao@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> index 95830dcfdec9b1f68fd55d1cc3c102985cfafcc1..e422cf6932d261074ed3419ed8806e9ed212c26c 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> @@ -93,6 +93,12 @@ static const unsigned int pciephy_v6_regs_layout[QPHY_LAYOUT_SIZE] = {
>  	[QPHY_PCS_POWER_DOWN_CONTROL]	= QPHY_V6_PCS_POWER_DOWN_CONTROL,
>  };
>  
> +static const unsigned int pciephy_v8_50_regs_layout[QPHY_LAYOUT_SIZE] = {
> +	[QPHY_START_CTRL]		= QPHY_V8_50_PCS_START_CONTROL,
> +	[QPHY_PCS_STATUS]		= QPHY_V8_50_PCS_STATUS1,
> +	[QPHY_PCS_POWER_DOWN_CONTROL]   = QPHY_V8_50_PCS_POWER_DOWN_CONTROL,
> +};
> +
>  static const struct qmp_phy_init_tbl msm8998_pcie_serdes_tbl[] = {
>  	QMP_PHY_INIT_CFG(QSERDES_V3_COM_BIAS_EN_CLKBUFLR_EN, 0x14),
>  	QMP_PHY_INIT_CFG(QSERDES_V3_COM_CLK_SELECT, 0x30),
> @@ -3229,6 +3235,10 @@ static const struct qmp_pcie_offsets qmp_pcie_offsets_v6_30 = {
>  	.ln_shrd	= 0x8000,
>  };
>  
> +static const struct qmp_pcie_offsets qmp_pcie_offsets_v8_50 = {
> +	.pcs        = 0x9000,

Even if the driver uses only PCS regs for 8.50 currently, I'd suggest
describing the whole picture here. Otherwise it might backfire later, if
we add offsets for other blocks later and they won't match the ones used
for Glymur.

> +};
> +
>  static const struct qmp_phy_cfg ipq8074_pciephy_cfg = {
>  	.lanes			= 1,
>  
> @@ -4258,6 +4268,22 @@ static const struct qmp_phy_cfg qmp_v6_gen4x4_pciephy_cfg = {
>  	.phy_status             = PHYSTATUS_4_20,
>  };
>  
> +static const struct qmp_phy_cfg glymur_qmp_gen5x4_pciephy_cfg = {
> +	.lanes = 4,
> +
> +	.offsets        = &qmp_pcie_offsets_v8_50,
> +
> +	.reset_list     = sdm845_pciephy_reset_l,
> +	.num_resets     = ARRAY_SIZE(sdm845_pciephy_reset_l),
> +	.vreg_list      = sm8550_qmp_phy_vreg_l,
> +	.num_vregs      = ARRAY_SIZE(sm8550_qmp_phy_vreg_l),
> +
> +	.regs           = pciephy_v8_50_regs_layout,
> +
> +	.pwrdn_ctrl     = SW_PWRDN | REFCLK_DRV_DSBL,
> +	.phy_status     = PHYSTATUS_4_20,
> +};
> +
>  static void qmp_pcie_init_port_b(struct qmp_pcie *qmp, const struct qmp_phy_cfg_tbls *tbls)
>  {
>  	const struct qmp_phy_cfg *cfg = qmp->cfg;
> @@ -5114,6 +5140,9 @@ static const struct of_device_id qmp_pcie_of_match_table[] = {
>  	}, {
>  		.compatible = "qcom,x1p42100-qmp-gen4x4-pcie-phy",
>  		.data = &qmp_v6_gen4x4_pciephy_cfg,
> +	}, {
> +		.compatible = "qcom,glymur-qmp-gen5x4-pcie-phy",
> +		.data = &glymur_qmp_gen5x4_pciephy_cfg,
>  	},
>  	{ },
>  };
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

