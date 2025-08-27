Return-Path: <linux-arm-msm+bounces-70968-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 88622B37756
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Aug 2025 03:45:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 78D551B23DF7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Aug 2025 01:45:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F54F1EB193;
	Wed, 27 Aug 2025 01:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pZ+DF7r7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 778B41D5CEA
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 01:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756259124; cv=none; b=CQcxdlydxfwU+sbgFF8wfeABlZC+SGljqEsxMZVwGEQ/uUqzqUzZKLQjgz9pHcWbMu1DP55xcaywuWkHip8CEMKJkd+eOwjCU1PhW8A4XycOGF1YR163yNSp95KQmAorYzdfcl3HYR16d1gMHL9wgJKfDtmqV8ACLNw43iphw9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756259124; c=relaxed/simple;
	bh=UVq8ijWoKWzpnf583jQxQdol3ylcdfNbLdYgB0k/HBM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=diDiUrcYH4LahG1i7y2pt2Vv1J0VOiFKK2QKkGjuGnlBlUVkS4pXuSRYHj/ybYvfAPgGKTPIvg8YO/XO3IWKWyJYBqBVKXMairMYE180Q7kbwM7dPGa1Dd09JOr3jf1OHORWg8PFFj6U7EhEVtY8TaJAILHzwz+glvjtF+GCU/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pZ+DF7r7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57QKEkY9011679
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 01:45:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EVlyCX7UKqENRSV/+Uoj7vIb
	5mLKB73LY5H1x9aorkk=; b=pZ+DF7r7qRDjmqTBosQWZiu9zsBENsqiqQt2sQ/f
	BfJJM5SsYqKmZ87W25aEyzHNfaPHvAZJWmGwcMd21B2LDUUUlqiNg1xzShyxzVZA
	e4ngydvxpMGLSvzL57bqjAbHpXbEASgkvap2wVmeo2wrMZmQyvb+ePstkXGG4PuL
	6X/UZk5QT5i+NPxKUq2Go8m0O7kQQahk+bNfQeoS5ykwmbYReSRdGoM6t6v+3FnV
	qvpXihvZT6e0V6CzhXJTi61wYcE8d4IBEb+6GDfYnM4R2u8w8i3Gvz/eQBc0wiyr
	vIxmmNc8LljAm88TorEzLDZ51NdMoiu07bCNqklT3RcnjA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5umb2ae-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 01:45:19 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-70dd6d255c4so29509606d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 18:45:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756259118; x=1756863918;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EVlyCX7UKqENRSV/+Uoj7vIb5mLKB73LY5H1x9aorkk=;
        b=U0IMDp30/zdA1oSlhxJXDyvQHwWais7nsAOq5UrQY/tN7tgvo4bt8Qmfba8wFHBvy7
         8zlweG592PI07i7iznGT4KP2HsQRwKUOykUaLt4jloVuXdQn1kWDesUpzYS9Iyso2Nra
         El1gHWtlkBd1gq2kxRx4yQWt4HKTZXO0/TYZcMr1XKsCzzaGSqr+c2J0O1cqkYMR5uL9
         6BE6l2cR4MSFCXZkOxM0HfxKsBnhmw+NdFftGwmEy9JkVzghXAn2uOeptZT4+Q1xhojb
         SXdA9LlLisW2evkUAramTiELDWi2Th34UipGph9faUtLNVdFKn8DibXAD7vnHuIvvohm
         QyKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCLDiLFI8ILel8L1N8/+gUOvhyyO10/jZlST06h7X59ugau2Hl52tbOp2wutG2qkrEDVnK+PG/ewxk1Jqd@vger.kernel.org
X-Gm-Message-State: AOJu0YzIdB9KSsoOt8+HCNQ6j0/bgtKB4Hk7V0X2zuqGDX+aoLG1PQJG
	yg5dI0B4LKSErZBpOroISpDj/kMuTWll8sEb8zT84KbfpIjDB0mI6wFMMiFQa+5u8gk7Wkk39le
	ZUvPHKGGvnu6E12km4AuZ9Znv5xukYJjCHjDaOfYb4sAH5DXJvZMXXhXSvxW0QSpbXYB6ovrNTx
	oR
