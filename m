Return-Path: <linux-arm-msm+bounces-23766-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 58FA5913A96
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Jun 2024 14:29:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0E5601F21950
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Jun 2024 12:29:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86AE018130F;
	Sun, 23 Jun 2024 12:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YLoVCq+M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B99BA12E1DC;
	Sun, 23 Jun 2024 12:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719145759; cv=none; b=FzHDSCaD4jIHdybQiOsONZKnefT0gSORdthfU1/O0h1afZqOdMvEVsgcK3sLIahLTgDAtbLtnT0v2OrlepGqQKPeCDiF+EsUht973eisXP1WN0RkfC+VRGFypVL79San3YC8k9UCqISD7vS/XxSCZDMO6Xmb2ZL3xR45Mze7cLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719145759; c=relaxed/simple;
	bh=cky/kSkaCeylvXef85j3RyeX3RYPaIwSjScPJhylWA4=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fmWkhr+xEnL0nzmw0lUdtVbl+kCglKRVKWTam5fl5QsjL2MXh9oR0xhrapZgLnYJbTNfhdK+rOZ0Qp4nGLEKhGBleSVb7BOfk18kzlDRYW+oZbrBDFEb/Gvzkkax2iTD8T7PB9n7pjGQqn2Cbgk3A2eUke+Obpr8286miMTDVOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YLoVCq+M; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45NCNQTY018008;
	Sun, 23 Jun 2024 12:29:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gcOBVNuicamzRrxkqh3J9eaD
	ckZU8bubeR6mJxEkb8U=; b=YLoVCq+MToIZdDxGR133ksW0KGB1V3VPjpe4Ssf6
	lXvCDL0dYMVmy3jpHfi10y/MKsey8zofgiZh0xEh+q2QAdqyzoOGQekQrJfZvFEG
	7UqP6Snvn+AYC+XlJpO4eKVPOWMHZEtPou/8tcexCKfJiDYlLXeeETSV1U9bT6gF
	5lIby9gitZIHNuEqTj+YWTj7/aIA564A3EdK3qwRSbHRyJ/dB4cjWlmueDODwD+N
	cKXMQfMbxi+XFMZ3Do3rKIbFW5PeTdMfBFKomLzW50ituGGJRcNLr173xBlMVf7q
	JUnzxWlJXBR+/B65n9YE982M4VvNS2sS4XUZXFDchLfULQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywkyn1v1p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 23 Jun 2024 12:29:05 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45NCT4aB002310
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 23 Jun 2024 12:29:04 GMT
Received: from hu-akhilpo-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 23 Jun 2024 05:29:00 -0700
Date: Sun, 23 Jun 2024 17:58:56 +0530
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: freedreno <freedreno@lists.freedesktop.org>,
        <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        Rob Clark
	<robdclark@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 3/3] arm64: dts: qcom: x1e80100: Add gpu support
Message-ID: <20240623122856.kqf4x6mft74hzk7y@hu-akhilpo-hyd.qualcomm.com>
References: <20240623110753.141400-1-quic_akhilpo@quicinc.com>
 <20240623110753.141400-4-quic_akhilpo@quicinc.com>
 <a458a3a7-2b6d-4032-949c-b2c021d339e8@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <a458a3a7-2b6d-4032-949c-b2c021d339e8@kernel.org>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: UVPanTcHEq44dPrcdpGON_SISnjPdDus
X-Proofpoint-GUID: UVPanTcHEq44dPrcdpGON_SISnjPdDus
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-23_04,2024-06-21_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 mlxscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 mlxlogscore=999 spamscore=0 clxscore=1011 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406230099

On Sun, Jun 23, 2024 at 01:17:16PM +0200, Krzysztof Kozlowski wrote:
> On 23/06/2024 13:06, Akhil P Oommen wrote:
> > Add the necessary dt nodes for gpu support in X1E80100.
> > 
> > Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> > ---
> > +		gmu: gmu@3d6a000 {
> > +			compatible = "qcom,adreno-gmu-x185.1", "qcom,adreno-gmu";
> > +			reg = <0x0 0x03d50000 0x0 0x10000>,
> > +			      <0x0 0x03d6a000 0x0 0x35000>,
> > +			      <0x0 0x0b280000 0x0 0x10000>;
> > +			reg-names =  "rscc", "gmu", "gmu_pdc";
> 
> Really, please start testing your patches. Your internal instructions
> tells you to do that, so please follow it carefully. Don't use the
> community as the tool, because you do not want to run checks and
> investigate results.

This was obviously tested before (and retested now) and everything works. I am
confused about what you meant. Could you please elaborate a bit? The device
and the compilation/test setup is new for me, so I am wondering if I
made any silly mistake!

-Akhil.

> 
> NAK.
> 
> Best regards,
> Krzysztof
> 

