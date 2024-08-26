Return-Path: <linux-arm-msm+bounces-29465-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4A695EC98
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Aug 2024 11:00:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 82E04281121
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Aug 2024 09:00:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A48984D25;
	Mon, 26 Aug 2024 09:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Q2aqxNvQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81DFC82D91;
	Mon, 26 Aug 2024 09:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724662829; cv=none; b=fYxN3E+Bm2kwqSUNiQB1w6ETe0Pi7z7YoZ3OFfVke8RlibUGGfy89tsywHvQCkF32HPfCUj0pHl9irSoH3i6/YuI6NsLDyT5oq2f6UyMRTEeHen4JXmv2SlrpoehbsaBCJEImNhDW15GFTbwIS7PUnbBq1V3M4dN8pblvMS3bTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724662829; c=relaxed/simple;
	bh=0+v+6zgCTWTJdyPeZdNDjZRW7PVDkAvO33D9xC64CMU=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QoPjHDbjiXCZae+7q4pzQ/HM5oWvYXv0TE+E4+DDBAfoAomYST0BNELQHvN6MUrA/tUAtLjSS37ekeOSYzb3MwxHeB8VfTqa6GgQN5ghvJwS00Lg4ZUQu6I8MLyVkN4hrWcE/S/09piQVhCOK8eAW54/yxkxHV0bnS7a5hgZYo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Q2aqxNvQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47Q8MPXV027697;
	Mon, 26 Aug 2024 09:00:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=oDBSAHNkZ3cABfL+kp3A5Frz
	IvohjNhv16hz3rGTf0I=; b=Q2aqxNvQWKMa/Q+XVjv20h8KdbJMxpbPNT01M6Xg
	zOLH0tdoUdXhRaymxB9A2Zpv9xtCVqvGi/naMRsPFmc02IxYU6XP+vR7Dy/R2kSe
	9TBDJrDyJKFYUWO1O01IWF6GZqJr7ZgX46sXxW7tvnbz504IyuA0N0z2NB/3AyxU
	B+k4dBtKtK9gNvJi8PyDxCnChnQi8m6dB0UfshkVk0NXOgPpCJigy7jKwc7m/4/F
	vADMeHDolV4s6NX5IbRPagsJi2wu/q+aFbnYVVjaTkF35pw4ltKh8rqG45/ZaMdp
	LeGujCg7I1n4tjysRWlzy1uJD+3dMyJhmmabLPFpaBaPdQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 417980u3yu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Aug 2024 09:00:23 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47Q90M5U017662
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Aug 2024 09:00:22 GMT
Received: from jiegan-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 26 Aug 2024 02:00:18 -0700
Date: Mon, 26 Aug 2024 17:00:15 +0800
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
Message-ID: <ZsxEHyOk31+Fg2E/@jiegan-gv.ap.qualcomm.com>
References: <20240826061900.790715-1-quic_jiegan@quicinc.com>
 <548ccc89-3e0b-47ce-891b-4a181b79c714@kernel.org>
 <Zsw/xTCZMDHkfrEm@jiegan-gv.ap.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Zsw/xTCZMDHkfrEm@jiegan-gv.ap.qualcomm.com>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: K5rg83v05YizjvG1l9-AHyM64oUX8q2j
X-Proofpoint-ORIG-GUID: K5rg83v05YizjvG1l9-AHyM64oUX8q2j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-26_06,2024-08-23_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 adultscore=0 mlxlogscore=581 spamscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 phishscore=0 priorityscore=1501 mlxscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408260070

On Mon, Aug 26, 2024 at 04:41:41PM +0800, JieGan wrote:
> On Mon, Aug 26, 2024 at 10:20:54AM +0200, Krzysztof Kozlowski wrote:
> > On 26/08/2024 08:19, Jie Gan wrote:
> > > Add following coresight components for x1e80100 platform,
> > > include CTI, dummy sink, dynamic Funnel, Replicator, STM,
> > > TPDM, TPDA and TMC ETF.
> > > 
> > > Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
> > > Tested-by: Yushan Li <quic_yushli@quicinc.com>
> > > ---
> > >  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 1534 ++++++++++++++++++++++++
> > >  1 file changed, 1534 insertions(+)
> > > 
> > 
> > And does it pass dtbs_check W=1?
> >
> It passed with "make CHECK_DTBS=y qcom/x1e80100-crd.dtb".
>  
Checked with dtbs_check W=1 and found 4 warnings.
will fix in next version.

Thanks,
Jie 