X-Gm-Gg: ASbGncsuD4Kl5TIICuSyVwSB9FAeBHtDLFwfSghyWPXXbOLuk7//RbEYUi102hBXhRL
	OUWaJ5wB3lKOY1zFpHfocq69Z3691Bgqbg4TgJ+erdqp2pzZwXIukpxSphz2A7oXYC6B1rjAO5Y
	2qewTGEDIhF10/Mi9NlcetTuDnicGu/3VfGKH92PC0QD/k0Lkoz+NMt2XWt+hRSCxaHFh8kre/f
	3Q4ApCusIn2e6seIF/uaLt5GjOlJg1+N7XgQmAO++4O3Qq1ltm7znZpnc0Bt0TqkMkL/xGcuIIl
	a6cSawgTZKciQjKcmcjsoPANRcwSE8JqbPsbrwhYM3bUmje1O/7Wvqz6vjY+tsPzPSqsG7IeD5+
	Jlm4REfUVCtlJIDoQdkYKSJi4ZPxzN+6GbEK5vySWrBJeeaKvejSi
X-Received: by 2002:a05:6214:468b:b0:70d:9bd5:5652 with SMTP id 6a1803df08f44-70d9bd55f6emr220290266d6.21.1756259118056;
        Tue, 26 Aug 2025 18:45:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWdYPt9kh8RJ2zFRkhVPn7Ohu0C4BSckH/umAugKFEf5MEL8zGfbaIQZmlbtg8WiX75govqA==
X-Received: by 2002:a05:6214:468b:b0:70d:9bd5:5652 with SMTP id 6a1803df08f44-70d9bd55f6emr220289936d6.21.1756259117532;
        Tue, 26 Aug 2025 18:45:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3365e2363dasm24546091fa.17.2025.08.26.18.45.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 18:45:15 -0700 (PDT)
Date: Wed, 27 Aug 2025 04:45:12 +0300
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
Subject: Re: [PATCH v3 4/4] phy: qcom: qmp-pcie: Add support for Glymur PCIe
 Gen5x4 PHY
Message-ID: <ohzgigqvqdgaee27fdozzpt67i5cpp53jkj2rh226kf6sgr6d4@jsgqpno52x5z>
References: <20250825-glymur_pcie5-v3-0-5c1d1730c16f@oss.qualcomm.com>
 <20250825-glymur_pcie5-v3-4-5c1d1730c16f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825-glymur_pcie5-v3-4-5c1d1730c16f@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=VtIjA/2n c=1 sm=1 tr=0 ts=68ae632f cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=RFEw3ZXBErJeItyUBPQA:9
 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMiBTYWx0ZWRfX4JF1FsWoHDZN
 UI5oKxFAPuWCBRNUHzOL2D2SZXgLJThLiENEXoYlZdWA0VldjSVWYFgkvV3wCVzZj6SA7zIV/TP
 bnIq1wqoA46HxDzjRSjsq06nMCjPGGVaja8u8aclsHuczDFZeg9X37KXs8fuW9wRGq0v6Z0MgWP
 324YfE8xvEtuAG+39ZojYmEmr6IYM3gxOeBSIc3IMLsAx5xPUcbC3Gu8NoPIVXhYACwkajQ6EzP
 261tdONQHriuKjikKp4DVg4+UZ9D2HpGe/54tmFnxevqnzSWcdqolDSORNEYjb8psmlURmXkzPB
 uMJD/VXliIYzIQEfPGgwk+Ncueocf+MsV5s6XYYDPf7n1iL2dOSAwG99KYi/AozQ0Vs+iWHgu8F
 WT5HaG78
X-Proofpoint-GUID: ihvqr87lbqyiQ-5i46d-3bpuAE9qdeEH
X-Proofpoint-ORIG-GUID: ihvqr87lbqyiQ-5i46d-3bpuAE9qdeEH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230032

On Mon, Aug 25, 2025 at 11:01:50PM -0700, Wenbin Yao wrote:
> From: Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>
> 
> Add support for Gen5 x4 PCIe QMP PHY found on Glymur platform.
> 
> Signed-off-by: Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>
> Signed-off-by: Wenbin Yao <wenbin.yao@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

