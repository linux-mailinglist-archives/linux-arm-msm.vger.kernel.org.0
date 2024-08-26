Return-Path: <linux-arm-msm+bounces-29464-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C2995EC34
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Aug 2024 10:42:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D234C1C210BD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Aug 2024 08:42:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BBB713B286;
	Mon, 26 Aug 2024 08:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HIdfvaZx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 568FA73478;
	Mon, 26 Aug 2024 08:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724661715; cv=none; b=OYdtlZvh0VUPW7TR0UWAEFbHvEw9jlh/k/Hku+HAoYxUVfPicLNSwguaM/0t+4cGI5IyLEVGl4bUgJXDMhty+tbuSWHCCnvqKdjRX0eTPSZPSnxReNJRvf7LgctdADMcMDerBpEMqcDnEZd+T8p/YaaWpyx3T9Z/azbl8WGs5EM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724661715; c=relaxed/simple;
	bh=mTeGXa6kLrneVi/7UwU5293IHLpRJlJKgu0HALZVp4M=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hKyy6pzjagK5ZH822rF/6xHayyHP/ry0AcURvyEweI31SFO7RdBa/Amic46KijNBFY4EeThWagYmjRZYrM4OBEuAFPCriprQohEZ+G6dZv/cWqNuAZ58xEN/6SWSWHZojIWpZF5CxsL2Yhu8o5aGGAxhgWPtNRT/0tGV3qJKQNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HIdfvaZx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47Q8MTBe016970;
	Mon, 26 Aug 2024 08:41:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sDwK8FKewltdzBhScg9N/IjW
	sMDQSCc47T7kexD8SfY=; b=HIdfvaZxflCIAjSDsU8t8MgCQz28t7wTamfrZ4xZ
	T7bmtBNiGvBZluZkf7+TSErICBSDMtQT3LjsGj7smoXYt8QhBQPdVeEHK0/siLDh
	iLyX+zNrXU9vmf3tW6mIKFvbD8k+h4OzZ5uFxcjQebKbI7GaI9rQETWdwito19Aa
	XpPUpaVm7cQTWq8Yuz+Fk6P7FKslhAQ05YeoZS8P7wUfvINF6Cw87N4sC/W/y6ES
	xXpZR5iU05uoNmKXJdcuahw+YaYYZDlPe8+ZIR76T2sU9ue9fovxH72g1lPcf3lZ
	TOWgTspCm5CkJP0RCCGZoERZUgAX5fVbu0s95YnmVk+bwA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 417988b182-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Aug 2024 08:41:50 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47Q8fnVm011566
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Aug 2024 08:41:49 GMT
Received: from jiegan-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 26 Aug 2024 01:41:45 -0700
Date: Mon, 26 Aug 2024 16:41:41 +0800
From: JieGan <quic_jiegan@quicinc.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Jinlong Mao <quic_jinlmao@quicinc.com>,
        Tao Zhang <quic_taozha@quicinc.com>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>,
        Song Chai
	<quic_songchai@quicinc.com>,
        Yushan Li <quic_yushli@quicinc.com>
Subject: Re: [PATCH] arm64: dts: qcom: Add coresight nodes for x1e80100
Message-ID: <Zsw/xTCZMDHkfrEm@jiegan-gv.ap.qualcomm.com>
References: <20240826061900.790715-1-quic_jiegan@quicinc.com>
 <548ccc89-3e0b-47ce-891b-4a181b79c714@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <548ccc89-3e0b-47ce-891b-4a181b79c714@kernel.org>
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Yth64yOcBy3Zaz7W6KlnWiWNsnzMsEY_
X-Proofpoint-ORIG-GUID: Yth64yOcBy3Zaz7W6KlnWiWNsnzMsEY_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-26_05,2024-08-23_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 spamscore=0 adultscore=0 mlxscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 suspectscore=0
 mlxlogscore=541 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408260068

On Mon, Aug 26, 2024 at 10:20:54AM +0200, Krzysztof Kozlowski wrote:
> On 26/08/2024 08:19, Jie Gan wrote:
> > Add following coresight components for x1e80100 platform,
> > include CTI, dummy sink, dynamic Funnel, Replicator, STM,
> > TPDM, TPDA and TMC ETF.
> > 
> > Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
> > Tested-by: Yushan Li <quic_yushli@quicinc.com>
> > ---
> >  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 1534 ++++++++++++++++++++++++
> >  1 file changed, 1534 insertions(+)
> > 
> 
> And does it pass dtbs_check W=1?
>
It passed with "make CHECK_DTBS=y qcom/x1e80100-crd.dtb".
 
Thanks,
Jie

