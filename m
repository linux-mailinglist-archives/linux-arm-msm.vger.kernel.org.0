Return-Path: <linux-arm-msm+bounces-71431-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F3758B3ED7D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 19:46:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8271E1A87B09
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 17:46:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FBB8324B28;
	Mon,  1 Sep 2025 17:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OK1XxwBI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E3D324B02;
	Mon,  1 Sep 2025 17:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756748766; cv=none; b=mbCDBCWrrFvwjbwxsBCgdSwxWGKYKwnRp1+nHZtDebNeBdCY+jwy0+u8pJtjvk8KugTMgJoI/gZLkUQX4D8GSALoV9zRqqNN+9w/Qlu3/vGsxNQZaZE8T44EJck7Vi1zsZzLsB0pRVa26zVcsLEaOKlSCd1l99Dm91+1C6p04y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756748766; c=relaxed/simple;
	bh=eM04KUZQwLOrzpV00qZvYgncaPNtGPAV0ZLpb/1WlF8=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KTDDW7TFpECiuz21HNPtjvBIuW39mwwRCR1CuW7ONNcvBQkk9kCytQV20LuaKfvjLNv4PaikPkRdcHO5CIGh/0dgJNeBFp0/a3jyL33tdVomhPMRfNsVtKiEas9+Qn49n06AEk07b6Q3Zb1FIKHB8cYnDHAjLmu4+wfuSZaaKdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=OK1XxwBI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 581B4I4E011752;
	Mon, 1 Sep 2025 17:45:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=91xKoybXCts4oz7sBNvpwL/y
	76we/GftobqHGM0pTKs=; b=OK1XxwBI3qj03NrKzQdM9uI54UmbaIxziyAOkcyR
	ipGV76whb5KRXFZLZrQ/E6MQPNedF3NOzxzLKf+RgeLHC+05C5/ERxqwwTY0pKq0
	RqeiwjMJCCTMEAdmZdM3Yq10e/llVtkFRVLna3gOEA37mlPv+/L/NTPaEBxEt6R4
	7/bdcLQYVbAtVYeG7+5qFYBaGpjO3TJ95DuRKc5Ckr1rs00MeTI3cB+Xo2jnpTGP
	/52sHTTzQQ9AdUf0oxVvZtAiltwJE2sQ2oeKzedpV13FXx3nZEb4bORMxFrpaKPW
	nvRPliUH1CK/rEkh4MDexKXdVdqrwSZg1u98Dko9T05KVA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48w8wy1ac6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Sep 2025 17:45:57 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 581Hjucb007645
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 1 Sep 2025 17:45:56 GMT
Received: from hu-mohdayaa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Mon, 1 Sep 2025 10:45:48 -0700
Date: Mon, 1 Sep 2025 23:15:44 +0530
From: Mohd Ayaan Anwar <quic_mohdayaa@quicinc.com>
To: Andrew Lunn <andrew@lunn.ch>
CC: Wasim Nazir <quic_wasimn@quicinc.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
        <kernel@quicinc.com>, <kernel@oss.qualcomm.com>
Subject: Re: [PATCH 3/8] arm64: dts: qcom: sa8775p: Add ethernet card for
 ride & ride-r3
Message-ID: <aLXbyJ/PcHkpYSos@hu-mohdayaa-hyd.qualcomm.com>
References: <20250507065116.353114-1-quic_wasimn@quicinc.com>
 <20250507065116.353114-4-quic_wasimn@quicinc.com>
 <c445043d-2289-455d-af62-b18704bab749@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <c445043d-2289-455d-af62-b18704bab749@lunn.ch>
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=Ycq95xRf c=1 sm=1 tr=0 ts=68b5dbd5 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=kj9zAlcOel0A:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=eofW3eqlt0T3Q-umAU0A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: xSx86x-XsHdpdctiMGbssowxZh_32LsB
X-Proofpoint-ORIG-GUID: xSx86x-XsHdpdctiMGbssowxZh_32LsB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAxMDEwMSBTYWx0ZWRfX0JV/unv3xvmA
 0fDyYDgGuoDC2/dPsYKo7zGLJ8fkxsfVerGF7h/VFOI0R9deQF0w2oyhDaJX0EvTVhwIUevJ+ST
 zHSErXlyrlKwJ1UAGo9zhymtQk636RIgResYwq1j8CC4AGFeq0P60OYyScmnwO99IpYeCXoM3Ts
 D91ZQH2g8piad6JaBFqDsUX0wjXXSBhqxQxEJk4f5NIrQ8rUQt5DKDAXD9XwYXdV9ZzI3VQFXaO
 IPQiYu74dXLt0zCLdbkMQtLKIvaRc1Hds2ZhRGSHjcu2PCSSa6tYg4DNtKni/HAViLgxISoE7QK
 thm0CiUs5oTzrNI5X2nQSkXCOv2m+acWRjI+/ctgxnI5GbAoPU64f9MmwVoaUMSSoF2ZXQwzqOD
 MYnlRyTK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-01_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509010101

On Wed, May 07, 2025 at 04:23:52PM +0200, Andrew Lunn wrote:
> > +&ethernet0 {
> > +	phy-handle = <&sgmii_phy0>;
> > +	phy-mode = "sgmii";
> > +
> > +	pinctrl-0 = <&ethernet0_default>;
> > +	pinctrl-names = "default";
> > +
> > +	snps,mtl-rx-config = <&mtl_rx_setup>;
> > +	snps,mtl-tx-config = <&mtl_tx_setup>;
> > +	snps,ps-speed = <1000>;
> 
> SGMII can only go up to 1000, so why is this property needed?
> 

That's true. This shouldn't be required.

> > +&ethernet0 {
> > +	phy-handle = <&hsgmii_phy0>;
> > +	phy-mode = "2500base-x";
> > +
> > +	pinctrl-0 = <&ethernet0_default>;
> > +	pinctrl-names = "default";
> > +
> > +	snps,mtl-rx-config = <&mtl_rx_setup>;
> > +	snps,mtl-tx-config = <&mtl_tx_setup>;
> > +	snps,ps-speed = <1000>;
> 
> This looks odd. 2500Base-X, yet 1000?
> 
> 	Andrew

Just to give some background, this board is using the infamous OCSGMII
mode. But you are correct, the "snps,ps-speed" property is not required
here. The qcom-ethqos driver is agnostic to it as the MAC speed is set
using PCS AN during mac_link_up:
stmmac_mac_link_up -> fix_mac_speed -> ethqos_configure_sgmii.

We will remove it in the next revision of [0]. I also noticed this
redundant property in a few other places and will submit separate
cleanup patches for those as well.

	Ayaan
---
[0] https://lore.kernel.org/all/20250826-lemans-evk-bu-v1-3-08016e0d3ce5@oss.qualcomm.com/


