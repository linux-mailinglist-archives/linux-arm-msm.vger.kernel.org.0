Return-Path: <linux-arm-msm+bounces-20254-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E198CC5E0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 May 2024 19:52:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 04D5CB217E8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 May 2024 17:52:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACD451420C4;
	Wed, 22 May 2024 17:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Q1jefk0y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1759257C8E;
	Wed, 22 May 2024 17:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716400343; cv=none; b=RI0QJOG6OGIVzzHwH1StBvR2WzEKiV+TjIg/BYZ45elOjS8Aq/7BYHP17t4q9kU6jhDkz7xBBfSRAWD5OyMhgHxkP2h+e53ZTeUXPG0yzULJJxRinjqdh/8ilX9pbactm7CKgxmyg5fI++o2Lq8zTez1/wWkFD70DCj0CadwByE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716400343; c=relaxed/simple;
	bh=GqUR8YikJ6aus54l8QP7m+6LW+eBsJvJWssh9eElXjA=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NemlFeY12PFSDdfxYI1AFpH9myTCLnGhBkJZd2mNcfk7SeIiaQSlujE9lnrFl2UY31yxMAuwLrRl31yZ9W8PhIqdPUG+TksaisvcRcLbV6Ih1kXw5VZmG2b74fkQqb58SOCif2N6cNPUR01NkZl2aZjX1KqitzNZz0Nj+Ef2pZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Q1jefk0y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44M8Go04025175;
	Wed, 22 May 2024 17:52:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=qcppdkim1; bh=by0d6FIgykBOIQ2rkYvOY
	1RYbDxocjPFrC4pjQMP+Sk=; b=Q1jefk0y1G31BaP6KSmzXhs+f6jbYI1BT3cM4
	aWIUZoXSnyO1qRYfpHgFSgjckaKKm6/2SCJyD2ZimZB1EfZsRk7tNbS/P+u6tjiH
	oiM5P8dgdX6zTTZHl+YAk0XyCZbxKWvzyzEO9vfRQERap8U1iamPfrqtAHdefsfL
	pBgncK1pSaqbAyq62W8mmToT+MGKjlzhENh2VH1xr2IKoRPcG4PVaX5TNvJa0/TO
	isq/GszcDGgNxqoJNI56pW0NNjuguMj07QueIluhvoGUWV27UhH5sJDsWy4tD51h
	QdenswZapdu7SJzKm4J4TQ9tIN6hicCIf3nfX+MN7ySKshJAg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y6n4pa5u1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 May 2024 17:52:00 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44MHpxHl003730
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 May 2024 17:51:59 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 22 May 2024 10:51:58 -0700
Date: Wed, 22 May 2024 10:51:57 -0700
From: Bjorn Andersson <quic_bjorande@quicinc.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Chris Lew <quic_clew@quicinc.com>, Bjorn Andersson <andersson@kernel.org>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Peter Zijlstra
	<peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
        Will Deacon
	<will@kernel.org>, Waiman Long <longman@redhat.com>,
        Boqun Feng
	<boqun.feng@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH 7/7] arm64: dts: qcom: sm8650: Add hwlock to remoteproc
Message-ID: <Zk4wvTjld4QVBMDY@hu-bjorande-lv.qualcomm.com>
References: <20240516-hwspinlock-bust-v1-0-47a90a859238@quicinc.com>
 <20240516-hwspinlock-bust-v1-7-47a90a859238@quicinc.com>
 <c2905eaf-7194-4f2b-98c8-52b1907e398a@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <c2905eaf-7194-4f2b-98c8-52b1907e398a@kernel.org>
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: qHvMGm8dNuCWFSgpif71DXrFX8vzWdMh
X-Proofpoint-GUID: qHvMGm8dNuCWFSgpif71DXrFX8vzWdMh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-22_10,2024-05-22_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 mlxscore=0 malwarescore=0 spamscore=0
 impostorscore=0 clxscore=1015 phishscore=0 suspectscore=0 adultscore=0
 mlxlogscore=794 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405220123

On Wed, May 22, 2024 at 09:27:29AM +0200, Krzysztof Kozlowski wrote:
> On 17/05/2024 00:58, Chris Lew wrote:
> > Add the hwlock property to remoteproc. This enables the remoteproc to
> > try and bust the smem hwspinlock if the remoteproc has crashed while
> > holding the hwspinlock.
> > 
> > Signed-off-by: Chris Lew <quic_clew@quicinc.com>
> > ---
> >  arch/arm64/boot/dts/qcom/sm8650.dtsi | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> > index 62a6e77730bc..a65a1679f003 100644
> > --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> > @@ -2878,6 +2878,7 @@ remoteproc_mpss: remoteproc@4080000 {
> >  
> >  			qcom,smem-states = <&smp2p_modem_out 0>;
> >  			qcom,smem-state-names = "stop";
> > +			hwlocks = <&tcsr_mutex 3>;
> 
> lock #3 is used by smem, so this proves you are taking someone else's
> lock.

The lock is a shared resource, it's not "some else's lock".

Regards,
Bjorn

> I commented on this in the binding, but let's be specific:
> 
> NAK, please carry:
> 
> Nacked-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> Best regards,
> Krzysztof
> 

