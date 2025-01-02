Return-Path: <linux-arm-msm+bounces-43777-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A60469FF751
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jan 2025 10:14:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C6EB9188197D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jan 2025 09:14:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA189194C77;
	Thu,  2 Jan 2025 09:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HfYjGX0N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6963B43ABD;
	Thu,  2 Jan 2025 09:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735809240; cv=none; b=j2FHuS1Dml0N3g35v397vMrOWE8klknbpzLTCyz4w2p7uCj/EH1FdrqXxrQZtnirCT2WYnAOv1nfrTtiLdrz+vdtUEQ6oWXQAZrIa/BQm3TRHx6kDx4s8oTajApVeSR12DuYtc7Xy351u64swEBKmzNMC+5MKN7xowFSo7VWxAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735809240; c=relaxed/simple;
	bh=/eoHWC7p9tF0JvfllTAPK16uGpiLdj6bXIPOP7KC2vw=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h7HRslxK6WUZ+/Rkj61KGKqYYJ7+WukderYK9yI3RzW21VlTojN0k/f2dOfpshhonUkfK9nonoJN04a4ReGv9yok73MVyW+kk3Y4T6VNzHdrmxfhy1Wt+tOtIAc/WdV3b/dZ/zvThLKz5NxlZdSKILKCVkqW6BuJG6zb+3BVrVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HfYjGX0N; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5024CmQU029756;
	Thu, 2 Jan 2025 09:13:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CtSiux7twO+O6V+hWuj33B+c
	a1sVm14tk4cFOOEPCEg=; b=HfYjGX0NSdkLcfytfrdZh/VhegYGcIEMS6gunK9A
	sk0yW1MCy4hL+lgXQHMI1JQDS2AWqHdWM1Gau3mWVq0kMd0LH8+HTn505gsbkwS3
	Fp9FZbxbkv5a/vXfuIiN70uC39OjArZcEg+iSV2CW2A2WB3cPsZky2b0JncR7OJk
	PzT4hWQbinChEJ1L/FTfuFBA7whAHTt7q3DCqY0ehe3soV2P4W9f0Us0r3THS3Xe
	wz8NAfFzEftMdPJ9lcj5PFVF7ZsPPsteWzRIN9xyIupCu9yjxfwsLU7ubtsr7JG7
	znMBpKT9e3Gc7H4I7JWeM+pr4VvKy5ho0uyKZTFdTQOozw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43wkjt8hhc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Jan 2025 09:13:52 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5029DqDo007627
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 2 Jan 2025 09:13:52 GMT
Received: from hu-wasimn-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 2 Jan 2025 01:13:44 -0800
Date: Thu, 2 Jan 2025 14:43:40 +0530
From: Wasim Nazir <quic_wasimn@quicinc.com>
To: Andrew Lunn <andrew@lunn.ch>,
        Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>
CC: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>
Subject: Re: [PATCH v5 5/6] arm64: dts: qcom: Add support for QCS9075 Ride &
 Ride-r3
Message-ID: <Z3ZYxDJyAtGK7pL0@hu-wasimn-hyd.qualcomm.com>
References: <20241229152332.3068172-1-quic_wasimn@quicinc.com>
 <20241229152332.3068172-6-quic_wasimn@quicinc.com>
 <7de40e71-e2e5-49fd-93a3-245afdef8188@oss.qualcomm.com>
 <f44b98c2-a0b5-4aec-a84e-683d4576a70e@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <f44b98c2-a0b5-4aec-a84e-683d4576a70e@lunn.ch>
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: VJgmHXp1zDd8zTnSuKwA8wOzExpgkZZu
X-Proofpoint-ORIG-GUID: VJgmHXp1zDd8zTnSuKwA8wOzExpgkZZu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 clxscore=1011 mlxscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=719
 impostorscore=0 adultscore=0 phishscore=0 spamscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501020078

On Tue, Dec 31, 2024 at 06:10:15AM +0100, Andrew Lunn wrote:
> > > +&ethernet0 {
> > > +	phy-mode = "2500base-x";
> > > +};
> > > +
> > > +&ethernet1 {
> > > +	phy-mode = "2500base-x";
> > > +};
> > > +
> > > +&mdio {
> > > +	compatible = "snps,dwmac-mdio";
> > > +	#address-cells = <1>;
> > > +	#size-cells = <0>;
> > > +
> > > +	sgmii_phy0: phy@8 {
> > > +		compatible = "ethernet-phy-id31c3.1c33";
> > > +		reg = <0x8>;
> > > +		device_type = "ethernet-phy";
> > > +		interrupts-extended = <&tlmm 7 IRQ_TYPE_EDGE_FALLING>;
> > > +		reset-gpios = <&pmm8654au_2_gpios 8 GPIO_ACTIVE_LOW>;
> > > +		reset-assert-us = <11000>;
> > > +		reset-deassert-us = <70000>;
> > > +	};
> > > +
> > > +	sgmii_phy1: phy@0 {
> 
> SGMII is 10/100/1000. You have a phy-mode of 2500base-x, which is only
> 2500. So calling this sgmii_phy is wrong. Just call it phy1: phy@0.
> 

Thanks Konrad/Andrew will fix this in next patch.

Regards,
Wasim

