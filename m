Return-Path: <linux-arm-msm+bounces-74885-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15AE3B9D33C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 04:34:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9B3D33A46F5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 02:33:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C26CD2E7F39;
	Thu, 25 Sep 2025 02:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="geaGq1vO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 344E92E5D32
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 02:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758767500; cv=none; b=bUGqFcfPm2rpCvS6oYJ2jQTMVT6qthoPd9RvtulzdO5ak0vvfkgxHXQZOL8sjSwSB+itif0QzaN/0GDrjaj3Pw1burcVmrFOc6+6umFxqncSOeJJlPhY/gl+1YdeCzMonc+AY4eE2nI98be73kvAmnhxoKUBo4e+awEx+8Qhlps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758767500; c=relaxed/simple;
	bh=pcrcivp6jRezc7W+w/l9SYu4yeO+SeLB/7dvhRX5kiM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wp2WXPVhJfSiPdjrDCnpkBX3JDiPaI7/KRvtSVREnSNBBQaQyKOMrHvXpuc1F5aC8cs68Q7go8stZUo/SXLEdve9eHnJBrhrCuJ7COlGyD2GU/Cuh5oRDUm00dcBTS70aY8jcEDF0e8GDCzehtAzL6YzbmEe8ApBRj9h0WOlnwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=geaGq1vO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P0dRX8002118
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 02:31:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=D3nYnV6I3tQHUFYA7g+3qAT/
	UOlfwsLFTqadtUtQzK4=; b=geaGq1vODBz5/agzHiMLsyIDN1ZxM5VUKarGnTn+
	QYI6tCoiqFePkJSaYP+k5LERIL9k8IXUAVCKhyB1KRg1ToHZDuIGOrOn87YECWVy
	MQgjrs47ryVBq72k2k42Ufb5lzuNMwk9DejzWCydJ5k/VZt+koF3zqn6mdDpeJtA
	XjV14NRbsa9CgbakbfuosL6DtdET/Sb7ydx5nLfF6/NqEvqG/92skMDgUsf1Qhrh
	rFjAOH0U0EQ1girD5hYc4WedoDSxJFela6zb4QiJLDFgts2k/MrBtku5q0M5Yvqq
	uB2gB3Ssn0dsNdGxO39Iv1TNkLqBOKnWX3yVbJ1cob55uQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499k98pf0f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 02:31:38 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4d435215956so11396861cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 19:31:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758767497; x=1759372297;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D3nYnV6I3tQHUFYA7g+3qAT/UOlfwsLFTqadtUtQzK4=;
        b=OFmKSiqkYIYrS5qgxNDazRWngEs2uzhw6HWhHWhz9zJad4UE4iYZXLhUxr2n6nviSY
         VyvApJB7k02JUqRXxYjvLJwd1bd8CI1rMMWnL0lM/5O/Zc20uQjSoq5ImOsFXYPt0X/S
         gKSAanFuNLjODGX52XrDr5QhcKGo9FXyNEhYTRXwsNHLh24oyKOYojqPifqgPYtw8KJp
         j35LHbUVj6rkMss8wSn5GFLfzPm9ARNMKQ81Uj3AJMZhCTHSY7wiih1Mf5ElYztKCQJY
         wZrD2ORuvYaDQPAWAS3jcYnJDjpTblFq2SaO21wDGat35E8d+XyGIgaRJArH4+VIUnJm
         G2pg==
X-Forwarded-Encrypted: i=1; AJvYcCWIoEuPv9vTn9tVqLrL1Jq1gyZVAjwwrVeI/mk4DKNiuTXmgMlJ/CHOCQud3J9PtMblHVot1ZS2SjPJEash@vger.kernel.org
X-Gm-Message-State: AOJu0YxB/AeSPMvfY8fTybPeT3d3fcvf1ILtxFWFjTVK3on9jbkTXSWb
	9nGgU3s/dQWOxen9o4ffZkd494P7Qf8bIr6dVX7AfwA5hl22uF/aczY9IQmDFQjbRyX+XoIovDm
	9CiRxq7nxXZIZvmA9ElxJf8ZU2Dhv473ttkqBKL0f0IMZC9+AHb1QebilMav/oa1VF8MZ
X-Gm-Gg: ASbGnctK86d9opt8qaj1r0uZDsKaV5JMSG1yBeocvzZiMdIRlSq28Dg9K99FOn8CoaN
	l+mstZRlIeUNQvHNPnZTHLafwVSBPiECC0buwhjpIdrkzZsaseHtdzKWvg7d0A2jW4hC/WdV1Ua
	DGtXZw+TshjyqLyQ1W3RsFmFPl/RLG3nu9A8pc/gE04X1AwNWwyXz84NweiDwMBwLXgOjkHLUdJ
	iZDhhDK0oR5FKJ1bgUfw8b/xgHuwphAPOeOAJtfm7g6FXT6oCxwHyJ1V1uLlYZCD0isb5dkBiOY
	5zzhsA0eQIV1VykCefnUwbd2jjK2JxmsY97At2YRpXGYSjVhbTWIavCuK8GyuLDPWEPosCmdigX
	btxtZgTuqpSyVxXK8hYp14fbUw/FtCGtKrXkuh2vH4SFkWpwZdpM+
X-Received: by 2002:a05:622a:28b:b0:4cf:1f63:e0d7 with SMTP id d75a77b69052e-4da4d8e137cmr27710581cf.81.1758767497308;
        Wed, 24 Sep 2025 19:31:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFEvoHvlnh9KHRZr3AgHqArgHyeDWrmzl2oYp0o4JenqL8v9CmviTgtlWMTnrGZUhqt1jjqQA==
X-Received: by 2002:a05:622a:28b:b0:4cf:1f63:e0d7 with SMTP id d75a77b69052e-4da4d8e137cmr27710291cf.81.1758767496803;
        Wed, 24 Sep 2025 19:31:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58316a32638sm240397e87.118.2025.09.24.19.31.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 19:31:35 -0700 (PDT)
Date: Thu, 25 Sep 2025 05:31:32 +0300
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
Subject: Re: [PATCH 6/6] phy: qcom: qmp-pcie: add QMP PCIe PHY tables for
 Kaanapali
Message-ID: <zl6tq3prervuiapz5ekd5sxfzo7injnanpyfvxz2vn35fkb4kh@25zejng3n7k3>
References: <20250924-knp-pcie-v1-0-5fb59e398b83@oss.qualcomm.com>
 <20250924-knp-pcie-v1-6-5fb59e398b83@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924-knp-pcie-v1-6-5fb59e398b83@oss.qualcomm.com>
X-Proofpoint-GUID: -XleEfvL8D9dM1YemwF_gZ5tezWDOGQV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAxOCBTYWx0ZWRfX+47oi5a0Yanz
 RQaEY0kGyRVFNPtVfCJ5JXsuSKYDvsW6pyD+oA9EJFWAWRYOfQZgg9oFfGTGkY+52ybu860bY+V
 CgqrpThpXHZqmmnG3Eb6Pc9r9dXt7FNN9Fc01ublEwDF6iHVh/WpQfL1ZVKlGh+mnfacpP4BT2n
 arThua5wetf+tzSw5oqVfiYjZLWEy/x5TMwT5ejw4JR9kr69qubU6LPHj80sudPO8qGfInqVYX9
 8CAFIIDtK0pJIcn4wSTYE+huM5HJZFRuiI0h8/kPMnPo6FIEW3XtscioOybEzHSYhD7nKj7IyvG
 COfDMKTN7yGL3v485OQEiX0cACJZUls7A/t5X10HXzDaoeXQ2wFZlklLDpczGldHfHUeqJvuezz
 6AP09OJN
X-Proofpoint-ORIG-GUID: -XleEfvL8D9dM1YemwF_gZ5tezWDOGQV
X-Authority-Analysis: v=2.4 cv=Dp1W+H/+ c=1 sm=1 tr=0 ts=68d4a98a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=lYzJZiZmsC8Xh2LukrIA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 impostorscore=0
 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200018

On Wed, Sep 24, 2025 at 04:33:22PM -0700, Jingyi Wang wrote:
> From: Qiang Yu <qiang.yu@oss.qualcomm.com>
> 
> Add QMP PCIe PHY support for the Kaanapali platform.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 194 +++++++++++++++++++++++++++++++
>  1 file changed, 194 insertions(+)
> 
> @@ -5276,6 +5467,9 @@ static const struct of_device_id qmp_pcie_of_match_table[] = {
>  	}, {
>  		.compatible = "qcom,x1p42100-qmp-gen4x4-pcie-phy",
>  		.data = &qmp_v6_gen4x4_pciephy_cfg,
> +	}, {
> +		.compatible = "qcom,kaanapali-qmp-gen3x2-pcie-phy",
> +		.data = &qmp_v8_gen3x2_pciephy_cfg,

This list is expected to be sorted.

>  	},
>  	{ },
>  };
> 
> -- 
> 2.25.1
> 

-- 
With best wishes
Dmitry

